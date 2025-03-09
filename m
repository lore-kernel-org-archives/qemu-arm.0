Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp607275njc;
        Sun, 9 Mar 2025 06:55:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNW+nXvs85ue/woeZqzNNhd5Gs8Iu9ZHCdlE2S33Rn9WJNQfYUSUYGhAJMvBJ3R98TTAj+PFqVxdhDIA==@linaro.org
X-Google-Smtp-Source: AGHT+IFEbne1egVKZA3KkXX8At41oX/zyMrEUUaSWOQ1Qpc5Y/LMw0CNbZxuXgtG+IDKO2w2lpji
X-Received: by 2002:ac8:5a4f:0:b0:474:e66e:3954 with SMTP id d75a77b69052e-476109c2833mr140055401cf.26.1741528508537;
        Sun, 09 Mar 2025 06:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528508; cv=none;
        d=google.com; s=arc-20240605;
        b=OT6PyuiaAYNZqDqr5PGEB4H7lM984KnyK92/mF9tz5JOntk/uqjHZJEHMiRNfjDpF/
         qXPA9bKvWlb27AZmp4POukUT28Q7SXdHAQex3y+Fw1jfnyJUvRrkKco8QSQNisGhX3kd
         XbI11ttxGpEjeOrqgb75zG0qPFtikFLxVJsrHVoW/eqg0L6Gb5Oyl9mv2KhmEe3iOxTx
         HAd70Z+wY9XmUATyZVZpzI1Wbfsm9Cg4S7n+yDPq8Wi0P1Ds/ZkRAwcTC5OeDkMQmSuG
         PDmRwPR2QrrIJBuOyvxNstLbqr84qI5SWEt6y5546T9MMhZoENJXvLon3YucYio8Kr0P
         Yp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d43SKxnFlK4oltjGpPS1VhDoxBGMDo6nkcz5M6euzgE=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=G2PVKBEyjdRfLIAhDvvJPzgt5imsN0R0rpeJ56mMUomlkiSv5zsdnAZg5kF/tqC2mS
         y11aOsWipqPBfO+K7yqtPGZixk34y5v8LO61VHcIeiFWr5B3298DX385RqZ5UjgVas1y
         5TXVhG5d3tBkj8Sm4OtxM+ZN21EVeAqk2Xnvy07uABlo7q95LZoR/gC9bZKyFbvMM41Y
         DpkWeiGdnF7pWy5eMLmY8APHKuHW4t/GusMg/csCRlniDeLgIH+MvRoUCdxpPQrDnsDL
         kuU5pHFlxT+Knj5pGTm2nlp5T3QQRS50dvUGvfhm9qLTGF0pRT3bcQE3CLXRiZ+JSBth
         +GmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FbQMG/Ij";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47689a80213si1694461cf.17.2025.03.09.06.55.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:55:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FbQMG/Ij";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH7H-0007VP-6H; Sun, 09 Mar 2025 09:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5x-0003CB-DL
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5v-00040y-48
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d43SKxnFlK4oltjGpPS1VhDoxBGMDo6nkcz5M6euzgE=;
 b=FbQMG/IjnylS0ZVA7EEEZchB5b0c4Nz/ajHRKBiNa4EsvJQlJlvfor20Q8lkwxC+wP/7AZ
 cr/ohNyZ0qrzN+1LObjgFQGiiDo3rzFdScirp0iIiQ4bkYtLWVb8UDTtEzSUW//+rnVhvN
 278di09Q9mmEPXOv/UI/golQ7RnOBtk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-fh8G7BDMOVK7pRAvsv-B5A-1; Sun,
 09 Mar 2025 09:53:26 -0400
X-MC-Unique: fh8G7BDMOVK7pRAvsv-B5A-1
X-Mimecast-MFC-AGG-ID: fh8G7BDMOVK7pRAvsv-B5A_1741528406
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E6F3D1800258; Sun,  9 Mar 2025 13:53:25 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 573DC1956094; Sun,  9 Mar 2025 13:53:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 45/46] tests/functional/aspeed: Add test case for AST2700 A1
Date: Sun,  9 Mar 2025 14:51:29 +0100
Message-ID: <20250309135130.545764-46-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: Q1gAyjTHtt+m

From: Jamin Lin <jamin_lin@aspeedtech.com>

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-29-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 8df6a97a2852..c25c96627823 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -31,6 +31,10 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
             'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
 
+    ASSET_SDK_V905_AST2700A1 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz',
+            'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
+
     def start_ast2700_test(self, name):
         num_cpu = 4
         uboot_size = os.path.getsize(self.scratch_file(name,
@@ -95,6 +99,12 @@ def test_aarch64_ast2700_evb_sdk_v09_05(self):
         self.archive_extract(self.ASSET_SDK_V905_AST2700)
         self.start_ast2700_test('ast2700-a0-default')
 
+    def test_aarch64_ast2700a1_evb_sdk_v09_05(self):
+        self.set_machine('ast2700a1-evb')
+
+        self.archive_extract(self.ASSET_SDK_V905_AST2700A1)
+        self.start_ast2700_test('ast2700-default')
+
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.48.1

