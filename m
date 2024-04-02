Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3990619ejv;
        Tue, 2 Apr 2024 07:27:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUt1hxpYnnQuMLXFFopZZPh3zCeae5qGR7+/Bhkdu+ZFYjYoiD3c1TSnkFagFsTj8cKR2sdwy1C6+DGgQof27k40Dytd/sy
X-Google-Smtp-Source: AGHT+IG5M+THCI/4dIGkRzxRQUDMrwq2qu5SDtR7g+PB2BXkKCZC0z/YNYMu5TGz+7eh2erVDeo6
X-Received: by 2002:a05:6871:68b:b0:22e:8a63:8f99 with SMTP id l11-20020a056871068b00b0022e8a638f99mr349296oao.53.1712068056918;
        Tue, 02 Apr 2024 07:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712068056; cv=none;
        d=google.com; s=arc-20160816;
        b=A6eH+Di0XagBXYGw57QU1Bl5/m5k7ARhaBfM8EMJ329Ic/Bi/1/QNbgfTQ5IyDzGjA
         KeEZ8Y4G5vcIUbHfXgNW75yv4BXI5fc9libWg2kERubkCtiB4H+NQqta4uK4sXpityxZ
         BSuvr/PAqEU+aB849K9yAkj3fIcaAg7+6SO75072sAZCKgZm/Z82ze7OE3uDBE0W6KHv
         jEZlEX6V63C0FiB1TXPTcXwoD9LVO82wzRp7I/1iCYzvHaaaZ+tFrFBBec4Wf2BScYY0
         nnYxdfayxRCwVIlFRMJXRrRrpe1lGfCzfRL/js96wwcIylwdGA4TTlzycEbREqqJTFr1
         iSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LJR+J0sIff2Vu4D6kvT0n6WHFLydqkfqEpFRyA0c+dE=;
        fh=Vxl+HuGuyI3pVFg0Ry3NWKzJPpueDwaci3X8Dy/e8P4=;
        b=sbzieXObahwXkmIXXTt7t2Hz+M36m5KBouqyYgVlc0DKQJoT4/y9CTf74+5kYBWd2I
         KcNfE5Csq+gE5GoeGHun9csckjCnsr6nhBNgXgchWyAeq1tFAdFXEGI6rOD4Gb9dEij8
         qryX5aWx3vTSUUvoOaGie8CLUvdcgqsAF6isDA/34wgGputeTb9Oi9Ma3lyyJKqx9owW
         GMAg9tz5rD+350UtxY/htvSYXZNA3iOm9N42S2uxgTboxoBSkUeLc0quIgirfk/SXIGP
         /A72/lbaq1NF7jrKO41qdsNj63suLev+3OFn4iwQCUTewj9RGLvrWXQc18r0dt0pE4Lb
         e+iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTjwvD7j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020ac85f12000000b00430d8e8c0c4si12445832qta.446.2024.04.02.07.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTjwvD7j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rrf6k-0005Sp-UH; Tue, 02 Apr 2024 10:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf60-0003KL-2u
 for qemu-devel@nongnu.org; Tue, 02 Apr 2024 10:26:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf5q-0000Sa-ML
 for qemu-devel@nongnu.org; Tue, 02 Apr 2024 10:26:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4156c4fe401so10376645e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 Apr 2024 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067968; x=1712672768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJR+J0sIff2Vu4D6kvT0n6WHFLydqkfqEpFRyA0c+dE=;
 b=pTjwvD7joMHBtcGP5BstWpq5hNCUhEJAu7/qNNsKlOAshUYM0cEPMpxbEM6RAcovCa
 TRg6E/xG6dpY1uNg1bdvgEWLZhcFvxBa+5NZ9AcilXqccbkIhH6fpo2lVJC111aD/PTT
 RXQiVuoXALFg7iGbUwT3CHmtVkUsPky8zrX3RvNNQi83my6LrgKK5LfIzVET5VdHAP/v
 n0vtG5Uso6Zw2/EqxUlmhNk79C9tR0Q/2eKxEOo+55dZYDJDW75X/YwzGJZaIi/vt8Mg
 rs+pS067Lq9FUulYRekOBOG5hCAVjfb3AwaizL1mLi90wTortpeTTkEiCzu5r1SYKd3N
 ntDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067968; x=1712672768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJR+J0sIff2Vu4D6kvT0n6WHFLydqkfqEpFRyA0c+dE=;
 b=o8ngBz3deOyu/gm58OkHLgU4haLqTwclD14b9BnLZcposBRaZP0CFPYhBv27gxdUCf
 GRtptBIottt4mT12k9hbENOBqKfTabBYVkoG5KeHDMYLd3YPbrAFQtXPwphxGeJAGqhh
 +MV87nPHjj73lj/3cFza3YRWRwPqKBZtKp1xD4LNcSjyU4//LXxAFsbzVefUTCfr3wnU
 nD6ZovscXl+9iOoUyIj03mwtslV5KF1nRbldDOVafTfIygpjKcz1J4xTqmHW5NJjdxyW
 TPD/xGIcGwERCuX+XatyJQejE8QcVxYz3d1a6dW0Kl5lkuwUYi/QODIW4i01a+5zLJyU
 TpcQ==
X-Gm-Message-State: AOJu0YwQ+3DSMRp56COqhsE3Th2FRbwBw5rFVzd6ha4EB0AOYKOzQSok
 Wu/cIVdOHYDJc5CXIuE6HO3gdHfOaXWzr0jBRY0OYm+gceYHci8Q3nW0SlM6cK8P/thPzbbbfx7
 ppWg=
X-Received: by 2002:a05:600c:19c6:b0:414:132e:b485 with SMTP id
 u6-20020a05600c19c600b00414132eb485mr10180645wmq.27.1712067968445; 
 Tue, 02 Apr 2024 07:26:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b0041486a6f9fcsm21378049wmq.37.2024.04.02.07.26.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:26:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Artem Chernyshev <artem.chernyshev@red-soft.ru>,
 Oleg Sviridov <oleg.sviridov@red-soft.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 14/15] hw/xen_evtchn: Initialize flush_kvm_routes
Date: Tue,  2 Apr 2024 16:24:29 +0200
Message-ID: <20240402142431.70700-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: LW3ewMJ8l71o

From: Artem Chernyshev <artem.chernyshev@red-soft.ru>

In xen_evtchn_soft_reset() variable flush_kvm_routes can
be used before being initialized.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Oleg Sviridov <oleg.sviridov@red-soft.ru>
Signed-off-by: Artem Chernyshev <artem.chernyshev@red-soft.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240329113939.257033-1-artem.chernyshev@red-soft.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/kvm/xen_evtchn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index a5052c0ea3..07bd0c9ab8 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1097,7 +1097,7 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port,
 int xen_evtchn_soft_reset(void)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
-    bool flush_kvm_routes;
+    bool flush_kvm_routes = false;
     int i;
 
     if (!s) {
-- 
2.41.0

