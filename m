Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2960343lfq;
        Mon, 21 Feb 2022 11:25:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwIDKkf0t+R9HAWaeozhXuqSE0uoEjO/3nigB+yEUPbYNTgsL2vMzDUpUxVYVB3QGLlvNK
X-Received: by 2002:a05:622a:110d:b0:2ca:16e3:1daa with SMTP id e13-20020a05622a110d00b002ca16e31daamr19439480qty.28.1645471499822;
        Mon, 21 Feb 2022 11:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645471499; cv=none;
        d=google.com; s=arc-20160816;
        b=Hi3nCHEx2xqhLnwGit0DjNhc4xHDS4vhd/ZUULbLIAa8x6KpF1XArZpyo1G1cKaagd
         1a5lgLTWCp2p8VkyvJHOuKcpw4/0frkJNnHS3qP8GPdxiFqsfO5QWWoF0ZPEPWPIMkTP
         VDsIi0L+rNZg0nMTaR3n452buGCviA9sKLMxd5nehnYLVyiTnyyz0XtQH+3okSo5syEd
         wDhJ9LI3Tdy2oSQ7+RH/s65PkH4AteR8mZxfqeezq8sLbP0VW+xtk2cDJI/iVCbiPQTK
         5bmOFYYbzjWzUaw1H6CEUYXVVVRAdMgPBuWm80yXR6nwJSAfgE1wcUamhUK9SZKxg6nT
         1tgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Jqn0Eq5OamN94rTvkdU2cs5J2LDtszOeBtkgps6SOt0=;
        b=x8+E+pdieikrCx5E2xzWyzGa2SkwtO63Y0jKOEipOq6CNVb3miKNjKpw/Uw3DMX01k
         7x7OE7PS9+RRBfVz5b0frG17UQqRWXg5pA+qTfSmVy8GTREgQ9BrVfJI6z2AB/ZhnkcK
         2HZ4gO26evUSTXnYVit3O+QdZn+BhuRDttLsQ4T48SX4TEQZGFna6LwQkONn3xeH6Ann
         ruZtcetIX32FQqRAkWOrRnWHCh/km6+Eb5GGL4N9CUuQbIuYzhPgarwIR1f3F6ITbbNj
         D08TIzoI7rT0JDyIcQ3HMvTo2EQmK7+ZvvS26aoO2FXXpX5KLqzTP7LNybPvMA/UqrB2
         R2yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nst600r9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si2308006qta.683.2022.02.21.11.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 11:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nst600r9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMEIt-0001V1-Ao
	for alex.bennee@linaro.org; Mon, 21 Feb 2022 14:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFo-0007iF-0J
 for qemu-arm@nongnu.org; Mon, 21 Feb 2022 14:21:48 -0500
Received: from [2a00:1450:4864:20::334] (port=36490
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFi-0002dN-BV
 for qemu-arm@nongnu.org; Mon, 21 Feb 2022 14:21:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 az13-20020a05600c600d00b003808a3380faso70456wmb.1
 for <qemu-arm@nongnu.org>; Mon, 21 Feb 2022 11:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jqn0Eq5OamN94rTvkdU2cs5J2LDtszOeBtkgps6SOt0=;
 b=nst600r9RjZ4URbxu2yxmyWpDU18SN1XtJKR7g1fOeDy/l2dYTazCwCShARi5G5e8u
 CaauuwcTYtc+WBf1TIBRNitgIGIsU7Mu3AmzVsdydouAADB54fTwO92cNVxCg7Ktt8ee
 Bk8lW4smPw3UZeg96qV6r4fA+HMP3PWky4A1n0ubjtnGgR0GAeUyWXW2LVBcJnd0bWBb
 ZhU9IydmqwA+Sw413oVdAgq+7uGerjMwfxnnbYlKjHlXpjfC/1EmQ17xvoNz2OX68su2
 qv56v9Ij0mCmhYrnYdcyHBWpROwLKwvm4EOSqAMO/GtjAlw4BpSa4FHwb74ET63VVpNX
 5yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jqn0Eq5OamN94rTvkdU2cs5J2LDtszOeBtkgps6SOt0=;
 b=PmzWRYWiHv09UmG6x0Ci1g3zrYwX+Bwf2XsgPajGBiTTEmu9+/PyH522TISJsEw6LV
 Ywau9Oz1WfcdOzWMpX1zqTTaUKQLQDOtdkqbXykYzYbFAM4p2BIqm2WzMEu3ChOvSWzf
 JYtv4F20dKINjNfNgWwBM2GM+j54JV2D5YqFCYLgvkBv4PA8X4st5nQoFOHmZnkjrAFX
 9Rlk7uUnNuwpYD7jlWFuWop7Qoc3pjuIiN8ViV9JgMQ+iSW1rwiPo2IEYgvwCOGSHBvf
 sBDgP/Xw9jz9jqf0VTY7c5bO0VEYYXcr1Scf1oooSZ+d1iPDcotJ7gmF2lHLIOvFAdJS
 9ZBg==
X-Gm-Message-State: AOAM530QcSuXJ8Hurh10ICLU/9YaBpqC6AFaZGClCj9kaHz2YMf9GohF
 jrsemsezq6D3aohxnSDty17bdaWuyXMwHw==
X-Received: by 2002:a7b:c8c2:0:b0:37b:b742:a9de with SMTP id
 f2-20020a7bc8c2000000b0037bb742a9demr386010wml.37.1645471286546; 
 Mon, 21 Feb 2022 11:21:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j6sm38958226wrt.70.2022.02.21.11.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:21:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] qapi: Move RTC_CHANGE back out of target schema
Date: Mon, 21 Feb 2022 19:21:21 +0000
Message-Id: <20220221192123.749970-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lmQRZ/mUlaYp

This commit effectively reverts commit 183e4281a30962, which moved
the RTC_CHANGE event to the target schema.  That change was an
attempt to make the event target-specific to improve introspection,
but the event isn't really target-specific: it's machine or device
specific.  Putting RTC_CHANGE in the target schema with an ifdef list
reduces maintainability (by adding an if: list with a long list of
targets that needs to be manually updated as architectures are added
or removed or as new devices gain the RTC_CHANGE functionality) and
increases compile time (by preventing RTC devices which emit the
event from being "compile once" rather than "compile once per
target", because qapi-events-misc-target.h uses TARGET_* ifdefs,
which are poisoned in "compile once" files.)

Move RTC_CHANGE back to misc.json.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
---
 qapi/misc-target.json | 33 ---------------------------------
 qapi/misc.json        | 22 ++++++++++++++++++++++
 hw/ppc/spapr_rtc.c    |  2 +-
 hw/rtc/mc146818rtc.c  |  2 +-
 hw/rtc/pl031.c        |  2 +-
 5 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4bc45d24741..036c5e4a914 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -2,39 +2,6 @@
 # vim: filetype=python
 #
 
-##
-# @RTC_CHANGE:
-#
-# Emitted when the guest changes the RTC time.
-#
-# @offset: offset between base RTC clock (as specified by -rtc base), and
-#          new RTC clock value
-#
-# Note: This event is rate-limited.
-#
-# Since: 0.13
-#
-# Example:
-#
-# <-   { "event": "RTC_CHANGE",
-#        "data": { "offset": 78 },
-#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
-#
-##
-{ 'event': 'RTC_CHANGE',
-  'data': { 'offset': 'int' },
-  'if': { 'any': [ 'TARGET_ALPHA',
-                   'TARGET_ARM',
-                   'TARGET_HPPA',
-                   'TARGET_I386',
-                   'TARGET_MIPS',
-                   'TARGET_MIPS64',
-                   'TARGET_PPC',
-                   'TARGET_PPC64',
-                   'TARGET_S390X',
-                   'TARGET_SH4',
-                   'TARGET_SPARC' ] } }
-
 ##
 # @rtc-reset-reinjection:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index e8054f415b2..7a70eaa3ffc 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,25 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @RTC_CHANGE:
+#
+# Emitted when the guest changes the RTC time.
+#
+# @offset: offset between base RTC clock (as specified by -rtc base), and
+#          new RTC clock value
+#
+# Note: This event is rate-limited.
+#
+# Since: 0.13
+#
+# Example:
+#
+# <-   { "event": "RTC_CHANGE",
+#        "data": { "offset": 78 },
+#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
+#
+##
+{ 'event': 'RTC_CHANGE',
+  'data': { 'offset': 'int' } }
diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
index 94a5510e4eb..79677cf5503 100644
--- a/hw/ppc/spapr_rtc.c
+++ b/hw/ppc/spapr_rtc.c
@@ -32,7 +32,7 @@
 #include "hw/ppc/spapr.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index e61a0cced4c..57c514e15c5 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -40,7 +40,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 #include "qapi/visitor.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 
diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index 38d9d3c2f38..60167c778f2 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -24,7 +24,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 
 #define RTC_DR      0x00    /* Data read register */
 #define RTC_MR      0x04    /* Match register */
-- 
2.25.1

