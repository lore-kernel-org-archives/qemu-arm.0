Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp592594njc;
        Mon, 24 Jun 2024 23:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVERBKqCzFGHTPdwJvAT6KqDLLJ0Upbta/J1Y2QPATrOQh2nAlqr3GY7lkBa9Z4rh1TawUcnjZm8I0OXAqAVur8VGP8xtkc
X-Google-Smtp-Source: AGHT+IGuFdM0X0+LO0pxCKQvli6mtvfFCkMO2aYltjnk2NB0S1gUaVqgqgmsevNF72eGA+0SNTG9
X-Received: by 2002:a05:620a:29c2:b0:79c:130:43c4 with SMTP id af79cd13be357-79c013043e9mr142880685a.65.1719295797453;
        Mon, 24 Jun 2024 23:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719295797; cv=none;
        d=google.com; s=arc-20160816;
        b=CmzZ4zUIPyEnYWlorTV5YbvuE3veF19YFk6mU9c47NGybxT3f0q9Biy1elDVC7ZfKb
         MTytNbq1BnI2xq6LmKhAGMmG11GGlQaXl62N2tC6+Aj7r0qmfZsLac+f/gmlT+BkWOIB
         hqAoZIMoayi7aytkgN1Ef+RJW0gcQhdROGbfL41Z8lIWJ3Y/MiCfkv7yX05wxSKDwq1p
         0swEU9pwCgROoKvosBjPsQp1wp0aLrkwofXU7h06PoK61t8cO3BKHayARAohizVP9W6T
         XPq7DRItZ7uVyHk9X3mSxQCwoa6gj/fWxFbcsK+Gu4FKeZhOSyNB3bKtbKTwB404fQER
         vurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Dt0Q+0y6DzPtwOcxx5ELSUngZ87yA/7s1WJyv7+DgfE=;
        fh=ovIcZCdmUhp0tdCzHCeday8enCG2wwV+tD3e6FJWmTs=;
        b=aBnMdINg3ZdNjwGYsnasX9pjsY6w5XrZvPdAotgxMhtJEzHv7rsv1dx5mhAbb37QI9
         1ZzChTa2Hx/ZSHd10enuf38EZyIGID+eVq45uCDoF5JiMZXZnYWSefVciDYKx8qiYuWc
         aWn/8JxMXjjKbFunOcq9ANt2FwUpX0Mz34Cr1OddTuxKt1xZymaX3ip3lXcyGUi/InHQ
         iSBiB+uu7uuRD+Kiq5fBBmPnn+YOtyIrRtAjPNO9TTdqkSCVGlpCLH7ESUpZ66eDaGWZ
         u4DiJeBjeHLHyTcLJE4STAQXLr/pX2Tt68qPm2F+n5Bl23Ov2mDvbk+yKzjH0GLF5XUv
         f8uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KVhlXZRe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce914115si983435785a.229.2024.06.24.23.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 23:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KVhlXZRe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sLzND-0007J7-V6; Tue, 25 Jun 2024 02:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sLzNC-0007IW-1L
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 02:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sLzNA-0005GV-BF
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 02:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719295783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dt0Q+0y6DzPtwOcxx5ELSUngZ87yA/7s1WJyv7+DgfE=;
 b=KVhlXZRe1X3H3aLKIyAzmlfzY00GE12WN+TnaDYI1dmz3E9mxdz11vO7CMxB/k0Sfxf3Fl
 8CE1jZJQ7NnMdQu6IhT+h7aZrOzMY3SMpkg87OfBt/TxHE5Sm7EwliZ/G9Od/MboRmbP44
 pg8kkHAUEl5/2g8t72mCBSq16+I+Cio=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-90-91SwJUpwOi-89xuOA9FW9A-1; Tue,
 25 Jun 2024 02:09:37 -0400
X-MC-Unique: 91SwJUpwOi-89xuOA9FW9A-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C59CE19560B4; Tue, 25 Jun 2024 06:09:35 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.49])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1DBE51956087; Tue, 25 Jun 2024 06:09:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH] aspeed: Deprecate the tacoma-bmc machine
Date: Tue, 25 Jun 2024 08:09:27 +0200
Message-ID: <20240625060927.440589-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.207,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 2YcS/MZFRKxF

The tacoma-bmc machine was a board including an AST2600 SoC based BMC
and a witherspoon like OpenPOWER system. It was used for bring up of
the AST2600 SoC in labs. It can be easily replaced by the rainier-bmc
machine which is part of a real product offering.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 docs/about/deprecated.rst | 9 +++++++++
 hw/arm/aspeed.c           | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ff3da68208ac..3f036c79a45a 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -256,6 +256,15 @@ images are not available, OpenWRT dropped support in 2019, U-Boot in
 2017, Linux also is dropping support in 2024. It is time to let go of
 this ancient hardware and focus on newer CPUs and platforms.
 
+Arm ``tacoma-bmc`` machine (since 9.1)
+''''''''''''''''''''''''''''''''''''''''
+
+The ``tacoma-bmc`` machine was a board including an AST2600 SoC based
+BMC and a witherspoon like OpenPOWER system. It was used for bring up
+of the AST2600 SoC in labs.  It can be easily replaced by the
+``rainier-bmc`` machine which is a real product.
+
+
 Backend options
 ---------------
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 40dc0e4c76db..823faff36a81 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1379,6 +1379,9 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
+
+    mc->deprecation_reason = "redundant board. Please use a similar "
+        "rainier-bmc";
 };
 
 static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
-- 
2.45.2

