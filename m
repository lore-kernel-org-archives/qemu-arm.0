Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62BA606A339
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYbZTpQF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NRqyJwra
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRZES-0000ZJ-Er; Thu, 12 Nov 2026 13:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZES-0000Yl-1p
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:09:08 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZEQ-0002zq-5r
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:09:07 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFa7Go012267
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=pVWiYHdM6YKo6pteq5QLHc
 WbolKGnQxEQXcOHu3pPXg=; b=EYbZTpQF2OMoLBrRYXaYea+aZcWrI4G3pXZ6uY
 99A+NByG8bn/xCdHumWuBmbteBY0Q9HY8QVuDkq6PlfM1sckgtTdjz0ZTEb/mwcQ
 L/yvPZKSCjegP4I8paPLop3PoSP5PKRABp7SJ/+egtkXiEtX735FdbxFxqQhKHpX
 VLRkGgc1GDj4v5upGN+Pb7r2ucIuB67+qPz1NqVzkbqtWl3a0aKGAdtxw0yCoh8A
 piIKM3HqCwECHKN7/OvdBIUA+rvpdlTgHXeWxg8uieWfYf68Va4acDRCLF1bbAkK
 JSVxUn2i6Tz62EbchMsXTnxaTX0Zg1OXBhGUXgqAbWmN1CZA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b8q2m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:09:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-99064f8c7efso68804241.2
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794506943; x=1795111743; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pVWiYHdM6YKo6pteq5QLHcWbolKGnQxEQXcOHu3pPXg=;
 b=NRqyJwraXMK+GZ2Jx+AXMiWPfziKF9hGyEZF3Aa4DhkTkjRLEsGRwDntdLIZYRxB66
 3Qpb+11kcdsdHuNp+IQksPhyTAQeuazPfXjFzkf2WRI6QSdsAY0GgQIPgGsu/nICV95j
 6s8pBoVOBwM3mbT6mAb3ZReAS9yXY6efXPfVWZ7NXMpx5T3t1PKp7MrtfNueqCMNP9hk
 aqFYX0gXnMk5PJsGu4eyYeK8Ct/6FJ3YA1J8psBf3eIY1bxr700/XUSrSWrC33X6zyD5
 z441z5W7ZCZQfAciofZZUBd+pJiWNDglHw/gFS/SzjFLBOWZMN4mmo8PJYnHP0GqrQDD
 c0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794506943; x=1795111743;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pVWiYHdM6YKo6pteq5QLHcWbolKGnQxEQXcOHu3pPXg=;
 b=oQXGnhJz7E2BTDd+6TY+DVioCg1NS9MNFl59tZCA9bUNhPvj4Kxlb8L4EHf0gxwe8k
 ldZqk3LMbPEBP/yVyQ5zm0uYqZ/hKaSJ2pDgGgnNXKl1KOR24cKVQ2eTSAvdNPerTkQd
 mmAq1GPJRAUJ/JZhAttFHzrDNCNsj3ABzmXDNUONlsnFltGIlu99mraoXxb7tSQuXENS
 hL+M/Mxxt1R96QziBM69lpSzH3CvEw/V9311Mv602yOiW8+g1i2tYiB/M3cH20GUPtnK
 2JKkOt2/sL1BPCfQ5YZTR4zFDp8sW6qjos8ZE7CT0VcvRgjCIwgeqACOARjCp45SoMg4
 t3VA==
X-Forwarded-Encrypted: i=1;
 AL+hErFYwlVnXhbra6hjG4xtXbZDfSVCXJq9jbL9N1/vh00ouclqkydw8w2bWM3Ar4io6eMgKgJrSHUjmA==@nongnu.org
X-Gm-Message-State: APuU4Z+AOjjnfm+HSAGMzI7udf3xy1SmGGBxPF79dROIQcmNGoWArNjg
 Qt1JZ4Om7PnWb8oC+9T4FBHoEg3fbELuk2nxkJPynwUiMtlkN8kYpzRoIpXboVSNOATXv1v1/QI
 5xVDPcQd9hxhSj/w381ZHTs4+KitP1b9iCII3EzBU4N4CfucO7Ck8C0E=
X-Gm-Gg: AYBFou2k0p46nGmmvA/E137g3s81RmUj+pmJ3PifZuuWRMiY4jYN/ba4f34jJyl/x/k
 EmknKSEW+Uf4xXz0p3Fso6it4AK7Z/hBqCMxPOU915F8vY7SGH72nTRQwrkTag8TKpg2gEE5KfL
 iwm4rOVkaweW23Zz2f2reQAjtEDdwtVSs+wOBMc4PVVuhDiINtMz/4jYVQ2eSnaH3o1btfIsPCY
 2M+dvw3DchasSbIjwsUhUVqGFBJnhET/L/RWOV7OOhagft0aWQHx/QCWkhhEo6n4YyOakilAnHT
 PbbHb172ABu9F7LG7jWdhWUnLZ7jzP+uCxZbrx650N/je8fzPFSwlNHtgGwTWXoiiQkJJDoYBZB
 Eb3Wt4MkV53ZikPLBtEvD/yR/8UfzdYVhFIG3o20WrSQFeLBBiyl2p0hrhwt66tKcY2n37QrMVO
 M8jC3SCGWSGHCQqQ==
X-Received: by 2002:a05:6102:e0a:b0:7d5:c1e0:2482 with SMTP id
 ada2fe7eead31-7d64d69dca2mr7824137.11.1794506942556; 
 Thu, 12 Nov 2026 10:09:02 -0800 (PST)
X-Received: by 2002:a05:6102:e0a:b0:7d5:c1e0:2482 with SMTP id
 ada2fe7eead31-7d64d69dca2mr7803137.11.1794506942015; 
 Thu, 12 Nov 2026 10:09:02 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c1797sm653492f8f.11.2026.11.12.10.09.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 10:09:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 devel@lists.libvirt.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both endianness
 at runtime
Date: Thu, 12 Nov 2026 19:08:46 +0100
Message-ID: <20261112180859.85380-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af600bf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=6IaHPsI2-x5WLNNLdMwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dsHcgtJTnvSrpYTwPSEAsPzALJkPcwEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX3+Dp1fr237ya
 6P8K9nwD6c6/4vxx3RE/q/JQlxKQDoYbgCjQZwgYI20fV4YrYDsaud0wXZl12I3Qm9pwlDreq+X
 XpuUJqLzBhPZb+R+CS73k0dfIbCX8YPOmN2Eb79bdcehpEHeYh34lr8aYszkXHbrTg1fD1WOva7
 I2c7lsH+L2Ts9ks2MoY98kQbwFLOjBoAQKqTqdW39Zk1KStb65A7N4Z4G1k08nLtF/X7zEoMSut
 VusAT3AScF4vzvfDoCYJ8WcYjtak8dxJBAWck/MQQBfAaQH99F71Bt663teoXn8Drjs/DjEBEph
 kZwneef/IQ+BX1m65R1Dv30w6Q1lqi39o08fsC9t87RE7aQiwrvIPaslcr+Zzm4dOZxAVLheVeA
 c5aivF5S76S+ldgHeDfilpswio70ETtkfFhly0WReqwETHIEzxG80R+fx5qJSU4wYnSw6eGXCvJ
 LIIHRmZK6QSjgnf/+OQ==
X-Proofpoint-ORIG-GUID: dsHcgtJTnvSrpYTwPSEAsPzALJkPcwEK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX686Qqmv9JPdA
 y2iTKSmBU5qobWJFBc5jvg5sCd+Du0DKtVteTN9J6FuSQnRxjHP3mvjCnXQB8FlumuT33142oJW
 ZtdvEVDz0WCNC7Bh9NPX9+LS8gtjXmw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120072
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since v1:
- add ./configure error msg
- cover ARM32

This series lets qemu-aarch64 run both little- and big-endian
ELF binaries, retaining qemu-aarch64_be as a compatibility alias.

The ELF loader selects the target byte order once, before execution.
AArch64 CPU, signal, ABI and vDSO handling then use that selection.
Fixed-endian targets and system emulation retain their existing
accessors.

Runtime-endian TargetInfo data is exposed const to readers, allowing
target_big_endian() to be inlined without a separate boolean cache.
The writable initializer remains outside LTO, preserving the boundary
between ELF initialization and subsequent reads.

I compared the complete series against its baseline, with normal and
LTO builds and LE/BE guests and did not notice significative speed
down.

The inspiration comes from previous optimization intent from Richard:
https://lore.kernel.org/qemu-devel/20260511190634.472174-1-richard.henderson@linaro.org/

Philippe Mathieu-Daudé (12):
  tests/tcg/aarch64_be: Check data byte order in hello
  tests/tcg/arm: Add BE8 and BE32 hello tests
  linux-user/aarch64: Move ELF/vDSO endian checks to runtime
  linux-user/aarch64: Move CPU/signal endian checks to runtime
  linux-user/arm: Move ELF/vDSO endian checks to runtime
  linux-user/arm: Move CPU endian checks to runtime
  target-info: Support runtime-endian Linux-user targets
  linux-user: Honor runtime byte order in ABI accesses
  linux-user: Select target byte order from the ELF header
  meson: Support Linux-user executable aliases
  linux-user/aarch64: Unify both endianness under qemu-aarch64
  linux-user/arm: Unify both endianness under qemu-arm

 docs/about/deprecated.rst                 | 23 +++++++++++++
 docs/user/main.rst                        | 18 +++++++++--
 configure                                 | 12 ++++++-
 configs/targets/aarch64-linux-user.mak    |  2 ++
 configs/targets/aarch64_be-linux-user.mak | 10 ------
 configs/targets/arm-linux-user.mak        |  2 ++
 configs/targets/armeb-linux-user.mak      |  9 ------
 meson.build                               | 39 +++++++++++++++++++++--
 include/exec/tswap.h                      | 11 ++++---
 include/qemu/target-info-def.h            | 14 ++++++++
 include/qemu/target-info.h                | 20 ++++++++++++
 linux-user/aarch64/target_elf.h           |  6 +---
 linux-user/aarch64/target_syscall.h       |  6 +---
 linux-user/arm/target_proc.h              | 20 ++++--------
 linux-user/arm/target_syscall.h           |  6 +---
 linux-user/qemu.h                         | 17 +++++++++-
 linux-user/syscall_defs.h                 |  7 ----
 target/arm/cpu.h                          | 10 ++++--
 target/arm/internals.h                    |  2 +-
 linux-user/aarch64/cpu_loop.c             | 12 +++----
 linux-user/aarch64/elfload.c              | 10 +++++-
 linux-user/aarch64/signal.c               | 20 ++++--------
 linux-user/arm/cpu_loop.c                 |  2 +-
 linux-user/arm/elfload.c                  | 36 +++++++--------------
 linux-user/elfload.c                      |  6 +---
 linux-user/main.c                         | 26 +++++++++++++++
 linux-user/syscall.c                      |  6 ++--
 linux-user/uname.c                        | 13 ++------
 target-info-def.c                         | 19 +++++++++++
 target/arm/gdbstub64.c                    |  4 +--
 target/arm/tcg/translate-sve.c            |  2 +-
 tests/tcg/aarch64_be/hello.c              | 16 ++++++----
 tests/tcg/arm/hello-arm-be.c              | 34 ++++++++++++++++++++
 tests/tcg/arm/hello-arm-be32.c            |  4 +++
 .gitlab-ci.d/buildtest.yml                |  2 +-
 .gitlab-ci.d/crossbuild-template.yml      |  4 +--
 linux-user/aarch64/meson.build            | 10 +++---
 linux-user/arm/meson.build                |  4 ---
 tests/tcg/aarch64_be/meson.build          |  4 +--
 tests/tcg/arm/hello-arm.ref               |  1 +
 tests/tcg/arm/meson.build                 | 11 +++++++
 41 files changed, 323 insertions(+), 157 deletions(-)
 delete mode 100644 configs/targets/aarch64_be-linux-user.mak
 delete mode 100644 configs/targets/armeb-linux-user.mak
 create mode 100644 tests/tcg/arm/hello-arm-be.c
 create mode 100644 tests/tcg/arm/hello-arm-be32.c
 create mode 100644 tests/tcg/arm/hello-arm.ref

-- 
2.55.0


