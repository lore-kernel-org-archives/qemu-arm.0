Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2741797ejg;
        Mon, 22 Jan 2024 13:08:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAuUKEBSZaBBmKxKBLRKXSvu/+rZp/I90Gg8So5ggw56/q+hP/vRTJI+fnnF93Au1SOtuk
X-Received: by 2002:a05:6358:3413:b0:175:d09d:6fd7 with SMTP id h19-20020a056358341300b00175d09d6fd7mr4502257rwd.43.1705957721164;
        Mon, 22 Jan 2024 13:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705957721; cv=none;
        d=google.com; s=arc-20160816;
        b=IYyYX3pcvAHTCxDjmQSKO1crgBOYA7yNCb6fs0fcxgsoD4hMWEoDZfV7FN9unlmLdF
         ROzohCciWMVhg5VrunAjEX3nNRGZXexZcwVkccy4Z7z3VnrACt6x2u+pHVmXM5tJ8H/X
         N5eLEcMLqbcg9CLC06Ctq8NAD9gM748EeRum4O/OVHeg4dwdwm3nONv/SDPoST7OmHPQ
         E7vIcseTlxz5r+pYzJI8uq9XPGQj5oRfrdqgwztoRFdwT0VyepvP/4qnvfnjnNnHDrCj
         dVe5OPp/jOmPT4ufblxvKTUaCc5xc1HqSZ4lGVG3MplnMW8cTaG0dH915XGP/89jjrBh
         2jLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=W0QYU9EiatvYhqqkdNwRTy7IOqvo40s0QzAx49GDfCo=;
        fh=hBsDdU2J2vnqH761c116v7xc2dp10Isn09am3SZ9h54=;
        b=D1rn2zULgK8A5aj8C2Bkuytoy9xJTJv7vKOZcUhCjMnN/LrstNpQsp2wfG4hzEyF63
         JClwInydRrtsesjqRIIh0zYd54r7Odb12I74IuXJN7fwlBcyDsjSyXLTffpcmki1fl9W
         unTlyjPbAbgi47Xc7P6Jdt8WiTk9cW1hVq3erXWF47aDrPYnK72tScz2JkSDlCN5RYtf
         9E+wgWanpzwVtlVoKr2LgxvrdPE66a6E6JTnn0fLndlaXSEVoq4EStk4mGk8bi87cf7O
         klf7yZmMhRXyld1IUoRtMcxdb0/u59+NvA1eMMuMJ1jIKWTQMfuLcpZqxnt02jnt8/9d
         wFrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Ahhmt1Qr;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id z207-20020a814cd8000000b005ff8c880addsi410014ywa.428.2024.01.22.13.08.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jan 2024 13:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Ahhmt1Qr;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40MKXfpV000551;
	Mon, 22 Jan 2024 21:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=W0QYU9EiatvYhqqkdNwRTy7IOqvo40s0QzAx49GDfCo=;
 b=Ahhmt1Qro0ZE4BitOxu1XL9Wtm+ynIOfhV8GHiMJXzVas6YGRSuERbhcJmV4gXnQCAnz
 Y1/KZP10T/ZkCcjVbMPSp/Kndw876qcPdtng/PcaLfexnaVLR0gwfXtywCh2UBWdPuMA
 SrSUygwytqZDaOrb8fk9xm+9UAlB+h9r5t+x34Kg3PRA2SyaxSFqI0E4yQj7/GGluEbO
 D5n0TW0qgy1ly/wRsWV7pnMLSuLTbdraELOJqh2wKmkFwDOeHCsr9OBf059I0jO5qGAK
 RE7TqtrR+oePbDn0RlxfQbdNY3Z0FH9KjVf64xViMi16hMSit9iKQjpYhZYUFtbl+pNa tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vsygh0rks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 21:08:40 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40ML38D9000637;
	Mon, 22 Jan 2024 21:08:39 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vsygh0rkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 21:08:39 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40MKGQSD025277;
	Mon, 22 Jan 2024 21:08:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqk2s21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 21:08:38 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40ML8bX666060604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jan 2024 21:08:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0565C20040;
	Mon, 22 Jan 2024 21:08:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7942020043;
	Mon, 22 Jan 2024 21:08:36 +0000 (GMT)
Received: from heavy (unknown [9.171.83.169])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 22 Jan 2024 21:08:36 +0000 (GMT)
Date: Mon, 22 Jan 2024 22:08:35 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: Re: [PATCH v3 2/3] tests/tcg: Factor out gdbstub test functions
Message-ID: <c3ve2aclqw7dbtubjxrwpu6tlfjdufqncgy4xiqesgs24jw2cd@uda3e7rgdpt2>
References: <20240116003551.75168-1-iii@linux.ibm.com>
 <20240116003551.75168-3-iii@linux.ibm.com>
 <87v87lmk7n.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v87lmk7n.fsf@draig.linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aFlWd8vN7Gl84hL8T08kf7lK_xriWneu
X-Proofpoint-ORIG-GUID: RAJcDYFT93bx_ou0OtERhDr_NunOENhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_09,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxlogscore=923 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401220150
X-TUID: rphfr9KN9+WW

On Mon, Jan 22, 2024 at 04:00:44PM +0000, Alex Bennée wrote:
> Ilya Leoshkevich <iii@linux.ibm.com> writes:
> 
> > Both the report() function as well as the initial gdbstub test sequence
> > are copy-pasted into ~10 files with slight modifications. This
> > indicates that they are indeed generic, so factor them out. While
> > at it, add a few newlines to make the formatting closer to PEP-8.
> >
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  tests/guest-debug/run-test.py                 |  7 ++-
> >  tests/guest-debug/test_gdbstub.py             | 58 +++++++++++++++++++
> >  tests/tcg/aarch64/gdbstub/test-sve-ioctl.py   | 34 +----------
> >  tests/tcg/aarch64/gdbstub/test-sve.py         | 33 +----------
> >  tests/tcg/multiarch/gdbstub/interrupt.py      | 47 ++-------------
> >  tests/tcg/multiarch/gdbstub/memory.py         | 41 +------------
> >  tests/tcg/multiarch/gdbstub/registers.py      | 41 ++-----------
> >  tests/tcg/multiarch/gdbstub/sha1.py           | 40 ++-----------
> >  .../multiarch/gdbstub/test-proc-mappings.py   | 39 +------------
> >  .../multiarch/gdbstub/test-qxfer-auxv-read.py | 37 +-----------
> >  .../gdbstub/test-thread-breakpoint.py         | 37 +-----------
> >  tests/tcg/s390x/gdbstub/test-signals-s390x.py | 42 +-------------
> >  tests/tcg/s390x/gdbstub/test-svc.py           | 39 +------------
> >  13 files changed, 98 insertions(+), 397 deletions(-)
> >  create mode 100644 tests/guest-debug/test_gdbstub.py

[...]

> > +    if gdb.parse_and_eval("$pc") == 0:
> > +        print("SKIP: PC not set")
> > +        exit(0)
> > +
> > +    try:
> > +        test()
> > +    except:
> > +        print("GDB Exception:")
> > +        traceback.print_exc(file=sys.stdout)
> > +        global fail_count
> > +        fail_count += 1
> > +        import code
> > +        code.InteractiveConsole(locals=globals()).interact()
> > +        raise
> 
> While I can see this is useful we don't want to default to an
> interactive console as that will hang the test in CI type setups. Can we
> make this a option we enable?

Would something like `export QEMU_TEST_INTERACTIVE=1` be okay?

[...]
