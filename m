Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3046417ejc;
        Mon, 23 Jan 2023 08:24:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtzehGF2kFdEQlowNkmtFwU2ZW6m8SORXlMgnMqEreew9ocnvEoIQmaS59Dp1+nUhEqS1lv
X-Received: by 2002:a1f:2b0b:0:b0:3e1:60db:a845 with SMTP id r11-20020a1f2b0b000000b003e160dba845mr13946240vkr.8.1674491080635;
        Mon, 23 Jan 2023 08:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674491080; cv=none;
        d=google.com; s=arc-20160816;
        b=w4vNu0I2y4fDHOle+jKzebP+aBeBOm9PvKIuz8wGfTLDOnRXo+VHnA4axNdnhN/QmH
         QjhRPxxGU/hWGpxxJsyCAJLE/5UjkuWkHIvYdkIUxot1dM+CkCyLe8mS/mnLf9Lg764c
         auYkQH3waISBA5nxtiszKphHO5eN919VroxEhRm3RfJk6eJrONG9Zn1piHiq3SKhc5fz
         NVxKJkAvXN99pyYtwaaqpnXXjlD+uUo4jIquUXJqiAYv1HI7oa3RfjfkyzyTBGIpxKAJ
         VWrIh8ZHLxMUWJn8ZuauJNKsUZBWGrbgj0pa+bKZ9u/LArGATyAwMfl/HfCfRcm0Rrin
         666A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=virOuLJDaeF5ivJM510UpnLxkMlI9JeiW5cCdcZz2hM=;
        b=Zdhc3D2Ko4SV77DWhovawSFHR6YXiNfTCYlwNpMkYq7FazVvYNmrwUMkEvdGS4GPIL
         HJiz43UbP7CvovQFQWvk3fUP4xKpucfJsFwpAMXf2Lb3CRZhHU9K8kCT2hFY+/KLP7Pj
         SqJ79N2DYUIxXrJyuoVYIa+NWPPY8auhq+OAy8o7Ezg1y5DJDpsoUr+o0vL8xWY4OIux
         ynwYV/MVDGEH22l/y2vlxqGxscdix+pTNvyupqnFGXp9kVYC7kRqnMz0DMCm1zFZAQS2
         /mp9hfm3MZR7PvAxPdR7vFkf2It1g4D2ItXZQHfjVk5AZlouvucujXSLQuHrzwSUrABK
         rgrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=iAn5sQEx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs17-20020a05620a471100b006ff7b2f1985si6618000qkb.575.2023.01.23.08.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 08:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=iAn5sQEx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJzbN-0007eu-OQ; Mon, 23 Jan 2023 11:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbI-0007br-SF; Mon, 23 Jan 2023 11:23:17 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbH-0003ap-AK; Mon, 23 Jan 2023 11:23:16 -0500
Received: from localhost.localdomain (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id A8C1B20E2C03;
 Mon, 23 Jan 2023 08:23:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A8C1B20E2C03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490993;
 bh=virOuLJDaeF5ivJM510UpnLxkMlI9JeiW5cCdcZz2hM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iAn5sQExDwQQq45pbl7lSgOpbHW/xfhFzkZ2LxH7ZDGZZ7ihYg3j8m+3vtevi/cTj
 F9iS9oAcWGIEBEApi2MtVsfp9BxOuCNZziOavPG1i5haSIRB3q04W4tQWIYn6piZTE
 AbZeHEpWT69uDdcUPx9xkxJiTGqcQZ6FTnQPatPQ=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH v4 2/5] hw/char/pl011: add post_load hook for
 backwards-compatibility
Date: Mon, 23 Jan 2023 17:23:01 +0100
Message-Id: <20230123162304.26254-3-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: Hxz+M8UFSrKd

Previous change slightly modified the way we handle data writes when
FIFO is disabled. Previously we kept incrementing read_pos and were
storing data at that position, although we only have a
single-register-deep FIFO now. Then we changed it to always store data
at pos 0.

If guest disables FIFO and the proceeds to read data, it will work out
fine, because we still read from current read_pos before setting it to
0.

However, to make code less fragile, introduce a post_load hook for
PL011State and move fixup read FIFO state when FIFO is disabled. Since
we are introducing a post_load hook, also do some sanity checking on
untrusted incoming input state.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 3fa3b75d04..05e8bdc050 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -352,10 +352,35 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static int pl011_post_load(void *opaque, int version_id)
+{
+    PL011State* s = opaque;
+
+    /* Sanity-check input state */
+    if (s->read_pos >= ARRAY_SIZE(s->read_fifo) ||
+        s->read_count > ARRAY_SIZE(s->read_fifo)) {
+        return -1;
+    }
+
+    if (!pl011_is_fifo_enabled(s) && s->read_count > 0 && s->read_pos > 0) {
+        /*
+         * Older versions of PL011 didn't ensure that the single
+         * character in the FIFO in FIFO-disabled mode is in
+         * element 0 of the array; convert to follow the current
+         * code's assumptions.
+         */
+        s->read_fifo[0] = s->read_fifo[s->read_pos];
+        s->read_pos = 0;
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_pl011 = {
     .name = "pl011",
     .version_id = 2,
     .minimum_version_id = 2,
+    .post_load = pl011_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(readbuff, PL011State),
         VMSTATE_UINT32(flags, PL011State),
-- 
2.34.1

