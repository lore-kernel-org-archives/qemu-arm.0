Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2818021njc;
        Tue, 5 Nov 2024 05:24:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9tOFnZ9d/FCeig2jDnN29NQ07Us9r1YjXoTFgcRxkSIIlEq8GZkLR0irKOIrs8hBwj62llVBoXqW3BQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFaI1sOYgVSM9ZdPMOeEBRZK2ZVvVbfKLMyAPcOMMmR+Cud+vZjCM9A8frP4M31QCPKQCds
X-Received: by 2002:a05:6358:2921:b0:1c3:77fc:3bb6 with SMTP id e5c5f4694b2df-1c5ee9b8d6fmr787117855d.21.1730813041661;
        Tue, 05 Nov 2024 05:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730813041; cv=none;
        d=google.com; s=arc-20240605;
        b=eCfyccZmdN4xdai5Pj4IIy89ukO2uN5wakQyyguWXEhA16lMtOjRBXsJ8vL6s9nxYm
         fAjDppXbUD4xOJmrLkcXL3R9hkfDKPpy2GIuhY7Zhqh7ehI8cKA6wcXnuYK6o76S55ww
         2Pc/eUXpKuFkX+pDIs6wYm0+GWE6HizEH1eNYp7U3iQTVKfZe/Knj1PZIMu5Xl0SSjPt
         N5fMc/wP0aU3B6M1+HaxYKNB27pYpiREkLgqHTb43gVRwNivYPw9d36guUHNuf2iCIqb
         c9eyxBx8BwyVg2HkPR7z7R239F/EPuOueYy/dfa2S1SgoXrOB4YoWBsqA6jT0Nei5mKi
         Xt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ios6x5tnOOGj2t02xnaZSqCmCpchd2sAQn64oRlRm0g=;
        fh=TaJuipTd8Ta2Fxjm/9DOyfZIO2LCAtfk3i4csrEz204=;
        b=ba78JsxeJsqI2qXAo+0H1NsiRVS7ncrncJ08iDCTNhuEDczp0FwIn5DUY6mIjzJTJI
         Z18MbqGpx9i45tSDT7A3HnSgA/jO+zB24TxUwFJ/CpeR5As91AQ7MEuSHw+jETQmiptf
         wfaUqTb4l0YuQ0pXnP2hoohwbsrJjVt3lGYdkiEm1EUxiBrCZj43FJsQ5GDrwO0TfPOA
         d9yShVPJrQtnLF4tYwYNdRKeQgEAHHMp8Btyg+FjuhWZvpvRF1IZd6kHXOt8Kb50qUsE
         6j8BIUb3bHYyzIEWNqD3nINb7d4RV7ZkPbBL08Zn866SUonc7Hs3J/4Mc2N2N19uOMvJ
         rMYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SK8W98DW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35416afb5si130741196d6.293.2024.11.05.05.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:24:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SK8W98DW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JXF-0007OV-8N; Tue, 05 Nov 2024 08:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t8JXE-0007Nw-3u
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t8JXC-0006No-3T
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730813028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ios6x5tnOOGj2t02xnaZSqCmCpchd2sAQn64oRlRm0g=;
 b=SK8W98DWPbr+fDY6W6hUnGzxCUV1ODpYh2H5fNGSpgqnOoc6jvHEE/WZ0Rw29Q8dymxQCC
 +8Ga9DKb0jvid2VJ6xynpYzV1fcvUaUkAPjv8vyE8BBpiyHumskuvo4MzF0PB3S9utC0vO
 xmvklkFtyOk4Cx1HGRQ0Nsx78NnIzek=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-BxCfx_ZcOrmVCWu7w6mpBg-1; Tue,
 05 Nov 2024 08:23:45 -0500
X-MC-Unique: BxCfx_ZcOrmVCWu7w6mpBg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7A6FA19560A3; Tue,  5 Nov 2024 13:23:44 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.244])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BA9151956052; Tue,  5 Nov 2024 13:23:41 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] test/functional: Fix Aspeed buildroot tests
Date: Tue,  5 Nov 2024 14:23:39 +0100
Message-ID: <20241105132339.2967202-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: T3y/KpHk6bvD

Since commit 786bc2255256, cached asset files are read-only. Adjust
the QEMU command line for buildroot tests to reflect the new
constraint on the flash drive.

Fixes: f04cb2d00d5c ("tests/functional: Convert most Aspeed machine tests")
Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_arm_aspeed.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
index 9761fc06a454..19853161b267 100644
--- a/tests/functional/test_arm_aspeed.py
+++ b/tests/functional/test_arm_aspeed.py
@@ -125,7 +125,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
     def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
         self.require_netdev('user')
         self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw,read-only=true',
                          '-net', 'nic', '-net', 'user')
         self.vm.launch()
 
-- 
2.47.0

