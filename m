Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp82414njb;
        Tue, 22 Oct 2024 17:18:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0G4wUEUeKydGnpZn0jCLfhiCUnj4AAajRcKOHFdIa2pczF/4EuRT1XwajfVRCuznlEKGbzXlVRqzsNw==@linaro.org
X-Google-Smtp-Source: AGHT+IGETgj/KZMKjweLG8cuKWJIDbZh+mGPkwLuiXPNEZXaBQ4B3zZs2x1FHu1xktRbKkrJNXAu
X-Received: by 2002:a05:690c:dc9:b0:6be:28ab:d874 with SMTP id 00721157ae682-6e7f0dbbd76mr10378867b3.2.1729642699975;
        Tue, 22 Oct 2024 17:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729642699; cv=none;
        d=google.com; s=arc-20240605;
        b=fj8u81G9n7aETyCmIqP6OahRGP2dNdJv3oiOWQsouroy9jUTH2f0xh6F+1hZjqSs8+
         He1r5v0shaC5wawWFnreDUVQnDfskP8iQeALhyTMlG0uMnnD1tDjxeCR/jj2lGh/xb9Q
         9q2Lk2DgO7cYJ1ehCzW6iWV/fdAEn0Vb4cLCZuCbyFpR8lbFZAC1g3VM9SerWd4Mhxng
         ubdNw71v3cQUDXD8YO7xePb6y8QFYqE77uFSOvT9F49zV+rtIqmZLMAWFjRyGoepRFY6
         1tgzQu+BJSlbTfJ9aG1cO/TeX9sewwFz0rkwJMgRn/a1VN5TtnpgzNbCp68aadR53RSJ
         rK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=SBoBNINTmrmrZ6PS1raunSzBNj06bgQiQWurqk8pEkc=;
        fh=G03eyFs6nj7eLWRqZanM8fnN+reaFU+SHvlp6Dvz0Ig=;
        b=GSBJmrnZNt51qSYKJ6CkhZRsah63ltJbgl729XtJ4v6fR8hzlEXd0LoAFwlqi187lw
         2+co7z2CBmUPVx2HN6EDJSF/ga8+g8h3cUNZzwWnMvPL5wtrx67/3DzMWia1elDdHB1p
         /vydk2idxyQDg66UnWGcuVsPgTRM8GFO84GovtzF1Rl0bKjZah5sNe/260kaUBFw8I1w
         AgstWSWgIsViuXUHkNAk3bSMTZ3gr1aLf2swtgngH0Q2uR/QsbtzOc/HDyPZvOlvUEVA
         WBXsmFY/tE3dx2dR83+E7ZMhiGnJodOtttEN74Q1BvKDr8ZuZcMHVr08uQBBHMW/cKKF
         IhCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=OH+kt1r1;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 00721157ae682-6e5f5ce40fesi52783157b3.234.2024.10.22.17.18.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2024 17:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=OH+kt1r1;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLoBML006937;
	Wed, 23 Oct 2024 00:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SBoBNI
	NTmrmrZ6PS1raunSzBNj06bgQiQWurqk8pEkc=; b=OH+kt1r1ac46DhWewUxJSv
	VXQziNTkLk4XNNmuSOuq6sX1lhNEDpbRuv7aT3Tr1c//aHBuxdVvkMAut0Wh4Dve
	xpOHh5ZsQTs8u2mnhVuQvcICbDsiCECTTmAGZQRIw5kTq3bVyc2mW1suRswGD4wF
	KDhvbJRj0vSedvp/8aEpYJHZ5VKC2QaRJ4wkiYSYOTsfJVAH88OKmXs5DXq9cN4J
	N/SuTKQWlc29JViCL6WSTibw6DBfmMqq+EWRWcGXKCXliBs7NzjxCSnm0Jyq9WGq
	z1ezOywt4kb4Jdlp2DevWPWAJgwpqQGHee8IKE8ge5mYpyj8e8QBLOJZDi+Vtdmg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emafrds9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 00:16:54 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49N0GrLj023088;
	Wed, 23 Oct 2024 00:16:53 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emafrds8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 00:16:53 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49MM8hIG001552;
	Wed, 23 Oct 2024 00:16:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42emk98cny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 00:16:52 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49N0GpHJ45285632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Oct 2024 00:16:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FBD020043;
	Wed, 23 Oct 2024 00:16:51 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83BB620040;
	Wed, 23 Oct 2024 00:16:49 +0000 (GMT)
Received: from [127.0.0.1] (unknown [9.152.108.100])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Oct 2024 00:16:49 +0000 (GMT)
Message-ID: <4c383f09bd6bd9b488ad301e5f050b8c9971f3a2.camel@linux.ibm.com>
Subject: Re: [PATCH v2 07/20] tests/tcg/x86_64: Add cross-modifying code test
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
        Alex
 =?ISO-8859-1?Q?Benn=E9e?=
	 <alex.bennee@linaro.org>,
        qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
        Wainer dos Santos Moschetta <wainersm@redhat.com>,
        Mahmoud Mandour
 <ma.mandourr@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanan Wang
 <wangyanan55@huawei.com>, Thomas Huth <thuth@redhat.com>,
        John Snow
 <jsnow@redhat.com>,
        =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>,
        qemu-arm@nongnu.org,
        "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        Eduardo Habkost
 <eduardo@habkost.net>, devel@lists.libvirt.org,
        Cleber Rosa
 <crosa@redhat.com>, kvm@vger.kernel.org,
        Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        Alexandre Iooss
 <erdnaxe@crans.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard
 Henderson <richard.henderson@linaro.org>,
        Riku Voipio
 <riku.voipio@iki.fi>, Zhao Liu <zhao1.liu@intel.com>,
        Marcelo Tosatti
 <mtosatti@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Paolo Bonzini
 <pbonzini@redhat.com>
Date: Wed, 23 Oct 2024 02:16:49 +0200
In-Reply-To: <6b18238b-f9c3-4046-964f-de16dc30d26e@linaro.org>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
	 <20241022105614.839199-8-alex.bennee@linaro.org>
	 <6b18238b-f9c3-4046-964f-de16dc30d26e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H5mvpg5WpP0LgFN83-PfKKlyGVf_CLmb
X-Proofpoint-ORIG-GUID: bhM4KN_iLhtvPV9j9L2Gh6SjUqCU3ZM7
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220156
X-TUID: h4uryx8vAYUR

On Tue, 2024-10-22 at 13:36 -0700, Pierrick Bouvier wrote:
> On 10/22/24 03:56, Alex Benn=C3=A9e wrote:
> > From: Ilya Leoshkevich <iii@linux.ibm.com>
> >=20
> > commit f025692c992c ("accel/tcg: Clear PAGE_WRITE before
> > translation")
> > fixed cross-modifying code handling, but did not add a test. The
> > changed code was further improved recently [1], and I was not sure
> > whether these modifications were safe (spoiler: they were fine).
> >=20
> > Add a test to make sure there are no regressions.
> >=20
> > [1]
> > https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00034.html
> >=20
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > Message-Id: <20241001150617.9977-1-iii@linux.ibm.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> > =C2=A0 tests/tcg/x86_64/cross-modifying-code.c | 80
> > +++++++++++++++++++++++++
> > =C2=A0 tests/tcg/x86_64/Makefile.target=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 ++
> > =C2=A0 2 files changed, 84 insertions(+)
> > =C2=A0 create mode 100644 tests/tcg/x86_64/cross-modifying-code.c
> >=20
> > diff --git a/tests/tcg/x86_64/cross-modifying-code.c
> > b/tests/tcg/x86_64/cross-modifying-code.c
> > new file mode 100644
> > index 0000000000..2704df6061
> > --- /dev/null
> > +++ b/tests/tcg/x86_64/cross-modifying-code.c
> > @@ -0,0 +1,80 @@
> > +/*
> > + * Test patching code, running in one thread, from another thread.
> > + *
> > + * Intel SDM calls this "cross-modifying code" and recommends a
> > special
> > + * sequence, which requires both threads to cooperate.
> > + *
> > + * Linux kernel uses a different sequence that does not require
> > cooperation and
> > + * involves patching the first byte with int3.
> > + *
> > + * Finally, there is user-mode software out there that simply uses
> > atomics, and
> > + * that seems to be good enough in practice. Test that QEMU has no
> > problems
> > + * with this as well.
> > + */
> > +
> > +#include <assert.h>
> > +#include <pthread.h>
> > +#include <stdbool.h>
> > +#include <stdlib.h>
> > +
> > +void add1_or_nop(long *x);
> > +asm(".pushsection .rwx,\"awx\",@progbits\n"
> > +=C2=A0=C2=A0=C2=A0 ".globl add1_or_nop\n"
> > +=C2=A0=C2=A0=C2=A0 /* addq $0x1,(%rdi) */
> > +=C2=A0=C2=A0=C2=A0 "add1_or_nop: .byte 0x48, 0x83, 0x07, 0x01\n"
> > +=C2=A0=C2=A0=C2=A0 "ret\n"
> > +=C2=A0=C2=A0=C2=A0 ".popsection\n");
> > +
> > +#define THREAD_WAIT 0
> > +#define THREAD_PATCH 1
> > +#define THREAD_STOP 2
> > +
> > +static void *thread_func(void *arg)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int val =3D 0x0026748d; /* nop */
> > +
> > +=C2=A0=C2=A0=C2=A0 while (true) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (__atomic_load_n((in=
t *)arg, __ATOMIC_SEQ_CST)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case THREAD_WAIT:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case THREAD_PATCH:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val=
 =3D __atomic_exchange_n((int *)&add1_or_nop, val,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 __ATOMIC_SEQ_CST);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case THREAD_STOP:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ass=
ert(false);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __b=
uiltin_unreachable();
>=20
> Use g_assert_not_reached() instead.
> checkpatch emits an error for it now.

Is there an easy way to include glib from testcases?
It's located using meson, and I can't immediately see how to push the
respective compiler flags to the test Makefiles - this seems to be
currently handled by configure writing to $config_target_mak.

[...]

