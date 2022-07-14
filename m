Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp791687lfp;
        Thu, 14 Jul 2022 11:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uRtjuEVVrejsDhvnYkWjj1SZc67Q/vs2PaHRrg4MFMEYoXbUwfil5oGxAq7cWIf1tqMzKf
X-Received: by 2002:ac8:5892:0:b0:31e:bc96:b262 with SMTP id t18-20020ac85892000000b0031ebc96b262mr9020975qta.285.1657823351355;
        Thu, 14 Jul 2022 11:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823351; cv=none;
        d=google.com; s=arc-20160816;
        b=oculDIdXYSgQ4iG/QnTAcOtgGcpLf1LQLH58urv1TNdIPAbhW/G4OCQphyl4lNtrnQ
         ATrXLEv1QWfwgHPEote3f68K0T4XIAw/56C3GRynYnLFlXDtoIAbEwZqIH3pDetv80Sc
         CfFj+rMjfu9zYgoQs/xPErFxirQC/xEa/y9wTyJ5nXhIljgIljIs95GX/db9nrXuSPRe
         FdjRQa/YjYqYg2ACt4yfloOtOy0l1JmSzpkPdeTVlrjNIXyGgoFaHIkfyivCShAmSaPG
         e5S2Z66T3MUit9T1C1pbQn8Kig88CyCFcccN3ceBvsk4J7rzdzYScYS13DoAjRzZByqA
         50mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
        b=rP/ScdEV++mQvW4aofExm+TqSwt3cOtVDv4A+kpeI04Dea10Fw8MnXXK/LFWqqa/w2
         g7NTSxhI8s7vFEQXOhBhlcW7Ih9ewykdFg8d4OIS0pScfM6/B3rk2VBgv7gO/nItjvwn
         yuPxHWpLtNu8dsLC7rE4QmPLkBRGwYHMqorNidPcBgIc60pytrxUCUBWMhjnSU+xl6E0
         7vI/ExwHeWc4sWLjCuqyawalsKvzD5a5OdwbXkOAujLC8XKwGUplZ+PZEIVG4mwcKrJE
         UBNTKnTZm74K6RZJyV1l8lu0L7VZU+TIgnyJumwLzaZKj9LAvoIk0tdVr3eeNoVwA3qm
         JDoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=XcGRWi+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11-20020a05620a258b00b006b46a78bc1csi1541998qko.614.2022.07.14.11.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=XcGRWi+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3aI-0005PY-PR
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3NWDQYggKCFQIG3wAFE32AA270.yA8C08G-wD89A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZI-0004Pd-Li
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:08 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:54260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3NWDQYggKCFQIG3wAFE32AA270.yA8C08G-wD89A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZH-0007cx-82
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:08 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 f13-20020a056a001acd00b0052ab9ae76fbso1518249pfv.20
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=XcGRWi+Uq3bUGrRo38ZAwYEz0iHOnCK64maUEl9ROXqzjgKpP48sWNnZyOooRbl0dJ
 9neIX9YJNRFq+0paZCzCQi0dl2zrVZlFbgtRU4j24Q26wqSHxRr3FJ8XI6RD0o8e8VPx
 /WOCBfHL2kxq7r7pXGCExeFXSQaxQoYbT7HBa6l5VxVO9ZGODKkNpNgd9ZDtu7kFBxeu
 wrWOTMQ2tLXrZwQhimiAeNREQ0u7HhY3wQPh2j7toNqoDXJHYmLzwALcyr7IpgKmUfWu
 0xtKENKVAHx60e8cSbeSd1WTX+90jvQt/yWYLdawU0rVZM9PfFDItjae5UWTXFRtIXqS
 7eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=b4ukvKX/6XNHYkovyeYb6tVXiGwbmEC6i2xlXwQCvRrurDoWhxBifrQ8uZhEeB4rTk
 9bD9ipl5k0OKcYqSWoRGIZ+2coK2Qz/JV73p89pPD91Z8dr71SiOzIAyFFaQoMfbxmk5
 R9I/u3v2lXnFvHJBQH+5Xee2IU+RfPpOBVPqbOZY7QoWCfqxur0imGPegAbdK/O/j2aU
 VOUDZ2bw2GBYOTR/aAwNYI9fRIQscq8SxIDGO2EN5GcwzrWhyvGRM1cHnJL6VKbSUp6h
 yC5/FSwz5iu2n2zrXRA3g3dGc98peGbOSIQp5YWXGSPv2XYYh0hJTxUE1JhrcEx8TWOv
 yStA==
X-Gm-Message-State: AJIora/TNnw+8TN5Sh212u6EUs4S2YNNUifJnhT9QafqzRfF6pQnOzdl
 2V+2enJxojJKLyj+2FvzjUmmvsPy4Gt0gQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:e5d1:b0:16b:ece4:79e6 with SMTP
 id u17-20020a170902e5d100b0016bece479e6mr9673854plf.83.1657823285678; Thu, 14
 Jul 2022 11:28:05 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:43 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 4/8] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3NWDQYggKCFQIG3wAFE32AA270.yA8C08G-wD89A929G.AD2@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: LfJwslYqs8kC

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
2.37.0.170.g444d1eabd0-goog

