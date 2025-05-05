Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2305323njj;
        Mon, 5 May 2025 02:08:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOoEVtZkRlo0pFDbRGgZ/UXwjzaYqyQWHON2X9ppnhVAa7/8iZwctbIYf5DqGv4WGDsjbUhcLlL9akOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG44nM35JT6Uxu9RqiEe9p9pTTvg0TSTWgScOx/9S3tSKQgtPtMNlMPCbfUdU1+a0CIy12D
X-Received: by 2002:a05:6000:248a:b0:3a0:99e9:bcbb with SMTP id ffacd0b85a97d-3a09fd6b975mr4261030f8f.12.1746436117414;
        Mon, 05 May 2025 02:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436117; cv=none;
        d=google.com; s=arc-20240605;
        b=G3D1fhdOIezAGrn4jyUAWNtKV0sbRjuwtH8i2YSfV27rno7cRFcS3RRJe+Pw+9F06L
         aX6lkkPPaPhLzWTg2b9tmm4yOCLjR1DY2w/+qaF1cv7bXTAdqetJxsWYGEFlMBNQOsx0
         h/Cq9isgCXAC2L7OWqRWddIESALd3UJZaKaatBaxJhiQy0dhoOr7ywkTgmBqs1mArpcW
         8PUcE2rvUkLriX0zKx5ZLna7fdJx3q5ldM1esZDEAHNLSu7Q7vyiyBvyK+eP7Pml7GZc
         cxfl0KWsCUpCjwuIS0v9WtDIVMvHjawf0HX0TWfWnqsxYgaCK9lHuStnaYMb686Xby7V
         1LNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8/LgbK9aXh6E9duZWTO2B6O0ErU1RvCLEKiAekF5JPM=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=A6v0ZtejeiFWwvIh+9oGDhrhOlhW0X0gdw6W9nS0IUjMMc9cjRC2bdnTveFhhNyIJT
         15+TKa3OmaTvBN95sHZDUTbYruRVDtGfyze85YXI9nhiM826uVNwweTPJK1W6xOC46Ig
         zf5QNboLu1eo3l++P0JVo/HQIWPaCHmR8YDrspcJG9qqYeUrFS3P5uwSSsRQm6Q7VAYN
         rv2fIH2ep2m6xf0EezW5a+BVvElPpg9gqTuUyn9MiHDF3dazmWkEmQBCYGZLx5x4sNQO
         +sySYtbn80PyaymyjyB/mHcLdFhAPENK66SoarmFs6GAAtK59XL57nkJheg+qfO8momk
         GTog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BYbSav5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b00a63si4910354f8f.542.2025.05.05.02.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BYbSav5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrnK-0007aA-VP; Mon, 05 May 2025 05:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrmq-00069X-Qs
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrmm-0006CT-PN
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/LgbK9aXh6E9duZWTO2B6O0ErU1RvCLEKiAekF5JPM=;
 b=BYbSav5vhib8a2RduBJdNvL9CSSUdCQ49d0RIco5OPwFpRcQHLNjxFKpQlQXFEga0TOw3b
 2OjHKJzKoMW/zQ226YcP4Mwx5ML25JDRe5cjQO5M6+0aGupec8418POHI3D6nJ8sY5Ovaz
 LLq6DFNLmxvHJAhSVL5nTE3i1L3msP0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-CKk1suCaMsqit2NsMono3w-1; Mon,
 05 May 2025 05:06:49 -0400
X-MC-Unique: CKk1suCaMsqit2NsMono3w-1
X-Mimecast-MFC-AGG-ID: CKk1suCaMsqit2NsMono3w_1746436008
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1ECB51956048; Mon,  5 May 2025 09:06:48 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D0C7930001A2; Mon,  5 May 2025 09:06:45 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 03/23] tests/functional/aspeed: Update test ASPEED SDK v09.06
 for AST2500
Date: Mon,  5 May 2025 11:06:15 +0200
Message-ID: <20250505090635.778785-4-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QrXzTeAE8FHE

From: Jamin Lin <jamin_lin@aspeedtech.com>

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250423014008.147542-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_arm_aspeed_ast2500.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_arm_aspeed_ast2500.py b/tests/functional/test_arm_aspeed_ast2500.py
index a3b44572fcf6..6923fe870170 100755
--- a/tests/functional/test_arm_aspeed_ast2500.py
+++ b/tests/functional/test_arm_aspeed_ast2500.py
@@ -37,14 +37,14 @@ def test_arm_ast2500_evb_buildroot(self):
 
         self.do_test_arm_aspeed_buildroot_poweroff()
 
-    ASSET_SDK_V806_AST2500 = Asset(
-        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2500-default-obmc.tar.gz',
-        'e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
+    ASSET_SDK_V906_AST2500 = Asset(
+        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2500-default-obmc.tar.gz',
+        '542db84645b4efd8aed50385d7f4dd1caff379a987032311cfa7b563a3addb2a')
 
     def test_arm_ast2500_evb_sdk(self):
         self.set_machine('ast2500-evb')
 
-        self.archive_extract(self.ASSET_SDK_V806_AST2500)
+        self.archive_extract(self.ASSET_SDK_V906_AST2500)
 
         self.do_test_arm_aspeed_sdk_start(
             self.scratch_file("ast2500-default", "image-bmc"))
-- 
2.49.0

