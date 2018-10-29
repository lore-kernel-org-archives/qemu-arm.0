Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4194275wro;
        Mon, 29 Oct 2018 06:10:22 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ffVasTrxVTQ+GlazQw+ve24FL3XwIJE2QaYX4cR+PFQ8n8pkSkcj4ss84R9WXTaAQxvnWF
X-Received: by 2002:a37:434c:: with SMTP id q73-v6mr12075172qka.183.1540818622424;
        Mon, 29 Oct 2018 06:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540818622; cv=none;
        d=google.com; s=arc-20160816;
        b=0HAcm+ZYMtUQfPVl6WXQKY0AXu5yw5rPVucn2PZgAjlkHl/1G2ND/dsylipEbgzDRk
         s0J5pc1TrZvPHsluX0x/0S+6oFrTm8YWuSydwG9KpoRW4t6IwYsndP1/8D1oStUxa5Ca
         TMjUrOUQYh+/BB6wvsYM8eCTOzcY3m1It2u0obkPgfayN60NK7GUjAzm8+AbsEfZupSG
         Khrrfjvpmy0U2ejOz0a+1brmbYMcdntieoxu6TbPftFd255Tj3bHL2XI4QUO4mMMOVNp
         As3YGC+mcuIk0HPYEO641rpN2WFJVy8ItxYlZFmaH3Rzn5qi6sXkjqNiwHWuHMHnv9aa
         WkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=uxRnjPbsySwv7owTXfS1JfghAnBGTzR5N/REkTf+lnE=;
        b=jZOKzFxJtyFOuhpyBtSFDnV7g8k/zzacbr5z+bsb73bN1G3kIm0antkPmP06pRJU0e
         YI492KG5O86KPUb17iVMc2ue+PJq6NZibb/vznFlBosKyBSYgnuYiCdM9g46VYApBJpV
         jyf46bG3mf2M6ofcHQRVWSrUj3s9dDyFrdUCPZ8zO70+iT/SunHonIwUjDAtJlsnkgor
         Q04FmOstemyQ57Ns5UwSYx7UPtvcBPsEjQB4HvTPgDTzH01UqN3unnzwIjjWBYlwgfkw
         Cvav1J/NY+nLmr0+8VtLeyNztS659CNSfK7i4LVgb9/8uRAJRw9eEW1jZxA+FJinWMhJ
         kyOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iM3fvk5O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d4-v6si5321560qti.388.2018.10.29.06.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 06:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iM3fvk5O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH7JF-0001wI-RU
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 09:10:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gH7Iw-0001rP-PX
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:10:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gH7Iu-0004tF-Tm
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:10:02 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gH7Is-0004op-Rd
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:09:59 -0400
Received: by mail-ot1-x344.google.com with SMTP id d5so7452541oti.6
	for <qemu-arm@nongnu.org>; Mon, 29 Oct 2018 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uxRnjPbsySwv7owTXfS1JfghAnBGTzR5N/REkTf+lnE=;
	b=iM3fvk5OXuUTAlFtsHk3yuzn/MsTiV+HHSkY3lAVOhIorFcNInMpnATIzTQre7Y3m/
	xyUiIIjoEvbGd8xno/0an+bWOaO6C9GmgwAxuuzjUeV6JhP8hR29aFLKjO8T+27yyFQ3
	WZy9fGUosJsXffWuySo6HQ88d6K17GmUPiHNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uxRnjPbsySwv7owTXfS1JfghAnBGTzR5N/REkTf+lnE=;
	b=PCQH4lkk1Io7Dtb6z6juO7GVh3gCGMY8Mc5TWFfOfz24YT95wkocuO3FX7mmQvjw3a
	+QfBcmxiBcIDfcc67vZMtI2P3b5QcIwqaH970x0nzxoH2Np5MA9ozMg8onW0CHVPQNY4
	W4EYsfUKOYVEskLcngIfgXkvTnO81/HCaChMFCR1l/qwslViHdHrRvcH5U2B9/bab0Sp
	zi4I+1K+Y4ta6YJDN74nlcC67BjPaHcg9gf/52OfFwjgq69dVJl+C65FSjclDJpmZzEQ
	UbwUTAlZCqI3Yu5pUCSeHloBBCL3tWfLEWFNLkIs8SxocaoauGPQoHNjkmNfx9+Jd/Uc
	CfQA==
X-Gm-Message-State: AGRZ1gKP7N+301deNPWN97gyc8w6smdqQ9O4iFbmJs5emzDpA50T5lhv
	RGkqeBX+m2iZeSCymlC6DiGH4wrEpP04LZ3bSrsWxg==
X-Received: by 2002:a9d:156d:: with SMTP id z42mr3042191otz.201.1540818594866; 
	Mon, 29 Oct 2018 06:09:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Mon, 29 Oct 2018 06:09:34
	-0700 (PDT)
In-Reply-To: <20181024112525.wdysex6exqd5aued@kamzik.brq.redhat.com>
References: <20181024085602.16611-1-eric.auger@redhat.com>
	<20181024112525.wdysex6exqd5aued@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Oct 2018 13:09:34 +0000
Message-ID: <CAFEAcA8aEMUjPs=Y4-Zra___T15HryY4NDgxxqXMHhSQ4_+sLg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: Set
 VIRT_COMPAT_3_0 compat
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MM0DpLDXjwYw

On 24 October 2018 at 12:25, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Oct 24, 2018 at 10:56:02AM +0200, Eric Auger wrote:
>> We are missing the VIRT_COMPAT_3_0 definition and setting.
>> Let's add them.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9f677825f9..a2b8d8f7c2 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1871,6 +1871,9 @@ static void virt_machine_3_1_options(MachineClass *mc)
>>  }
>>  DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
>>
>> +#define VIRT_COMPAT_3_0 \
>> +    HW_COMPAT_3_0
>> +
>>  static void virt_3_0_instance_init(Object *obj)
>>  {
>>      virt_3_1_instance_init(obj);
>> @@ -1879,6 +1882,7 @@ static void virt_3_0_instance_init(Object *obj)
>>  static void virt_machine_3_0_options(MachineClass *mc)
>>  {
>>      virt_machine_3_1_options(mc);
>> +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_3_0);
>>  }
>>  DEFINE_VIRT_MACHINE(3, 0)
>>
>> --
>> 2.17.2
>>
>>
>
> Oops, I should have done this with the 3.1 machine type. Thanks for the
> catching and patching.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
