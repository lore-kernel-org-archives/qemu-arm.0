Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp293926njb;
        Thu, 8 May 2025 02:36:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiyW0pJmYB4edspwI5R1LG0DYmtXmpqQd6BJpfRKzM2o/BYr51gg08MrzycePAir1uJehXwF/chHSUJA==@linaro.org
X-Google-Smtp-Source: AGHT+IEGRcpS4g4rFJLQll9OtvIU9CFPn6wJDAuac7COsSTatMO8R+/L+Tst19xTRh8mZd5t408k
X-Received: by 2002:a05:620a:4881:b0:7c3:c3bb:2538 with SMTP id af79cd13be357-7caf7387d25mr915049385a.14.1746696967094;
        Thu, 08 May 2025 02:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746696967; cv=none;
        d=google.com; s=arc-20240605;
        b=OxxckSxgDbZkxfK53D9dlFIc18qEDGJubevqU5VT1qnVSQSgrlaMc/TF/W9eeWWmYU
         0CmVS1miiFwVMQ1rTbuOskpBdB7TplnyAlr3R5DKdVBO/g461DLW2/U9C9bAJoJMMrsb
         Hs6pA22EbXizAur4F3o9n0Y0ZjeMD2Y5WLXuP29OSi/FFy54H18OBvZJCQcSPEHRBTIs
         rAMSQ7mPan60wloFxZ9Jqo+G64p9rjHT3I4s5yYLCp2MPADgEveiPzjPpUFSukEBqhil
         hFgg1UTBBZ6FTrWTUATKafn171TpQ1VnvGdYuBGlYLpJpgH8ttN6LKo8ZVEW7iKi/Gak
         8Srg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UOqIO1CEm9qmOLzRB/pCK+LThTMuOpcZYyDIO1qxp7c=;
        fh=cp5/pjrGBiOSnVnIYR1qYu8cyK1vwqycjiVaN+zSIMY=;
        b=k2txYaypSYjuV2RA6WfYtxMDcklEdQ8qx80TBGs+vo4QtUZPJLgwYfGPH1QmyuZB9y
         nbfhuv7y8iZ0+5t8FMPvnygTz5r4pabfSxFAAfs+UqeiG09HSuEh5ooXYA+3jtxrr9vD
         ZichG+wnRKonq+qU3AFpX+1fF+ZvY9XiGBENnJIALvZpxLTHqmux4XTGZYA+juGA1Q4D
         SwVZRriFNmENTX+bZaiH3DsOlThNtYB0C66Jl1qP4wWGvTxK+mtMGP0sZlEPP2UMnuij
         JVvrs0tUw/uo8hjTLl8cxYNxjKdanvJaw86hRLwoPfgO5USpTx2cx3GXXkYVnKgZlL7Q
         tcYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E8SNQEJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f5427dafe0si37864516d6.372.2025.05.08.02.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 02:36:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E8SNQEJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCxfS-0005OG-1b; Thu, 08 May 2025 05:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfQ-0005O2-9g
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfO-0007lh-JO
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746696945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOqIO1CEm9qmOLzRB/pCK+LThTMuOpcZYyDIO1qxp7c=;
 b=E8SNQEJbzYgI4D9USz9PseAa7Q7UNJFpzLJsDB49aHhpVYOKorsleBnewmvTOv+RnRyY8C
 PIWFMYHGWGsMajoEN4v8eK4elZ7yvjl9FFBaiTaKt8re2/Fg51tcAKUJeUIwclaDQJH7p3
 F4wzvglVrN3/pxz35S/UT4pV66tXpzU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-mfxLLDxFMam3-wGcri2IRA-1; Thu,
 08 May 2025 05:35:43 -0400
X-MC-Unique: mfxLLDxFMam3-wGcri2IRA-1
X-Mimecast-MFC-AGG-ID: mfxLLDxFMam3-wGcri2IRA_1746696942
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3B36C180087A; Thu,  8 May 2025 09:35:42 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B32EC1953B8D; Thu,  8 May 2025 09:35:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/5] tests/vm: Update OpenBSD to 7.7
Date: Thu,  8 May 2025 11:35:18 +0200
Message-ID: <20250508093519.144004-5-thuth@redhat.com>
In-Reply-To: <20250508093519.144004-1-thuth@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0HJNUtIK1pTwEM3tzwiS9JB8Isp-s1gvNA5lLrjKOJ4_1746696942
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: jySVZcq9UY4e

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

