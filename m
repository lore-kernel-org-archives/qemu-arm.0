Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp566130njb;
        Tue, 7 Jan 2025 18:08:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAuZsDoszkuSJT9mp8Qda3Nxyvw84rmrNPLEoomiET3rK9sauAEmqSsTjFo9dp+yW+5LgDN/0O3NINtA==@linaro.org
X-Google-Smtp-Source: AGHT+IHOtavFJtv60/v9bzYhhRlal2V6ZXF+ALyzpNTk5eaZDI8k/rRSHH9yoSkBiVqxAxvfbsSh
X-Received: by 2002:a05:620a:2a12:b0:7b6:d441:bded with SMTP id af79cd13be357-7bcd97c9607mr152020585a.51.1736302138867;
        Tue, 07 Jan 2025 18:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736302138; cv=none;
        d=google.com; s=arc-20240605;
        b=bv5hQDa0QYxqOk2b2C3y1b0peqMsf2tKuQ2gsxmUODe3CdCZ+9CTudvRATJEdGmxE8
         3GFRJqR4Pa643GzjeK5NnHCGZKOOASfTam//Oj3Uz38zyQajHpIdKxDn2hrIHOW02wh5
         Zb+XkM6LtFAuaU131TiIhj80T5slsPwx7bAWmXJAvub4pSMk7zLcLxXW2dhfn90wVrG7
         M+kHd7OV75Dr3F0r66nu3M85mrBelfX59IBB6898RQ6lOwR6NTG538f8e6VyPSuyln4u
         med1L2UEOMyUJcyeC54zeoTm5RPJWHZYzwUjH+FfBVhyPrLMkMKGCKzcR04QQL28ozvD
         307w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=kP93DFsalXGL56W8hic4vZzW86y8J4QbESvR12ZZw5o=;
        fh=YfZ86/j88kvACEi1YgeoecGNbeR+tkrcb6fZUxz8nKM=;
        b=fX3VCnnWNBB+vf6h4zEwdfKUcu1CbaYDkkEIn0Ub+ONYM22z2UPtuxWNFIuWH0J9nf
         bxWUxlwr0OI3hdwEleECBfXT2Ex9LF0Rgk9qGJakLT5KCj2j8lw5R6+q3/1Cgj5CLLfg
         GxedpqjrsuOxlPHugIwK3zduks4IRDTYLZ99QG7hZICIJdqlkEUaiSNoiF1Te3NG5FGF
         S4DKTDxv9H/gkGwe8SKD/tG/0BN9ITgnZ74tbdVnC3uZ5FQOq73mgGGaX9C70cvHoKon
         SzjGK8pgVqEdAQzyQFPIiHPZ+B0bTstRV57OYnouQQIGAU/sAQiqV6QuPGUBBeb/KEPr
         6qzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac52f07esi4722202585a.609.2025.01.07.18.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 18:08:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVLUS-0003GM-4f; Tue, 07 Jan 2025 21:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1tVLUP-0003G2-0b; Tue, 07 Jan 2025 21:08:09 -0500
Received: from mail.loongson.cn ([114.242.206.163])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>)
 id 1tVLUL-0006SB-Ud; Tue, 07 Jan 2025 21:08:08 -0500
Received: from loongson.cn (unknown [10.20.42.62])
 by gateway (Coremail) with SMTP id _____8Bx++H33X1n+rtfAA--.56247S3;
 Wed, 08 Jan 2025 10:07:52 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
 by front1 (Coremail) with SMTP id qMiowMAx7+X13X1nswQZAA--.40342S3;
 Wed, 08 Jan 2025 10:07:49 +0800 (CST)
Subject: Re: [PATCH v3 0/2] hw/loongarch/boot: Support Linux raw boot image
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250102-la-direct-kernel-boot-v3-0-40dbc45d633a@flygoat.com>
From: bibo mao <maobibo@loongson.cn>
Message-ID: <38a2cab0-5ea0-85e8-a9f0-e9c67d41a1ce@loongson.cn>
Date: Wed, 8 Jan 2025 10:08:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20250102-la-direct-kernel-boot-v3-0-40dbc45d633a@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMAx7+X13X1nswQZAA--.40342S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKrWDGFWDWr13uFWkWF45Jwc_yoWkJFc_Cr
 n5Cry2vw4kJFnFka93tF1fC345C3y0yFn8t3ZxtryUJFyfJr13Jan3Ja45Crn0qay8J345
 CFykArnYyw1UWosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
 s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
 cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
 vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UU
 UUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=mail.loongson.cn
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.594,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ztea/WBCEz0o



On 2025/1/3 上午6:47, Jiaxun Yang wrote:
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v3:
> - Added PATCH 1 (Richard)
> - Link to v2: https://lore.kernel.org/r/20241224-la-direct-kernel-boot-v2-1-3e8336c54c60@flygoat.com
> 
> Changes in v2:
> - Use extract API for getting bit fields (philmd)
> - Mimic arm's load_aarch64_image to handle vmlinuz.efi
> - Link to v1: https://lore.kernel.org/r/20241223-la-direct-kernel-boot-v1-1-a79995d8b15e@flygoat.com
> 
> ---
> Jiaxun Yang (2):
>        hw/core/loader: Use ssize_t for efi zboot unpacker
>        hw/loongarch/boot: Support Linux raw boot image
> 
>   hw/arm/boot.c       |  2 +-
>   hw/core/loader.c    |  4 ++--
>   hw/loongarch/boot.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>   include/hw/loader.h |  2 +-
>   4 files changed, 73 insertions(+), 4 deletions(-)
> ---
> base-commit: c69612063e1844b76ac01e3a781b979548c3585c
> change-id: 20241222-la-direct-kernel-boot-c598264710e7
> 
> Best regards,
> 
For this series, applied to loongarch-next

Regards
Bibo Mao

