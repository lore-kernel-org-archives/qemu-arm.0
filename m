Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp447124ejc;
        Fri, 6 Jan 2023 09:29:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuiGPD5HJgVCtDwgrEb0geVR8RB1YbLu5CNwNiP7bNx9CY1yVBl282DbUnM30Gm+Xk0Obnd
X-Received: by 2002:a05:622a:1c06:b0:39c:da20:f7af with SMTP id bq6-20020a05622a1c0600b0039cda20f7afmr75493091qtb.12.1673026199271;
        Fri, 06 Jan 2023 09:29:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673026199; cv=none;
        d=google.com; s=arc-20160816;
        b=DmE1YfJ57An7BdpPZpFaSBhYGbkS30g6Bjs7Fj2Mc2v+U1BGiZAXnsX9eTsm8mu6JP
         AX+VBou43z4LUTwb4uiVVmBEFIxuA+DqyZEFo33ky7wq8yPWhfVaqAve9HXFKAKauXyh
         1lZYUHCCVi1WhQaDDFFXxoNJ+4sME75F8KIOTYEZp86xFqn/CFPshf2AmCee/D0w3tnK
         6BvMQNcpANThxsIb0vxj9LklVf5tR1UDXttdBeUKK2tZdsZMvRXU20kTcI2Tbf6HEl6W
         ZXt3yfo9qI958qx1NyjHSdLwW49om3z1uoXD1c2LmohVeXGQuvsZUgiVuREg/ASYA8Mj
         3B8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=RNl0RohGyGYaN8i6oHuZhCcSkYfrH1wD8BSvwo4RLCY=;
        b=jxu/VUuCHvGn7WphL5u88hPyhIrkyEKyGYfFzBTUku8r2Z3CPQChWuCJuhA6uPyZsK
         FfnnlH6WDBaa1BiNFgDyNJvAS/73d2TTW8e5jf1hV55EZLBAjjVZaD5j5C/7T52ZAv1y
         LidNGwWu6XyU3opYQSIMOq3ztyTxACrrqi8lvBUxwo7KWIb7yhzxh1j5VhivSPJaroaQ
         y8Ktezhut+l0K/s0skBoDb6vBCtl2eqzi7XR0naTOl3NDNO7ZwjQMdv1dY2YajHwhYjL
         WhWrxDKu+j25YEKSFgPD/QbS/DEq8BbZJK+a3OKPRL7MCP8aBEuFUqmv3JqztaGFp5Eo
         wyEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=IR11832L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020ac81115000000b003a9837063c9si1067378qtj.642.2023.01.06.09.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 09:29:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=IR11832L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDqWs-0004WC-B2; Fri, 06 Jan 2023 12:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDqWd-0004RV-6j; Fri, 06 Jan 2023 12:29:04 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDqWb-0004bn-KU; Fri, 06 Jan 2023 12:29:02 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 6055A20B92AE;
 Fri,  6 Jan 2023 09:28:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6055A20B92AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673026140;
 bh=RNl0RohGyGYaN8i6oHuZhCcSkYfrH1wD8BSvwo4RLCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IR11832L5qPu01VVESf/DM7MzzqP4FArqP2xn1fqcxjm1vVwfrSLpZI8Vc6J0Wqsq
 3xIAlg5+5bMFgAZFJpgPKaz/KITItnofRyys/jetlNDZcFSIkQOdqpBM0TSO99DXfy
 PO2RYZp5A93ZgvLcUWSHeFx4MExwHaVL/LvKjXyg=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH 2/2] hw/char/pl011: check if UART is enabled before RX or TX
 operation
Date: Fri,  6 Jan 2023 18:28:51 +0100
Message-Id: <20230106172851.2430-3-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: A5nEY9dTVg8e

UART should be enabled in general and have RX enabled specifically to be
able to receive data from peripheral device. Same goes for transmitting
data to peripheral device and a TXE flag.

Check if UART CR register has EN and RXE or TXE bits enabled before
trying to receive or transmit data.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 9108ed2be9..fcc2600944 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -54,6 +54,11 @@
 #define INT_E (INT_OE | INT_BE | INT_PE | INT_FE)
 #define INT_MS (INT_RI | INT_DSR | INT_DCD | INT_CTS)
 
+/* UARTCR bits */
+#define PL011_CR_UARTEN (1 << 0)
+#define PL011_CR_TXE    (1 << 8)
+#define PL011_CR_RXE    (1 << 9)
+
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 static const unsigned char pl011_id_luminary[8] =
@@ -203,6 +208,11 @@ static void pl011_trace_baudrate_change(const PL011State *s)
                                 s->ibrd, s->fbrd);
 }
 
+static inline bool pl011_can_transmit(PL011State *s)
+{
+    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
+}
+
 static void pl011_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
@@ -213,7 +223,9 @@ static void pl011_write(void *opaque, hwaddr offset,
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        /* ??? Check if transmitter is enabled.  */
+        if (!pl011_can_transmit(s)) {
+            break;
+        }
         ch = value;
         /* XXX this blocks entire thread. Rewrite to use
          * qemu_chr_fe_write and background I/O callbacks */
@@ -284,7 +296,11 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     int r;
 
-    r = s->read_count < pl011_get_fifo_depth(s);
+    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
+        r = 0;
+    } else {
+        r = s->read_count < pl011_get_fifo_depth(s);
+    }
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
@@ -405,7 +421,7 @@ static void pl011_init(Object *obj)
 
     s->read_trigger = 1;
     s->ifl = 0x12;
-    s->cr = 0x300;
+    s->cr = PL011_CR_RXE | PL011_CR_TXE;
     pl011_reset_pipe(s);
 
     s->id = pl011_id_arm;
-- 
2.34.1

