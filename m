Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp580009ejf;
        Mon, 15 Jan 2024 16:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQueF06eocwvHS4V2VwqX1npNUwTt1rDq7BmfdK/UZSLnIhY8GwixTB5Sg9OU7CwBTRWVB
X-Received: by 2002:a05:6902:38c:b0:dbf:c71:828 with SMTP id f12-20020a056902038c00b00dbf0c710828mr3130381ybs.122.1705365359727;
        Mon, 15 Jan 2024 16:35:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705365359; cv=none;
        d=google.com; s=arc-20160816;
        b=GYl8DL42dXmZ5Ga9lJdYIDtal9GxWggSuC9XXU1w30VB5by6te4LGQn34fyC47+SXy
         F6WH+bHQkxf/L/LaJoll+0gjHahK/JcpP855ivWVnxbs6m4GisMf7E1i027LEOnq+RzN
         10ZfYXgx6QhODgaCCbrqLKyX8WzbPbPv/V79pdRi2yHUzLx8jZw2TdmsANk67OetPsBt
         1mnECLuLqOQS4yc2/MHIqpICvTy798K9duNCb2mKsIRbpxl+/kufqJEb/sl6JH/qgNXA
         FxthWnJq+X5chzhL1D4KZ2hGuAZobCL4W+q4Bw7AQhcY0FuRb73YBB6RzzJMcbm512hJ
         fcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=XPC4Rag2AhMVOS5iSAhiDecyP9fSPQwOj6xDaOF+UVY=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=zU/ga0xiXMM7p6rfmBsmy3UtiGAQY+dazUN3EWF1HTLbJPnRPyga5OQL38AflKE8jg
         tj1VFJ15oVfL4eb4nul0qeayPeoEDrcy5qcs5/gp8g6GbI0CnVoT9fFHEEo42RkGa7q/
         Xh4OaURt1niu+txIL/L6kILBkuV0raCbS7mi4q/xxkF7NPUjbeyDFuEAqdJjXjbDjQHe
         JSbNQT18aMqXAO8I3ldZM9kAggkim1T1DrNdd3joxYQgHK5jRnZmBaVKvG0RU0dMKesc
         2SRENf2ihNiN45bbG63g70OewqZFKo3G8U76g84ka+B8TeDf/3XrUl+9rd3Fc6W6oCwz
         AGFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=julnYcpb;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id e93-20020a25a3e6000000b00dbf21db22cfsi3506241ybi.80.2024.01.15.16.35.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jan 2024 16:35:59 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=julnYcpb;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40FLv3oE025638;
	Tue, 16 Jan 2024 00:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=XPC4Rag2AhMVOS5iSAhiDecyP9fSPQwOj6xDaOF+UVY=;
 b=julnYcpbl7r5TB22BpC8dz3HicMXUwt0TJfZ7YV1UbWvA0+SGBdtyAWWSzXMeB1s8fFe
 w15L3tCxcQtEtHc721W0VIfKsI4e1rKwCdLULN6WNb9S9OMOIgwpHD937LAiR/vC3ydA
 lx0ztOAIqmIKaMXr09ixoku5aPf0+kmQCsMT2fKykx7jAzOgTgdUfiBvjXJjapdMBbv5
 RmImCiVGg60uecu9uFbjq67bOPGtSaEEG1dSRawNgIb6uuNPkBA2ZGuBzdWQ6FP8llQq
 LDojDHb6fD2h0pmTn2zn87dtS7BQGaePD/0+eTk760e8ScTcnB67C5PI4ZC/BSbRoLKw Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vnc91bnjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 00:35:58 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40G0ILex015228;
	Tue, 16 Jan 2024 00:35:58 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vnc91bnjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 00:35:57 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40FMo1Fj023656;
	Tue, 16 Jan 2024 00:35:57 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vm7j1jycc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 00:35:57 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40G0ZtJH61538604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jan 2024 00:35:55 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6251720043;
	Tue, 16 Jan 2024 00:35:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B240720040;
	Tue, 16 Jan 2024 00:35:54 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.4.64])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Jan 2024 00:35:54 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/3] linux-user: Allow gdbstub to ignore page protection
Date: Tue, 16 Jan 2024 01:31:39 +0100
Message-ID: <20240116003551.75168-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N_TZQ5TEmaIHvQIM4tkVaoQSt-9SD-Os
X-Proofpoint-ORIG-GUID: IIcC90s8qAAxhOfj0NjHjjeaCnsLc9I0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-15_17,2024-01-15_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 mlxlogscore=800 impostorscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401160002
X-TUID: gYExJOcmyAx3

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

 cpu-target.c                                  | 76 +++++++++++++++----
 tests/guest-debug/run-test.py                 |  7 +-
 tests/guest-debug/test_gdbstub.py             | 58 ++++++++++++++
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py   | 34 +--------
 tests/tcg/aarch64/gdbstub/test-sve.py         | 33 +-------
 tests/tcg/multiarch/Makefile.target           |  9 ++-
 tests/tcg/multiarch/gdbstub/interrupt.py      | 47 ++----------
 tests/tcg/multiarch/gdbstub/memory.py         | 41 +---------
 tests/tcg/multiarch/gdbstub/prot-none.py      | 22 ++++++
 tests/tcg/multiarch/gdbstub/registers.py      | 41 ++--------
 tests/tcg/multiarch/gdbstub/sha1.py           | 40 ++--------
 .../multiarch/gdbstub/test-proc-mappings.py   | 39 +---------
 .../multiarch/gdbstub/test-qxfer-auxv-read.py | 37 +--------
 .../gdbstub/test-thread-breakpoint.py         | 37 +--------
 tests/tcg/multiarch/prot-none.c               | 40 ++++++++++
 tests/tcg/s390x/gdbstub/test-signals-s390x.py | 42 +---------
 tests/tcg/s390x/gdbstub/test-svc.py           | 39 +---------
 17 files changed, 229 insertions(+), 413 deletions(-)
 create mode 100644 tests/guest-debug/test_gdbstub.py
 create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
 create mode 100644 tests/tcg/multiarch/prot-none.c

-- 
2.43.0
