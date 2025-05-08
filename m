Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp471190njb;
        Thu, 8 May 2025 07:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAYEByTAufscsJ6YVU6FRbndH/z8RMuJkvej1Dj9pdJOvRQk8gKaumqiP7Dn3yrpYhI30FHUWjESK9Kg==@linaro.org
X-Google-Smtp-Source: AGHT+IH5jk24ujy3HZFFEr6g0AmvvAhZqD6kNUIM6v2rBRg2IXWTaHnNMScbOKykF+AgvWk0w72J
X-Received: by 2002:a05:622a:40c8:b0:48c:ff99:4064 with SMTP id d75a77b69052e-49449212435mr53854161cf.5.1746715350432;
        Thu, 08 May 2025 07:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746715350; cv=none;
        d=google.com; s=arc-20240605;
        b=SbL4q6fUy3uXSoF1peNiAYaLrEk9/13dCUhzM0PeCrHfUNrTMm/HvtwiCTg7m1NEXn
         HiuFp3RR+W3yoIobzIg1i/t0EWPhD06XcQ9H7agGohwdJlvNG7S474xI4ZpwbPLceoo8
         vLfATs8gJNhOZeEGTKgFXDhz3hej2JqAToytSX7/IfahIBpcSvLS1mJGm8RVyi9uiBYX
         XoEcYDa5BmcIjWNp4jFBZ02xjkgwRE7M0u81SOm7TqLQaJ5uWbcjyuuazOM/nXUmn5tw
         nAKeHTWmwBFtrnIfaLgz76+MKjfTgFdWivQVMoG5ct8x1JIbuLL1mVJMupmk8rkGRB0n
         w4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UOqIO1CEm9qmOLzRB/pCK+LThTMuOpcZYyDIO1qxp7c=;
        fh=mV1hj/g4izUEtI00kKHr/+DcS8Ht1XYt/8wmIYnJvQU=;
        b=U0I+5tEkfg0NwEWINYdiwYuS0KY+TA/Tfs0zITs70Ij++8FYpCjGQH3Do7aeOBAngQ
         d7jKkGocdsBG9/hXnHaFqkL7dIlAt8gkFc4og/AOvvO7H2BTyLfJ9rHDenCBLcIA6Z8B
         rPEgbzgjwagF1Cl4OqBJmuooA/rous/XNDymnntC9s2WLXsCb9Mnal/Jl2RD8wckAD2g
         lycKtMiNgX99DpZxj0sfz5xpeCLGR00Yd3zk87R80JCltZVoAhCl6ovAS2FFYy847dqZ
         8bhXbDfJ/vRgsqaEtW3Koqozh9ZKq5qpjhhFciTO09b3CCXwO49of6jynqsy0maYngAF
         n31g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q3+dnltu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49220f81a24si48293591cf.45.2025.05.08.07.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 07:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q3+dnltu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uD2S2-0006M0-HT; Thu, 08 May 2025 10:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2Rg-0005pz-28
 for qemu-devel@nongnu.org; Thu, 08 May 2025 10:41:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2Rd-000502-53
 for qemu-devel@nongnu.org; Thu, 08 May 2025 10:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746715312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOqIO1CEm9qmOLzRB/pCK+LThTMuOpcZYyDIO1qxp7c=;
 b=Q3+dnltu7yIFApXBsnn13e8ieWNQU7woRceqsooj+XWYbAcmyHfFVfS2D/Br9wY3UrATDx
 u5BSRO9nVEW2onr+/LZvSs4+PN+kcYLmvHz3m6VVY+oQpEoJj2uK9JXo8KEwRJyxZeRFnf
 16i5svpr64tOI4aYPo45icfZL1qqfIo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-465-MTXY0f4yPRCwHUc1hxCV-g-1; Thu,
 08 May 2025 10:41:49 -0400
X-MC-Unique: MTXY0f4yPRCwHUc1hxCV-g-1
X-Mimecast-MFC-AGG-ID: MTXY0f4yPRCwHUc1hxCV-g_1746715305
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DD6DF1955D84; Thu,  8 May 2025 14:41:44 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E4DE719560AD; Thu,  8 May 2025 14:41:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/5] tests/vm: Update OpenBSD to 7.7
Date: Thu,  8 May 2025 16:41:19 +0200
Message-ID: <20250508144120.163009-5-thuth@redhat.com>
In-Reply-To: <20250508144120.163009-1-thuth@redhat.com>
References: <20250508144120.163009-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 1DJfWkDi4Eaf

From: Thomas Huth <thuth@redhat.com>

OpenBSD 7.7 has been released at the end of April 2025, so let's
update to that version.

Reported-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 5e4f76f3988..2ea86a01bad 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/7.6/amd64/install76.iso"
-    csum = "60cba8cb391b50bba8fa10fc768bd0529636f5345d82133c93e22c798d8e5269"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/7.7/amd64/install77.iso"
+    csum = "da0106e39463f015524dca806f407c37a9bdd17e6dfffe533b06a2dd2edd8a27"
     size = "20G"
     pkgs = [
         # tools
-- 
2.49.0

