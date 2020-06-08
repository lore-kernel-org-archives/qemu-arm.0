Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5224865lfc;
        Mon, 8 Jun 2020 09:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh/xCHnLnGhzEBGuDqZUxWg9tFasTvbehpTlwkY2crHMpQwzTg+RshQcgT8m4coh0I0Zup
X-Received: by 2002:a25:2d4c:: with SMTP id s12mr8681722ybe.307.1591633692251;
        Mon, 08 Jun 2020 09:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633692; cv=none;
        d=google.com; s=arc-20160816;
        b=F/O9ZuXky0o7qav/d3qxpTHzg9ypipOH01fqjImdEaUkWLZb4jHfCXLPjzM7uTMc+w
         4ASy+Iwtg8tBIlsalqg/Fnjhu2lydHFS1wYzdDmctEwjs3py51b5jLc/SqGRMpxRIOSQ
         VF7gLHVoSf+liRDsSkj1bTDWPx0xmoBt9RdD3lPE6f4uFi0uXbfLLJN5ye2kt2RiAfu+
         L41Pgiu8ikhraoO9FFTZaKtaLHtW+f2bGsRCLX57hZBbRL/fk+eZGHhTJ69TeMgwaS/v
         urc86yScgO6KaLVdUXlmLnOYV4xxzvw6rMYctC9YasoTBnUzNdS8BGdrwj+0rg2m+pFj
         yNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sNDlXKA4V05uqH+zGvitoUZAatp4aCkSuEKALsyTQs8=;
        b=xJKHPJ41YiBf8nc6kKpEQBC84y+b8pwb6Yrv3Bi0NPn/OAnbSOjfsInYXdQUWuA1mp
         o84tt6yYxNf5T0YVv/2BijFVNU5N1npgmdtU7KJ47McukDFLsgBXrBHeHC2qaXQusD6p
         wodd9FVLQm3NRiZy0cPQ+t5mjcl1VPDOq1Pf7S3FjiJf8ekYwjevJdqhjWqdHpp7VPsk
         HKydM5d4dzegBLhaZjD+ljUvhhmdNGtKzGLng8ejFhVldCLUU1YeoSnE2hjOZzgwQX4o
         M8XoT2lbJU3h5kjsLJPTsHq6NdyClKElonKaUFCd2zdQptignqc69jWuzZBBbk7D0EV/
         hE+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gyRNygOP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r63si122098ybc.159.2020.06.08.09.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gyRNygOP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKd8-0001B5-JL
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFn-00081w-Pz
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:04:03 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40669
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFm-0008Ge-Vk
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNDlXKA4V05uqH+zGvitoUZAatp4aCkSuEKALsyTQs8=;
 b=gyRNygOPKTodhkBJ6A5D56U74zKqRJS5rE+wNZ5Y7FeOwFX6LfCpUJQQKBaOhxnYRQV/sd
 17/dsHy5HZLYFZbKNXQ6Ea8VBlpoFrMkzFNNtDjp7FykHaIkOvWeI3L03OEWrKArd8kz6a
 QE/222skRmADh6QDSvJPpL/QCTon8j0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-NENkx7-mOtCQH2OX2bhVPQ-1; Mon, 08 Jun 2020 12:04:00 -0400
X-MC-Unique: NENkx7-mOtCQH2OX2bhVPQ-1
Received: by mail-wm1-f70.google.com with SMTP id p24so9470wma.4
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNDlXKA4V05uqH+zGvitoUZAatp4aCkSuEKALsyTQs8=;
 b=QeDU6EIYjhgEhRfYUR+ZJ2IEG1Xkrb/pwRTITqZkAI7C1bvK7+HTmyvJZGm848Z1xM
 dLR8d2VKluq/GZBgnLyCUuXSy3fkS1QxooMezcvE9bOjqB3gs+CHppp141L5RbOslYqc
 ZBr8XIH5Z5TIaYV6mb805oDgix8TFaJRgyhy7WOfwVMM0E4aEs0by+vgNwHkm2qLCuTT
 HShQzlX8ACSEe/fsJGeoCEoswMPC7KeMFHD52LL2Pw1FYNZHC4mAbMEgtjfUELMxijL9
 QE6qP4XIqtANj+VhWjeThP6WjNHlRjp6QT+rJNGzzKsZvDbp7w959SmgidlJ8cqvHsAK
 vYLw==
X-Gm-Message-State: AOAM532g6ar6fVOOk4iEc69iJ1MC1iFnbT4u4sB7nOlNmGCwaaU/wB+h
 5YM00smwzMQShwD5mAwHtqi3843xAIDXI2CHjjRbtRN1QPEeiqHDAoMzD+KXNncZL9KbzOkIyc/
 WG3bxKQoJcef7z/Y=
X-Received: by 2002:a1c:2082:: with SMTP id g124mr55794wmg.21.1591632239016;
 Mon, 08 Jun 2020 09:03:59 -0700 (PDT)
X-Received: by 2002:a1c:2082:: with SMTP id g124mr55753wmg.21.1591632238819;
 Mon, 08 Jun 2020 09:03:58 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h188sm48452wmh.2.2020.06.08.09.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 33/35] hw/timer/slavio_timer: Emit warning when old code
 is used
Date: Mon,  8 Jun 2020 18:00:42 +0200
Message-Id: <20200608160044.15531-34-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPtc2+FCtiVo

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/timer/slavio_timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 4c5d65e391..16f21669bf 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -31,6 +31,7 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qemu/module.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Registers of hardware timer in sun4m.
@@ -392,6 +393,8 @@ static void slavio_timer_init(Object *obj)
     unsigned int i;
     TimerContext *tc;
 
+    qdev_warn_deprecated_function_used();
+
     for (i = 0; i <= MAX_CPUS; i++) {
         uint64_t size;
         char timer_name[20];
-- 
2.21.3

