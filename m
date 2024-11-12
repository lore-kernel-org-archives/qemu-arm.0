Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7533927njc;
        Tue, 12 Nov 2024 10:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/t+4dWOQC3p7nem8NFZBOaNykfsgrRDeJeS5mbejEj+5z+Uy5QJWsETw+mA1tKxsxjJ7XmpxW7LnDkw==@linaro.org
X-Google-Smtp-Source: AGHT+IHG3XCW5jYBsMUDJ5/gBqMABGthNUbyavoMjC2nfWuLHFjbeSuHDOXwHMCPs9MVOk2uEWo2
X-Received: by 2002:a05:622a:1a03:b0:45f:788:b1b1 with SMTP id d75a77b69052e-46309358fe2mr271659571cf.25.1731435097604;
        Tue, 12 Nov 2024 10:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435097; cv=none;
        d=google.com; s=arc-20240605;
        b=Zoz2X/HGwsL+RdhM9x5OlW0TpkSgcN/Dpjw6reV+guzC9Wz6Niiei1idItNYjRC0SL
         eWcUUNS85B+/tpWRw8RcGvtlXPtGlSymC3Mk5Ry6lv0Rbvj9OQ5ZeITSKNpcAU6f+7oQ
         PW94UXjznREhXV1s3C9JELsUa1KWYjWYLWwqn1FYjg8AmZRpYmY/OgQZwS1Nd2td1Nuy
         L5S7VSz7uqjN7wOKiO4k1j8Nvwn2PIy7UnFHtffKxQvlRocvzTL51MO6j8ivXeW1P1vP
         clMOlFPtqsL01d9xT08kp4uJHqdJ5WXEcJ6tisUUm/EQ4FaqXUhHJmhjD4ihVNHprvRt
         itqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZQmPPVoGs75Oc0X7p2l9C1PUIeVlzMNRobjeBMri9rg=;
        fh=5aZwubMTpUf+mLSbD5AVMyVUDtw0vRnbVpynKxoYM48=;
        b=FQmKSbZuHao37+KkOIqzup0JZirdizodNXcA95aUBumpQ56BQ0wymIIUcqMTJmMws7
         eDPTzcN6aInLMS36EGTBSTFRLCXErIwzhtQBS7S+e5tUrxwseZ4bXye4M376ESgva4oU
         qCJ4cIHnCFihyflhOompDxal9xdg/ClHyVM3uTqqIzJq/RWiGA3BkZsEBGXEXNatS43t
         vhGjsul6Xbl422hZ6aFHK4AQLO3wgmu2a5bY/MC1XxsI/wERTbRIa3KN3AZQ2o/bHhDp
         x8q5kzTm6H6/HFEKzIG7jP7LXbPOolb6P1VU9PwXALyzgM/d+4jHq7YPa9pHtBH1K7zl
         cUsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bkuy9+OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6247e0si148658821cf.415.2024.11.12.10.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:11:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bkuy9+OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvMF-0004yN-Jc; Tue, 12 Nov 2024 13:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvM6-0004wi-11
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:11 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvM2-0001sd-30
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:08 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so5844413e87.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435063; x=1732039863; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQmPPVoGs75Oc0X7p2l9C1PUIeVlzMNRobjeBMri9rg=;
 b=Bkuy9+OPXMZT9cbrByOma1Ovv+5ysola10Jw57nqWV/59MX5oTDfkNHRdn1E+kVNLx
 FWRsYbOqaMnYaSxYg/athElhWxfT7fvNCdzQqtMyM7WptTXoKHgnxVb9Xno4cJDJ8GQx
 vLXxkLUsAV0DEz0++rWJnHXteX2V4wvO1In+6Gb/1j9NGwdXU0xFObPd+eHnJ2pSXYKi
 u1BE7u5oKPCqikc1mHHZNhtAFSszUeeP6jCwMekcaru3/XZC8PP/VQbG6rG1ZJS5uDHU
 lvo6wSyVx/R3dJBmIsRgEDCOBftewe/Mx5TLntrPwwzb5xeI3rtXsXHKiTMWVWp/puRp
 57bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435063; x=1732039863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZQmPPVoGs75Oc0X7p2l9C1PUIeVlzMNRobjeBMri9rg=;
 b=VDNDrvPPvPA0khnN/fDpNiM/olXesxlTWBsYhMdH6NJHoqNc9xkd4rOVkOo7FScaEW
 cHllpKItVViYHRWH8fM5ppjCOysU2sj4GoCEFXSrMlvMLYJyaZ8qgiNj/mGlM7EhJ+QA
 gJhh4Ek15CINT5AeiE4ghqs4zMZXTRVF0+s5Q0NAh5tlp4w7NC99YHKnYLfLUus7a20i
 7xCFC3+VubP12y/sNx1FVcOrOqNQDFIhkr/SiDWQCDLtKdJuDJypBefb4NW75md9YQGG
 lt59+jdNmHx/8ndTfYoptoWHEq9GBZyMwfkr1fRQZjwC4lixD3cLPeGpcGxAGG4rYVEr
 v+BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLqu6OmNQ6S4yBw1iRygW1p87SaNWRpG+XT21a36StOUU2TsLwwckSP3rA+1mpbtLQQfQHFP/jfg==@nongnu.org
X-Gm-Message-State: AOJu0YxRv3wAQwmJRLrKwuD0WUm+6G0/OuXSLhgdfOCgTPbhzaWbtZDO
 CxzrVIqreVrI3uwN2dLlYywdwRcISe4G9+ZLJTUfbqRNKBv/yQqIplLv6mNRunE=
X-Received: by 2002:a05:6512:1042:b0:539:e60a:6dd0 with SMTP id
 2adb3069b0e04-53d862f8170mr8876660e87.51.1731435061922; 
 Tue, 12 Nov 2024 10:11:01 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa737c86sm262860325e9.38.2024.11.12.10.10.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:11:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/20] hw/net/xilinx_ethlite: Convert some debug logs to trace
 events
Date: Tue, 12 Nov 2024 19:10:26 +0100
Message-ID: <20241112181044.92193-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: /nUR9djXJX2c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 5 +++--
 hw/net/trace-events     | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index e84b4cdd35..bb330a233f 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "net/net.h"
+#include "trace.h"
 
 #define D(x)
 #define R_TX_BUF0     0
@@ -198,13 +199,13 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         return size;
 
     if (s->regs[rxbase + R_RX_CTRL0] & CTRL_S) {
-        D(qemu_log("ethlite lost packet %x\n", s->regs[R_RX_CTRL0]));
+        trace_ethlite_pkt_lost(s->regs[R_RX_CTRL0]);
         return -1;
     }
 
     D(qemu_log("%s %zd rxbase=%x\n", __func__, size, rxbase));
     if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
-        D(qemu_log("ethlite packet is too big, size=%x\n", size));
+        trace_ethlite_pkt_size_too_big(size);
         return -1;
     }
     memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
diff --git a/hw/net/trace-events b/hw/net/trace-events
index d0f1d8c0fb..2b36cd967e 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -511,3 +511,7 @@ xen_netdev_connect(int dev, unsigned int tx, unsigned int rx, int port) "vif%u t
 xen_netdev_frontend_changed(const char *dev, int state) "vif%s state %d"
 xen_netdev_tx(int dev, int ref, int off, int len, unsigned int flags, const char *c, const char *d, const char *m, const char *e) "vif%u ref %u off %u len %u flags 0x%x%s%s%s%s"
 xen_netdev_rx(int dev, int idx, int status, int flags) "vif%u idx %d status %d flags 0x%x"
+
+# xilinx_ethlite.c
+ethlite_pkt_lost(uint32_t rx_ctrl) "rx_ctrl:0x%" PRIx32
+ethlite_pkt_size_too_big(uint64_t size) "size:0x%" PRIx64
-- 
2.45.2

