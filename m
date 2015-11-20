Received: by 10.182.158.201 with SMTP id ww9csp537311obb;
        Fri, 20 Nov 2015 07:12:14 -0800 (PST)
X-Received: by 10.68.244.199 with SMTP id xi7mr19964516pbc.87.1448032334744;
        Fri, 20 Nov 2015 07:12:14 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id gy9si20144367pbc.83.2015.11.20.07.12.14;
        Fri, 20 Nov 2015 07:12:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dkim=neutral (body hash did not verify) header.i=@linaro-org.20150623.gappssmtp.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1163035AbbKTPMM (ORCPT <rfc822;riku.voipio@linaro.org>
	+ 6 others); Fri, 20 Nov 2015 10:12:12 -0500
Received: from mail-qk0-f181.google.com ([209.85.220.181]:35996 "EHLO
	mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1163031AbbKTPMK convert rfc822-to-8bit (ORCPT
	<rfc822;kvm@vger.kernel.org>); Fri, 20 Nov 2015 10:12:10 -0500
Received: by qkda6 with SMTP id a6so37260286qkd.3
        for <kvm@vger.kernel.org>; Fri, 20 Nov 2015 07:12:10 -0800 (PST)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=OW5N+CgsoEtt+qMURjxwBFyxpM/spBcvoTM39h80bms=;
        b=HfXlOJsNDcahaqtCCdWongVhWBMnD5mNxgxjFhlBnLynfu7+C0fMwesabnCDSt1nGK
         ScOgyPNZOCCZCu5LbBIpTJ3yzyGUHAdN1ZtOs6dbm5C/clMLso32Ulqy9Ux44TqsE2+U
         pyZBRIxR+3oE8vG5uU+vGn71P/PLOSGsIOlvJraIrfUYLqYKNdOEd77qSnRIElYqk8kB
         VoSZyqUXIOlTL12gbd3s21DJp8QFCip5usHf66vbqgJ+xZfCu6iKFKQuUz8jrX15QRBF
         qtUrTtW55zxkAmTE81jzKpZuvTb+u06+hAZJZexaUB4NKyBni9IXQFgULt27WA51kLWR
         6Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=OW5N+CgsoEtt+qMURjxwBFyxpM/spBcvoTM39h80bms=;
        b=RVN1QhxHAZnENXa//UJZ2FJz7/R2SRRWC8Ya70F+Agy0ewRSGct1Hga97XPaRLPVhJ
         8satlZgifmyczvlmbYfbvJ44yfLzhlXz4IkPiSH0tJQ8CE3aAMWp/T1l2u2FIttBRJKu
         XmocXNtK2aJ7pdd+lvCGd7z/GQwrNfJI2SHqDHpb3j8RTo+7Zcr5rO19P3Xv7VyrO6es
         yDcTtMoRoQLuHw0BLDLwd4GlFqrtNINq9ieNV0MzV9eCP/w1IYe46wSey/65j2zYXUKU
         uMWCQVG1hR7twwKyUZGYHbShpNfe27nMT9uy9YD7xTvkD6uKVnYE7wWwdctuZ5EzpNsP
         +zdg==
X-Gm-Message-State: ALoCoQludMkcCaXyZCn1h06oCAUFMFE8oDmugCowd783vJCsTEOE7pk5ciLlaHohH1JOm+ZcAY21
X-Received: by 10.129.157.70 with SMTP id u67mr13569908ywg.160.1448032329875;
 Fri, 20 Nov 2015 07:12:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 07:11:50 -0800 (PST)
In-Reply-To: <CAFEAcA-u3ACj=99NkTRsEL=2KA6LETeAmEf+5Vo03gz0GMh5Zw@mail.gmail.com>
References: <1447345251-22625-1-git-send-email-alex.bennee@linaro.org>
 <1447345251-22625-2-git-send-email-alex.bennee@linaro.org> <CAFEAcA-u3ACj=99NkTRsEL=2KA6LETeAmEf+5Vo03gz0GMh5Zw@mail.gmail.com>
From:	Peter Maydell <peter.maydell@linaro.org>
Date:	Fri, 20 Nov 2015 15:11:50 +0000
Message-ID: <CAFEAcA8bdjYaDiCParJt8jVe+720+tzh4CuKD2YGfHeo2UJNcQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/6] target-arm: kvm64 - introduce kvm_arm_init_debug()
To:	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc:	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Zhichao Huang <zhichao.huang@linaro.org>,
	kvm-devel <kvm@vger.kernel.org>,
	arm-mail-list <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	Marc Zyngier <marc.zyngier@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: Ysp5StMAIeyH

On 20 November 2015 at 15:05, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 November 2015 at 16:20, Alex Bennée <alex.bennee@linaro.org> wrote:
>> As we haven't always had guest debug support we need to probe for it.
>> Additionally we don't do this in the start-up capability code so we
>> don't fall over on old kernels.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target-arm/kvm64.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
>> index ceebfeb..d087794 100644
>> --- a/target-arm/kvm64.c
>> +++ b/target-arm/kvm64.c
>> @@ -25,6 +25,22 @@
>>  #include "internals.h"
>>  #include "hw/arm/arm.h"
>>
>> +static bool have_guest_debug;
>> +
>> +/**
>> + * kvm_arm_init_debug()
>> + * @cs: CPUState
>> + *
>> + * Check for guest debug capabilities.
>> + *
>> + */
>> +static void kvm_arm_init_debug(CPUState *cs)
>> +{
>> +    have_guest_debug = kvm_check_extension(cs->kvm_state,
>> +                                           KVM_CAP_SET_GUEST_DEBUG);
>> +    return;
>> +}
>> +
>>  static inline void set_feature(uint64_t *features, int feature)
>>  {
>>      *features |= 1ULL << feature;
>> @@ -121,6 +137,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>      }
>>      cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>>
>> +    kvm_arm_init_debug(cs);
>> +
>>      return kvm_arm_init_cpreg_list(cpu);
>>  }
>
> I assume in practice the kernel guarantees that either all
> CPUs have the SET_GUEST_DEBUG cap, or none do :-)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

...except I've just noticed that nothing else in this patchset
ever reads the have_guest_debug bool we just set, so what is
the purpose of this patch?

thanks
-- PMM
