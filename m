Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1784764njc;
        Mon, 22 Jul 2024 01:56:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU300K1k0k5IqunLo1VMvD71tZpFvh53zKejwRQcd9xcky5BtDMM7bqGWGAdEwR2MDagvOygCO20MLRj21C6lc2fvIepX/T
X-Google-Smtp-Source: AGHT+IGGFswXqK9yWIn/aRUcXFHbN1sOptVhureeYCjSdWqj+CVItlPTymrcaMs37myNINDl1nPl
X-Received: by 2002:a05:620a:21c1:b0:79f:9ab:426f with SMTP id af79cd13be357-7a1939a8b65mr1603842985a.33.1721638577591;
        Mon, 22 Jul 2024 01:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721638577; cv=none;
        d=google.com; s=arc-20160816;
        b=o6FWGAw8BZUQ2+xtErQhcb5OeUVJFbwXo/ceSQQbDH48XhayvIVjQp/sqe/x3MIISJ
         q4eNyzgZjnrxF1Vrv8IOU9aVTwTXPDoP+0TT5EeolFRI0v2Jjo67Q5zRyKfk/dGw8F/b
         cp+aF7OplICiuLNrfr4LJ1fJLA4ytJniv3feg1FbP/nP9QALGR98vS03SlCUlcdo/abD
         RuPmjUdPKuMCb7jo9+mjcwsvNwxkpyRNp1JWsd5+lMscrwZE/Dd8lvxf8polRlhDWFBU
         kX/NyLz7brwfSG7Zv0B3byWm5pxwv3AafgYugvB47DBYON0KsKLXRXx52CwOkvrx9b6+
         f9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0dhROS3HVNYNsaiNLzrc3CUjPHPhZas2b2+8sKFhkuY=;
        fh=gc2M6dKrfuXu3QpZfpqcfGIzhzagUL1yGRsfEFbRllg=;
        b=OfHPH8OGhRDNJA54EGu0xSPXKDNVksr9vWj4bmPND4adsdIERrEi57UfQ6TiYQ5SsK
         d/oNX3w3u6ey0X8gNu6DXxm5ZJd/f0t3C+EO4aB6KHcqndskNZfmi45ei4E3rInMiaR3
         53UCaKU1z0WGE/WMI2fCVptj+Gj+tqDJg0TG6vApe6QnIMU8zNkOhIFgrAMr0SUNZI8U
         5MBrB92+i5AWiV1B2YFMcji0cuaNlRjDvBSGPEjEu17rh4yaOR/t5JT0TrPvfkJFmPmN
         fLNiEeWZmbqI3NSBFOzoedjxr1dMPFBnPWEYHl/ScXxsDOPl6jquBWjIjN8SblTNLt7a
         S2iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ouxs2qiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a198fae718si757983385a.164.2024.07.22.01.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 01:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ouxs2qiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVoq4-0001qd-8V; Mon, 22 Jul 2024 04:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVoq2-0001do-TN
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 04:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVoq0-0002oR-1k
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 04:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721638566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0dhROS3HVNYNsaiNLzrc3CUjPHPhZas2b2+8sKFhkuY=;
 b=Ouxs2qiWuhFVUXWMOJzN0DJYqySbc/0robkaTyqLSKpOS0IpoUguHGKVpI07OJD+6UO8T+
 Hl/CMJzff9mNj38wD2rCKhoUtQzz4r7805/maP1uIEZ0sVctdFNjYmymv/1cB7UZ+9fmqq
 rqBeV2s89tTvNP863FEbKOaovJHOmzw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-434-3ALoVpArNpmQf9Q9wEKheQ-1; Mon,
 22 Jul 2024 04:56:02 -0400
X-MC-Unique: 3ALoVpArNpmQf9Q9wEKheQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8DA641955D42; Mon, 22 Jul 2024 08:55:58 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.91])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3D5A319560AE; Mon, 22 Jul 2024 08:55:53 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/avocado/machine_aspeed.py: Increase timeout for TPM test
Date: Mon, 22 Jul 2024 10:55:47 +0200
Message-ID: <20240722085547.90650-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: IbMHR43xv+eN

On some runners, test_arm_ast2600_evb_buildroot_tpm can take longer
than 90s to complete. Increase timeout for these.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/avocado/machine_aspeed.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 29e6b388a9fd..f8e263d37ea9 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -87,7 +87,7 @@ def test_ast1030_zephyros_1_07(self):
 
 class AST2x00Machine(QemuSystemTest):
 
-    timeout = 90
+    timeout = 180
 
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
-- 
2.45.2

