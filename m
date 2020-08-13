Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp394500lfy;
        Thu, 13 Aug 2020 03:42:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOH3eTvdFqMavZoZg1/2pWFX71EwEvcjp8G8oG1HGzO98AN1tAxiJwkaoq1j8gmN2wG21L
X-Received: by 2002:a25:828a:: with SMTP id r10mr5676979ybk.180.1597315377854;
        Thu, 13 Aug 2020 03:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597315377; cv=none;
        d=google.com; s=arc-20160816;
        b=0P7BtLYW1HmhIqCfQKHJCEoAOdOaX8lXzqCeXPO9U0xG1p4jdXpXYM82bmfYGvTGE0
         98I8oR9INJjb5n+6LFiWUUwG/Q5RzyUGrDMGMvPocxiwJtanXMkFPSMtGU+OvboYueId
         kaLzkhaxmokPISksrNSc8ac1IwC2HagX5LJNWTK3fvaxwdfD8WGafe0cxttYXojoCpKx
         ZI4HJTzrUYrJQa28gRCnamDTwrrVVzkdmd9qsg1d9/GH46fx+39UrKqPz7FcaMYL0/a7
         wsfIPDbQAAfHeidAd7unAvEva6zUCHKNdT3fOdnBQEsTPs5GYUsDOTYbTpTrbANwt3jZ
         n5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=gxlDasVghYbwKFLuepg+JPTEz1tT6/aO0i5RF/f86XI=;
        b=d29YEAqoxr3J+wRiygqQL0FPxcFPOf7YestBWYkEXNZTVopeWYzbarxIDTRF8r1HcK
         Cw437/ARYXpBo+esSiMPqEJnl3g4jQQu0Kp+oX2hbpJKq39M2ypqQZwyrtf9N6Am8MfM
         pKeXH8RYhdw7WOZ9m+BjueUEVwQcJ/We7wXEVte9+VzMaQAviYi/PnmJHpgpwEMpibiF
         +pJxiYB8YoJcxq0LyZSB7VhLkDhwo64NTePPL03X4/MMitLH32oP+jDbJZ65WyIbyuCU
         fKi14ln9oi+5sLnXhVP4u/BJCttzLecs2Y3GcdgqxCTeV8hzjsNGTvHXrJRrfmTvf7zP
         Yixg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PcHRyc/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k131si5011290ybk.460.2020.08.13.03.42.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 03:42:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PcHRyc/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6AhF-0006zo-9E
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 06:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k6Agt-0006qJ-5c
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 06:42:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34011
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k6Agr-00087C-E6
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 06:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597315349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gxlDasVghYbwKFLuepg+JPTEz1tT6/aO0i5RF/f86XI=;
 b=PcHRyc/M0oQhV4WsBok0po61nqfvvIeXC4fl6dJkCUaK/sVJAdy3kcWiqunOEq1YQjorG7
 ygDjAdaDWRworK1761qLKdrMI3aHNGQBNyhpBoOIOd+KaE8Ikw7k+yq/kvstGkcbUgHIn9
 u8esbP1Qeb4NlSkkuaiXqtncFEIFA5A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-WbRS2CdFM0ix1q7ZhkY7Fg-1; Thu, 13 Aug 2020 06:42:27 -0400
X-MC-Unique: WbRS2CdFM0ix1q7ZhkY7Fg-1
Received: by mail-wr1-f69.google.com with SMTP id k11so1922141wrv.1
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2020 03:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gxlDasVghYbwKFLuepg+JPTEz1tT6/aO0i5RF/f86XI=;
 b=XSbMvm3MH9FsBwBAXWsny2xJ0Aohfbfb2XZLwqeRuVWpYikBcUw4UWJ16IkXUgvaTw
 psgqyxIwXAOaIadvukgJTKXUVmAnhIqYsJ8eV6KbVSSlSx71RLyKqBALo+C3fzokNZkZ
 JKFi6HiNjcAUkoiHjmxugqcKJ3IjAzZno2K3v6+6UWLTJ/1570Q4znDtBfChE+dCfrji
 ECHa9q/4lzcP/1yEieQAotZ00i7dfUSRJaLKyIm1bUI8n7GG7n6awZh6BVzOfhGVs36G
 WAquDOPpoWTngk7J34d8mh6B9oeuuJ5t1Lt9bZR8/cg7KXBZc/2u6ShELeRUDgITMiRA
 x/lg==
X-Gm-Message-State: AOAM532iCuaurxpCHtROnLZEWIU9RgpzdKG8Dn6C2bBnvTIZzxnbqyMQ
 x3tbvDvUpZM42EqNuXtjsSUdyreXhhTIRWzIgqpgTLF8xL/JVD7c4hNFCr1LesFvIFh29ZPeeF2
 JekjS5vhynmmB
X-Received: by 2002:adf:ca06:: with SMTP id o6mr3327218wrh.181.1597315346340; 
 Thu, 13 Aug 2020 03:42:26 -0700 (PDT)
X-Received: by 2002:adf:ca06:: with SMTP id o6mr3327191wrh.181.1597315346038; 
 Thu, 13 Aug 2020 03:42:26 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id e16sm9599778wrx.30.2020.08.13.03.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 03:42:25 -0700 (PDT)
Subject: Re: [RFC 1/9] target/arm: convert isar regs to array
To: Peng Liang <liangpeng10@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-2-liangpeng10@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <6151cd0a-b3ff-ae68-e843-c6b294b846a8@redhat.com>
Date: Thu, 13 Aug 2020 12:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200813102657.2588720-2-liangpeng10@huawei.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vwN/Zchoac/W

On 8/13/20 12:26 PM, Peng Liang wrote:
> The isar in ARMCPU is a struct, each field of which represents an ID
> register.  It's not convenient for us to support CPU feature in AArch64.
> So let's change it to an array first and add an enum as the index of the
> array for convenience.  Since we will never access high 32-bits of ID
> registers in AArch32, it's harmless to change the ID registers in
> AArch32 to 64-bits.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>  hw/intc/armv7m_nvic.c  |  48 ++++----
>  target/arm/cpu.c       | 232 +++++++++++++++++++-------------------
>  target/arm/cpu.h       | 226 +++++++++++++++++++------------------
>  target/arm/cpu64.c     | 170 ++++++++++++++--------------
>  target/arm/cpu_tcg.c   | 250 +++++++++++++++++++++--------------------
>  target/arm/helper.c    |  54 ++++-----
>  target/arm/internals.h |  15 +--
>  target/arm/kvm64.c     |  72 ++++++------
>  8 files changed, 541 insertions(+), 526 deletions(-)

Please consider using scripts/git.orderfile.

[...]
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9e8ed423ea..5d8074d03b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -67,6 +67,37 @@
>  #define ARMV7M_EXCP_PENDSV  14
>  #define ARMV7M_EXCP_SYSTICK 15
>  
> +typedef enum CPUIDReg {
> +    MIDR_EL1,
> +    ID_ISAR0,
> +    ID_ISAR1,
> +    ID_ISAR2,
> +    ID_ISAR3,
> +    ID_ISAR4,
> +    ID_ISAR5,
> +    ID_ISAR6,
> +    ID_MMFR0,
> +    ID_MMFR1,
> +    ID_MMFR2,
> +    ID_MMFR3,
> +    ID_MMFR4,
> +    ID_AA64ISAR0,
> +    ID_AA64ISAR1,
> +    ID_AA64PFR0,
> +    ID_AA64PFR1,
> +    ID_AA64MMFR0,
> +    ID_AA64MMFR1,
> +    ID_AA64MMFR2,
> +    ID_AA64DFR0,
> +    ID_AA64DFR1,
> +    ID_DFR0,
> +    MVFR0,
> +    MVFR1,
> +    MVFR2,
> +    DBGDIDR,
> +    ID_MAX,

(nitpicking, drop the last comma).

> +} CPUIDReg;
> +
>  /* For M profile, some registers are banked secure vs non-secure;
>   * these are represented as a 2-element array where the first element
>   * is the non-secure copy and the second is the secure copy.
> @@ -890,32 +921,7 @@ struct ARMCPU {
>       * field by reading the value from the KVM vCPU.
>       */
>      struct ARMISARegisters {
> -        uint32_t id_isar0;
> -        uint32_t id_isar1;
> -        uint32_t id_isar2;
> -        uint32_t id_isar3;
> -        uint32_t id_isar4;
> -        uint32_t id_isar5;
> -        uint32_t id_isar6;
> -        uint32_t id_mmfr0;
> -        uint32_t id_mmfr1;
> -        uint32_t id_mmfr2;
> -        uint32_t id_mmfr3;
> -        uint32_t id_mmfr4;
> -        uint32_t mvfr0;
> -        uint32_t mvfr1;
> -        uint32_t mvfr2;
> -        uint32_t id_dfr0;
> -        uint32_t dbgdidr;
> -        uint64_t id_aa64isar0;
> -        uint64_t id_aa64isar1;
> -        uint64_t id_aa64pfr0;
> -        uint64_t id_aa64pfr1;
> -        uint64_t id_aa64mmfr0;
> -        uint64_t id_aa64mmfr1;
> -        uint64_t id_aa64mmfr2;
> -        uint64_t id_aa64dfr0;
> -        uint64_t id_aa64dfr1;
> +        uint64_t regs[ID_MAX];
>      } isar;

Why not simply this?

       uint64_t isar[ID_MAX];

>      uint64_t midr;
>      uint32_t revidr;
[...]

