Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp599701ejs;
        Tue, 9 Jan 2024 11:39:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdEF5C+LlYkzJ0kTq3pHdr5c9A2Yaq++MaBvJc8Y3dNmQA+eUGm/N7XOURmA5r3sPMPgVP
X-Received: by 2002:a81:5402:0:b0:5e7:b8bf:7a64 with SMTP id i2-20020a815402000000b005e7b8bf7a64mr5129248ywb.85.1704829145703;
        Tue, 09 Jan 2024 11:39:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704829145; cv=none;
        d=google.com; s=arc-20160816;
        b=k7t57dgJRXr6cdVA0konFA//nwG97EleCBatV2ItysjXOhZFk/PqF6ylTsFUGvmh7U
         CHHzGAX2NTBZSssmK9mm6PVruTTB8BPP8aP6QKa4KwLFzNVmi7LbkAPCyCBClya2kode
         Z6kFs5+A1Xh6H/vnohExBPi5erkKm/bNgysb8JaKRJyEzL6NQSmejZiFE/50RBpBJCW9
         Vyh4tVY+JhD+SLn4qouy4+YSNZ1WwsfYxOT8GZZp+fNl+oJ1USNCALc7IwECk4eDhEh+
         hCkFXpqJsu51RLyDnYfKOs6AtuiJ2C2mi2lmC3zNg0cxxTosanZ4Dsaj9STnuAb1EA8/
         QAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=v1Ys5UoQvqyvOZVHNyK2gndac13fXVfP3voCbvZiAYc=;
        fh=ySpFvo+DCssipn/6esbM/M/CPtUmNEswhMzOkPHPJKw=;
        b=OC2IiShWjfE1jobrnY7K8XLG+xXim3iwOHB91DTbQ1uUtvYIQrpNjl2l1gP6AQqOAn
         gr3/9WsKEg0+fANMcZjsOZnlc++8h1EvcOrfrv3qleYMD7aIOBOYpF4NQFviwuqhuHsR
         3yPXj+gZCd/bMZa58IlI5mHeLjmBQ+7BUJItlQXN6caa72mxiuhI2fN6bfDYO3elkrul
         Di65/6zfDSZVqwJRRFFKUj02IQSNmkZljheFbojycXkhaUkccES4Kw39F8IQnlQVftZJ
         xAoBEdAHX8ck9AGAW9QvvLVuzYNP7uXJvngWKLEM5rPKomqMvhlNLn27q07aG3mrvsPt
         rE3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=i1zPGhpz;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id t138-20020a817890000000b005fa1932fd5esi44550ywc.286.2024.01.09.11.39.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 11:39:05 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=i1zPGhpz;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 409Hukja017531;
	Tue, 9 Jan 2024 19:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=v1Ys5UoQvqyvOZVHNyK2gndac13fXVfP3voCbvZiAYc=;
 b=i1zPGhpz82WlDqqfPyCpNZ+9SWNaa+velY+1i4iL5x+RtYKWfhxXYgst2VFKsAjgLJuS
 Rw5rnHPgH6erdTlh3l0bPKjbsoYffOqkGxpLGoWo6J7pEnX5G6hdLIT+kLsIvB1JbXx/
 CgfiR8ZzCgToPrFO/WEgUUNdeMureLdk116+L3wSWAybQXnWnC5PyOoNxS4PaAhtLkWw
 6Oh0gibKTQWtZxY1Fvl4K91btNe/d7cdLX5AW0iw8MIIFyAOT+ZcuWjhr9Ol9RiR+5d5
 VaZs6BilZFSdmk5RiyK+KDWmUlsH0VlXMn582wcliYjG5cGQN0lUHyXUYDUSk5cTJFHi TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vh9f8w4tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 19:39:04 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409JEbt5019696;
	Tue, 9 Jan 2024 19:39:04 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vh9f8w4th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 19:39:04 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 409IZXLN022781;
	Tue, 9 Jan 2024 19:39:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfhjygx1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 19:39:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 409Jd1di42139958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jan 2024 19:39:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 823A92004B;
	Tue,  9 Jan 2024 19:39:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A8FC20043;
	Tue,  9 Jan 2024 19:39:01 +0000 (GMT)
Received: from [9.171.60.193] (unknown [9.171.60.193])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jan 2024 19:39:01 +0000 (GMT)
Message-ID: <139c997f23a3e7edd8334de124d0ba7820cf6dc9.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] linux-user: Allow gdbstub to ignore page protection
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell
	 <peter.maydell@linaro.org>,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
	 <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        Philippe
	=?ISO-8859-1?Q?Mathieu-Daud=E9?=
	 <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Date: Tue, 09 Jan 2024 20:39:00 +0100
In-Reply-To: <0195c274-0d5c-484b-9475-84a4d16bfae8@linaro.org>
References: <20240108233821.201325-1-iii@linux.ibm.com>
	 <20240108233821.201325-2-iii@linux.ibm.com>
	 <0195c274-0d5c-484b-9475-84a4d16bfae8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HmV9mEOLbVoQzvmFEp3lT72JAtKOu76U
X-Proofpoint-ORIG-GUID: DSOadI09zZmVdANh_PCXDrM340jHBLxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_09,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=805 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090158
X-TUID: A39OCV5N5awx

On Wed, 2024-01-10 at 04:42 +1100, Richard Henderson wrote:
> On 1/9/24 10:34, Ilya Leoshkevich wrote:
> > gdbserver ignores page protection by virtue of using
> > /proc/$pid/mem.
> > Teach qemu gdbstub to do this too. This will not work if /proc is
> > not
> > mounted; accept this limitation.
> >=20
> > One alternative is to temporarily grant the missing PROT_* bit, but
> > this is inherently racy. Another alternative is self-debugging with
> > ptrace(POKE), which will break if QEMU itself is being debugged - a
> > much more severe limitation.
> >=20
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > =C2=A0 cpu-target.c | 55 ++++++++++++++++++++++++++++++++++++++--------=
-
> > -----
> > =C2=A0 1 file changed, 40 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/cpu-target.c b/cpu-target.c
> > index 5eecd7ea2d7..69e97f78980 100644
> > --- a/cpu-target.c
> > +++ b/cpu-target.c
> > @@ -406,6 +406,15 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr
> > addr,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vaddr l, page;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void * p;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t *buf =3D ptr;
> > +=C2=A0=C2=A0=C2=A0 int ret =3D -1;
> > +=C2=A0=C2=A0=C2=A0 int mem_fd;
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Try ptrace first. If /proc is not mounted o=
r if there is a
> > different
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * problem, fall back to the manual page acces=
s. Note that,
> > unlike ptrace,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * it will not be able to ignore the protectio=
n bits.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 mem_fd =3D open("/proc/self/mem", is_write ? O_WRON=
LY :
> > O_RDONLY);
>=20
> Surely this is the unlikely fallback, and you don't need to open
> unless the page is=20
> otherwise inaccessible.

Ok, I can move this under (flags & PAGE_*) checks.

> I see no handling for writes to pages that contain TranslationBlocks.

Sorry, I completely missed that. I'm currently experimenting with the
following:

	/*
	 * If there is a TranslationBlock and we weren't bypassing
host
	 * page protection, the memcpy() above would SEGV, ultimately
	 * leading to page_unprotect(). So invalidate the translations
	 * manually. Both invalidation and pwrite() must be under
	 * mmap_lock() in order to prevent the creation of another
	 * TranslationBlock in between.
	 */
	mmap_lock();
	tb_invalidate_phys_page(page);
	written =3D pwrite(fd, buf, l, (off_t)g2h_untagged(addr));
	mmap_unlock();

Does that look okay?

[...]
