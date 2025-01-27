Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2724035njk;
        Mon, 27 Jan 2025 13:27:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVl9RaeJodWYrC+mswUlci5ACP/FtbGknJWXcZkS3Pah/jMmyYFzOXyPqupXeIGYbaImaI3sga3Gz/1Vw==@linaro.org
X-Google-Smtp-Source: AGHT+IHlwij5OczyBs5KuBncBjBTWR3jsd3adWr8SZsDJkyHQWFjwAVg8xnkZ54U+CzaU7yO7WUd
X-Received: by 2002:a05:620a:424d:b0:7b6:5d83:123e with SMTP id af79cd13be357-7be63252b5bmr8923950685a.54.1738013255362;
        Mon, 27 Jan 2025 13:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738013255; cv=none;
        d=google.com; s=arc-20240605;
        b=VlRWnfcrUzNpNqXsPIBfxoaffTa5ewFBWBC+bm0+LHm/XCZuhIf+BY0MM4MJP0ZPuF
         L6rOvCS0wDFqzXrZqXrsWLdL8cFVwha3uwuucZrY+hnASWUlDXF95IjNN5/Q2vtQpNXB
         y19owLjT+W8622qpZzhkoTOE/wb/xRw3rp2orQmPvLpiCGAvzTdURsTGB2jJy7Ul1Ddp
         DanytlE6FY8kzA+m7FH5qTSJqXxcTFH84lC2FuUKj3Fqp7LaZbLFIZREOfxVLwNAUT54
         lZ3j8P2vLX8bEzax1w51vKhCuJlDyMJI+pNfHON6bfJff67HCAsj45Yar6xUxvjeAKZG
         fYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zUre0Mdf0BtVe7A6A7XE3tyBl/YmugDLg58HFmxhDzU=;
        fh=/v0lwCiqqBv4PIxCuOONyZnLDOR21OisGGcaKWaVvWg=;
        b=AOk16Rev2yac11Nu+iJyt9jbFYAIBG/VESfPAginAi5XzAH1Krc8f6ZgDZNUtkxhDD
         i8mUXjjfRZeWkSBf7Ij2LvVfuTZTfmdFMmUw2ggcuw2qqzwMchNXjvv6j6At9RlFnkXN
         C6iY9nALb1JSGGOkMDPL6iWyqX6K/D+Ia4S6Mjnub+tJLIXXcha8S7/ORiI7yylGsk1Q
         Fj6stB6K1OUd0B/gpyll3D1ddo6BG9D+3T7gYO4TVx2dVhS55EpotEjfoMqom49Mty4o
         gVGWBUm3w5yt1ajORiAAD/BDqkFBt4gEf6fbUsewWXfoo0aIBuuDGVsR0FkoN7sfWhpI
         /Tog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dHA6p0fk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af15a6dsi1049798085a.556.2025.01.27.13.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 13:27:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dHA6p0fk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcWdH-0005Sc-6F; Mon, 27 Jan 2025 16:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWdD-0005Rj-Vm
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:26:55 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWdC-00036v-Ay
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:26:55 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21675fd60feso109994055ad.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738013213; x=1738618013; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zUre0Mdf0BtVe7A6A7XE3tyBl/YmugDLg58HFmxhDzU=;
 b=dHA6p0fk+m6JdDL4/KBkCHq+zgfLNBHYTiJD/bK/02IXliIbmN2QSRuX6iXlW5MESz
 SelBnTdEw12DIo7diyXpI2KpT8GGElg2NmVbeljDgfVXs28CB1whgd2Gw/TqF6G7b3F3
 OkxQpBB8Vi6jVGt+TCQ/xkXxRNhXPANI8ulrQamm+odMjIyk2F654bk7FNkj4RQLnoth
 9nmEGLVJTmPL8ba4+ddtWWip2DgWCRBoHUE1VgwJoPKejtQY8LUP76JRDxYet4jAChVW
 9jBBX/V8bPJnj/TmHLB2saSnHc8V/M4EJ0zDpwOTbNgCtRdADajv8xJS9VrNMZwC2R96
 z+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738013213; x=1738618013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zUre0Mdf0BtVe7A6A7XE3tyBl/YmugDLg58HFmxhDzU=;
 b=KlZaW8pR3T9qaq4xpgcumc1aFUoJUuev37UqBQlJXF6vVKXo1+vaXjCgglMEQoLMFY
 f8JXlL1Cdx3JbkzARA35i7w1NvP6vr3JQmMn8HpYGXMGDmxtQgYd7YOK5c4Pmyd9E+fD
 6/yovyhk0WNH+WvBs/hzQ2ub2zcMklNKAGon8ZXC+uZq2uiEwDoUc/FpEWu+soBtubhW
 BGgo915BgdRMWr3F5FeHAJ0S7JYQjLXCvIk58ScKUHK8itncGBZZXH4+mKbbN8Exy96b
 9apqF7CAaX3+w8WEnFqPWkqvIpW4hxVXIsA7qO6jRNhhr/mq9eQyJ+tUyvksrVW5lNMz
 22rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnBADu8gyK+Jq0S183kaHks49idx7ncwn+fZVKGSC8bpt1XQetwdIAl9l/22bbK5kfHkajnZp69g==@nongnu.org
X-Gm-Message-State: AOJu0YxR9PwKmsGjmpxfRTXaMkVbeZhDOiMGM8cpJ7m8QHxO+Vy3sHb+
 vDYe8rPsIZE73UKgmUtrk26BaxtlHG7YpHgJtjMYVVcJ7h3+D7y5onnmwDucfJs=
X-Gm-Gg: ASbGncsmd1zw1PHcku/C26MVJpv1EZwNV6oEd/ygMVRoxf9MdISynmh7crtgShNL9jV
 KprCP9YiGRdDdv5VITFzLgxKnAMabRVPX5kQlaTzPbVAgl79pqZuzsoHM2XcX+ePXULwy0TIuuj
 SJiDHVBs+tW2Prka8l5ueJxQwTxzaSe6Tk/gUWJ/Z9qIvPOrHgc6yiYWlP3ONw/CURMNzBcpG+U
 cVZ0CUq0Lh4M32rZ4af23cpE4q5aJfpvc0FSF5/ZvoAr7m8ZjJ8ldUDo6N2pKf5r+P1hhb9bugn
 UYRLiWZftoooNaQ2E3GzTkJvRhKNvY2u4wZTQBRJKGJ/OjE=
X-Received: by 2002:a17:902:d48a:b0:216:6f1e:5799 with SMTP id
 d9443c01a7336-21c355ee2b7mr702445295ad.35.1738013212898; 
 Mon, 27 Jan 2025 13:26:52 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414dbfasm67986535ad.183.2025.01.27.13.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:26:52 -0800 (PST)
Message-ID: <823e27f9-9baf-4da3-874e-ee58b4c6473d@linaro.org>
Date: Mon, 27 Jan 2025 13:26:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf_as()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MG406CnSFN5k

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> Rather than passing a boolean 'is_big_endian' argument,
> directly pass the ELFDATA, which can be unspecified using
> the ELFDATANONE value.
> 
> Update the call sites:
>    0 -> ELFDATA2LSB
>    1 -> ELFDATA2MSB
> 
> Note, this allow removing the target_words_bigendian() call
> in the GENERIC_LOADER device, where we pass ELFDATANONE.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/loader.h      |  2 +-
>   hw/core/loader.c         |  8 ++++----
>   hw/arm/armv7m.c          |  2 +-
>   hw/arm/boot.c            | 16 ++++++++--------
>   hw/avr/boot.c            |  2 +-
>   hw/core/generic-loader.c |  6 +-----
>   6 files changed, 16 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
