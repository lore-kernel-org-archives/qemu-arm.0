Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp588384njb;
        Wed, 4 Dec 2024 15:38:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOshTQG0XjWy/2DCsZJCkwYy0ag/SAJbeON+smT9S349MeccoEAGdw+knBVJoavMomKiobOUzTKE/+mg==@linaro.org
X-Google-Smtp-Source: AGHT+IG1zUR2GHBqPX4ntHGkoCfoATjEG8Uu3FH/fBF2YnhaDDJW9xSdB0Baqx2FPpKFRCsenmld
X-Received: by 2002:ad4:5ecb:0:b0:6d8:90cd:ac95 with SMTP id 6a1803df08f44-6d8b72ecabemr117747166d6.5.1733355483350;
        Wed, 04 Dec 2024 15:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733355483; cv=none;
        d=google.com; s=arc-20240605;
        b=LjW2Sk8WGsxYOV3SL49+WgrSF59q2eygt7znQt00jTElYTjOX3JD5JXxjl3py0Wkfb
         rWCvpfwKmtJiQr/YBqPbE6OdrbX2WBu7MBdQDDieVo49do+zSNbwzqAayg/8r5wkkpnd
         5tJPq6uOTZtKzAu+t2Yu3ky/wZoYSCYdwdcgPo63n3acQKyd9ryDIzJCsbMwNSiyYVIO
         trbFc0/WVOTQMHtP16KU6+Byy6dZ0xWq0qUKqhC6EMVbUdtO/A3E3+fJgwre6IEXxhBE
         QnD2fEtk77DwT0NgEHyGBRG5M3Yd3OnbiOOilaCxouSVBLCJhLqJH5jpkxh/lVQeFTwl
         aB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Wm+YprTKZReL/LK+leQhteNkdpgiYwW0BQBegMkxYto=;
        fh=Qk0fqK7O5ODfkCmuOkd2StWG5aSbdEo1v/Zhvnk6Cb0=;
        b=g3I/uj+KCsx1lUw0jmMSFYY3fPhOBjf5FKLqT4IVGwyIPuqYqccyppT7ZOkdnL6s2q
         9j3D7OK4IOw2b72KZ0Z4eh4dzikoHGyhVxy1XyRMQNywLkovS0XjELEMjeg+mxts2k3H
         EbOSIGtLBV8LgsZ7I/twBwKFLf1JsM6MizinjKTicK/Jx+SkMgb/sttDwhzr/ROXBqad
         M67SoEyzuN5K35lKPg0Ks+X/l1C0Eg6EuRlNx/evCi9raacp2PV8b4jM2pYpNusAIzzK
         0aK2qzMdwT6dxlZiCK1b/bfItJ/FC9a/8RhJJenbIcogoQqg/P/7wGbiL3ZnH4zJD9iN
         mAXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EHWHKM8z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5abf4besi15954085a.578.2024.12.04.15.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 15:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EHWHKM8z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIywC-0003gA-Hw; Wed, 04 Dec 2024 18:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIywB-0003ex-4z
 for qemu-devel@nongnu.org; Wed, 04 Dec 2024 18:37:43 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIyw8-00011P-8I
 for qemu-devel@nongnu.org; Wed, 04 Dec 2024 18:37:42 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-29e585968a8so288816fac.3
 for <qemu-devel@nongnu.org>; Wed, 04 Dec 2024 15:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733355459; x=1733960259; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wm+YprTKZReL/LK+leQhteNkdpgiYwW0BQBegMkxYto=;
 b=EHWHKM8z3MGn8nfIBkvXtwaGyUaq4YnbkbVBYr+y4YlM7EUDo/m7R/tZUcrON73tT0
 2F9GcyBR5XV1L5LogHZTpEktrqaG32FteyWx+6HIwfoMrWI2bpa4cD7OhD/ZinC2mjDW
 5W0ltVBs3yGO/pw7tR6kS8ub7s2L2VLqk2VZldwZjLYKq9+LoQi87emY7+LxklJ+DqLR
 2ziEzqcEs22bl9lZ243XQUtzBJHnDST9dGYB3AYwx4+Um1jFLf/Ru5LlO6LE1s8UlCEO
 dAuSEfWzcpRGiAe1AgC8p86VH9Odh4lSWsk/l7zxvplMYZX4oCsq/osoz8VPUat/kscM
 4VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733355459; x=1733960259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wm+YprTKZReL/LK+leQhteNkdpgiYwW0BQBegMkxYto=;
 b=oE9V3n2wXZzmyHR3V2gAt/7+8KFgCGQHjND6ibEVEcG+pFsOK5sU0s8mB1eEHRS3Up
 RH6dspR59n8h4bF0zdxfKqSoo65BGUyLxsAD4LViFP1eQUna4f7WhP4aOFQUVDVgZvEt
 WrjEn4kAqEC6z6DXbDau/Hvl6SOg7jMQPBYsb/tmPgfSM1saKM5jfngUP/PrircRf8sI
 ZaGpGHxKsu7bKolDZfKhpbucbeJ6LiPNzmtBFq2kvWL38X3oED6XjyMeYGq5HzrIEO3c
 6Gb3EXeJ2iS2ALq02FTlglse9/NEJrdVsHrz0CBUH9HHbmOeOeNYmRWGgA8ynTlExRNc
 LWkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyE8ZFeM9Faw97YNYCeNj4qmR2u//o1nfue/97Ze+0cppEafeLskANIfVZddrxwz7Csbqw8l2z5PKR@nongnu.org
X-Gm-Message-State: AOJu0YxwCAJ5TyCybwgSFLBkYA89ftDabpAdJCa1yMc9eS7L+XY+hder
 gsdX4hkTsSB9R/sDFORXsGHQLGNDYJV+XbtDvj74A7Bw+2Cy+Ac6dAelNFVi/1k=
X-Gm-Gg: ASbGncsgbVXgrne/ah+/ceHZlJ3g1JwokhL5XF6IXInqhk9Jt9UGx/TQJrwz89dofSq
 rSQ9nQrftEpcYgV4jqAxvW/X7tguf+mr/9a+3ofthFD04R4sM/1SXvmisMsYJ4QVq9GGAHA/o7Z
 UA6LZuVrLjYMGNVinHtM7VnN0+UE72mDR10wCDsJadPTiXSKxMcsTVHTtDp6oSiySKq3rYK6dlj
 RcFUiD4UiiIgb3aodn3BgaqyfWUcijI+LspQtHzs2RvRpUAcryokCxnQvzl0dkDpKSkDDDIzIAm
 R+Te0Zrh7EcO76Vmm0DkSLP0YP3k
X-Received: by 2002:a05:6871:80f:b0:29e:526a:eeef with SMTP id
 586e51a60fabf-29e88853236mr7884885fac.34.1733355458928; 
 Wed, 04 Dec 2024 15:37:38 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f569a698dsm64079fac.49.2024.12.04.15.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 15:37:38 -0800 (PST)
Message-ID: <0d698119-9ea0-4499-96ce-6a194d305c52@linaro.org>
Date: Wed, 4 Dec 2024 17:37:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] target/arm: Implement
 CPUClass::datapath_is_big_endian
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org
References: <20241204202602.58083-1-philmd@linaro.org>
 <20241204202602.58083-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241204202602.58083-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eSHGh4yZvAJp

On 12/4/24 14:25, Philippe Mathieu-Daudé wrote:
> arm_cpu_virtio_is_big_endian() already returns whether
> the data path is in big endian. Re-use that.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

No, this is wrong.

(1) arm_cpu_virtio_is_big_endian really *is* specific to virtio,
     and legacy virtio at that.  It changes based on the state of the cpu.

(2) The board-level stuff for which you appear to be intending to
     replace qemu_binary_is_bigendian(), for arm, is *always* little-endian,
     and has no relation to the state of the cpu.

(3) I thought you were on a better track plumbing endianness through
     properties on machine state.


r~

> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 6938161b954..3061b2ac18c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1132,7 +1132,7 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>   #endif
>   }
>   
> -static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
> +static bool arm_cpu_datapath_is_big_endian(CPUState *cs)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> @@ -2664,7 +2664,7 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
>       .asidx_from_attrs = arm_asidx_from_attrs,
>       .write_elf32_note = arm_cpu_write_elf32_note,
>       .write_elf64_note = arm_cpu_write_elf64_note,
> -    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
> +    .virtio_is_big_endian = arm_cpu_datapath_is_big_endian,
>       .legacy_vmsd = &vmstate_arm_cpu,
>   };
>   #endif
> @@ -2709,6 +2709,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>                                          &acc->parent_phases);
>   
>       cc->class_by_name = arm_cpu_class_by_name;
> +    cc->datapath_is_big_endian = arm_cpu_datapath_is_big_endian;
>       cc->has_work = arm_cpu_has_work;
>       cc->mmu_index = arm_cpu_mmu_index;
>       cc->dump_state = arm_cpu_dump_state;

