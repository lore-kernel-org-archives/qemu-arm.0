Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2112893ejc;
        Tue, 14 Nov 2023 07:22:27 -0800 (PST)
X-Received: by 2002:a17:906:cd1f:b0:9e6:9abb:d3cc with SMTP id oz31-20020a170906cd1f00b009e69abbd3ccmr6578117ejb.1.1699975347336;
        Tue, 14 Nov 2023 07:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699975347; cv=none;
        d=google.com; s=arc-20160816;
        b=y3iBKQ99kWAf3f/jWhkw+Qke0sYSZ/gbEvu0Z+Oz6Kny65ld0WfKsMFutnO3CRWGhE
         YjGtsrvbyvPnWNQqW6ub2H+Awps244t0vPcUW2zI4l4RZndNQujpXf9lcfFnhJmwrUf2
         6BvgBhh7dM9o/xd8GNKNR/nlnOYR1BM5Rt8nfVjzDY9soLEnqmyPMPDj/49sCcmKBQEb
         Zz3M1ujzmZeoG8jpx3hjBs8IB3qcdLIzXzNLCBkhN6Bi464in2y4XOh8OSXrVuXAGF9P
         MP9FZum2MfhNZBWfpqT1J4fuBLL86k3LefAv3DCG8s5AgjHfgfyrvqzYr0lS1QBb7KET
         AMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MUHR/sFEjdzbvDET4onhF+bWIy1sGTTug2OAYdlSeSM=;
        fh=PGigrzYzd0zf6KYOUAGyR9dosd+l4IOEDCVzvH4VVvk=;
        b=bRHUMH9QtO74edP2PRvA8xr9Bp83XxrFyKGyqtsI2+Xrynet0kjCcVqnSpDN7tW+HL
         sDh0xDb5MpjgKCy8yHWe7QB9MIqVLh0SJ43wVNPNBrm/Hiaar13qEhijVR9Y8yzRgzu3
         0bMjVH3YS0Vfm8ISGjZhE8tCf09RU6oheQ0tFOji+yuCM7XKStaYDnyNYUY5wAXOcyeR
         k8G7kZvPi/odvtjBuRDdZEKhq5b/ItGm81hgmqe9wKdeYZYs5ldpGllrClu+IRSMxBpU
         VuiNxVqvYSjYqtdufFT/3bZFCz9KWlHGItfRQNonqExsTFM4OpqpgEYgh+nJWxeQD6/8
         wenw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s0LkdbnT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s22-20020a170906221600b009ae5905dcc6sor404408ejs.19.2023.11.14.07.22.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 07:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s0LkdbnT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699975347; x=1700580147; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUHR/sFEjdzbvDET4onhF+bWIy1sGTTug2OAYdlSeSM=;
        b=s0LkdbnTdUxECrRf/sCnqwFn7WklG1eOGbW19YBAUWqEbZxBzOvJP5ptZ5myEQBahw
         GsfmuUMLAL0phumD5+JMcnFDAuw8Gt1e+I0DTSlY1CwrCm8vuJn5rdqICEjbyQTB2/uV
         Xd77y2wTYLjGBwKaJxlWRQC1og2/3JBlTDJT35XxmoEBhrPhp/DCgECyGCBkO3wsL0bw
         bVWYki3l6jlmv4hIbdnRPr+Fl9CA19blRKa9ValIb9kgpN0/9JYDqrok7+vYldpZFBTY
         oLbPAIC5tXb4Y6GIjuo9Df4BAi5MerAu17PDq75ci2x9Q2NC/uBcxHv+enRayC56beas
         stng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699975347; x=1700580147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUHR/sFEjdzbvDET4onhF+bWIy1sGTTug2OAYdlSeSM=;
        b=GFwZD6oTje/8N+SFUDGjcoP/heYQ6fglyfASzv/uvfoS+K2OPP4HNa06tXrggeABtH
         csh5W3j70ru728UmyEMlgwO4MqIUM5V74W4j53LdLe6M1LWClKbKOWLcfPkGKMQQ637R
         UnG6fxPtzuPegOKaltX8/Y5tp/k2psg8HmKgQUarYsr8349mB5BlWzw4/wLsJqYaR6sV
         UQ9ihAEYKgrHwEr02hZXKphSxzyCOAgZ/REwQwfDhY2U6ot1/bBmHT/UT7/akJvOzY7j
         aL0IOzJu4ooSiorgT3gFcNhaWGwSmbQEbP1ykbFqRflVt8URBXEL8zx+3hgMbElvfF+v
         aE8w==
X-Gm-Message-State: AOJu0YxismWXQFHH49eZFsFJN7Cr+bCwzLG7pwVF880prUFoJgqXI8BG
	G/O2yA+3WK7tnm2a9M/O9FUIanU8
X-Google-Smtp-Source: AGHT+IF5d1ESnNl3DW6y2+imScFbz4lvkI6XZHXfhsQrAJwxX/tlICwDYWPVmK4nZgJvWNEuauG4+g==
X-Received: by 2002:a17:906:3615:b0:9be:834a:f80b with SMTP id q21-20020a170906361500b009be834af80bmr7614130ejb.75.1699975346999;
        Tue, 14 Nov 2023 07:22:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id ov3-20020a170906fc0300b00977cad140a8sm5694156ejb.218.2023.11.14.07.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 07:22:26 -0800 (PST)
Message-ID: <7fd25b34-6fd9-4f7c-90b4-e44338b2b09e@linaro.org>
Date: Tue, 14 Nov 2023 16:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 06/19] hw/pci/msi: Restrict xen_is_pirq_msi()
 call to Xen
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, David Woodhouse
 <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-7-philmd@linaro.org>
 <EEC18CA6-88F2-4F18-BDE5-5E9AAE5778A7@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <EEC18CA6-88F2-4F18-BDE5-5E9AAE5778A7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rLEUDxJOPPqp

On 14/11/23 16:13, David Woodhouse wrote:
> On 14 November 2023 09:38:02 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> Similarly to the restriction in hw/pci/msix.c (see commit
>> e1e4bf2252 "msix: fix msix_vector_masked"), restrict the
>> xen_is_pirq_msi() call in msi_is_masked() to Xen.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Hm, we do also support the Xen abomination of snooping on MSI table writes to see if they're targeted at a Xen PIRQ, then actually unmasking the MSI from QEMU when the guest binds the corresponding event channel to that PIRQ.
> 
> I think this is going to break in CI as kvm_xen_guest.py does deliberately exercise that use case, doesn't it?

Hmmm I see what you mean.

So you mentioned these checks:

- host Xen accel
- Xen accel emulated to guest via KVM host accel

Maybe we need here:

- guest expected to run Xen

   Being (
                 Xen accel emulated to guest via KVM host accel
	OR
                 host Xen accel
         )

If so, possibly few places incorrectly check 'xen_enabled()'
instead of this 'xen_guest()'.

"Xen on KVM" is a tricky case...

> I deliberately *didn't* switch to testing the Xen PV net device, with a comment that testing MSI and irqchip permutations was far more entertaining. So I hope it should catch this?

¯\_(ツ)_/¯
