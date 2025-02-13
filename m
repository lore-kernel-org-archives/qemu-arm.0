Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp345685njc;
        Wed, 12 Feb 2025 19:41:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0+DZxEIhEks2acodzMz2QbOyx330BVN6Y3xNrS7CDtlaNxyW6zww+Z45htGeNhioqlrsRKVILWTfiGA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4SFpg7zEkfJqEXrPUXWZjt/WGBh2fka/3r3s0PEzlQ6F7R9sTxLwAEW+59dQeU03Gccgq
X-Received: by 2002:ac8:588c:0:b0:471:9bf6:a941 with SMTP id d75a77b69052e-471afe24c6amr91965401cf.14.1739418087439;
        Wed, 12 Feb 2025 19:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739418087; cv=none;
        d=google.com; s=arc-20240605;
        b=iRzQGpFCiWa67JdgYTU8J5Agtymccp2rmADN3UWzYrsBadmY0E0Pts6jdWS981bt0o
         QFLDlcSFhDubyPfnD2mCNtXMoM6ioli/aBOtYfv/guvicIz2kaserzOjIYK06BEx9fvR
         FQZMeDxYftTzjvhC6MRxizlEtETBpCCqnysrqhPUoHtULbS+EE7pm0GOr23jldHVlXzl
         HWuXfSl2YC/Ml3Un0rxMVefb0mox9KjOwHDXtuKWesfky0H+t2LXNcmH9Rj8NVx1uYr9
         MNQ0EPJw3JsgDYp21FcPTtvmyVJbALbB2vKt09GFppSIaavd11NM4tk/ZhcTG0VwvyZU
         6fXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=gqNlzeK8Rqw9dURPwLBH2vfxT4I0wduVKhyX/Hv/1LE=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=KcfwucPwaXrVlv9Btgda5hAf2ysLjf9e5e26XwWfzGnVs+NCNicB2c36qjaSYz1zZV
         Jj8GIwgzW9lh93363g5jQz5FCu6jXYZxTSkc8cMQoLnD3Og8LBuLeSQlmA4RN0jfd8m4
         7GRRsF1Hzr89CJxzgqDVqABzz5oELyqKErCdQlPsaiipeonTJ9XXQt/cKCNg+G5bLujr
         JDTnMt8cfRbpxs/yURYUbD+979RCVhT8jnyPZjWEJlr9dSE7m1V4vv57qtVydo9VGeXo
         Sh2lPOReS2eljLs0vSgVfV4cxCWBuO8GmaPrpyOnbq2yg6djceJv8WVOH85IuYx231KN
         xmgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b5b6cbsi5551911cf.469.2025.02.12.19.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiQ2p-0002N7-Ge; Wed, 12 Feb 2025 22:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2n-0002FZ-Al; Wed, 12 Feb 2025 22:37:41 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2l-0000pw-N5; Wed, 12 Feb 2025 22:37:41 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 23/28] test/functional/aspeed: Introduce new function to
 fetch assets
Date: Thu, 13 Feb 2025 11:35:26 +0800
Message-ID: <20250213033531.3367697-24-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fqFmj0A3w5kz

This method simplifies the process of fetching and extracting assets from the
Aspeed GitHub repository.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 9595498ace..f3d7c8331a 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -27,14 +27,15 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
         wait_for_console_pattern(self, '## Loading kernel from FIT Image')
         wait_for_console_pattern(self, 'Starting kernel ...')
 
-    ASSET_SDK_V903_AST2700 = Asset(
-            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.03/ast2700-default-obmc.tar.gz',
-            '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
+    def extra_aspeed_archive(self, version, file, checksum):
+        url = 'https://github.com/AspeedTech-BMC/openbmc/releases/download'
+        self.archive_extract(Asset(f'{url}/{version}/{file}', f'{checksum}'))
 
     def test_aarch64_ast2700_evb_sdk_v09_03(self):
         self.set_machine('ast2700-evb')
 
-        self.archive_extract(self.ASSET_SDK_V903_AST2700)
+        self.extra_aspeed_archive('v09.03', 'ast2700-default-obmc.tar.gz',
+            '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
 
         num_cpu = 4
         uboot_size = os.path.getsize(self.scratch_file('ast2700-default',
-- 
2.34.1

