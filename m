Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2679230lfv;
        Mon, 1 Nov 2021 16:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDMNutqjuWpA2vCZZ40UQm1+sfxNrNO5XzbBeZVPo7SH60/XU07+5dB09Ak/sSB3QxE+K8
X-Received: by 2002:a9d:4a8d:: with SMTP id i13mr24275842otf.180.1635809367506;
        Mon, 01 Nov 2021 16:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635809367; cv=none;
        d=google.com; s=arc-20160816;
        b=j82jgYn+MnDR5s6ofIHD0BRlnLdg2HEbMXgzEsNEieHg3yL09MT/6Y3QRI8wjakwzl
         KqF1jgSrDC1TDIOrnv+KYLp0JVThPjZ8+gM4c+Fc9Ne+VWfuuEVjOc6HOsQYSirBSt+z
         ieUIowZywVGDX/pc3yIrYC8q7yfbDvs3Jv//4Qm5IPouNIZbkwWWxErs1yYitXIfFSSd
         eAQ4Lsm/dh2snA1fJ/aFhCOLpFY0p6UpKtxAsUVJJRVjvnzpPFWkfwGrm5kGiudUwa8j
         ZD7xqLuJNmchK888/VXhigvzNhSrRMHVpN+Cy421guuWq7D3q0xR+qBhlFSQ3Du93tBV
         897A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
        b=bKMZJr8tht7/k7Nlium7qaqTiNoCYAJzPHuh6lZcvn3cnGXp5/Gn6ITz9g4fKWx3bW
         Q117a3XaSncLUEbRP/QUGvNcksFNadWiAXHQ/FOVOvk+Cd2gg8PgPjlD0oR6lUVvN7g8
         O/I9jzZV1i24ab8uHj98yGWWTtjbuWBX2muYXo1fJmb4G5V/5Q2bxSNwndvxibsMzQJA
         8usLXSsLD2E8A8lBhG3W1gxjXAOrBE5TJvVHn5ZngFL4VKR6cq4S2pDZ5GaMwU8yqjD+
         kXcU2/MQCk4cvKbctr1YNtB100PI0WqGCWQAjHYTSk9s3kg4fiabdAeKagyCmo+RTxsH
         st0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=KjjhAw3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g98si17318901otg.29.2021.11.01.16.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 16:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=KjjhAw3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhgk2-0008KG-PK
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 19:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3N3eAYQgKCDosqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfU-0002Fw-Lc
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 19:24:44 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:45768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3N3eAYQgKCDosqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfS-00030Q-Ez
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 19:24:43 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 h185-20020a256cc2000000b005bdce4db0easo27906149ybc.12
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 16:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
 b=KjjhAw3K9MXqFjIQgMemsuTd8nJ8JJvWb1RLNXCDCdGXh9lHXJjQ5/23S3LwHNqVZs
 K2cfUHiT2U7D+3vRqky/9LSgM+jMSvEYZLTg7jmvW5eWgcM8MleEjM8LQigFsmjl9sdw
 Mf2kdmdMmCPpkr5EtleGd/WdzLQ1w6Wfjl0JHZ+f4Yhh1iVOCy+m5Wp2M1btE1epSQVG
 ql8ORQW6Fh36WoLIIMsQdLFO6HlyW4z3HPXV0jBnZwf/hHr/BdUaA+CEl3TWTiXwEMDg
 ZDeXSroO1OBXLNn+UrkkDXP35ywe6tEJqFMlXZkNMZ1HEGP1nBajMlQANDug8F4HiOjS
 K9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
 b=cjiErGsWVNkgw6Z9ntmhYwLKye16n26LhQuMjvgJgm50akfRP/sHtRs3sYUoImRaqf
 bHvDWNWmnvTHier5Hnl6NZohrg7A3xp50SvoXvIi5UBgP7C2ewyCEonwf0yyqNCVgtRd
 3sjmXzayXhUSya8B6BwxEM8Y6FlacGBhxIJekTt+ex+u9/WV9FCh2jRpDIdMXbdxRQyK
 X8nAP2WcnO+mWwy37phTG+iNar0PLwJ3X3Ve8+wa0ziH1FxHvJGstWnd6g+Qk9TfkVbP
 Q+gcYq2HiAkAe9omNMMihztZOnbB/2nauRA4NwdxstRc7dVFhuGBPiDdvlb7pYgp0crp
 Fdug==
X-Gm-Message-State: AOAM530+qURz+pkqHYQ/6Abpsj6Lwvzt/LB9LXJG1hVoLq4hmcIlfmd1
 fTJh2vDfrfH/+jD8RDyaV8jiH/ybQSYIAg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a5b:786:: with SMTP id
 b6mr35849908ybq.112.1635809079185; Mon, 01 Nov 2021 16:24:39 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:44 -0700
In-Reply-To: <20211101232346.1070813-1-wuhaotsh@google.com>
Message-Id: <20211101232346.1070813-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211101232346.1070813-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 4/6] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3N3eAYQgKCDosqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IivAR8z2tQlW

Our sensor test requires both reading and writing from a sensor's
QOM property. So we need to make the input of ADC module R/W instead
of write only for that to work.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/adc/npcm7xx_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 47fb9e5f74..bc6f3f55e6 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -242,7 +242,7 @@ static void npcm7xx_adc_init(Object *obj)
 
     for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
         object_property_add_uint32_ptr(obj, "adci[*]",
-                &s->adci[i], OBJ_PROP_FLAG_WRITE);
+                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
     }
     object_property_add_uint32_ptr(obj, "vref",
             &s->vref, OBJ_PROP_FLAG_WRITE);
-- 
2.33.1.1089.g2158813163f-goog

