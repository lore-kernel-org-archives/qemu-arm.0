Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp615321lft;
        Thu, 30 Jun 2022 12:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uOKJ+n1KzB/dWXf1RNYkYKHx0RgkiiUc2biwHUwx7PMJ639RRMrKxd2Se4HYj8iNsLIQFr
X-Received: by 2002:a37:a802:0:b0:6ae:e7bb:d7a9 with SMTP id r2-20020a37a802000000b006aee7bbd7a9mr7700107qke.619.1656618133264;
        Thu, 30 Jun 2022 12:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656618133; cv=none;
        d=google.com; s=arc-20160816;
        b=EVpB6iveCL66jErtgTFx6DKyR05ljsNjNIDoGUlc8u3V+msH+bLyJWX4PwDl24owV7
         rBNENdTvS0f7WuQdFGzd7wYKBJ53q+7GYBBIbOKcuIqz2z97YnCDWfMJxS+JrnHGGyH+
         QxqF6pDIIJsCh+YomRpNvi/gAs0HV5V+zS61tACpizKYt3mdVtUSbmf9638w1ZYYho7z
         zyBg21JDb7HdxN3qzSRH8dOEPH1IzhR5QCoCaQR+hAA52U0GKnCmvbdMXAmgQAppTNqu
         ZSUZzMnf4TTGcenLTwI2l6KK5xqe8/fjQAESGlJNJopJ3YVFJjsYez5ElkQhy0xV/hL8
         JGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pPSLQDlykZ3dh1MSLWToXrQw2pSwDImSNh9oZd3sxAQ=;
        b=tDlPyS9O7H4zCjmZxV5YRxNsUzAItNppIM5dgzlTXlJwGSSUBb3VErsvjdVJhiIbCZ
         Zk8W+pteaeZNzWh3NR1JKTesoNUOQcL5uqYqOFWvaW3Jw9mhXG2DcuQwGdcRWi80xYea
         9CnJIzkr207hmnHNYSHIWxh5mQ8rby6jFwTzX3i5pny0rOonejn1W/ZaMsNfgF3eFSS9
         FlzuK9vpA0VufL113Nk5TsAhzDGuybFpp2ytM4ZLBnOLYJYwJRcLmsqLZcAUVTCJgkX9
         Lav4OEpKWQGq0je1JFmR6Z2BZ5FXkl+ktQTo6MzT5Npw8uKYrrA4+z4HhInq4P/79NUw
         h5Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DTbGRTdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020ac85a13000000b00307c8f0bac2si12550244qta.706.2022.06.30.12.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 12:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DTbGRTdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o703I-00031p-Ny
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 15:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702Z-00031Y-AA
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:41:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702V-0005Z2-E5
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:41:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id j7so2221711wmp.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jun 2022 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPSLQDlykZ3dh1MSLWToXrQw2pSwDImSNh9oZd3sxAQ=;
 b=DTbGRTdRJvsqavRkGehoiVZS4cpDeqiOjpK2tTMFrWZH4WylNBtogwjIHFv2yfxVNX
 8xG/60cNvlsf9fFvLFOFUp1LU0wPOYtXO7d56zDuF3DUPtTUKSw6cYvZFTg+DdOJjCcZ
 HbfTexBqKUFjwybQJEB0X1j1ad6uQpEzX2OciFHqnwy/T2dVld6k2sr6RGjnd2/gEcQu
 OlscvwrumW1ujeRqlBfv0tJjgaVa+NyL3AGbWLbwtnOKCoGL7mdwnny5nO3kZPgdCERk
 mZ7GZ7yhZVqa2w8JcoH2Ms3SHPwNEJrjWcN8RVCPKx7pchpLT2lPRnUozdMsw0aWw6IM
 xlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPSLQDlykZ3dh1MSLWToXrQw2pSwDImSNh9oZd3sxAQ=;
 b=Ie4TjZ4O/rhX781rb8hvOHdFZV8YO8rEODsD7KUK6naZBgro/q5Zf+YApwdIsuFdik
 J1m81OXAkBIH+zS1drUaHkvNyvJbDk2PzBgqruSQKxkHiJxfhFDN/Z/Q45DH4/9BSDks
 C5lvxU6jztC+51xvSQQP0hyaJgtNkv/hOrDlXsCs1Fh1a1XI/qUyPEmXNrtspqn0Ua1h
 6Fy7H7mikDk1bZl3to9KL3kBp86b21vblfEoOwv+CMqMfQEQJKx1tdUrPmYLAAeg/5Gr
 i9JiIKVwWTI4ZSs6V2wVIkzm/S9GMJS7qijVCJEsezZwHiovLM5hkCXrUuEjQY24Ae39
 ubMw==
X-Gm-Message-State: AJIora/7MjkvsqOXrCaeFgrpvGUezo82nl3m6ohl4IO2bhD9F0Cpyeb4
 1ozHdxOb7g7IG+1h9NhjpoupUzMguHRdEA==
X-Received: by 2002:a05:600c:c5:b0:3a0:3ef3:838a with SMTP id
 u5-20020a05600c00c500b003a03ef3838amr14029782wmm.50.1656618080234; 
 Thu, 30 Jun 2022 12:41:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m2-20020adffa02000000b0021d163daeb0sm13200228wrr.108.2022.06.30.12.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:41:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/arm: Implement (or don't) OS Lock and DoubleLock
 properly
Date: Thu, 30 Jun 2022 20:41:11 +0100
Message-Id: <20220630194116.3438513-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nf6P9yIJsjUu

Continuing in my series of filling in bits of the architecture
that probably nobody much cares about, this series fixes up
Feat_DoubleLock. DoubleLock is a part of the debug architecture
which allows a guest OS to suppress debug exceptions while
it is powering down a CPU so that they don't cause updates to
bits of debug register state that then don't get preserved
across the power-down/up sequence. The reason for looking
at QEMU's support here is that recent versions of the architecture
define that the feature becomes first optional (after v8.2 or
so) and then mustn't be implemented at all at v9.

We have only ever implemented this by NOPing the OSDLR_EL1 register,
which is not correct for either the "implement the feature"
or the "don't implement the feature" case. What is supposed
to happen is that if the feature is implemented then there is
one writable bit which is set to 1 to suppress debug exceptions,
and if the feature is not implemented then the bit is RAZ/WI.
We also don't properly implement the related OS Lock which
does something very similar. There we correctly implemented
the register reading and writing parts but didn't make the
bit do anything.

The series starts with some code movement, while I was messing
with the debug code, shifting 500 lines of debug related code
out of the massive helper.c and into debug_helper.c. Patch 2
is big but almost entirely pure code motion (best reviewed with
git's --color-moved support). I think this helps in our
ongoing quest to make helper.c less of a massive grabbag
of miscellaneous things.

Patch 3 implements the required behaviour of the OS Lock
(which turns out to be very easy).

Patch 4 adds support for some AArch32 debug ID registers we
turn out to be missing. Clearly nobody was trying to read these,
but one of them is where the field for "is FEAT_DoubleLock
present" is kept, so we need the data internally.

Finally, patch 5 fixes the implementation of OSDLR_EL1 to
either be RAZ/WI or to have a bit that has the required
suppress-debug-exceptions behaviour.

thanks
-- PMM

Peter Maydell (5):
  target/arm: Fix code style issues in debug helper functions
  target/arm: Move define_debug_regs() to debug_helper.c
  target/arm: Suppress debug exceptions when OS Lock set
  target/arm: Implement AArch32 DBGDEVID, DBGDEVID1, DBGDEVID2
  target/arm: Correctly implement Feat_DoubleLock

 target/arm/cpregs.h       |   3 +
 target/arm/cpu.h          |  43 +++
 target/arm/internals.h    |   9 +
 target/arm/cpu64.c        |   6 +
 target/arm/cpu_tcg.c      |   6 +
 target/arm/debug_helper.c | 577 ++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c       | 513 +--------------------------------
 7 files changed, 645 insertions(+), 512 deletions(-)

-- 
2.25.1

