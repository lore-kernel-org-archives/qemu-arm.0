Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp658700ejt;
        Sun, 26 Nov 2023 16:12:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+w3Jd3JSKvlflvNWLiEiwIRyrjRgXpZHcTMic6bewpCJ7RspzcIAacUTFW3PS/t3yT468
X-Received: by 2002:a05:620a:1722:b0:77d:a688:543d with SMTP id az34-20020a05620a172200b0077da688543dmr3072479qkb.48.1701043950047;
        Sun, 26 Nov 2023 16:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701043950; cv=none;
        d=google.com; s=arc-20160816;
        b=dsoE1NiuapmmqESSu3EaE4O0CQvAutkxVKXrDljAWRfVOlRqg7f2RtTXGhQ7os60Rh
         s3FFI/IFBPabar/NGDXpQK0AUGynXaxAObN9mGdSDo5YHpsghuTz5LtvY45vYEFlAbtz
         w/yourFjQdwbqgfZf06AvkD2k8TQda6iX6R+lBwetC8xqabkp/yy2+APi4wY0EMiLNni
         xDv++bFgMrOsQYsAs1upc6Px/RYzG7IfvSY/DUuovAnlxHchKMBvRALeYA+70kBqhG2l
         BpS4rMj94BL++ImOlGBUldmWCPVVVxMsaIA0Xdep7DrbHdUBejrbr1u3V2JGBnf/cK2y
         qI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Mj73oNwZImEBHZ5ukMSdx7Sj7ioh2bLGukWSyDfwr2I=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=Zp5lCgMHLxCYFO0AQTMbX135qpxQ/6IdV6PLv01xnG6NaQtSyvBjrg8OLoWCM34Kw/
         5aauE8rcTdc9ppwhpPu7wIYauCcqnBgEwEzp3HG7C/YXvBHycKLl/ZeSWUq+99YUiksg
         kuct9FUmydwKUtwmexwbxjZJJfd8AriaIL8WxcHLSG2Mpvd0B1HzYKe+zBJEXsRGEPcm
         QrHrI0dLnuUKHzAx7FJXSMvgKIgV1aNbH1BPiOkcJjzjYG6zijKlqwtbAUk3RvaDTdxS
         r+4dnO367RtykL837EAailnjCe3LPbY+HCxBPpO9QAfl7EutaXETskyF6VP+xZkYCDj1
         srYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Caw0xZ+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a05620a090900b007759a519e0dsi7805020qkv.73.2023.11.26.16.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 16:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Caw0xZ+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7PEL-0000kX-LB; Sun, 26 Nov 2023 19:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PEH-0000jW-Vi
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PEG-0006tT-2T
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701043918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mj73oNwZImEBHZ5ukMSdx7Sj7ioh2bLGukWSyDfwr2I=;
 b=Caw0xZ+ffBcmmuTpODNk9TEg1R7BQ8YI0ADMAHoMBjW2MF+HH601z1wyla26qdkY3y0dg0
 it0Z/l6M4EEQNeOyXozjUB5PTlStTPJ3XLfMpZtcEt7uaMy1b+KWtNed4fvSdvCDIpsz0q
 8Sb2r6ZBk33GpRah0TLv39XOxgepmE8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-F_kc6RCSMPGBymlGfYTORQ-1; Sun, 26 Nov 2023 19:11:57 -0500
X-MC-Unique: F_kc6RCSMPGBymlGfYTORQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1cfa28ab0f3so30785725ad.2
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 16:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701043916; x=1701648716;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mj73oNwZImEBHZ5ukMSdx7Sj7ioh2bLGukWSyDfwr2I=;
 b=I/Hd04KFImr0ZgbuCkk+l5ce8qq3q79BG0gC3iHVjmuL0+8kP02ha1RDmVLS3fbx3A
 jn9ro02kYVLm1zKYT/JVYNx4/NazE/WNRDYGZKedJGEgKFMER922GIoH2QDWHqNw3y57
 +rNKVk28GVTr/B7wX8GfwWY1/0QQDItxY+V/Prczt260UF1frv6T1L6Dh+x5xXhT+Jc2
 J6IPizxPDjTfOPzUQb1QXyKZlBzQd92bhUkonZ7PY8vpbhH9TYLf4NBNo28sH44XJMre
 MNLaXRT1ukadhOxNCIxQLYJTrRy9ob3WAlG+hEq3MrWuPP6f9vlxM6aOMk1egq1BlsR9
 RziA==
X-Gm-Message-State: AOJu0Yx2DutyMDzwX+74RmeryTSXysrtwHCjf7Wrg6STB1cDjnBluuhe
 c7YDb/BWFI04OxHBgua2sLHPUZ6Yp5qCYowVX7iVfAhRakUMN4nKVDFMTLsbo7g18vSTCtUg0cs
 yws+PnNJLwG9x
X-Received: by 2002:a17:903:183:b0:1cf:68a3:d908 with SMTP id
 z3-20020a170903018300b001cf68a3d908mr11041065plg.24.1701043916219; 
 Sun, 26 Nov 2023 16:11:56 -0800 (PST)
X-Received: by 2002:a17:903:183:b0:1cf:68a3:d908 with SMTP id
 z3-20020a170903018300b001cf68a3d908mr11041054plg.24.1701043915882; 
 Sun, 26 Nov 2023 16:11:55 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709027fce00b001cf5d1c85cdsm7100509plb.218.2023.11.26.16.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 16:11:55 -0800 (PST)
Message-ID: <04ea22ec-1b3c-4509-8874-d0c92d50b843@redhat.com>
Date: Mon, 27 Nov 2023 11:11:52 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/21] target/arm/kvm: Move
 kvm_arm_reg_syncs_via_cpreg_list and unexport
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-14-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-14-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: jAF9B4KUqkTx

Hi Richard,

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 10 ----------
>   target/arm/kvm.c     | 23 +++++++++++++++++++++++
>   target/arm/kvm64.c   | 15 ---------------
>   3 files changed, 23 insertions(+), 25 deletions(-)
> 

With the following nits addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 2755ee8366..1043123cc7 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -77,16 +77,6 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
>    */
>   int kvm_arm_init_cpreg_list(ARMCPU *cpu);
>   
> -/**
> - * kvm_arm_reg_syncs_via_cpreg_list:
> - * @regidx: KVM register index
> - *
> - * Return true if this KVM register should be synchronized via the
> - * cpreg list of arbitrary system registers, false if it is synchronized
> - * by hand using code in kvm_arch_get/put_registers().
> - */
> -bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx);
> -
>   /**
>    * write_list_to_kvmstate:
>    * @cpu: ARMCPU
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index dadc3fd755..9bca6baf35 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -740,6 +740,29 @@ static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
>       return &cpu->cpreg_values[res - cpu->cpreg_indexes];
>   }
>   
> +/**
> + * kvm_arm_reg_syncs_via_cpreg_list:
> + * @regidx: KVM register index
> + *
> + * Return true if this KVM register should be synchronized via the
> + * cpreg list of arbitrary system registers, false if it is synchronized
> + * by hand using code in kvm_arch_get/put_registers().
> + */
> +static bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
> +{
> +    /* Return true if the regidx is a register we should synchronize
> +     * via the cpreg_tuples array (ie is not a core or sve reg that
> +     * we sync by hand in kvm_arch_get/put_registers())
> +     */

The comments are fully or partially duplicate to the function's description above.
I think the comments here can be dropped or combined to the function's descrption
above.

> +    switch (regidx & KVM_REG_ARM_COPROC_MASK) {
> +    case KVM_REG_ARM_CORE:
> +    case KVM_REG_ARM64_SVE:
> +        return false;
> +    default:
> +        return true;
> +    }
> +}
> +
>   /* Initialize the ARMCPU cpreg list according to the kernel's
>    * definition of what CPU registers it knows about (and throw away
>    * the previous TCG-created cpreg list).
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index a184cca4dc..52c0a6d3af 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -346,21 +346,6 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
>       return 0;
>   }
>   
> -bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
> -{
> -    /* Return true if the regidx is a register we should synchronize
> -     * via the cpreg_tuples array (ie is not a core or sve reg that
> -     * we sync by hand in kvm_arch_get/put_registers())
> -     */
> -    switch (regidx & KVM_REG_ARM_COPROC_MASK) {
> -    case KVM_REG_ARM_CORE:
> -    case KVM_REG_ARM64_SVE:
> -        return false;
> -    default:
> -        return true;
> -    }
> -}
> -
>   /* Callers must hold the iothread mutex lock */
>   static void kvm_inject_arm_sea(CPUState *c)
>   {

Thanks,
Gavin

