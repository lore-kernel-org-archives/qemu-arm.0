Received: by 10.25.205.13 with SMTP id d13csp10448008lfg;
        Fri, 6 Jan 2017 10:55:23 -0800 (PST)
X-Received: by 10.237.36.166 with SMTP id t35mr61252595qtc.172.1483728923706;
        Fri, 06 Jan 2017 10:55:23 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g143si40939214qke.185.2017.01.06.10.55.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 10:55:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPZfd-0000Am-4d
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 13:55:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPZaT-0004dl-Hn
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 13:50:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPZaR-0006cN-Tw
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 13:50:01 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cPZaR-0006c1-Mj; Fri, 06 Jan 2017 13:49:59 -0500
Received: by mail-lf0-x244.google.com with SMTP id j75so6697781lfe.3;
	Fri, 06 Jan 2017 10:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WZrkTaLxfQnZPhMLmKEJfj6Ws77x/mDGW446gLbNY6I=;
	b=orjp7XnXc1ADqECP9j8TcpDolRL9YsPylI/YfHaUTIxVImfEM5iy0lfqFfV1XnHePv
	e7zhrLGwsA51nHjiO0nkp/pr29Wv0ZzLJ24uKj5upVMwW6Gs2c4EHjrD7/d4phaX4Vd6
	LnKOTRP6dnSVfCcMoHBi00QZpQb1iY8Xj1whCgIM8yInyo9+zFeVkxUbejZOD2uF802M
	T5wPCuPeamKt82Oj07oM4Fg4eRwAEdmWRaRXuyoYd/gEE2B+menrPUrh1UAl3tCaYQXl
	ygrsoKA8sXe67t/jcPuq3W9/wyOqDQVq4HZEebSqoHzCrqYWesrLQIpL1LnM1eTFmZbN
	cS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WZrkTaLxfQnZPhMLmKEJfj6Ws77x/mDGW446gLbNY6I=;
	b=rw36yBhpw3qsf0GYZh+VTn6yBwuE21sm8sIKX4p6Hz9m3biqtmS9sx8tB0AKUyo7PH
	7kzNc1qCyozEtZYSKroC/c3PCNDQ0ejLSQ5FdFZn4lX1YmINorZocosndBV5DVpA++y9
	ImIW5Xcg+4fUzaOoBYq1KXDMb28/hXLRvEiqpusM1ijaMqwaeUJ+jiufW7RkOu2JOdp3
	zKiMuxSr8sJrf6zezrX+UItYjJXC4cRJcbAo8E8ZboI46vpXXtgP+9+Erz5AfIoWfO5l
	qSNRRdTDxVTyfkuVIsiKoL5XncvKjeMfmUU+B1CbUWaajlX4ryQ8E4l3k0tvOJI7HVxU
	Ldiw==
X-Gm-Message-State: AIkVDXIUECeGuDEF6bjLMCVcWUWxH+O36FIIREBUpjMx2zIFBioyXhsNfL4ROO+BDVlLUw==
X-Received: by 10.46.9.21 with SMTP id 21mr29236923ljj.4.1483728598065;
	Fri, 06 Jan 2017 10:49:58 -0800 (PST)
Received: from localhost.localdomain (89-78-94-50.dynamic.chello.pl.
	[89.78.94.50]) by smtp.gmail.com with ESMTPSA id
	f42sm19448777lji.2.2017.01.06.10.49.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 10:49:57 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
Date: Fri,  6 Jan 2017 19:49:46 +0100
Message-Id: <20170106184948.3422-2-mar.krzeminski@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170106184948.3422-1-mar.krzeminski@gmail.com>
References: <20170106184948.3422-1-mar.krzeminski@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-devel] [PATCH v2 1/3] block: m25p80: Add Quad Page Program
 4byte
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L4LXLjKcdgtH

Some flash chips have additional page program opcode that
takes only 4 byte address. This commit adds support
for such command in Qemu.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/block/m25p80.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index e3c1166..6dff81b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -326,6 +326,7 @@ typedef enum {
     PP4_4 = 0x3e,
     DPP = 0xa2,
     QPP = 0x32,
+    QPP_4 = 0x34,
 
     ERASE_4K = 0x20,
     ERASE4_4K = 0x21,
@@ -574,6 +575,7 @@ static inline int get_addr_length(Flash *s)
    switch (s->cmd_in_progress) {
    case PP4:
    case PP4_4:
+   case QPP_4:
    case READ4:
    case QIOR4:
    case ERASE4_4K:
@@ -607,6 +609,7 @@ static void complete_collecting_data(Flash *s)
     switch (s->cmd_in_progress) {
     case DPP:
     case QPP:
+    case QPP_4:
     case PP:
     case PP4:
     case PP4_4:
@@ -874,6 +877,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case READ4:
     case DPP:
     case QPP:
+    case QPP_4:
     case PP:
     case PP4:
     case PP4_4:
-- 
2.9.3

