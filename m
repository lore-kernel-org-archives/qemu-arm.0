Received: by 2002:a17:906:4e11:b0:a23:2eff:81d7 with SMTP id z17csp289734eju;
        Sat, 16 Dec 2023 10:28:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSvlwf0lkBL6B7QaJaZd2oYP++/GTztvgPyzsfcQjg5dHLA8mgI/ZpFSooPqVXancnpS6y
X-Received: by 2002:ad4:5ecc:0:b0:67f:117c:9710 with SMTP id jm12-20020ad45ecc000000b0067f117c9710mr5903052qvb.9.1702751328178;
        Sat, 16 Dec 2023 10:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702751328; cv=none;
        d=google.com; s=arc-20160816;
        b=FeQe2iGC8XAX9CFUrE0CTglqofd2aDQ1Sp9qDMPim6ETwL1P54weeHW8/W2oN87DKj
         VBInnXYZhkbzKvYf7mGKYMLWtSKZd8Dz52ma1BhHXDOca3eLZJwYqhwQOpnPbBSF8z1V
         j7oj3UwoDHPvBHbOU4bLjvRC+NJoQLgui6j1kHzcAvSeu6AkSbuL5JEFze+qQxYVi/P9
         urGWHQxEpnEBo2MwzmUV6e19FXsFvFcT1/HoMV8/Mj5GBn7cq6By6LdyknXCIUTvl/+E
         9q7Iov9tBWsfhAWtvjoQgiMSUjTvdPBX3hK02oECA7QBnKGVdgFS89jZD/zLTBWeMfSF
         vZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=jlWDMa9F/DMliRIFm/berg8WP23P6um4rpGtjYHxVMY=;
        fh=oGKIVXcH1r9KL/hdyO5aIi4Tl7S6YUHGM7njmdJqg74=;
        b=yRoQtx/TUyosMo9KA+clMB7H48XRWvDxN1DucgrD1MJp/wbuQTZhQqhE4q1Su1o4kF
         8JFG6uE1SdX+YVtL5p0Y50d5Pq4ysLfqfjKufAt8Y/3W4l184gEDS88j2AaNT7D9mfW4
         mdHFvyxwvw2BNEiFwvJ1U9O77nJg69vQLHqFY7Ob0NDwMh9VGmUxJqGMYA8kxKVVJQg0
         nCxvzAtPK2CnUUjXJmY7eGYPb5e734tXG0bG5E3iUPHShGHJQr4PYYX5ZibYJ2H+CwIU
         hXmy8MRH429Qf4rJT6bxqGlji3LvrUnLbBVZt0Z9OrqTKw4M/g627ppQ1F6YnIpQFER4
         gdCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a0cb702000000b0067f2e6f65e3si954183qvd.204.2023.12.16.10.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Dec 2023 10:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rEZOG-0000R3-1N; Sat, 16 Dec 2023 13:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rEZOE-0000QF-Eb; Sat, 16 Dec 2023 13:27:54 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rEZOC-0006Wo-NW; Sat, 16 Dec 2023 13:27:54 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id 0CD1D80027;
 Sat, 16 Dec 2023 19:27:47 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Anton Kochkov <anton.kochkov@proton.me>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH 2/3] hw/arm/armv7m: alias the NVIC "num-prio-bits" property
Date: Sat, 16 Dec 2023 19:27:39 +0100
Message-ID: <20231216182740.3305724-3-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216182740.3305724-1-sam@rfc1149.net>
References: <20231216182740.3305724-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RcjL8OrIM2kc

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
---
 hw/arm/armv7m.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index d10abb36a8..4fda2d1d47 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -256,6 +256,8 @@ static void armv7m_instance_init(Object *obj)
     object_initialize_child(obj, "nvic", &s->nvic, TYPE_NVIC);
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq");
+    object_property_add_alias(obj, "num-prio-bits",
+                              OBJECT(&s->nvic), "num-prio-bits");
 
     object_initialize_child(obj, "systick-reg-ns", &s->systick[M_REG_NS],
                             TYPE_SYSTICK);
-- 
2.42.0

