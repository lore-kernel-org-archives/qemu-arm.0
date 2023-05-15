Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6557903ejq;
        Mon, 15 May 2023 07:35:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4uf72/4ooo4ybmeshiM7EXO3tgU4NWzDmlV3T+Ahd3GPTRZ+NNNzgjI/Iobkhb+S+Wrxl1
X-Received: by 2002:a05:622a:1482:b0:3f1:fd6b:2a01 with SMTP id t2-20020a05622a148200b003f1fd6b2a01mr56132411qtx.55.1684161352472;
        Mon, 15 May 2023 07:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684161352; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0H1rJ1U79xfT6hDtslLRCLFvb505E51KIFINtv7InA2ZeqwZfQGR3hwgGxyKHP+XX
         O8n/hRDLtsNWXVfqYAo2iXjl7RxKM3Mg1ygj/R8TMQ0VvmCMJztm7o3auo9Ubzf82Set
         taojUs1kuYWZZbN/rErP200SPVZz34pGgKqouzdKH+nDU2QiP4IsgJy9EvvN93qTUzfR
         63RU79FJ8kxgRp3wRgix9WJ/1QjbejdZ9AXDoCN7ettgFFkh3DBdfkO1d5y8VU0IgyNE
         LsOz9yfuDdYbnIiD80SMtXGMKgLG5q6QPKINTXvN91cDNUxKG9/6ImHVzuwXxFl95+NX
         VTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nP6uwN475NI4kEPgZuacjyw/HnU7r6xvn2JKlD8Wx/Y=;
        b=r1laaDDEzlTpUWtR2SUvo+nKzFYwZC4/1mFWmSYb+K2jHOh3TBc/blxI/jR3WY/7a6
         ulkhI3DQ7parYiVOQ90Nf+FwFSDLl+tMbD+XXKTTIdX8WV+9d7bHBFJuHge8IHSdIklu
         Y1/lYFLyMqf6IzkCczcIHFd4bxtCDrH1Y4dmBco95Td4UdF/ms1NJUT5th1T3ciUwr3E
         m95G/xHyGCVVrhgxuK/AAff0vBJQ4QrcDQPVoQnwkyAQEm/RrdCPdlSsDhnKwwnwQX+Y
         Jpq0tfU4l4v/6ys/ayxVX4X+7ar/l+YPTToBaId90Xck1H5j/qjEPYrf+aGNMdW8FQnJ
         vweQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eR6hW5d2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020a05620a119400b0075913904050si6678902qkk.88.2023.05.15.07.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eR6hW5d2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIC-0007mO-Rj; Mon, 15 May 2023 10:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xd-Gu
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGT-0004uQ-1I
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:39 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a516fb6523so120131175ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161206; x=1686753206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nP6uwN475NI4kEPgZuacjyw/HnU7r6xvn2JKlD8Wx/Y=;
 b=eR6hW5d2c5jgJx0SalWGMezSFCdPzutuO6EzIUQlbOJLobzQ5YkxfmoobEaOXTXtci
 i36RiMD8PMHD4eqBDK0KTi/3nMGCJOXxsmoLVNnL759l2WY/jFLPbWzXojJa8S0otzWR
 tnU2B3jv1kmA+yrbbBWOi9ngiY+P4z0E/H6Cmz6Serl4LYjBZNeyOw0QIyf9jS+bUKM5
 y7juefpleZmc/K3ruLul8K49999Rwfbz8bBm+8GCfQtEsiDMjhINNvnQBA0zn1XIlSbA
 K/lk91bXgYvv2SSX9Np+v5kr/bt2/Vzox5wO4nUZVCeR6jf9cpcoAjin2UeAnLSafcIB
 WiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161206; x=1686753206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nP6uwN475NI4kEPgZuacjyw/HnU7r6xvn2JKlD8Wx/Y=;
 b=fb7EHJEcAUPVCw8Psk3xLJkEohEm/VLRUR8NUOZeeUVy9ZM3QmGZEF0XNrF014mh0c
 6xfgpKRVzzAuVyJ72movWERAOXySjvk0+nx/XRcgBItMI2ulTWPYiT/1Bti6QQFyll/c
 ZpxIPsaWMezCxPajPQE8nWet0zUlOeaxKnSXQCKw76udpPOZKCMguj5UUS/gXEMFzusU
 ud4Pg5i92ZwMKB6GOuWDrQasQbICilBusvPTwviklRzjuBt6WhKRXFLszktGeOQ6fgw0
 Ee6h8XJpMpyDQJN6JDpbjCeZlzmhPVwDyt2fNbUTBfAnr6HW8pHgPyceZlSumN9ya56g
 sxVg==
X-Gm-Message-State: AC+VfDxrU3piwlwObHIZlN2m+eR15Eq76+ZoGjS5H2DJaRKNI533OeDr
 eKc5zR70NNxiI2b1oE0LyurmIg==
X-Received: by 2002:a17:902:db10:b0:1ac:5c90:23e with SMTP id
 m16-20020a170902db1000b001ac5c90023emr40924197plx.7.1684161206122; 
 Mon, 15 May 2023 07:33:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 13/54] tcg/aarch64: Detect have_lse, have_lse2 for darwin
Date: Mon, 15 May 2023 07:32:32 -0700
Message-Id: <20230515143313.734053-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: JmyB0OmLyehH

These features are present for Apple M1.

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fc551a3d10..c64606af5b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -16,6 +16,9 @@
 #ifdef __linux__
 #include <asm/hwcap.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <sys/sysctl.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -2903,6 +2906,27 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     }
 }
 
+#ifdef CONFIG_DARWIN
+static bool sysctl_for_bool(const char *name)
+{
+    int val = 0;
+    size_t len = sizeof(val);
+
+    if (sysctlbyname(name, &val, &len, NULL, 0) == 0) {
+        return val != 0;
+    }
+
+    /*
+     * We might in the future ask for properties not present in older kernels,
+     * but we're only asking about static properties, all of which should be
+     * 'int'.  So we shouln't see ENOMEM (val too small), or any of the other
+     * more exotic errors.
+     */
+    assert(errno == ENOENT);
+    return false;
+}
+#endif
+
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef __linux__
@@ -2910,6 +2934,10 @@ static void tcg_target_init(TCGContext *s)
     have_lse = hwcap & HWCAP_ATOMICS;
     have_lse2 = hwcap & HWCAP_USCAT;
 #endif
+#ifdef CONFIG_DARWIN
+    have_lse = sysctl_for_bool("hw.optional.arm.FEAT_LSE");
+    have_lse2 = sysctl_for_bool("hw.optional.arm.FEAT_LSE2");
+#endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
-- 
2.34.1

