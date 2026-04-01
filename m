Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F53107639C
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:22:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w817u-0006Uy-11; Wed, 01 Apr 2026 15:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817l-0006Sd-A1
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817j-0002yS-1H
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-35c1d101355so26133a91.1
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071265; x=1775676065; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wlUtd9hzFjQDa1dMzUiMwhYcP87M56Q72IRWWsTFSIs=;
 b=qrSqosmf7An6VtjPRf/cstXDaBYw52OytweW32fXu24YQ8V65NB75FLBX4cMDgvy2T
 NF+YdcLb/Y4ZrHnY/yGDw2Hyi5D/XNdzSkK8JvVXs1wTW7BqIK2kngntHTb1q8f9DDZ1
 oDK3HvHvi/xWp0C5RijhPoNFL/aNiVzdvgP86942XP2EFtflT5t2m+Oib4LbGyQElGoJ
 taXSNvEpTo/4WkRpI/tlSf4Lfv3m6p7HX2DvcLuGtggVY7Q3oIq064FOx1OI4l8+WxVv
 LG1VnhG3B1w1G5HfQoXNNA4AB5uxfcKbRCnPj3Hh4PDQvWHxeOuYQmSnybnbQcIOuoqx
 AEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071265; x=1775676065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlUtd9hzFjQDa1dMzUiMwhYcP87M56Q72IRWWsTFSIs=;
 b=X36ci+1E+mkBo1VzTrUve9HIed5GvjM3nnTwuegWuiwSfFG1mkgksIItUFAh24P7lY
 aTP4w/R7imRorRxwlRE9DDf2zWPWE60J7YQnTFeseLPEM4gDA+i5/ejP54zCjr8ilJe9
 y8mTftxavbcdRhxUR9LDtHLd+QT32hI2ymNWUndEepP4TUrg09KbXQBESzKlVKILKKDQ
 W+GjBQCNH9aOLp1CLHza1/OtXQqhJ72uNw7EN9ZHp6qxCkS4NKOvXytsOpb7xV6LDEQP
 vBiaQKFAPGX0iIRUptKlJ/jRERcuUi/clOSnvvOwjukj4uSRW+Xhu99X642HInefFTLy
 2Drw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNgjAJHLUHD6mQrgDqHTjan8hd7JqeAyQblYp6EsDz1VTfffeyqWRccIzyzHM7ECeEmSaw7ooNjw==@nongnu.org
X-Gm-Message-State: AOJu0YykSpqCQjUEQ8eQKo//LXdlOuInfTmefa4itYcgrX0kakahlX+Q
 jEczXlwK8CXQdzp9Kkue6TZubq0UIIr8CSSg4GpL7jwTrJi541NVkznxRH1O8SG1w30=
X-Gm-Gg: ATEYQzyReE5cW7By9L5XumtNYy/mCCsTouMBQbWO3E4VqBet9SGJlL72MghkedDsp1n
 /PIix8/fdrXAFCw2cgAPIaO/AOBF647tBW2ZeTB8s9c2zBJo1kfWyDX0aEIVqEFr8UGHm9FDBbK
 wwCXKWQOYq0YcKoGe8x6KBiOdzjNjCaSciOGULIfognysEvvt9VbWXkd08opfbtujFx9Nf8NhF6
 dJEnbLaas4Gvy6q42HPn2SlJtNbgjmMgGC9LEYR9D5YRX4mC33uTHysnINVpBsCZAQcSgFhBTFq
 etitPdFMIYPCqpknFy82wN4hcd2QCaZUf3Os2D66UJVSvfl6xiSo74TJoOdNT07WJK/WmlicF0R
 eiHCh1LojnRFCaLy2UQHYt6awH/jFzmUSO8hNCOGSRik2m52VlcGRa43AkO05LzTJJwV1aTH0WT
 nTRGhOVrNsBRlb89AlACOXgcyCiAsblSv0gZzF/xC/INHtQ7vunw3otiCtQTIexs1rE9G64Jtao
 Wc4
X-Received: by 2002:a17:90b:2783:b0:35c:cba:344f with SMTP id
 98e67ed59e1d1-35dc6e7a282mr4846063a91.13.1775071264606; 
 Wed, 01 Apr 2026 12:21:04 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 00/12] target/arm: single-binary
Date: Wed,  1 Apr 2026 12:20:45 -0700
Message-ID: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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

This series tackles (most of) the rest of target/arm, especially tcg folder.

We extract tcg memory operation in a new header, with a new type representing
virtual addresses.

Initially, I went down the way to have a dynamic definition of TCGv, which
required much more boilerplate and runtime checks. After discussing with
Richard, I realized it was not needed, and that could simply split 32 and 64 bit
properly in different files instead. This approach will not work with other
architectures, requiring something else, but it's enough for target/arm.

Files left are:
- target/arm/tcg/mve_helper.c
- target/arm/tcg/m_helper.c
- target/arm/tcg/cpu32.c

v6
--

- meson.build: extract decode files in separate variables and explicitly include
  them in user and system code. The duplication is now minimized: one instance
  for all system binaries, and one per user binary.

v5
--

- reimplemented what v0 did with new approach defining new tcg-op-mem header
- reapply all straightforward patches from v0
- only translate.c is left, but first want to validate that changes here are ok
  for maintainers before doing more.

v0
--

See original thread:
https://lore.kernel.org/qemu-devel/20260109053158.2800705-1-pierrick.bouvier@linaro.org/#t

Note about v1 -> v4
-------------------

- After v0 which was trying to do too many changes, v1 to v4 focused on smaller
  things, and all patches have been merged already.
  https://patchew.org/QEMU/20260219040150.2098396-1-pierrick.bouvier@linaro.org/

Pierrick Bouvier (12):
  include/tcg/tcg-op: extract memory operations to tcg-op-mem.h
  target/arm/translate.h: remove tcg-op.h include
  target/arm/tcg/translate.h: remove tcg-op-gvec.h include
  target/arm/tcg/translate.h: remove TARGET_AARCH64
  target/arm/tcg/translate-vfp.c: make compilation unit common
  target/arm/tcg/translate-neon.c: make compilation unit common
  target/arm/tcg/translate-mve.c: make compilation unit common
  target/arm/tcg/translate-m-nocp.c: make compilation unit common
  target/arm/tcg/op_helper.c: make compilation unit common
  target/arm/tcg/gengvec.c: make compilation unit common
  target/arm/tcg/translate.c: remove MO_TE usage
  target/arm/tcg/translate.c: replace target_ulong with uint32_t

 include/tcg/tcg-op-mem.h       | 126 +++++++++++++++++++++++++++++++++
 include/tcg/tcg-op.h           | 100 +-------------------------
 target/arm/tcg/translate.h     |  14 +---
 target/arm/tcg/op_helper.c     |   1 -
 target/arm/tcg/stubs32.c       |  17 +++++
 target/arm/tcg/translate-a64.c |   1 +
 target/arm/tcg/translate-sme.c |   1 +
 target/arm/tcg/translate-sve.c |   1 +
 target/arm/tcg/translate.c     |   6 +-
 target/arm/tcg/meson.build     |  51 +++++++++----
 10 files changed, 192 insertions(+), 126 deletions(-)
 create mode 100644 include/tcg/tcg-op-mem.h
 create mode 100644 target/arm/tcg/stubs32.c

-- 
2.47.3


