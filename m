Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp388171lfc;
        Tue, 25 Aug 2020 20:10:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Db3mC637BEMqb/8YGCFaYicOIrUzHTzVK8Vh5gF7Hq2WrezN8yAPOcZUnV2SLjvpMb3l
X-Received: by 2002:a25:c0c7:: with SMTP id c190mr18883193ybf.34.1598411412156;
        Tue, 25 Aug 2020 20:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598411412; cv=none;
        d=google.com; s=arc-20160816;
        b=Vw1kGqTy7Otasu7FNicBh94le4Z8jHC7TXHR1BmsWRcP1C3ysH9wb0G2hUMGjXrCFK
         28jAgebryUxy9qTJJ2aVo/ye2/kGjOWrDJ71+nd9EJj+kx/JL5fXV2i2X/CMHf4V+xPd
         ACMiwo7nKPmrOBx4AW0vTWgNB4oYIfnA4yhMc09xKNtH4Q+fSmymO9RHvcKO1Feo9Vir
         lP+90uiHsOOpbWhmqUdun5l8ONCMVcItWJaCl6tl49Sm/N4lF2QEryJ+djFrd7nIBx+v
         DGS2Kl9TQ+g9duKNU/58TNXUuPWaiPKMc/6lGBKuBnd8nB3RiaGHph+YF8vsg9j4PEy9
         S/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:from:user-agent:references:dkim-signature;
        bh=Vt/YvypQ2/JgOMomfmLJ69idML1qVW8CKn8qjuI79ms=;
        b=NQlF4WjJyWXnMKdVm/2uaSm67Nxkrqa6NSvVZ3Kyfd9XMLKj8xjFwuBTH6zmhXQLJi
         uEjcfOJmopzkWtLp23tRxBwodKR2GiyLmwTltDJ5BxAOyl7qVhpUbre9Cm3awa+g7VIj
         uToHvMGMeY4MdAi5Wuq89PoImWSn/JGTjZr9xOeinzJ2RlJeGnYPpX0oyVM/QFS83AY9
         hOm7dWnG5LZtbwMGGKtB9FV4hS/6ZSHGBYEvLpzR8h2Nue+DIKlgL104hDrRawhcj97V
         wRXorMd0yaLncFZ2yrkhGX6wKmPbyg+AzrhJ10rcZypoHztSRUkTSPJ1IvqRbf32N7Oc
         3eUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Mnpc3Fc5;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 81si891445ybn.182.2020.08.25.20.10.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 20:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Mnpc3Fc5;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q31YgO148367;
	Tue, 25 Aug 2020 23:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : cc :
 subject : in-reply-to : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=Vt/YvypQ2/JgOMomfmLJ69idML1qVW8CKn8qjuI79ms=;
 b=Mnpc3Fc5G3JEflTqRuc55rARHtbKu5yARozSzuQIKVYFuVvwI8uLBtqIMUrSxYEH4eWc
 QcDTWT0UtZWHiYuSKlpjlWpI1K70NqQ7z4AICdaLfxMJVP2aG1LzjC5bnR4fj4P8cgBA
 fZRYKBDsRBNB02T15133Vy58+5sMnHwMWo4qh3qDHfbQYEmjP1EQRNRfjnKi4Da7W6hV
 74ApyVryGF5+KrZmdwVbuwaHRDJODDTDoDztxMa+VpUeNKzV7UtU7FgIqOW4F1vQBSdt
 y+N/yEG+dGDF4imZAYSHe+pPBF8Hz4i3xcw5TYyzqRtATI2BdCt/OYISNfjRBKNQ9cGp pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 335exwrtq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2020 23:09:47 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q33IG7156830;
	Tue, 25 Aug 2020 23:09:47 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com with ESMTP id 335exwrtpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2020 23:09:47 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q37g0K025429;
	Wed, 26 Aug 2020 03:09:46 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma03dal.us.ibm.com with ESMTP id 332uttp0xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 03:09:46 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q39jPG1376920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 03:09:45 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6ADC37805F;
	Wed, 26 Aug 2020 03:09:45 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E9E77805E;
	Wed, 26 Aug 2020 03:09:40 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.48.38])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Wed, 26 Aug 2020 03:09:40 +0000 (GMT)
References: <20200819164306.625357-1-bauerman@linux.ibm.com> <20200819164306.625357-7-bauerman@linux.ibm.com>
User-agent: mu4e 1.4.10; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
        David Hildenbrand
 <david@redhat.com>, qemu-devel@nongnu.org,
        Jiaxun Yang
 <jiaxun.yang@flygoat.com>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,
        Thomas Huth <thuth@redhat.com>,
        David Gibson
 <david@gibson.dropbear.id.au>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>,
        Eduardo Habkost
 <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
        qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson
 <rth@twiddle.net>,
        Cornelia Huck <cohuck@redhat.com>,
        Igor Mammedov
 <imammedo@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org
Subject: Re: [PATCH v6 6/8] sparc/sun4m: Remove main_cpu_reset()
In-reply-to: <20200819164306.625357-7-bauerman@linux.ibm.com>
Date: Wed, 26 Aug 2020 00:09:37 -0300
Message-ID: <87y2m29k7i.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008260018
X-TUID: 4wWmS7cTnvQl


Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:

> We rely on cpu_common_reset() to set cs->halted to 0, so main_cpu_reset()
> is pointless.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/sparc/sun4m.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index cf7dfa4af5..22c51dac8a 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq,=
 int level)
>  {
>  }
>=20=20
> -static void main_cpu_reset(void *opaque)
> -{
> -    SPARCCPU *cpu =3D opaque;
> -    CPUState *cs =3D CPU(cpu);
> -
> -    cpu_reset(cs);
> -    cs->halted =3D 0;
> -}
> -
>  static void secondary_cpu_reset(void *opaque)
>  {
>      SPARCCPU *cpu =3D opaque;
> @@ -827,9 +818,7 @@ static void cpu_devinit(const char *cpu_type, unsigne=
d int id,
>      env =3D &cpu->env;
>=20=20
>      cpu_sparc_set_id(env, id);
> -    if (id =3D=3D 0) {
> -        qemu_register_reset(main_cpu_reset, cpu);
> -    } else {
> +    if (id !=3D 0) {
>          qemu_register_reset(secondary_cpu_reset, cpu);
>          cs =3D CPU(cpu);
>          cs->halted =3D 1;

Surprisingly, this patch also causes a make check failure:

$ make && make check-qtest
  GEN     docs/index.html
  CC      qga/main.o
  CC      qemu-nbd.o
  CC      qemu-storage-daemon.o
  CC      monitor/qmp-cmds-control.o
  CC      qemu-img.o
  CC      qemu-io.o
  CC      sparc-softmmu/hw/sparc/sun4m.o
  CC      sparc-softmmu/softmmu/vl.o
  LINK    qemu-ga
  LINK    qemu-nbd
  LINK    qemu-storage-daemon
  LINK    qemu-img
  LINK    sparc-softmmu/qemu-system-sparc
  LINK    qemu-io
  TEST    check-qtest-sparc: tests/qtest/prom-env-test
Broken pipe
/home/bauermann/trabalho/src/qemu/tests/qtest/libqtest.c:175: kill_qemu() d=
etected QEMU death from signal 11 (Segmentation fault) (core dumped)
ERROR prom-env-test - too few tests run (expected 3, got 0)
make: *** [/home/bauermann/trabalho/src/qemu/tests/Makefile.include:650: ch=
eck-qtest-sparc] Fehler 1

Here's what I got from the core file:

$ gdb sparc-softmmu/qemu-system-sparc core.645493
Reading symbols from sparc-softmmu/qemu-system-sparc...
[New LWP 645497]
[New LWP 645496]
[New LWP 645493]
[New LWP 645495]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Core was generated by `sparc-softmmu/qemu-system-sparc -qtest unix:/tmp/qte=
st-645490.sock -qtest-log /'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x0000000000000000 in ?? ()
[Current thread is 1 (Thread 0x7f713ce60700 (LWP 645497))]
(gdb) bt
#0  0x0000000000000000 in  ()
#1  0x0000557b3d6155c5 in helper_compute_psr (env=3Denv@entry=3D0x557b3f444=
030) at /home/bauermann/trabalho/src/qemu/target/sparc/cc_helper.c:459
#2  0x0000557b3d6156e9 in cpu_get_psr (env=3Denv@entry=3D0x557b3f444030) at=
 /home/bauermann/trabalho/src/qemu/target/sparc/win_helper.c:56
#3  0x0000557b3d61779c in sparc_cpu_do_interrupt (cs=3D0x557b3f43b7f0) at /=
home/bauermann/trabalho/src/qemu/target/sparc/int32_helper.c:76
#4  0x0000557b3d5e29a6 in cpu_handle_exception (ret=3D<synthetic pointer>, =
cpu=3D0x557b3f43b7f0) at /home/bauermann/trabalho/src/qemu/accel/tcg/cpu-ex=
ec.c:504
#5  cpu_exec (cpu=3Dcpu@entry=3D0x557b3f43b7f0) at /home/bauermann/trabalho=
/src/qemu/accel/tcg/cpu-exec.c:729
#6  0x0000557b3d5f6c85 in tcg_cpu_exec (cpu=3D<optimized out>) at /home/bau=
ermann/trabalho/src/qemu/softmmu/cpus.c:1356
#7  qemu_tcg_rr_cpu_thread_fn (arg=3Darg@entry=3D0x557b3f43b7f0) at /home/b=
auermann/trabalho/src/qemu/softmmu/cpus.c:1458
#8  0x0000557b3d81e919 in qemu_thread_start (args=3D0x7f713ce5e930) at /hom=
e/bauermann/trabalho/src/qemu/util/qemu-thread-posix.c:521
#9  0x00007f717dc6b432 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f717db99913 in clone () at /lib64/libc.so.6
(gdb) up
#1  0x0000557b3d6155c5 in helper_compute_psr (env=3Denv@entry=3D0x557b3f444=
030) at /home/bauermann/trabalho/src/qemu/target/sparc/cc_helper.c:459
459         new_psr =3D icc_table[CC_OP].compute_all(env);
(gdb) list
454
455     void helper_compute_psr(CPUSPARCState *env)
456     {
457         uint32_t new_psr;
458
459         new_psr =3D icc_table[CC_OP].compute_all(env);
460         env->psr =3D new_psr;
461     #ifdef TARGET_SPARC64
462         new_psr =3D xcc_table[CC_OP].compute_all(env);
463         env->xcc =3D new_psr;

CC_OP is:

#define CC_OP  (env->cc_op)

So:

(gdb) p env->cc_op
$1 =3D 0

0 is CC_OP_DYNAMIC, but the icc_table definition says:

static const CCTable icc_table[CC_OP_NB] =3D {
    /* CC_OP_DYNAMIC should never happen */

I don't know what is going on. So I will change this patch to keep
main_cpu_reset() but drop the line which sets cs->halted to 0 (which
does pass make check).

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
