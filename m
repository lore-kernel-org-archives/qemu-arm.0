Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp128013ejb;
        Wed, 21 Jun 2023 13:36:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4GIRKzY6SHP+u8+XjZiwTmuwQW4tv5QPgkG2RCTGlNeebXS8CO8fpFyxu4oDme8Cjp2gII
X-Received: by 2002:a92:c743:0:b0:341:d602:5d33 with SMTP id y3-20020a92c743000000b00341d6025d33mr12953504ilp.7.1687379803371;
        Wed, 21 Jun 2023 13:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687379803; cv=none;
        d=google.com; s=arc-20160816;
        b=tZRyXWEmLY8qruUi03WVgal5CaHp9OFH82PgqRaQpEjd6VQ8Q/pvI5dfVVw+6jEo5H
         6bZWPX5+mv8Mu7JIeEe1oJ2DTedpKoQNDOFTmpv2Ao4YZbcVho/Aftq88reAjsZuNQP0
         8o0foVhd4SuNHzfYnwXCujdR5UbFsmJCVoz37HMkaJLeu/Csj1jueLSNx/dudoGuWvC9
         WzK4vl8bxMmXNY7vCGDP39uA7m8b7Z27203VLB72B4mRtopZFPd6qFu2ENWpPTw6bIl2
         ztywLTtLzJeiTslrCOlMMC2cMwFcxZs62c1eSs66ZDj79gJO3jl7ZlyNY5n7+W8LZnkN
         qmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Olv/SPFDe57mQYbFufCTBfHlCo8PtawonsURPrr/Atk=;
        b=oDZAzbeXFTr88eFBzqrZqTkna8wWZdMqDSDHpehSv/OUb/dFfeGN3wK7lkya7SVJMU
         gAy5hrF/3Dqz2upaorZs69H5jVVtVUVU5/60xIkKPJVPH4M4PJCT7kO1oZNFUADuGSoW
         7HmXdnYNnVGWtaBPAMjkrSva/XcFZvaFq6OptUJ4WJfMfBKgf/w/EccaYMVqDsCr1zZ6
         qjJQN+SX0XgiEf1SmcQx5rcdmQ+1GnKYpNrroWklqyGr6r56IbXlcGS9pP2OK+shDnjR
         Pf0iUL3XhTj6UHv42pgYZTYxo5tBslnmzfohksXHj///+lwjX7utWljyMlO+DjRi7Izt
         6fJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="cXLWv/Zs";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id d13-20020a92d78d000000b003428aca64bfsi2054221iln.200.2023.06.21.13.36.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jun 2023 13:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="cXLWv/Zs";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LKEDLJ021604;
	Wed, 21 Jun 2023 20:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=Olv/SPFDe57mQYbFufCTBfHlCo8PtawonsURPrr/Atk=;
 b=cXLWv/ZsAvbsgpipIvSsA9kGyxEyjuCkqzqDdbWn4D7TiqQg1ShoCBTVM65b5FC+FNWX
 mU2iXnEU8/3ucW0SRZKz1HyMvFCkzmCq1T0J58WCSXeICU0LdFBA/YM1bTVHXwNZOuRN
 KfVwsz36sxQep6IE65JAC/+IIOmiFaOrwPO/e4rklMcXpOWnqwapxvuckr0X5okxtI5B
 GuzcAQw2to9ZItsbmt3OVpfSHRR+1oMMIb+dzleLkxiyhsa1MrlMPo/uOwFN/1Hb+G7b
 50uHcm7fBKvL8500xXMASEeensdCUgdAEGQp30asVLAYYfgZyX6GWWpINYutVKXEO80j xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc82g8ew0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:42 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35LKHx52001634;
	Wed, 21 Jun 2023 20:36:41 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc82g8ev3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:41 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35LCgd38030224;
	Wed, 21 Jun 2023 20:36:39 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3r94f52ade-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35LKaaMY39649618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 20:36:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E6092004B;
	Wed, 21 Jun 2023 20:36:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 032E120043;
	Wed, 21 Jun 2023 20:36:36 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.1.208])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 20:36:35 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 0/8] gdbstub: Add support for info proc mappings
Date: Wed, 21 Jun 2023 22:36:19 +0200
Message-Id: <20230621203627.1808446-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xSQlRD2SAsxCKCOyQYBwijARHYMiSY9H
X-Proofpoint-GUID: dp1vQDPGRquV6dRBjR_6zShC3qSXVnvj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210172
X-TUID: vuJNEKkFB7WE

v3: https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg01311.html
v3 -> v4: Fix the 32-bit build (Alex).
          Enable the test on all architectures and ignore certain
          expected failures (Alex). I tried this with the latest
          gdb-multiarch and it works. The only skip is on x86_64,
          as expected.

v2: https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg06837.html
v2 -> v3: Use openat() instead of safe_openat() (new patch: 2/8).
          Add /proc/self/smaps emulation (new patch: 3/8).
          With these 2 changes, the minor issues previously mentioned in
          the patch 6/8 are gone.

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg02614.html
v1 -> v2: Reword the 5/6 commit message (Dominik).
          Add R-bs.
          Patches that need review:
          4/6 gdbstub: Add support for info proc mappings
          6/6 tests/tcg: Add a test for info proc mappings

Hi,

this series partially implements the Host I/O feature of the GDB Remote
Serial Protocol in order to make generate-core-file work with qemu-user.
It borrows heavily from the abandoned patch by Dominik [1], hence 4/6
carries the respective Co-developed-by: tag. I also peeked at
gdbserver/hostio.cc quite a few times.

The changes compared to Dominik's patch are:

- Implement readlink.
- Move the main functionality to user-target.c.
- Allocate buffers on heap.
- Add a test.
- Update gdb.rst.
- Split refactorings to the existing code into separate patches.
- Rename do_openat() to do_guest_openat().
- Do not retry pread(), since GDB is capable of doing it itself.
- Add an extra sanity check to gdb_handle_query_xfer_exec_file().
- Replace citations of the spec by a single link.

Best regards,
Ilya
Ilya Leoshkevich (8):
  linux-user: Expose do_guest_openat() and do_guest_readlink()
  linux-user: Add "safe" parameter to do_guest_openat()
  linux-user: Emulate /proc/self/smaps
  gdbstub: Expose gdb_get_process() and gdb_get_first_cpu_in_process()
  gdbstub: Report the actual qemu-user pid
  gdbstub: Add support for info proc mappings
  docs: Document security implications of debugging
  tests/tcg: Add a test for info proc mappings

 docs/system/gdb.rst                           |  15 ++
 gdbstub/gdbstub.c                             |  86 ++++++++---
 gdbstub/internals.h                           |   7 +
 gdbstub/user-target.c                         | 139 ++++++++++++++++++
 linux-user/qemu.h                             |   3 +
 linux-user/syscall.c                          | 128 +++++++++++++---
 tests/tcg/multiarch/Makefile.target           |   9 +-
 .../multiarch/gdbstub/test-proc-mappings.py   |  65 ++++++++
 8 files changed, 409 insertions(+), 43 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-proc-mappings.py

-- 
2.40.1
