Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A1606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i5AoBAwL
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSku-0005hw-Je; Thu, 29 Oct 2026 12:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkq-0005fb-2B
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkk-0000Ya-3V
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso21628965e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290398; x=1793895198; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RnwAwIz+PsCxMjFEC+AJfTb2z+24LhPAg6xy8beKLlQ=;
 b=i5AoBAwLwZWNbzmyLkAVV1yN+Y9fI3ETYiVcPqQhHjU1SxwI3rCI1K3gLnvpCRNKGB
 lBfr4mLAtJIxL0bVK3iBpETMu7zKXgb93nz170w5yrgF6n4EgYYd3j9PL/6e7AlfPaQe
 2M1d2sPOLPbOUND1dNB/bzTgfKVRVAClRWhvBPH582lpm/lfHlADl0DsZFLhA/kC3nDM
 Iz6YbETgBYCQBqW4MmGKQxVs9vZ5APaNK9DYwOs/zO+EUaB+hBmMUx8yyZMmTRMMIy21
 tQDb7kXYTm7ufwC7e8Scywflm4ocUEbF3aMc334+2tcCpIfmdNpwvGNhup8DmUpELuDI
 9KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290398; x=1793895198;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RnwAwIz+PsCxMjFEC+AJfTb2z+24LhPAg6xy8beKLlQ=;
 b=y/syTxS/z3ffNyEOut8/fWhJB+vOOCxzTfsADUE6I9vtinAphMXu+P1UstUhvnuoRQ
 VRw82uYC60aMc7zHRLnW8HvFCRKAkltitMlvSN27q+mSofi8ULVSFlBVsyVhDCgMgM95
 TIfYU5n+DiZzUiE7zK9HwRh/Usj/ovLQu5OZ+Nz++wkQE2OlQdyvKDESGEwiI98j80Ua
 RE7MWjNQqcdvyuSJ+HblT8mv1xjZcJFyC1AwykofzBsegCdcOvqNIvLkzlrXUlQMcW63
 vO3AxnhdQLuAMqTHvJp+2mg6rv7jJSCwalU6Cd10bCyhQUh6WYnXohC24ptOpHhSkuMO
 a68Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzuq+YaXoGKZFVtGvv5PLofeDozMl5wRpkE/dcEXA+HG5TSeTlP2S4dGbuWVkV4KI07ZFnRk2DTqQ==@nongnu.org
X-Gm-Message-State: AFq9FYLyvwNi2PP6aUbKcMFBrCEGsg+QrFb81QtFRo3x5f8YuZrlh+J/
 NOTG45V3xcdGcYWdU1LY+Hn955XT0xpVxdIl7ADOZEqtDFmkdjjpCfBIEddkg6eP7y4=
X-Gm-Gg: AYBFou2AI3UtmPPNnVRd+0xGBn0L00ZpOeRSnPOtdOan6/4Q7JK8bM//5v8bR7+UOWL
 A9Q+Fy0IK8UgMe3UeyydaHARLNGF3RqwPAX1SpKHWgYVKs++Q5Yw9op/eFZHC4QXr0YvWyFsjnF
 yD1x0rtWrIxRSrO1oS5TDtyWTfSBVQnmseyyMnOnPTf3bh+5NvUNere49bST6XhdieWDhBdaoc0
 nU+XofR/N+2RbH62Tyr18ZTVtV1m/4cFK2OI0WuHTQ2tZX4BE+b7y9YVI5wcF+h0Qqtx3UYRRZs
 Zdp7twyUWwHun1Cmht/QM/Wezet957Nbxh1z0bPJz2aL1mPhuvg0AYbhfrTOpbmzEeyDWaGShFu
 6OXe2BekrffRxAFkmTVMdBjqXvJYuh3xvomXoUCDjEm+kxBC22H6KGPiMrff3x5Fy4GK2MAjfa/
 HiijK9SBxBivaQFM12GIfE1DX5I1TVlYDq/Av/QzPBnveOnTYsfxgLp8rUwyNON8mMR573WDW/H
 AIYKPKkwDaYRfjXHRxjuSL7DSrM8lE24Fip66o5B1Ku4Dz35N0QuA7wsk/0F5nubJoHMWmshHIW
 0O2HgGmWHa+o7FrCLLL/CLXSEuxj
X-Received: by 2002:a05:600c:4f89:b0:4a2:1612:637a with SMTP id
 5b1f17b1804b1-4a966c4110fmr138745245e9.16.1793290398318; 
 Thu, 29 Oct 2026 09:13:18 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6dfca7d0sm59718f8f.59.2026.10.29.09.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:13:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E59D25FB60;
 Thu, 29 Oct 2026 16:13:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 7/8] tests/functional: remove @skipSlowTest from quanta_gsj
 test
Date: Thu, 29 Oct 2026 16:13:09 +0000
Message-ID: <20261029161310.2065290-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029161310.2065290-1-alex.bennee@linaro.org>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The full quanta_gsj test would have caught the regression caused by
the WFxT implementation and isn't that slow (<60s) it needs to be
gated.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/arm/test_quanta_gsj.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/functional/arm/test_quanta_gsj.py b/tests/functional/arm/test_quanta_gsj.py
index cb0545f7bfa..0c0f5d85874 100755
--- a/tests/functional/arm/test_quanta_gsj.py
+++ b/tests/functional/arm/test_quanta_gsj.py
@@ -30,7 +30,6 @@ class EmcraftSf2Machine(LinuxKernelTest):
          '20200711-gsj-qemu-0/nuvoton-npcm730-gsj.dtb'),
         '3249b2da787d4b9ad4e61f315b160abfceb87b5e1895a7ce898ce7f40c8d4045')
 
-    @skipSlowTest()
     def test_arm_quanta_gsj(self):
         self.set_machine('quanta-gsj')
         image_path = self.uncompress(self.ASSET_IMAGE, format='gz')
-- 
2.47.3


