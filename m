Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1441143ejc;
        Mon, 13 Nov 2023 08:09:41 -0800 (PST)
X-Received: by 2002:a17:906:1341:b0:9dd:8aa0:f7b8 with SMTP id x1-20020a170906134100b009dd8aa0f7b8mr5459073ejb.9.1699891781107;
        Mon, 13 Nov 2023 08:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699891781; cv=none;
        d=google.com; s=arc-20160816;
        b=cD5cPojBl638p//vrj79utT+4LIH2sL+XRDWSMM2ch0JQAwCv8H8i1Kq6uun9v7aT3
         Z7U5dDBWwVnO+VNefLWTSkNczYo1THPdAf8vkr+OSMx0ujsfHwmATavALqshzrRo9iCh
         B5J8W8MOds5YkJrMMekRinctf4FUT9OgNSmwfp6eFOzzPRVD0p1W6r8C0uR+C3L1jQg0
         xTuJ6D7jnvTZ0bSBPPwBMBr35wecDeUElfjhIFaShRmJxOKfVRpmTIes8aOCsEQcPrVZ
         IAxMtvnqQTYiljykhoC6aIsmF85SDyrErKpyFnhTPAjpabHdKwIPJIGVxL9A3GnBez8B
         iS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MT2jqnM1EXDZd7Eo9GsBNo8vayQdwjXlJYvjk3d8/BQ=;
        fh=M8yTh4l6jr21/vLhx7agVqc/k9FzlJ52dzT+D9Si6nA=;
        b=SaL4B852C+ZknAh+YMtIGiQb9c8KPC/DIpDsEZuqkMI4hbrZzURYlWbqAuZX7qCWlY
         cE9vpb3POCvzgmp6N8gEty0hCyOL8wJroRFWkTnWQ9qNsVRNkXsISxkKXH3eA16y6CcN
         P3JpOjZm/pl+aMtSA4phtqK4cKjTgP5xjnfAZmlw+c2NaJBWJWLdDPlgsFxB2zL83NKn
         xqKtUcpVAEz299OtjZqkt6RL14pZh49jWGjooFj6GEWgVwlGSX4ZS0Ao2u+EdjTwgCME
         e/bE4vHlHYATC6pWjHL61Dcp8YWQUTGPvDm5gNAmqc/TwJ1atl2/AVjcqLHQ+itZwhBi
         TiQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cKDFJOHk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v25-20020a17090651d900b009e5d15311a6sor1188727ejk.9.2023.11.13.08.09.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 08:09:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cKDFJOHk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699891781; x=1700496581; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MT2jqnM1EXDZd7Eo9GsBNo8vayQdwjXlJYvjk3d8/BQ=;
        b=cKDFJOHktssAqVweHsmB7nDCdQHzdQjGQ/pUrzNz+6HGC35iw+oq2/pnzrYLJ0mHKD
         /wNARA/XB3IeunacIMr+F34WhNULrfHC1Yogck6Y0BOQutZvGmhylw0dET2Sl5uulmGO
         VAJH/yV/hOqNXdD2Nr8+09l2MVKiayQWtOX6HH3wCdgsWA/02fuYWcvwkw2f8KZ2wHjr
         IqJIBe9qwkrOulY2lTNfK7PTbV6qTfxH+JB/6cyA9dLc78L4JuJWeKNnLk7frYAcYa6F
         rf73tRfRZ2V/rrzAT3BR2AwZq/6R+uuk8vGp6ns+Tk4Re8R/OdQbPhBjgUFmLjFmap5u
         54cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891781; x=1700496581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MT2jqnM1EXDZd7Eo9GsBNo8vayQdwjXlJYvjk3d8/BQ=;
        b=fhwKpAVCf8gf44+sJKnhalNSVNLK3EAWSNjZKSGgoxfWSGCzKfS5ugrYKb1g2aouKG
         WTKxLCUc6hM6R4KikcigCEHqJAJE9UOdBcAqGa7CeZHJooprk3G1NfLjGwd6i7nz2yB1
         SPd+oAdnkjqt4v7EwxEU6dQdEJCglCmT5ctOIQ8Hk8bvLCp0ZKCojyhcMfrjKpHCpp1V
         1eWA3BR4kXgIC9oRbeTH4bPRKHNUvSpJzKA7jioDquuuujySbkZAXwArvl7o/w7Z0EOL
         88sxgOWikVgPkd8S66X0l5xptFDxCqSpS+HEEv4NhrOy8AWbfYXrfKr9Hbv+JGZXtxsI
         8Xdg==
X-Gm-Message-State: AOJu0Yzng2xEb9366VUnit45pl0/T0ydRCmHHfdRQp8d+XTdfKIMZ0WU
	vKy3nvUXECLbjZFs2oTXNQbgjfqp
X-Google-Smtp-Source: AGHT+IGeRhJFxDoIfveJ9ETd2OdQ3oHGQ3FlHAF/NrjNVpCIp+vrcNE4rMVRNzJtDcSpxiFGnRsC1Q==
X-Received: by 2002:a17:907:86a3:b0:9be:b41d:4f7e with SMTP id qa35-20020a17090786a300b009beb41d4f7emr5851496ejc.17.1699891780129;
        Mon, 13 Nov 2023 08:09:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id qk16-20020a170906d9d000b0099297782aa9sm4153050ejb.49.2023.11.13.08.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 08:09:39 -0800 (PST)
Message-ID: <7a66c289-19e1-4690-8c6e-31a9f6344b6f@linaro.org>
Date: Mon, 13 Nov 2023 17:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Content-Language: en-US
To: "Woodhouse, David" <dwmw@amazon.co.uk>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <f791a822-f6f5-44fa-904b-f67d3f193763@email.android.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f791a822-f6f5-44fa-904b-f67d3f193763@email.android.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: QjhZf43g6OXf

On 13/11/23 16:58, Woodhouse, David wrote:
> On 13 Nov 2023 10:22, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>     Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
>     function to xen-hvm-common"), handle_ioreq() is expected to be
>     target-agnostic. However it uses 'target_ulong', which is a target
>     specific definition.
> 
>     In order to compile this file once for all targets, factor the
>     target-specific code out of handle_ioreq() as a per-target handler
>     called xen_arch_align_ioreq_data().
> 
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>     ---
>     Should we have a 'unsigned qemu_target_long_bits();' helper
>     such qemu_target_page_foo() API and target_words_bigendian()?
> 
> 
> It can be more fun than that though. What about 
> qemu_target_alignof_uint64() for example, which differs between i386 and 
> x86_64 and causes even structs with *explicitly* sized fields to differ 
> because of padding.
> 
> I'd *love* to see this series as a step towards my fantasy of being able 
> to support Xen under TCG. After all, without that what's the point in 
> being target-agnostic?

Another win is we are building all these files once instead of one for
each i386/x86_64/aarch64 targets, so we save CI time and Amazon trees.

> However, I am mildly concerned that some of these files are accidentally 
> using the host ELF ABI, perhaps with explicit management of 32-bit 
> compatibility, and the target-agnosticity is purely an illusion?
> 
> See the "protocol" handling and the three ABIs for the ring in 
> xen-block, for example.

If so I'd expect build failures or violent runtime assertions.

Reviewing quickly hw/block/dataplane/xen-block.c, this code doesn't
seem target specific at all IMHO. Otherwise I'd really expect it to
fail compiling. But I don't know much about Xen, so I'll let block &
xen experts to have a look.

> Can we be explicit about what's expected to work here and what's not in 
> scope?

What do you mean? Everything is expected to work like without this
series applied :)

Regards,

Phil.
