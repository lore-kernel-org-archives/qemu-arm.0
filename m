Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2106460ejc;
        Tue, 14 Nov 2023 07:13:18 -0800 (PST)
X-Received: by 2002:a17:906:580e:b0:9c4:4226:e4e6 with SMTP id m14-20020a170906580e00b009c44226e4e6mr7818768ejq.66.1699974798338;
        Tue, 14 Nov 2023 07:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699974798; cv=none;
        d=google.com; s=arc-20160816;
        b=Do3cjsoKqE5lE2OHMi2ctuG9cR1q+Tx2oh5n1ESO8TW9bcHsAG/6gRYGeTQCN0rZfo
         NEm64y2yrw3ZRqq7EDrNvwJAEp20j2YYlqtPtBPuYeEk0DqZ8zL3DVtl1aUaqHefbGyt
         V+T9ICTo8RCCkk3gN9CEIgFViKkN4zKHmSM94gibnpa7S+ooQ5tMrCFDlhfqyq/+kyBe
         3yAmYu5Uh0vwb9bKW19JvEXyrp5iPPFTHcQNnh1Z7JecCq/funsDnIxYVgLHCDZ1T7zQ
         DFDGf0yTs0u3e8HRQPo+EzL/GhoR4vjK5f4PXPZVhMcJy1RWiY6jLzn+lAb8DZFEWcdF
         A0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HIHi0yKkQuExrrqaReTTaHyYp9veWL43i8XQ+amSwZ4=;
        fh=UHvDv+zkP5t6T7JK4PPrDv1YBJtZN5X3weQkuBCbTMk=;
        b=J4o4HFu4yjvWUxKmXMwYXjkObqot7WvVIQdhpux7jwv4r30GbrCRLBShgum2ZRCyIC
         MaN+qYj4vkqTnqRn2fYB+8rchwL/3Apva/0h88/Ecw0j8XGzKj3VfJ69cisrDy/se2wp
         11mh+WA23ssRE+dqJ+Cpo/gggIzIRyNpihM5R+grmh1/Haaq3Cp5E/XVbctfz26fEPRO
         C3svMMsYD2LTuJKvNBA9CYTzH425mvbuF7U84U1RI92YiTgvI0Gi+bqQgTqY0ZG54/Dz
         w5I9a96ysqB9YPWYpv/eLJJ0KnaqlyYSSyMMrTuRQttHyJN6HtlJoMtKlK3I6L86HB5m
         T5yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WqqBsrO2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 13-20020a170906024d00b009bd7b0b2660sor1991171ejl.8.2023.11.14.07.13.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 07:13:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WqqBsrO2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699974798; x=1700579598; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIHi0yKkQuExrrqaReTTaHyYp9veWL43i8XQ+amSwZ4=;
        b=WqqBsrO2xASWwAetKkjt8Lxib0xRFpE/pRBdZJ/R6661GqgwAuFguKTCyEYqHKANNv
         WOqM4aKDhyvbt6JfDP/i+KxQA9mcZ+CL//UfOYbf72vXlxweKnzYAG4UtBk2Ns1gkDxQ
         mEA6oWr/jBgNj1A1KqsmcmhDYI73mgHJq94+lq9V5x4N9xg8bj/dJucH9gPCbD4TVpzf
         1HtM2E6C5VuhCGvREibdGBaglpHKp2hTP9LG80zKADyQNdkZMfuYRySFqspCHCfhZ/Sn
         b4ZTMryc74167rG4QrOTelj/5m54zLdxpAKCAVb+eMDKYll7xAIgSACx8UqigzvLbUvB
         vr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974798; x=1700579598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIHi0yKkQuExrrqaReTTaHyYp9veWL43i8XQ+amSwZ4=;
        b=DE7eQGb5gZ3xUBxQL2OZmkT5Dxp7LP0dLlQ3sYIy+eBVOsSUHv/9yX1KoC2C4xyUhs
         NHyANI0BAYsU3RvA8FZP/ablEMBaVb7T3pmbfRLRiaKf7jQdsj4y6nkN0dSzGgPNQEPE
         zXzBabziX6qEJob0JYlM3davGQyOw2JE/KGvjgJu8JUgUsmXvsTsY9oS+wabYY0ZmiC4
         Z9IkW7D/emvXmhWnR8uuRlofDEPorYAzJBBzn14Lfhw+l/7B+YvQloaYb6XYv8OAbgIy
         PMBLo11ei7NcKZHFqsZEmoIdD/17XLvvak9NxxAZbrzURy2W+iD4qAHj/AEfsxLa3NKB
         VrYw==
X-Gm-Message-State: AOJu0Yyd4ZUXokr1pUfepDcSIcILLUOK4y8y5pGIf5+0u8EAJ+wjx8f3
	Ioq3Dx3YeMZAo67CRT7O4BmXOmI/
X-Google-Smtp-Source: AGHT+IHGFXgwRm95QaGDvzmEn8xmzfuJoAXM9MDWtXppVWdC9PPQJI2AOwqlfdbCPZx6yH7hHs/ywQ==
X-Received: by 2002:a17:906:c01:b0:9e5:d618:d6c1 with SMTP id s1-20020a1709060c0100b009e5d618d6c1mr8703674ejf.19.1699974797997;
        Tue, 14 Nov 2023 07:13:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id fi6-20020a170906da0600b009e6a990a55esm5644531ejb.158.2023.11.14.07.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 07:13:17 -0800 (PST)
Message-ID: <04917b57-d778-41a2-b320-c8c0afbe9ffb@linaro.org>
Date: Tue, 14 Nov 2023 16:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 01/19] tests/avocado: Add 'guest:xen' tag to
 tests running Xen guest
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
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-2-philmd@linaro.org>
 <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
 <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org>
 <074BCACF-C8D0-440A-A805-CDB0DB21C416@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <074BCACF-C8D0-440A-A805-CDB0DB21C416@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: F93h9+yYPopP

On 14/11/23 16:08, David Woodhouse wrote:
> On 14 November 2023 10:00:09 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> On 14/11/23 15:50, David Woodhouse wrote:
>>> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>>>> Add a tag to run all Xen-specific tests using:
>>>>
>>>>    $ make check-avocado AVOCADO_TAGS='guest:xen'
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> tests/avocado/boot_xen.py      | 3 +++
>>>> tests/avocado/kvm_xen_guest.py | 1 +
>>>> 2 files changed, 4 insertions(+)
>>>
>>> Those two are very different. One runs on Xen, the other on KVM. Do we want to use the same tag for both?
>>
>> My understanding is,
>> - boot_xen.py runs Xen on TCG
>> - kvm_xen_guest.py runs Xen on KVM
>> so both runs Xen guests.
> 
> Does boot_xen.py actually boot *Xen*? And presumably at least one Xen guest *within* Xen?

I'll let Alex confirm, but yes, I expect Xen guest within Xen guest 
within TCG. So the tags "accel:tcg" (already present) and "guest:xen".

> kvm_xen_guest.py boots a "Xen guest" under KVM directly without any real Xen being present. It's *emulating* Xen.

Yes, so the tag "guest:xen" is correct.

> They do both run Xen guests (or at least guests which use Xen hypercalls and *think* they're running under Xen). But is that the important classification for lumping them together?

The idea of AVOCADO_TAGS is to restrict testing to what you want to 
cover. So here this allow running 'anything that can run Xen guest'
in a single command, for example it is handy on my macOS aarch64 host.
