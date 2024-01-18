Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp345144ejg;
        Thu, 18 Jan 2024 07:30:32 -0800 (PST)
X-Received: by 2002:aa7:de0f:0:b0:559:bec2:ad4d with SMTP id h15-20020aa7de0f000000b00559bec2ad4dmr713926edv.23.1705591832566;
        Thu, 18 Jan 2024 07:30:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705591832; cv=none;
        d=google.com; s=arc-20160816;
        b=cKRhrakPjmTE5Y4Q/KtNamUrbTLY41s7g1A7z2V3BloRsKtzcYTr4J2b5esovBHLHh
         AJtldFlOYiOmMsQgOsu9SYzTG+OwJkSUkI0xpQcj4NuCyzKICN9GBiIcOn5hsG2jqZMV
         7woWgFDZzVON+5/rZHUXH251bt7OPLWM5cy4QtGMB7/uBBWUGmA5KsbLprE9Q3Okshqu
         TUrkaTUOE67bRqrQwoZrUtcnTTx7QJiT4f7Nlutz6SlXJUdTgkNeZu3KUI7WyhrsSdWO
         A7FjuykDEApqCFXTa4RK+AoleJPE7PstI9vjuylQg1xxIa6Knhh5VsNXoNjg0CupQnm4
         5nEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yMhYaW/DOrnmTxGo423p3Vj6zWbiOp+1fhUIT1Jiclc=;
        fh=EJOcKS192pQBHqmpM8VkZhvQHVzwq/rnEw6abS6OQyg=;
        b=vJhJwqh87s9pHpTo9vjOhmIPGiT/DyHbvjFeJoq2cE2S3D6qI4hxr7gtCTDhcT41/Y
         U/ij8h05dlPoK/Qe5E5jR/1B2OSPgXi2MAxiDKjvmwm5A2xtTHbAUyjHFtP3oGycDreA
         epFr3OKnazdYoXCXCeiDQjKr2v86iLamPGY1TaRKV92Mtkw/6Q0ZHhrsfcRnhSU2FrzX
         K9pxQ+JqqQgQ1Pye6ND/dl6UeCwXihGLH0+wAEIzGAX8+6Qa1Iizkq31Z0PdWccnUuPu
         ApODKuxnVkNKCe5MIc7L+rXELgbQCrYm4AT//zUtT5in3sgpAPupgBrm/VjS8b1jL5WH
         1zwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X3yx/9w6";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g11-20020a50ee0b000000b0055517da3146sor3323565eds.10.2024.01.18.07.30.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Jan 2024 07:30:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X3yx/9w6";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705591832; x=1706196632; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMhYaW/DOrnmTxGo423p3Vj6zWbiOp+1fhUIT1Jiclc=;
        b=X3yx/9w6soCm7SrY246mqATX5bOHR6N1n9OC1PYWorZjTdoL0jv9hKOI6BR7pKkWpn
         6MBweTy7jsFyqmHtCL3FdKtyy9Qzq82BrvU6xiro3pKYn12a5IlZ7KxGNJEXk5nUu2+h
         r9H9WvLFDwtniLXJ+QU5LVvVX99BoNUhdLCPjySPnA07DEHPij6zY6avhV0xsuVb+xuF
         8j5MnV4W9MMnoltnWCNSin8QHAnykUUbVnVazGBqYxL8fjkmfaRunsTMCZjvwjRoaAEE
         H+W/TQD/bbFl6r0/u+0hUI2uZJVkCmn/hNDga9nJA7VeusJjw5B7LTqJhiK1v9B7Wjuc
         U8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705591832; x=1706196632;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMhYaW/DOrnmTxGo423p3Vj6zWbiOp+1fhUIT1Jiclc=;
        b=akyJzwYJ2Cj2/JbLUmFKd7mJB63Y7FKWMyQZDjgLiKBX6h8TttnlpSg51/RdIgcNKN
         UUTNH7wc6vhFZ4gWBxEVam8iyzBfoGeVXruJ7in9BaLg3SM4Wy293rwfh5ANeMq0RI+n
         ZDVhr4Gi/zApBLT8KqXjYVaFYw3L1ZoMa+F55T5lniMx/r47YcafLHG6ijFTs1VnVRYw
         hnh4RYO7yJ0pF7l1pvZ143oNq4fcB3nNsJ6taXDV/JOxb5tig/V3WJ7koVYw+NHGimL3
         3QrKK4OL1sUgNhdnpUzQHzbad+IEpBeQxUf4/2+sszSiHGxEjWRQWf0cqpfWfgy4ZuPb
         a/0A==
X-Gm-Message-State: AOJu0YxYVvlSLjBtrTMd+dipdtrfTz6DQbVVT1U4cGsMXZues3skzVwQ
	sqhvvj+eVNNE1WDVGssu9+eFe+rWxpSGmCCQbfUDT1menmTaSGGR5DuP/mQ9IXtnNA==
X-Google-Smtp-Source: AGHT+IFPawHvT5TaSru0RdAQx7GTopIeVVGRoM+1q0gheEiFEfomxLs0OjbfSXbR0Vr+eCj0Opv1Ow==
X-Received: by 2002:a17:907:802:b0:a24:8deb:3524 with SMTP id wv2-20020a170907080200b00a248deb3524mr708053ejb.54.1705591832228;
        Thu, 18 Jan 2024 07:30:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.108.175] (33.red-95-127-38.staticip.rima-tde.net. [95.127.38.33])
        by smtp.gmail.com with ESMTPSA id hy7-20020a1709068a6700b00a280944f775sm9228709ejc.153.2024.01.18.07.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 07:30:31 -0800 (PST)
Message-ID: <5531b75e-86ef-4543-b62a-1457666d9585@linaro.org>
Date: Thu, 18 Jan 2024 16:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt.c: Remove newline from error_report() string
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240118131649.2726375-1-peter.maydell@linaro.org>
 <1f34e941-5b0a-4091-95f9-0d0c8e302aa9@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
In-Reply-To: <1f34e941-5b0a-4091-95f9-0d0c8e302aa9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4SoUJ2tABbVp

On 18/1/24 16:17, Philippe Mathieu-Daudé wrote:
> On 18/1/24 14:16, Peter Maydell wrote:
>> error_report() strings should not include trailing newlines; remove
>> the newline from the error we print when devices won't fit into the
>> address space of the CPU.
>>
>> This commit also fixes the accidental hardcoded tabs that were in
>> this line, since we have to touch the line anyway.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/arm/virt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

BTW there is another case:

$ spatch \
   --macro-file scripts/cocci-macro-file.h \
   --sp-file scripts/coccinelle/err-bad-newline.cocci \
   --keep-comments --use-gitgrep --dir .
./hw/arm/virt.c:1775:38:"Addressing limited to %d bits, but memory 
exceeds it by %llu bytes\n"
./ui/gtk.c:1094:56:"gtk: unexpected touch event type\n"

We could run this some of these coccinelle scripts on CI,
as a new job in .gitlab-ci.d/static_checks.yml or extending
the check-patch job...

Patch on the way for ui/gtk.c.
