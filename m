Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3425585lfm;
        Sat, 4 Jul 2020 08:44:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0KrmJJIZtUtBdtDAoPC9YwpJydRn614p4vbMFITv7SZpUdqCivm0bpMnBYD7bIMor+XnF
X-Received: by 2002:a25:2041:: with SMTP id g62mr66798856ybg.429.1593877453068;
        Sat, 04 Jul 2020 08:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877453; cv=none;
        d=google.com; s=arc-20160816;
        b=Ijq1+l/wb8F0UbiwIdktYB97LyhGaQLr4RtHt370+4cIhIjl2bwx/WWmqmKKVpizfE
         VK73jVuUD+6Cf413sEhTpg5McW98dQYkPpdcwFa3YnVlnPOx+VKdUkqwPAA8qCNq8W//
         Y69PYlmMQAxNpup+DEvAZj9g9FHR+3eyZPbz6gZnpIReq861YlvRWnBLXU0vZ8k0T/tr
         +DoLgWUzFDG38jrr98fPlMtURcU14hPDa2sXrkl5d+ftk78PfKP/Qa/4koNt6rAOdEdz
         9lbpCW4iJAnlP9RsPxyT0UcpmmnyJmFY7fTyFRIs+KJqYTV7qUMUO/Ngky0jsjdsdKF7
         OpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rks+Tfho7iTcd0gXl80y4nGQ128O77rhCXPnXo+rESA=;
        b=NazQgThAjG59cHVDqVSparwNRXbm1St3RgJ7w6Vlf9KYFJPAEGrPMreUbuMeoHuUoL
         M/YEtY/INhfwRhOGSaFh8XqeYvOn6YxQKDQb1sdyzrWkfymQAhxFwOxDVrVp6PCOZuWi
         cT7hENcgVFBKavYWuAIZfYQPr93gZMPqiLwEKALfZwl0jfDYMfrFSiZAi7HYYLOLSbJI
         LjkCsQ9TxcVjFs/y5E/gjM4whG9CZg/6w4QppY6eWJjiqBoYp04C0rLvx07Mo18iaOVB
         B7FJRUJuWKBO9JtkV3AKy6RDg6w1SFvz+fSa6gi4RfrcWqIkte0luasdPP2TDM7Zu25B
         naow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d1mUZEWw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si11943233ybj.225.2020.07.04.08.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d1mUZEWw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkKq-0007fu-Dp
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGZ-0001IE-HQ
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:39:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42254
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGU-0007WM-31
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rks+Tfho7iTcd0gXl80y4nGQ128O77rhCXPnXo+rESA=;
 b=d1mUZEWwp7H2orldx1KgtO+K469gqlZcutQOWDq8XzHQsdAJVQA5C1Ig0iRR3bTYdOR3u6
 96CPkP0bw8i18zqRDoKK5od7oJlb83KCogJKnpL35oVz+QTnT8eTUgoqbJuJbp0vXTG4r/
 yyOwEcGvAl5KdK+FzprzQFBmZB8+D/8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-ooeXQT00OiWZpdXMy1-czg-1; Sat, 04 Jul 2020 11:39:39 -0400
X-MC-Unique: ooeXQT00OiWZpdXMy1-czg-1
Received: by mail-wr1-f70.google.com with SMTP id a18so36011433wrm.14
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 08:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rks+Tfho7iTcd0gXl80y4nGQ128O77rhCXPnXo+rESA=;
 b=kKyyjfguDAEh2PmxC0XbOUTpuD9rVu23kUiThN3LoNsb9/ja8jIVzijHjP8C9Yvxfq
 FKhOb6rU44I3Y8qK/JJ2h+6sPW0L5ZCMZ1HcL2IpddsnreI1HHWDY1D9syEiL4k58TA8
 Qf03bifJgKYjTmJPnDD4t1e9ZbK/Nwi9b5dnunFp031M+c2xaVl5MiwL7c+N3OusVNs/
 dRW+pJ+HY/43qjqUkBJjYU4t/CHgNCh2Hy58b2v6SJ6Vpu5pBaRMlCJg1P5HWVvRyVjb
 E6tZ7H5Ph7b2/Qyf13T9C5xzRUxsExCNMGQWG0XqP02Rw/xIz+zg0a+j+faxdgOTvj7H
 rR1Q==
X-Gm-Message-State: AOAM5312OWwaS6krGeAGvzMh6o2TrSJr2gw6AG5KfITGn78Hd7Bt+soD
 rZiE8QP4LTwu+rMgD3zspiOLwDACvrJ2V1aQbedc4h8SY15jt8/vqoAsXbHCrayjBjigx64UDw0
 WDQIDCKPvZlOATpA=
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr3150456wme.23.1593877178606;
 Sat, 04 Jul 2020 08:39:38 -0700 (PDT)
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr3150423wme.23.1593877178454;
 Sat, 04 Jul 2020 08:39:38 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id t16sm18660887wru.9.2020.07.04.08.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 05/23] hw/arm/nseries: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:50 +0200
Message-Id: <20200704153908.12118-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MU1dSPB9gGmb

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/nseries.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 428a2a2c5a..e647ec32e3 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -44,6 +44,7 @@
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 /* Nokia N8x0 support */
 struct n800_s {
@@ -703,6 +704,7 @@ static void *mipid_init(void)
 {
     struct mipid_s *s = (struct mipid_s *) g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
     s->id = 0x838f03;
     mipid_reset(s);
 
-- 
2.21.3

