Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp463573njm;
        Sat, 29 Jun 2024 01:54:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjJ2BoF1PGliMYesVqYKJsIT5TbxYuHiEoYvxaEAXo+bkdKvtko96765drRbfm1yMDvJ8er3fXTRepvN/B3lndHU7zr3B4
X-Received: by 2002:a05:6e02:1fe8:b0:374:aa60:a5c3 with SMTP id e9e14a558f8ab-37cd2bee935mr4770535ab.28.1719651296245;
        Sat, 29 Jun 2024 01:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651296; cv=none;
        d=google.com; s=arc-20160816;
        b=FsSLk9kNxB3PgFPxNcnsBRhy4rVjiabA/SPHacqsAqtVLdlWLxjeGgvHgmLfQbwrjA
         cPMWBjCe3cBPWUthq0OjyFY+9dxjCFkcuNaDq8OdLWLAQ7r6CcdR/5AsnOw2GJGIur2H
         dn3P7AfdWX09jUDg06XBThMREl7ejHxj4BJZ4mqyvrQnuPo986yc4EHaVrARvDnD5Fvy
         Z63oiMBeahaidjBm1t0u+r+DELEwIWL3SItC+9V2RTBschVAewD/pxlxJlfq60LhjiwQ
         hN4TMhPE9VEQGnN/FFEeFT1Ty2AlJLNzOogB4HUZxW6YdSPlLYEGFN8P/y9JKbxOn7qV
         zTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ujM5NeqxIU+FF+Llp0SkjKhIDMNdKBIzCQWyIWYrJIA=;
        fh=+4RsosjBxXRZxnkULBoA4rzySZvP/ZBGsmOm6a6RpYs=;
        b=gI9WNvoOg7HblVCsQLoa6adF8O48DEIp9DUzPwlgL69w6uXmdJ0WDvayb/v3ArTA1E
         kUeKcDjZe/wB986hW2KhE2FkN4cK0z7G6mj/lrPch5fuGXOL9Px7Imkwxqe2QKTsmWzN
         hhr+052jCOpPejVMzR0si5CUR2lgv06Rzfv7oi5N5dRrwqnFmk1ePdr2a9n7S6tv/dCQ
         QdPhD2XbY8zcB91Q8FxFD8MudqRiMy4kKoELyyklq+OB30Z6+5eBEJgcoNclpfUuwvi+
         IF/aF1mbtV5TYsJ6PDBc7pidv0fiz3Rcuq/xVubI+ZHeNd6r8UM9QqN4SAFX0OLUJ7YR
         IGAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=AD51O1Es;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-379a5e9caf5sor12132855ab.7.2024.06.29.01.54.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:54:56 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=AD51O1Es;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651296; x=1720256096; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujM5NeqxIU+FF+Llp0SkjKhIDMNdKBIzCQWyIWYrJIA=;
        b=AD51O1EsZ+Gn9gJgV/oNrW31H6pU9yS3ugIBEjBJeGykidCrdyyv4S+/ws4pkJTtel
         v9n8sxBa6X0uoVnMFVrzIo+nm4IRMgX67+x/1S3Xow8SWLeTX+kTk658K1EHTk7Hg9P1
         XjrpTSRimK8eel9YW42rJ1q1rdLNyKpdO6WL25kNSHvQ63BmGIIW4ysKT68OeRPKhbCJ
         7wAQU2PHvg4oCoZyttEPXUVUichxf7+ZcioTNxwmCu3mc52Oe4hxG/I7TWGyPchpLGh5
         24sjEYz56lwECFOslBh/XBmSEd6GIBTR4hrDh/xvMHCy4CbCR/4SFeBjgr/SPHgQrBjS
         X21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651296; x=1720256096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujM5NeqxIU+FF+Llp0SkjKhIDMNdKBIzCQWyIWYrJIA=;
        b=JGjA89+4RMcVcEa2vvVfuZdU3tNlw7BkzdjYdV3seW37JuanjvS0IN7YTjglhX+Dd2
         MmsENSG5uDlkL7mPs7kDDaqBIWQoYF1Lv99nwPRRBVDpg94ep7Hi5z/z4Dvu0owsIs/P
         StFemm2WAIxvou9Qn5l4KdsNKaXBLcz0yfv0KJDknLCsO9+zYWc5gsY7iMNQxY0dXauH
         mtvB05gS4WUprBg3hAgJuEyQ31Hk/7Jep5IXR7TkMto31hjwgGfSFK69di6cRu2Cr8+V
         Z95QfU9Trg+FNnGy4Hdf5sEMA6R/VF3uLRpNz8Ix6Fj7/jKrti/0RRE0Rn0+V3vbCiwF
         8j0A==
X-Forwarded-Encrypted: i=1; AJvYcCVili0uEjCVLKhoN8MneehIkN5D4Ky+cuK8liHr6hNooZHVnjGqRi0awap5ReIttZQup082Gs4p7IlhhsaaYhFEaulOxdcV
X-Gm-Message-State: AOJu0Yzz8KatCYE191zK8pTwwQZtDTSBk2bme4/sS1eam1VQ93UJQg7y
	ASjLmCGDuKkWRQMI+CjaHHg0W/d6/R1MzxcSQg0n0dT66Jtqq5B3TeFJFSiL8DA=
X-Google-Smtp-Source: AGHT+IFEtOJ9Iio5NGLvHctjKhp7kJwDIdlO0qtG0Vz93bm0oNGM99zS44ydQIEXmJPVKOTWEMAZQw==
X-Received: by 2002:a05:6e02:152d:b0:374:ada1:296b with SMTP id e9e14a558f8ab-37cd0cea1d9mr4803075ab.8.1719651295810;
        Sat, 29 Jun 2024 01:54:55 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.204.135] ([157.82.204.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6c7f76fbsm2287731a12.73.2024.06.29.01.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:54:55 -0700 (PDT)
Message-ID: <02efb133-d288-4bbb-8950-48438c929c9d@daynix.com>
Date: Sat, 29 Jun 2024 17:54:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] tests/tcg/aarch64: Explicitly specify register
 width
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
 <20240627-tcg-v2-3-1690a813348e@daynix.com>
 <2438d654-dd76-4555-98a8-52d0fa006d08@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <2438d654-dd76-4555-98a8-52d0fa006d08@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bzMRWDvqCqj4

On 2024/06/29 2:19, Richard Henderson wrote:
> On 6/27/24 06:58, Akihiko Odaki wrote:
>> clang version 18.1.6 assumes a register is 64-bit by default and
>> complains if a 32-bit value is given. Explicitly specify register width
>> when passing a 32-bit value.
>>
>> Signed-off-by: Akihiko Odaki<akihiko.odaki@daynix.com>
>> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   tests/tcg/aarch64/bti-1.c | 6 +++---
>>   tests/tcg/aarch64/bti-3.c | 6 +++---
>>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> This is true of clang 14 as well, so perhaps remove the version 
> statement entirely.

I noted the version because I think it is totally fine for clang to 
choose an appropriate register width instead of complaining about it and 
a future version may do so.

> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks for reviewing this series,
Akihiko Odaki
