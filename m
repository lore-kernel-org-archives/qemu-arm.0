Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2224917lfk;
        Mon, 25 Apr 2022 01:53:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsvjdBopUisS07FFsHxX0nIz2F7yA5V8PBsmvrj4pzuTw6NpUU7dSOaonhs95IM0qYVXu0
X-Received: by 2002:a05:622a:1985:b0:2f1:f346:59b1 with SMTP id u5-20020a05622a198500b002f1f34659b1mr11144441qtc.140.1650876799495;
        Mon, 25 Apr 2022 01:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650876799; cv=none;
        d=google.com; s=arc-20160816;
        b=Hsfo9QQvZIVnxQhQ984aglQlmq8uI86kQOBQUVOdHtiTJDi1dd3ne1GJF5gBoIkjNJ
         bswMLxZRTBjC1DCSthXb6FWYxKWDDrBwDAfGVKngVLcFbEX8wm0ifq76pBitOfu6RgWz
         8WgrGCR7k/Hf4I8rl+bay6fihY/CqlmMrA+rRpDDy9kpA5dFaRRVUX0B94+Q8x9xD59T
         fqDg2GyVjU6GrVDif39J/GxxP/MqgrE7lszLzn7XMi7ctyvQ8kz0137jSeyruQI0Z3r2
         /YMc4sQIpNIE7biUpIjlol+Ta264uCIm9djE2EmPqmlOm6nJX6MESsiTubpcoekteqmf
         6Thg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=u73kz9B6wJ0lq4eD98kOBj7vDwMC85uO0URBzEu5tl8=;
        b=GScopZKUpVCyMbD6BHD4nBZv91WYu3Xj9m1bNhInb1ElwEkNGwFnTE0BAOlCO2AhI9
         hZN/0k67+q1mXkJiSW6WgpTiEf/upi9K+m/V8DOf0eD8KiCkwg8eRChBOYgh9eA50RPb
         rUNYBBBN8+KstS2pFrky+SccDnEYBh1107eLMNK/s5XSDljbeRRQPDGDKtRexyNpw6fC
         Ql0ePgcvftiCYy9wEStbXH5qT3+WxHsjBGqIN943F4cFzqAs8A4aWZeUvySqXuYfH12o
         fSTSnpMCUUtQbe6fiSFOsrOhjrr7fpw8heamr8onUfcJp7rQ1wu14RS9fT6dH4hXy+f2
         xctQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GeHAeYS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020a05620a0b1000b00699aa123d41si3820722qkg.611.2022.04.25.01.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 01:53:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GeHAeYS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1niuT9-0007De-0M
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 04:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu09-0006W8-H9
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu04-0002h6-Eu
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u73kz9B6wJ0lq4eD98kOBj7vDwMC85uO0URBzEu5tl8=;
 b=GeHAeYS62WVWVUA2VMN0rfxETT67hqkldbWJd505bjpET3fBV8C86szc9i++nRwz/VL+v4
 cr1/mTUzP6EkL8UC9cNnXobn9rsUukOyLq+WJcN+56hU9UjLv/LtrfYXS7VCz1K2JdBV6H
 cWEWopm5s9rqP+u6q1PR0vDGCBj2aog=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-JB4t6AnTNt-X2zfiR6q5oQ-1; Mon, 25 Apr 2022 04:22:06 -0400
X-MC-Unique: JB4t6AnTNt-X2zfiR6q5oQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i66-20020a1c3b45000000b0038eab4e0feaso6451929wma.9
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u73kz9B6wJ0lq4eD98kOBj7vDwMC85uO0URBzEu5tl8=;
 b=GoCdWPmyxKUgDFdqJWRUffwgcjvtcUyk4RVT4s/d7FJzduhelP8j4/mxIBUspRBKWi
 +f4kcYVa+/SCVL97dtFiHd2bOtpxv7oUr9yNwSP6MuNLuiLamQxv+Lv46J7ivpQHwYLQ
 mAVueww53yHeXH0eSJQOWbQ9vj58qrazMbRijggH4ecm4V1K9Yfw72ktWe9Q+SvPHnkA
 xu6YRHnwo0hkkbD3ay0TRC5WxfEeOkkpnVu6f0GGlzWMyXewPquDWvsm9bqCKzjn9CXQ
 tp0W51yrM+CRfYErdf5npMhSXIIcq5ojPmfX6JSl8HA9ItdhZXvb8SeIxLEhs61NJ7J2
 fSXA==
X-Gm-Message-State: AOAM531Xlu0WW6DBzx5mDLZbz85lY5Q/3riwfR8oy40rG78GwI6rmFLQ
 +eCMGLv8Epl+o2/BEzi6kV8nSJc5WaAfuUhjL9Xu8YrG8ilyEoHxrIRkqTEXMm756yMweKEBN10
 7Qs0OYS/l3VEVNMQ=
X-Received: by 2002:a5d:50c4:0:b0:20a:c547:454a with SMTP id
 f4-20020a5d50c4000000b0020ac547454amr13706719wrt.16.1650874925383; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Received: by 2002:a5d:50c4:0:b0:20a:c547:454a with SMTP id
 f4-20020a5d50c4000000b0020ac547454amr13706690wrt.16.1650874925184; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 d6-20020a5d5386000000b0020a79c74bedsm8138594wrv.79.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 4EDAE67B1B5F;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/18] hw/input/tsc210x.c: Support machine-default audiodev
 with fallback
Date: Mon, 25 Apr 2022 10:21:53 +0200
Message-Id: <0b13f27f5389d0a75b9e3046830f88fd37de54f2.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D9sUXKZ6cmeP

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 hw/input/tsc210x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index f16a8090b7c7..f0b02bc72280 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -1098,6 +1098,14 @@ static void tsc210x_init(TSC210xState *s,
 
     qemu_add_mouse_event_handler(tsc210x_touchscreen_event, s, 1, name);
 
+    const char *audiodev_id = audio_maybe_init_dummy("tsc.defaudio");
+    s->card.name = g_strdup(audiodev_id);
+    s->card.state = audio_state_by_name(s->card.name);
+    if (!s->card.state) {
+        error_setg(&error_fatal, "Cannot find audiodev with id '%s'",
+                   s->card.name);
+    }
+
     AUD_register_card(s->name, &s->card);
 
     qemu_register_reset((void *) tsc210x_reset, s);
-- 
2.35.1

