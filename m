Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp647245ejy;
        Tue, 21 Nov 2023 09:41:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY+s7S+oDQPj5R+UdjdIPgkY9JFHZLZhKbUXUEJ63frdhR4cYDyDGp/d1s/q4UOOdxdp+o
X-Received: by 2002:a05:622a:7:b0:417:b269:4689 with SMTP id x7-20020a05622a000700b00417b2694689mr12843870qtw.53.1700588485849;
        Tue, 21 Nov 2023 09:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700588485; cv=none;
        d=google.com; s=arc-20160816;
        b=EVu5ROoIQ/WKGYs7dxddbWgjnrhERQcrTT2SUvIPzTQ54itfGnF01mzPK7ylAATxKw
         JRmMQy89KojHFcgLSan7TMYeHafRVK0Feio+Ql0vKOGArGhXgjqJlU7QgQqKsgFlZAw7
         0JNBCntcIbEoZeKUjTe1Z1jD6fWzZemWinCN8L/0gM5R/eA9VtVNRsGlG7f3Ng2XpJ/E
         SGklCInyQeDSU5o0WxcAE7pnz1sTQoR7KQcDDv7VetiElyLhahqi+lJjrFyn5ZlQR29d
         YbbvbbJ0TUx/YKdHVQzNx5XDEp08ReBElzbTx7pOE4QIzgltoqPcKH6vMTqmtTtFigAl
         hP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3gZmZAr8kYS7gDEfj38KOIHMYLXNb4HUKsj/RIzSduo=;
        fh=cL0kZojwLp2/+GG3A9WvbPyWHrvsxnhr8acLawhZl1M=;
        b=jCYA5UyEYl+T4h+BHweZQdi6uiEdoqsp3sEB1DXGcCw2QhSaKrFMSDQ9frVQ5kl0pB
         3qCt8xYC9b1ZPQ7xMfQ4PnsuoS9gB+UXFa9wifuc1BkFcie5hxy4Nc2o9F+eejXiu9zw
         iKNIamNGQ5BpcwZKEXLn9luCUsyYO/UqHBy9krUun9J4HRMNoMY9IbjWRJo7i3N7gQSI
         BRGyzho/W8czeMj8jqOTSsFEwP1UhEuk6ymfC6WKYFbKl79VHkI/evT1Hus5jND7l78n
         Y6x0UwTjVP1EHGeJh2dso2z5j0Ut77AKNr47rUOoNWzuKVc+5q4hH2SdrZqBOYOStc7c
         8fqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dVISFH7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05622a188800b0041993fce7aasi9807707qtc.94.2023.11.21.09.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 09:41:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dVISFH7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5UkO-0008E0-QC; Tue, 21 Nov 2023 12:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5UkO-0008DV-3I
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 12:41:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5UkK-0001Fq-Ir
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 12:41:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32f737deedfso3730980f8f.3
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 09:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700588471; x=1701193271; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gZmZAr8kYS7gDEfj38KOIHMYLXNb4HUKsj/RIzSduo=;
 b=dVISFH7i4vWRLm5MJo0BMF6C4zd0M6+80ab3QY/OpMuxVRV7GOihYzV4xrz85dNMay
 JaFUIUnKnxQbPEBO90p3AUAXCCYFsJ3+qFKr455/MiEUCIyJ67S4dgDu2PwKEHqpxzLn
 D2vHJfYOcu9Z6BQiCHKO95jE9b/SBsfyY7pHBw1egPvGGr/icfpOnRLESzfRr1eF7wuR
 SdiuByVoQWhZWqneEMvpkGdvUAyIinlJ5vSMOAcIzFvZlmB8Qhn5I7KmvqV8yzHKTjRe
 7K1mF05LBvM4acwNmYLUFDlitCQ8pIsuSlABNoRy0BzQ2e6cYr1vbpfATD7slWCJF7x1
 melg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700588471; x=1701193271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gZmZAr8kYS7gDEfj38KOIHMYLXNb4HUKsj/RIzSduo=;
 b=ks3a93MKuvC6Bf+5B+a9lLXU+nCW2XRDsEa4wUmS55nm6ku0huUCT4RZvJ27FAMELG
 uDfmu7+s7c1lHxK4N+ghQ8pgq1UxHJEd7q2JsSksdnLzQ2FO61XgwzbCUe3B7GQMb7ZW
 FmoUDNJDpL16sUsmCadlz/dLu+X2MHRrabAUkWxLZn6xa1Vnp+b3+NG6GtMzigGtDALp
 TfQQU5is1PYN1fSf8qr4un6xQ7VGq9TYigvMvNNLAVCowF1Zk/M7XQ7CKXuhOjqvbLde
 J451uiFBp5z8SQsQqCf06wBcJxkEUwD8TQZ9fp3XHYESvXTz4ZSBe7XjSLCipb0lXaX2
 +K2A==
X-Gm-Message-State: AOJu0YyLaP0+6/JK9SHbuvcEZR22oF/e6IoyDR0nVgIGuh2AimTXTLMm
 Fhy7whO+jmYKVKd8DNEXUQDvx3bk3EI/+eV6R8w=
X-Received: by 2002:a5d:64ec:0:b0:332:c9e7:3d1a with SMTP id
 g12-20020a5d64ec000000b00332c9e73d1amr4672410wri.62.1700588471330; 
 Tue, 21 Nov 2023 09:41:11 -0800 (PST)
Received: from m1x-phil.lan (lgp44-h02-176-184-8-219.dsl.sta.abo.bbox.fr.
 [176.184.8.219]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d6a05000000b0032d2489a399sm14777400wru.49.2023.11.21.09.41.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Nov 2023 09:41:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PATCH-for-8.2? 3/6] hw/misc/mps2-scc: Free MPS2SCC::oscclk[] array
 on finalize()
Date: Tue, 21 Nov 2023 18:40:48 +0100
Message-ID: <20231121174051.63038-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231121174051.63038-1-philmd@linaro.org>
References: <20231121174051.63038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xlOcT6wXXwT8

Commit 0be6bfac62 ("qdev: Implement variable length array properties")
added the DEFINE_PROP_ARRAY() macro with the following comment:

  * It is the responsibility of the device deinit code to free the
  * @_arrayfield memory.

Commit 4fb013afcc added:

  DEFINE_PROP_ARRAY("oscclk", MPS2SCC, num_oscclk, oscclk_reset,
                    qdev_prop_uint32, uint32_t),

but forgot to free the 'oscclk_reset' array. Do it in the
instance_finalize() handler.

Cc: qemu-stable@nongnu.org
Fixes: 4fb013afcc ("hw/misc/mps2-scc: Support configurable number of OSCCLK values") # v6.0.0+
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/mps2-scc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index b3b42a792c..fe5034db14 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -329,6 +329,13 @@ static void mps2_scc_realize(DeviceState *dev, Error **errp)
     s->oscclk = g_new0(uint32_t, s->num_oscclk);
 }
 
+static void mps2_scc_finalize(Object *obj)
+{
+    MPS2SCC *s = MPS2_SCC(obj);
+
+    g_free(s->oscclk_reset);
+}
+
 static const VMStateDescription mps2_scc_vmstate = {
     .name = "mps2-scc",
     .version_id = 3,
@@ -385,6 +392,7 @@ static const TypeInfo mps2_scc_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MPS2SCC),
     .instance_init = mps2_scc_init,
+    .instance_finalize = mps2_scc_finalize,
     .class_init = mps2_scc_class_init,
 };
 
-- 
2.41.0

