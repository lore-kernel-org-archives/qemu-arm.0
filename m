Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1414252njn;
        Sun, 12 Jan 2025 13:03:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjxBDv0alPZ0BpHYyJ2VTRNkTuSjyMmjUQ7E2q/QG4cRrG4IdCB50IqLPiySGGXll4ptoMVw8SfGGGCA==@linaro.org
X-Google-Smtp-Source: AGHT+IGF6qsAegP/Epb3s8IKliILA50ceyA0JbKr7l6mj/ixlvIBi/moUGeSDzjMFxNHN7zBQhKa
X-Received: by 2002:a05:620a:24c6:b0:7b6:f34b:cdd2 with SMTP id af79cd13be357-7bcd97a4e6cmr3377683685a.53.1736715818412;
        Sun, 12 Jan 2025 13:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736715818; cv=none;
        d=google.com; s=arc-20240605;
        b=kBao5NJyU8XwLpzX9pPo6+e+cXmNffUDxBr9vOMw39UbPaFhbTPRV+1siLlOq02E7O
         YPX9F47StajYWodloCvXfz7Nn/wSNuKbNJF7f9PDvhJMhWCnc6oWUCq6JKyvKRpqlRpK
         Z5QJOTjEZahnUne17RhCvNfV+v/dtSdIaOuUgHX1j798o6lhwh8KYhvRMDpsMN+uoKzV
         SQ0iOzJ3xl6Q3R8+eSpnNl0I3DKT4GAYnIAuHBKGFifmvbKyzGjjMra5R7TK0DJFTudO
         hpeopaki11ZSPIOYriANsgOvX1kNh+6tpz8/he9khnApXWNfHLAjrK0Iu4s+naL1a7GS
         nH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+1AEBtla32qHIfczhWdQp7SwWsFBGmYq27EGiFppSeA=;
        fh=jxxDkPsVTq6QZJHcG5t7iASSQRkIT/Pvvrd+Yf1QwCE=;
        b=H1NH82148ylj1kxN1hUikRtRmEMG0NnikddCT36iDpA7edM9U4JOQMRgZfgDUnhFO4
         jGGZNsbRwKIBslvaCayWVLsHWwULsxsXKUur/Tpvnc6ey50BqrvgGDl2cFUabuScAyvM
         7msLp6yXkMiabD8pbKQ5CEZKUKb0/TVyQdYx16Fy5gK0CKw2+RheogDNVeyfSj6Q+3AR
         E7wwjUgce2H6+05XwWfGyND2jZEuguro5bDeS2Lxi5YH0EolRYa4hWCqFlHOEULDHAsX
         G6j91EZ08/6h1TB8IcwanyJcsGNRZmICCfbRW+X1TBT05F3Bks7/9vIUAxxT6Lmdl0xY
         zpMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=DuGBLlgc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3307cf7si1010218485a.302.2025.01.12.13.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 13:03:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=DuGBLlgc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX55U-0004Tj-R8; Sun, 12 Jan 2025 16:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55S-0004Ri-Oy
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:34 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55N-0006Mr-Ld
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:34 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso766974566b.3
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 13:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736715688; x=1737320488;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1AEBtla32qHIfczhWdQp7SwWsFBGmYq27EGiFppSeA=;
 b=DuGBLlgcHN1p3tOnz6b2oUICRN1Zk6bH5esgQcmg77Fyn2qhMF5OMIvaGfRzfOUpU9
 dX0ZSg0eYMw4zoYHYi4dbo/g7l78eDeBRm8qgphsNSE1RVhA72kMCriWfFO8SZ47Pcuj
 GluPZBmM1px8kyURViyTtXTz/prjMGIFCGs6Woc3cmvvE1A4bN4PfftSVYpyjjpkg1mj
 MRD1rFexrkDMLAK5xPchuXrSeSAZwVwTX3Hwg7QlXNAgbV/L+xkdPCouyi1aEYHlDNbT
 YdWN3SE00YiWKs3bVMzLkmfVo66B7xMxNodIq2hXwrfFEjQYLmoh/cxTOQFkKJ5AkvqC
 I31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715688; x=1737320488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1AEBtla32qHIfczhWdQp7SwWsFBGmYq27EGiFppSeA=;
 b=bl23JLd/gTwVPEp54yWwxIxkg71aWPhd7W4T/3FLEE+QSdRandXbypl74CTLHl8jyK
 S3DDw2srYkhCqb3B4blZ0nnkr1jBhX3b0Hl9JZvDmj5MS7nNvNkL4dVLracs/aH8hxPM
 N+9S2j0mt5lk21ZXkvNuloLaaeO3qnIyPMGEdFDqWEfCwdohqMbdPpzGyVuGpo5iOZ89
 5EpU5hyUPkqoLOXJ1AggtpGyihrosh1BiaQIrrqssWw4PNOxNqdj/d3FYgyKs9NNMeWW
 izmPn00wrm8u7tm8Y+NUZmUtz9vHeAnFvcgDWDIvBXK27BLVlNRI1uJiLphMCr4N2WzY
 VoWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXusulMxOXUw7z8x/mz8K6jG6FkKjGyOeIAtxUnlM5Z6oKAIR1UwZBf6Sev28pinlNHaY7RmSv/w==@nongnu.org
X-Gm-Message-State: AOJu0Ywq4UYJQi1hyU+fWhQk8y/osGAs55/r5Wu4kC8/xCkmc/0hk9PR
 /1zTgjbMDWoTfA8j0rx6xTKvRaCwFXW09Wl0JmDAO4UoLTXyr0RvPNEF8+DFsw==
X-Gm-Gg: ASbGncvejg5ahvygrV1SkrrJEzG6M2y8sRpZYVh+CDtpRUR9e7ryQPf34Iu/yA2Kd/B
 ds1DOZCq8+1aLPjAJpk5VXnpSTrcZ8UvRypJXgurUXarnyOxqhe3a+6zpkcni3gaflAuW1RmdKM
 QX01u16oCzxggkW4o9zAaeVv6X123n/Ud7FXjbQaPz5bAl5BRs1X1XFad9RrjJw1b9pviFzeLje
 9l64JBVRrdDm4WOlgRkNhjZGnGFOLgYyLMLtVK20tQWp/SZGOPsH0KaDAYTOCYbA2NnJcGmm5Xn
 BIuhj9LycO/8L1iEhWENe5ujk5Iqq1Z4
X-Received: by 2002:a17:907:3e24:b0:aa6:7737:199c with SMTP id
 a640c23a62f3a-ab2ab6fd036mr904373666b.15.1736715688210; 
 Sun, 12 Jan 2025 13:01:28 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e283sm418276666b.31.2025.01.12.13.01.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 13:01:27 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org
Subject: [PATCH v17 02/11] hw/usb/hcd-xhci-pci: Use event ring 0 if mapping
 unsupported
Date: Sun, 12 Jan 2025 22:00:47 +0100
Message-Id: <20250112210056.16658-3-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
References: <20250112210056.16658-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::636;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x636.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: UNrN8Vyxr8kE

The XHCI specification, section 4.17.1 specifies that "If the
Number of Interrupters (MaxIntrs) field is greater than 1, then
Interrupter Mapping shall be supported." and "If Interrupter
Mapping is not supported, the Interrupter Target field shall be
ignored by the xHC and all Events targeted at Interrupter 0."

QEMU's XHCI device has so far not specially addressed this case,
so we add a check to xhci_event() to redirect to event ring and
interrupt 0 if mapping is disabled.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-xhci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 7dc0994c89..00d5bc3779 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -644,6 +644,10 @@ static void xhci_event(XHCIState *xhci, XHCIEvent *event, int v)
     dma_addr_t erdp;
     unsigned int dp_idx;
 
+    if (xhci->numintrs == 1) {
+        v = 0;
+    }
+
     if (v >= xhci->numintrs) {
         DPRINTF("intr nr out of range (%d >= %d)\n", v, xhci->numintrs);
         return;
-- 
2.39.5 (Apple Git-154)

