Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1637544lfr;
        Fri, 9 Apr 2021 09:26:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDfFgOOEYSkafj2x2g9GMGPenkTj73JgW2NbYEXshB85eUp8pqf2CtnQ9/4cvmbhZWnmu6
X-Received: by 2002:a05:6e02:12c6:: with SMTP id i6mr11666098ilm.235.1617985587107;
        Fri, 09 Apr 2021 09:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617985587; cv=none;
        d=google.com; s=arc-20160816;
        b=p1GZg+BO1F+9mlUKONfD5W0IQ9073J9PWWAmkGt1E5ACCVp8GAxBIttOnD5z4Hrkm3
         YdOuPCBfDKL12ovKfYDQipvt4qchGKt9Myx3EhJ6VqG5dVUPcAwdzaUUkS4QQvMVe0bL
         zsP4/S9DMH/lRNvDJ+MlEd72BnNXnPxKKBiK9+37IgLSsRF8zg6RJBKCrWUI+3ewov95
         0xnJvWYt60Q8RBl2hja9hrohD/nyzsgnKFLpII9tWDM/rMa5iDmtLECkwKjfeDcRGNDI
         uiQ/jJsSiAC51jsoc+jzQASjD7OxPbaBgqftefZR8+D8c9VVelXsDL7dx9An+3bnm9or
         +MzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=1snVUJR5zUGgJx1EWwQp+r8nhg0Oy0nYhyUfSILVUtQ=;
        b=KX3FxhHkrTOdZ6MEw/hrMQr1HcdGi+RdOzYlbRCHyMM195RHLX7zMOdHaynnU19JsR
         noHp+B6FJgS8qFgwYDX7Yl3Vp6JknafQjETRUjxYh4ZfPgE6mHTc+uZsgGVDd94eK3za
         vXN4vbIcBLPmEJUXU42g9uZLMwxAfEUTawUq8VquaPbWrLvCVfM0U1rzIAY0QGKgnRio
         F/XQTe2Pm01GpMd9IZrLwqrMLu28eoGlz0wP+H3lOhSevIydIrFSWeWj0PFKKqTcuI4q
         FX8r1r3U8JOxuy8gkT1WgQO9OHbkY8/XubRJxm07GgOLnRe3kIjXemPUdNcfLaV2D0fM
         00yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=gGd0A+21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si3075498ilj.44.2021.04.09.09.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 09:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=gGd0A+21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUtxi-0005Pb-By
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 12:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3F4BwYAcKCOIZIRXYVIKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--venture.bounces.google.com>)
 id 1lUtxM-0005MI-Qp
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 12:26:05 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:48937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3F4BwYAcKCOIZIRXYVIKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--venture.bounces.google.com>)
 id 1lUtxI-0007SM-SP
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 12:26:04 -0400
Received: by mail-qv1-xf49.google.com with SMTP id v11so3491315qvl.15
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1snVUJR5zUGgJx1EWwQp+r8nhg0Oy0nYhyUfSILVUtQ=;
 b=gGd0A+21VOj/w5/jt45tHLhQBWiH94s8XtlUHbVPHMepufOMhX25kpE7O8mhWRoRtW
 j//wnlWkFLemjePyG3Hmy/RVXOToMk6tuudIyL47xW4Mc36opT6HDSiEmoebLLTZhsZM
 YR5R+MGlZRTCUMiOPOTP4Jy6J5JetSlLbKfhp+U4atwFa+zgMTAKgGQnLp0FsuuUhR8h
 1ATzzMqh+zUna5aVihhr9/zpxCIybROltLWAupaDNUx8ESi54ZoY5/UtCN/lDS3GBhPA
 IiEj6ii7RFH2OpYdOWnUk1RueE5UL3xhQ5GDayU2XJcNcaQCBwPuRNb+98hJOVfnfpEk
 nmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1snVUJR5zUGgJx1EWwQp+r8nhg0Oy0nYhyUfSILVUtQ=;
 b=PgJCC0B1IydUrK5kEvM4fL4iP5hbsOUESui6T6qdxqbn9voS9TAY5FcIjeMPro5yfS
 dJI3a1h9/u+HSj4bEtC74XLZy/U4kwlTEDk0c4JV9KSa95cVCiw+Q1GgBRlHb/NCG/na
 h1ZMTozPG36tFYlgAK9bzeEbEU1QHVuViaROfUlVEh1CiRtIjdvwdhlpdfPCVa515Mhz
 QJIwWyMgKV015FJP5vGqxe+b9uZPQg21s7oAL1y//sB2KnwoFR0+s2+k13Aw6iTjkN5X
 FymTQfqdD084/HtP/QF3zA1XsnZXo/Er5lvg1gSSWLKfMiMG43h6JcHMXofhSPW6w1Sm
 auWw==
X-Gm-Message-State: AOAM5339nGNrmhIAZHWBw2x+picI6WgLcxN+nVKzj3A1vrL+9EaSq+qF
 /QZpUWo/b3SzAwhaFHMu5FZSnxoCNGPC
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:6985:9b01:e10b:b119])
 (user=venture job=sendgmr) by 2002:ad4:4f07:: with SMTP id
 fb7mr12275856qvb.30.1617985559086; Fri, 09 Apr 2021 09:25:59 -0700 (PDT)
Date: Fri,  9 Apr 2021 09:25:42 -0700
In-Reply-To: <20210409162545.3705962-1-venture@google.com>
Message-Id: <20210409162545.3705962-2-venture@google.com>
Mime-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v2 1/4] hw/i2c: name I2CNode list in I2CBus
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3F4BwYAcKCOIZIRXYVIKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--venture.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r6wPYG3dHG0S

To enable passing the current_devs field as a parameter, we need to use
a named struct type.

Tested: BMC firmware with i2c devices booted to userspace.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 include/hw/i2c/i2c.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 277dd9f2d6..1f7c268c86 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -58,9 +58,11 @@ struct I2CNode {
     QLIST_ENTRY(I2CNode) next;
 };
 
+typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+
 struct I2CBus {
     BusState qbus;
-    QLIST_HEAD(, I2CNode) current_devs;
+    I2CNodeList current_devs;
     uint8_t saved_address;
     bool broadcast;
 };
-- 
2.31.1.295.g9ea45b61b8-goog

