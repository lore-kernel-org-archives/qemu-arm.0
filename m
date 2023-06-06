Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3487654ejb;
        Tue, 6 Jun 2023 06:27:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58wVRBEEKvZOVD8ZRZJIdru3XyW/YQC6yY15x58np41bd2lQFk7jym8EsGSOSO8cIJ0oUg
X-Received: by 2002:a05:6902:56c:b0:bad:fb1:a9f7 with SMTP id a12-20020a056902056c00b00bad0fb1a9f7mr1809781ybt.24.1686058076165;
        Tue, 06 Jun 2023 06:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686058076; cv=none;
        d=google.com; s=arc-20160816;
        b=EPhtFPwEGHrmj+Bg1Fh33VM8xeWtG02tfwta6RC4Upp8zQoJT9BN/oqLxyCBTCDQ6b
         E2uBQ5d5mFk4owx0ODGI/4c+SAr2ws7wJLWkhKcMX9ySItWUsmIP8UmZ/gLnk9jsU3bV
         HoACgGbDjL/QJ0xrsFFLaP2mMuTx1gUnEtReUt0TVRTIiRL7IYK5CDwR8KCxM9yvKa24
         gDx8969ps/hrvBaHgalbSIU2OuBvdYDOhB5dY2iSKOcWS63XW5R7TnV3WqBUKBNdSnPM
         tlqARiiqgA9mN98k9IS3B+hxcAPDXiAMpqsvkGpSAzJXlegAjWn6q9AnxQFAagE4QNc5
         nL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=QTGpwJL5/IxqRuXEPXYASiORA9jMahfLX60pnlAl6iE=;
        b=vP6+mp7CrXaQHu89hd8R5jhTWvGnox/JWml+4KiDePoUeP8kXa64C8vdavkDGIGIN7
         9/98nr3COaKSs02fDSRv3ytFop79ShoufRenP3G2gey5ijRm2F7pQr0yIzWTkK8z9xGq
         SfgsFjK0vsKYHfhUBLebhjNuiRPYETpeKPdnrK9NMig3xOiHDiuJbHHUZGvXFflMDgxy
         aGwsLickfgh+JoPHH71A0rC6v/738xcsXM03kJ9pNbUzOUpIOMEwqnZtyNP/FrwGQdkM
         K7xtdldhLQ8+/UK+H8kkAbmMt1evCfZnmN5FkYSA4rYmFQr71rZqe7t89m7X8F4n/fvC
         k0KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=HIB87hbA;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id w37-20020a25ac25000000b00ba625b6c10fsi8742699ybi.293.2023.06.06.06.27.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=HIB87hbA;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356DMhkG008271;
	Tue, 6 Jun 2023 13:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=QTGpwJL5/IxqRuXEPXYASiORA9jMahfLX60pnlAl6iE=;
 b=HIB87hbA0Vxv4Qq6IiOMofGcvPaYpj/+fOqvghRbXfQYjGplDvt8kUZJLMpObPd+kN+b
 QJjFhkwwX5LYczRMw4U335V5fftkzw4xS/Mr2S8wkWxAfm/y1f413OisMj/t2+doflG6
 grSuYg+m6udPh04QDf7DeP5iIcLnbrNgWjKAZi9xyjij+wcrETpl0bVY7SbmjufYGYWT
 VkgJv8BmP1NOZyxcBGeP7paTKgLNweImk060yNUdg/TYkTvg4EdK6SLFRRYz3cXzgyVz
 Cif22VdTJBfkEgbUEqdko2lh642CrNFfD5THK8at99BtUR8XfCyz0GRnkwChWY7Q2F2P LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25mgr3qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:54 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356DRCWk021288;
	Tue, 6 Jun 2023 13:27:54 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25mgr3ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:54 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3564w4UR016877;
	Tue, 6 Jun 2023 13:27:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qyxmyhyw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:51 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356DRnOh18940562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 13:27:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7672620043;
	Tue,  6 Jun 2023 13:27:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 332C220040;
	Tue,  6 Jun 2023 13:27:49 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.155.209.184])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 13:27:49 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/8] gdbstub: Add support for info proc mappings
Date: Tue,  6 Jun 2023 15:27:35 +0200
Message-Id: <20230606132743.1386003-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HoQGhV-5y3Edv4qcMZFrHXg-d0znw-Aa
X-Proofpoint-ORIG-GUID: hSCUX2S37K1RvdsBHfN8dfrgdGWp111o
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060106
X-TUID: 35aEwSU8PNE+

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
carries the respective Co-developed-by: tag. I hope that's okay. I also
peeked at gdbserver/hostio.cc quite a few times.

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
 tests/tcg/aarch64/Makefile.target             |   3 +-
 tests/tcg/multiarch/Makefile.target           |   7 +
 .../multiarch/gdbstub/test-proc-mappings.py   |  55 +++++++
 tests/tcg/s390x/Makefile.target               |   2 +-
 10 files changed, 401 insertions(+), 44 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-proc-mappings.py

-- 
2.40.1
