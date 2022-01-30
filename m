Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1873146lfk;
        Sun, 30 Jan 2022 15:17:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbpKRCz8hpBIaLASxK18h/irkNw06AS3KOrt3aingcvSpaTAYtkZewe43NFnsUiOlHbPA8
X-Received: by 2002:a25:ab24:: with SMTP id u33mr16347731ybi.59.1643584626309;
        Sun, 30 Jan 2022 15:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643584626; cv=none;
        d=google.com; s=arc-20160816;
        b=Jp41/UnlS/HqEq8sAOsClXyQ3e9a05MEJyRnR6SrpAsK5G2f5TH+WgbN82uCCSsQDb
         YzBkT5XYJhPBvUgy5DUAE3UvejrU0WaQPxiK+KSxmfXncZ69ztLUkGS4U2dI6MtghWK2
         UH0J0HYF0PSimyroELaxafekZ6qtmUfwxrdSObPeomn7SXIvjhR/hnsZBq3kJ/dgha3G
         w+lbFcTP6I79p0JabMrPYtzWOV64oVeHFJkQxalxtPcOXWOhJWnInZt8rLX7Fw4gYfaH
         fwxf0YqG625qtoFXe+p8O8P4yBhrrZbn86pU7G/KkJKXmzOQa60zEGo3QqK+F74+QLOV
         2lnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5cC47Sv0aLp7tnKjjmWCbq8mH4nDRh0G2Q/XihE2vyw=;
        b=zKLabm9rf+Y8xjMhppAZulV9uUFrUUHsdHy9R0ZHq1mUUymf1mmPGd8hitA+Uhth2n
         qlbIrLO+ZweGuTc18Oo3r39NBu9h25hm0wHEAMbEVQ62a7uafov5BgXkSASybol3eCC6
         vSD7YSN0t89yGDT/CIRRxqx5HPzI+dqR6hr/ptaTNvpeYNcu0fpME17Pop5Na3nr8T9A
         dtUWmmb5U8YembvnbecASw5x6MGwjn+4pC5ANKnayoDBB5+n/+FiIZdqK681LN7UMy+H
         ck0c1p1S6d553GeISPJArsgy/qRGgAUAFb4qBEh0E8OXCzI5KV1Ca9OxNBrJEr7+jgll
         1mCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MWVBC2o6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si18022801ybn.472.2022.01.30.15.17.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 15:17:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MWVBC2o6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEJRR-0000lo-66
	for alex.bennee@linaro.org; Sun, 30 Jan 2022 18:17:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMq-00038e-Nl; Sun, 30 Jan 2022 18:12:20 -0500
Received: from [2a00:1450:4864:20::132] (port=42891
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMn-0000vw-B0; Sun, 30 Jan 2022 18:12:20 -0500
Received: by mail-lf1-x132.google.com with SMTP id y15so23156494lfa.9;
 Sun, 30 Jan 2022 15:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cC47Sv0aLp7tnKjjmWCbq8mH4nDRh0G2Q/XihE2vyw=;
 b=MWVBC2o6Yv9eE+WjO14Gt9B3HpF4b0rBCQhjjdRWwFgoNgVucshfre5RGFNKEgHosn
 reN6UH1l+WPBvlyJbdpEWPS02u7d4kugvCQ0Yi7YYjhOL4ae+Ym7csbJptfzpLX1OMou
 UsC7r5dRRPeFcr8dl/OLVC3V+euSjGprBXGMi2bR0GscwwmK3/MVNCH11cEnxutmSabz
 9G7JGhGHmjkkftPBsNG6dBksSb0Oc4dcP3o4JEVsks5ilyMjt5Js7iC30s7VoWFLoY83
 EkxaPQ7G4uimbuEYh/xyefQkwUUU1OPk1jYGbueMoIF5BnCgtZU+3b6SZ5PsHZL2tOdl
 +URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5cC47Sv0aLp7tnKjjmWCbq8mH4nDRh0G2Q/XihE2vyw=;
 b=i8KJRxOF5F6VG0UNZIbtKTPBwlZPf7AnZEviAO4wvpP3cowdXQmhl3lTo/wpPWW7jE
 MCLj8G7yuLD1+HlzHkYKXksN0rXDPtwxm0l9HQVmtxC9EgqA9WalvbHFLZSo6LKzD14G
 Otob43i7csZLLdHQaqKxRnv8SYo5gnEU9lDkpdWn3ZkUp5pmYGEPogQo4+tLS5PEb0n0
 y1xAKp+tVxpEo8lLXsk0PUD0qJheGR71SQP1ra6oUjtQBwWAPJM2sCSQaOI1gF134Xl9
 ZK8itY8eP4c/BEUnLDHUiw8Fety+v5CK0k8kDPvUOvd5WdaBcxxc/xmTD6OCNk9rzibI
 ojXg==
X-Gm-Message-State: AOAM531t5AEOOdsknowS9FGyIqqi25LxjbUDvMCKnyFy8AT/++iJkgdE
 93rHBYSurxtfyDKZjYaK67eWkQ7OdqKk8Q==
X-Received: by 2002:ac2:4d4b:: with SMTP id 11mr13113193lfp.422.1643584329580; 
 Sun, 30 Jan 2022 15:12:09 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v6sm1247091lfq.181.2022.01.30.15.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:12:09 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/6] target/arm: Make rvbar settable after realize
Date: Mon, 31 Jan 2022 00:12:02 +0100
Message-Id: <20220130231206.34035-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130231206.34035-1-edgar.iglesias@gmail.com>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cPTvL+1hSucp

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make the rvbar property settable after realize. This is done
in preparation to model the ZynqMP's runtime configurable rvbar.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5a9c02a256..e30ae088fe 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1128,9 +1128,6 @@ static Property arm_cpu_reset_cbar_property =
 static Property arm_cpu_reset_hivecs_property =
             DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
 
-static Property arm_cpu_rvbar_property =
-            DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
-
 #ifndef CONFIG_USER_ONLY
 static Property arm_cpu_has_el2_property =
             DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
@@ -1233,7 +1230,9 @@ void arm_cpu_post_init(Object *obj)
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property);
+        object_property_add_uint64_ptr(obj, "rvbar",
+                                       &cpu->rvbar,
+                                       OBJ_PROP_FLAG_READWRITE);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1

