Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1051177lff;
        Fri, 6 Dec 2019 09:37:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbR2N14LCfvDop5cMuviN8Z+KmzJR7tQ7jyr+Qsm5UxXhYYRyQtlSef+9q54EsozU+XDD/
X-Received: by 2002:a05:6830:232c:: with SMTP id q12mr11437851otg.168.1575653822108;
        Fri, 06 Dec 2019 09:37:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575653822; cv=none;
        d=google.com; s=arc-20160816;
        b=hs/OIy8o9F28fAPXhY0O22Pq8nrzboCovp8vA54yqE/AgpkzLGW4/K2u9WENzlZFCJ
         2avPQDCZ6IZ1hS+YMtoeiU0hOt8+BVSz02c60ZXnr7vkYQjXNLtIOB4CxQQd+BexScFz
         4t1/7DOiokNkZZ9Qn+LCP5W/dqBiYHw4PosPl9Fz5ZYF5MsefEK5qda/9gJ47wU4AC+y
         vt01Lo6PcAF9A19PS4/PRDLWYDpYU6GDZuNJlMQLRSQVR74v1ymM0tldGGqcFLB781OZ
         OtlzeDyw/Ok2dH7xMGP+3Totm+X3ZH4uc5f0RTkrhdWbYNRnXhFg+wpj/blVTl49yNxu
         /y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=jQlUohbVClNOF24U9Gw7AxXeZL3vyNGEDJfapbzA03s=;
        b=m/4B0qlyRhA9cvpvSMNqgli/tsE2a4m/xIXKrYpMun6WZ7V9lIu6MvB9HquCVVVkaU
         2ihnT3Lv/FaPTCDxTRnWbW6qL2VUzMVDM/ir5U3BT7xBGmpseeec2ynoXsPelfK6lssp
         Mo1ur48+NnpFm3h1xkuETmKYZydd50R7cGXJAlmEdWg8+COBfSIUOSn/hhJxP6t2GnTZ
         iWEAnjPo0n3WqGfdMbIDU42LTqPikKE2yRMhCwWn2Fa0ovXifP4jUX55em7lV9qs8X7A
         iRJtW6U3hTOTq2cQbRuOqjmhUv/LKIFBBNxf9X8mgh2eiQ7/qoGr0bpaTYZ9pYnbAzO3
         8/pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l6si7140295oti.249.2019.12.06.09.37.01;
        Fri, 06 Dec 2019 09:37:02 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfLFRhB (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 6 Dec 2019 12:37:01 -0500
Received: from foss.arm.com ([217.140.110.172]:51704 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726312AbfLFRhA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 6 Dec 2019 12:37:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A52431B;
        Fri,  6 Dec 2019 09:37:00 -0800 (PST)
Received: from [10.1.196.63] (e123195-lin.cambridge.arm.com [10.1.196.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E51A03F52E;
        Fri,  6 Dec 2019 09:36:58 -0800 (PST)
Subject: Re: [kvm-unit-tests RFC 01/10] arm64: Provide read/write_sysreg_s
To:     Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
        maz@kernel.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org
References: <20191206172724.947-1-eric.auger@redhat.com>
 <20191206172724.947-2-eric.auger@redhat.com>
From:   Alexandru Elisei <alexandru.elisei@arm.com>
Message-ID: <efe2c571-1b69-5cc4-3505-24d092a9f985@arm.com>
Date:   Fri, 6 Dec 2019 17:36:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191206172724.947-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: KFpnbIUq8WXV

Hi,

On 12/6/19 5:27 PM, Eric Auger wrote:
> From: Andrew Jones <drjones@redhat.com>
>
> Sometimes we need to test access to system registers which are
> missing assembler mnemonics.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  lib/arm64/asm/sysreg.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/lib/arm64/asm/sysreg.h b/lib/arm64/asm/sysreg.h
> index a03830b..a45eebd 100644
> --- a/lib/arm64/asm/sysreg.h
> +++ b/lib/arm64/asm/sysreg.h
> @@ -38,6 +38,17 @@
>  	asm volatile("msr " xstr(r) ", %x0" : : "rZ" (__val));	\
>  } while (0)
>  
> +#define read_sysreg_s(r) ({					\
> +	u64 __val;						\
> +	asm volatile("mrs_s %0, " xstr(r) : "=r" (__val));	\
> +	__val;							\
> +})
> +
> +#define write_sysreg_s(v, r) do {				\
> +	u64 __val = (u64)v;					\
> +	asm volatile("msr_s " xstr(r) ", %x0" : : "rZ" (__val));\
> +} while (0)
> +
>  asm(
>  "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n"
>  "	.equ	.L__reg_num_x\\num, \\num\n"

That's exactly the code that I wrote for my EL2 series :)

Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>

Thanks,
Alex
