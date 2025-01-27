Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2318940njk;
        Mon, 27 Jan 2025 01:43:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8YignoHYrC78NG/wbZM6B/JSTdpn8IMRImUPuQl8//RksnZeQXvy5jDNEP2aAS1DTskI/ZhymkuWLLg==@linaro.org
X-Google-Smtp-Source: AGHT+IGnTOQRVY7O6xgpKbFMzjUFSPfWbh8SZO0lv3xr+FBP5ilikPImTYS/TisD6xo3aIL8T7Sc
X-Received: by 2002:a05:620a:f03:b0:7b6:c6f8:1d25 with SMTP id af79cd13be357-7be63287f10mr7098687985a.55.1737971019181;
        Mon, 27 Jan 2025 01:43:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971019; cv=none;
        d=google.com; s=arc-20240605;
        b=dFGYNV8gliSwNJR0ql6Qmvqr6ycvdS5oXoxOJ8ETcHdeo5DM9BTHgptQpOl5YGjzsF
         rMxSbn/Fs8Z74rbozyMkpOqz1+APq90SgX8hzUTVsU6WdwJcBvL9DfsYMFQu3QL/Q6h3
         vsQ+ZrdNzsh+0PYvCBxsGHL8CFgJEK99/fOlla3yG3UuQIrm8F1TsQKcxMkjgTa8NWAq
         rfzJLUXpER3TdZ+fmY+M4fohGXHegX/I7a8sp0FarBtaWj0j909/BjokAwXFCV0T0Wb1
         9nsT64RpwCxJYp7Z0Pk8nYtx7yANZA2Q7ZfN0hDz45CakkgNVi2s/+KUb8GP0hYIN3z2
         XbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ifvU6q0Cr9WI7jkOBvYCbrw0QaRB0v618Dxm7o9kGgE=;
        fh=E9gZgWFC0eg0KITUnj6z3PKddyEf9/f77Zk0xyM4IY8=;
        b=dWmuKJUPqCRDKj9Q1hShMRtOeb7PRMLMUv0i5yMPWeEk6hKWeoYoaxbd2pMosjZua7
         bANSCELIr9Dg8iURtofI4fn6RutTks1erK7XC0RW3e/DR6pyho6zSgnQwk7qfHyxPmEq
         PNiGlcG1PzGXhAbIrV31qvVF8w3t0Evpks1s2YbS4kIZsoyvSUEHyEIV/wzqOhzN0Nl8
         Y0x48nb1Qvgqynye8dCn/WZ3Z6Fjq9kH2vBSUxfG+1fu61977C0LvkwyfMwjeRsa7Hr5
         N9c7ujrje/uFnGCeobmUVnaHASLTnIMiWMaEjjXHL4bA8pZEAEk2dUTBv0nPlA6JJC4u
         2VEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dmXpJF+E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aee1587si1039569885a.268.2025.01.27.01.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:43:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dmXpJF+E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcLdw-0006A1-Kk; Mon, 27 Jan 2025 04:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLdu-00069r-Uc
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 04:42:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLdt-0005PU-Hs
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 04:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifvU6q0Cr9WI7jkOBvYCbrw0QaRB0v618Dxm7o9kGgE=;
 b=dmXpJF+Emnt4iZCevILnz4KRBF/UQrHjgOeEaqb3zhBDps/N2FI1P9T/1DKONpsXJdHvf+
 Eluqrc7lLHqil2FFeepQoPyfmhUHyIfqBIcjvxervghZI8qoAHT9r2QMSDu/Dk4Ym9pYzz
 fwdAQgYrE1ZLTBbCAySDaGtpzLPAwQA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-Y5En0zQlPbGXwJI1hXX9lw-1; Mon,
 27 Jan 2025 04:42:49 -0500
X-MC-Unique: Y5En0zQlPbGXwJI1hXX9lw-1
X-Mimecast-MFC-AGG-ID: Y5En0zQlPbGXwJI1hXX9lw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BB74D19560A1; Mon, 27 Jan 2025 09:42:48 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3F96A18008C0; Mon, 27 Jan 2025 09:42:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Kenneth Jia <kenneth_jia@asus.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 01/12] hw/arm/aspeed: fix connect_serial_hds_to_uarts
Date: Mon, 27 Jan 2025 10:42:28 +0100
Message-ID: <20250127094239.636526-2-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ed1YHhXsreM+

From: Kenneth Jia <kenneth_jia@asus.com>

In the loop, we need ignore the index increase when uart == uart_chosen
We should increase the index only after we allocate a serial.

Signed-off-by: Kenneth Jia <kenneth_jia@asus.com>
Fixes: d2b3eaefb4d7 ("aspeed: Refactor UART init for multi-SoC machines")
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/5f9b0c53f1644922ba85522046e92f4c@asus.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a18d4ed1fb10..2662465ada4f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -364,11 +364,11 @@ static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
     int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
 
     aspeed_soc_uart_set_chr(s, uart_chosen, serial_hd(0));
-    for (int i = 1, uart = sc->uarts_base; i < sc->uarts_num; i++, uart++) {
+    for (int i = 1, uart = sc->uarts_base; i < sc->uarts_num; uart++) {
         if (uart == uart_chosen) {
             continue;
         }
-        aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
+        aspeed_soc_uart_set_chr(s, uart, serial_hd(i++));
     }
 }
 
-- 
2.48.1

