Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp495171lfy;
        Fri, 21 Aug 2020 10:42:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCwS4VO32FEA3AG7d6fjmtAWpxkvVH6TWFLLBBOeIiYV9/H87scATy22hyf9mYoUwULJIJ
X-Received: by 2002:a25:d209:: with SMTP id j9mr5323579ybg.205.1598031747723;
        Fri, 21 Aug 2020 10:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031747; cv=none;
        d=google.com; s=arc-20160816;
        b=iUb36fAHuLq5NusFpMFg4fLpWwinYi2f2mHkgM0nsXxEETrL+Zfry5LlU6cBmqLZNh
         SEmZdJq4IjJ4ykxR3eGtOBG7Yw6a3MLYYPljsWiX74XnlzQjGFfzZPjCTjK48AZKIyvW
         J7CzgxqW4em/JYZSUFBr+U+f3aaAO/r6L0FD8t6SnMLjz586sUwQw5Zzcx6y9hHmibtI
         u+bfK2C0PLKS/R2+6WBjvvHFusHf18R1d9A5FCFYRqXS+qxRh3awboiT5YtuDxqMS8zY
         RxCIqVxQ9llri4ja8In/mWf9aoA64pYnwrld/9qjLmJ/Y9GEYs8fEvsCY3+SgQdA1309
         m4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IZ0mmUXtbJnn9Ui7y/DaJV/VanYdeWJm2wImQIUXZuc=;
        b=Kq9h+NFIeNulSblJdu9Ur6J+g0JAanrmHB/93hPX2KTSE9U8XCF/u4CabePy30eAko
         MOI/ig6y0wm9Ic7uZ83i4wKI4AOnfQZxWlwdiVYyS9X0fwhyt4RrFUN5HB+/znSqt+qS
         N6vByU+ADzdsFGAPNak4Wb2Tj/DiW4eA8uII5nWdWSJbNnEbxe4VcMIIsCCTjgVX/NMs
         cGOEUknRnAFDELwmIpuLSpaBshtn57uvxqyZYgyW88GzHb8DnDVi+sphqvNQOr5o2pcW
         Z+do+EkznLZI2FMozVYegQaasUs2Fc94AhINQ/NZmlHbrWeHFBzieFIZ9ED+/7Uh1FxW
         iyaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aS5vlcL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e128si2923603ybf.298.2020.08.21.10.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aS5vlcL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9B3b-0007S5-3e
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArS-0001og-5h; Fri, 21 Aug 2020 13:29:55 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArQ-0001G5-Gy; Fri, 21 Aug 2020 13:29:53 -0400
Received: by mail-wm1-x342.google.com with SMTP id t2so2399504wma.0;
 Fri, 21 Aug 2020 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IZ0mmUXtbJnn9Ui7y/DaJV/VanYdeWJm2wImQIUXZuc=;
 b=aS5vlcL8qehB+U2J50NH4eZyAOfZ+PhXUR22+pGkmktPjbaysW9ylCWg03AEvurp8v
 kYwbN9TDynqtBc4Zpg+9K6l55Hl5oldB/jP/4JqN7zRn2unptpoBaUAni7ucYd7KsN29
 qmqSj/ykYwBOUdeahnwj4Y9QPta4jCWiTewboU5tGtsDxlXKCSTZfhZWWvx3vTjFnIGP
 LACFlNhVRnPyJlUX3jqMZ3W9m9AeFUIpuWgHWPdNRv1sRLfTI510aX2oxsFk5aqv1R/p
 v60C0i7HdsRRr4pLYOJl638AO4TRZ0ONhhgKfsKc6eZsprz07fKWRAZI5PK4cxNFtvV7
 kMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IZ0mmUXtbJnn9Ui7y/DaJV/VanYdeWJm2wImQIUXZuc=;
 b=Wj6Uk75awjAKBxNF/UpVLhgx4bdxvic/o7ivsAAaFVa9YuDuKY+K9NS/11GK0K+aj0
 oUtO3eQjoUQJ4LbET4okEIuDHZHsU0hw80KGS/ce5Umada1wobauq2pPn5Pmy+WDB6A2
 4tinVSL0A3M2nxnmrwUQmRt9rssiqQbIVax1fkD5tO1L8gje8LK0rWorvdiL9CW16Fpi
 H7mzXCefOXoR7NvmxF9WHFwMuk2r3K92yhq6M+F3sPK3SBkLbCt2E/8RKeljfHZH63YU
 MWcEBxsf3KW+BKLzSl+VHBlHcNfUO3fKBtNJO7rKb3qSpRcUSLA25Ppcf+Z8FVSpdRfg
 ZSug==
X-Gm-Message-State: AOAM532t89XjvOGMdElHj/uarYCXNskXPcG2g1QwNL49NoB19XjH+/aT
 JAXfx/G9W5kYy0Pa1Cxaw3y+jFxjcEc=
X-Received: by 2002:a1c:6243:: with SMTP id w64mr4079410wmb.3.1598030990045;
 Fri, 21 Aug 2020 10:29:50 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] hw/sd: Add sdbus_read_data() to read multiples bytes on
 the data line
Date: Fri, 21 Aug 2020 19:29:13 +0200
Message-Id: <20200821172916.1260954-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lwxRDThlA5Bv

Add a sdbus_read_data() method to read multiple bytes on the
data line of a SD bus.
We might improve the tracing later, for now keep logging each
byte individually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200814092346.21825-7-f4bug@amsat.org>
---
 include/hw/sd/sd.h |  9 +++++++++
 hw/sd/core.c       | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 3ae3e8939b3..ac02d61a7a0 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -184,6 +184,15 @@ uint8_t sdbus_read_byte(SDBus *sd);
  * Write multiple bytes of data on the data lines of a SD bus.
  */
 void sdbus_write_data(SDBus *sdbus, const void *buf, size_t length);
+/**
+ * Read data from a SD bus.
+ * @sdbus: bus
+ * @buf: buffer to read data into
+ * @length: number of bytes to read
+ *
+ * Read multiple bytes of data on the data lines of a SD bus.
+ */
+void sdbus_read_data(SDBus *sdbus, void *buf, size_t length);
 bool sdbus_data_ready(SDBus *sd);
 bool sdbus_get_inserted(SDBus *sd);
 bool sdbus_get_readonly(SDBus *sd);
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 9c2781ebf96..957d116f1a7 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -144,6 +144,21 @@ uint8_t sdbus_read_byte(SDBus *sdbus)
     return value;
 }
 
+void sdbus_read_data(SDBus *sdbus, void *buf, size_t length)
+{
+    SDState *card = get_card(sdbus);
+    uint8_t *data = buf;
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        for (size_t i = 0; i < length; i++) {
+            data[i] = sc->read_byte(card);
+            trace_sdbus_read(sdbus_name(sdbus), data[i]);
+        }
+    }
+}
+
 bool sdbus_data_ready(SDBus *sdbus)
 {
     SDState *card = get_card(sdbus);
-- 
2.26.2

