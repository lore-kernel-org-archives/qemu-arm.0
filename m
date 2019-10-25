Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3479195wrq;
        Fri, 25 Oct 2019 01:38:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4MGeGb5DlV4d4VP+NqhXZUDFyiMNXtZf6SIEnBH8ZwmnKRuoCWaPXJbZtgzsOJCN5GZHj
X-Received: by 2002:a37:9d8c:: with SMTP id g134mr1866782qke.352.1571992687213;
        Fri, 25 Oct 2019 01:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571992687; cv=none;
        d=google.com; s=arc-20160816;
        b=aFDWcugs9HR9ussM0Kl4q75v3CoiUX3mC4VWXpFUftaFklXOyATWDJCK1JulcX0wG2
         UcLaPMV2mlBVXUbxEsKGjK7TBTeiJdVnOCmkk5Q48adjkxD+aCMnjqtuY28mR5O2urP8
         fKLYnyjtFCfNZ/bWrzXHRMugLqy3V5vZDyycLrqMc7E9ZpZic07MhX+25XRQhSwCDoSq
         XvE6DDV/1ChCLklFTfmN+nNJYQyEBpi7qH9cWT4N9ondBWgzrtSsoX2xmclR4PmMei3z
         6Xe+22hGWboKWAxW2A5zkpz61wAnq/gmU7n5U/iQjoe15Sc3tjR5Oe3R7rS/kAPql5dZ
         X9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=juQ6soMHAOOaXdDaOuDNkI5VQ9tNcd0Pa0LMKrP5jqE=;
        b=eh7HqkSFyRfkvw3Yzg1TnSCqORKZJZdoLVmDt1q4Uo8dozvelA4YLmGSfpuju5ABSA
         P+DI8AUvutEJaKdl0j88s/1TuuWJCwoqyWcFcfFrswy0U/czyPVXIFSk1pkBJ1MX/1bg
         YaAZSjdQoQBY5oBJEFbEOKFV6A+qaTf+U9wxpGcw8eSYxG+MLFMKvDuq5EPQXvnvx12s
         +f1QiveLe8O089fBDUq3I3VuJwUqmSjkVJD6fuX5A9eNyq530j2Y7r8URuBlbXxw5rqb
         G6w2CwrwQwOV/rfZomIgwWFuy/7Vfxwyp7nHHncq0REs6hIXRU5ySlFJx7Ld2T9H6Pxx
         Dtdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si413617qtr.400.2019.10.25.01.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNv6j-0001lc-Cd
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv4x-0000h0-RZ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv4w-0007q0-Lw
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:15 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:45989)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4q-0007iR-4Q; Fri, 25 Oct 2019 04:36:08 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjjSt-1hhgEX0pvH-00lEJL; Fri, 25 Oct 2019 10:35:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/19] util/async: avoid useless cast
Date: Fri, 25 Oct 2019 10:34:55 +0200
Message-Id: <20191025083511.11463-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:onD7UkbNa4WcqpkfMRXh4f2hRmOW8C3mwnPjy0VAImYEeEq4nPu
 CRId/qUyJGNBiOyQrpE42eC0YEtBLhHV1xBd2Wffq14aJN/oPhNh+kc4cvLQ+ivT9F22XXl
 lDjx0DXU8p2SPkXv76zBwuekgZvvsQRT2mR2E0LVvOujtpk898IVmzH0e5ZH4cmAVvSCXK4
 SVx9vBNb1IbomK50Es03Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tAM5+AlWd3M=:Ig6AfLJCT3dRBJ4ri7kM2+
 5Qg+vq29NwIQM0mwgZ4blaw9zON5OXQtUfOPCBRBiIUGBWmDtZWapmCZtI+r9y8bUjCgvi22O
 GJmZbY5SRFjn5tFwTdIeBODiaFKZCR+jjntsWQPPBsyTWbgY3sLbFqP3yx1hPnbpDFyCMuqPW
 qMRBCSQLzVWqckdABMgkzIDUHmYw1vw9UhfM2NFerDOnsTGR768lpFyA4MmTOt8tb4GpHTQH5
 SCokWHcLEhcfmKuK8NqjFIxaC2ZEVyqK1e0AA83co2ocC79q7cUmge4ncTbW08Buy9jmduOb3
 308dURjYoPKWZ1awRyKERjrZ0WIxI85rfIFT2gZfQFhjnFQdVzTHtXgA4CfZ2+/TpkM4J0Bwc
 RDVh0zeZtSl1rKF4F17p8ijKAT3gc1UGqxFu9RimAXf7mdCB09za8mR/z5Lnm4BevNIG5tjiP
 Bo4Y8/gb3k09fYjgf7w8gsuQkxNCQiTWHplwyYtS77XhhYSdLwTb+yi0IU1UXJK7DjkvhcDxk
 6+Z2U1OUtdP6iK3vEUStq1e19U71OdZoKml5GEfpDGg/0mjp0OqbYjuL0aMmSIsybRQ1i0U8m
 0BnG2KXsxMwza7+WdPyuE5dgZQh1jmZQP6uVPGfGdJPDZAx3+w79EckcF8wYwbXxNvEDP/oej
 QrjXL+x+K+XA04jmptHK0/XZEmQqvBuNsyxp4YJEoH6IEmwsAdskxEzYmSd1xe3tbIWwomRxh
 S9tQ74hwRsCNzMuP6wy3egTBzrCamPXTb2wV9QNH2ZaJHm1xPUvIQINZ6jJUAM3rSi/RuA2DA
 I+8+oYS/BYnYyaHQ2UzqFn2JqX2DnW5Tc5ajgScL7x15FNk4EYGErJRNk7baEJBoycPUIqloR
 60b12qJaMcJHlyLy/z8A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.135
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Frediano Ziglio <fziglio@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jyEHxROzIQve

From: Frediano Ziglio <fziglio@redhat.com>

event_notifier_dummy_cb is already compatible with EventNotifierHandler.

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191023122652.2999-1-fziglio@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/async.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/async.c b/util/async.c
index ca83e32c7fa1..b1fa5319e5bc 100644
--- a/util/async.c
+++ b/util/async.c
@@ -429,7 +429,6 @@ AioContext *aio_context_new(Error **errp)
 
     aio_set_event_notifier(ctx, &ctx->notifier,
                            false,
-                           (EventNotifierHandler *)
                            event_notifier_dummy_cb,
                            event_notifier_poll);
 #ifdef CONFIG_LINUX_AIO
-- 
2.21.0

