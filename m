Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2231403wrd;
        Mon, 24 Sep 2018 00:38:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62Tx4Ujxtqa0BZnuKvKWlK7t4Q1v0sg1XgbOBxKhZRcEQA0v61M4PK3BrapnW9in24LOrG+
X-Received: by 2002:ac8:190e:: with SMTP id t14-v6mr7081516qtj.327.1537774699588;
        Mon, 24 Sep 2018 00:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537774699; cv=none;
        d=google.com; s=arc-20160816;
        b=TmKCt6co6Bme0Pg8cVj3Z7rt9SPAbwiV8BrMhmoiJUo8seBhsZeZkCoCKzxY5aARu7
         5A51p8eSuY3dw2zKUU3LFTys4m3bMX9gOnVoawuTSLMGKzdIbKtBinbRMJKXu2tmC1P9
         Gi5HBG51eSe0mmqdntFu+De9iHS5iABNRnkCEnKXuR66aNNW5Jbyw1RVkdCA6VtQOsnV
         8cvVoqwFmLkJx/B7ty1H/va7pW9RAKxQPuoNkXDZVq2dxqeny/TR2KZzsxsSb72OFErU
         0/aM3AQSUzKoPrgXYHvZeuTEsfsbQ1bPtubWgdvdUaWnME1NROGmqHqQM6eDG9BofN9S
         Za+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from;
        bh=IQzmlY3rcM3XLWDxIhEiMXrW9A3x9NXMfPflzQNjzoM=;
        b=TLOxRkVp4E/sj7MObeEoHsO9I4Qi5wxB60yoqzts0OHyNulGs+wavgfYjSrPhbcbRt
         DCZXgpA9snXJ5y7dwEqSfZpplh1n8Xm+FIswthnPdK94DvkVV5LpWSXspoPwmYa8q/Wx
         VoF99hUnspzd6IBc5LhLGB9nIxrwoMwgkcSp5Ci+ia9uoRaq4ApPa6pHyqeDA1FP2VAC
         YSi+wS8zn2ewfFRFdH7Eznu8A+YK5Y21tOtOMzP0MCuE1tsCo2s15NDobMDHKC/fqKr8
         6ztyXJSkP2yram7MLzKxcpK4lm1cIT9jog/3fd9G7rMlrCFP5QGhtxls9m2E1k9d8NxE
         TpyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u32-v6si1124870qtb.176.2018.09.24.00.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Sep 2018 00:38:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4LRj-0002n8-2w
	for alex.bennee@linaro.org; Mon, 24 Sep 2018 03:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g4LRV-0002mg-HO
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 03:38:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g4LRS-00072X-DC
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 03:38:05 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2408 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g4LRR-0006vx-Tx; Mon, 24 Sep 2018 03:38:02 -0400
Received: from DGGEMA406-HUB.china.huawei.com (unknown [172.30.72.55])
	by Forcepoint Email with ESMTP id A4724816E42B9;
	Mon, 24 Sep 2018 15:37:52 +0800 (CST)
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.64]) by
	DGGEMA406-HUB.china.huawei.com ([10.3.20.47]) with mapi id
	14.03.0399.000; Mon, 24 Sep 2018 15:37:52 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v9 2/2] target: arm: Add support for VCPU
	event states
Thread-Index: AdRT2Gz4zDWqC6OrSwO72ljkXuMMQw==
Date: Mon, 24 Sep 2018 07:37:51 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201E8AA0B@dggema523-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.54.184]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.187
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 2/2] target: arm: Add support
 for VCPU event states
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9C24wmnsKbal

Hi Andrew,
   Thanks for the review and comments.

[...]
> > @@ -600,6 +605,60 @@ int kvm_arm_cpreg_level(uint64_t regidx)
> >  #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 |=
 \
> >                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
> >
> > +static int kvm_put_vcpu_events(ARMCPU *cpu) {
> > +    CPUARMState *env =3D &cpu->env;
> > +    struct kvm_vcpu_events events =3D {};
> > +    int ret;
> > +
> > +    if (!kvm_has_vcpu_events()) {
> > +        return 0;
> > +    }
> > +
> > +    memset(&events, 0, sizeof(events));
>=20
> nit: this memset is redundant with the '=3D {}' above. I'd probably keep =
it and remove the '=3D {}' though.
 =20
Will remove the '=3D {}', thanks

>=20
> > +    events.exception.serror_pending =3D env->serror.pending;
> > +
> > +    /* Inject SError to guest with specified syndrome if host kernel
> > +     * supports it, otherwise inject SError without syndrome.
> > +     */
> > +    if (have_inject_serror_esr) {
> > +        events.exception.serror_has_esr =3D env->serror.has_esr;
> > +        events.exception.serror_esr =3D env->serror.esr;
> > +    }
> > +
> > +    ret =3D kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
> > +    if (ret) {
> > +        error_report("failed to put vcpu events");
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static int kvm_get_vcpu_events(ARMCPU *cpu) {
> > +    CPUARMState *env =3D &cpu->env;
> > +    struct kvm_vcpu_events events;
> > +    int ret;
> > +
> > +    if (!kvm_has_vcpu_events()) {
> > +        return 0;
> > +    }
> > +
> > +    memset(&events, 0, sizeof(events));
> > +    ret =3D kvm_vcpu_ioctl(CPU(cpu), KVM_GET_VCPU_EVENTS, &events);
> > +
>=20
> nit: no need for this blank line

Will remove this blank line

>=20
> > +    if (ret) {
> > +        error_report("failed to get vcpu events");
> > +        return ret;
> > +    }
[...]
> > +
> >  static bool m_needed(void *opaque)
> >  {
> >      ARMCPU *cpu =3D opaque;
> > @@ -726,6 +747,7 @@ const VMStateDescription vmstate_arm_cpu =3D {
> > #ifdef TARGET_AARCH64
> >          &vmstate_sve,
> >  #endif
> > +        &vmstate_serror,
> >          NULL
> >      }
> >  };
> > --
> > 1.8.3.1
> >
> >
>=20
> Hmm. kvm_vcpu_events is defined for both 32-bit and 64-bit and the vmstat=
e isn't in the '#ifdef TARGET_AARCH64', like vmstate_sve, yet
> only the target/arm/kvm64.c file is getting updated. Shouldn't we put kvm=
_get/put_vcpu_events() in target/arm/kvm.c and then also
> update target/arm/kvm32.c?

I will also update the target/arm/kvm32.c, thanks a lot for the suggestion.

>=20
> Thanks,
> drew
