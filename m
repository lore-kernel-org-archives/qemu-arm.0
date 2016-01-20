Received: by 10.25.159.19 with SMTP id i19csp3259202lfe;
        Wed, 20 Jan 2016 09:54:06 -0800 (PST)
X-Received: by 10.55.78.198 with SMTP id c189mr47271299qkb.95.1453312446692;
        Wed, 20 Jan 2016 09:54:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u144si44850212qka.104.2016.01.20.09.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 09:54:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLwxK-00088G-9k
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 12:54:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aLwxH-00087z-OW
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 12:54:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aLwxD-0002b3-LW
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 12:54:03 -0500
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f]:34890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aLwxD-0002ax-D2; Wed, 20 Jan 2016 12:53:59 -0500
Received: by mail-lf0-x22f.google.com with SMTP id c192so10995728lfe.2;
	Wed, 20 Jan 2016 09:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=bwpu4NaO00BLvPYPO7jaRD8jE/wvOqP7HYQZkh9s2gg=;
	b=ef/up3pYCiCvoMNaNxaHvpgqo6Cv/blZall52SmHqX2tVlG2SvLs7BM3fkeDLP8O60
	B4T6+nvzTFjMzcSteadYmtnq4KIS4tSjX2XZkwkW50HY9QRvUWnsYfpGHyxK3MBeCNAF
	yr0lA7299TLzcOqCulHOAnpFa4vGiS4c0u+U5d5adI/Ronjkyl1YGrNLCHw2VQOTK0ch
	T/8dv8sC2boytzrS/NwLkW+c3zHe2mCjc1663xLhfjz5DNnNg1rkjXhrxVq2fOD6QChH
	ZHDQGxEit7K1IDKAZkLiFfftZu05m0qZ4TnoFR5iAj0eFIEp7RB3670zuz4UeIBoLIAe
	XJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=bwpu4NaO00BLvPYPO7jaRD8jE/wvOqP7HYQZkh9s2gg=;
	b=C4LPgx95JY5YttdFB0S3M2Rq6IasFimyRzUFTbV3GnqmdoPAEW+Kq+SO/OmCvv1f4z
	/ie5xsNtZ5y0OJ/sDfFzqeo6r2XkNqiSq9ocOmfMhM+CO2vbpfndl15Z1iQC6DzC4xcd
	BCeyi012y8jivAq4Azc9I7IKPDMyyPlElpz5Slud5zkCK1Dtc3rlegmYxIaJ02te9dMY
	jE0BM3l4r+P6ASeeRAjcTuhGsp/vc0FF5RVpvd9E8lBLGvcG9r76TYEfTzfW1S6j6hyN
	aWOLb2SA4HJOdq8dXxj8wIL77ePoE2ywBwpGHFWqAZr/dzmEdJFPni7nqZIbO/xdi15m
	FGPA==
X-Gm-Message-State: ALoCoQlDUlfR+FFqt6nLG1ghGt0nnzYNvrLuSp+hJQ5o+wiRlnMVBfIlRcRDDT3PhD6SDrDdVhVBxnIasC7R1+GqofBpFdA8Bg==
X-Received: by 10.25.158.147 with SMTP id h141mr13770320lfe.147.1453312438445; 
	Wed, 20 Jan 2016 09:53:58 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-155.2com.net.
	[46.188.121.155]) by smtp.googlemail.com with ESMTPSA id
	c192sm4848019lfb.16.2016.01.20.09.53.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jan 2016 09:53:56 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <1453132414-8127-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9CaPT11M=Jdw8zy3XMfnUbm=psgRx+qmxYzG_96bg=Bw@mail.gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <569FC9B3.2060607@gmail.com>
Date: Wed, 20 Jan 2016 20:53:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CaPT11M=Jdw8zy3XMfnUbm=psgRx+qmxYzG_96bg=Bw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22f
Cc: qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Implement
 FPEXC32_EL2 system register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o1WzoV2NN/FY

On 18.01.2016 19:05, Peter Maydell wrote:
> Oops, got the qemu-arm email address wrong...
>
> On 18 January 2016 at 15:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The AArch64 FPEXC32_EL2 system register is visible at EL2 and EL3,
>> and allows those exception levels to read and write the FPEXC
>> register for a lower exception level that is using AArch32.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

>> ---
>> ARM Trusted Firmware expects this to exist (as does your average
>> hypervisor, I expect).
>>
>>  target-arm/helper.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 196c111..e8ede3f 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -2890,6 +2890,17 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>      tlb_flush(CPU(cpu), 1);
>>  }
>>
>> +static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri)
>> +{
>> +    if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
>> +        return CP_ACCESS_TRAP_EL2;
>> +    }
>> +    if (env->cp15.cptr_el[3] & CPTR_TFP) {
>> +        return CP_ACCESS_TRAP_EL3;
>> +    }
>> +    return CP_ACCESS_OK;
>> +}
>> +
>>  static const ARMCPRegInfo v8_cp_reginfo[] = {
>>      /* Minimal set of EL0-visible registers. This will need to be expanded
>>       * significantly for system emulation of AArch64 CPUs.
>> @@ -3150,6 +3161,11 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>>        .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
>>        .type = ARM_CP_NO_RAW,
>>        .access = PL1_RW, .readfn = spsel_read, .writefn = spsel_write },
>> +    { .name = "FPEXC32_EL2", .state = ARM_CP_STATE_AA64,
>> +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 3, .opc2 = 0,
>> +      .type = ARM_CP_ALIAS,
>> +      .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]),
>> +      .access = PL2_RW, .accessfn = fpexc32_access },
>>      REGINFO_SENTINEL
>>  };
>>
>> --
>> 1.9.1
>>
> thanks
> -- PMM
>

