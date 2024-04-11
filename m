Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp854547ejc;
        Thu, 11 Apr 2024 03:18:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUarAUf8x5RK/gmN2ue8T5tl2VwzNErK7xO9oYNQpsArIfu9S60HwZxsTs0F/blUJcG2NZXRRnOyNkxSeb+7KLH+iXvI2tn
X-Google-Smtp-Source: AGHT+IGCIYB+jkNd/tCumPkU5Xb/PmmZtYEhZCX10G9SsltpcscE8QfPjy3+HBBV9kk66haA21ZA
X-Received: by 2002:a05:620a:5751:b0:78c:8547:79b0 with SMTP id wj17-20020a05620a575100b0078c854779b0mr5545813qkn.29.1712830712282;
        Thu, 11 Apr 2024 03:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830712; cv=none;
        d=google.com; s=arc-20160816;
        b=FKq92FyC2D/ALrOeAIZACTRmVabnsCRmVlZLHAXQ6nsuL/1oPq/LTKQ/Llv80Oez9t
         isMNTy6aHxoEiHlj6EYp0PExA5ivb243Ph2mroXfukarkHzdqh4DpqxDIjYjuLKGNjLi
         cwP+sJ1GVNfCpXt6MzvWN6hu2i1w/Xo742XSoz+2TACMVgKXABi6bTKhKTN+Y7Utc2rQ
         CZAPN856JCMTTit5cGc9aEnVxXmj5Uyh3GgPOb2Iyg5U5GLBnmbgj2ln+r4x/WgSyEGL
         KhwmoEIwj861Aef4j41tRwsGj3wuTZMeGpruwPnjn8u4Czc3J7Meo1LctWwXa0EFP+Ve
         ComQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F1NpFpUrBWuL7lYE+0KLDn2ZH8pFKE5VoepA/3Vy6uc=;
        fh=wiz1UHo9SeP7cKsyv7qV5qfZpy+eOFaJKdMduwsqX+g=;
        b=df7bIn7/FQ8dGTLmAkbfvRn6pcezXyHDXeiB6iiWnZoK+tjmO1AN1qhoXY8BSyzO15
         ImFUwke9NB6RuNRStJifqqMrzVwIL3uE0XKUko73HQ63wfdLsb7qhFIAEkhjk7WQCsFM
         0c122B/0zPShE0Q7jQ6EnQxLuezLPtZ+UDTqS2pDN0HRFsR4mqgv3c/njMie0AyOxCHP
         v0M0npa5ssTQFtaZaDnorE8GJHAG1UQFU217bMTHK2DKbSo13JFh9Jv4jWhZIckdIlNE
         NCe+VatkzSSp49lNtoL6a5e1Rzu8+X0HtVBkAPXXODVjcfcGi+aXRRZwGS8CAlgJCYgL
         vfvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bqWxbHYm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs30-20020a05620a471e00b0078d69caf248si1368296qkb.748.2024.04.11.03.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bqWxbHYm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurUs-00063L-8u; Thu, 11 Apr 2024 06:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurU1-0005G2-5b
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTx-0007Wy-Ox
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:39 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-346c5b83c6eso247170f8f.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830596; x=1713435396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1NpFpUrBWuL7lYE+0KLDn2ZH8pFKE5VoepA/3Vy6uc=;
 b=bqWxbHYmOd1JWL1B1rM2r0OISujofCgTs0ans5zEtEhsPecQWJIKbbMRPRK2F2pRdl
 VwmcwGkGMw8LJTs/WoUfc9A9KgtBoeMifr6GaRJVmdK5toE2UsjbUkowam/3nTXUvTw2
 MK2Jy+eWMMahZi9f32Ataaq87sGEN60EzyJssIdlt0vfjzJa2wQtfM3tHeUY1wXBmfRG
 R4j0NIqf5Vt8UhyKFCYRqlxy9kZGnIMTDHfVFMlXe98H0pfAYr72huj/L5wAmzykiyxL
 ky8FCdKOd4+AWXoUKWcA35GHwZWUQGromgyxsUtEHYsH84hzOTHS+dQ+X0HKAJlXXDDh
 sirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830596; x=1713435396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1NpFpUrBWuL7lYE+0KLDn2ZH8pFKE5VoepA/3Vy6uc=;
 b=ZstM42fsE9uInqiYyFssUGQflc7VChwnNhJbJHeLkT4l/ygnSpKQi00wi58H9j84Do
 yFYQ6Wyaw5nQUbo3lZBpm/zLpqYR8RGx96KtMRTIomwmPaC6R2juVpwFJ3hDoYWDTjL3
 AVeROJYbIO7uIjQITNz8jxo5AY2ivkmpB+/VOFYSYyAdkTxHB+Jp54uMN5xlSecTXId2
 tYuXwAwxmVa/kxT2uVaJOAVuqziQIMvE4I6NICW9J15NYHMlG+n+y535nca98IrIMHhu
 j5j0f18a0dw+hnsI/639x5/cAEm7TOukUBLbAy+vUMCSdY4P4Dqfb00DIvq5MaGkofaK
 0vhw==
X-Gm-Message-State: AOJu0Yx/tqspuGdodGN6Mr7fk8N4Z/lZ/K/PJ065VszQnDuwKOjNEIuI
 Bw4psWi6LdsfROmneDTCTgfFenGJqFDWr0QDOx+cAT+V1khYsxoFo1TQVr6GitU=
X-Received: by 2002:a5d:5609:0:b0:346:9903:d10f with SMTP id
 l9-20020a5d5609000000b003469903d10fmr1969474wrv.12.1712830596342; 
 Thu, 11 Apr 2024 03:16:36 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 bl40-20020adfe268000000b00346d886f3d8sm318488wrb.16.2024.04.11.03.16.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:16:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 07/13] util/hexdump: Rename @offset argument in
 qemu_hexdump_line()
Date: Thu, 11 Apr 2024 12:15:43 +0200
Message-ID: <20240411101550.99392-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZjI5cMmd+srL

@offset argument is more descriptive than @b.

Inverse @bufptr <-> @offset arguments order.

Document qemu_hexdump_line().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/cutils.h  | 11 +++++++++--
 hw/virtio/vhost-vdpa.c |  8 ++++----
 util/hexdump.c         | 16 ++++++++--------
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 92c927a6a3..70ca4b876b 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -252,12 +252,19 @@ static inline const char *yes_no(bool b)
  */
 int parse_debug_env(const char *name, int max, int initial);
 
-/*
+/**
+ * qemu_hexdump_line:
+ * @line: Buffer to be filled by the hexadecimal/ASCII dump
+ * @bufptr: Buffer to dump
+ * @offset: Offset within @bufptr to start the dump
+ * @len: Length of the bytes do dump
+ * @ascii: Replace non-ASCII characters by the dot symbol
+ *
  * Hexdump a line of a byte buffer into a hexadecimal/ASCII buffer
  */
 #define QEMU_HEXDUMP_LINE_BYTES 16 /* Number of bytes to dump */
 #define QEMU_HEXDUMP_LINE_LEN 75   /* Number of characters in line */
-void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
+void qemu_hexdump_line(char *line, const void *bufptr, unsigned offset,
                        unsigned int len, bool ascii);
 
 /*
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e827b9175f..cf7cfa3f16 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -941,12 +941,12 @@ static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
 static void vhost_vdpa_dump_config(struct vhost_dev *dev, const uint8_t *config,
                                    uint32_t config_len)
 {
-    int b, len;
+    int ofs, len;
     char line[QEMU_HEXDUMP_LINE_LEN];
 
-    for (b = 0; b < config_len; b += 16) {
-        len = config_len - b;
-        qemu_hexdump_line(line, b, config, len, false);
+    for (ofs = 0; ofs < config_len; ofs += 16) {
+        len = config_len - ofs;
+        qemu_hexdump_line(line, config, ofs, len, false);
         trace_vhost_vdpa_dump_config(dev, line);
     }
 }
diff --git a/util/hexdump.c b/util/hexdump.c
index 9921114b3c..469083d8c0 100644
--- a/util/hexdump.c
+++ b/util/hexdump.c
@@ -16,7 +16,7 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 
-void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
+void qemu_hexdump_line(char *line, const void *bufptr, unsigned offset,
                        unsigned int len, bool ascii)
 {
     const char *buf = bufptr;
@@ -26,13 +26,13 @@ void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
         len = QEMU_HEXDUMP_LINE_BYTES;
     }
 
-    line += snprintf(line, 6, "%04x:", b);
+    line += snprintf(line, 6, "%04x:", offset);
     for (i = 0; i < QEMU_HEXDUMP_LINE_BYTES; i++) {
         if ((i % 4) == 0) {
             *line++ = ' ';
         }
         if (i < len) {
-            line += sprintf(line, " %02x", (unsigned char)buf[b + i]);
+            line += sprintf(line, " %02x", (unsigned char)buf[offset + i]);
         } else {
             line += sprintf(line, "   ");
         }
@@ -40,7 +40,7 @@ void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
     if (ascii) {
         *line++ = ' ';
         for (i = 0; i < len; i++) {
-            c = buf[b + i];
+            c = buf[offset + i];
             if (c < ' ' || c > '~') {
                 c = '.';
             }
@@ -53,12 +53,12 @@ void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
 void qemu_hexdump(FILE *fp, const char *prefix,
                   const void *bufptr, size_t size)
 {
-    unsigned int b, len;
+    unsigned int ofs, len;
     char line[QEMU_HEXDUMP_LINE_LEN];
 
-    for (b = 0; b < size; b += QEMU_HEXDUMP_LINE_BYTES) {
-        len = size - b;
-        qemu_hexdump_line(line, b, bufptr, len, true);
+    for (ofs = 0; ofs < size; ofs += QEMU_HEXDUMP_LINE_BYTES) {
+        len = size - ofs;
+        qemu_hexdump_line(line, bufptr, ofs, len, true);
         fprintf(fp, "%s: %s\n", prefix, line);
     }
 
-- 
2.41.0

