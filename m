Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp486842lfy;
        Fri, 21 Aug 2020 10:31:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4B7dT2UFWvvW5LO8/vJhhYRaOGGQBtpzkPPam8x/wPRU+8c0AvUk1Uy5yGizWjg/wS2jd
X-Received: by 2002:a25:1f44:: with SMTP id f65mr5370487ybf.438.1598031093623;
        Fri, 21 Aug 2020 10:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031093; cv=none;
        d=google.com; s=arc-20160816;
        b=hTZ4vJa04R1+Fb2JOE6Iq9wQGFqWx03hqEQnj5HZW6WybJcgLOZ4Fpw0Qv17dfJi+u
         TapRJefxGcVOEyqgZkyFY1HlnpMp+J2qQ25E1kX77G+bwqklJrV0ukIB8GBgFUPl24ts
         z75zAwZLwSmS079XNGKcGwnyERFhnOeK54iYOSjReA5wgCmHb8LYdBAylO+gIQ7Sgmow
         GZ5Ms+gx8nfF9VcMq3QpaDcgcYZ5MdMZJ+g4+rBdS3O7kv9p5JP/WqbIxf1wMdT+GRc6
         0/Uz3jrrCtkqSlBElerjcPSfPUhzBeX8obX0P1d/8CODHGWmMNwoLgS69rLraFyuXpNA
         KqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o8w6wmSgnQZxUMQrLBvgypybp2LPlBahTHmviCZweW0=;
        b=HHVv3qFuVhcdQQHZKqof1VnT221Tj8Sz6cXWmewE/l8FfG2bOz+STKxCllPPMgEd36
         a0wzN4xgMhuBg6DjyBUvYAVnc59TRWoSu3P8t4sypHItPbov+Knq1lwFd3k5249nk0qW
         Sfk+PEUSd2lL65wu32x/J0zPcMvee/2RlaePbp/loIo/1l21uSdzrt/ovUtuJ2+AtCZk
         rllw/uDIu/w9jmi6Dut6myHYVi5gJAqHG6dYCCKio/H13+DLDf7zs/atR+LQJfv0/i03
         CTIfyP0OpEK9sVni1NvqL9yLCtJKq4ojvQGV9POvfwN9SQSTkTo1s+YhvrDICTmcfZUb
         3Row==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EIL+UrZN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si2635528ybd.119.2020.08.21.10.31.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:31:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EIL+UrZN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9At2-0004bK-QN
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArP-0001la-AZ; Fri, 21 Aug 2020 13:29:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArN-0001FA-Hm; Fri, 21 Aug 2020 13:29:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id a5so2656579wrm.6;
 Fri, 21 Aug 2020 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8w6wmSgnQZxUMQrLBvgypybp2LPlBahTHmviCZweW0=;
 b=EIL+UrZNlIKBqKhjGZf6MOhXspOgCc3ooxC7sMWJRkDmEePPAr1jS/QHXyxaIu2lRk
 gyuVT023ZRD4zBBJTYoi7dQwj3gtMijgaMYxHUW/d7+yd/nKkEhFAY2lEjkuAHpwQsH4
 TNLLdGTC/rK09EvsPW/+YMC1fuccCPVahAFcSOeAcvu/+6Rvp1w8gSFLE33XS+sG5F5Y
 dO+/aFMHeu2WtB9pawKr5oAqTs4EQ/tI99ur4bf08Yy/Lc0h3XYJzGy4oGokAACeTGmb
 evz5k8rebbUBhf/+9v9PJXKtHDTKfOD/rdkQT8OQJqDZpeuaHh8809Dj/U7otC+BQkYF
 6png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o8w6wmSgnQZxUMQrLBvgypybp2LPlBahTHmviCZweW0=;
 b=ZlvbPZVhBlnsaMftkbJYmJ3AMTYgzrHbcyk4W59cqZKZyeWczVptQ7FKbIQDaaaIEC
 4OCQDnLt8FpzZ4nmB+Nm0UEaL7yvilUzChy3sS9ekbWUtp0vZUGiwhOVeL6wUyZhg564
 f/Xi9/z7WvBAguVdCjFNTeYktb5cHEwI3wAA9EW9cyuVKFhmI1JtfhOVtfLHIFct7dG6
 Zvwz+pYoxKa2uBIeebkebKeuw8kn4p2hJTP1hkjpI8AqqhvMvb8q+hQYK2Glzgv4F2cx
 w8HSQdGtD8V97Nh/5r6ny/rc4/+rdy6Jk3s+5PNKqdcVDUEfUb/4UpVeOfmp0SrJfhma
 3FLA==
X-Gm-Message-State: AOAM531RqHeuHF0DFiepW8cK/65G99p96x3lFUG+QOADK2IVdX0/QxaQ
 dBpxj9b9kVw5y6lJ8Q1OTLi9u4inJlg=
X-Received: by 2002:a5d:6a8d:: with SMTP id s13mr3899434wru.201.1598030986974; 
 Fri, 21 Aug 2020 10:29:46 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] hw/sd: Add sdbus_write_data() to write multiples bytes
 on the data line
Date: Fri, 21 Aug 2020 19:29:11 +0200
Message-Id: <20200821172916.1260954-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
X-TUID: 6kYmMlLyPYEp

Add a sdbus_write_data() method to write multiple bytes on the
data line of a SD bus.
We might improve the tracing later, for now keep logging each
byte individually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200814092346.21825-5-f4bug@amsat.org>
---
 include/hw/sd/sd.h |  9 +++++++++
 hw/sd/core.c       | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 14ffc7f4758..3ae3e8939b3 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -175,6 +175,15 @@ void sdbus_write_byte(SDBus *sd, uint8_t value);
  * Return: byte value read
  */
 uint8_t sdbus_read_byte(SDBus *sd);
+/**
+ * Write data to a SD bus.
+ * @sdbus: bus
+ * @buf: data to write
+ * @length: number of bytes to write
+ *
+ * Write multiple bytes of data on the data lines of a SD bus.
+ */
+void sdbus_write_data(SDBus *sdbus, const void *buf, size_t length);
 bool sdbus_data_ready(SDBus *sd);
 bool sdbus_get_inserted(SDBus *sd);
 bool sdbus_get_readonly(SDBus *sd);
diff --git a/hw/sd/core.c b/hw/sd/core.c
index a3b620b802b..9c2781ebf96 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -114,6 +114,21 @@ void sdbus_write_byte(SDBus *sdbus, uint8_t value)
     }
 }
 
+void sdbus_write_data(SDBus *sdbus, const void *buf, size_t length)
+{
+    SDState *card = get_card(sdbus);
+    const uint8_t *data = buf;
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        for (size_t i = 0; i < length; i++) {
+            trace_sdbus_write(sdbus_name(sdbus), data[i]);
+            sc->write_byte(card, data[i]);
+        }
+    }
+}
+
 uint8_t sdbus_read_byte(SDBus *sdbus)
 {
     SDState *card = get_card(sdbus);
-- 
2.26.2

