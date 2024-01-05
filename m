Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp794565ejo;
        Fri, 5 Jan 2024 07:49:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo7zPsBfUOwSwMbex+glPpV2lj1Vl5M3Fzbih9/48cbYzYGrGD6UFmvPLGZYoBeecOumth
X-Received: by 2002:a05:620a:830a:b0:781:c50d:f835 with SMTP id pa10-20020a05620a830a00b00781c50df835mr1974478qkn.142.1704469746716;
        Fri, 05 Jan 2024 07:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469746; cv=none;
        d=google.com; s=arc-20160816;
        b=fXiItcsjL1npUeW2+GMqyJgepVUnFgXG2CGxrYd0vw1yR9g1RPN8OY33fvKStYy3Dn
         TlR8CZqz5tAa41/liDuywkLv9IqY2rnSAKHXmw8O1ykUUjWPtJUDpKe/jl1SDKisnjM8
         rs2VH60RxuaExjnDoiC+YVpdbzWOl1NjOeEHdEJGIJawpKLcKkBZg0b5qhQR9gVPhIGc
         vj6nVODsk+LOJYBL84nP1SejLz/rYyGw1IxO6CVFlK71hvkTSmwRsY3MGwUaMhqma3ZJ
         A43cgZzjzBZPgIPNobXfo0zqfLXmGnRhUqFsrpQJ+6O1KmaXhvv8cOlALvEQmwgxC+zV
         ewsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1OMJ2J/9TeJEsVbvbtgjbGV5MuipQ2Dh2Ow8E2AaclY=;
        fh=3nCCaiiW3tvaCvW7R3dnb3A1HVjFyaxnPEYthLbnaW4=;
        b=NTmQGMhB1VtYba4Rsc384EOt9HOrOteZEfxAJvvyJRojIa/XiJvk1Bo7nS/U5Vvu+j
         XMn124Y7co+nE/yE+170mQ7o2jHjYhIyl6eH8OIRhgocz8GdknUI4tvam4WaO7Pxksdq
         e0nddGxUenAYhiM3ZuaAMBd+ve3dadHZg28vlO44lzhwfKGw64cd8UTa7ttNc/DRHF9D
         duebttLVlueK/8YuyGBFb4goqOAzcvugrcc/vaOrmdtWjLYBlq0Iy6pF7TKjvPslbAm9
         /EMJEcb4M8pOpUqQBTEVc6hZ/zVq321cGhE/CQYqDKpooDqw+sldaPZFEvdoZpl0ideK
         Dmfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1SsD5VV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z28-20020a05620a101c00b007815c9558cbsi1913084qkj.224.2024.01.05.07.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1SsD5VV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmPd-0004nV-H7; Fri, 05 Jan 2024 10:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmOi-0001vF-Th
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:46:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmOe-0003p3-QW
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:46:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d8e7a50c1so18946455e9.2
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469566; x=1705074366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OMJ2J/9TeJEsVbvbtgjbGV5MuipQ2Dh2Ow8E2AaclY=;
 b=Q1SsD5VVAHJmO+jOod0cqpLhrRuuvNV3fyxFAkIeyZmyfL74xygwDD/J1dpm8oLjbR
 msuNkNT5Yt2vB5CLgIU7YjX8GB91mEJogAFOZb44BtDKX/SRjjcrdB26exdEO0W4OfAR
 KuB1wZiNSrsRSbCQK0Vzd0SIZDiV2PLs5MQs6Nh4V3AQFC5++K3GXJ9Brar7sPdTaN+U
 stc5Mh8+zCwkmKMfdUup+UJfGKDYAHDCXuys27hYGnVsFDmwOcIPsm0wsZ8Cr7hw9kKu
 OvFfPOl4SV0J9udBgy9HB+hqsKuulC55LBe4CMSGy2yCYh1GSyuGqc/xWK81Del+p9Ag
 AOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469566; x=1705074366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OMJ2J/9TeJEsVbvbtgjbGV5MuipQ2Dh2Ow8E2AaclY=;
 b=bl8KgBUbBQbZ3tx24uWu3MILJGFWJXWD0NDF+Dk+3m5abxxDjwBextrAp4FdYyB/fP
 coT16eX9YR4OiW+LRyqkyrBZVaQXYfTWCVQGZapCuZhkQHwFlQsFO0TM4ZTWX1O4E+vS
 7KL0KwgC5fKWAUiXtCwMZs2OidAEJsR5OREZvwoWeBpsV0onMGGDh5oew7fMNC2IYRfH
 0GUhsLt3YKfY7lzAVHbxO399ILRL58NQeCm7Zutrgyy7KZAFZ/JRYrDQE8ZSL6vt8C0D
 6p6DtnrMo8rh4PWEvPTsjiYGivsQQVfr9OTXKT1K8X/UynhF9GqH6KGmcKhz82GHkXbG
 Yjxw==
X-Gm-Message-State: AOJu0Yy2EKTU79ymg0HBusidDlPgnMYr4B970/Ha0aWfg8IfKuu5bP2+
 MxuH2JMzpY4QbELG1+cdnZP3ThxxBN2MPQ==
X-Received: by 2002:a05:600c:1d82:b0:40e:36ba:e51a with SMTP id
 p2-20020a05600c1d8200b0040e36bae51amr729802wms.132.1704469566494; 
 Fri, 05 Jan 2024 07:46:06 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b0040d90407f7esm1931456wmq.8.2024.01.05.07.46.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 26/71] machine: Improve is_cpu_type_supported()
Date: Fri,  5 Jan 2024 16:42:19 +0100
Message-ID: <20240105154307.21385-27-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: +eX3lmHpErGK

From: Gavin Shan <gshan@redhat.com>

It's no sense to check the CPU type when mc->valid_cpu_types[0] is
NULL, which is a program error. Raise an assert on this.

A precise hint for the error message is given when mc->valid_cpu_types[0]
is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
when we have mutiple valid entries there is avoided to increase the code
readability, as suggested by Philippe Mathieu-Daudé.

Besides, @cc comes from machine->cpu_type or mc->default_cpu_type. For
the later case, it can be NULL and it's also a program error. We should
use assert() in this case.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Message-ID: <20231204004726.483558-4-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0119b11fc8..c523ce32eb 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1412,6 +1412,7 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
      * type is provided through '-cpu' option.
      */
     if (mc->valid_cpu_types) {
+        assert(mc->valid_cpu_types[0] != NULL);
         for (i = 0; mc->valid_cpu_types[i]; i++) {
             if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
                 break;
@@ -1421,20 +1422,27 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
             error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(errp, "The valid types are: %s",
-                              mc->valid_cpu_types[0]);
-            for (i = 1; mc->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+            if (!mc->valid_cpu_types[1]) {
+                error_append_hint(errp, "The only valid type is: %s\n",
+                                  mc->valid_cpu_types[0]);
+            } else {
+                error_append_hint(errp, "The valid types are: ");
+                for (i = 0; mc->valid_cpu_types[i]; i++) {
+                    error_append_hint(errp, "%s%s",
+                                      mc->valid_cpu_types[i],
+                                      mc->valid_cpu_types[i + 1] ? ", " : "");
+                }
+                error_append_hint(errp, "\n");
             }
 
-            error_append_hint(errp, "\n");
             return false;
         }
     }
 
     /* Check if CPU type is deprecated and warn if so */
     cc = CPU_CLASS(oc);
-    if (cc && cc->deprecation_note) {
+    assert(cc != NULL);
+    if (cc->deprecation_note) {
         warn_report("CPU model %s is deprecated -- %s",
                     machine->cpu_type, cc->deprecation_note);
     }
-- 
2.41.0

