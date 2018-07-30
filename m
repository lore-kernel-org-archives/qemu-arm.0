Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4047246wru;
        Mon, 30 Jul 2018 10:51:59 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdGKWK8wluhe7Ju+xyyn/nHWT+SxS5uZogoYBOimRk3Fq7EVmdkRCbC16MljT71Z6b90iev
X-Received: by 2002:a37:5041:: with SMTP id e62-v6mr16399228qkb.249.1532973119752;
        Mon, 30 Jul 2018 10:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532973119; cv=none;
        d=google.com; s=arc-20160816;
        b=p64hdh5YsBM0bJb8kSYJI00lh0zZsjJ0O7GnYZTPYSzDh5lt6ngc/5MWpjbI6Gf9um
         DrbM5TC7BVy2KVI8v+EZjvaiz4Ca4UibNnojxVSitSvbO3vqAzIF6vsiwVbvB2JD7ukt
         O8TY4c0geOIaQtMAxulpUOruDun0ZvPoMrLeq2HB+/jKGsWEyE/WY740xZsxdAYxHfWw
         CqrbXtSz76J9wDXfek3Jf+iARijbTUgZLTCFH+PyPYpnVC3brSg688txU4c9VmyWOV/M
         f1Cg9LtroJZaK2Pd6qwoTE7dglqjtlekCb6sbi0olW7FjdSag1na0MiduoA2Nv0+JGGW
         UdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=RWF6ZdQcUx26lEKfSWe7+DtheBclbmtqW6Vz57j5f+I=;
        b=lr57WZ6vgdWFhibWs9HAEvG3FpSYlmwH7f9xkC5elGKSsLla5gjCAwrOnOOnl3Wrwf
         5VK2/3gc+jCLFgjknTequRQOtU1UsCI/GRF/38Vn4yzLCRuayy6FnO1DUWNrNI90CvSa
         tWRE47Va6whKml+UzBL79fJIP2udDzj3Kg/9EmPVTwQEkuYsNjUG6rBMnuwDzvBQ/2Ve
         0rhcVu14+EYdbhzNSzypeHmiAL5OA1G7MpCyWy27A2ex3PNzLsBgrcn4tk4HVy8AOBXr
         MWnUsApjUCQuJUx+4ly2N+S37iz/0TgPsyAGWzTfkBN0ltzZdb6fhbIUZBnOihDZVyrQ
         JNrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e7/llDJ4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o11-v6si5670871qkl.97.2018.07.30.10.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 10:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e7/llDJ4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkCKt-0006Ce-61
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 13:51:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkCKk-0006C8-2F
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:51:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkCKj-0001gB-8k
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:51:50 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:38789)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkCKj-0001fo-35
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:51:49 -0400
Received: by mail-oi0-x242.google.com with SMTP id v8-v6so22865687oie.5
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RWF6ZdQcUx26lEKfSWe7+DtheBclbmtqW6Vz57j5f+I=;
	b=e7/llDJ40b24dc1yES1hI3Q9+gGOziBt6Tewidlkyjto3uMnUMCN3VnCbujl91aWqB
	Wt25zrFALVkojEWwGQibQZBBj0rJ9pRPPh+3+M4an5XczU3n6gUHQ0F+DrCBtcRo0FWm
	972ssEbN1V7AvQ0VYzRmvUTa3mZwvCmJ2U0No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RWF6ZdQcUx26lEKfSWe7+DtheBclbmtqW6Vz57j5f+I=;
	b=BS+pstyjqZvW1fg5o4BCYCk7fZyOMRSMOuyikCJg9XkTrA2Apbc3Pglx4+7GaBwYJD
	IhGhLUIeM+U9EGJqkHpT4FP/na/jVOLebri0Hv3zYSVNcsmuzVIiYJoiIhuscukfLHY2
	kL4KYPiDVH4aE0dVvv/HGy8lEX6C3Q32X/haW9tLdGT50vEQmoFhLBmamst9ji7bsUqk
	AX2umVZ/2xgRjVtEhAs2V4DfRwXfOxivKbKxZZKlF8MAUGrXYG7vVcg7CXV2ba07m1EG
	tDBwSKdnO1KfnP+64EUn+kdsj8LXXabg+OPfzzf0iI9OpaIwVFTjKoV9IhJ6Wr5r4emF
	r5qA==
X-Gm-Message-State: AOUpUlFzvIjBylL6AlaSjPUrSL7jJnQ4fxEUpsElqzZk5HFYuYs3JsI4
	+xneixE06yMbVK5b7pyB1S2zwhBLVKcy5BAR4a8VFA==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr17040518oia.11.1532973108258; 
	Mon, 30 Jul 2018 10:51:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 10:51:27
	-0700 (PDT)
In-Reply-To: <829318c8-9921-b856-e2bb-86583f43a8e7@amsat.org>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-5-stefanha@redhat.com>
	<829318c8-9921-b856-e2bb-86583f43a8e7@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 18:51:27 +0100
Message-ID: <CAFEAcA-YQ1yE0jc2CgTvvPipNjMC=7SkKQcKHV5-vgPwEBFHSQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v3 4/7] target/arm: add "cortex-m0" CPU model
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5lS/uasTqe8F

On 27 July 2018 at 06:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Stefan,
>
> On 07/25/2018 05:59 AM, Stefan Hajnoczi wrote:
>> Define a "cortex-m0" ARMv6-M CPU model.
>>
>> Most of the register reset values set by other CPU models are not
>> relevant for the cut-down ARMv6-M architecture.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  target/arm/cpu.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 3848ef46aa..7e477c0d23 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1255,6 +1255,15 @@ static void arm11mpcore_initfn(Object *obj)
>>      cpu->reset_auxcr =3D 1;
>>  }
>>
>> +static void cortex_m0_initfn(Object *obj)
>> +{
>> +    ARMCPU *cpu =3D ARM_CPU(obj);
>> +    set_feature(&cpu->env, ARM_FEATURE_V6);
>> +    set_feature(&cpu->env, ARM_FEATURE_M);
>
> What about ARM_FEATURE_THUMB2 (T32)?

No, the M0 doesn't have Thumb2. It has Thumb1 plus a tiny set
of 32-bit instructions (which we deal with specially in translate.c).

(As it happens we generally can't get to the checks on the THUMB2
feature for a v6M core, so I think but have not checked thoroughly
that it would make no difference to QEMU's behaviour whether the
feature bit was set or not.)

> Peter: Since the M0 (optionally?) supports 32x32 multiply, should this
> cpu use the ARM_FEATURE_THUMB_DSP feature? Else this might trigger an
> 'Undefined Instruction' in disas_thumb2_insn().

ARM_FEATURE_THUMB_DSP only enables checks in disas_thumb2_insn()
(and 32x32->32 multiply is not one of the insns it gates).
The only insns in that function that a v6M core can execute are
msr, mrs, dsb, dmb, isb and bl, none of which are affected by that
feature switch.

> And what about optional ARM_FEATURE_PMSA?
> Oh this would be cortex_m0plus_initfn() for "cortex-m0-plus", ok.

Yep, plain M0 has no MPU (and so we're postponing the work
of implementing the v6M PMSA, which IIRC isn't quite the
same as the v7M one).

thanks
-- PMM
