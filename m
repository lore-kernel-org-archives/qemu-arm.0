Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2721650njb;
        Mon, 17 Mar 2025 23:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVltox79vIfqHpDBS+7XlKoacEhvElqLQb8uPlogGTFX46iwWyLJXvj83CqQkH8yit4N70lm+CfXlXvoA==@linaro.org
X-Google-Smtp-Source: AGHT+IEYbqeT18JiYxCxzAVNald/CcbHH7g322zeg7++nyW2d9h5d7HFAXcPcJMuqU6LjYdU3ztm
X-Received: by 2002:a05:6214:5084:b0:6e4:42c2:dd91 with SMTP id 6a1803df08f44-6eaeaabadbcmr288939136d6.37.1742278496082;
        Mon, 17 Mar 2025 23:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742278496; cv=none;
        d=google.com; s=arc-20240605;
        b=eOD2qQi7HWUX6pyRa4ZjgNqqMpm4NCoRZA2668iTX4Rh4GF/TGLzW8p1h/m+iG2YqR
         F3VF++hpAd9D9siyZUEi8k0DqarlFNdm8D76TXgGI/+dzYcGfeevLDXILD6UcHZAs0l7
         sHwdUFf2QoSZcD/fF41UCBT4g1IUsMwzatPIUwsuBXwYYF/EGNqQ7x8zKwVITV6Vz1qd
         yREmydm9YD3wS106+nVV87XMVpY4XPfHf9W0s2sg2HhUa8qEAou09RuvW+EvG21vQM1Q
         G1oZZgsdrJ9O43FdNEe/ng1mTetxq9Qla1wx5Fet/FxKf7iF9LMPUn4fqnPHkCQyXOIa
         Cung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=g4IlVi8Kd9FpdmuECV5xmTf5TXrxvHsvm/wM2NRvvsU=;
        fh=61PlRB7QxkpIPEvlkUx32rVdkm6wKgreh1phalvsJ4M=;
        b=QlEfUWE1rr/k3KG9hJKAJM+QEB36hYOvqS+1ycNYK459p/pXX3lgWOQpaECicZpVsb
         VCaw9w2T0AUxUymuqBm24sYn15fai6MkW/1Y+08rAcEKFZW7kie4jmJaZ1SXWqzFE5ht
         3tMu5FF+lh6a3eKKqBbqn5WNLHFMz5VYLscbdkY0npvH3TmSIKM3Zbr0u/ngSjpYv7AT
         zY/XrbpGvwbI01Kp4eejjjaVDY54rNBhsI5DqHkvCjedctYvWVkoZwJmxCNxaSbQtKc7
         TxC5dR4S556hK4mlHMCzZa8xR9SWzXbKGXjMmdWR2745MHYmn73eIrSBrZJSCY34fXpI
         Yhmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="is7gYL/p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade36cd83si112020926d6.389.2025.03.17.23.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 23:14:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="is7gYL/p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuQDr-0002eP-5b; Tue, 18 Mar 2025 02:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tuQDn-0002cK-Lk
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 02:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tuQDk-0002pC-Rn
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 02:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742278473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=g4IlVi8Kd9FpdmuECV5xmTf5TXrxvHsvm/wM2NRvvsU=;
 b=is7gYL/p6MiGUmHUxaLD4RBWT2Rh/LWOKrLKYzD+9lv3fP/6NModDMxp0X1pVYzJfTB00L
 Bcl9tZt0IsBYQ6Y7XN8kQA2VeMIeXv36rnk3jmxVcsoCUzHrLeifyhFC8B6fWKUF2UXKvh
 j20DRS4BYEd2s4GQi/Wy9O+LYh/SYO0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-_1-WI3NxPM6Nwa0oONP44A-1; Tue,
 18 Mar 2025 02:14:26 -0400
X-MC-Unique: _1-WI3NxPM6Nwa0oONP44A-1
X-Mimecast-MFC-AGG-ID: _1-WI3NxPM6Nwa0oONP44A_1742278465
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1FAAA180035E; Tue, 18 Mar 2025 06:14:24 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.69])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EF5A41828A80; Tue, 18 Mar 2025 06:14:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org
Subject: [PATCH] docs/system/arm: Use "functional tests" instead of
 "integration tests"
Date: Tue, 18 Mar 2025 07:14:20 +0100
Message-ID: <20250318061420.20378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
X-TUID: Mrr4kcLprsGf

From: Thomas Huth <thuth@redhat.com>

We don't use the term "integration tests" for these kind of tests
anymore, it's "functional tests" nowadays.

Suggested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/arm/bananapi_m2u.rst | 6 +++---
 docs/system/arm/orangepi.rst     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/bananapi_m2u.rst b/docs/system/arm/bananapi_m2u.rst
index 6efa222c16f..03cc5618c38 100644
--- a/docs/system/arm/bananapi_m2u.rst
+++ b/docs/system/arm/bananapi_m2u.rst
@@ -125,10 +125,10 @@ And then boot it.
 
   $ qemu-system-arm -M bpim2u -nographic -sd sd.img
 
-Banana Pi M2U integration tests
-"""""""""""""""""""""""""""""""
+Banana Pi M2U functional tests
+""""""""""""""""""""""""""""""
 
-The Banana Pi M2U machine has several integration tests included.
+The Banana Pi M2U machine has several functional tests included.
 To run the whole set of tests, build QEMU from source and simply
 provide the following command:
 
diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index 716062fca9c..d81f6c3bfd2 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -252,10 +252,10 @@ and set the following environment variables before booting:
 Optionally you may save the environment variables to SD card with 'saveenv'.
 To continue booting simply give the 'boot' command and NetBSD boots.
 
-Orange Pi PC integration tests
-""""""""""""""""""""""""""""""
+Orange Pi PC functional tests
+"""""""""""""""""""""""""""""
 
-The Orange Pi PC machine has several integration tests included.
+The Orange Pi PC machine has several functional tests included.
 To run the whole set of tests, build QEMU from source and simply
 provide the following command from the build directory:
 
-- 
2.48.1

