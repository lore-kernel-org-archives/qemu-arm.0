Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3327137lfa;
        Sun, 18 Oct 2020 13:36:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZTg699i93WYWM0bOOB6GZyvY9WfmrFAPds2QbU30cnsrxxmO+1NDdDa/rSNoxlgETN/Vi
X-Received: by 2002:a25:49c5:: with SMTP id w188mr3781467yba.399.1603053411647;
        Sun, 18 Oct 2020 13:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603053411; cv=none;
        d=google.com; s=arc-20160816;
        b=WaYS1IQ2kZbQh3v/zKAVdDtlGjVt9jFLmZyzltbol1wtpiMfOHA7uMgdnDy+II+gfL
         fQBA4fXP/yz7/LVRjM/ekSYXme9pNKWV5OIZwv19KXjAhcD7l5uN3rvfp1p2+HKRPR9U
         gShNTFsT6799nhLvMD+mTmM2mopelWDCPSEWuorcopItGZMkp5vpOTtBhGCmb5HEwlC/
         VuoPGWJGwAciiuuURAP2yqh4sw5shYewFGP5QRRumiyz8E1m2Qq5XFkEmajfaZPddOxk
         XmxeV9+/hn7XWklVz/LgaPkecl+EEYoP3q5hhw8nGTolP/X3Gkqwc8Hozs8t5TfRhbQV
         r9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HrxoAnGYxfMe8eF6utEpYOM4v9LoQV8M0tbNnH02kgc=;
        b=QKb0W4nKXqdfgvG/oKOxuDqTGKc9TeBvABTB2TXUI0xv8pAMboPYl5iiY/ADtzSLYA
         FKOsu8ropqH7SwkJpN8FTm4WgcW8i7S2QA+3WnMLhGaDPRu0wqUZEq59Uqtf8JpaLo/U
         BWZNOkUrqEvwTcDh5fZr7eSUF9T+Df7BtyRF+bhS0eEUkDiocTb/fr9nayd/FnjA5sHE
         YUbwZAKsn54x4Cn9HMPfmw6RIj8jzwdgkAcxEc+23gO9QRLZA72MDUvJQtvw2RekVBbH
         MT0UyeOyp2ukHEBHzjkRfKEvSiGBtZdREFQNyP0e81C2bq9Nj7oc+93Y9VTi2Z4Hn5OG
         83kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UYP46wZd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si8337132ybn.259.2020.10.18.13.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Oct 2020 13:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UYP46wZd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUFQB-000554-3R
	for alex.bennee@linaro.org; Sun, 18 Oct 2020 16:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUFNy-0001yg-Ti; Sun, 18 Oct 2020 16:34:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUFNv-0000zX-V8; Sun, 18 Oct 2020 16:34:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i1so9155510wro.1;
 Sun, 18 Oct 2020 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrxoAnGYxfMe8eF6utEpYOM4v9LoQV8M0tbNnH02kgc=;
 b=UYP46wZdimnznKNXD3x5fvLg2rMN/VtjPo0QELUR0qQRjE6Wv+aVDRazQb9ewVizEY
 yvALQWI61uO5oVP3Z1AaoSleHcr5hif/mCNOch6IiVJwufT7oiwCa69uw1KzvnEl1xVw
 JH90S78BWJ+KaFd/CktuRBQh2N86G3jc4uP11kAnKl1gSqZ8xBtyzVeDRyp3WmU+QNoF
 nJxFwi8D3Y/olxPWjUJCjjLHVdTo1FCZDVOizgfqyLDDGOzZqOmZ3j7R/LLV8TNdVpRs
 +ECL4osDUzYOKgRTtrXEjVOwUGrIjrR3dEJRtFWYyodRczRWNfHfXmkE1AJiksCRjNVm
 jE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HrxoAnGYxfMe8eF6utEpYOM4v9LoQV8M0tbNnH02kgc=;
 b=r65X+N/XMyLAmW1xrzIapzSgIXEZrZNqStxxqa+vqSzphQixGaB7Zlc3pvrDFDHbY4
 h2W1wH7TfeJgFmnlesxxdn2xT4XiFdqW+0nNV9QH4HUUjKvU/YtCrUbgqZ9heXiEz68e
 6P1HJCakCFbs4YFuV3crBYAUhXJ9xf3UqlIm9zfS9OPmkCQnBvqTrfEAEVpgHrqIF4CI
 WZNGLxyAdKsqNzPpdGoi91xiqu8f+tKD2sJV2ce5zxo2qOiLR3V9MDmZyCBzEFLRh2GQ
 sbvqB88FtyAY71tStlf8S9r/hZ4tcKm+eGilYD5lE6xxzjJvr20syvi1/gOez3cL0vXU
 P2hg==
X-Gm-Message-State: AOAM532tfd2VFV9s/CBw6uh3oJlFwfv7Yf2XS+vCJm2z0smhYt/mrJ7k
 dlMymdBDpl+w2DAGdfyoNowv5+TWP30=
X-Received: by 2002:a5d:4e8d:: with SMTP id e13mr16305755wru.368.1603053264804; 
 Sun, 18 Oct 2020 13:34:24 -0700 (PDT)
Received: from localhost.localdomain
 (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id g125sm8684474wme.33.2020.10.18.13.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 13:34:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/9] hw/arm/bcm2836: Split out common realize() code
Date: Sun, 18 Oct 2020 22:33:54 +0200
Message-Id: <20201018203358.1530378-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018203358.1530378-1-f4bug@amsat.org>
References: <20201018203358.1530378-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M+HbeiZpTWcI

The realize() function is clearly composed of two parts,
each described by a comment:

  void realize()
  {
     /* common peripherals from bcm2835 */
     ...
     /* bcm2836 interrupt controller (and mailboxes, etc.) */
     ...
   }

Split the two part, so we can reuse the common part with other
SoCs from this family.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index fcb2c9c3e73..7d975cf2f53 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -52,7 +52,10 @@ static void bcm2836_init(Object *obj)
         qdev_prop_set_uint32(DEVICE(obj), "enabled-cpus", bc->core_count);
     }
 
-    object_initialize_child(obj, "control", &s->control, TYPE_BCM2836_CONTROL);
+    if (bc->ctrl_base) {
+        object_initialize_child(obj, "control", &s->control,
+                                TYPE_BCM2836_CONTROL);
+    }
 
     object_initialize_child(obj, "peripherals", &s->peripherals,
                             TYPE_BCM2835_PERIPHERALS);
@@ -62,12 +65,11 @@ static void bcm2836_init(Object *obj)
                               "vcram-size");
 }
 
-static void bcm2836_realize(DeviceState *dev, Error **errp)
+static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
 {
     BCM283XState *s = BCM283X(dev);
     BCM283XClass *bc = BCM283X_GET_CLASS(dev);
     Object *obj;
-    int n;
 
     /* common peripherals from bcm2835 */
 
@@ -76,7 +78,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     object_property_add_const_link(OBJECT(&s->peripherals), "ram", obj);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->peripherals), errp)) {
-        return;
+        return false;
     }
 
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->peripherals),
@@ -84,6 +86,18 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
                             bc->peri_base, 1);
+    return true;
+}
+
+static void bcm2836_realize(DeviceState *dev, Error **errp)
+{
+    BCM283XState *s = BCM283X(dev);
+    BCM283XClass *bc = BCM283X_GET_CLASS(dev);
+    int n;
+
+    if (!bcm283x_common_realize(dev, errp)) {
+        return;
+    }
 
     /* bcm2836 interrupt controller (and mailboxes, etc.) */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->control), errp)) {
-- 
2.26.2

