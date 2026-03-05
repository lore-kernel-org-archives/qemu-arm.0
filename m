Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237E5F513E5
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:10:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGsz-00017G-4i; Thu, 05 Mar 2026 17:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsr-00010S-44
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsn-0002EO-PQ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48371119eacso101041315e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748564; x=1773353364; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2tDkacrofsQyynIL5aV6S8J0KmjfmKGV0MBvFQ9/O94=;
 b=RzWWzYSEQsXVw8WNGlmj6y/P3UK2Yrikma5ztfrudZ+2t2VQoQkvBEo0bJXjN8yL5e
 7mDAjh3eqAAgCw5B1MueTSJxeN6lCk9a4+vl4C7FPZXsE7YLHB8xvOB82/pRKvq7iwWP
 7P7TEMNm4E+B7Iq0VoUS9JUN9PU4mEZPXetcfydCPV1QXerSDcCEDFAtNGkFhK1JT9OA
 Dy7497elVmJERMmX72huhhljZ49TEH8JXUxB3NAgViUBLvg2JuclL9Lj67YE9EDsgLa/
 X+/NIxPtssd9HXRS1Y9RmZM87E3ymtYqn/BskDsdzsy7FBq/v5lPJ5qZXaX9J8kp1UG+
 qpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748564; x=1773353364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2tDkacrofsQyynIL5aV6S8J0KmjfmKGV0MBvFQ9/O94=;
 b=RTVKWrXDuRrw2Td17dHc7hXoFG6xMt9ldi/nzUwcoLDG+XI20knVUJHaDSw6tbIhpO
 msJHikTH1uYykKGBZDt7OesZEzUmKbTQZaOscIkXAeSFchES1QOs2wwrdMVh911s94/g
 y0TcoDVKErr6qih2Ch//HnlBsuRl2Xn8hFBECPPiHbwQwCTsmCZ8o7a4QnY6lpUE6YDP
 h6nBB3dGGQcWUn0Q0p1dpN8vAzw+YLp+UnT02/iQfV9vowzukB0y5+a1KAOGxDVf2qIr
 82YgHwK+B6JrbmEmn3FM32+qzG5k1sY6bDbZK7QFfafVTrfrUev0maFahdtIBXDCyvMc
 kKmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrPbKS4nLKFsC+DvigWYp4zcOHWHHF8WGHwhb49NqvfLF/SVxDAj7EAggo1I1ZL4wkKqakhYMvzQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw3pphc4h4wlg04JqSqh/0qDFiWJFJChd+iAmAZzoSDp7YU3JOk
 +GFqpqmdIll9NDHZxVt1QLE0F6HhiDs46D6tj9D3ZMY1mw4yJvBhJGYT
X-Gm-Gg: ATEYQzwJfQ1g1U1Cwg0CVkZmHrbgelJ1GkEWbxKvtHzJNgXBMuVpUjsjPmfYwdPsxNF
 K3VOlXJH2fFlYiR9Ymzr/PwB97JkFtiNjhsGi+Dn8y5HCwQC7DVZwK/QUGIl8HBbao4qRHQpL+J
 ttWwk0GoIJYLZbLJkJ2KvtspKbIZpVHEidEAeGouRF4q77HV+ejvOk00NMrCYkOBYXrJN2yzYH0
 hpF25qFroPC0pn1QPtRcosZPCOZJUWe7fN8WfBPucMS2oLzn3eOv66SDN3pf/yGKIJNKg2Za9Y7
 hgVhb4SXvDt0kb+avrJXG9nOidxVCcbndv7lurZalMmwJCiY570KEGU0H+cXx6cXzH1hUJuoFal
 EHJBzMHdVz6GTEaJzGcoYoNu/5kCH/tLPy0tEhjV8crfHWUSl0dkmzWRSTsPNnH+YNL4AtF6EXV
 Qko9MWuI2gcIvFLIuNUd+s2YZMJU6ixUbAAG8BcP1dryYZ36Y1/Udg5m9iUXMBkUrtOQ9hXfWFa
 uOc3uXZsWefEiueEUjuSAdHBL+EeWZsM6Mey2zpkfFgZUI=
X-Received: by 2002:a05:6000:400a:b0:439:cbf7:2545 with SMTP id
 ffacd0b85a97d-439d725bb81mr2301794f8f.43.1772748564169; 
 Thu, 05 Mar 2026 14:09:24 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:23 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 04/14] util/fifo8: Make all read-only methods const-correct
Date: Thu,  5 Mar 2026 23:09:01 +0100
Message-ID: <20260305220911.131508-5-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Allows these methods to be used in const contexts, i.e. where the parent
of the fifo itself is const. This is in particular useful for Rust code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/fifo8.h | 10 +++++-----
 util/fifo8.c         | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 4f768d4ee3..6b476b404e 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -71,7 +71,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
  *
  * Returns: The peeked data byte.
  */
-uint8_t fifo8_peek(Fifo8 *fifo);
+uint8_t fifo8_peek(const Fifo8 *fifo);
 
 /**
  * fifo8_pop_buf:
@@ -181,7 +181,7 @@ void fifo8_reset(Fifo8 *fifo);
  *
  * Returns: True if the fifo is empty, false otherwise.
  */
-bool fifo8_is_empty(Fifo8 *fifo);
+bool fifo8_is_empty(const Fifo8 *fifo);
 
 /**
  * fifo8_is_full:
@@ -191,7 +191,7 @@ bool fifo8_is_empty(Fifo8 *fifo);
  *
  * Returns: True if the fifo is full, false otherwise.
  */
-bool fifo8_is_full(Fifo8 *fifo);
+bool fifo8_is_full(const Fifo8 *fifo);
 
 /**
  * fifo8_num_free:
@@ -201,7 +201,7 @@ bool fifo8_is_full(Fifo8 *fifo);
  *
  * Returns: Number of free bytes.
  */
-uint32_t fifo8_num_free(Fifo8 *fifo);
+uint32_t fifo8_num_free(const Fifo8 *fifo);
 
 /**
  * fifo8_num_used:
@@ -211,7 +211,7 @@ uint32_t fifo8_num_free(Fifo8 *fifo);
  *
  * Returns: Number of used bytes.
  */
-uint32_t fifo8_num_used(Fifo8 *fifo);
+uint32_t fifo8_num_used(const Fifo8 *fifo);
 
 extern const VMStateDescription vmstate_fifo8;
 
diff --git a/util/fifo8.c b/util/fifo8.c
index a26da66ad2..cc4f590b7a 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -71,7 +71,7 @@ uint8_t fifo8_pop(Fifo8 *fifo)
     return ret;
 }
 
-uint8_t fifo8_peek(Fifo8 *fifo)
+uint8_t fifo8_peek(const Fifo8 *fifo)
 {
     assert(fifo->num > 0);
     return fifo->data[fifo->head];
@@ -157,22 +157,22 @@ void fifo8_drop(Fifo8 *fifo, uint32_t len)
     assert(len == 0);
 }
 
-bool fifo8_is_empty(Fifo8 *fifo)
+bool fifo8_is_empty(const Fifo8 *fifo)
 {
     return (fifo->num == 0);
 }
 
-bool fifo8_is_full(Fifo8 *fifo)
+bool fifo8_is_full(const Fifo8 *fifo)
 {
     return (fifo->num == fifo->capacity);
 }
 
-uint32_t fifo8_num_free(Fifo8 *fifo)
+uint32_t fifo8_num_free(const Fifo8 *fifo)
 {
     return fifo->capacity - fifo->num;
 }
 
-uint32_t fifo8_num_used(Fifo8 *fifo)
+uint32_t fifo8_num_used(const Fifo8 *fifo)
 {
     return fifo->num;
 }
-- 
2.53.0


