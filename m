Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp659579njb;
        Thu, 4 Jul 2024 07:50:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7oOwhksybjIof4hG2wFmEt5EnDs3QBFniGvIYWoEjxcWZs9RKNdcl+VN7EmHsxPX46yPRLIVylybYASSZu70wswbmOCMV
X-Google-Smtp-Source: AGHT+IHMaSXjrztq3MZwZxeewiqUyKCjn1Yt1SDC6Mczo9jRXYd1ql6kLNvjbKIlvKozLdKwK8z4
X-Received: by 2002:a05:6214:240b:b0:6b4:f7bb:6d69 with SMTP id 6a1803df08f44-6b5ee68a1ecmr24223136d6.32.1720104653209;
        Thu, 04 Jul 2024 07:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720104653; cv=none;
        d=google.com; s=arc-20160816;
        b=NwOxe7cAAmkQwvMhcrexFnkZt6eN/YUOlwly3nNS5QVK0J+fpXNNRdbcTUCTKZh9i4
         /buyAX7Y7de7gfWlbUSm5ZUpdUvFF4dTWalwJcaa+NK+9UNuiuM6A3iJvnpq7iMajhZ/
         SflfUta9TTLWcLql+TPDoFJgpzO21ERMtExa7OZt0xI0gOeu/ZDUb+ZyXhyufzJ0E/au
         yINeuOgQdBJJbBC38kJ3jPwYKLgpMO3ZrGVPNXCefbgaTfHCdLZZcrnlyY7nCWePDySJ
         XBJLgaOBEq5EO1ycHKQyW6M5F8mILExT/dXyhP9AgCtZP0R6Rezl/gl2fFevVvt/aTeE
         pF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=Ov5dR3NVQWZEsjuC0WltBWgRBB1v8xN3mLzqhgCv0LM=;
        fh=nR1PoS0NFYu87LthRCKHU/2fUNsT4yxgqIpw+B7bCgo=;
        b=iPYuy2elDgPg5d6l+5k17fB4nCu4gskMVBVaBpGLxtAVqJx2/Evsa1DUQSjHXY/+8z
         DxcW+WsozmFKW57OfYHHxf4t6pwXf7I0O4Kbx8HyE3vy0TqXgAkrspNivGgY+kEPW/l+
         bW15fH+wUIe2TqBrD5dB2Ee7JN+sOfX3xTGJ0M6rYi5T01N00Fl51FcYb+UWJ/Xq2yS8
         FhaVcxqMAzNu2uqxdpxr1Sj8HKlz9O2YOHnCC7klMuMQ5cj194ppmAQ/PswtDLfSURyZ
         DXwTbU3ci/STcyGq6YXGLnPbXlvadBmUvq9Xprcum6wW4alyQnHhW1GN/e0r3FN8aq6y
         Hq9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ZAhFxUbD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e6072e6si150110216d6.445.2024.07.04.07.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 07:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ZAhFxUbD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPNnC-0006sY-4I; Thu, 04 Jul 2024 10:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1sPNnA-0006rh-Na; Thu, 04 Jul 2024 10:50:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1sPNn9-0004HA-1s; Thu, 04 Jul 2024 10:50:36 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464Dvhrv028382;
 Thu, 4 Jul 2024 14:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:content-transfer-encoding:mime-version; s=pp1; bh=
 Ov5dR3NVQWZEsjuC0WltBWgRBB1v8xN3mLzqhgCv0LM=; b=ZAhFxUbDHGQ8iL7h
 pPa/Y7QRrNhDtopozJPn6eIc4taZvsfdRwPJKay9onzb2QGaK+R5XIHCAWNbWulF
 W89bc5LCahszWnePnIqcq/xrTL+lZ1c07gVfqs8LVLojd2aoe2EGqCJJo+o4x3hr
 KgMdz01VBdjA8pMJL9dc5N+g03CteGOmafdfKfUQV/bckNdck5Oa40AajHcoPCzp
 J1YHMk2XEl0NyI1TgA8f/A3mQ3TkfyqsjUJ1jfCABJpiPvk00Duw0yUx1zas3ZVE
 tC3yMLdgvN5SxixCaENEryvrppdwqofJ6i9XB6XxwFG++KMCyYWSBz4R4nZ3JjbR
 suFZeA==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 405sju0pbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 14:50:23 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 464EoMjB011794;
 Thu, 4 Jul 2024 14:50:22 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 405sju0pbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 14:50:22 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 464E5Zl4005945; Thu, 4 Jul 2024 14:50:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 402vkugug5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 14:50:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 464EoIrY40763766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jul 2024 14:50:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EFCE20040;
 Thu,  4 Jul 2024 14:50:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E57AA2004B;
 Thu,  4 Jul 2024 14:50:17 +0000 (GMT)
Received: from [127.0.0.1] (unknown [9.152.108.100])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jul 2024 14:50:17 +0000 (GMT)
Message-ID: <13b19a4859e25274d05663bc0ca05621c56af985.camel@linux.ibm.com>
Subject: Re: [PATCH 0/2] target/arm: Fix unwind from dc zva and FEAT_MOPS
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, david@redhat.com,
 balaton@eik.bme.hu
Date: Thu, 04 Jul 2024 16:50:17 +0200
In-Reply-To: <20240702234155.2106399-1-richard.henderson@linaro.org>
References: <20240702234155.2106399-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PK1HpEFLX_gBm0BPdLMKMNrcWYQl-D8Y
X-Proofpoint-ORIG-GUID: Cy5r1Ez5bgLcK3GtC22ihuODAxHZgPQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=572 phishscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WDTyKUboEfDA

On Tue, 2024-07-02 at 16:41 -0700, Richard Henderson wrote:
> While looking into Zoltan's attempt to speed up ppc64 DCBZ
> (data cache block set to zero), I wondered what AArch64 was
> doing differently.=C2=A0 It turned out that Arm is the only user
> of tlb_vaddr_to_host.
>=20
> None of the code sequences in use between AArch64, Power64 and S390X
> are 100% safe, with race conditions vs mmap et al, however, AArch64
> is the only one that will fail this single threaded test case.=C2=A0 Use
> of these new functions fixes the race condition as well, though I
> have not yet touched the other guests.
>=20
> I thought about exposing accel/tcg/user-retaddr.h for direct use
> from the targets, but perhaps these wrappers are cleaner.=C2=A0 RFC?
>=20
>=20
> r~
>=20
>=20
> Richard Henderson (2):
> =C2=A0 accel/tcg: Introduce memset_ra, memmove_ra
> =C2=A0 target/arm: Use memset_ra, memmove_ra in helper-a64.c
>=20
> =C2=A0include/exec/cpu_ldst.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 40 ++++++++++++++++
> =C2=A0accel/tcg/user-exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 +++++++++
> =C2=A0target/arm/tcg/helper-a64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 10 ++--
> =C2=A0tests/tcg/multiarch/memset-fault.c | 77
> ++++++++++++++++++++++++++++++
> =C2=A04 files changed, 144 insertions(+), 5 deletions(-)
> =C2=A0create mode 100644 tests/tcg/multiarch/memset-fault.c

This sounds good to me.

I haven't debugged it, but I wonder why doesn't s390x fail here.
For XC with src =3D=3D dst, it does access_memset() -> do_access_memset()
-> memset() without setting the RA. And I don't think that anything
around it sets the RA either.
