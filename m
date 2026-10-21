Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA14606A319
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PS3emNt2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BTOpP5kd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMmS-0002YN-PU; Tue, 20 Oct 2026 23:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmQ-0002Xl-Ee
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:14:18 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmN-0002NG-5B
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:14:18 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2EtnR299889
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=9/tyfRNUDZU2SoHXA+oloV
 xrtrHePy1Li8sljdHgIKU=; b=PS3emNt2ufr1xMd+2aZVtpu5pbu2pyTDsWuw1d
 fX3/aD0qanIIpFQdBqjrLbCCGlzl3+22xP1h7LDh8dHhApxiHQmfRs3P17EV0i1G
 UwTLyROgkBenqS39S3L5rnVSwBSBhkeb/c03uW+zFric2G2xeO4bFE8Pfn6zn7uU
 5ZllUrzF/cScLjBUAawMKH7dStBU+KL5dfpuEszN11f46m9ZSnEUq36fI5aX3pns
 WQXglC9JjakmdWmoWU1OJ1sjzGylA7IkVyHrN8jSgUhuXIx5q09QRA2sk6WvyWE2
 2X3v+70ZHnhz1LtPu5HBtKyRQAl9HVBhiiVdpLczSh8vgnuw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4spqh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:14:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91792488228so6553776d6.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552451; x=1793157251; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9/tyfRNUDZU2SoHXA+oloVxrtrHePy1Li8sljdHgIKU=;
 b=BTOpP5kd7R3mWyz6rN9U2wvhoUXvXWeRu1vki+gjKbs8qDbTU53zINgBhJAypPCwxL
 dhKk55X3/153fnmFc2f1J2TJjcNCAZDdQRrUHNWx3wSVZO19QouCqJ07jiAwFIoco2LI
 oufb3eGzojTEiNDNYYcdtZCFDpSjUXKXIctgJdoEuDFh/rdfA+G85aX5VqEQ020AYxea
 E242xYGv8JOKePkRCcD76tjESl9S0ze5OIDtDdu1B30O8ZITEkNV4kaW/Ds1DPER+F2I
 kZRBw62DFJ6eFItF9J0gEj4apYg7Wy+GbPM90K2a16asJ8vwSfI8Mi/SVZqxug9bJWht
 eRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552451; x=1793157251;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9/tyfRNUDZU2SoHXA+oloVxrtrHePy1Li8sljdHgIKU=;
 b=VTCq8IA+QW4AVXskdU67oGyT4KIo16AiOOOaxD5U8sB03KK8K9K5jaUHD0C6XRwXjo
 aESN8yhxbTvCzaQuM0B/4EJpz3qPRsh2SLLV9+VGWw9kKQNtHOSgS2mHHDJjxcZ24ifi
 UMPlY11FI8zoMdDvwqDmqB+JvGApBiFvCZaC5lgADhGMQohD0rCBjNdh+glEqzMwUJVB
 A5UdxigNGkLKWy6rfeUhtrD0BLBVZbRbwrfdgvHCpNwCzPE2UmL4SC0S8Be2aAbGjCOv
 HOxxU+JUS3anAw6XzndZxUW/nsNDsiW/yZ+jvrgB5XQgIXoHyeJPwN1BfH2A3zLzqo0F
 j1yg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbBV+lExhw1YFyRttIWtx37Kv7Eck1bCBo1far5YijAg7GZ36jP6QckPB5tyaaih1fARWVpqWN2Q==@nongnu.org
X-Gm-Message-State: AFq9FYKSHe7orYZ7LpC4fxKt6eRBhqt6mOu20UhqKALrGEJjY1JY5L0N
 WQUeylsn+xCWcrLekvw0hgsbivEijQbMEZszok1fKmVSgbOpoVOqeiju+wDZh+pfhn3/q4N6HuB
 gbI1owSeyi1H3ErZ3ESfsqyY/ejym6gTeiC9bGtHIH6c++1rrbu4xfGQ=
X-Gm-Gg: AYBFou2ozLHpyQW5lvbunTymyF27sLRKo5OoYoZqPZSEegPvLVCj9RoTxM426JrC9Dd
 AMm7XJAHQlzKjLZr0vaIOwW9Hr0JK3Db3gD4R3dCGD7iAk6NYAFQu2PS4HfmiWyM4KWue+kwfDv
 93S44tnm2BP69kO5fZMHPY3aLbKUX75xIV5UFuV3ikO1xynEEzQUVkWxmoJZrPGEHNWL5HFJWCd
 8S5x8/hH1HqVu/duvG7WGPWCL+krZp41n6lLXUL+FPbQe4aumaxK5T52l0YXhgKo7Kn00d8vszO
 U0Z7vevAWqip0NGfrIku6titwO6SdLkIB3CfMeabCc3/BBo1qS1b+c0LeFdkuxJAO12dB/oLbLe
 cJsUOB3rNaWkFoou+MCSRyQ0C/ge3UYnE8pn1xgL4
X-Received: by 2002:a05:620a:17a2:b0:93f:34c9:925f with SMTP id
 af79cd13be357-93f57f05e21mr225097285a.17.1792552451239; 
 Tue, 20 Oct 2026 20:14:11 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:34c9:925f with SMTP id
 af79cd13be357-93f57f05e21mr225093885a.17.1792552450655; 
 Tue, 20 Oct 2026 20:14:10 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2583e25asm2406639f8f.46.2026.10.20.20.14.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 00/33] cpus: Add common CPUClass::exception_name() handler
Date: Wed, 21 Oct 2026 05:13:33 +0200
Message-ID: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: du6T88hbTYa7ixoorayAgOvd31HA9Xjg
X-Proofpoint-GUID: du6T88hbTYa7ixoorayAgOvd31HA9Xjg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX0Fvqy8hHTtsd
 eEPuD2U8qPX02t6bs2XoLBSS9gHaR34D2Yx8QQoCpc8Ax+Yl7hQPx1qTak+D8/oeeBQb6+/qCSZ
 zVjoQ6M+nuzPWqSAqhbjZoEzw8IbCPQ=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad82e04 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fwSM-n4fPOTFBuO-yL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX4Ownr5wHRkJ7
 OFcDcTM1kngXXHaTnwhF8a6tGLGM/SGg0+FMuZJtPrQspmyfR53YUf/cJwNMfdLeOwx2s0aNhCZ
 SQ1zuUew6ohfXgIAhh9eFHcLuaIduizoNPTT39QExEsCb2Rctg/uFF+dZvjNueShSR+yDw+LmEY
 CUjGGWM5/5S30oUbaamUO3nxKAqbQ4kNOgT0ahdH7TrWs7cvgxJSEL/T/Rw0kJAeVXwwCn0RweS
 dvuVBbtfSWnYaxBKKNNzbvDYkl65dQ5Jgw24saNZey+Lg4gl1Pkcy50voIbpd9wtWeE9E60NeaM
 c3M7exY1QA+suBpVmWBRiSfiBpcQwoJy6H2fGUgYp8K0bcsgrc5ddDlvDNJC9D2P545cqqzPW28
 6cZRiRgE36JJwPM074SEAxeUYhvf5m/WjZ51lhJT16EtHMYpPB4OsnQ3Qli+p0sLARurA+5XXhZ
 8EoCi1P7ZpyZNyFLGQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Missing review: 1, 2, 5, 14, 19, 21, 29 (all news except 2)

v2:
- Addressed Pierrick suggestions
- No change addressed wrt logging-prefix (patch 2) because
  not needed so far.

Add qemu_excp_name() to resolve QEMU internal exception
values.

Add a common CPUClass::exception_name() callback so the
generic exception logger can resolve architecture-specific
exception values to human-readable names.

Re-use existing methods (expose prototype or refactor) when
available otherwise implement new ones (AVR, X86, MicroBlaze,
S390x, TriCore and Xtensa).

This series is the base for consolidating exception management
in accel/tcg/ (more series to be posted on top).

Philippe Mathieu-Daudé (31):
  qemu/osdep: Add ARRAY_ELEM_OR_NULL() macro
  cpus: Add helper to log raised exceptions with '-d int'
  cpus: Introduce CPUClass::exception_name() handler
  target/alpha: Register CPUClass::exception_name() handler
  target/alpha: Use a static table in alpha_exception_name()
  target/arm: Register CPUClass::exception_name() handler
  target/avr: Implement and register CPUClass::exception_name()
  target/hexagon: Register CPUClass::exception_name() handler
  target/hppa: Register CPUClass::exception_name() handler
  target/i386: Replace magic value by proper EXCP0E_PAGE definition
  target/i386: Implement and register CPUClass::exception_name()
  target/loongarch: Register CPUClass::exception_name() handler
  target/m68k: Register CPUClass::exception_name() handler
  target/m68k: Use a static table in m68k_exception_name()
  target/microblaze: Implement and register CPUClass::exception_name()
  target/mips: Remove unuseful EXCP_LAST definition
  target/mips: Register CPUClass::exception_name() handler
  target/or1k: Register CPUClass::exception_name() handler
  target/ppc: Dump EBB exceptions names
  target/ppc: Register CPUClass::exception_name() handler
  target/ppc: Use a static table in powerpc_excp_name()
  target/riscv: Register CPUClass::exception_name() handler
  target/rx: Unify BRK and INT trap handling
  target/rx: Register CPUClass::exception_name() handler
  target/s390x: Implement and register CPUClass::exception_name()
  target/sh4: Register CPUClass::exception_name() handler
  target/sh4: Use a static table in sh4_exception_name()
  target/sparc: Remove well tested DEBUG_PCALL definition
  target/sparc: Register CPUClass::exception_name() handler
  target/tricore: Implement and register CPUClass::exception_name()
  target/xtensa: Implement and register CPUClass::exception_name()

Yonggang Luo (2):
  target/rx: Define exception vector constants
  target/sh4: Define exception vector constants

 include/hw/core/cpu.h          |   2 +
 include/qemu/osdep.h           |  12 +++
 target/alpha/cpu.h             |   1 +
 target/arm/cpu.h               |   2 +
 target/avr/cpu.h               |   2 +
 target/hexagon/cpu_bits.h      |   2 +
 target/hppa/cpu.h              |   2 +
 target/i386/cpu.h              |   2 +
 target/loongarch/internals.h   |   2 +
 target/m68k/cpu.h              |   2 +
 target/microblaze/cpu.h        |   2 +
 target/mips/cpu.h              |   4 +-
 target/mips/tcg/tcg-internal.h |   2 -
 target/or1k/cpu.h              |   2 +
 target/ppc/cpu.h               |   2 +
 target/riscv/cpu.h             |   1 +
 target/rx/cpu.h                |  14 +++
 target/rx/helper.h             |   3 +-
 target/s390x/cpu.h             |   2 +
 target/sh4/cpu.h               |  22 +++++
 target/sparc/cpu.h             |   1 +
 target/tricore/cpu.h           |   2 +
 target/xtensa/cpu.h            |   2 +
 accel/tcg/cpu-exec-common.c    |  38 ++++++++
 target/alpha/cpu.c             |   1 +
 target/alpha/helper.c          |  56 +++++-------
 target/arm/cpu.c               |   1 +
 target/arm/helper.c            |  76 ++++++++--------
 target/avr/cpu.c               |  16 ++++
 target/hexagon/cpu.c           |  34 +++++++
 target/hexagon/hexswi.c        |  30 +------
 target/hppa/cpu.c              |   1 +
 target/hppa/int_helper.c       |  88 +++++++++---------
 target/i386/cpu.c              |  30 +++++++
 target/i386/tcg/excp_helper.c  |   5 +-
 target/i386/tcg/seg_helper.c   |   8 +-
 target/loongarch/cpu.c         |  38 ++++++++
 target/loongarch/tcg/tcg_cpu.c |  45 ----------
 target/m68k/cpu.c              |   1 +
 target/m68k/op_helper.c        | 158 ++++++++++++---------------------
 target/microblaze/cpu.c        |  14 +++
 target/mips/cpu.c              |   1 +
 target/mips/tcg/exception.c    |  13 +--
 target/or1k/cpu.c              |   1 +
 target/or1k/exception.c        |  21 +++++
 target/or1k/interrupt.c        |  19 +---
 target/ppc/cpu_init.c          |   1 +
 target/ppc/excp_helper.c       | 139 +++++++++++++++--------------
 target/riscv/cpu.c             |  29 +++---
 target/riscv/tcg/op_helper.c   |   2 +-
 target/rx/cpu.c                |   1 +
 target/rx/helper.c             |  62 +++++++------
 target/rx/op_helper.c          |  17 ++--
 target/rx/translate.c          |  23 +++--
 target/s390x/cpu.c             |   1 +
 target/s390x/interrupt.c       |  15 ++++
 target/s390x/tcg/excp_helper.c |   6 +-
 target/s390x/tcg/misc_helper.c |   3 +-
 target/sh4/cpu.c               |   1 +
 target/sh4/helper.c            | 108 +++++++++-------------
 target/sh4/op_helper.c         |  16 ++--
 target/sparc/cpu.c             |   1 +
 target/sparc/int32_helper.c    |  21 ++---
 target/sparc/int64_helper.c    |  42 ++++-----
 target/tricore/cpu.c           |  18 ++++
 target/xtensa/cpu.c            |  23 +++++
 target/xtensa/exc_helper.c     |   3 +-
 67 files changed, 740 insertions(+), 575 deletions(-)

-- 
2.55.0


