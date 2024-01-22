Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2752213ejg;
        Mon, 22 Jan 2024 13:31:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD092kbYJyeRbg28JtELLWEUjre6KefqJsxCZo0UZSHwRy142zHkV88F0o10IA4pFt9fDL
X-Received: by 2002:a05:6e02:60c:b0:360:b551:bb8f with SMTP id t12-20020a056e02060c00b00360b551bb8fmr3765525ils.101.1705959075058;
        Mon, 22 Jan 2024 13:31:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705959075; cv=none;
        d=google.com; s=arc-20160816;
        b=YxuKxJE8s4a3EITO7hfmKy0VLzgXxl1W5aRZfQXyBeSuV9etInEckwMT26M3R4L4NY
         peJLawEQ1/VE9VnKjAP/l9BHbdViK/EgxCDNOUO9FI/aPbu0GvUlYjpGKTahRpuZXzdS
         RZPgt3aWq/XRQvdwUK6vP65/5mtyi+qPodKJaZ+HY6xtWR+CbSMk/9NywLbzIEfZ/Fxb
         TWSRwOk+KAwVX2UL9D5rZxMuqpK0LNDNnRaU5L8BKj3aWDb9b5x4SVbSh2v2I6CEUzCM
         OW6fWG4xTHlJz1zVYVwLd6WI4ma/pKRapKcliUXQOzyvMxY86VRdadNbCfA4kXBZCQCR
         azlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=AzxswaSdptTEDo3W/yeo/M3ux5cfnS0/KQDqILVGnrI=;
        fh=hBsDdU2J2vnqH761c116v7xc2dp10Isn09am3SZ9h54=;
        b=ISsj9Ofo+yA0kzwwUvZEVQ0xp4EYoZfCOWXdCyqZTYotKIm9wp3tPNbdufsVtApy9L
         vbNrAE7hHaQO2fGfXfkXry63X5uLvcdGal1rJVRYmuhWpTnzSCXuD29G8lgizIbdQH8o
         ZjLkvJ0lom+XUHvsWI2s35Q1uLEP5loVbWmsXBy5nNWu50ZQ88rkPdihKpvdpkuMZO6p
         3fbvw9klNLIGDtl5UEGZwL50lZPoizneU1THAgmDB4690T0WY+Sj6OWt7JCu4ZucFNSE
         U2p+0WEiQ9un/R1IgupOgL1u9EHOTDULyRX4/AeOEZ7dGE1s/kTCd/RNUZUy7tp+viUB
         z0Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=kbLDMKTK;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id bx37-20020a056a02052500b005ce030e060esi8658372pgb.859.2024.01.22.13.31.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jan 2024 13:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=kbLDMKTK;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40MLMIDW015660;
	Mon, 22 Jan 2024 21:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=AzxswaSdptTEDo3W/yeo/M3ux5cfnS0/KQDqILVGnrI=;
 b=kbLDMKTKHl+ucFtFGHsOz6UAeOkWVRmRL+Dd6zLT27twTnewkIy/yUrESw4BM13/Pcmn
 uV5EUJwyUp0dfyW9Yxy2440Mny4KaZ3nermV/93euX2Z2UphijYlB8x3tO4QXuCZ6anW
 D8EMBvz+q3uSn1nUNSDORmrUaAsQVcT0oCAk+pcBulFRhvrdfrBXZGpMmv2nYxB7BUFG
 igzbDEh/nu/jw8/exccfhwh6+9DUYROYysfVyKKin12Wc5wsr3KVgy1uCSIYTJvQxyXs
 g746ebQUrL/NV6FzMlAp0ycXPIAijapMo/kgjNDkzTA14ajsYLINV2plcoz6It4icrLO QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vt07br6u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 21:31:13 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40MLNlHO019070;
	Mon, 22 Jan 2024 21:31:13 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vt07br6t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 21:31:13 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40MKbVj3025285;
	Mon, 22 Jan 2024 21:31:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqk2vbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 21:31:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40MLVAdb4391674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jan 2024 21:31:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1F6720043;
	Mon, 22 Jan 2024 21:31:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B3A420040;
	Mon, 22 Jan 2024 21:31:10 +0000 (GMT)
Received: from heavy (unknown [9.171.83.169])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 22 Jan 2024 21:31:09 +0000 (GMT)
Date: Mon, 22 Jan 2024 22:31:08 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: Re: [PATCH v3 3/3] tests/tcg: Add the PROT_NONE gdbstub test
Message-ID: <aybsdiscvgcl5kici5lfupjtykvkyw4u5g3bdncmv3wufzwgou@r42zm6labldl>
References: <20240116003551.75168-1-iii@linux.ibm.com>
 <20240116003551.75168-4-iii@linux.ibm.com>
 <871qa9nz2f.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qa9nz2f.fsf@draig.linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BMm8EY_NhMZmPDb7Hi_Qi4ULDrIGUr3A
X-Proofpoint-GUID: PprifhZw7RSfvShFWoNL6acTRzb0NnqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_09,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=934 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401220152
X-TUID: SOyAUDxI21vz

On Mon, Jan 22, 2024 at 03:54:32PM +0000, Alex Bennée wrote:
> Ilya Leoshkevich <iii@linux.ibm.com> writes:
> 
> > Make sure that qemu gdbstub, like gdbserver, allows reading from and
> > writing to PROT_NONE pages.
> >
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  tests/tcg/multiarch/Makefile.target      |  9 +++++-
> >  tests/tcg/multiarch/gdbstub/prot-none.py | 22 +++++++++++++
> >  tests/tcg/multiarch/prot-none.c          | 40 ++++++++++++++++++++++++
> >  3 files changed, 70 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
> >  create mode 100644 tests/tcg/multiarch/prot-none.c

[...]

> > +def run_test():
> > +    """Run through the tests one by one"""
> > +    gdb.Breakpoint("break_here")
> > +    gdb.execute("continue")
> > +    val = gdb.parse_and_eval("*(char[2] *)q").string()
> 
> Better traceback:
> 
>   Breakpoint 1, break_here (q=0x400000802fff) at /home/alex/lsrc/qemu.git/tests/tcg/multiarch/prot-none.c:14
>   14      }
>   GDB Exception:
>   Traceback (most recent call last):
>     File "/home/alex/lsrc/qemu.git/tests/guest-debug/test_gdbstub.py", line 42, in main
>       test()
>     File "./tests/tcg/multiarch/gdbstub/prot-none.py", line 14, in run_test
>       val = gdb.parse_and_eval("*(char[2] *)q").string()
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   gdb.MemoryError: Cannot access memory at address 0x400000802fff
>   Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
>   Type "help", "copyright", "credits" or "license" for more information.
>   (InteractiveConsole)
>   >>> 

Thanks for the debug output. This shows that the feature being tested
doesn't work (the value of `q` looks sane to me). May I ask what host
distro is this? I tried on x86_64 Fedora 38 and x86_64 Ubuntu 22.04 so
far, and the test was successful.

[...]
