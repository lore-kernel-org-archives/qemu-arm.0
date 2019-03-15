Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1565704wro;
        Thu, 14 Mar 2019 20:38:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyfK2d/yBmqVM14S6fHepjfLV7lhTDrXeBz3GAPmWHdEx6SoN7Br8Nx3quDGWUPpZUZQX/
X-Received: by 2002:a7b:cf03:: with SMTP id l3mr534677wmg.14.1552621094079;
        Thu, 14 Mar 2019 20:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552621094; cv=none;
        d=google.com; s=arc-20160816;
        b=pQGAgJMAkhrIXbAVBnVbohvxSngFN3kOcW4y/DAL3EJKOChMtzgpTHTGHgbxCWyimO
         1gx62JHvc1vL+vAAnWU3nDiEKTEp0s+BBPkhmzvIPT75APFEXj9pHkoaurgSvXichLRJ
         2nqlmvem3igZmLuDKG2Iemw7rExdlzKxkr9LqUwwfLQcqb6KAZtsUlXzKk56qIN8HRjp
         TqfrQSkUVJ1Rm1nofML5fFjgm/ii1A1tKHrU04tHKrq1/Ippvn+S78AdnRU5GhIqGQNW
         QqvnO4Nsg9je/Eb5t2l+tHGml4Npk0rfJ9l4R17V6WYutOSnFw9vGaeNpssiqkxDSyhs
         wCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=etLbcy1a7zqlIhvc39R877L+TQ7d/3g/A8LNCCGc1X0=;
        b=ORAn+Z7EqS0yDUZ5q7psl8M6BXaZtU0oGJbTetiQxqHduOoq23gRb8lqqf+0G/cQN9
         sYz4rwuTxnoRBt+QG14xe+u5jH68Ipng8zWGzymP/2HE57drlNPWs4Xa+6F4lHHcNKba
         Gnpda7bURTSCmjI1gNmSQdJfY1A6hrZY8NM25h6aOIGnfj+xzTYph94R/vb2KczW/OoV
         kwAwVHgNwbQ7Kz8KN8hhV4FSFbsvnYZhstj9K3ol0GEbcjWsz9lG+hvDLIqmWWgMNwMz
         SyekcmeELroi3aIgH060+d67cAk2SGZ2snkGlM8I9DDVKR1M8EWVJGpYVPcBxftNRU1h
         nTuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N1+YCvWS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j25si515791wrc.431.2019.03.14.20.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 20:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N1+YCvWS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4dfg-0007Kt-Uz
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 23:38:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dcI-00059H-QB
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 23:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dUn-00035j-0j
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 23:26:57 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34603)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h4dUm-00034r-R0
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 23:26:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v12so5434042pgq.1
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 20:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=etLbcy1a7zqlIhvc39R877L+TQ7d/3g/A8LNCCGc1X0=;
	b=N1+YCvWSZOazdw53D7FI4pwwRuL6fG0KC9IfI14M03A9rlUsT4yiUnU8KTBtH4zMG6
	ONdH/EHITdbj2n4vy+lTQgkNcNNDsm88ZSFRFjcpsjEkQd2h1+6U8sQLkR1jRP/65AF6
	5LZOte7687WnlGApjBrbv4iwMZ2406I/qkkL66dCtrI62E5dZBZlnHGDllqyNQsYOsBN
	xXk8ZqZZAK82CZboonh3pLOXGermxgW7h0v18CCTi42iWQoRcDjoqt9v8c+I7FFPxOjd
	3FHqqQjhD7/5p6IR9g6seCgAjw2MVd1GYuO04B8CR2rSO1MlXK/GIIMZUQKJrhjn5f9C
	QgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=etLbcy1a7zqlIhvc39R877L+TQ7d/3g/A8LNCCGc1X0=;
	b=D5KfEr2q48R3ZceAxMeQsr/jzOcY6D7WVXGpKtRu+RGEG2/BH3cl50VidE0AOA/VkX
	EEd01nIf7dyfaO6t24rwe9PBX8fIXf17ZjBqYvyncX9OLgDTJJlgE+AX3RwToSDs+CZC
	lGBQetLPcWUhnNhcSeW3gxgrmtrs5DEmw2MvGPJqY+3YaEjTu4NefJomon8SPFBMJAWq
	LSTMdz6r6o41ENxZizw1yU6Hn222zwpIVqaQOXgGxkFl8+ojswAwlscyLHQ+ISCU2a/r
	S9EAAmDv0rYKF0QCpzybcaUaFqRYOJZWIU3dT64UVueVQAwYllmOPZyEl5uKyN+Rf9NU
	DqHQ==
X-Gm-Message-State: APjAAAVvEV1H4QgUEgNTDLxvM7xhErbcC0bwbnjRYZYSw+en6ORJQ6tm
	zzdfR4yCDHapLeFgABrTjZihWjjBrYA=
X-Received: by 2002:a17:902:1002:: with SMTP id
	b2mr1788447pla.248.1552620415419; 
	Thu, 14 Mar 2019 20:26:55 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id d26sm690816pfn.86.2019.03.14.20.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 20:26:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 14 Mar 2019 20:26:24 -0700
Message-Id: <20190315032629.21234-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190315032629.21234-1-richard.henderson@linaro.org>
References: <20190315032629.21234-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52c
Subject: [Qemu-devel] [PATCH v3 18/23] hw/misc/bcm2835_rng: Use
 qemu_guest_getrandom_nofail
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BKXcJtg0GQoO

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of rolling our own error handling locally.

Cc: qemu-arm@nongnu.org
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/bcm2835_rng.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
index 4d62143b24..fe59c868f5 100644
--- a/hw/misc/bcm2835_rng.c
+++ b/hw/misc/bcm2835_rng.c
@@ -9,30 +9,26 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qapi/error.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 #include "hw/misc/bcm2835_rng.h"
 
 static uint32_t get_random_bytes(void)
 {
     uint32_t res;
-    Error *err = NULL;
 
-    if (qcrypto_random_bytes((uint8_t *)&res, sizeof(res), &err) < 0) {
-        /* On failure we don't want to return the guest a non-random
-         * value in case they're really using it for cryptographic
-         * purposes, so the best we can do is die here.
-         * This shouldn't happen unless something's broken.
-         * In theory we could implement this device's full FIFO
-         * and interrupt semantics and then just stop filling the
-         * FIFO. That's a lot of work, though, so we assume any
-         * errors are systematic problems and trust that if we didn't
-         * fail as the guest inited then we won't fail later on
-         * mid-run.
-         */
-        error_report_err(err);
-        exit(1);
-    }
+    /*
+     * On failure we don't want to return the guest a non-random
+     * value in case they're really using it for cryptographic
+     * purposes, so the best we can do is die here.
+     * This shouldn't happen unless something's broken.
+     * In theory we could implement this device's full FIFO
+     * and interrupt semantics and then just stop filling the
+     * FIFO. That's a lot of work, though, so we assume any
+     * errors are systematic problems and trust that if we didn't
+     * fail as the guest inited then we won't fail later on
+     * mid-run.
+     */
+    qemu_guest_getrandom_nofail(&res, sizeof(res));
     return res;
 }
 
-- 
2.17.2

