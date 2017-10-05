Received: by 10.223.197.9 with SMTP id q9csp136547wrf;
        Wed, 4 Oct 2017 20:30:05 -0700 (PDT)
X-Received: by 10.233.223.66 with SMTP id t63mr29568605qkf.244.1507174205739;
        Wed, 04 Oct 2017 20:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507174205; cv=none;
        d=google.com; s=arc-20160816;
        b=ilLhCw7U9eqrv0rxd1jxYqnte46O2VmS9TO8igsLypR6V2YuTNS5hHnMllEsvU7bCl
         pw9711X0fRgKOZnbDkZmTUzj8GxvysF+2qxsWyxRDq4sS0yGt7yQ+wI0PMdDKmK2TxgW
         VQ6YQ6QfmDadyWnIj4fVQajdThPvFJPXKZQXBYEPcrnhynPe8xeBj/t6F9soIjfoMdF7
         nCckg+jMaudm1rGtLq0gJ8xni0E1ym+JhwFrEfjeuz2ISWmXbgoiWzJgDJtajekSBqYr
         hPKbaFxay7//AFAIBqon7kug+pMBr0xmL7/9YlNCSYNBmCc5q3eIFSQOayXCN+96TWet
         URmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=s29yJ9dwBn8mmYVoqF2awmhxX6HfkVoMCpIxQCNA1jo=;
        b=crv0dOmDpcjz6Z/wKcRIuzUlnne81rMwNMALgJ8Ua4IkjCjK/VO2kkPZO4thkkAYxu
         S7yKp88146j2PFc+l3KYWc1SWlvoNI31Qq7D3GqQpFFHSomQfTvYY0rPTLYpIWFeqgwC
         efd6pWZBamdqTB57D0bGvOR4BfwOa8nX5rdV4X99Y3LRkAgftgKnF3H6OTWhmycyzGD7
         KauWysmLY1Y5vGUfhstI8+V2WLX3Icw7PSEpUdKAbvWxQWFE1jJ3LG64HdqzYJ/uNwmK
         zcyXKdrTcmm5T0jvTiE3/FvIeVSaPWsbk8GSpMqosWRPRi8HCAwwWdKv95+t4oOckCEW
         Tc+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=piSn7CGF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o90si1049919qtd.463.2017.10.04.20.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 20:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=piSn7CGF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzwrN-0005vL-8l
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 23:30:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzwqY-0005aQ-7h
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 23:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzwqV-00080Y-5U
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 23:29:14 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzwqU-0007zo-WE; Wed, 04 Oct 2017 23:29:11 -0400
Received: by mail-qk0-x244.google.com with SMTP id z12so6110765qkb.0;
	Wed, 04 Oct 2017 20:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=s29yJ9dwBn8mmYVoqF2awmhxX6HfkVoMCpIxQCNA1jo=;
	b=piSn7CGFdNQeH2YWZ5E7YsOSVo/FHUJ+v8jiBmAEewI9ad266cHcABxKT8fjcymBu1
	S1FhlPRB/FksdQkqggZcs3MbejJ32MDL6eaxipNs3URF2EYgDPVUaqGMjgj8FE+Eui/j
	bVRzyLbx4zbsYhgylqr2ilFDrAUAlYGibbRbu1TK13vBKs9IMdjlP9yGD6ijNaBT+ORv
	qTyY34f3MSayDNh7rncCoZSPbfRONjZeDqgzzsGeZxfYNtIvjpsdgC4LzFI3ztS2eWGU
	is35FVzNFdkfBuZ0ALUR0ZLidLdWHHCbZJaEI0gyo5cb7POZ2DJG2H54K8djllJXyftd
	dgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=s29yJ9dwBn8mmYVoqF2awmhxX6HfkVoMCpIxQCNA1jo=;
	b=adaR04gopDK3z2KgUDamol+sKZsFRgV/sJYUzbOUdO7tx7o9g6VNySfl2vJrB6CPmT
	kbViOSPJLn+rQPnQTCjjW/C22c4tOgC3JlPn3qlUkcuYNpbZ1HLHSXF9UsGoA1AxqEkN
	QskL6hxvwAwcsBH9Skw/NssRfRLhp/OFZ4pZRh/n7u8IB+OHYEy/qhOfRQ1JLDqdIWQE
	qtEwvt7KIlTo1HtSL0vsR11B5JddaEB8xO42YaA8uCdJ9Dys9QqGqEl6w1qN9EJ5KVrS
	QSt8yJZUkQxOZd+9FrG2gspFRw6xSa3CojnpaR/UZ43294ExnPHdaKBvoIYMUhnx7oQZ
	6Bwg==
X-Gm-Message-State: AMCzsaW9mf/f3E357xMrHuG+SdJKFTJBezBcScWi2XM/0GKUMbmlEKup
	7/egSF19+xpaEktQEti3vRQ=
X-Google-Smtp-Source: AOwi7QCTdjnQO/vGS5zgnMwemri29TfCf7gvRgGfgAWKGBDzCKIrAldGyKLq4OS3F1LkEggDVG6ivg==
X-Received: by 10.55.33.150 with SMTP id f22mr26458372qki.207.1507174150334;
	Wed, 04 Oct 2017 20:29:10 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u32sm11301197qte.25.2017.10.04.20.29.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 20:29:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-17-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <88468bf1-594d-9b2e-1dbe-669073e42e76@amsat.org>
Date: Thu, 5 Oct 2017 00:29:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-17-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 16/20] target/arm: Factor out
 "get mmuidx for specified security state"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YK87yhPBX/P8

On 09/22/2017 12:00 PM, Peter Maydell wrote:
> For the SG instruction and secure function return we are going
> to want to do memory accesses using the MMU index of the CPU
> in secure state, even though the CPU is currently in non-secure
> state. Write arm_v7m_mmu_idx_for_secstate() to do this job,
> and use it in cpu_mmu_index().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.h | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 70c1f85..89d49cd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2329,23 +2329,33 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
>      }
>  }
>  
> +/* Return the MMU index for a v7M CPU in the specified security state */
> +static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
> +                                                     bool secstate)
> +{
> +    int el = arm_current_el(env);
> +    ARMMMUIdx mmu_idx;
> +
> +    if (el == 0) {
> +        mmu_idx = secstate ? ARMMMUIdx_MSUser : ARMMMUIdx_MUser;
> +    } else {
> +        mmu_idx = secstate ? ARMMMUIdx_MSPriv : ARMMMUIdx_MPriv;
> +    }
> +
> +    if (armv7m_nvic_neg_prio_requested(env->nvic, secstate)) {
> +        mmu_idx = secstate ? ARMMMUIdx_MSNegPri : ARMMMUIdx_MNegPri;
> +    }
> +
> +    return mmu_idx;
> +}
> +
>  /* Determine the current mmu_idx to use for normal loads/stores */
>  static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
>  {
>      int el = arm_current_el(env);
>  
>      if (arm_feature(env, ARM_FEATURE_M)) {
> -        ARMMMUIdx mmu_idx;
> -
> -        if (el == 0) {
> -            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSUser : ARMMMUIdx_MUser;
> -        } else {
> -            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSPriv : ARMMMUIdx_MPriv;
> -        }
> -
> -        if (armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure)) {
> -            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSNegPri : ARMMMUIdx_MNegPri;
> -        }
> +        ARMMMUIdx mmu_idx = arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
>  
>          return arm_to_core_mmu_idx(mmu_idx);
>      }
> 
