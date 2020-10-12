Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1152779lfa;
        Mon, 12 Oct 2020 08:41:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySXrx1jR7pn/a1gbiNq6G2TrWUzscc/lkrXVqGfvI42bdFu/YgouNjHXJzqnpYn/wfw+2d
X-Received: by 2002:a25:5f06:: with SMTP id t6mr31893053ybb.501.1602517282560;
        Mon, 12 Oct 2020 08:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517282; cv=none;
        d=google.com; s=arc-20160816;
        b=IV8kLaiZITHSBYjMgrX5VWkVcfxyGMOyYNScojMqBt1AdY/wc5nmCNZlA0bPpVGzSE
         0oNtwpJbD5ewHxvepOkmygy+9i/hbgK/qFL2F5ibwcrgqTS0fqX9ZTAMMe0QieBvp7ZC
         t0E6pVrA3BZyV7flwyPr+QBylXAVO6Tdr+6v81TRYKgI+whZWszH7oCH3I26j2Wv3j/R
         1TqZT5nQhhEoy8+54SzvS/g6tdeqdfX3xcnpdQJpTZxJanqqyl937o5igxtIc90j6LZc
         jllQdaAezeGNKk6wneFtH92kk+ivVnY3GV+bwPEVao53um1lk80+DolWn8pyu84EeF5q
         p1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=diP0Ikbvho+I6Mms1spyyg4KYwxa5PP0ZncvtRg8lU8=;
        b=RhesCN+Y11mRdqZRv33lji4T+lsx6k2LyeWZcyo7+tIoi+c0uDbCpeTUKipXHxCGT9
         HAiB6lYsSL3nqu7e1T/YcYuu1kp1Znvd4gRJ6ZxXhtS40w6c6+VYlNLSX9dkEBcfkvsI
         nOWF1D7JpCYAxbm86HgnhkrnjWEKHptGesA/MXLYM+ddRBU+j9BEEhgkaNJxWrj4ESP5
         23Nbq6uJjl5H1Ko/SvqDgJ55e712G8uX1x67VzLhwMx7m7M3q+vpl25DzCccQr2B6dmL
         4WIInYPgi8sWt5o90R7R9EZKV9e2UDB7wkko66QuNs+DT/xTyLOmNubXtFcRSf2Ddu93
         NwMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahSRz5ju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c128si9641077yba.28.2020.10.12.08.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahSRz5ju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzwv-0006zo-Tg
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqM-00072R-Dh
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:37 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqH-0007J9-Dq
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:34 -0400
Received: by mail-wm1-x344.google.com with SMTP id e2so17969091wme.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=diP0Ikbvho+I6Mms1spyyg4KYwxa5PP0ZncvtRg8lU8=;
 b=ahSRz5ju663r7c/IevNx+Vo1+Rj1xz9lxAHCEQqdj6vS+9oUCjO0+VWqOi2gfmLq31
 0vVCMfCPQPFoOs2eZWNibDWbaD8+15HpHZybNnQWfUFxuDW9dC9rj3mEE7lt3L/1dH0p
 3tGXNqmgPt+MtAqD36gCTiT0zP27/Hh4MXC566NEnHd+HQRDbz6/IS8Qdo8+go4K0uiP
 Qz3GE+ZmSOlqDRApcO1CzqH+334ByFqPXcKxpNSmdbPe5aePEZ/bqLCO0C5Cf9l7yH8P
 EAP6TKGnM7xIzOIrwhvqvj42oANVGzWG8KIc3N1Zh+9zCGxgouBbJHsgTNF9iKZARPoz
 5meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=diP0Ikbvho+I6Mms1spyyg4KYwxa5PP0ZncvtRg8lU8=;
 b=XbpUHOAGpDDSyrvadTNX1v6ZLA00/vng6EKAwIJhgb+VZZU1SkoSV79yczmag2Kmgz
 7yrxd1smN1ncnVdnNTtFGZGkQlN2Ks5EP8hlAn0PdoTFxHQdTZ1p0pa3Ff7r4uzyoBym
 pMXooms8D43DPQ3Kf9kHV2suJ2SwNA8xBdOFX/f3E7OP5SQg8YUl49ligE7r4U5umIPz
 uI87s1BJNsIzVBmKh9NeN2X43cqQ+XOB9UOrM1/1cDbU0RQJ7zrzKPA/7E25y9UJOlmP
 ll1bqA6HS8S62Cip+Zgo+T9ODVTuyOEZzsrYn53DFanVmjR6BnUS1EPn04ZRVA4/A3zO
 ZqDA==
X-Gm-Message-State: AOAM531IVi4Q9lwtmKl5UteyOA7AfZsAnwCS7yVkzH1xiybpwzQgYEvj
 Aw4G7qqL0WDh/B5oEDaOX6mGoSSeh2JLYWQ4
X-Received: by 2002:a7b:ce85:: with SMTP id q5mr11224686wmj.35.1602516867847; 
 Mon, 12 Oct 2020 08:34:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/input/virtio-input-hid.c: Don't undef CONFIG_CURSES
Date: Mon, 12 Oct 2020 16:33:38 +0100
Message-Id: <20201012153408.9747-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: plos3TKL8IfD

virtio-input-hid.c undefines CONFIG_CURSES before including
ui/console.h. However since commits e2f82e924d057935 and b0766612d16da18
that header does not have behaviour dependent on CONFIG_CURSES.
Remove the now-unneeded undef.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: tested with 'make check' only.

 hw/input/virtio-input-hid.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
index 09cf2609854..a7a244a95db 100644
--- a/hw/input/virtio-input-hid.c
+++ b/hw/input/virtio-input-hid.c
@@ -12,7 +12,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
 
-#undef CONFIG_CURSES
 #include "ui/console.h"
 
 #include "standard-headers/linux/input.h"
-- 
2.20.1

