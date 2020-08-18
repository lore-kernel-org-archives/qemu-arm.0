Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3396486lfy;
        Mon, 17 Aug 2020 18:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjKqRjzcfHoAM4/aX8+UBiljljP1vEJjelLOayKAzZXZjL9F5rC1IPQitWazagw8OGIULw
X-Received: by 2002:a17:90a:ce8c:: with SMTP id g12mr13307158pju.23.1597715084297;
        Mon, 17 Aug 2020 18:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597715084; cv=none;
        d=google.com; s=arc-20160816;
        b=Xv0VjaD4rJ/XdwF7d6Qnd0ROYZELc2pMPvyS21AI/chkTnYAU0XGU0vQkb1ApuX9Ui
         f57+v1W/jTloNsKGu3OIzCUIxNHprWkm6qEshxgm5yHxsesvfDilOJLIYeGiD6GCcRut
         Yrevnr+ox+i2AaRW4MVguH14Hm2747ECtt7/S3/b9aWiyuF3NS9+VEeWpgAAXcyhqT+k
         4EKHhns9sqjjBiSn7taSFk3o/SbiMpa6/Fgfr8rvJwuSHCrNsde478dRDrhz2zItbtER
         wYTkcezfM77oN/BQvwPsI0mbLIIVtv1tY3W3Ys7GYqXzqkgGyMjfSGhgOd9pYbHeDrbd
         UBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=vWgNd0droBgNxocrSnsVRySZHFefJUGvUyzFU0tOJsY=;
        b=kw76Kcq6ilKxxAG7NuJ/GW7GqFEDiYiSXTuf1jBaVn7rRHvdtR3jl6brCfsHZ6cOn6
         uPOAiPBAmSflWfV/wOQa0UwdrYJ8nsW7Kc8PKtw1EFWCj+RmZspKuw0URVwzI3MQsKRB
         wAA8gKUYcZc5iHCwafUD2y0zMO/QIDXjy9JV/4LmvlWUrX9itXyOMgCJMTpQ0ZPxsuW8
         iIqpCaW/oYSNVs2Q4frBk4dg6AmiOGGLu03i13Zfxe7y9p0rhYbwS5sbiy8RfWISAfbs
         A8HJ3jh20yUQv/WM5/nSWb9Qpz0pVet/CrMoEw+YaLEWFc4Ir4csHtFmQmi54Avvu+Ak
         OWIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dkFrgpa1;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id k4si13112626plt.313.2020.08.17.18.44.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 18:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dkFrgpa1;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I1VkSe042861;
	Mon, 17 Aug 2020 21:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=vWgNd0droBgNxocrSnsVRySZHFefJUGvUyzFU0tOJsY=;
 b=dkFrgpa1+1IuTd+v8sMxc208qemUMQUa+YDWIOTv2hBiFFD133V2qUmCvpUUVvb2ern6
 By7gdUkkE3mnigA9g7Tw5KeV+PuQYjCiCAulXJHseagTAfB5BFkvEQph7prGPVRRFEkX
 TMJfdtvZfIy41eqB0dzNO+vseVDZnCiuEmuROITLzQkCzrehaD7cDhB4BkTPq3Iw7Pkz
 RGynwmjIFuxDKbUdPU8WkfiL9rYP3jnvv9AHb4Qk/a159ZSxOWjfAi4xtmnHfwABMhcB
 L64HLHjIInluHda1r0mJ1CBVGkgPhnKVA75XoaIz28R+t4I83Ih+QqOu9r3EurOdQZSs Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304tdh0vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 21:44:06 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I1W4uS043396;
	Mon, 17 Aug 2020 21:44:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304tdh0uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 21:44:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I1dQ6E013898;
	Tue, 18 Aug 2020 01:44:04 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma03dal.us.ibm.com with ESMTP id 3304cc8fxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 01:44:04 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I1i4pJ37224820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 01:44:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C8E3112062;
	Tue, 18 Aug 2020 01:44:04 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4452112061;
	Tue, 18 Aug 2020 01:43:57 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.138.167])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Aug 2020 01:43:57 +0000 (GMT)
References: <20200723025657.644724-1-bauerman@linux.ibm.com> <20200817044730.GK12805@yekko.fritz.box> <83ebefab-8bdf-2584-53e6-e4fa0f540109@redhat.com> <20200817054306.GL12805@yekko.fritz.box>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        David
 Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
        Jiaxun Yang
 <jiaxun.yang@flygoat.com>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,
        Thomas Huth <thuth@redhat.com>,
        Artyom
 Tarasenko <atar4qemu@gmail.com>,
        Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,
        Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
        qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson
 <rth@twiddle.net>,
        Cornelia Huck <cohuck@redhat.com>,
        Aurelien Jarno
 <aurelien@aurel32.net>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
In-reply-to: <20200817054306.GL12805@yekko.fritz.box>
Date: Mon, 17 Aug 2020 22:43:52 -0300
Message-ID: <87mu2s7mp3.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-17_15:2020-08-17,2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180006
X-TUID: QN2aSsZ7vbxI


David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Aug 17, 2020 at 07:24:43AM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 8/17/20 6:47 AM, David Gibson wrote:
>> > On Wed, Jul 22, 2020 at 11:56:49PM -0300, Thiago Jung Bauermann wrote:
>> >> The ARM code has a start-powered-off property in ARMCPU, which is a
>> >> subclass of CPUState. This property causes arm_cpu_reset() to set
>> >> CPUState::halted to 1, signalling that the CPU should start in a halt=
ed
>> >> state. Other architectures also have code which aim to achieve the sa=
me
>> >> effect, but without using a property.
>> >>
>> >> The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
>> >> before cs->halted is set to 1, causing the vcpu to run while it's sti=
ll in
>> >> an unitialized state (more details in patch 3).
>> >>
>> >> Peter Maydell mentioned the ARM start-powered-off property and
>> >> Eduardo=C3=82 Habkost suggested making it generic, so this patch seri=
es does
>> >> that, for all cases which I was able to find via grep in the code.
>> >>
>> >> The only problem is that I was only able to test these changes on a p=
pc64le
>> >> pseries KVM guest, so except for patches 2 and 3, all others are only
>> >> build-tested. Also, my grasp of QOM lifecycle is basically non-exista=
nt so
>> >> please be aware of that when reviewing this series.
>> >>
>> >> The last patch may be wrong, as pointed out by Eduardo, so I marked i=
t as
>> >> RFC. It may make sense to drop it.
>> >>
>> >> Applies cleanly on yesterday's master.
>> >
>> > This series appears to break the Travis build for a MIPS target:
>> >
>> > Unexpected error in qdev_prop_set_after_realize() at /home/travis/buil=
d/dgibson/qemu/hw/core/qdev-properties.c:30:
>> > qemu-system-mips64el: Attempt to set property 'start-powered-off' on a=
nonymous device (type 'I6400-mips64-cpu') after it was realized
>> > Broken pipe
>> > /home/travis/build/dgibson/qemu/tests/qtest/libqtest.c:175: kill_qemu(=
) detected QEMU death from signal 6 (Aborted) (core dumped)
>> > Aborted (core dumped)
>> > ERROR qom-test - too few tests run (expected 8, got 0)
>> > /home/travis/build/dgibson/qemu/tests/Makefile.include:650: recipe for=
 target 'check-qtest-mips64el' failed
>>
>> Good catch. hw/mips/cps.c, hw/ppc/e500.c and hw/sparc/sun4m.c are
>> incorrectly setting the property after the cpu is realized because
>> the cpu is created with cpu_create(). We need to create them with
>> object_initialize_child() and realize them manually with qdev_realize().

Does it have to be with object_initialize_child()? I found very few
examples of CPUs initialized with that function (e.g., atmega.c,
rx62n.c, nrf51_soc.c).

A more direct substitute for cpu_create() would be object_new(). I
provide an example at the end of this email. What do you think?

I'm trying to test it with `make=C2=A0docker-test-misc@debian-mips64el-cros=
s`,
but still having some trouble with that. Is there another way to
reproduce this issue?

> Thiago, can you fix that up and repost please.

Ok, I'm working on it.

--
Thiago Jung Bauermann
IBM Linux Technology Center


diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index d5b6c78019..be85357dc0 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -73,7 +73,9 @@ static void mips_cps_realize(DeviceState *dev, Error **er=
rp)
     bool saar_present =3D false;
=20
     for (i =3D 0; i < s->num_vp; i++) {
-        cpu =3D MIPS_CPU(cpu_create(s->cpu_type));
+        Error *err =3D NULL;
+
+        cpu =3D MIPS_CPU(object_new(s->cpu_type));
=20
         /* Init internal devices */
         cpu_mips_irq_init_cpu(cpu);
@@ -90,6 +92,12 @@ static void mips_cps_realize(DeviceState *dev, Error **e=
rrp)
         object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
                                  &error_abort);
         qemu_register_reset(main_cpu_reset, cpu);
+
+        if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
+            error_report_err(err);
+            object_unref(OBJECT(cpu));
+            exit(EXIT_FAILURE);
+        }
     }
=20
     cpu =3D MIPS_CPU(first_cpu);
