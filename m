Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9398542njk;
        Wed, 1 Jan 2025 23:34:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVeVTl/CDBYit/JqcOIYr5M7rry/mwAroPGTpG16HGBX4eSxuE6BA1lT9z5mLKy3Zbett+PXSO72rGCHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEOAhk7rAVhKH7J8yYtu+bbnszGGpG184A0pPT0Gg92K2VgOxggxpyY4nG6NYWj0k2e49N+
X-Received: by 2002:a05:620a:27c6:b0:7b6:7a7b:1a4 with SMTP id af79cd13be357-7b9ba7a38bcmr7541862185a.27.1735803282180;
        Wed, 01 Jan 2025 23:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735803282; cv=none;
        d=google.com; s=arc-20240605;
        b=PGRH+5M+C17plDZFiyXLfUr4TRvI/koVyXP72oAVUF9Uznijpn4Ut6XkrLU1kqGnO9
         pE9Yt2+O6Psb+VRexJ89EjDcDLEHseeecAYBdjvJzC8p+gGCWdr/nZictOhr1827kzMX
         BrtgUDigUWSVUxd8lI9EVDfjL3o1JvET8vpCS+pO4abqujuZ+H9I8wGm/1oyVs7wArqd
         LHjKOEBKKPJZBttLq22ZZR/1iLJm5n8OM8yHKBRs38Jzgzc1mxziL2VDHiVPem8qYnEo
         PNjKIBC+0AlxLlBy+Bvzz17JhFXakBRlwB6lnHuix3cb9glZntjrNAUr6jva4AFfZUaM
         ggZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=04CzrBsmhM7rE9LpiL1Uj6f/I4hUm5SpXh9azdcfUOw=;
        fh=mWOytll+qgqBXCcTFssY8w9iQqyRbc/ChuLhZpmzDoE=;
        b=Kp+p9Y3Kh5zdryQsLcjgQjExEcQAdDQlnaqbeZcuHh3qg1cNkXxGpVuPHUaLnJA8Ib
         VZ/6W5lKMHW8wk3jLaEz/wf5JCU8fZD/DOxRVke9vkM1/FCe8Wf7BVqIQ3AkBj9UgbXt
         Cm7vTQszRP5Z8K1tIGLaOiNrGcOhapthI1xRDveSj23YDt9BtHmWEUcOr0nJ8s1czkAj
         xmqZBZAcIZqSg/9+2BoR9cqLjsg0zHdU06rpt9Gin8BDVIyBnuAOmEGMCMQBxhEzHkjD
         oBXSVOUERvvSmxIptGXW9JY9bPX6gVaea1OA9D8l/zWitsgDIxKFKpE2sOX/9CnBGnWk
         FLBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R5kgePFK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac550545si3279156685a.679.2025.01.01.23.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2025 23:34:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R5kgePFK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tTFiz-0002Ly-4h; Thu, 02 Jan 2025 02:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tTFip-0002L0-0g
 for qemu-arm@nongnu.org; Thu, 02 Jan 2025 02:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tTFij-00060l-Ul
 for qemu-arm@nongnu.org; Thu, 02 Jan 2025 02:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735803256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=04CzrBsmhM7rE9LpiL1Uj6f/I4hUm5SpXh9azdcfUOw=;
 b=R5kgePFKjOeIEJ4lEiSJHyv2nh9dC4/tpXp9aE6B0p68boX4prWKDz80Ds6Gz2uKj4Bfgu
 BYs//gH4dTnBp83N0V9uUPH6LnymHhAlc+XmBnSQx7R1U7kOpbcA0ZkNo22D6joYyDYpj2
 TVpb1xK0TnYuHddBkruQ6n76NKaTc8A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-v2OOngz9OtiOOzGrEpbBJg-1; Thu,
 02 Jan 2025 02:34:12 -0500
X-MC-Unique: v2OOngz9OtiOOzGrEpbBJg-1
X-Mimecast-MFC-AGG-ID: v2OOngz9OtiOOzGrEpbBJg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6969219560A3; Thu,  2 Jan 2025 07:34:09 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.39])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9119F3000197; Thu,  2 Jan 2025 07:34:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org
Subject: [PATCH] tests/functional/test_arm_quanta_gsj: Fix broken test
Date: Thu,  2 Jan 2025 08:34:03 +0100
Message-ID: <20250102073403.36328-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.186,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: rYjuv8E50Ibo

ASSET_IMAGE needs to be prefixed with "self." ... this bug
apparently went in unnoticed because the test is not run by
default.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/test_arm_quanta_gsj.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/test_arm_quanta_gsj.py b/tests/functional/test_arm_quanta_gsj.py
index 7aa5209bea..7b82e2185c 100755
--- a/tests/functional/test_arm_quanta_gsj.py
+++ b/tests/functional/test_arm_quanta_gsj.py
@@ -35,7 +35,7 @@ class EmcraftSf2Machine(LinuxKernelTest):
     @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_arm_quanta_gsj(self):
         self.set_machine('quanta-gsj')
-        image_path = self.uncompress(ASSET_IMAGE, 'obmc.mtd', format='gz')
+        image_path = self.uncompress(self.ASSET_IMAGE, format='gz')
 
         self.vm.set_console()
         drive_args = 'file=' + image_path + ',if=mtd,bus=0,unit=0'
-- 
2.47.1

