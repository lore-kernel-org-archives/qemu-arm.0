Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1069876njc;
        Fri, 15 Nov 2024 08:04:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWashugzjRrLsYqGMO+1VX34do2r1dDGsrcpgZeBHutp4QSu0Gb42hnzh73f4Yra38Gi1syZTqu7K+FDA==@linaro.org
X-Google-Smtp-Source: AGHT+IFAeUM62a0/kKGJ7eBx7OP4Ga/gwlV/R0jpC6BoKCl9KFZdM+Z/SYZTEeTsp04cB678Xnkf
X-Received: by 2002:a17:906:478c:b0:a99:e850:deb3 with SMTP id a640c23a62f3a-aa48341020dmr316681966b.18.1731686636443;
        Fri, 15 Nov 2024 08:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731686636; cv=none;
        d=google.com; s=arc-20240605;
        b=Nv+kUGg26CL63zcNOO+d4RN9aHjU/79AIophUECP1RgGhWrPA2G5jqRk36H/tQJJuw
         oZUt/5M5ujQ/+ssDi6cKtIpREsD0t7luYeqWYWfyJ5iG7AV/87DVDiM12rnh1QJsRqit
         cVUwVpFPBKJcbM1Q+FNF5/nC/mF/fRb82op2ZLFrNi0W6wbm/Or3OSda+WEc21eM53Ll
         3I3cHrv7mbv919uxZdsXLm0RH2CPGU+E+h5MJYZqbzwB7fkyMkvBnZA8d4oc8BNXusLs
         DIWWwZ9lxyJwJ+L+EzEeujq6g3jMzit0VS1HFTT1iu0JxmKaqKiQ6aqiWd/yxoj7CJzE
         qiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=CaMy4sZhLruE2/rOqIYreQpf3lX4IZAEpEV0rXHSsk0=;
        fh=HMovQkLS6umLohQB1Vt2EYFaZL1ic2NNjUU/o6eD1i0=;
        b=ICNs+mdI/6B7D2jmwHrmYmF55wqlbD3JqHfWMNz6tnNC1OJGxKAPs8qURmIDswUWmg
         VH2824WNWeXkttrTaJ6JeZVwjn5o0MVMkwKhG7L/wQdhooY33oisYG7rvXsBgAqZ1rZb
         8PGU4IzjNR3zN4ju2pK2LBo/ToZLT6WssSo78vgbDFA8GqSxQ6Vi1Uaot1206FmmyWf1
         CI8pP4DP+4aLoiMsrCZhBd7gai0C3aQXJNojSeprJddH8WeCipoOQOfNoMj8x4AspvB8
         +aRtBeIqViJfwGY9dPoZ3N/wzxkfX8EYq1O9XHQsZtavrfPNnF3dBrrnnL+LZM7HqrJT
         /ljA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MpcRTnCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a640c23a62f3a-aa20e103892si221822566b.862.2024.11.15.08.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 08:03:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MpcRTnCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBynR-00049W-Md; Fri, 15 Nov 2024 11:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32nA3ZwYKCNkMJLP9CBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--roqueh.bounces.google.com>)
 id 1tBynO-000497-QL
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:03:42 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32nA3ZwYKCNkMJLP9CBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--roqueh.bounces.google.com>)
 id 1tBynM-0003ub-V2
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:03:42 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e2b9f2c6559so1172167276.2
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731686619; x=1732291419; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CaMy4sZhLruE2/rOqIYreQpf3lX4IZAEpEV0rXHSsk0=;
 b=MpcRTnCe9iD4bRLSAgtIRtwoJAJJVxyfUkvfTYUOwrTUM0Kz9IwJZKQ8AR98Ui9doD
 hCc6XbFI7hMQnVPzkaKPNAyBwwuU1MqxBu2jLNd8ko0RA55T+E6J2lcnBkR2gM8gJ4bf
 YYAIWxfGVWUAKQAG/QoWpx7iWY8uWvRrkuTEBvfgfrzIavNkuQ1w9ZpkHQcMjy2+UBYy
 y+iTKJUhyW1d85aEPaVWza+aUJpTamrTDhId4PK4SVsFrPNeAHNK+zIHeelqnx0PhiNq
 ZnkxBatE5idJtbsO5XgXDWPO+22PwU7317gDbSY/hVx4dJGMCtP+woIf14XOLuOfAGLP
 nqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686619; x=1732291419;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CaMy4sZhLruE2/rOqIYreQpf3lX4IZAEpEV0rXHSsk0=;
 b=G2tkQkO8su8ASa3zQDdVckeO7rgPL2KeT8BU3zmHTVvAXxsVzn1f916P4U8b1RDJTH
 yfXli4nBuwbsG4l/iv6zZlKT2TYFfX1x693AK8yAbBvI8uc+a/gNMPzjUk6RhO6jG0qe
 ZYEv1NrEFQkNkOfFeiieluCQ5z6cNRC+4ZZG5xLJne5rd0DuwfyOt0371Y1rRlBq481L
 ET1+fFYuVu/pW8y7V/wWW2qbYzIeMFM673sLHns0v/mDYEtiSinVRMaEnJNZwJQhV38A
 QEBLQDIzYfXPLxiSKJ2IGESmsdAXDEx1BG1RYh6Ho/q/bCxmxYy5bz8t6U76hBjo8DAJ
 89tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWszWijv86HOFDkd6wwA3qVxzu83xi8cQ8Tynrm8+ZLnT7Or3LP0h9VSup1SWqPx5UAsOrzdcb3Ag==@nongnu.org
X-Gm-Message-State: AOJu0YxUbJCJuVG+hF7AOknMlJjnkV6QmODWU9kBuuZHP/BVmDvuQ/vl
 K7Amr3mO2L6f7NlX0aCFHUEHycrHvWO95+859ISV7u0L3o9YuYLlmJgoEFfIONz0mM/aLV+mogP
 KZQ==
X-Received: from roqueh.c.googlers.com ([fda3:e722:ac3:cc00:4e:3bc9:ac1c:1ab])
 (user=roqueh job=sendgmr) by 2002:a05:6902:72f:b0:e2b:da82:f695
 with SMTP id
 3f1490d57ef6-e3826394879mr3594276.6.1731686618635; Fri, 15 Nov 2024 08:03:38
 -0800 (PST)
Date: Fri, 15 Nov 2024 16:03:24 +0000
In-Reply-To: <20241115160328.1650269-1-roqueh@google.com>
Mime-Version: 1.0
References: <20241115160328.1650269-1-roqueh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115160328.1650269-2-roqueh@google.com>
Subject: [PATCH 1/5] hw/watchdog/cmsdk_apb_watchdog: Fix broken link
From: Roque Arcudia Hernandez <roqueh@google.com>
To: peter.maydell@linaro.org, farosas@suse.de, lvivier@redhat.com, 
 slongfield@google.com, komlodi@google.com, pbonzini@redhat.com, 
 venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Roque Arcudia Hernandez <roqueh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=32nA3ZwYKCNkMJLP9CBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--roqueh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: l/vIB1RVRjxX

The patch changes the comments to point to the latest Design Kit
Technical Reference Manual.

Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
---
 hw/watchdog/cmsdk-apb-watchdog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 7ad46f9410..e4d25a25f7 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -12,8 +12,8 @@
 /*
  * This is a model of the "APB watchdog" which is part of the Cortex-M
  * System Design Kit (CMSDK) and documented in the Cortex-M System
- * Design Kit Technical Reference Manual (ARM DDI0479C):
- * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
+ * Design Kit Technical Reference Manual (ARM DDI0479):
+ * https://developer.arm.com/documentation/ddi0479/
  *
  * We also support the variant of this device found in the TI
  * Stellaris/Luminary boards and documented in:
-- 
2.47.0.338.g60cca15819-goog

