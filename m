Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp690134ejs;
        Tue, 9 Jan 2024 15:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOtFDQXx+4i/8+7crwWViW7AqUVrnadFFdcFkrfhLqYMCcQjlO5H9uqOTSO+gZC5JeuNHO
X-Received: by 2002:a25:ac9d:0:b0:dbe:30f2:48c1 with SMTP id x29-20020a25ac9d000000b00dbe30f248c1mr1047614ybi.1.1704841695509;
        Tue, 09 Jan 2024 15:08:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704841695; cv=none;
        d=google.com; s=arc-20160816;
        b=T/u9E/v5sLtk9JdMmVYBGiQltMMtffAB+aqPTTxi0vaR3rfjQtn7uSoV0aDEQM0DFm
         MR4BlRLt9mcKuQ4RkVUPskjmE4ANe0z0vVgHOKXR2Z7JkhtNmDis6u7SdERRg5HyDu/X
         ruCoagv7OiFZr4DCj7YWc6BNBRnaql4H1ATfm7fBv6+kguhYwm6EGsgnfEdSjQehLX6v
         9/xKaVcfiShpLx5HOgXdqh0glJqYAe7Em2+ARfhLF/BecgZTpFkC0ljX0MNJUdq3aHPS
         RJ66/daEnKhpfpDf4vf9PTO9KRKzl1tip1m7JYBtiNY1d7DZkJkGSsQW1GT0Za47w+P8
         55cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=A0s5Mr4Jzof5SnKIeNox8cnL/bIAyWOAdsRpeuHqFaA=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=ZqhDXOnqzee9uI+jLzaUVVf/4X4ysHgAgf0tDcQ4Qj+FPO9pEXTkZfyAbYOso6cXBI
         N846PoPzzACVRbfRKocwjcPxM09hHv20E3ertdhjedDBCdeiZVd2o47PJ4VCWbr78rW7
         JonbcJixtGj2/QM6S2/43zOpmFL+CsT800fk05gBpGGtxWgg3amgm8Nj15BsWJruZLpY
         UjTf0VWnu527m72QRYxpmPNKiHi/JLlENOCxsQjrUhWVaZHgU6QxeB5Bzb9Y6dQ/t9p/
         6vCUDoLNamFUQZIEcTCqk0C77va6Dwdsls3+BPiVcCmJZGcC3ZZSPDbJSSkUFy/WbF9w
         kmrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=hWctXQDa;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 132-20020a25148a000000b00dbdb45d964fsi1442545ybu.538.2024.01.09.15.08.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 15:08:15 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=hWctXQDa;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 409MF6au028583;
	Tue, 9 Jan 2024 23:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=A0s5Mr4Jzof5SnKIeNox8cnL/bIAyWOAdsRpeuHqFaA=;
 b=hWctXQDatracJTza4VOeEJ7NeViQ+GEMACmjYrBVkFDQt7HcIC0Y+s1z3WTUtBfOZTfx
 XLlAnBuofLL4G2TNmukbxwouOvDgy/qHuI6m6L5w9hm4Ae0nFi7whGhIG0EehDoLYGV1
 GmR3ZJXj5Qg/pIpADU57E2T+p79UYyz8t5tOsfHSPlE9/5JGVB0/JAhjukMtZE2Hr1Ik
 YHVyD7NxINV6C1JN313vcMA45Fp/QUeuCdHvVIuaBuPOkYb/dGXjiA1TmlDpSRXypT7K
 vjQb8zU6Z5XTaAqd5Ldjnw0g0H0sYNMZicqKyG69ybBhznaJcXPElx5VpZ2YW2gowZFi SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vh9f91n04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:14 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409Mpa9x008108;
	Tue, 9 Jan 2024 23:08:13 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vh9f91myc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:13 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 409LIqpe027421;
	Tue, 9 Jan 2024 23:08:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkw218us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:12 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 409N8B9e25756316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jan 2024 23:08:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EA1D20043;
	Tue,  9 Jan 2024 23:08:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9129320040;
	Tue,  9 Jan 2024 23:08:10 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.60.193])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jan 2024 23:08:10 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/3] linux-user: Allow gdbstub to ignore page protection
Date: Wed, 10 Jan 2024 00:05:52 +0100
Message-ID: <20240109230808.583012-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: scAaSRplPvUgjbDknyyL-fMUr0uBPcQ_
X-Proofpoint-ORIG-GUID: OA-ZZ68_N2V5tawb6PWxZeC7ZbCoHM6X
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_11,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=743 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090186
X-TUID: yz67FeiSG7Uh

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
 tests/guest-debug/test_gdbstub.py             | 56 ++++++++++++++
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
 17 files changed, 227 insertions(+), 413 deletions(-)
 create mode 100644 tests/guest-debug/test_gdbstub.py
 create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
 create mode 100644 tests/tcg/multiarch/prot-none.c

-- 
2.43.0
