Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1803306njm;
        Tue, 2 Jul 2024 01:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqPIYfSEpK00TcAzeMAe1CA3hG1lDaIzpJYh+LXpo8NJ3GRD4LKvCsiXToINzhcv/kGEWIQSIEAHlcqHSub7wFYhwEEOet
X-Google-Smtp-Source: AGHT+IG0gChw0tEX6XVEphf77JWpkhipb9PXweWRQ9NzaJ9tHY5zIBQbhSqYgzjPtmNani5xwUCk
X-Received: by 2002:ad4:5ae6:0:b0:6b5:663:2a4f with SMTP id 6a1803df08f44-6b5b70cdde8mr90841956d6.24.1719907350440;
        Tue, 02 Jul 2024 01:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719907350; cv=none;
        d=google.com; s=arc-20160816;
        b=oq4Xbw1N5r1mI8Wr1+m3qfhAC8qTJJwvqTeb7G3LDT4Mdfxq9DZMlljgczUIrEpsRa
         jeU+rTMvhT0YY/2hlaic1OLF06816uaH8+IqK/k2Nt/Sbbl/kpW8ZoQ5TKFysbKIQOWX
         XtqdXHMK+s0Xk6nJ/wqnOzJify/YsTjWb/RoTk3ROx56Zms17nB6KJNcYJdjmhBCFNax
         wb+dI2s9VJ77j+6Q+uVI75FfHqa2Ij1l+wpKcYYYO+Jx74kA4uZjrXOfe42Dl7gnypZJ
         MmZYCK6fdxJfEfk0ZZepUW4uLfmwbC9rqUnAEu6EO8e40S9hxu8fijOPwBp4GpM1vrkA
         NnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9mUSDxBbEZBPnwUST3v5Z5E4/fO5Wuchb9CI6JzcY+k=;
        fh=fA2BVDuqf2kB9eVhDCNl//LPCdv1kT5WlEk9E86oXvc=;
        b=niJkUCGF7qK2Cfal5JdHRvI5bs2jww9bOuc8Byidaxn8Hk+vHgiaOa69gKSU4/hhzH
         k4ahnUBE9lrenbleLFvAApmunVeLix9fD7scS2PTz0mhQiTWziS0TRIeWHRkqZmHI13C
         ouB2rEYILVK0LXtaawrBNgscOgaMfaRiexnkU9g9B7VPCCfu5S98S01tJtUAihQIYD6a
         nwvMT8i+2AdyX9Ei4V+E6reqM+ypMv+6hPgQlIdcCIngORYH2t7ObHJSXNxT8VHfFIgM
         YEDxQ/3zyupi5w06xAoFMSybAVsfB6pSo6mgr05J7Z76V71G6kn3TRB0IoEwUxN+lwyR
         10CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AN5n8SUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5ee3d1si102899966d6.392.2024.07.02.01.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 01:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AN5n8SUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOYRz-0006PX-H9; Tue, 02 Jul 2024 04:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRn-0006Lb-2f
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRl-00068R-94
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719907264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mUSDxBbEZBPnwUST3v5Z5E4/fO5Wuchb9CI6JzcY+k=;
 b=AN5n8SUmU3zs/iiv6/X2pzAd2sAYSvLcrl++Gp2nnCFeNCUIsq35faapUeMslPqW/xm/FB
 XInHxXQFTMUqWLIr93J0SBVhp2flzBIy5gDt2Qa61gUXRyd8LToZN2RidAPjnImvDuzlQH
 q2oy9ndRwM7351CnSlIhCS4qo7k2WtM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-Y0I4NzGBNtuMLre89s1W1w-1; Tue,
 02 Jul 2024 04:01:01 -0400
X-MC-Unique: Y0I4NzGBNtuMLre89s1W1w-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3683319560A7; Tue,  2 Jul 2024 08:01:00 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4E24F1955E74; Tue,  2 Jul 2024 08:00:52 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 2/6] aspeed: Deprecate the tacoma-bmc machine
Date: Tue,  2 Jul 2024 10:00:38 +0200
Message-ID: <20240702080042.464220-3-clg@redhat.com>
In-Reply-To: <20240702080042.464220-1-clg@redhat.com>
References: <20240702080042.464220-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K18CV6TcHkoX

The tacoma-bmc machine was a board including an AST2600 SoC based BMC
and a witherspoon like OpenPOWER system. It was used for bring up of
the AST2600 SoC in labs. It can be easily replaced by the rainier-bmc
machine which is part of a real product offering.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 8 ++++++++
 hw/arm/aspeed.c           | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ff3da68208ac..5d9e4d8de725 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -256,6 +256,14 @@ images are not available, OpenWRT dropped support in 2019, U-Boot in
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
 Backend options
 ---------------
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 40dc0e4c76db..53a4f665d0d0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1379,6 +1379,8 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
+
+    mc->deprecation_reason = "Please use the similar 'rainier-bmc' machine";
 };
 
 static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
-- 
2.45.2

