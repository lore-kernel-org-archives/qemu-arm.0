Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6276393eje;
        Tue, 18 Jul 2023 03:47:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFn4ZWyeSZuw9NE8pHEcYve2h+vTeLp4fTJ7cSr3dU52JUuQHzC4NpFMfdACAolx+/SQHYP
X-Received: by 2002:a0c:f492:0:b0:635:fc36:d0d7 with SMTP id i18-20020a0cf492000000b00635fc36d0d7mr10926960qvm.60.1689677227480;
        Tue, 18 Jul 2023 03:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689677227; cv=none;
        d=google.com; s=arc-20160816;
        b=wOGdHLgGNsphfFs8J7NTvH+ZnghfUybp0K35jSuaV+6cWPX3KIAZa0YZ4gXQP+RmJI
         ocx701V5KWjUHOTvOXyyGvnv4RmDnA453F0TcGsQE/URr2w28Cb4FLQR9j1ImUg6vFe6
         OFekvUQx488ePBYKRM9aUJpW+87XsW/Ve7EgxKx1P8AGfX9SXAj3g4Xm6VdqGzyL77y7
         GThp4IQwNRZ6xp5+rhPWwfRJsoEncy/TNuxKAcPpmkDACbiKLegQj+MegCxoWtUlGqt6
         gStayzHnY6VejZA5yyYpzuaLouyXYeiMj+tAPdjFB72iIkXB3Rg9h0pMvdy9/S7ZFyUM
         r7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=y7oUZ4n1mUCX7pEZw4Et8W3HYEPkB8j81LvGnYRlU10=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=XSQK//ZUxx3erZlWc3hfYt32x34uJMHtvXIou//rtLnngE+9zii0ZX+tE+KxY4u5zl
         OZc5cBjLoRmm5gfECSjRCkyDkGAfmVM10VdTe0uJ6yvahq8Bz4kE2Bw15GfWruwqlgGY
         KrrdVsE2nskk8dS6NMXpK/JX+Hlo9MMpFslC08ZJQnyZAX0te5JDcY+DqL1Ff1V4vvyH
         mYDnQkLfK+eJmUcrR2Yb1kQuCtGd1WoOPBCWaGmj9kJPg4l/SCT7yTzizutgf68F4Vtx
         TDypjUwtM9kEkUIdsK9QGm6h3CoGuxxWSa4z4JKq8+svLpeXK77TMJC0g+hwdcz4FDSl
         IM8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uCBxGDgN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a05620a070100b00767580e4f12si826241qkc.511.2023.07.18.03.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jul 2023 03:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uCBxGDgN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLiE5-0005QD-CP; Tue, 18 Jul 2023 06:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qLiDx-00055v-9v
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 06:46:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qLiDv-0002Yq-BU
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 06:46:33 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbef8ad9bbso55205015e9.0
 for <qemu-arm@nongnu.org>; Tue, 18 Jul 2023 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689677189; x=1692269189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=y7oUZ4n1mUCX7pEZw4Et8W3HYEPkB8j81LvGnYRlU10=;
 b=uCBxGDgNC5ROxe9CKZiICcvaDx1kNIeGWsXIGBEXsvYHlljBk+9h2FsMq97BoUIiUi
 FsUcl8AUz7gqqgpP6eZnC6qSBUd8osu6rkmg/qbtyfF9WYOGZGIx7lMr4tet6k86o58W
 CdnRSsSTNXm0canCRzwGHBlk+WcYVSx9gj5aD91NiYzSFqjET2eSTQUZGSNKVbTVdlAw
 RqR4CqIhyQ7lwXk8jt5OSIuz9LKddn+XRM+lwZHFAJg5TgCxgMBIsOJE35/DbXOVpEXV
 pKWGFQ+D+6YReD2z09k7F6MXUe6hboxK7pQI6XHwJSWfMf2qzjyuY+DLnw6CJvxlY3NU
 zdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689677189; x=1692269189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y7oUZ4n1mUCX7pEZw4Et8W3HYEPkB8j81LvGnYRlU10=;
 b=fxr+6Ku772g8lxy1q2C0qiQFhTSnsP+x2mJgOdPaNTJEVImc0vPBoUwohFr/01xgIS
 MDHa3CND9LcE8X/17OM9Go8OUG7WxOuTF/0gEXxMuN/Q8s13HjCvpW1KS1mCOS9PtNQS
 qQmGbJtfDdZAxofCnS4gUOGX92H32AQUoCuzuwiGsUfcdmSyjAzc7aZpmpTdrOHAeiJM
 6OOeIyS9SEmj932opaa31LHqzl9bsWK0dhkAFixi89z6nsh7jMwrH/0RfZcpIP9KiqbP
 zyEcw/OfymErBSZIwldGJ/M+wHPgO46IQ1JG8KipU6+1c9nrbvdp0M7/He6aXK/VM/fu
 xhmw==
X-Gm-Message-State: ABy/qLZJEkLSRaIYUL77tEBtwTig438XYDrEUmigwQXFr2tE+MIspmPY
 5f3YO6+PvRlRGwk5Xwp8VZ12Sa3P2hczNl/ztO0=
X-Received: by 2002:a05:600c:21c2:b0:3fb:e1ed:7f83 with SMTP id
 x2-20020a05600c21c200b003fbe1ed7f83mr1541724wmj.33.1689677189495; 
 Tue, 18 Jul 2023 03:46:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a7bc39a000000b003fbb06af219sm1799123wmj.32.2023.07.18.03.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 03:46:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm/tcg: Don't build AArch64 decodetree files for
 qemu-system-arm
Date: Tue, 18 Jul 2023 11:46:28 +0100
Message-Id: <20230718104628.1137734-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sJLFJFDU7vns

Currently we list all the Arm decodetree files together and add them
unconditionally to arm_ss.  This means we build them for both
qemu-system-aarch64 and qemu-system-arm.  However, some of them are
AArch64-specific, so there is no need to build them for
qemu-system-arm.  (Meson is smart enough to notice that the generated
.c.inc file is not used by any objects that go into qemu-system-arm,
so we only unnecessarily run decodetree, not anything more
heavyweight like a recompile or relink, but it's still unnecessary
work.)

Split gen into gen_a32 and gen_a64, and only add gen_a64 for
TARGET_AARCH64 compiles.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/meson.build | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index bdcab564899..6fca38f2ccb 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -1,7 +1,11 @@
-gen = [
+gen_a64 = [
+  decodetree.process('a64.decode', extra_args: ['--static-decode=disas_a64']),
   decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
   decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
   decodetree.process('sme-fa64.decode', extra_args: '--static-decode=disas_sme_fa64'),
+]
+
+gen_a32 = [
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
@@ -13,10 +17,10 @@ gen = [
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
   decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
-  decodetree.process('a64.decode', extra_args: ['--static-decode=disas_a64']),
 ]
 
-arm_ss.add(gen)
+arm_ss.add(gen_a32)
+arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
 
 arm_ss.add(files(
   'cpu32.c',
-- 
2.34.1

