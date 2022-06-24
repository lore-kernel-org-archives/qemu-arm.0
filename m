Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp341090lft;
        Fri, 24 Jun 2022 06:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXzUOsU3xsbn2vo32BuNjtp68QczwCxodsbULEBPlBQT4+yC8SSZqyV7tDR2mjO4Z8+cwd
X-Received: by 2002:ac8:590e:0:b0:317:cc20:8880 with SMTP id 14-20020ac8590e000000b00317cc208880mr1453686qty.513.1656079037889;
        Fri, 24 Jun 2022 06:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079037; cv=none;
        d=google.com; s=arc-20160816;
        b=fDB7gNYeUBxp+Q2ACy5ON4DCg/FRt5Aqb46pqV0leO++xPCtP1m0HBNjC/FWQwlNqK
         R1KZrBQVQC5ArSF770PZxvZ57n06aZwGxoWhoEAS1e1aQXxAlwO64w4r9MT/fkCmhO0V
         nyP70E7H2AX9E6xT+HpAMPWCcvHjN/pdvpnmeDF14BPUYd+fY/QBhJB+mmnLB4Bq3PdH
         els1U9a4hV+N4MGcQu4PIcDY8Csih3Xsmnq795DFRvO0Clk/vhqfBXOixKTZJ3M0xAzW
         /Gc7WibuKHH8AdT+r1DyqRRQ5d0ba5sxDtLrEZUzub2VRA4rBmFobUhkSkM1FnymZmt6
         5IlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=iJeZHKd2ESfTdLxK3gngrDHiZnVgxD1i9JMP8ahasbE=;
        b=uVlwy5SDAyNxDseAbC93SS0rKFMNfJgBF9NKlQ5IBYyrhYsoQsrZp5M01Uoksqd9AT
         Co9T3GkwIyMa4HCeFWcGWcoiLXJq98P157q6diMWMxI6OuhJBbI+0+nQzs69dRQy4lfx
         wQpkjONPoxtVszUz2+pmzNeQj5hRv/K+Yd+/jjhkUIt4+pNaMDL1i5IDib7j3RV7/jRL
         wBNY/Il6//yXbvGROK1+rh+jcN/Z0ExY2U8gngAbZmUa5we5Xlhg7B5W3Y+8+mD2Fubm
         l7et97SzTUOiAWt/bwcJCmilVHNfR5ozrCwmwsxJtcF/vrp+y0ykShju0y35A8kohcwh
         v1Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="u/sZyxJ8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n25-20020ae9c319000000b006a6c16be691si1688688qkg.498.2022.06.24.06.57.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:57:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="u/sZyxJ8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4joD-0005zh-45
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja0-00018E-81; Fri, 24 Jun 2022 09:42:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZy-00058k-M4; Fri, 24 Jun 2022 09:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iJeZHKd2ESfTdLxK3gngrDHiZnVgxD1i9JMP8ahasbE=; b=u/sZyxJ8w7dvgIh6YPb5F1mupt
 H5sehCNdI6t4roXt1VtFgdFzezhUUbp2jEu28dgBi7GGRCxtwlTSiPp9X/a+Srk0ORtwyp0wOF1kR
 nn+vrjvaVlL01UBazD6hBzCTl9tPt4uIpArooyzs7Rw0ceAmItxLlsEMvYulZytx2wpkvIYjWV7lg
 ZnTSmNjweTwt9JhYb+Kv7za20nQ4tfU/lIjLawoq7REzgS8JwanXQiyOJkxe9nt3S+DJ6JCpcPhsF
 UjDTEdWAh8dTyrmdF+T8mNCPnJmQq9IGaTvOET7D1ZV81PDFVaSIZKP611UKveumHR8oRzN+NYn7b
 u3+S0EtcxYnZ00LGNKV15XIymHCLRBEBAQh0MiqrrQJKQGtuNJjx9tB/3JKYZA1bJYblV9cZ6zyUi
 diQ1Cct6qJCY+VVZbt3D6VNtICwvvzwhiNXwGMeZIgyPHRIo/Aq/9CKFMN60+WUPTEvpkcFGSfm/s
 t6llJQT6+G6aSUukdDvgX+b64h7QmNoCQ8K0Ym33sWEWfQIJQ/Wd7Yi4ojrDbxW/+GtoZw9dJfkTg
 RdhuvCcDTFB+VwZxBBw3mkCMh10xP3+Mbjx+otC/gn5ctEf/PJE0kf1XAAUw7NjeOvvWHaOhwia+s
 XL/Qe/vKp7V12XhwoLn7+3qmkZXH9zZBpXsMwgkXA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYM-00037t-80; Fri, 24 Jun 2022 14:40:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:29 +0100
Message-Id: <20220624134109.881989-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 14/54] pl050: checkpatch fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ep3eU+gv0O0p

This patch also includes a couple of minor spacing updates.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/pl050.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index d279b6c148..889a0674d3 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -53,8 +53,9 @@ static const VMStateDescription vmstate_pl050 = {
 #define PL050_KMIC            (1 << 1)
 #define PL050_KMID            (1 << 0)
 
-static const unsigned char pl050_id[] =
-{ 0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
+static const unsigned char pl050_id[] = {
+    0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
+};
 
 static void pl050_update(void *opaque, int level)
 {
@@ -71,8 +72,10 @@ static uint64_t pl050_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
     PL050State *s = (PL050State *)opaque;
-    if (offset >= 0xfe0 && offset < 0x1000)
+
+    if (offset >= 0xfe0 && offset < 0x1000) {
         return pl050_id[(offset - 0xfe0) >> 2];
+    }
 
     switch (offset >> 2) {
     case 0: /* KMICR */
@@ -88,16 +91,19 @@ static uint64_t pl050_read(void *opaque, hwaddr offset,
             val = (val ^ (val >> 1)) & 1;
 
             stat = PL050_TXEMPTY;
-            if (val)
+            if (val) {
                 stat |= PL050_RXPARITY;
-            if (s->pending)
+            }
+            if (s->pending) {
                 stat |= PL050_RXFULL;
+            }
 
             return stat;
         }
     case 2: /* KMIDATA */
-        if (s->pending)
+        if (s->pending) {
             s->last = ps2_read_data(s->dev);
+        }
         return s->last;
     case 3: /* KMICLKDIV */
         return s->clk;
@@ -114,6 +120,7 @@ static void pl050_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
     PL050State *s = (PL050State *)opaque;
+
     switch (offset >> 2) {
     case 0: /* KMICR */
         s->cr = value;
-- 
2.30.2

