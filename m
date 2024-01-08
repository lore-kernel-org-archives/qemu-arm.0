Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp72820ejs;
        Mon, 8 Jan 2024 15:38:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/OuebbJtPQYjyONtTjLxnVkFN8fcx0Ev1yo4acC0mbAnUh/OtSIlXK5+dmG0bKRkdHjiP
X-Received: by 2002:a05:6870:2c98:b0:204:b77:1718 with SMTP id oh24-20020a0568702c9800b002040b771718mr5904554oab.54.1704757116201;
        Mon, 08 Jan 2024 15:38:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704757116; cv=none;
        d=google.com; s=arc-20160816;
        b=ceN0y39KCP4nBggT69byib5xs9d0Z2dRG8oGG3esJm+OebZCbg2lObfPaOiSHiBhrf
         fP+OcPrY9e+ZHNu5aqaqfNJtm8cWmvmJdUQ9fznbo81QeMEzx/b/zvF34/rx7898+wQ1
         HWCBKLhFw4zx2u0SCaSTlQN1+iS7X9gCtk1pWEslmk0NvPK8Mf+he0zQqSZ3o8j/cWnW
         uDcYY7tMiPADSCqreeMnzptqoGbVG2TYjxrnBB9ZBjnj8DZwqpGtC/TgAfxpKkQk1Nwu
         mtmQpMrh0J1MxAvXrEGWKBjm0aGHhoT/zTny0ICT0KxphsGmvdV9f31kp8N+dXDkeQ4U
         7T7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=jI3lFSoFnrcJZHI01JXrUZGO4L/3fgC7g+/Ed0sSeXc=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=b5i/fnqqfsrzBryjyzHXkUL7uMGXv/LaZ6PmV5w8H8MR+K0ZyuKquQkyjyC+4kiKjj
         03cuRrB7l2eq13JInu6z2jsj1vytACVcvubNOfbP77TaSVAPKOSBgZro4N6EaYOc2Dr7
         zJzgB95/SKqvy+OMGQ6PKXrEE8KwLU3yRjW+hvLys+dtATmo+bDpss94MdmAT4suy2L6
         0BmsRODaMayKL71hcskMs0Oa047FlavMt/5r6OakxKlaqANcj8eq4cG6RTIc2o2dmees
         ehV15Luar7kOlkA6s/FLPjpyEFBF6ef/5zGnEC20khyGcdmDYJCfVYVwi9WQ4nd2M5m2
         apmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=QdgQqe78;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id gr9-20020a056870aa8900b001faeaf7e225si282257oab.116.2024.01.08.15.38.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jan 2024 15:38:36 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=QdgQqe78;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 408NOctq014100;
	Mon, 8 Jan 2024 23:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=jI3lFSoFnrcJZHI01JXrUZGO4L/3fgC7g+/Ed0sSeXc=;
 b=QdgQqe78a7bwehuZotn967dHNBvyVha1iq0mM76wBBU/+lxd34f92JrPQS2iZEWGcqK0
 ei5bJ31FJ2vsikEtYAuGnhnlKxwQoVoswHuEQ3zefU9pQKiV8qTIqHTGc5tO24TYU8MZ
 7l7dYmReVw7HQmZonaEskA/PEZM9eUkkWS9QJf7FitTgEUhzljRe+LS0aQTT6rxiGRnL
 vKyKUVi4WldF2qHtX8JabxmUQn+hw8qbVhu7ZMBWieCoMmmuz58OLGdd9lH2XvuCXJOQ
 ArEU4XQLbSu49zxZZ07/7ntDnGxq9sozvee5s89i0fxak3oQraX8xn0c2LePrwPBSyAx XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgjsrn4ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 23:38:34 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 408NRLeY020734;
	Mon, 8 Jan 2024 23:38:34 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgjsrn4ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 23:38:34 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 408L2nQE004384;
	Mon, 8 Jan 2024 23:38:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfjpkk53e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 23:38:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 408NcUZv11534880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jan 2024 23:38:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 899D720043;
	Mon,  8 Jan 2024 23:38:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE9E320040;
	Mon,  8 Jan 2024 23:38:29 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.15.162])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Jan 2024 23:38:29 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/3] linux-user: Allow gdbstub to ignore page protection
Date: Tue,  9 Jan 2024 00:34:05 +0100
Message-ID: <20240108233821.201325-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G61eFYfb0YGFuHqLJWKwKrcaXziwgjHM
X-Proofpoint-ORIG-GUID: k4OxO87IeWRg7sWqrbWd_o0OuQ1fCoFa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-08_10,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=803
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401080192
X-TUID: JHpFtnNcy1gy

RFC: https://lists.gnu.org/archive/html/qemu-devel/2023-12/msg02044.html
RFC -> v1: Use /proc/self/mem and accept that this will not work
           without /proc.
           Factor out a couple functions for gdbstub testing.
           Add a test.

Hi,

I've noticed that gdbstub behaves differently from gdbserver in that it
doesn't allow reading non-readable pages. This series improves the
situation by using the same mechanism as gdbserver: /proc/self/mem. If
/proc is not mounted, we fall back to the today's implementation.

Best regards,
Ilya

Ilya Leoshkevich (3):
  linux-user: Allow gdbstub to ignore page protection
  tests/tcg: Factor out gdbstub test functions
  tests/tcg: Add the PROT_NONE gdbstub test

 cpu-target.c                                  | 55 +++++++++++++-----
 tests/guest-debug/run-test.py                 |  7 ++-
 tests/guest-debug/test_gdbstub.py             | 56 +++++++++++++++++++
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py   | 34 +----------
 tests/tcg/aarch64/gdbstub/test-sve.py         | 33 +----------
 tests/tcg/multiarch/Makefile.target           |  9 ++-
 tests/tcg/multiarch/gdbstub/interrupt.py      | 47 ++--------------
 tests/tcg/multiarch/gdbstub/memory.py         | 41 +-------------
 tests/tcg/multiarch/gdbstub/prot-none.py      | 22 ++++++++
 tests/tcg/multiarch/gdbstub/registers.py      | 41 ++------------
 tests/tcg/multiarch/gdbstub/sha1.py           | 40 ++-----------
 .../multiarch/gdbstub/test-proc-mappings.py   | 39 +------------
 .../multiarch/gdbstub/test-qxfer-auxv-read.py | 37 +-----------
 .../gdbstub/test-thread-breakpoint.py         | 37 +-----------
 tests/tcg/multiarch/prot-none.c               | 38 +++++++++++++
 tests/tcg/s390x/gdbstub/test-signals-s390x.py | 42 +-------------
 tests/tcg/s390x/gdbstub/test-svc.py           | 39 +------------
 17 files changed, 204 insertions(+), 413 deletions(-)
 create mode 100644 tests/guest-debug/test_gdbstub.py
 create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
 create mode 100644 tests/tcg/multiarch/prot-none.c

-- 
2.43.0
