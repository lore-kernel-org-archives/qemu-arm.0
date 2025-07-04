Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1248945dyc;
        Fri, 4 Jul 2025 07:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX86TFPnfneyp68A0pckr7aeSU2UTCCBsnkibYMcm3jT6ckghAP8u6Kq6XMYm7l3kz1BcBIdd1KDmCTcw==@linaro.org
X-Google-Smtp-Source: AGHT+IGKEWzOkHcIGk1bvYTv9E5tnAAoc/5XtucsZWJzoxXabWvZZ4EU0rxsuHkV5laPSZNLk0Wl
X-Received: by 2002:a05:620a:27c8:b0:7d3:f9a4:d2a5 with SMTP id af79cd13be357-7d5df14c32amr221239285a.45.1751638872365;
        Fri, 04 Jul 2025 07:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751638872; cv=none;
        d=google.com; s=arc-20240605;
        b=FJDBPnsQUKCCSowHctuExjqrVoxC5+Fz9Z56e7YaeMWmFWWMk/EyhZo6YC5oEGdW1a
         mB9/O3hQZtzMq6oRKMLcyB0i+xg0TCFiE0RDuTFLhrd25hnrAA/VheVInvEfdf3FzzJP
         kpnGkAnq94vQUUuaTMFqVnMqap8tuclD7I2cUM8WMLRDtTTzVqmyBBcb6TqkvL7BuV/N
         lbdefWXF5ZKiQGrHRFDtDNqg/xbjPW0Xfho3gmOKiAdUJ0j9JECRFP46H1uPIp2Yy3Bc
         LHN15mngr2ckKbtNe96IUzRVYez+tEW3H8dFqczIjz5P7FqNFG4sLytW2BXf/wINiFx1
         4oYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=foOnlwyv8QrsQ+dZSOjXJBg+bfwZx1Nn38s3GMRWlXU=;
        fh=47nbNcdFoHdx4vFkcZle5phKNunXZjbcCr/4dP29blM=;
        b=F23xPriUT65+DwyYohvOzDITE1+Ane/PW3cWxKsRv2Q2ypsfrZnXL/ojF2HR1u8ke4
         4aGt2HKE8Vix79C6wa/3QMVWc056ssiEyuPf6aBCmKHuPaprMYx7wHdh3WZiu/dglSHA
         lfbx/K39OtWf6uXJ1XPN4UB6numNW3zCra7/CjlqnAVyFD9VcyO8QlTnhcy2F/hsFRcD
         x0ozk+PG1zJr+v2vQ3p09HdCU11V96jV6lAEFiK78bHzb4tiAjcLuF1FGry4FTDOkBJ9
         VrioYBIrtmazJgeC85ZpL1O57UTCVzfbBJfCcWh+3HT0eBiBGQ1oxz2FnXnUjJ3Ajt3U
         p5nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLnaoohp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbe975d8si215632285a.199.2025.07.04.07.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLnaoohp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhGe-0003WS-OD; Fri, 04 Jul 2025 10:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uXhGU-0003Sr-Er
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uXhGS-0003Lr-P1
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751638784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foOnlwyv8QrsQ+dZSOjXJBg+bfwZx1Nn38s3GMRWlXU=;
 b=dLnaoohpB9xU2MBpyz14zknLDmh2QzO6dhTb66OHRmagtBE58BPgWpkyFdV+LD+U1v8kEt
 SYUWe9SN5ziQsSqeKjsOyRCMnrXpjIy5jTLVdr6EWzaChYlrBPsXzl5rKZPcWe2Kow4L+8
 yYgf3Dyn/PPeUnVZAYYIIQMgRMkvIyE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-14-ks_vVw6fMvezY3SJ0inyyg-1; Fri,
 04 Jul 2025 10:19:43 -0400
X-MC-Unique: ks_vVw6fMvezY3SJ0inyyg-1
X-Mimecast-MFC-AGG-ID: ks_vVw6fMvezY3SJ0inyyg_1751638782
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E98601808984; Fri,  4 Jul 2025 14:19:41 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.44.34.37])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DBF4F195608F; Fri,  4 Jul 2025 14:19:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 3/5] arm/cpu: fix trailing ',' for SET_IDREG
Date: Fri,  4 Jul 2025 16:19:25 +0200
Message-ID: <20250704141927.38963-4-cohuck@redhat.com>
In-Reply-To: <20250704141927.38963-1-cohuck@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.218, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: QYl59nZixPFN

While a trailing comma is not broken for SET_IDREG invocations, it
does look odd; use a semicolon instead.

Fixes: f1fd81291c91 ("arm/cpu: Store aa64mmfr0-3 into the idregs array")
Fixes: def3f1c1026a ("arm/cpu: Store aa64dfr0/1 into the idregs array")
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/tcg/cpu64.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 00e12ed44ae8..d2f743fb3913 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -352,7 +352,7 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->clidr = 0x82000023;
     cpu->ctr = 0x8444C004;
     cpu->dcz_blocksize = 4;
-    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408ull),
+    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408ull);
     SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
     SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101122ull);
@@ -426,8 +426,8 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->reset_sctlr = 0x30000180;
     SET_IDREG(isar, ID_AA64PFR0, 0x0000000101111111); /* No RAS Extensions */
     SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000000);
-    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408),
-    SET_IDREG(isar, ID_AA64DFR1, 0x0000000000000000),
+    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408);
+    SET_IDREG(isar, ID_AA64DFR1, 0x0000000000000000);
     SET_IDREG(isar, ID_AA64AFR0, 0x0000000000000000);
     SET_IDREG(isar, ID_AA64AFR1, 0x0000000000000000);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000001122);
@@ -678,13 +678,13 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->dcz_blocksize = 4;
     SET_IDREG(isar, ID_AA64AFR0, 0x00000000);
     SET_IDREG(isar, ID_AA64AFR1, 0x00000000);
-    SET_IDREG(isar, ID_AA64DFR0, 0x000001f210305519ull),
-    SET_IDREG(isar, ID_AA64DFR1, 0x00000000),
+    SET_IDREG(isar, ID_AA64DFR0, 0x000001f210305519ull);
+    SET_IDREG(isar, ID_AA64DFR1, 0x00000000);
     SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
     SET_IDREG(isar, ID_AA64ISAR1, 0x0011000001211032ull);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101125ull);
-    SET_IDREG(isar, ID_AA64MMFR1, 0x0000000010212122ull),
-    SET_IDREG(isar, ID_AA64MMFR2, 0x0220011102101011ull),
+    SET_IDREG(isar, ID_AA64MMFR1, 0x0000000010212122ull);
+    SET_IDREG(isar, ID_AA64MMFR2, 0x0220011102101011ull);
     SET_IDREG(isar, ID_AA64PFR0, 0x1101110120111112ull); /* GIC filled in later */
     SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000020ull);
     SET_IDREG(isar, ID_AFR0, 0x00000000);
-- 
2.50.0

