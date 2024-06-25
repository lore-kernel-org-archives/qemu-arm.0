Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp748939njc;
        Tue, 25 Jun 2024 11:34:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTbwlMMkMqsplfhpgZejxURzvd+qSs8UJy03PPO45e2c30Qy0uwV+vLUnN2/E9qvZMA4HPhfhb9DWokTs9ydS1Ojgl0umP
X-Received: by 2002:ac2:5e79:0:b0:52c:e180:4eac with SMTP id 2adb3069b0e04-52ce1804fa2mr4930346e87.9.1719340491190;
        Tue, 25 Jun 2024 11:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719340491; cv=none;
        d=google.com; s=arc-20160816;
        b=Gfefz9e97KdP9OzHMxk28jvr/j9Q3o0wBRSNgtKuczXhA3hs7TQNZG0PisqFWEScig
         eCGaVj+58ROCnvhO1smcSU89sDFQogMCD+s+i1w5MGbHYokHR5WxPI1DJd5jwCWHF+JR
         GHAB0KlOaxQVV93Pf7uzWr0uZmgeiQ48KX+bPL31P/R0n/2yszbI1bNINBJFR4U1gJ0U
         A4XB+mUYlkCS4FIwSHTFZ1dFUk/n2eCBixuy5o8GhlkZDASrEWWyEv/KywxoOZHJwc9y
         YA/wrgauPkJaPhQCOTkXHSMPfYmnAvNcJr8jf2ZB4BvxQLpdA5eGaUSChJ/Wntd9BMgV
         iXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=xCFabv2nohWkThTwXlKe6p51NtMl+EbSJxir215ZsD8=;
        fh=lt4pAerJ4BuSFxOFmaU1o7DtdHAzCPy1PWPazs4h0nU=;
        b=XGsX7Cgdd4VmF7LqfM4Cn67MY+CFXFjQ/zxyWVazQ/Dp3wOnw1ZOwhCwj7qoKeRKHv
         7VuAEhEn3Sh9XpOx61l7p64pu7phN/wjV3DEdTLKbwuXd5cxhc4FJe7cLe/JdJR9o6SH
         z7ZGj2KJkxqSbK7v8fcUdfpjH4HK1Wg8kIsNGAMzUxx9haLNu5i2AbUvQP5wlM+lrQNX
         owwmc9m9SjSp0wLmPsOfejBeWAsWTvkEjUmy0uyDhe9TXH/YXO3zZiVsPA761rnSMMaW
         Toi9rP0hH8W7W6FIUooh451lgiYAJAhzOc1dC56FZ3t5UuJeRkLD3CkTF9RfB3uYHtxL
         nKZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiG5iC8q;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52cd6439a05sor2529706e87.18.2024.06.25.11.34.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 25 Jun 2024 11:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiG5iC8q;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719340490; x=1719945290; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xCFabv2nohWkThTwXlKe6p51NtMl+EbSJxir215ZsD8=;
        b=hiG5iC8qqFakTOkl3dZtHXKovkBPAIXPmaXuXzcgyPce60AW9G/feXMGLua20QrFUL
         As7nvteuBDUhbAk3rpW8mi6nmTOHFyO1pvcKCBriTBaflglAT0misgaAWetgETZsdDCb
         NUn+VHANbxMVypaxvp+Cd/GdZ1uS5flLJsQBVbKqLfAWps6UgrgmL1RzpvIAxhr0pwEA
         moPK1iCqOc72HglqOk4ndw/xvp9sPh75IOhK38WJtJMWdt6X3qhuN6Ss1Q5qTb9qLz9E
         2P+XPRsL/ig5bXS8DmxcKoLCVK/Zw+MzT5QYNHj/r85UOmO9ibjllVr7NXDbFAw3no4D
         f67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340490; x=1719945290;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCFabv2nohWkThTwXlKe6p51NtMl+EbSJxir215ZsD8=;
        b=lqckM+zg99+MaUN+QTpkNwQ8cCPv8K1t4n+CZEK3sfH6bfMb5b7BLv2EPvPHlaEEmc
         vmmkNK0+tZnEbkIxno8E9NuTLktZhDJ0qr/xCG5tZXLDC9Qteq646gN81ZbPAA8lJSt1
         6pmaWyUXfKnoPfJOvtofCuSL1WMvyY0lP/+StMGuuUU2g5/i9rT8NavqNYTwzKAejHPe
         q5NUgJzqdLMzeiw3UrSGqo9lIcCzxaK0sIC/2tn9I5DSGcxM3rFKpHv2BuZS7aeCWdX8
         ekmMqsOVoBG+UfdQMy3KH0s/joVg0KOsjRKe2+1NFlRVaN8lWuNUUPKihG74T8D7MpaD
         NHhA==
X-Forwarded-Encrypted: i=1; AJvYcCXW0hqdurKJyLOXYFvF+Nn7PsfFEZTYTZHKsL4cKK+R/DdflM0rxK66WLEwtjh+OxEisM97i7MjagwX3HTBo+qm9ionbghM
X-Gm-Message-State: AOJu0Yx5ghtUe/m2IfppFp1nKwo9ODSXHBzru5NRqX/qfqPecX8qWeEq
	iH6v7fiuL+mh5t9t0p36h236LHCsrfR5HAWZfZE4tpSQj9w+hgfVtcUG094nYtwpjw==
X-Google-Smtp-Source: AGHT+IFZW/NLW8GfAHqDK2xt6sQX+9n5HxZ4aE3cvaweed+T4za4yMtN9jUuATR/Cm8+VOzcy9+QwA==
X-Received: by 2002:ac2:54b3:0:b0:52c:c6a0:575c with SMTP id 2adb3069b0e04-52ce064e939mr5073330e87.33.1719340490465;
        Tue, 25 Jun 2024 11:34:50 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli-email.org (adsl-73.109.242.224.tellas.gr. [109.242.224.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f675esm13676151f8f.22.2024.06.25.11.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:34:50 -0700 (PDT)
Date: Tue, 25 Jun 2024 21:23:11 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, "Daniel P. Berrang=?UTF-8?B?w6k=?= " <berrange@redhat.com>, Marc-Andr=?UTF-8?B?w6kg?=Lureau <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, rowan.hart@intel.com, Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Bcc: 
Subject: Re: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with x-pl011-rust in arm virt machine
User-Agent: meli 0.8.6
References: <rust-pl011-rfc-v3.git.manos.pitsidianakis@linaro.org> <229703c7f4394691f254b02c012ee0d7dcf57afb.1718827153.git.manos.pitsidianakis@linaro.org> <Znrt77XOc2YBNZyM@intel.com>
In-Reply-To: <Znrt77XOc2YBNZyM@intel.com>
Message-ID: <fnfm0.vm34jtk3isk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: g5n1kqD762ii

On Tue, 25 Jun 2024 19:18, Zhao Liu <zhao1.liu@intel.com> wrote:
>Hi Manos,
>
>On Wed, Jun 19, 2024 at 11:14:02PM +0300, Manos Pitsidianakis wrote:
>> Date: Wed, 19 Jun 2024 23:14:02 +0300
>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> Subject: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with
>>  x-pl011-rust in arm virt machine
>> X-Mailer: git-send-email 2.44.0
>> 
>> Convenience patch for testing the rust device.
>> 
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> ---
>>  hw/arm/virt.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 3c93c0c0a6..f33b58ae0d 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -912,7 +912,11 @@ static void create_uart(const VirtMachineState *vms, int uart,
>>      int irq = vms->irqmap[uart];
>>      const char compat[] = "arm,pl011\0arm,primecell";
>>      const char clocknames[] = "uartclk\0apb_pclk";
>> +#ifdef CONFIG_WITH_RUST
>> +    DeviceState *dev = qdev_new("x-pl011-rust");
>> +#else
>>      DeviceState *dev = qdev_new(TYPE_PL011);
>> +#endif
>>      SysBusDevice *s = SYS_BUS_DEVICE(dev);
>>      MachineState *ms = MACHINE(vms);
>>
>
>I realized that if we want to merge the rust pl011 device, then this
>patch or similar enablement support is necessary, otherwise, the rust
>code is only used for compilation and cannot actually be run...
>
>This is also an open for the devices that are rewrite in Rust.
>
>I think there should be an option for the user to choose whether to
>enable pl011 in C or pl011 in Rust. What do you think?
>
>Perhaps the easiest way to enable rust pl011 is to add an option for
>virt machine... But that's certainly not a long-term approach. I think
>the ideal way would be to allow rust pl011 to be specified in the
>command line via -device, but this approach would mean allowing the
>user to create pl011 and would require changes to the current buildin
>pl011's creation logic.
>
>-Zhao
>

We should definitely refer to ARM maintainers. The peculiarity of it 
being a chardev seems to make it not straightforward... I think it might 
have to become a machine property like discussed here:

https://lore.kernel.org/qemu-devel/CAFEAcA94twaBSx--NVXQcRBQ7v9TuK9iTq9kTWP4FYpRzgPbBA@mail.gmail.com/

And that'd be a bigger change not related just to Rust.
