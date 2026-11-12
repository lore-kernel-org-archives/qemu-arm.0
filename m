Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0A9606AE80
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8E5+dRb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6EJoBS2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRVP7-0006C8-QP; Thu, 12 Nov 2026 09:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVP6-0006Bt-Gm
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:03:52 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVP4-0007Ok-PD
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:03:52 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC7jFGP126967
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Vfgi09CMWPdToViWRN+ruX
 hK+KjVnh/rG45FVNyy1ak=; b=g8E5+dRb84iC5j7O9w7CSilHsxTJTYAxl/nLpE
 HmnKnnm9SX4pCD1UBnamGam4vkRe39jHX9Y2+pPUPMejjlC1bo1aMYWGJf4ofNEW
 J/BmQ0auVyzW0dkKadvclliBjphmnymRnxY5SNLtUzrbaZUaVIrgy2VvKSHfBzOq
 XsbMX0AJ+CDmKQKG/jvLHmTigsiGeHD9fJgBvNyhApkYQ8SaGt8A7WW8Xzf01d4v
 iahFTkC1M07pD3H88yyUh4W5jMsnZgsg4jh+UibLgKRaEA7WhwPKtDxCdaqnHQYr
 c7JXj6sGq5ncQFFROBJ1bXHb/lM8xCjZQc3gTWa0G5R0Fcmw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09am7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:03:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-5eac41ff334so3992842e0c.0
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 06:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794492227; x=1795097027; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Vfgi09CMWPdToViWRN+ruXhK+KjVnh/rG45FVNyy1ak=;
 b=K6EJoBS2hNk2/9UVO7nSy34f/mauqLrYS72bBP+6c05P8FGUU0t6Ruepi23DP2TgQt
 UVqMuraJJsRtXT83bOwZ7AycgE2aozKoGeJfJu3qiMlO5VCQRSA+YIBX3YGUKxSJaAWC
 M5dpWnQOLqsg3SRFRrSTlfjOxzazCW2CXaQq6Ps68DLxRAI2zVi6W47oqJQoYCXr3yIM
 B4ugyFSzhhq2ItkzvnH5mRkPtYeRYg0FUCPn4YdGzvktOJx63ZA2YRNDQVQHA4MneCpI
 DsKcJ3kITyj1kbAF3qBvpFvm/xVcFLs24uOuBPtJBqzw7diPoll2uMt6u33gRGhSEWIY
 /KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794492227; x=1795097027;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Vfgi09CMWPdToViWRN+ruXhK+KjVnh/rG45FVNyy1ak=;
 b=jobxNfz4bvCdSp+AYDD08VXedGW5Soi93u1NMK1875B0wSExm9P38UIdreuNQFqlvG
 7WpoU9mfAv61WowtUuMVWx/qon2C9ptyc4nFI5IzD2aprU/+eHSDaMdNfxI4Fd6h45CG
 SRhG3qIiQglTiAjiQVyXeZ3a1tJt4PNmeGTMruecy+iM+2rXd3Fb2jnT9B4dxvDCJflT
 rHqbRdRP9tqpwcqtF3Mnd+zTmkCfXtPeAn/DTVE6eFUHsZPaZdRUKr/YfzrybsXvqc3f
 wcRvLHD1R5PeGyZVfOb4pZtoD8GQ4I26EoovSnV4vWtuwR/c4uylR6rPO893jkVtus2r
 7sqw==
X-Forwarded-Encrypted: i=1;
 AL+hErEffG1JnbiKTYq7krOFkj/YFlUiRC1JZpsoduy9Fb7jvB9Ymcicito5l3hcAigrQWsAerVA9DSjHw==@nongnu.org
X-Gm-Message-State: APuU4Z99rRHQrnS65ODxkfuQiSR7nXoZLBOLQSbwMS7TEr/grev42wvw
 NQf2Y0yQSisYUljNDsn4DAPyJfqD9kb/V/Al+byvO1yiKyBctvITar5jcG6v7t+Fc2bOnoWRhk7
 ri+p3EbJDCkEhIt9ea4KhfCmKCbOv1lvZRLJfq9sJZmEiUMn4wXtWOYA=
X-Gm-Gg: AYBFou3ZFOy+KEphHoQyq8nSEYMiBc3FQWmaPRkJJsk1lhOhSqiHERVkEFIVz6L6gMv
 X4YY6BJUPLKEssAMi+RYoqVVgCpgIZXC/A7KWSLXuSbdNVTz4p2pwJ6BvYtWUGZclL7jV3eW0RU
 xo/58qyqWCLi/qU93RQuxnCSvjkO3NfOIeiaAwzq+JuoqBnMfnIQHIWU1opW9WIbOGK9EsAobJg
 HyidtweWKU3EE4naqsas25Qrcn7yKdHtWdd9Qz2Q5M1xaxTqfCCZ+JuHSejxnf1XCHBhvQjoNz4
 JvvdnIOSwt+SuPljSPWz5MzcoI8PPq//tImDfztuM03Mmv6yvmBTda6dAe3gJQr5TYuupQpprI6
 gMJbRGV9+aVAApthjBceQdMIOqav81gbKFD1ZKZZyTPNqFvkcFdn/VA8jXVeBiRN5EXWAqBN9I+
 bjMFip7VtcNN+pvA==
X-Received: by 2002:a05:6122:e22c:b0:5ea:c4a9:e6f9 with SMTP id
 71dfb90a1353d-5ee1c3db264mr2217607e0c.5.1794492227287; 
 Thu, 12 Nov 2026 06:03:47 -0800 (PST)
X-Received: by 2002:a05:6122:e22c:b0:5ea:c4a9:e6f9 with SMTP id
 71dfb90a1353d-5ee1c3db264mr2217526e0c.5.1794492226439; 
 Thu, 12 Nov 2026 06:03:46 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c43f4sm19840739f8f.47.2026.11.12.06.03.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 06:03:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH-for-12.0 0/8] linux-user/aarch64: Support both endianness at
 runtime
Date: Thu, 12 Nov 2026 15:03:35 +0100
Message-ID: <20261112140343.61634-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5jIw2vMFoIQiI7ns-dkg7B9ZOOyvUnly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfXy5jSf1QY0dnK
 gYkkfk0IFzQoFuQsVyGLH4o2bJp/nNSWRUCQqjgD/IkB9ENHw64a98UiDQkpNp9M6VNIz+j9uzj
 dgxmJ/mYhuhR9hbG3tFipovw54bOzvnX/tpFTOYSBJiRyBB9sOvL7B/7i+hScMf9xbvg2cL2rx6
 FL4us8A/RNUw2XyHSRIL4oJGrIAE46Y4GixF0sWxlwUL+kwJw3UxtM4MtwSAKfZQ1CaaqH4Qp+r
 dnopm/cRL2tbGWPPN5Ucn1cqVibophEU5WbTQPynD1i7NW74hc+6oylwXzvBe5TMsLzLlLTkMlc
 34CVkyBxUoNupq9tQJTPY3UWUI4/hm5XCzcZ6NXxcyuzWKBTK2Pcocb8bi3zUT9ENY1HsejlIr1
 1AlLxNh2USjc4TwaArrmXljk/iYLlbr2mAaIwmHfhmojmC2W5LnJl8jn8sbwucxU3kcmuZ8Aat4
 5DC7J4GAGvqgtZdDKAA==
X-Proofpoint-ORIG-GUID: 5jIw2vMFoIQiI7ns-dkg7B9ZOOyvUnly
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfXwbQp5B5DR/Q1
 DppRUYJwL9ko23aW7/KVfP3AsYr6cVBVsnJRS5GiLs7/6/kssHGfqMRbUSU6xr8zDXvPNTy2Ks/
 gicy37DvFByMwkUM2P++qIvKUsMSfbo=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5c744 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=8y4J7cqPQPxHiqI_TTsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120055
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Philippe Mathieu-Daudé (8):
  tests/tcg/aarch64_be: Check data byte order in hello
  linux-user/aarch64: Move ELF/vDSO endian checks to runtime
  linux-user/aarch64: Move CPU/signal endian checks to runtime
  target-info: Support runtime-endian Linux-user targets
  linux-user: Honor runtime byte order in ABI accesses
  linux-user: Select target byte order from the ELF header
  meson: Support Linux-user executable aliases
  linux-user/aarch64: Unify both byte orders under qemu-aarch64

 docs/about/deprecated.rst                 | 13 ++++++++
 docs/user/main.rst                        |  7 ++++
 configs/targets/aarch64-linux-user.mak    |  2 ++
 configs/targets/aarch64_be-linux-user.mak | 10 ------
 meson.build                               | 39 +++++++++++++++++++++--
 include/exec/tswap.h                      | 11 ++++---
 include/qemu/target-info-def.h            | 14 ++++++++
 include/qemu/target-info.h                | 20 ++++++++++++
 linux-user/aarch64/target_elf.h           |  6 +---
 linux-user/aarch64/target_syscall.h       |  6 +---
 linux-user/arm/target_proc.h              |  2 +-
 linux-user/qemu.h                         | 17 +++++++++-
 linux-user/syscall_defs.h                 |  7 ----
 target/arm/internals.h                    |  2 +-
 linux-user/aarch64/cpu_loop.c             | 12 +++----
 linux-user/aarch64/elfload.c              | 10 +++++-
 linux-user/aarch64/signal.c               | 20 ++++--------
 linux-user/elfload.c                      |  6 +---
 linux-user/main.c                         | 26 +++++++++++++++
 linux-user/syscall.c                      |  6 ++--
 target-info-def.c                         | 19 +++++++++++
 target/arm/gdbstub64.c                    |  4 +--
 target/arm/tcg/translate-sve.c            |  2 +-
 tests/tcg/aarch64_be/hello.c              | 11 ++++---
 .gitlab-ci.d/buildtest.yml                |  2 +-
 .gitlab-ci.d/crossbuild-template.yml      |  4 +--
 linux-user/aarch64/meson.build            | 10 +++---
 tests/tcg/aarch64_be/meson.build          |  4 +--
 28 files changed, 208 insertions(+), 84 deletions(-)
 delete mode 100644 configs/targets/aarch64_be-linux-user.mak

-- 
2.55.0


