Received: by 10.223.197.9 with SMTP id q9csp3781451wrf;
        Mon, 16 Oct 2017 11:03:25 -0700 (PDT)
X-Received: by 10.237.37.8 with SMTP id v8mr16351593qtc.275.1508177004922;
        Mon, 16 Oct 2017 11:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508177004; cv=none;
        d=google.com; s=arc-20160816;
        b=cR1XN3xsJcURtfoPsVpUk3epMXZhWYxjNA1O7QdAHTBPym7ssHNvELdwuevW0KC2ad
         LTxUcylmfSCgO1/ai0qpZkek1L3rMwMH56YQrqzbwC+a73Ht78xMOkQBeQzu8KuCj/Un
         EGsOLwsTyP79YxdegpsYzXTcwyzAJSmm+7gK4oJmPW80eaFHjloxfsq9rpkFR8qH+CsA
         VsQOtgVknSAqKtK5ROvFx+q+h/dYFUJ+CV8HjpWNZYgZz41Mh3f1nC3aQcAQVVgEhXNk
         kZ4YIreWvLjo6YlcnBGbU+uYMl0rkeIc8sKr9j5N4EPlP2PMoa1dTeWdAfdK1V/u61ps
         TjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=uPqPsHNo5vHtAHLW1c1c1S9ji/ASsauovRo1JboM1ME=;
        b=iSfYNUWkmujZdaTJ0u62mBmiQg6texLRrtV2yAB8N4HTxRIVTvA03UN8KXIgLyOT9k
         Yrlp7x103Du0GYYYY1nQpw8iCNw4SHoWn3nn7aoRmXYQScqI1yIAS92qJzMTQiNSgBQa
         kcKmiFYb9dYPJH1ku3bNk1H+ijs+zATT8HQ23zrBc3P5hoBYpJoxEOM5fC1O9pvIcv8R
         RvunpoaIfteCbreOdzSiDUvhkoAXAFUptKia6HiWZmAzJ+75tyTMUsiJLCHXCNAlYNQ1
         B7i5h0yyY6uSXfR8NLs3VWU04zGsdxUh58S5mrx4UYtVj8qym0QliGUdw1FhbpwvoOGg
         iCOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EjDf/3o7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t85si2851542qkt.371.2017.10.16.11.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Oct 2017 11:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EjDf/3o7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e49jW-0000LQ-Nf
	for alex.bennee@linaro.org; Mon, 16 Oct 2017 14:03:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e49be-0001Wv-B1
	for qemu-arm@nongnu.org; Mon, 16 Oct 2017 13:55:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e49bd-0007AN-Lk
	for qemu-arm@nongnu.org; Mon, 16 Oct 2017 13:55:14 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:44731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e49bY-00075m-9i; Mon, 16 Oct 2017 13:55:08 -0400
Received: by mail-pf0-x241.google.com with SMTP id x7so16370510pfa.1;
	Mon, 16 Oct 2017 10:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uPqPsHNo5vHtAHLW1c1c1S9ji/ASsauovRo1JboM1ME=;
	b=EjDf/3o7c/PpCdER0kf8kOUOD+ztSOj+NIwatkgfrlyRp5yg3gXqMqUkI4D3bOh3WV
	w1cnXtUGLAU8hBSnmYc1P4sfNtI1LoBHCzGwG+yf2M5l4LM0jGhUL5h7p+zplSVpE/z4
	oIc19TnFzYXukPU0j5Y9iXvZkFM7MiWTKvUBeQiS/oN78cNaG6TL/LDW975QWefVu4Ie
	jeCCFyScXK2loKXJ/KxXWb0X1vNszxstAtpiLQfWhMR0CKnC2pqJj/KOwYC66Kjr9eq2
	inoSYb38tw5CKE3QhQ7G7//6efxtn/F8D6dsO/NN5sy3gWjlj1p0oK0Ql/vQKpwC32do
	egbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uPqPsHNo5vHtAHLW1c1c1S9ji/ASsauovRo1JboM1ME=;
	b=Z9TCkTr404238JYUfhf/+N6XEszeCyx8+JwegaDewEhLzvgv/pM/Nc9bDneJEHWq3N
	8K2eFjR2K9wWwrgkqMxVqhguuNELIROGU6H27NA7hIMO6VxO08au3Dbk8jPUftG+31nS
	0380O900mTGdVEtvE7XHsxn36xpYHRUqDkK6A6oCHyWSmxZtPt/xgjwvaUyJEqcUnj1y
	uZDZ4c9aW54Oe96U9nIcdK0gmG91kFkPZ6uFO4f0Qkdqpk5lgsLk/sN5nIXm//y7p8Yp
	rmAYjo3qmCgNwj9xkRAD49zxwEQE+3YW43YCfkcUZxSn5On/mhbW4SnmB5CS+lJgSk12
	7S+Q==
X-Gm-Message-State: AMCzsaUZDpZ0c1C8MWxdIllkpPH/pkPaPcpj3jxfT8PwJKsJkAt0Ya3I
	zRbkTqwmGXs/Fe6J4posBWbGfg==
X-Google-Smtp-Source: AOwi7QD5K6WwaG1bDhyolAwp/0J45Jwddyw6cqzTscaXzgmWB9amsJaU9quz949gRMoGYu5hcv6Img==
X-Received: by 10.101.67.73 with SMTP id k9mr8732776pgq.188.1508176506997;
	Mon, 16 Oct 2017 10:55:06 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	m185sm15019579pfm.181.2017.10.16.10.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Oct 2017 10:55:06 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 16 Oct 2017 23:24:49 +0530
Message-Id: <1508176489-9002-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [Qemu devel PATCH] msf2: Remove dead code reported by
 Coverity
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alistair23@gmail.com,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, pbonzini@redhat.com,
	imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tjlx0BcUgFlb

Fixed incorrect frame size mask, validated maximum frame
size in spi_write and removed dead code.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/ssi/mss-spi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index 5a8e308..1e49cbc 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -76,9 +76,10 @@
 #define C_BIGFIFO            (1 << 29)
 #define C_RESET              (1 << 31)
 
-#define FRAMESZ_MASK         0x1F
+#define FRAMESZ_MASK         0x3F
 #define FMCOUNT_MASK         0x00FFFF00
 #define FMCOUNT_SHIFT        8
+#define FRAMESZ_MAX          32
 
 static void txfifo_reset(MSSSpiState *s)
 {
@@ -106,8 +107,6 @@ static void set_fifodepth(MSSSpiState *s)
         s->fifo_depth = 16;
     } else if (size <= 32) {
         s->fifo_depth = 8;
-    } else {
-        s->fifo_depth = 4;
     }
 }
 
@@ -301,6 +300,9 @@ static void spi_write(void *opaque, hwaddr addr,
         if (s->enabled) {
             break;
         }
+        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
+            break;
+        }
         s->regs[R_SPI_DFSIZE] = value;
         break;
 
-- 
2.5.0

