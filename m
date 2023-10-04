Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2817540ejb;
        Wed, 4 Oct 2023 10:33:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj+XQY81bMmrsCXDx1La3ePIHx0XVZoWU0Lc/f5WFuiNGMKcWG2SDX8YB4K0aloL/JHwdP
X-Received: by 2002:ac8:7f0a:0:b0:410:ca1:62b2 with SMTP id f10-20020ac87f0a000000b004100ca162b2mr3091636qtk.60.1696440806915;
        Wed, 04 Oct 2023 10:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696440806; cv=none;
        d=google.com; s=arc-20160816;
        b=LhmJVPJXh9dfgsksPbCQ3AnuxBd+z/eMgIJ3RK28JhDh/kHQFM+rOKtkt7mIC7l9G2
         GJOR3B0/ID6zm4liJBAnuq5ZUIIk4lMYltMsXtJeTEykZtKwilTwXo6d3WB/Cc+JO6rS
         83JoEZoxRLcjEWuTKXWTie+diSoDGfJUJXFT2xo6qJszYTOqwbpMAOLpgjzD+bTthUF/
         10YdeOStA2oID0NQaJ0KWNIbn27o/WRyqtRhVuHxXWkEFg8T/hjtqAKRuJR8mIxuaRnB
         8FrVZzts7zzUmbJXMlE/QYzt1OV1HdaiiP886N8DGTOXmVsPOP1bQzpr0YyfytaC9eZn
         x8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4tlfU+e5P66No2dfLjlw3nceh1BAOvyaTo2g5TESIX0=;
        fh=oHEdkhsElIlHZq+OoxO3ntU5X/1K0tW0XTlEfT0ZwCc=;
        b=OMPm7cRQM5p1mciL2/3aNT1FqiJDjsSpuPTDhy8raeNDo7LWw8/aMjfXPkCV10J0iw
         Knl9MrL6lO8Afnzu8b/zVMr9J12Pd1i4PrnomzvV/3ElXpWP7Kt+lGlPvGnpVHf66Cwp
         EZdj6J9qiyF+yxVQ0UO3WZmxSYUkg/KaJ+xzRkhXOK+daCs7oYBFey57aFrzXKfbf4Sa
         xw7yUfy77LV1xqgyqz6+8IQcEO3Z7GyjAbG3dt1GPzl3R1Ow6nzY4dqec5t9lBWM8F+U
         K/bCe+Vu9vcHZuiRbbtFKcefuQfaeAVbRobJX7eITKuqOAGGdv6HKjHhhFHrveCGvWD3
         qJlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fbTjUTTw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020a05622a01c800b00419875f512asi1678301qtw.674.2023.10.04.10.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:33:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fbTjUTTw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qo5jj-0003JQ-K3; Wed, 04 Oct 2023 13:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jd-0003D9-DJ
 for qemu-devel@nongnu.org; Wed, 04 Oct 2023 13:32:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jb-0000yQ-Ab
 for qemu-devel@nongnu.org; Wed, 04 Oct 2023 13:32:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3215f19a13aso97798f8f.3
 for <qemu-devel@nongnu.org>; Wed, 04 Oct 2023 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440749; x=1697045549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tlfU+e5P66No2dfLjlw3nceh1BAOvyaTo2g5TESIX0=;
 b=fbTjUTTwnb1isW0M5J9DD8eMgHw+UZqumH3fg+8XPQmpPKdQB8XaGN+9ofhial+yNf
 Oj/nGAvU9Woe702khrsVN39GszY+nIGkpd5+bkhftJ7V8xBzhaV47x4wbpIsef7MyO5I
 tfTBMfS8NXK5gXcRh4HDHn4af74au+RedR6iRwXnvF2RPYbF+YhAUC2PIqletZo2IxLu
 eqiQwRGL3QiM4uKa6dwThg+fql621CM8lvP8+Djnqk5wmwsj6fiAabpoMp17R63ziAHn
 rRzmIJzYmo5+VkJXFNq5iOiMUeSOw81KFuqb9rEcFlnnCU27PBfWrVq6eOPi3xlWuZrW
 ir4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440749; x=1697045549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4tlfU+e5P66No2dfLjlw3nceh1BAOvyaTo2g5TESIX0=;
 b=BZ1w6FnvlXmblkkJ1P/2ht6oAhWwqYE6TLJn2pgcBOb/3rZeSRZ/S4uNgw+OLMbHNs
 kBq4OJhVJ5Uwb3HcqS2gmaphJtiskbc4A5jZdA5PyBoG4nMSfdy7j13wgWaK7lkK60y1
 c3tnorjEiHrCZaL1qhaSoAsQKmeQH5ZNLuvTicArDmnBmcalRtbSqucGVPIs2fW9z42M
 st0hfaynV2W2XN/YdRlZDCfU1NXVKrxTalbVXmYYEDOeWPRtIXQzjyE9dgYnAj56BnKS
 q6QWtQSJPKoHAZp/rzC4ebpBaZNgh59kExo6NW0WApnSkbncBed1JEVuxI8Y+G9iet4F
 zGZQ==
X-Gm-Message-State: AOJu0YyGPeLfAWkHh7qxan9vguZcVP+A4FOrq8tsmCPTNKRNWgzOApqa
 jiGU7/XXJEWvjx3aSBxDgQ0sAGPTZSSNeLXqR34=
X-Received: by 2002:a5d:60d1:0:b0:321:7052:6406 with SMTP id
 x17-20020a5d60d1000000b0032170526406mr2778244wrt.12.1696440749298; 
 Wed, 04 Oct 2023 10:32:29 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 y6-20020adff6c6000000b0031c6581d55esm4448332wrp.91.2023.10.04.10.32.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:32:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 04/21] qapi: Inline and remove QERR_DEVICE_NO_HOTPLUG
 definition
Date: Wed,  4 Oct 2023 19:31:39 +0200
Message-ID: <20231004173158.42591-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: hHF4EO+UUmDA

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using sed, manually
removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h | 3 ---
 hw/core/qdev.c            | 3 ++-
 softmmu/qdev-monitor.c    | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index daa889809b..e93211085a 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_DEVICE_NO_HOTPLUG \
-    "Device '%s' does not support hotplugging"
-
 #define QERR_INVALID_PARAMETER \
     "Invalid parameter '%s'"
 
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 43d863b0c5..9b62e0573d 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -479,7 +479,8 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
     static int unattached_count;
 
     if (dev->hotplugged && !dc->hotpluggable) {
-        error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
+        error_setg(errp, "Device '%s' does not support hotplugging",
+                   object_get_typename(obj));
         return;
     }
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 3a9740dcbd..a964bd80df 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -911,7 +911,7 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     }
 
     if (!dc->hotpluggable) {
-        error_setg(errp, QERR_DEVICE_NO_HOTPLUG,
+        error_setg(errp, "Device '%s' does not support hotplugging",
                    object_get_typename(OBJECT(dev)));
         return;
     }
-- 
2.41.0

