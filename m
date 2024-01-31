Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1417241ejk;
        Wed, 31 Jan 2024 03:48:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqU2GHCG7a40q0tpCKgSB4K+R2PtqG/PUpG7JOXQdxG2CSuUGEP87hK5FMaeJ+zDO5q4NL
X-Received: by 2002:a25:aa2c:0:b0:dc6:1735:e0ac with SMTP id s41-20020a25aa2c000000b00dc61735e0acmr1445223ybi.15.1706701704096;
        Wed, 31 Jan 2024 03:48:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706701704; cv=none;
        d=google.com; s=arc-20160816;
        b=Fh03rw40mDS9vjPH0PUnZYr6Dh4qd1mt7/NF4bXktum4GtB0+3Ocvyu2rygxIV03nG
         ueJKEFwtHiFPDkS/X06hkWVRx4SW6m1vZaLiN79io7geQwtUuP6CDPW5JdyhWwN5aJRI
         1J3RKZTxDm27mhZxiCDAz/Jg9KpmFah7rRRtjcfUPCPJRhQgWDzVfv27/0gLJakH/qrt
         aDA2nLosNIQRFgmlhsV6X/c7BbpewB45oS1Bc3VetDrv5tTqB7NfBMRotPpdfmXv4aBK
         wIkupz5j6fWDnrzvAWLDdcQfYgIQN5sBTwOMgppRr5JReR93c66b/ApI/266h5gvDlt2
         ZD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4FQUjQhC01Tew674/pUPpzocTQIdWIRlLkpGMzoFTpA=;
        fh=JQc+W0jtUTepZaV4P5RVKOlUj6wNMHR6L5RQkffaadk=;
        b=MwMP/slLiCKK+X7Q8WqfLh8el553rqTQr4YJujblRJcpjd2ngGk7Xxv+x6nZ/6hSSi
         PreDntjpi3NxwGV7OqIomCg4Me91OVSWAYBBg9e1ToRGhKqzrRBLGEMJXhJLX6TCuskJ
         GaWUXSyWegwt7ui6fO+Lvi/vf74flCpDNlIy45zcA+aRZsUoLKUllaQS48X16Blh4IrW
         Ra27cHCbCH6/kHi23hLRq3eTE3YS+gnji3wsRQTiMIlxMVNIeB3axAHudbAK/yIEI5OX
         y6OQsDEkckcTWTXaeS19IsjhDmvCTlejbo0ljEWaiw74Z6T14PdZdnabVTeyV4U/9mkB
         xAhA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="OX5mm/wx";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
X-Forwarded-Encrypted: i=0; AJvYcCWFSg0cidwwMk7ZAhNmGvRaozByCVcvuJrajdBWy+EqiGsdaCBTmoIDSGaRvkYSgaq87//zXvuiJ/ZSf56jhXjmTMGAtriYsJdykDtfyxzKopd6Z/gkz4s9i6xno9mLB238IcJqNTIkyKZxz0HgAMyVhh7l
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id g186-20020a25dbc3000000b00dc238d90fb0si6032268ybf.55.2024.01.31.03.48.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jan 2024 03:48:24 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="OX5mm/wx";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40VBaZK3008112;
	Wed, 31 Jan 2024 11:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=4FQUjQhC01Tew674/pUPpzocTQIdWIRlLkpGMzoFTpA=;
 b=OX5mm/wxkQO9dg5uNjVOXIgDsJYfBAEBzknj1zhHdZ3LEWcRnfWtLbZJ1HAOWaHM4dM8
 fndrhNCvH4hsv2o0YWFqCaXNJfBQsslZsJkLp9f5S0jwrpbXwXdQnt9Xkuonw5/6I4Mo
 UT1lc9uNEuv6frOtx875PFg2Caaggy0J9b/Iw9kA+sYGoVo9KcvxFRxBOf17zvrXoKgk
 EX5GXzXaRI5MQBaHNgnLFchlSZt7XSnRPuoZXQb0oKTJg2qONXi9WTI/mklxJsKiRKeb
 03hkULWV8fQinu2CTjyiADu9k2pTGwlk9pLZIFWymCQ1N7V9exaNH8oz9egifHnALC/N uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vymu8195e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:48:23 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40VBg8Qt025207;
	Wed, 31 Jan 2024 11:48:22 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vymu8194t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:48:22 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40VB0NHt002190;
	Wed, 31 Jan 2024 11:48:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vwc5tddr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:48:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40VBmJdf44172024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jan 2024 11:48:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1896E20043;
	Wed, 31 Jan 2024 11:48:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC20E20040;
	Wed, 31 Jan 2024 11:48:18 +0000 (GMT)
Received: from black.boeblingen.de.ibm.com (unknown [9.155.200.166])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jan 2024 11:48:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 0/3] linux-user: Allow gdbstub to ignore page protection
Date: Wed, 31 Jan 2024 12:46:28 +0100
Message-ID: <20240131114817.288027-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kRkCROWgRgL8Ehvi9FKWWtCwtbH94_0d
X-Proofpoint-ORIG-GUID: n-1l93qGRcvnMrdz4lmbOuwXJ13NFKLp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=851 bulkscore=0
 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401310089
X-TUID: fCgvlX6GZXnY

v4: https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg05857.html
v4 -> v5: Fix the probe_proc_self_mem vs probe_proc_self_mem() typo.
          Add Alex's R-b and A-b.

v3: https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg02907.html
v3 -> v4: Hide InteractiveConsole behind QEMU_TEST_INTERACTIVE (Alex).
          Probe /proc/self/mem in the PROT_NONE test.

v2: https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg01592.html
v2 -> v3: Add Richard's R-b on [1/3].
          Fix printing the architecture name and the number of failures
          in test_gdbstub.py.
          Patches that need review: [2/3] and [3/3].

v1: https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg01314.html
v1 -> v2: Use /proc/self/mem as a fallback. Handle TB invalidation
          (Richard).
          Test cross-page accesses.

RFC: https://lists.gnu.org/archive/html/qemu-devel/2023-12/msg02044.html
RFC -> v1: Use /proc/self/mem and accept that this will not work
           without /proc.
           Factor out a couple functions for gdbstub testing.
           Add a test.

Hi,

I've noticed that gdbstub behaves differently from gdbserver in that it
doesn't allow reading non-readable pages. This series improves the
situation by using the same mechanism as gdbserver: /proc/self/mem.

Best regards,
Ilya


Ilya Leoshkevich (3):
  linux-user: Allow gdbstub to ignore page protection
  tests/tcg: Factor out gdbstub test functions
  tests/tcg: Add the PROT_NONE gdbstub test

 cpu-target.c                                  | 78 +++++++++++++++----
 tests/guest-debug/run-test.py                 |  7 +-
 tests/guest-debug/test_gdbstub.py             | 60 ++++++++++++++
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py   | 34 +-------
 tests/tcg/aarch64/gdbstub/test-sve.py         | 33 +-------
 tests/tcg/multiarch/Makefile.target           |  9 ++-
 tests/tcg/multiarch/gdbstub/interrupt.py      | 47 ++---------
 tests/tcg/multiarch/gdbstub/memory.py         | 41 +---------
 tests/tcg/multiarch/gdbstub/prot-none.py      | 36 +++++++++
 tests/tcg/multiarch/gdbstub/registers.py      | 41 ++--------
 tests/tcg/multiarch/gdbstub/sha1.py           | 40 ++--------
 .../multiarch/gdbstub/test-proc-mappings.py   | 39 +---------
 .../multiarch/gdbstub/test-qxfer-auxv-read.py | 37 +--------
 .../gdbstub/test-thread-breakpoint.py         | 37 +--------
 tests/tcg/multiarch/prot-none.c               | 40 ++++++++++
 tests/tcg/s390x/gdbstub/test-signals-s390x.py | 42 +---------
 tests/tcg/s390x/gdbstub/test-svc.py           | 39 +---------
 17 files changed, 247 insertions(+), 413 deletions(-)
 create mode 100644 tests/guest-debug/test_gdbstub.py
 create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
 create mode 100644 tests/tcg/multiarch/prot-none.c

-- 
2.43.0
