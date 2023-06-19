Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2883904ejt;
        Mon, 19 Jun 2023 08:57:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+Yez/8Nu36KJk2LdozKLHMAfRAoYuLmJf2fvZKNq6YT8Qq8qgo4RiVshli+zNgJHlX8S9
X-Received: by 2002:a05:6214:2aa9:b0:625:b517:6dcb with SMTP id js9-20020a0562142aa900b00625b5176dcbmr11743303qvb.5.1687190269442;
        Mon, 19 Jun 2023 08:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190269; cv=none;
        d=google.com; s=arc-20160816;
        b=lDN1zJx9erDxsvNe8d379UEJw1hlfgTplR7ObWBHbxay5Z6WchASlLZGWp2x/3+AJE
         /nrsSD/EH5tatb+cCdc67QmMxzEIitrEMGotJGsmLzzhro+ir2oI42SlQb5skqfoVZEM
         48u3OzH2okNOqfP9WMGIVO4mAn0Up32C3Tw7sx8As7UrVsg8i1CVNX5PCMtyZnOOccdE
         LESOODGySFxHxrNtGPYmVlEuTNMGlQLbaDql02zmmwW2Q2OiwFyPbKYZTmRhGqy+aFIH
         /+jg5ALAS1vOZDpEFCBSXcCCZssSBMfQ3Umb6ZF02xg+GHr5pgiFxwiHj6J3v+EhzniY
         WeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CM6xj41eYNrEaAsuFr1fglVypk0YHAp2sQb5Kbf2Uig=;
        b=yYmVoCJRMlEMTQJ7TlNwpjdfq3uvxuzLtMgRGdBLhtRQjhCOoDj3G+t9xSnsgsJi98
         /PiPCZzS2tlpuvy/6RRMZJM2cJwaOnYvC3HrC+QNqLzGYKjUVe5/nj1vko8Ho0L7woYJ
         fOKZACvH7YJ2bl0wedkujssEcXuu+lgDc7Fw1Ao1wGgrPLolBfQfr9l/t8osf6fJrwZf
         z5hvJFlLh3nBeeG7gPu/7gSQn0WC7RqLOZ04lZjWjQc9aEqf1l93eHqGx3e70faR2nf5
         qlmFXl/mkO+i0Jw9PSN1mWoPwkxdThwo3jL/hmzGJb5XYe3UV4pbOyARTrFr+yviQL49
         Lz+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxnoS2k0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf15-20020a0562142a4f00b0061b79b36c41si85657qvb.36.2023.06.19.08.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxnoS2k0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHFI-0007oV-L0; Mon, 19 Jun 2023 11:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFF-0007ez-Kb
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:45 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFE-00057B-1l
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:45 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51878f8e541so4296310a12.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190203; x=1689782203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CM6xj41eYNrEaAsuFr1fglVypk0YHAp2sQb5Kbf2Uig=;
 b=AxnoS2k03oE3hczaGbZ/THmqMx7hPXAn4+UFWCIrrk+tonUFx31Gvayxv6UPrAdwNi
 WhDy4AG/l9uIQpaqPKNt/fiDoNcK4THBu5K9UipJHYDiP+IhnlE+qGhZoPiOMWKippfG
 CtvOgyEBic0qeX0PrjGR+eGXIl9TDfUb512bdDTodDBD7vGXOn/+xdrv/0Xg/fwFZsdO
 SDUndFseGuo0RR7vImJCE2M7PH4dAnifYI+A8OfWQAdZBui3SRpkWHmWyQGA33wXHwxM
 2lfnaH+OpuROo115Km4MCDO1MKPoCw30Liyiw1+/MKDVbnhUC2DeJ5bSnlbDlaqq6xvH
 NmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190203; x=1689782203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CM6xj41eYNrEaAsuFr1fglVypk0YHAp2sQb5Kbf2Uig=;
 b=cY+MJG+PlP+h5EeDfVnkOo9vlv+OhBOXumUbFb/DDEf/0IVkPJzRhQZIfJ1P4B0pz6
 BkMhNjYVfRGfgmxhWo1YUlbo0SmzmyM0lbFWBGlWtAz7p65XClfCjpECc9iEzSsypCKS
 Lod62sdqw+kU49zwxcZYrcoBi6DVH7D/tLp19+GzyXmgWBG89yWJY7k6ho36uROg5S00
 kEwnKkUz/i0Zrqber8MYpJI+4g2F+cxJ5KYBSGhFBPtpwxidXeJmQSws3NUnEGjZ09VL
 ik+V0Aw7HKYlj1aKw5tKpROHS/jkXuU7Fi2r+mUqxJSfoWawvFz7EdK6s/cOrJ7ruJHc
 laFw==
X-Gm-Message-State: AC+VfDwixVlvLZVPbCLcGIlW7fOIJm0vz3hznjiTusgZbJ447vPHWnzk
 1zLvx5Nmi+hrI22SQMhiDd7/QQ==
X-Received: by 2002:a05:6402:204a:b0:518:7cc1:757f with SMTP id
 bc10-20020a056402204a00b005187cc1757fmr6978108edb.5.1687190202780; 
 Mon, 19 Jun 2023 08:56:42 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 p4-20020a05640210c400b005158563be4asm13201146edu.33.2023.06.19.08.56.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:56:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 23/34] target/arm/tcg: Reduce 'helper-mve.h.inc' inclusion
Date: Mon, 19 Jun 2023 17:54:59 +0200
Message-Id: <20230619155510.80991-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /CGKQ6R1lEAR

Instead of including helper-mve.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h            | 2 --
 target/arm/tcg/mve_helper.c    | 5 ++++-
 target/arm/tcg/translate-mve.c | 6 ++++++
 target/arm/tcg/translate.c     | 4 ++++
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e132969837..6ea6384855 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -115,5 +115,3 @@ DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 #include "tcg/helper-a64.h.inc"
 #include "tcg/helper-sme.h.inc"
 #endif
-
-#include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index d8ba5a9e60..a3fca486e0 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "vec_internal.h"
-#include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
@@ -31,6 +30,10 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-mve.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 static uint16_t mve_eci_mask(CPUARMState *env)
 {
     /*
diff --git a/target/arm/tcg/translate-mve.c b/target/arm/tcg/translate-mve.c
index bbc7b3f4ce..8577dc4377 100644
--- a/target/arm/tcg/translate-mve.c
+++ b/target/arm/tcg/translate-mve.c
@@ -21,6 +21,12 @@
 #include "translate.h"
 #include "translate-a32.h"
 
+#define HELPER_H "tcg/helper-mve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 static inline int vidup_imm(DisasContext *s, int x)
 {
     return 1 << x;
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index ddc9baeafb..a71c60f4fb 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -33,6 +33,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-mve.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
-- 
2.38.1

