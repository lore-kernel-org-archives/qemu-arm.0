Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C910ECA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 19:26:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBzwO-0004OU-LZ; Wed, 30 Sep 2026 15:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominic.plunkett@gmail.com>)
 id 1xBzOw-0000pH-Th
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 14:51:34 -0400
Received: from mail-wr2-f35.google.com ([74.125.225.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dominic.plunkett@gmail.com>)
 id 1xBzOt-00080f-08
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 14:51:34 -0400
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-48b05fdb2f9so240858f8f.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 11:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790794288; x=1791399088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z5qLeOY2G7RNIauWgxn2GCHdV5Z4xLWEsfOsvx+wKs4=;
 b=tQQm4kmi8ia72EZlGmEGspW4b3g9DHjfu7/brIdqr4fLAwfsZnLrUsuXXNshXDKvjI
 h2984IBmgXDTxcksZe7yrhUVrb3ZIYGsKdSfAbfM/gmI70F0NQt1QA0FWKiXuSjsjxmd
 V4dT7yJZng8cGQ/QkHPTpnNaaqk+HNpeE+7UAojGnyTTdBQw7TdtDfIlqyHF+6XWz6Nt
 EfOc3hHuOKxK0f60mPINjuiuTd2CaoGYhTqq7D1a1Qx2DfyULk14iNrSDfL//qgE2g04
 eAQizX1kbptMMmpvwEB2iWXsw5/ST1TpRvTS4mLn2RQbfI5CVTX+D94UCwpP5RZ56FYB
 Dfyw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzA+BHwUj6YjSA+27bHjMVhzOUTZKHvC43YDjaXtHlhahGH9dHSHFQ/c11boVr1CuRf/bTRomOV9w==@nongnu.org
X-Gm-Message-State: AFq9FYJMvsG+deU9O9fRGAYdFYBZfHwYzpAbWI35lTZ5zCG6fYhXMEeV
 pFvfPvTG2mrB8kDyUSw08UOkn8Hpmn5uUdRX+BF4s5cIGz5GOV0jT5uz
X-Gm-Gg: AYBFou2A3d2ZTXZ7VcmuF16r0viznpECrlRRHJeH2CuIhZSnRkEZ833GXz2g9eg/Mrr
 Bb+LHUvuE5HxzPRXl3L1tlvXHnokNpyaiFbnTn9U1236g8ZBRXuKUzR/cztL5YyeVqPblQMYDq/
 /NH9Hb1X9UjGY5jNVKh6Ni+ylm6jW2ypm8gp/Tp+KE7vGsvAYW251hhKDe4f44tnMiJIprh1qvh
 G2PU+X+M4smdnqGS6ZNYxRf6vmHDHf8S6xQOgtG56HHdbqHVkJJ5YzBEbgtQD1Rczf1rsMk/iwh
 3PEekdoF1s8DYIJcFN4eFg+7NzEkzqWySZcLUPB/P1SirC9KwPSQwFa15ojGsWBEBjyrgsBDZyH
 aGwz2TqbPF6jN6guNTg4tVpyNchqlT3hfREPCGGIDeSxp+v5DmMlcrpur84q/ZaWPrwkI01ixmZ
 TKpcEcinCy7q+gOm3WYR180r+55NqlRTGjTo4qxZcuhjd2jN1UTppnGNbt
X-Received: by 2002:a05:6000:230a:b0:48b:515:f94 with SMTP id
 ffacd0b85a97d-48b05151156mr1966979f8f.51.1790794287814; 
 Wed, 30 Sep 2026 11:51:27 -0700 (PDT)
Received: from tower ([185.182.52.52]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068ff96dsm1162790f8f.8.2026.09.30.11.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 11:51:27 -0700 (PDT)
From: Dominic P <gcc@gcc.dp11.uk>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH 0/3] tcg/optimize: Fix s_mask for rotate by constant
Date: Wed, 30 Sep 2026 19:51:21 +0100
Message-ID: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=74.125.225.99;
 envelope-from=dominic.plunkett@gmail.com; helo=mail-wr2-f35.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_MSPIKE_H2=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Sep 2026 15:26:08 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

fold_shift rotates s_mask for rotl/rotr by a constant.  For I32 the
INT32_MIN OR in fold_masks_zosa_int can turn the result into a bogus
sign mask, and the next sign extension is dropped (ARM sxtb; ror #1;
sxtb, i386 movsbl; roll $31; movsbl).  Patch 1 handles rotates like
5fe51606146 handled the logical right shift, patch 2 adds tests,
patch 3 builds the test-i386-opt-shr test that the meson conversion
dropped.

Found by differential testing of GCC output under qemu-arm.

Tested: make check-tcg for arm, aarch64, i386 and x86_64 linux-user
on 9c88811b81, 312/312 pass.  The two new tests fail without patch 1.

AI disclosure: these patches were prepared with an AI assistant
(Claude, Anthropic); each commit carries an Assisted-by: trailer.  I
know docs/devel/code-provenance.rst declines such contributions and
that checkpatch.pl rejects the trailer.  I am sending them openly and
leave acceptance to the maintainers.  If they cannot be taken, please
treat this as a bug report; the reproducers are in patch 1.

Dominic P (3):
  tcg/optimize: Do not derive s_mask from rotated s_mask
  tests/tcg: Add tests for sign extension after rotate
  tests/tcg/i386: Build test-i386-opt-shr

 tcg/optimize.c                     |  7 +++++--
 tests/tcg/arm/meson.build          |  1 +
 tests/tcg/arm/test-arm-opt-ror.c   | 21 +++++++++++++++++++++
 tests/tcg/i386/meson.build         |  2 ++
 tests/tcg/i386/test-i386-opt-rol.c | 21 +++++++++++++++++++++
 5 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/arm/test-arm-opt-ror.c
 create mode 100644 tests/tcg/i386/test-i386-opt-rol.c

-- 
2.55.0


