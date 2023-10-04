Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2818247ejb;
        Wed, 4 Oct 2023 10:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxBqwJkP8OkNwQq6MTICqUJnRioPz+jxn1UzcbuNO1IlnHxLaC1/61O7cgvLcb6RGO2J+M
X-Received: by 2002:a05:6214:5b0e:b0:65a:f1f2:470d with SMTP id ma14-20020a0562145b0e00b0065af1f2470dmr3022093qvb.58.1696440881923;
        Wed, 04 Oct 2023 10:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696440881; cv=none;
        d=google.com; s=arc-20160816;
        b=T6LL6cM8z02JdkiL+i2B5FReF2PFJI7DVyGUQ/wr3ndjcblHTQoF/CMuT8D2MIV8b2
         xC28T6kXnWgS/ke487s9W3nwrtfSkWosNzbiKNVHtz3XuhNvaiu64ly4B2Ucp/yM3Aex
         xovrM0QaVLPC+iGAKjc6vLyUTCTAgretxTPH1wKP/F87sf1yMyHK2B7o4SZxtS5hExmO
         oD7FE/KjPUD6x19dqp+xgSO11ONqPBF4ZxEDo1jhMFCeJOMlPyekfR0g5kQPfIcoOqrp
         nJETa7hfo4ziAREE+x8/KZ/Ug/VSr3boOBgL2t+ZAXGZCLcavRP0DdMgkH+m5VgNZhSG
         XFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+wgGQUdIqiLvE9KKvhjp7xkKxDkuA49hJ4+Z2t/uhpA=;
        fh=oHEdkhsElIlHZq+OoxO3ntU5X/1K0tW0XTlEfT0ZwCc=;
        b=l56VsXVLPUxgahKODvVArPsNf8FolI8FinHyDnyq1I+BEHF3auI89XPbXYZE76JGHW
         04jonjTcqIysHwAdKPI2HdD+aRQWw5SepoS2fpLfgv4DVchH6kqnsn64EGMAzKmxZB0r
         noJOAiWeSH0Ob7zOJAGNbBsp79Da5VCWw+zXQ+dFLsz12uSRZEf7VWBSpDNu4rKqooyJ
         WdX5AKu/QKpDP5uXzq5qxR3u1fpjbgGj04klcbATxICrdPVHSyaDtpI1Xfcw9mS+yNfF
         qkkUm/1weVGQWzh/nMIDTT8d6uSvy1KRHYprcIAoFYuUHwbCOaSaNmsDk9qIbpDB2gaP
         RVlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hZB/CKx1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a05620a0ec100b0076eed2a7335si1676614qkm.57.2023.10.04.10.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hZB/CKx1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5l9-0005UA-0H; Wed, 04 Oct 2023 13:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5l3-0005FY-9T
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:34:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5l1-0001ID-H5
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:34:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso7673485e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440838; x=1697045638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wgGQUdIqiLvE9KKvhjp7xkKxDkuA49hJ4+Z2t/uhpA=;
 b=hZB/CKx1pd5p0+oU/wOex0HZCaYFijZ2K/ar+bchIzz/D5Fnu2njue/V4x0xcDxi2x
 OAJ0RXuQrDx5xzhc3ck+/X6wsaNLJBzDBD3C2cgRp2dZFnmt7WZKjvyNPgHwP86gayCJ
 Fzsc8SSqRNRR+jo49UolpGnkyIcPVl3vHIc19zux/5eFLC/kjpI9LBD9XEKb53YO2tlA
 +Xo4KRZUAO4Yofty+sYVxHXfcJMoA7ZP8buj4SrF2iss/mI6h7Y7wWuHrKSdZrMjeQ3l
 81pGp2KGIjMum+Oz+iSi0oYgY1XkXDuwP/GLdPn02BRv7wU60f9JOE8b3ZRhY0K2pRb2
 aNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440838; x=1697045638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+wgGQUdIqiLvE9KKvhjp7xkKxDkuA49hJ4+Z2t/uhpA=;
 b=tvBCGFqMAQY8ucQC5C7xruGQzsBAP6Indgnm1LSJvXwWFp+zX1gduXXC2x8FPicIO8
 xwDKyna/igwsOk7yRS5Gt2bXJ4bxgOqOHq/RDGI0krQcMv5mQa40r12Z2bE4gtwn3ShH
 dSlOiDbmuhYSYUbWFcgYNYSZn0pc13fQAOx3Ckdtma1Yg/JyVIHgtSLkegq34jLD5y3t
 8jDs57aU9Q/apbpm59XigkSN4+gKmCZLlIYbW6qYtmxid6PeFbBAPx9c/bQnns6eqpiS
 oMUdZeSJizwO0ZtJDoL8DfUymlmPi1HjXHR+0rEr0Z+mApbv8TCx8PYoL5Evco2gmJKE
 zSQw==
X-Gm-Message-State: AOJu0YzjZIc4o9MoueWqhH0hrfkkAyOAsaScow5ygRA3atnIFTnyzNs3
 XwgsxW9PRGbBtro/Bqr4GvUcmg==
X-Received: by 2002:adf:cd81:0:b0:31c:2f95:8056 with SMTP id
 q1-20020adfcd81000000b0031c2f958056mr249994wrj.23.1696440838160; 
 Wed, 04 Oct 2023 10:33:58 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 b7-20020a5d5507000000b003247f732c11sm4499225wrv.76.2023.10.04.10.33.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:33:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 17/21] qapi: Inline and remove QERR_PROPERTY_VALUE_BAD
 definition
Date: Wed,  4 Oct 2023 19:31:52 +0200
Message-ID: <20231004173158.42591-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PpquVphfxZlt

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Manual change. Remove the definition in
include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h | 3 ---
 hw/core/qdev-properties.c | 2 +-
 target/i386/cpu.c         | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index b0f48f22fe..7862ac55a1 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_PROPERTY_VALUE_BAD \
-    "Property '%s.%s' doesn't take value '%s'"
-
 #define QERR_PROPERTY_VALUE_OUT_OF_RANGE \
     "Property %s.%s doesn't take value %" PRId64 " (minimum: %" PRId64 ", maximum: %" PRId64 ")"
 
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 357b8761b5..44fc1686e0 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -682,7 +682,7 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
         break;
     default:
     case -EINVAL:
-        error_setg(errp, QERR_PROPERTY_VALUE_BAD,
+        error_setg(errp, "Property '%s.%s' doesn't take value '%s'",
                    object_get_typename(obj), name, value);
         break;
     case -ENOENT:
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ed72883bf3..e5a14885ed 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5190,7 +5190,7 @@ static void x86_cpuid_set_vendor(Object *obj, const char *value,
     int i;
 
     if (strlen(value) != CPUID_VENDOR_SZ) {
-        error_setg(errp, QERR_PROPERTY_VALUE_BAD, "", "vendor", value);
+        error_setg(errp, "Property 'vendor' doesn't take value '%s'", value);
         return;
     }
 
-- 
2.41.0

