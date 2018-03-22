Received: by 10.28.71.155 with SMTP id m27csp194228wmi;
        Thu, 22 Mar 2018 03:57:54 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuQjTB6ZIqZ7kzgMwKBrSQjAos3xF50eqd3M8WU6bVUusnx3FmrZUC0bsB0fH90CTgnlGea
X-Received: by 10.55.187.199 with SMTP id l190mr34704282qkf.336.1521716274018;
        Thu, 22 Mar 2018 03:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521716274; cv=none;
        d=google.com; s=arc-20160816;
        b=vTU8n/TrFddKntF4MTIoQ59J6DOjtJVp5ipgr5HwZR9+qOClepJWL7+Rz5z6To10k2
         JFnWIzgEs/h3JmT3SyT+7vl66pIvpzyZKMVhdoeC6aIywZIfiv4B/WNTrCCcloBlYLs9
         +DU5KGD8ebtdVhqHQrIb2XpWrIlKLejIQGnDxQ4+NRj5H5UX9dIuxh8U7joy2uJjR/0x
         o05/aWEzjojAucFVE+fIFZO0eLRxYaRacp8W1K+iwuGepWXKJK5U6jdMjQSCNLGfrvSa
         iF3Xvqb2OSqu6N/H43ofFiG1qmAW9JCWwSsJqchJ90rH/X/y09N6cdA2xvqYugKKhgRN
         B49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=xD+UeHwYU8sZZlNwbCzYxAO/hlfZWmJFzs9E8tNP220=;
        b=dO1+jKx51YbnbwN7capNqSF88Cy8m+Q0KCsfnntnA4b5Te2qWCEkYHzn0SRdunDEpa
         XPld0tn/0jLhm7gHDQgofMvIIH4l/7MBHHBeqO+JH6OzaH31zoC8tJ84mOxRmbkMEZC2
         gWHH4M6i0/C25fkD4gwncGXBfSTYgKv8norgyKXK4SDdhoLHHaRlG9I2cjP29kNhmInF
         y+vKi1kFboo+7375xhevzhWelRjEnt5sfTS87+GgY4z8FgE0rmP3fLNGlNCR7WnRAb/Z
         V1qyBd/xMkEwqHOeVuj+3ii+uwAwy4NxuJyaI9MY2mXd/Z8DBl9cTQFmT1Drsg/Jpdep
         xdmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YV6Yh10i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7si6605422qtl.227.2018.03.22.03.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 03:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YV6Yh10i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyxur-0008OZ-Hg
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 06:57:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyxui-0008Ni-8g
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 06:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyxuh-0003DC-AP
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 06:57:44 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:43464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eyxuh-0003Cs-4r
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 06:57:43 -0400
Received: by mail-oi0-x243.google.com with SMTP id y27-v6so6940593oix.10
	for <qemu-arm@nongnu.org>; Thu, 22 Mar 2018 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xD+UeHwYU8sZZlNwbCzYxAO/hlfZWmJFzs9E8tNP220=;
	b=YV6Yh10isg/nZbh9kT160EbmheVgXzV4EYsnWp757wVhGlhorP26oUxbILOogOs5Tu
	/gGpDnbDybyCS+btcXNxzEfPr1FeHqhTqA6sRWhgN4eZUFVQ3eVPapfu4rfOZXvJNHpE
	ITfjuY7NswJYtLrHIKeINvvF8iCKjBaNdoiDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xD+UeHwYU8sZZlNwbCzYxAO/hlfZWmJFzs9E8tNP220=;
	b=aeHqK+clXrp6IzClVahxaUzvAZHGOmj5g9lAL8+fxAJtVrYaU3qHoRaBImB9IpcLmb
	cVJVu/xo/jDVrJSy4n8Z+SogbX2072yelNQtIbQ78dnUb63tWihUGcbJk93qke9U2wPH
	By247BXQHRTOsbgtlq7Y/Ktc45MMjDZeoWqSSlizFPVNbhsww1G+OpnB4ZTksALtYDCE
	FWfJEGlvFAreZzJzNfxcw3HNbJhqwe2Ncu3/TIEVsHGSTUfLlgzqbx5l64zH+aCjAi16
	Np3a04+qfdj7OIbH1etYMRDScpHoTE2qK60CwwTDU3CfKDC7CVs7op8rqXHwnsliXgG5
	xuzA==
X-Gm-Message-State: AElRT7F/hEGColQqd4xToBGRe8/gQ4su5tpcdn91XUpf5tVuD0DaUdsr
	ZwStKfo9B92sR7GnSl7mEJv3HrJozB8jftUI3b+akg==
X-Received: by 10.202.97.87 with SMTP id v84mr13994366oib.12.1521716262327;
	Thu, 22 Mar 2018 03:57:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 03:57:21
	-0700 (PDT)
In-Reply-To: <899fd41e-46cf-44e8-2df5-24d9e705e264@amsat.org>
References: <20180320134114.30418-1-peter.maydell@linaro.org>
	<20180320134114.30418-3-peter.maydell@linaro.org>
	<899fd41e-46cf-44e8-2df5-24d9e705e264@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 10:57:21 +0000
Message-ID: <CAFEAcA82jYWDPUK7d6o_gfgvUPb1O+3PbNxCnHAVbSAAKokBGA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH for-2.12 2/4] target/arm: Factor out code to
 calculate FSR for debug exceptions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RqWFVubZWeXN

On 21 March 2018 at 22:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> Hi Peter,
>
> This patch might be split in 2.

For a +27-10 patch, it doesn't really seem necessary.

> On 03/20/2018 02:41 PM, Peter Maydell wrote:
>> When a debug exception is taken to AArch32, it appears as a Prefetch
>> Abort, and the Instruction Fault Status Register (IFSR) must be set.
>> The IFSR has two possible formats, depending on whether LPAE is in
>
> ^ intro
>
>> use. Factor out the code in arm_debug_excp_handler() which picks
>> an FSR value into its own utility function, update it to use
>> arm_fi_to_lfsc() and arm_fi_to_sfsc() rather than hard-coded constants,
>
> ^ part 1 (refactor):
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>> and use the correct condition to select long or short format.
>
> ^ part 2 (fix) looks correct:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>>
>> In particular this fixes a bug where we could select the short
>> format because we're at EL0 and the EL1 translation regime is
>> not using LPAE, but then route the debug exception to EL2 because
>> of MDCR_EL2.TDE and hand EL2 the wrong format FSR.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/internals.h | 25 +++++++++++++++++++++++++
>>  target/arm/op_helper.c | 12 ++----------
>>  2 files changed, 27 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index 47cc224a46..8ce944b7a0 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -763,4 +763,29 @@ static inline bool regime_is_secure(CPUARMState *en=
v, ARMMMUIdx mmu_idx)
>>      }
>>  }
>>
>> +/* Return the FSR value for a debug exception (watchpoint, hardware
>> + * breakpoint or BKPT insn) targeting the specified exception level.
>> + */
>> +static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
>> +{
>> +    ARMMMUFaultInfo fi =3D { .type =3D ARMFault_Debug };
>> +    int target_el =3D arm_debug_target_el(env);
>> +    bool using_lpae =3D false;
>> +
>> +    if (target_el =3D=3D 2 || arm_el_is_aa64(env, target_el)) {
>> +        using_lpae =3D true;
>> +    } else {
>> +        if (arm_feature(env, ARM_FEATURE_LPAE) &&
>> +            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
>> +            using_lpae =3D true;
>> +        }
>> +    }
>
> This looks pretty similar to regime_using_lpae_format() but for
> ARMFault_Debug.

Yeah, it's basically similar logic.

I'm a bit confused overall -- are you giving a reviewed-by for
this patch, or do you want changes?

thanks
-- PMM
