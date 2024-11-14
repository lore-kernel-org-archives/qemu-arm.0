Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp490510njc;
        Thu, 14 Nov 2024 11:08:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWis7fYLjmghcTtVNFtr4mYdTuj1m0ThPib72r8WDwUAPwR7R4W2pCrtbU/Ze2zdVzLWRF34ZZYfD2L0w==@linaro.org
X-Google-Smtp-Source: AGHT+IHOY/PqebmlE2nudtaTVQc+0Uqp9rLAeesJBP5tSDxXrMwakx+ho3ygApn7/VS9gKbnuhDn
X-Received: by 2002:a05:620a:28c5:b0:7b1:50a8:3394 with SMTP id af79cd13be357-7b3622d3fd1mr5008485a.36.1731611288441;
        Thu, 14 Nov 2024 11:08:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731611288; cv=none;
        d=google.com; s=arc-20240605;
        b=CeVJxGdF+d7xHCkD37EUDJ2CGJcjwzSR0himfQxONtk7l1VZqckIgBM1I3mDO7qky7
         D8mzv5f+yUrL8eyvEfUCeLXFxBS+DTrmdgXQ1wERguoYoOgzEJ53TDvRjgm8nze+v3bK
         zHTMlFoNF1A66Df1ba21wh6nTsxzzh3tI9QFoWE4D3y4WO5IuWtu/vt0yJ+IJ/69zwix
         42hTzSEHVcix9zpJPrs5s4A9t7+a52vGm9gP5e+nmtGKD57Xa7An3fUetAcXCz0KM+Zz
         2p6u64YYxQX5O1FRlYyawYOA6fMvq2BWqvI/m9tfBi1F9fZgJpj3SU8SxyTJlbba38qV
         ayew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YlgtA2w+nkGpq6odlZPv7GuJkitbYlthMfvxp2Wzgbg=;
        fh=soXsmjVhqTFNz5LRi57JjNrrIVSrYYsl3YcLmX9Rdsc=;
        b=UPKKHe99uF1iLPNCL9p/oYN4gJLKqs2d01xX5vst629CmOtjeh9eZvIXt54G+ie1R+
         fwFQEbkBjP2DwWS7F3BcV4E/21EJVk+evnL4l80iPRSut6u2iAClgsdydZrahl4OBoOL
         QkITC8/5kkqMph/P9yIs9e29L5TEwXRecZA5Z4OUksM+wM9nv2QO+VXX+AwhlQEFmUbb
         1v9yPTUCiTI5qUiV4ftuXQ0hc1pvOAzijQZCfE8b2sWG5JQrcx2WYqhNqZKA/TNfp87G
         HVvazP5l0oYNGk5JnWEpVu++5eNCQT8cBHYEMKhP4+GWT+evFVEsW0BLySdela5GdLdK
         yj5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dY+g/+42";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca294f5si191771385a.256.2024.11.14.11.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 11:08:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dY+g/+42";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBfC9-0004Mk-7Z; Thu, 14 Nov 2024 14:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBfC4-0004F9-3G
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 14:07:54 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBfC2-0005Wt-GW
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 14:07:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43169902057so8464565e9.0
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 11:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731611269; x=1732216069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YlgtA2w+nkGpq6odlZPv7GuJkitbYlthMfvxp2Wzgbg=;
 b=dY+g/+42FyI0V6lVWCXfLwHUKYLu8J3Smt++UxBb/z3g4eLRnas8+gYBbs43NvmZ41
 Yd3WOai3BCARrmgp+MdAaGmLVlF+NJBSujO/pjMtym8IN9vSqoHffn7NdnY887x7CKkC
 C4J4AlOWust0O0zAzqDFxkXXRM8uZlyXPYGiXcaTSG3qdGPUQfSayXD5vD3CSCbZun9d
 zAcu+eHrKRqlM8/A0+CPUvWvHs4jYaIEeY7LsbH29RMiVeihEwLDlMhJe1tMUd1VRaNL
 WYQO5Fg7WZMSU1Kah5stgDOgAgifsCwTI+RNwHrFSbYGi02kG3XneUlFuHxWc1R4uwCd
 H7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731611269; x=1732216069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YlgtA2w+nkGpq6odlZPv7GuJkitbYlthMfvxp2Wzgbg=;
 b=r9h3O6m+jttg/1kURz9L/nquZ4IWJS5I15UhUwRt8G3EC137ZLfEulCRT995zDH+/l
 73fP4MXAd+tcg+NLTjD3SDkE/fJ4CfqmcGq+EO1s6EkwjDtoIWqtOTFl7OMd+rgRj+Tm
 ATK/wifma4wYFcML/NoO5EefV00NQWNSS3/xU+F/e4w7ls55a8tF0IO+TaLOMh2R+vFP
 OEleDAzHEFOepPjzwpngb0koYtAEen+sRMJbEufUJJYhIo0HGkwHfBNMU9ICMYUMrK2e
 ZQ73p8YDknp7IIkNk1vcDbpj75pMMxtQt/ehl7C+bOD0u088RnIFIeeMqjAY/rO/wF0/
 OJ4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1DQITlEFj1gsL7eO6dzaoAbM7I5nb92G87+iWxtzvG4aoOUQqVbNb3vPEG/zzxmHs31JxvBwKdQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzzh1fVbnayFphu1oY+aGJmZQWk+AFypmHbaWj7Mt/aYJvbNT2T
 CrfG7LtYYYJCNvwiol42x1b6pcgH5IRk/sJdOR6YMNbQhOqEWZH4HvhFimvf4EA=
X-Received: by 2002:a05:600c:5123:b0:42c:ae30:fc4d with SMTP id
 5b1f17b1804b1-432cce6805dmr97191465e9.7.1731611268857; 
 Thu, 14 Nov 2024 11:07:48 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab721efsm30627335e9.4.2024.11.14.11.07.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 11:07:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v2 02/19] hw/net/xilinx_ethlite: Convert some debug logs to
 trace events
Date: Thu, 14 Nov 2024 20:07:16 +0100
Message-ID: <20241114190733.33902-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114190733.33902-1-philmd@linaro.org>
References: <20241114190733.33902-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: sfKaKT23+ubK

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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

