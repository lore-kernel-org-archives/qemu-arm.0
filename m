Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp866263ejc;
        Thu, 11 Apr 2024 03:46:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtngQf1cDwcywXmHdwdO60C8giYjxUD7oK4imO8/IL+PzNE3O9nVRnVdOfh4WfrtyaeozlhKnOLU2Mu6RQScvuY8z3KGC6
X-Google-Smtp-Source: AGHT+IHgPAjMkraxqhQGm/uDZEb16qXmcTVQME431uwoIXTGTmHoJxnBTpiif9x9t4aHwK1Qx9lp
X-Received: by 2002:ac8:5fcb:0:b0:435:163c:911d with SMTP id k11-20020ac85fcb000000b00435163c911dmr5003543qta.59.1712832417861;
        Thu, 11 Apr 2024 03:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712832417; cv=none;
        d=google.com; s=arc-20160816;
        b=rrMeLLrgXhAdPliZGpRjiXn1MFudTuKb8jdN8l3/1gZKGnIl9ERHcSBolFepkjLFjQ
         9QscFgPvDYxA23mBme4C9DI4fy5U9h75RvT+g+I+FHDUViCdEhg2S5RmEnIjEZbyMKFf
         kBd7I9wwbdkXBne2WBJNGDxvlPNnaM5B7Y6K94vkiuYIu8J05kXOlBNefU1k3SmaNC1V
         4/MWYR3kxRhp9z/81ND19+MVadoWB+80BPVz4mCvlP2yPrW5zyWzlsvb9ZoHuFSyLtc5
         2KIcR79TXcziD715NzO6Pm4hbHajcpKWDbuRne1IBsG5+c5lPwUjpMfXPQ1xX8Lb7dts
         KO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ru9saU1iDfz4qwFM9pZtgFWpVV+tgMJTqfv3heZtoxI=;
        fh=XVmi9qnYc/zT9sxd29EdwC2SdEYras7UoPBhSlgJiOY=;
        b=iRJ37bJpykeiM5O1Y72OAcQXZPNoTE4AH+CqSXh1nl9cf6l6SSYjScCxB6HAbfsF9A
         o+VkeAjCy/6FM63T1KO4mJRONzL+tzfz8peO+0LfOnTqJnJalaBcI9R+4cEPOc/HnKV3
         g9/kFsK/veb5fFTeKGgQFYLEyhDS6P67pxY7reIz7YJOjf9V/K2rpdDdMuE7pfW4kMBW
         V+Gtw8r68VKqXmVBw35jyTTQ8CRvDP7KeXWujQ5ahINyLzdpv1W5M4wnvEROpIStFlP0
         AmQO+NPQFrktKqf3YGeG/Dq6FdK/Xh7UCLW319NBpYZ8Bhvniu1nHoNeFs8QezXun4yF
         /XDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITHW2fuz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020ac85d89000000b00434610ed8e8si1200054qtx.803.2024.04.11.03.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITHW2fuz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rurwl-0005JF-Pk; Thu, 11 Apr 2024 06:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rurwD-0004oX-VS
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 06:46:06 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rurw0-0004sp-QC
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 06:45:49 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516dbc36918so6494985e87.0
 for <qemu-devel@nongnu.org>; Thu, 11 Apr 2024 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832334; x=1713437134; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ru9saU1iDfz4qwFM9pZtgFWpVV+tgMJTqfv3heZtoxI=;
 b=ITHW2fuzf4CcSbcYP/dbh0c72SqhGrEXaZJtY9Z6lxDxC8EnTMbFNt7vWzv8a1YO8J
 HbhlOtUegkG4V/QJbbo/jmHnRdz5Wj47fCPo8Di8kXZ8jac/ql7qPP+RNzMkILYYwLjS
 VWOIQsy7aIPYkZfu2VZat/+HQXh82i/GHzdfUG11x1a1ZLlXZVdQtFFXYRUeu2a/j3/i
 RjIQJv6uaNFHZNBMKI4JSJrCi9G/K/BZPGaEUXroKqBZRCueqEL+rpZ39V0lwTUP/agO
 LPM4tuhZpAQIJWqp5fYGXkJ6ItMnimLToT6tYBKyIKYEGBfvRPGQuRhKfLnXwBOzhUoJ
 XHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832334; x=1713437134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ru9saU1iDfz4qwFM9pZtgFWpVV+tgMJTqfv3heZtoxI=;
 b=Rs1vH4ZKzzbnvShdygqoQq6Wx8nyXjeVcsAakjV+nnnY/SGMOxRb7rbE8Jdnpu+sLR
 N7d868DGfLu8E7WMJ+Xjf5fr9MqBMoT/KsC9o+4QqJukf/2zzsJBZOpqiZof+CW/DpTA
 azl0vmmxdxkE/Xfr0fKUBeE1PgmbKYtnasavrusuRvYds9x22ieYO4VxWMQYxF5w5je2
 dewyxpGtmuV1LOpXAbEWiixt9g5IeXy+drdKVKnpwR235nET3EesH6l2HuaUQ855PBG7
 fsnMY4i/M+XVhXubzHY1ZIEdClb2Nmbtq7h9Ww/1I9d+y8Bbrp69yoE1nV89Zgqnpdx5
 6REA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcFgLMW+MFHfH6dnBYgMugOh42RSD/IQB5KdITBWcxZGRP3Cco28HixQVbtSSWJorjPW1SadnT8MF+r5wfBNFfVVHN58c=
X-Gm-Message-State: AOJu0YxiYo2yEgiLSbhWfcjIfoOddy/n2h5dvQYMU9MZ0acmsbJgsAYy
 P1jGCUy7x4Q5txLkZWELgjm/7cEh87vDrf2gmDAS3DBxmd3UB3J/yJg9blxU9J8=
X-Received: by 2002:a19:ac07:0:b0:516:d482:d720 with SMTP id
 g7-20020a19ac07000000b00516d482d720mr3334647lfc.30.1712832334366; 
 Thu, 11 Apr 2024 03:45:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a05600c0a1100b00416b8da335esm1924848wmp.48.2024.04.11.03.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 03:45:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH] hw/misc: Avoid sprintf() in the imx devices
Date: Thu, 11 Apr 2024 11:45:32 +0100
Message-Id: <20240411104532.588170-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qKidRitAsI1V

Various imx devices in hw/misc have a pattern in the
debug logging where a function which prints register names
has a fallback case for an unknown offset that uses sprintf().
Use snprintf() instead to avoid warnings on macos. (The
buffer could never overflow because it is 20 bytes and we
will write at most 10 digits plus 4 nondigits plus NUL.)

Commit created with:

sed -i -e 's/sprintf(unknown/snprintf(unknown, sizeof(unknown)/' hw/misc/imx*

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Philippe: here's an easy sprintf->snprintf conversion for your pile :-)

 hw/misc/imx25_ccm.c  | 2 +-
 hw/misc/imx31_ccm.c  | 2 +-
 hw/misc/imx6_ccm.c   | 4 ++--
 hw/misc/imx6_src.c   | 2 +-
 hw/misc/imx6ul_ccm.c | 4 ++--
 hw/misc/imx7_src.c   | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
index d888966014d..faa726a86ac 100644
--- a/hw/misc/imx25_ccm.c
+++ b/hw/misc/imx25_ccm.c
@@ -91,7 +91,7 @@ static const char *imx25_ccm_reg_name(uint32_t reg)
     case IMX25_CCM_LPIMR1_REG:
         return "lpimr1";
     default:
-        sprintf(unknown, "[%u ?]", reg);
+        snprintf(unknown, sizeof(unknown), "[%u ?]", reg);
         return unknown;
     }
 }
diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
index a9059bb1f72..125d4fceebb 100644
--- a/hw/misc/imx31_ccm.c
+++ b/hw/misc/imx31_ccm.c
@@ -89,7 +89,7 @@ static const char *imx31_ccm_reg_name(uint32_t reg)
     case IMX31_CCM_PDR2_REG:
         return "PDR2";
     default:
-        sprintf(unknown, "[%u ?]", reg);
+        snprintf(unknown, sizeof(unknown), "[%u ?]", reg);
         return unknown;
     }
 }
diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 56489d8b57b..b1def7f05b9 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -85,7 +85,7 @@ static const char *imx6_ccm_reg_name(uint32_t reg)
     case CCM_CMEOR:
         return "CMEOR";
     default:
-        sprintf(unknown, "%u ?", reg);
+        snprintf(unknown, sizeof(unknown), "%u ?", reg);
         return unknown;
     }
 }
@@ -224,7 +224,7 @@ static const char *imx6_analog_reg_name(uint32_t reg)
     case USB_ANALOG_DIGPROG:
         return "USB_ANALOG_DIGPROG";
     default:
-        sprintf(unknown, "%u ?", reg);
+        snprintf(unknown, sizeof(unknown), "%u ?", reg);
         return unknown;
     }
 }
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index 0c6003559f5..3766bdf5619 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -68,7 +68,7 @@ static const char *imx6_src_reg_name(uint32_t reg)
     case SRC_GPR10:
         return "SRC_GPR10";
     default:
-        sprintf(unknown, "%u ?", reg);
+        snprintf(unknown, sizeof(unknown), "%u ?", reg);
         return unknown;
     }
 }
diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index bbc0be99211..0ac49ea34b3 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -143,7 +143,7 @@ static const char *imx6ul_ccm_reg_name(uint32_t reg)
     case CCM_CMEOR:
         return "CMEOR";
     default:
-        sprintf(unknown, "%u ?", reg);
+        snprintf(unknown, sizeof(unknown), "%u ?", reg);
         return unknown;
     }
 }
@@ -274,7 +274,7 @@ static const char *imx6ul_analog_reg_name(uint32_t reg)
     case USB_ANALOG_DIGPROG:
         return "USB_ANALOG_DIGPROG";
     default:
-        sprintf(unknown, "%u ?", reg);
+        snprintf(unknown, sizeof(unknown), "%u ?", reg);
         return unknown;
     }
 }
diff --git a/hw/misc/imx7_src.c b/hw/misc/imx7_src.c
index b3725ff6e72..d19f0450d4a 100644
--- a/hw/misc/imx7_src.c
+++ b/hw/misc/imx7_src.c
@@ -75,7 +75,7 @@ static const char *imx7_src_reg_name(uint32_t reg)
     case SRC_GPR10:
         return "SRC_GPR10";
     default:
-        sprintf(unknown, "%u ?", reg);
+        snprintf(unknown, sizeof(unknown), "%u ?", reg);
         return unknown;
     }
 }
-- 
2.34.1

