Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp678117ejq;
        Wed, 24 Jan 2024 18:39:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaR9h9qHBGQD3I7FAZYLQg5pdLt7hOyaU4djWEr8AioU+ZzqagtNjS+dCNKjt+HG53QFKK
X-Received: by 2002:a05:6358:6f94:b0:172:e3d3:4906 with SMTP id s20-20020a0563586f9400b00172e3d34906mr416428rwn.34.1706150396253;
        Wed, 24 Jan 2024 18:39:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706150396; cv=none;
        d=google.com; s=arc-20160816;
        b=CfSCMrLRUqnUz6sxD5oMHY8ATPP6QVR+Ie3BKwJ6yfeUiSYVfM+DqCtwEW06aW7Qnd
         qm5gAJdV3LJsP5cyK5fEs0TdteBf22SAatc2oaasMtXyqZlxeNCRbqIz9mc6EoH/hn/5
         05QpyZFuXk7TI8rRSrGdfpVISsA1HKOVbGs8buKfYV7nl+f5nca53hAU9SthoDdyYB5o
         N7gI8uAFc0lXrX5GUBd3n9X9VUWd/8bnwJXyPV9ckeAZgWchqag4YK/4EHJzhaBc5iUu
         8btH3Gk5BeS3iIWbmssZ3zeGPvK5YZPhwIwk2eprVncV8V8BxbFe38PBN0hPoQmJZr1O
         bUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7h03dd4d2afjNjPxjioFMh8YUf/SKcW0V9zZKuwgNAA=;
        fh=hBsDdU2J2vnqH761c116v7xc2dp10Isn09am3SZ9h54=;
        b=JPFZqe+11GenNxjbFqR+Oq50XpVOXKrxwi1rgfYgQWIjuFq6keteCQdcTGREMnkY6o
         5k5kFkJNV6I+kUAdpYkOWiQHqE5REuRmxr5YJJ3HrgDQZPbjgRxji9hbuDLPxbCzCGW/
         4cxS5EX/wWO2iEAW0nAXgLXZmf/6tuEo9LDMlmLKOkWVEosL5pgUkWGoklcQu3cv9IC9
         tvvYO9tmc7Ixl5U+FRiUduZw8YKWpVd0CYPgnqQMLEIs6pizTWogU6vxDgVflB0fh0sw
         gzer7A2S0ZS3l/hyWgrsaywTCkXtCT1ehXJEOga2JO91pOx55dxuk3V2Ajt8YC/Kkta6
         oVgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=etfqBR67;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id h7-20020a17090a130700b00290e0e74a9bsi523116pja.75.2024.01.24.18.39.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jan 2024 18:39:56 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=etfqBR67;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40P20Hd9029738;
	Thu, 25 Jan 2024 02:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=7h03dd4d2afjNjPxjioFMh8YUf/SKcW0V9zZKuwgNAA=;
 b=etfqBR67RweNK6czvOYBTQ7LhHaZq/8U4rnThkowIWMq7+MrqxPGjjRkZYMxd/s01Myt
 ZLKrUDb1in2XgMPrA/3uBd5LJ5I/+gkRVre9eTZjMPXDGlnk69jr/VQtd4G5beIdjmfR
 jiTiXtZsXZwLgkjpqUuxFDdKhLibqoPXn1R8SBwtMvkFDKxUtLD67BXqIIx3cmEjdmsG
 TphknRO73yAJKw9/VtBJGU07qjCKKUYt3K3dJZlsuKIqiiqeYmUmE17RbN3WtwE1klfN
 eZY072yT795YU0kz/3v03VzITKIryApw78R0YyHCusbJNPku6FZA6xiNn3PHDUb3bzyo UA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vue2ghegs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 02:39:55 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40P2KZxV031993;
	Thu, 25 Jan 2024 02:39:54 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vue2ghege-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 02:39:54 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40P2d4kt022429;
	Thu, 25 Jan 2024 02:39:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrt0m9np5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 02:39:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40P2dpAs41812312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jan 2024 02:39:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2215220040;
	Thu, 25 Jan 2024 02:39:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 842C72004B;
	Thu, 25 Jan 2024 02:39:50 +0000 (GMT)
Received: from heavy (unknown [9.179.10.76])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 25 Jan 2024 02:39:50 +0000 (GMT)
Date: Thu, 25 Jan 2024 03:39:49 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v3 3/3] tests/tcg: Add the PROT_NONE gdbstub test
Message-ID: <dzmijsonpnmv47smzbydfgg6pr5emzyhodflog2cdnfcpy64kp@jomrfa47g325>
References: <20240116003551.75168-1-iii@linux.ibm.com>
 <20240116003551.75168-4-iii@linux.ibm.com>
 <871qa9nz2f.fsf@draig.linaro.org>
 <aybsdiscvgcl5kici5lfupjtykvkyw4u5g3bdncmv3wufzwgou@r42zm6labldl>
 <87jzo1lzx2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzo1lzx2.fsf@draig.linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ap5Noetn8rjwF62w3BsAq4yj1O46Lg6Q
X-Proofpoint-GUID: 3pYfDREC4UzDJjNBaI-6kAX9Ys0aKvMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_12,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401250018
X-TUID: 9gcY9Ks7Gzj4

On Mon, Jan 22, 2024 at 11:19:05PM +0000, Alex Bennée wrote:
> Ilya Leoshkevich <iii@linux.ibm.com> writes:
> 
> > On Mon, Jan 22, 2024 at 03:54:32PM +0000, Alex Bennée wrote:
> >> Ilya Leoshkevich <iii@linux.ibm.com> writes:
> >> 
> >> > Make sure that qemu gdbstub, like gdbserver, allows reading from and
> >> > writing to PROT_NONE pages.
> >> >
> >> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> >> > ---
> >> >  tests/tcg/multiarch/Makefile.target      |  9 +++++-
> >> >  tests/tcg/multiarch/gdbstub/prot-none.py | 22 +++++++++++++
> >> >  tests/tcg/multiarch/prot-none.c          | 40 ++++++++++++++++++++++++
> >> >  3 files changed, 70 insertions(+), 1 deletion(-)
> >> >  create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
> >> >  create mode 100644 tests/tcg/multiarch/prot-none.c
> >
> > [...]
> >
> >> > +def run_test():
> >> > +    """Run through the tests one by one"""
> >> > +    gdb.Breakpoint("break_here")
> >> > +    gdb.execute("continue")
> >> > +    val = gdb.parse_and_eval("*(char[2] *)q").string()
> >> 
> >> Better traceback:
> >> 
> >>   Breakpoint 1, break_here (q=0x400000802fff) at /home/alex/lsrc/qemu.git/tests/tcg/multiarch/prot-none.c:14
> >>   14      }
> >>   GDB Exception:
> >>   Traceback (most recent call last):
> >>     File "/home/alex/lsrc/qemu.git/tests/guest-debug/test_gdbstub.py", line 42, in main
> >>       test()
> >>     File "./tests/tcg/multiarch/gdbstub/prot-none.py", line 14, in run_test
> >>       val = gdb.parse_and_eval("*(char[2] *)q").string()
> >>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>   gdb.MemoryError: Cannot access memory at address 0x400000802fff
> >>   Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
> >>   Type "help", "copyright", "credits" or "license" for more information.
> >>   (InteractiveConsole)
> >>   >>> 
> >
> > Thanks for the debug output. This shows that the feature being tested
> > doesn't work (the value of `q` looks sane to me). May I ask what host
> > distro is this? I tried on x86_64 Fedora 38 and x86_64 Ubuntu 22.04 so
> > far, and the test was successful.
> 
> Debian Bookworm (x86_64) with gdb-multiarch installed.
> >
> > [...]
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

Hm, I tried that (in a VM, in case the kernel is somehow involved) and
that worked too:

  Breakpoint 1, break_here (q=0x400000802fff) at /qemu/tests/tcg/multiarch/prot-none.c:14
  14      }
  PASS: 42 == 42

I wonder what else can be different. Can it be that in your case the
test runs without /proc? Or perhaps some additional LSM is enabled?
