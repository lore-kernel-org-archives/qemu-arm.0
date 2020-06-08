Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5207004lfc;
        Mon, 8 Jun 2020 09:06:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCM4lPjxDtPPqsi8BpdI9tuxmmNoLtpnufh+h+uM5OMTC+8TJB4oZaoGdGeDTDarcx23X7
X-Received: by 2002:a67:2983:: with SMTP id p125mr13882231vsp.145.1591632387232;
        Mon, 08 Jun 2020 09:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632387; cv=none;
        d=google.com; s=arc-20160816;
        b=f8J4/kWLBq/ewCzKfdw/bdI5Hk868Vun+Ut1Ke9o4+EsWSbMmjNgBrgzb7Vto+IP/g
         ZzqKr7O7xpx0qe+cu/8W6zSFJ4GLkatoj8R5BgIDxmwT1D7T3vS1nlwIkUZzcUhPjmJJ
         +YV14P83sKbxCECyAA/qD4/hhG5HeCHqnKnm3T1IODi1DaCWSc+r5BA5xKYpNwbcjhhM
         81iHfZbo24I/508wkG5Lb9ug0QQvnnDH8vEHeC/uwErEDAN8IuaSK2jH9czhoNAlVPgN
         6HBYE6DpmDa4Zf+TDArZqxHUzfJFFy3sMncE61rRgffmsrvEgN6VTsKnX1F0YsvwGyQ1
         KnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NJCGR9/510Qhv58TRWbd4o5i6q1ayDSJg7ikac3wKxM=;
        b=Fir9wsG0kJElAWjyTCuHfPLhrVZlArg0PuNRtuvFZy+PF12PS6uG3WsKzm4idncTxR
         O/1oRhMqBNHtDsUnb48A+QXjD6yeVVnjKiusg4YaLfNTDWASLmTWbhyclLk1PcbDDKWN
         Vf7Gm04VDfB9snsDam0YOia3KcLmuwDumHkwUsQHI4nCj+XpzpS9fWXLiD7vzh59EvMu
         zRNu/bcHaJFyAJ/fWg31iB7oAAs2FeZ+40g/O0R3tJUQ+SXcjcbrvUUuvSkhqMY1wE0o
         CCIWsj5aYfZiu50glsqTU2EZPkKMJKt2T55n0hjdA9ukNz3MkuGzH6Ezr0ILVMg/0h4Y
         nEeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FgicdF4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si12913uar.45.2020.06.08.09.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FgicdF4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKI6-0002U8-6l
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDJ-0006AO-Km
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56225
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDH-0007eH-54
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJCGR9/510Qhv58TRWbd4o5i6q1ayDSJg7ikac3wKxM=;
 b=FgicdF4Zf+nUaoXjZFOtWpEQT+rpH+McGyHKWz8rKsYpj4MHn+0AGr0eHEWb67Cax4ypOs
 Ma27dyQw/Z6BcCsqn7VW8egzuHtX3txG7/LaZojy2+Et89o8HvPBAJ8IjijSkgw0pEgs0E
 IWw1lYUjnzMFRoXCWxoboF0csMKPiuk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-gYuJWBfEM-yPNPfR4V6WiQ-1; Mon, 08 Jun 2020 12:01:22 -0400
X-MC-Unique: gYuJWBfEM-yPNPfR4V6WiQ-1
Received: by mail-wr1-f70.google.com with SMTP id m14so7336983wrj.12
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJCGR9/510Qhv58TRWbd4o5i6q1ayDSJg7ikac3wKxM=;
 b=tKpeT9ty37dlE+ynmha5IVsMVBBL2UIQL+lCVuNcHADgbL4Eaac9NPA5stNy053wjv
 EfqKAE/0WpTKN/mm8SJwKL/NyIihwyTGjtbycvLrSRfGGKwOfQBdZ5CQa5BlyvvYAPE7
 +eUESveAIDADnKOdk9n/J8qupbAHK3snMwuFr/uhvGE2a7atF3tkdN85NF6KF4ew5AJZ
 TgX8ZA7jLFkCaYAaoS0iB7hhJp+G27b8ogNlWTmPwoYwhvvf1P+3ERKk14KdqgbmcTYa
 SH0M/PM9fsmYKovkuhe0TtmJctdJ3pqYAA2X5Z1o+1Jq5XUismP2UtjcSLz7NdAS5dz2
 fWKA==
X-Gm-Message-State: AOAM530FMRPRrQInjsEFgm2efZJyvs7bD5MIqKbl3SBTDvnyDOZ15sJZ
 DXNoc/qW65LIFIkhUeu00i7SsMkqEDwEBRZ21C0Gv0PgYe16b3P2KnKUbylPlapO0I2wWPQgOYa
 PQY1Y/aP/3AU6
X-Received: by 2002:a1c:6884:: with SMTP id d126mr21819wmc.121.1591632081537; 
 Mon, 08 Jun 2020 09:01:21 -0700 (PDT)
X-Received: by 2002:a1c:6884:: with SMTP id d126mr21765wmc.121.1591632081336; 
 Mon, 08 Jun 2020 09:01:21 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g25sm25750wmh.18.2020.06.08.09.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/35] hw/timer/arm_timer: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:15 +0200
Message-Id: <20200608160044.15531-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WHG8k4w8PfGm

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/timer/arm_timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 9607366d78..e23e6b4b31 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -16,6 +16,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "hw/qdev-deprecated.h"
 
 /* Common timer implementation.  */
 
@@ -175,6 +176,8 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
 {
     arm_timer_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
     s->freq = freq;
     s->control = TIMER_CTRL_IE;
-- 
2.21.3

