Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp805006njb;
        Tue, 18 Feb 2025 08:27:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvtz8fStyqrxnmRLp/vV2crtkSuc66i+aG8etI/e42MxRPCrHNRTiFzRcYs965CGdpFr4IG1xWsHyfAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHkrOlh92T/ul7kznxvrDZAvtmNl/vo12u6QXZOODzXE/dNVtKIOFiWOO1xUTHqUqFA9Gf8
X-Received: by 2002:a05:620a:2955:b0:7c0:88e6:f76c with SMTP id af79cd13be357-7c0b5365712mr20123685a.51.1739896037989;
        Tue, 18 Feb 2025 08:27:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739896037; cv=none;
        d=google.com; s=arc-20240605;
        b=BcC2oX0Uld5qi6BAc4kNU6rbaPRXNMAWKE5bAxKUz/I12KHX8PfLVb9XJBEuiQ5LQq
         y/KFfwKoUA2lQ5hGCaRuuiUEVSIwC6TESSFNZzx3NS7mQy7lMqy1Pq32pQMrR70jOGTT
         F7Jbex2p4NTxG+1B9QvxKgKG9AtgS3Be/6YyCEB10lnv07jziWsgOFt6injGZuK2DwW0
         gsDRENUlMOlC0WsvUiq7SoNDhEhu0z+lteXzGVrFCCyGer/oGdnhq+tAsrpKqQn+6qi3
         mafySSvfQ1EDrZKylR8z77bGMKVIU4Oh/667t1g6Kuk3H2bi3tDYSBrv+YF1AFjprCWA
         aoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mperaQfcVOBqRRYRjHccBT2TwBZt0VUagowA4iRkLpA=;
        fh=uoM9EQljei81L11EYDec9nNz9h/ZNzvitlR/Y9oTb4s=;
        b=V3pxJn5TG8dhDPf1RNCN7R/aYnhOdZa4Brya9FHqJhd5EWna9gWMGxsD+1VWRxSgc4
         AEkAhVrgtZI6DZjmhkzhyJ6BJsb8kp6zf9ZN3Shp+P9UrhYgqlAWTOhJDznpsjIR6Uqu
         +7+erTZFHlo6hYtq2mKYbLTaVp8nCRDNYIlBpZe4LaYZt2RHfgeIseKyDltvG7LAXa+K
         A1/myXKgJKFBGn1J5hs70ByjfOasFTeOFj5dI5KO/xMvj2+/gjwDhoDi1MTyxkZqz+xD
         UMbgbkgBGOSdVIk1pJFxVwOampJp1JULWQ0A4MmCt/inkLiN4AIx0DgZoBO+yG2lDrhG
         nbWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xd+xG20v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a24a22fdsi338751885a.83.2025.02.18.08.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 08:27:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xd+xG20v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkQQy-00052d-My; Tue, 18 Feb 2025 11:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkQQx-0004zE-9I
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 11:26:55 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkQQv-0000lu-My
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 11:26:55 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso63534725e9.3
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2025 08:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739896012; x=1740500812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mperaQfcVOBqRRYRjHccBT2TwBZt0VUagowA4iRkLpA=;
 b=xd+xG20vd2eayFJ+youg2RjBW6E435A0yO4Owqzf7dLSkrGYVUPltNWIwTMp8zOyX7
 Mx2h2PfhS1G310h+tzwBOv0cA6+qZxyZBhg4IugyW8RxZ3hxlda6WRYoummZsj7H4x9j
 0lhKlhSPFiLIwrgcYmnIV94Z6MT59DpMTxc7DYTW9UgeSrHCXdAC/BymPvtPEO4UAhyi
 oeKiumEdFq7Q1sOaTzfSD0hw/lMR4QbhmNwAYvOO+GHt6RjbUmVZMcPu3mPjRSfJPx2M
 ERW1C9qBbWdX/bdST8JzYKPp+WBr2xRkzgp37KTxImntJq80DqeyiteOcdZlj8u6gE2f
 uhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739896012; x=1740500812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mperaQfcVOBqRRYRjHccBT2TwBZt0VUagowA4iRkLpA=;
 b=R7ALMnu7ykNA/QP11BD/GfkLiCYA4erxzv6J+fAWrN7NJhqepKd+vhKPOde0PLKETS
 KaFddctzx9aHDaKQIUzTDxq9eT7Q12DEcbebJT1Yd+8NxBmx90zCnBrja/k3UYkcYFjT
 BZg4COVoaaMYL6AXfsC2mFPfUvzSarO4KZxY7wAk0+s7QtqEarkF3zwp7FU9k2b1awc0
 yU2MNMZYAe6gm3dolhfP+dw8Zh1g0o7vkwtXkYm8LO2QuWVwFFFJXtRrkr+W76bTrwhj
 mh7tP9xBjLToOTm8fpUyKb4/SZpiADGWhm+sVsWHOPfll3NiaCgXwPN3W6M3j4nVUFJD
 lyNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ8z2hCk1Vfc/WGvjCssHCJk60giW0osqiyH79O4Pbsaz4Jq42iE0MgTnG4M/xzsWI+uFQ+KEGzQ==@nongnu.org
X-Gm-Message-State: AOJu0YzMhrtPhVkZPl6OW0plqWPe9v4noFkaQQ4i4rY1KJKaLBv5Dd2N
 3M8TcVadCrMoc4zn73JW8zV9H2BD0QH5rr3okautod4ukf73Zf6t2iR5TBsacgA=
X-Gm-Gg: ASbGncuCvAvtVq+3gp8XiP15Uue/kTdSaY2mLiu3HATr9BrXT528aXfSxfLZxVYRtiJ
 B4Yj8kJttLQLDRG6JXNoWl+JRo69eFVJTdAj6NMvg2tUIP7cPcijQf/yKx4B/tfDaerEPhgMHKe
 MPhLI1xqhzbiFJLeicxylGx+UNGw+7nfj+an4MgFxrxa0tyv5LmyoZSOJiydG8paG8JQGUInmkD
 4BPcKoTTpuXt+MR9Gv7nAL4NRobDPoMByIjLyxtdrP1b3bEskeWWFddvMxXWeLpVLNOEcBWukul
 W5LGQNK/f+GCzNk/voZ1pKrM8D+qgMQCj94F7J1x5Xa315Uh08DO6M/aHAZgq5jTyQ==
X-Received: by 2002:a05:600c:511f:b0:439:43b1:e60 with SMTP id
 5b1f17b1804b1-4396e6df40amr143667775e9.17.1739896011980; 
 Tue, 18 Feb 2025 08:26:51 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43990f53847sm35280935e9.1.2025.02.18.08.26.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Thomas Huth <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 6/8] hw/xen/xen-bus: Reduce included headers
Date: Tue, 18 Feb 2025 17:26:16 +0100
Message-ID: <20250218162618.46167-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: v4afiUI6rf+a

Have "hw/xen/xen-bus" include the bare minimal set of headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-bus.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 2adb2af8391..bdbf1ed6fd0 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -8,9 +8,10 @@
 #ifndef HW_XEN_BUS_H
 #define HW_XEN_BUS_H
 
+#include "hw/qdev-core.h"
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/sysbus.h"
 #include "qemu/notify.h"
+#include "qemu/queue.h"
 #include "qom/object.h"
 
 typedef struct XenEventChannel XenEventChannel;
-- 
2.47.1

