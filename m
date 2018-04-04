Received: by 10.28.71.155 with SMTP id m27csp5390632wmi;
        Wed, 4 Apr 2018 15:52:09 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49T1Jl+fScMxk/5FHSw/Gultnky7x1Mx/dqY2NawZy54CTM/phnmQ7+rYwqkK4o2E4BrfdR
X-Received: by 10.237.46.196 with SMTP id k62mr28456762qtd.207.1522882328982;
        Wed, 04 Apr 2018 15:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522882328; cv=none;
        d=google.com; s=arc-20160816;
        b=cAE/tC/Q9AzzcWovXN4Yg7D7PqeXg5fWytFKzozK+0Q8MgofX+MxP18pwvrxtQj+xL
         B16sxAocJOOBa5YTI2F2foYO+YMKSUEnNnatdNE6vTtOZGs6xbW4mY1usPaYFm6AA68f
         UY9PHdS3IxzqLH2SgYHJ+/PkIqML8s0SDtcheoCNBblZRxUdVkuR15VaCaDOiFRBYRsP
         wr4X7v/nDsasyNSotOo8VqiyXSb7lHhD0LczHpPeXTbN9Zy9J4JvaaEBSUS7yg0THIL1
         5DXr73Ba4Imr0EI1GEIcSFAhjwkilYB4ZN83TIOCLeFJWTauc0BlwL0FvhYKVVwkYdwH
         wxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=A9xG/hnBtg6HbztYOgE2ZGiASAvlipfTe5q+0+tqIIU=;
        b=GrnDccZWTg0qP32N4J0zT8CqeEcnxVokNBmWMiqDSGndmHEuCSjkBc3qTvSAl9ohrx
         08zTv7bxOHPuycdKYmjXi28rZA2CQOMgYKJf3kAwXoxk4ut9sDIKEBweNmvHusUbhMgw
         tKG0xjrwEVXOHg/g7OrRMNTLados4BOGahSLb45h94cQU04gFs3a3jt35dGOrYw1Rccp
         ATquNTJEfa07H05W1Zni/F8wJlqWWRCya1yz7lBblUSCVN2WEWDs9QNfIEQH8o/MyC7j
         C6BE2MpeAoRXisbrzNYtRRhGVvKjYHxMOZ+ImbJe2YwPijajsyK7Q2GUl0W4R4DqN/3e
         1wwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iHxUzg/t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66si4337397qkc.398.2018.04.04.15.52.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 15:52:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iHxUzg/t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3rGC-0004Wk-Ff
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 18:52:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3rG3-0004Vy-Bb
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 18:52:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3rFz-0006z7-6g
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 18:51:59 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:40764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3rFz-0006yr-0x; Wed, 04 Apr 2018 18:51:55 -0400
Received: by mail-qk0-x244.google.com with SMTP id o64so24367957qkl.7;
	Wed, 04 Apr 2018 15:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A9xG/hnBtg6HbztYOgE2ZGiASAvlipfTe5q+0+tqIIU=;
	b=iHxUzg/tfgroutCg1P2Kq1wCZMrOPXtvdbICkim41rKBfC3D0aBYJM8/5SgnL+Ikg0
	VnnGZTDjxJC5I4RWkZHUSfVgVIkUakz+8IFR7xar8kPV5yyq7txoQnT/wGpZ8JofKZJr
	jklwor5H03x+hMhpHp79EP/hwZiGDvyuwROT+fdSVQO5YHzqTPNQ969S03bUTOE4MNvc
	gI8K9Luy/2uABPC/Au4wVjhpKu/SfyfzP3xYVsdmZawScd3occdkqDGjmvE4WOyv++qq
	LoxvkcPzv/2PIE9IVnPKo0UHgtUwqWmyhRI/SMgdqIDolcSgyfbosgo12l4/XLkpHKRT
	YMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=A9xG/hnBtg6HbztYOgE2ZGiASAvlipfTe5q+0+tqIIU=;
	b=JOG7not+BAK/wYXBP6OzBU4N30gFrbJekmTV0uMAR5X8+1i7pkFkOx8DrJRZazC9KX
	CBjbl5pj/NJhkJ5OTAWf14HLL4jAyYWDKhDS8EEdbLl3oeaiPfPtJ8zJX5FzVXNVEJkh
	0p7XaAQratF3+YytfCkG1DzjKGKzutCToVr13bTUSp7gQg7MqUWaiHg8nF0/0EYtxEgm
	4rlCP2LI+W+2iPYqD1VGxKzKsIMFPldsqQFB6ou91HONILByvMQz1HsP4MqDsfKyrz0S
	fN0HlQagAulaBPunpvB5PQpmx7ORbABFR+qok8+G6jIx/1h9xn014wDuNUubn4m31eVz
	FtXw==
X-Gm-Message-State: ALQs6tC8ASK2NNmS1yDcrwtqNDZeFGHjjTcnjLIXm8ExxbYnEAhS9Vsu
	0A363qNMh6ly6DzCOkPo2kBGmFJX
X-Received: by 10.55.16.130 with SMTP id 2mr27453150qkq.110.1522882314258;
	Wed, 04 Apr 2018 15:51:54 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id f6sm5441002qkh.13.2018.04.04.15.51.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 15:51:53 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org
References: <1522869306-17292-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ba4e459e-5b7f-aa25-180c-9e7e9dd8a51a@amsat.org>
Date: Wed, 4 Apr 2018 19:51:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1522869306-17292-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH for-2.12] hw/arm/integratorcp: Don't do
 things that could be fatal in the instance_init
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfWI5fo2FydY

Hi Thomas,

On 04/04/2018 04:15 PM, Thomas Huth wrote:
> An instance_init function must not fail - and might be called multiple times,
> e.g. during device introspection with the 'device-list-properties' QMP
> command. Since the integratorcm device ignores this rule, QEMU currently
> aborts in this case (though it really should not):
> 
> echo "{'execute':'qmp_capabilities'}"\
>      "{'execute':'device-list-properties',"\
>      "'arguments':{'typename':'integrator_core'}}" \
>      | arm-softmmu/qemu-system-arm -M integratorcp,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> RAMBlock "integrator.flash" already registered, abort!
> Aborted (core dumped)
> 
> Move the problematic code to the realize() function instead to fix this
> problem.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/integratorcp.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
> index e8303b8..9e2df34 100644
> --- a/hw/arm/integratorcp.c
> +++ b/hw/arm/integratorcp.c
> @@ -266,7 +266,6 @@ static const MemoryRegionOps integratorcm_ops = {
>  static void integratorcm_init(Object *obj)
>  {
>      IntegratorCMState *s = INTEGRATOR_CM(obj);
> -    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>  
>      s->cm_osc = 0x01000048;
>      /* ??? What should the high bits of this value be?  */
> @@ -276,20 +275,28 @@ static void integratorcm_init(Object *obj)
>      s->cm_init = 0x00000112;
>      s->cm_refcnt_offset = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 24,
>                                     1000);
> -    memory_region_init_ram(&s->flash, obj, "integrator.flash", 0x100000,
> -                           &error_fatal);
>  
> -    memory_region_init_io(&s->iomem, obj, &integratorcm_ops, s,
> -                          "integratorcm", 0x00800000);
> -    sysbus_init_mmio(dev, &s->iomem);
> -
> -    integratorcm_do_remap(s);
>      /* ??? Save/restore.  */
>  }
>  
>  static void integratorcm_realize(DeviceState *d, Error **errp)
>  {
>      IntegratorCMState *s = INTEGRATOR_CM(d);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(d);
> +    Error *local_err = NULL;
> +
> +    memory_region_init_ram(&s->flash, (Object *)d, "integrator.flash", 0x100000,

To keep consistency:

    memory_region_init_ram(&s->flash, OBJECT(d), "integrator.flash", ...

> +                           &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    memory_region_init_io(&s->iomem, (Object *)d, &integratorcm_ops, s,

    memory_region_init_io(&s->iomem, OBJECT(d), &integratorcm_ops, s,

> +                          "integratorcm", 0x00800000);
> +    sysbus_init_mmio(dev, &s->iomem);
> +
> +    integratorcm_do_remap(s);
>  
>      if (s->memsz >= 256) {
>          integrator_spd[31] = 64;
> 

With the macro instead of the cast:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.
