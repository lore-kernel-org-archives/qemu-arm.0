Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1758880dlb;
        Thu, 20 Jun 2024 09:59:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuOzKGpPsUeRr6O4lVO9DrTy5/c/YDmXFs08t54XeL6oyBmd/pctVHPGyuMCf4KKgulfQXpZMXzzek6G2vDij1KYKJmGsb
X-Google-Smtp-Source: AGHT+IEI5XjcU0NqygKfdwSu9F0d6F7Y71dvoyt0n0t4dK+DrhNp9AViQQ92k4bNy3OowgwEW/0z
X-Received: by 2002:ac8:7dc4:0:b0:440:6345:257f with SMTP id d75a77b69052e-444a7a88330mr72159791cf.60.1718902799638;
        Thu, 20 Jun 2024 09:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718902799; cv=none;
        d=google.com; s=arc-20160816;
        b=T+82jcMewIiVqs38rjrKUgb5XmS2qWCFSoyCB1I+pgBwjIzPbwHMWJ25q8KBsEpzvE
         PvfNpq7LVAYDpHAUl5iGaqfe5qZaScfiRUvQPDuUBWP2R+Q/wgUpb9poEYUZl3ENkcDO
         +OYq53OiMIusJ8TzY9OV3KxI2GJ6NUHjiN0kqIRNJV+cZT6SH2SLU1pJSw6DFuyTYGvj
         8o0hlltQBDyJDawn+1fb2AbgZNJC+0l+ufj6+ZRzg0SLKR6WSybDGIsEl0BgbFWgceha
         gsj3RZqronJrsfxZ/gL8LBWUNUQuEQ1Z3lS4OMK/hB4Q5rID27NImDulyl9hXcO3cTbe
         me0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ktzPbwVOi3JvFl/Gc7vY9/eRCqcDsrTeLN6084ufJhI=;
        fh=3Wd8C5ILZWfK4GrPw00UkAAsfCUTnUYMb3cFGB6sOew=;
        b=RifygFiBoiY3Dik9dmSDPBlgVHGCAH/O2z9FjcPn+dKyVLrc90XjN+svURoI6JtEZF
         SjqSIYqBCJSsBejAEeL5moXxYEorxriJ/+tHt2o+NA0VuwftV6fWTvcPIHZnoYmt8v+5
         BleiGve54jQVIpz7bijnnwofBs84Vxaa9O8hXwaxE26HNJpHwx3iXvKPOrvmLkeQq3zb
         OLv1H+5hmHWcCMp/sEuvhnD11k6h7MfjGx03M901nPHA6222M7+aMDF9kaQnwdEZ1TKK
         4xKAslqadHWlXHTBXRTa43RATmnjG0dIXQ043Q8zPSbA9FrbtI3yphsPRf8ih5/aFk46
         8yew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FalueFNc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441ef3ba0e0si193037571cf.47.2024.06.20.09.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 09:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FalueFNc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKL89-0006xk-Ck; Thu, 20 Jun 2024 12:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL87-0006wD-Dy
 for qemu-devel@nongnu.org; Thu, 20 Jun 2024 12:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL85-00014l-UG
 for qemu-devel@nongnu.org; Thu, 20 Jun 2024 12:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718902761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktzPbwVOi3JvFl/Gc7vY9/eRCqcDsrTeLN6084ufJhI=;
 b=FalueFNcKNgPWjjVGW3DmexhAshce4qYo8cYwbFpWAmUe1KFAfGQjy7C3PKgO5PyntwrLJ
 vY8QKtW8WLywK9QgKn/O86SLuhjJCDFbB1aHG5pE/95cr0SmMhHxYPvQB9bbGQEjzkB1r+
 4+a4U9jonbvFxmKyof/k/PmsDYI9df8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-353-3CpxUNziPd6U5coLl82dKQ-1; Thu,
 20 Jun 2024 12:59:16 -0400
X-MC-Unique: 3CpxUNziPd6U5coLl82dKQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA6ED19560B5; Thu, 20 Jun 2024 16:59:13 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.69])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 26FBB19560AF; Thu, 20 Jun 2024 16:59:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 09/14] include/hw: temporarily disable deletion of
 versioned machine types
Date: Thu, 20 Jun 2024 17:57:37 +0100
Message-ID: <20240620165742.1711389-10-berrange@redhat.com>
In-Reply-To: <20240620165742.1711389-1-berrange@redhat.com>
References: <20240620165742.1711389-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.152,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Y5qX8vtYtROg

The new deprecation and deletion policy for versioned machine types is
being introduced in QEMU 9.1.0.

Under the new policy a number of old machine types (any prior to 2.12)
would be liable for immediate deletion which would be a violation of our
historical deprecation and removal policy

Thus automatic deletions (by skipping QOM registration) are temporarily
gated on existance of the env variable "QEMU_DELETE_MACHINES" / QEMU
version number >= 10.1.0. This allows opt-in testing of the automatic
deletion logic, while activating it fully in QEMU >= 10.1.0.

This whole commit should be reverted in the 10.1.0 dev cycle or shortly
thereafter.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/hw/boards.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 187ed76646..ef6f18f2c1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -686,11 +686,28 @@ struct MachineState {
  * suitable period of time has passed, it will cause
  * execution of the method to return, avoiding registration
  * of the machine
+ *
+ * The new deprecation and deletion policy for versioned
+ * machine types was introduced in QEMU 9.1.0.
+ *
+ * Under the new policy a number of old machine types (any
+ * prior to 2.12) would be liable for immediate deletion
+ * which would be a violation of our historical deprecation
+ * and removal policy
+ *
+ * Thus deletions are temporarily gated on existance of
+ * the env variable "QEMU_DELETE_MACHINES" / QEMU version
+ * number >= 10.1.0. This gate can be deleted in the 10.1.0
+ * dev cycle
  */
 #define MACHINE_VER_DELETION(...) \
     do { \
         if (MACHINE_VER_SHOULD_DELETE(__VA_ARGS__)) { \
-            return; \
+            if (getenv("QEMU_DELETE_MACHINES") || \
+                QEMU_VERSION_MAJOR > 10 || (QEMU_VERSION_MAJOR == 10 && \
+                                            QEMU_VERSION_MINOR >= 1)) { \
+                return; \
+            } \
         } \
     } while (0)
 
-- 
2.43.0

