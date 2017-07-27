Received: by 10.25.44.15 with SMTP id s15csp2602001lfs;
        Thu, 27 Jul 2017 17:00:14 -0700 (PDT)
X-Received: by 10.237.37.136 with SMTP id x8mr7684249qtc.326.1501200014668;
        Thu, 27 Jul 2017 17:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501200014; cv=none;
        d=google.com; s=arc-20160816;
        b=BmeI0L0xQ9j6ZAgQ+3L0QmhjasQXYOpqVDnpKWacyZj8Xz+hSorC48rYHIGIELvfnV
         619LdskeZ9B9j/5t85mL0IWmQstDcwRwK7Wz05hRtTauUeKh5+t3LYRejFmk+yGTUvSv
         At7Gq8fpeYjW18nnkkEZN967jACVQn5+u7JLA48QLKOwvrlXdQ4hLn6j9JzhfECH0CUT
         n9CWS7D2dCO1M7Ym6rW2XNoEa7jqVr8eQV2X6Ersc1LJUWl9zU/dS8/nNF7VCCea70Uh
         l17z0iBdqUA+XPZ5vfgUAX7lB445KJ3PC11lSvJM3H3N2WIMZO2sBe+MBnLHZBVx2QWs
         Olqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=GHULNTvMgEP/66rboGueMM2dz1wg5bMAxIsoT4E6kYY=;
        b=b8xC5pGew0KAu2RxmmU+IkLaQ50U3bFriGn1BadixeyePaGEQ4lnNCL8qFX+74TSlS
         rbjh2U5mRxeSLRfHR+NMP6G9/zpcegHLoDj5/vW+qrqn0w/fVZPcL9ocS5+SeuCpnfkP
         5qKb5iSrauggls33u9Chjnb3rZHW/WTeDbojllb0sHNjOGvXBrzFzxJ7/hrxZt5hgvhq
         WESsLaw5oQrLcvZ2/CDFOTD6aHPKr0bB0nu8jkAIg995r7sQugPGvt+EQfv37oMmuKnX
         WlHCYz4Em5GJR9Gq71pEwVZzxoo1ewOp4ZdVLnt6L0MO7g03WvsLZ7Ej9dDI/DfEVsNC
         00YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=fXEsw5/a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g8si16403552qtb.221.2017.07.27.17.00.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 17:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=fXEsw5/a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dashP-0002nJ-SQ
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 20:00:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dashL-0002kK-8R
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 20:00:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dashK-0002cC-Fj
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 20:00:07 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36652)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dashE-0002UR-7E; Thu, 27 Jul 2017 20:00:00 -0400
Received: by mail-qt0-x242.google.com with SMTP id c15so6105332qta.3;
	Thu, 27 Jul 2017 16:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=GHULNTvMgEP/66rboGueMM2dz1wg5bMAxIsoT4E6kYY=;
	b=fXEsw5/aTlpfbnbNODiFU7WaXZI3V2vgMg5KYtRK32QIdpeP4dlLimSsCR3V+IARgR
	gPB86XsgPPGoCfusg8ffxjp0i4PgglomQ8k3iXjU/eJISFLJHE/L0wd2edWdAnA62RVt
	NDbMzNSr8z1wpP/u0v2KTDJB4xxRsn0fKv/D0hzdPqRY/Rt/v4eGqVfy3NWgpUIvZBDI
	AdAJDu1XmGNJe6dXYiulAnpb6Eyd60UuXVb7zq7r1PkuJ5XknB7XPSvw+4FGt4zWcuyR
	VvKWLVKEjRnh0AXhWlXSgEivcwtoAQmAUE6RUUyxqtFfpMjw4NYbgPZx5slkD2IlqD5q
	j4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GHULNTvMgEP/66rboGueMM2dz1wg5bMAxIsoT4E6kYY=;
	b=mGP/IiDNgyUY0EUgZiDbfD4szDmALEGnJKdVzIw6REoe4sVM033T4HFdlC+twq1U7Z
	gKlruSlHuDAUd41BM6OSqV7TYXn54xBl0hMJJz/FgWlQChTG9sHJsUCNgkezzma0K0+t
	UELYEcoOs7Nb3h0HLonG5HyPA9pv+TS65UNlq4SJyzORXw+z+OEpR2QrKGNbVaZM5MXJ
	9xjRElarchvZya8LIulBnFl+5kySZhX1p+6+hDxDz8oWLUPE+vY9JUIhnwa+lQux7XCq
	p1Fb8yFlegS73UdhAHcrVgED6j/zMI8ufZyB+iVYJDhyZhnOPsKTL60/YclNBhvDbldj
	kVxg==
X-Gm-Message-State: AIVw111GCwznOmLJDyw07FFxvsAhSVfqh5Z5RA9mPWV2AmWN9KBvBRAA
	RHghmLczI2yjIQ==
X-Received: by 10.200.56.48 with SMTP id q45mr8021442qtb.36.1501199999288;
	Thu, 27 Jul 2017 16:59:59 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	u3sm15109830qth.95.2017.07.27.16.59.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 16:59:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7834a272-4106-f076-a62b-9cff45f4ae42@amsat.org>
Date: Thu, 27 Jul 2017 20:59:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501153150-19984-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH for-2.10 2/5] target/arm: Don't allow guest
 to make System space executable for M profile
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IwWkr9SJejAG

Hi Peter,

On 07/27/2017 07:59 AM, Peter Maydell wrote:
> For an M profile v7PMSA, the system space (0xe0000000 - 0xffffffff) can
> never be executable, even if the guest tries to set the MPU registers
> up that way. Enforce this restriction.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ceef225..169c361 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8251,6 +8251,14 @@ static inline bool is_ppb_region(CPUARMState *env, uint32_t address)
>           extract32(address, 20, 12) == 0xe00;
>   }
>   

I wonder if these should renamed pmsav7_is_ppb_region() and 
pmsav7_is_system_region().

> +static inline bool is_system_region(CPUARMState *env, uint32_t address)
> +{
> +    /* True if address is in the M profile system region
> +     * 0xe0000000 - 0xffffffff
> +     */
> +    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
> +}
> +
>   static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>                                    int access_type, ARMMMUIdx mmu_idx,
>                                    hwaddr *phys_ptr, int *prot, uint32_t *fsr)
> @@ -8354,6 +8362,12 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>               get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
>           } else { /* a MPU hit! */
>               uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);

Maybe names access_perms/execute_never are easier to read..

> +            uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
> +

clear MemManage exceptions:

                *fsr &= ~0xff;

> +            if (is_system_region(env, address)) {
> +                /* System space is always execute never */
> +                xn = 1;

                } else {
                    xn = extract32(env->pmsav7.dracr[n], 12, 1);

> +            }
>   
>               if (is_user) { /* User mode AP bit decoding */
>                   switch (ap) {
> @@ -8394,7 +8408,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>               }
>   
>               /* execute never */
> -            if (env->pmsav7.dracr[n] & (1 << 12)) {
> +            if (xn) {
>                   *prot &= ~PAGE_EXEC;

and here we now can set eXecuteNever violation:

		    *fsr |= R_V7M_CFSR_IACCVIOL_MASK;

>               }
>           }
> 
     }
     *fsr = 0x00d; /* Permission fault */

I don't understand this mask, I don't have bit [2] defined in my 
datashit, maybe it was expected to turn on exception Entry/Return which 
I have defined as bits 4 and 3 respectively, so I'd rather see here:

     *fsr |= R_V7M_CFSR_MUNSTKERR_MASK | R_V7M_CFSR_MSTKERR_MASK;

What do you think?

Regards,

Phil.
