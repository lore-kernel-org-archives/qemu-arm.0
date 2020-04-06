Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4256872lfi;
        Mon, 6 Apr 2020 11:08:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypIuSktOtQvMedhsDeISbeVN4sNG6kvcm7236t48VmV7W7n9fM4MX6S21/tZt1t+t9YmpWix
X-Received: by 2002:ac8:2dae:: with SMTP id p43mr698456qta.341.1586196512741;
        Mon, 06 Apr 2020 11:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586196512; cv=none;
        d=google.com; s=arc-20160816;
        b=Kcj4C8XYAECYRqd4FfR/YKsM3vQVQstzZuNUaKhM/O7T1l1vAvEc7k4cevuAcvIHow
         EhCOPKe8PLDI0Djdp0tWoCTsyyQhiT7+klb9R6mIDAFyGQdyn8NVdFLcidkK/msX2Ysn
         8m04H7G3BTi5MhZDE7phxIpau3qd3l4f5IOUTU7XKLJpaPNx0VjhN8k19yV38/yq7/sz
         To7NRXkf7PgSfOvkTriaRr0uKIgI3mYhfSdjVF3Avjvjg2Gg3KGDWDbhCmY7gtSTIvvq
         D0uOJu+srmMjQNX6gslg2RzaxNvhmUbSwQuql11faHTyQgIb73P8u9lgW3lumNHzXqu6
         TKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=m8ZDXiD3nFiP7GdGwQTV0ex2VskQyj/RhxvXu9V538w=;
        b=EtBKOwoVa6Jtfk3fO7VvMSLHDmj9MMlnGVbiEF6TwCvmXZ36Y+/3UpqXAUeVBPErLK
         Y/s2cbGdQArX+wIPmBr53cmKWexkyxD9cyr9+bva3NrGNOCImsqN6fiE7phb2a1WSXYH
         QJ42B6W/Uu+ncA1jR4jSJRWj3+AATw9apvUBzXsJ9t3OSMruEGBJwXoQt9Lh45BOW/tz
         z4QCcrK8ed32cxrOJbCFNYimTkfDDxWl+5qBH30BzP9bxHBgAGRtJAqJk5q/lcPh/zQy
         q4UOmYSCYRJi67d7HcH0atZEIl8TmJqB/TCl0S9VjU5igOr4MgjZ7Ag6lD2QbvxdEwUB
         elOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TvxZBwwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si303936qki.324.2020.04.06.11.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 11:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TvxZBwwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLWAi-0004YV-6J
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 14:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrP-0002TO-KF
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrO-0003MI-Kl
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:48:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43407)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrL-0003K0-Dq; Mon, 06 Apr 2020 13:48:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w15so466654wrv.10;
 Mon, 06 Apr 2020 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8ZDXiD3nFiP7GdGwQTV0ex2VskQyj/RhxvXu9V538w=;
 b=TvxZBwwefg4HHk3RUrVE3aZGsrIn1V1rTbJ7ColaRUt8eLxVII90ZDOLWUwkFFOjxI
 5jYM5csNiGm2Ao9A+Q6LgkrOfFMt7v1g0irsmFIXHo+sVFinIQJ9PaNvrYfCh3nWwVee
 SIAa6tGLCOc+XMZS8bnOH5RzHk8j8Zt670rSjDZ2ZEkPdwOyIY8KaJrK1jJdFpVoCAjL
 MjpRZ6QKuuPmBEG5yY7N7zNe52uv5/6Hd80jvqLGw3KQ/rtGoAyuh1t3Te7LSh4K8lNP
 pTLaS2is9oV8HyHgxQZPMhKfGTL2Gp9Bri7IAfiVlnbfBB0YXtINjYipEZl4BSDZt0R3
 rW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m8ZDXiD3nFiP7GdGwQTV0ex2VskQyj/RhxvXu9V538w=;
 b=UcqYI5BwIGInFfhGEvRredSszalwtaAQLmB5M3qZccqp7z88wOyIj0unGeEH0pjkFz
 jZGQZcOqvPaw0X6S42w2pWcgg4UJZ44K0wYEoTcUhnPjpZ2iaS5Gu8rQXflyDkEBPI2Q
 IIVqoyLeFssWgt9aAmBXl1TD8OZmwsaUs0dKkPI+pHDSEnsyvWfS8wNRcU63+itAw1G5
 Ap4tJmjzLcmdJc3vffxTZgMggJq/mIS3BiZ1QxUlnYn2Hu/QBkD3iboUOkYSAf960rYN
 Ag2t4Ma+VPFuU/XhHWf9X00wbCMrk+vS0RLsr6OEW5fPxkMbAVQqkyVyGRrJ3rpK2R/C
 e3FA==
X-Gm-Message-State: AGi0PubgIVgpiDi+AQIVSQdMtKVNVVC0JVIJ62ulZUrVVlppNVCmwWoH
 7DU8XO3QfhJDcHdV3keYRCZ5ZWzMM9U=
X-Received: by 2002:a5d:6104:: with SMTP id v4mr359734wrt.213.1586195310312;
 Mon, 06 Apr 2020 10:48:30 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 32/54] hw/arm/armv7m: Add missing error-propagation
 code
Date: Mon,  6 Apr 2020 19:47:21 +0200
Message-Id: <20200406174743.16956-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mafIjbHi29Ey

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/armv7m.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 7531b97ccd..249a7605f6 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -168,7 +168,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     }
 
     object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
-                             &error_abort);
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     if (object_property_find(OBJECT(s->cpu), "idau", NULL)) {
         object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
         if (err != NULL) {
@@ -256,7 +260,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
                 return;
             }
             object_property_set_link(obj, OBJECT(s->board_memory),
-                                     "source-memory", &error_abort);
+                                     "source-memory", &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
             object_property_set_bool(obj, true, "realized", &err);
             if (err != NULL) {
                 error_propagate(errp, err);
-- 
2.21.1

