Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC6E606A31C
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 14:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hiTCv6D2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijjWaw7U
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM4jc-000584-Ge; Wed, 28 Oct 2026 10:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4ih-0004tN-PP
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:33:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4if-0004RO-IG
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:33:39 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBdx4v2082404
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=FHNrySZKENM7JMaK+qV6uC
 eRhUbtJ3VhJtVhRrPaO7o=; b=hiTCv6D2xv2g/gfRd65rGlnXTYZjUn7kIrn2pD
 UpNa/K1FvDJ3yQ+PUJl4Ejsiwjj9sw2EQepuYuqe16Rsob7Vw6uyFjJscyuj5zst
 BhQnUXqLJiZ9oi4M89mdJ0aMolFofEzNxIIq+MDcyFzkLWl/HW2mIq5vhxfzfH+6
 Goni0Bflc0kmZ7OxtvYXkV4OHUexD2dupBW6s8KJUwysKTrYUWxi1LBsZ0Wihtqb
 kVBnB3okOku9LJ/Wql4ZZCTGrNYJj52hIgDi087ihPa8uQ+9G8NE7gjNAmDYdyF8
 Kxy+CZsTcr/DePLUfa6OJOq849CkgCY+R9pLV9sVlhisfguQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpvfgb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:33:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso124744485a.2
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198015; x=1793802815; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=FHNrySZKENM7JMaK+qV6uCeRhUbtJ3VhJtVhRrPaO7o=;
 b=ijjWaw7UekJxOk1uBbmkJi8yXQS/2btpcFF0GzC1Szh3ZdGusszTbfKgmwA1UYZUtu
 QDCg04j7foLXBpJXw2Isn5JdPs5o6mRLguBrvDMPjF01hofWGSJAzuDcnzlQy7/CawLk
 6Fn/bPDdsRtzoQF3DXwXRdadMElSokSg6uhfM8M1DtS0jZpZVDhFgZ+sIf0xijXx+B9Q
 kg+gZn5ljvayJRDNmcLgiEoGtqpFlguWz9dghV43RCiiVNUTqaxUei9kk6c3uoS1ngDa
 5jIptv3u5lPRpVATPyUJMQSFK/imUhp6RnXCmx82mb3MVqfQYw5n3FPJ17QeI5Zamvzl
 a0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198015; x=1793802815;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FHNrySZKENM7JMaK+qV6uCeRhUbtJ3VhJtVhRrPaO7o=;
 b=v3W2Hqxz+t3FqCHngSOpPjbTehe6Xoo+AAyCEilSOP3sy2vEq1RApn6JqbCFkB6/TO
 E0RnR6pUMltdV8Xm4ldmhtBrywf+nXTVdg2LzhDaDKm+cvMKGMH+Z35L/bapmzOXvRLF
 UdgIuomGLhDiypFrRqRT0Opjk9zut5epIPDZodpcc9RZULlq1Xz+YG8IfDbKeBECaI7K
 4mA8NbToIn7NQYuEQXABFybO/LenkDzYGfP3mfsZHNghyXce83s2YVlq8pismgL//ICG
 z/q7OKZbzyc7AaY3VVd8LI9+Svx6IgSBnOWwWZ7jH8VBXC7rIyG/2f69TQBtTAXRbJgT
 OKVQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3bdR2bXLLNalbV0lwSA8IbJM5RKEaEb/T29dvtcDZ56kyMcTJWSpogkNByWnS6T4rK/cTFBQZTQ==@nongnu.org
X-Gm-Message-State: AFq9FYJN2SXok0xPC4LDNOXjP3LM0m7jFnUU8cWbcGaJHojDyaDnahd1
 5hsYdxqTOwhD5E5x7GPWc85VjsHJZFLVx6EBZLX4/tnHEH2NxZZKQYIkEroXQeFz4+btYnoQ33G
 z1ObUy5JxnrbWr9HjF1pjWe6nEYTrOFbA8Va4IBl14+A4T3eGPdMy3p8=
X-Gm-Gg: AYBFou0fRfOvxB6KIwZTTu1yVJvw2euFtfWSOVaCe0+S+6jrvNvk6thGpirRBayGCpi
 /qWaz3AvZCEEeqTPx3OQ7hCwt+pSZNYdwEGX0KSfAG3fqe5QQ4eDsLVyKgHt6ucB2foqN2UiOJE
 OfP2EGQ6TUsmhf4yevtYSlKtbizWJHcaz7wUBtTfTltnrdENt8wSNvHxOUhmfAUwwoNeImKWetZ
 adPicN17bCArp/5nSr1KUeSqswEGGBScu5CUFH5mUeZjVKKDuF0458hLKS5tJgvTAHtF/8+/fsa
 o30OqQWTren0VQBbX17LNmq0+mD1IQuYeOEvQrGrEm79lJjHs9Y4WqO7vW+gZjm+M9Dd0dvLcd4
 4xh/rAljASz2n87nn4g8cBIoYEVP6QqLb28j2v0NeJ57rNYHAGUgldQ+1RwvtbdHzSnapGHYNvC
 HPYKY2OVTPkfrcEUbeb5Jc6t4gM1L6fA==
X-Received: by 2002:a05:620a:462c:b0:93e:8614:bbe7 with SMTP id
 af79cd13be357-9440892fd22mr359231085a.12.1793198014360; 
 Wed, 28 Oct 2026 07:33:34 -0700 (PDT)
X-Received: by 2002:a05:620a:462c:b0:93e:8614:bbe7 with SMTP id
 af79cd13be357-9440892fd22mr359224985a.12.1793198013796; 
 Wed, 28 Oct 2026 07:33:33 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f37csm23447939f8f.8.2026.10.28.07.33.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:33:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 0/6] tcg/riscv64: Fix vector immediate handling
Date: Wed, 28 Oct 2026 15:33:24 +0100
Message-ID: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX94XNTf+yVL2X
 PTR9fNpnJ8Bzv/88FRKSqtuaH5hhFh5cq7QLDuvreGGSXH4NzN4KG7UQ6/wFXgFLq5rmcTFJbJJ
 hirK5mgCCdBhDCy5e+saAMvoFzOW2ApC1/C8fZyN0CY+vlTZaDoyKQ1xVU1hxMyWsdGbcTWSe3+
 WpGjnfx1Ongusl3aSYpAsoj4R+8+Jtm/2oqi7OP7A7/Qos/SFBKb1GNmvkHdXinArra4SR6YMyC
 rykVQMZ6kOCByZSXUKkKJTLlChKCQIkjMXZCy4RmEPKYbTtsGMmNXfmsnYFiUtMKZtmNl0Nn5cN
 MIVTGlYpDcBZ+g04tWiDCnh1JryRDj8qZu/QmXpv0LB+Rf+R3XC9AGntXwU/9XZ1ibkG6kV0d+R
 vvTZbzjktR/a7EBPFhuQW6LoLpVJbJnZz5FLVbHbMCclyGV7z/jK6oP8Ez4EmsVIoPrTz5ohRL7
 QA2MfUOmt2CVVmTN2vw==
X-Proofpoint-ORIG-GUID: wOtH4xAXidcVC-SG5bVg8CFrzPIrBrCw
X-Proofpoint-GUID: wOtH4xAXidcVC-SG5bVg8CFrzPIrBrCw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX64OCOQd+6dQM
 2DYRuhq3hXIuRvn3Tw30KlNa4GuwK5vnEYs4SgKSVqsm7L7E5VlMg+EJ2P0ZRQWriocjSuKEU4j
 PUprsn7m0yHIqGgngRZrJNRBLhmpQCU=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae207bf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=hXZgYZo4AAAA:8 a=1pMTofLOsOuyETur9yAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=37BJPeUnzxYkbV1yBC-1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The riscv64 backend mishandles constant operands of RVV .vi forms:

- logical ops apply the immediate at a stale SEW (wrong results,
  since v9.2);
- arithmetic, compare and select ops encode the whole replicated
  64-bit constant instead of one element;
- shifts take uimm5, but the encoder checks for simm5.

1-2: add a uimm5 encoder for shifts,
3-4: extract one element (vec_imm()) for arithmetic and compare/select,
5: follow rth suggestion of adding a new constraint to pick the smallest
   element size at which the constant replicates as a simm5, and the
   emitter switches SEW to it,
6: AI-generated regression test.

Tested with qemu-aarch64 built for a riscv64 host (debug-TCG), run
under qemu-riscv64 -cpu max: the new test fails or aborts before the
series, and passes with it at every SVE vector length.

[1] https://lore.kernel.org/qemu-devel/20261010174742.3552498-1-aurelien@aurel32.net/
Supersedes: <20261010174742.3552498-1-aurelien@aurel32.net>

Philippe Mathieu-Daudé (6):
  tcg/riscv64: Factor encode_vi_raw() out of encode_vi()
  tcg/riscv64: Use a uimm5 encoder for vector shift immediates
  tcg/riscv64: Extract elements for vector arithmetic immediates
  tcg/riscv64: Fix constant handling in vector comparisons and selects
  tcg/riscv64: Fix logical vector immediate matching and emission
  tests/tcg/aarch64: Add vector immediate regression tests

 tcg/riscv64/tcg-target-con-set.h |   1 +
 tcg/riscv64/tcg-target-con-str.h |   1 +
 tests/tcg/aarch64/sve-vec-imm.c  | 233 +++++++++++++++++++++++++++++++
 tcg/riscv64/tcg-target.c.inc     | 116 ++++++++++++---
 tests/tcg/aarch64/meson.build    |   1 +
 5 files changed, 330 insertions(+), 22 deletions(-)
 create mode 100644 tests/tcg/aarch64/sve-vec-imm.c

-- 
2.55.0


