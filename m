Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp4587733dlj;
        Fri, 17 Jan 2025 11:12:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJ3iSCoUbK9dIyBTTzM8jcIJ3th3BCyIwh5A8wVOfEQpOue+9z5uEyZMIP5YjS2D5jNkHAi3rUhz/JLg==@linaro.org
X-Google-Smtp-Source: AGHT+IEmGJqI3FzhO1L+F2pTwA7rGrV9CPzrxzQtfqf8thDxFp/0+VwCEO68eIANLLgi3h8WGs8L
X-Received: by 2002:a05:620a:439c:b0:7b6:d631:2669 with SMTP id af79cd13be357-7be6321be46mr573742985a.21.1737141120085;
        Fri, 17 Jan 2025 11:12:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737141120; cv=none;
        d=google.com; s=arc-20240605;
        b=SnqLBWxj4YnTsnjrcT8J9CiBplPslXIp55mZV1kxDsxjeeQINHylyO8JHT51/myRsE
         7jLTToZ5TzlYAMjEWiwqYlBnRQiFO2OQN5ZKdDVpRvMtXodFzohvMJl4jwvcRvlU0iuZ
         3i7txUXpDg7Kno4ZU/GOa6C7glTmPVnxF/GaA4lLfAvlyyOa17OiMSMZa6tvbsVngTPV
         OsdmfLkv8jXZozZik0vyoPODRLwM7rwUUD7t3fEC8LYbcd9N5hYEwhgVD7aIAg8V6Vfb
         U1Y5QcqDEJciDIBr3rxgHCxScpcDw0WqdCmK3sm/QAmFy6YLj8l73f2D1kGnWr/WFPrZ
         vojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Vocor7ji6a0ZalKT0F5SpYX94+ZVs7kkvUFkosAMxTA=;
        fh=0qJRPn8Aec9dj24glFx670jIO/zAUcNru1RYgkIoYpw=;
        b=Tc0EDxYboKbqazCvBzAhRlPxsEmlh2LHgzBbO6XBBOtGVLTo9dKV8tXQasC5chQpI4
         D/WFMJIkY4u0XMw1GVrU5iTnftViKEKdZXXoB7Mh9KPaz0uFLnuZIFhkpvD4WISqp+/y
         dHMkiyg8hRIPnVuCTFOyiuedMQhlHn6pxxFxEj35wO83A2O83Uh1C61YYUWC/W547wCh
         Lq5ytig1jCbWWpHMgxTU8f62LziXLL38I1CDEWFL2db7CDivyyUjEnuJp2uR0FC+E9lR
         tSRS7ctCuUWf1sonPV6JUXUI3Ccwish+cAsM6PWRBrM6iyqXw4BfslixHiGTl56ojVVc
         dxCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ezcQxH2v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be61477d53si327995485a.180.2025.01.17.11.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2025 11:12:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ezcQxH2v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYrkf-0005gC-He; Fri, 17 Jan 2025 14:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1tYrkf-0005ef-00
 for qemu-arm@nongnu.org; Fri, 17 Jan 2025 14:11:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1tYrkZ-0006gQ-Qt
 for qemu-arm@nongnu.org; Fri, 17 Jan 2025 14:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737141082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vocor7ji6a0ZalKT0F5SpYX94+ZVs7kkvUFkosAMxTA=;
 b=ezcQxH2vaKmoI6epdkEqV3JDB6Ad9d/X3UFGuYemKfBO6ZXCcx5Yf/5576CrwtchNVM9Mp
 8NcWtC5Ka6CDBQdYzllwrbrVW89b7E9O9Ja0Mr1jS0r+z+Yvf44tow9D/mZM9R/iE7aoQ3
 xQbjExGBmTBBHdvnh82wgQ95Rpb9tks=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-eVwqRoYXOYGGHCHlAz-6gA-1; Fri,
 17 Jan 2025 14:11:18 -0500
X-MC-Unique: eVwqRoYXOYGGHCHlAz-6gA-1
X-Mimecast-MFC-AGG-ID: eVwqRoYXOYGGHCHlAz-6gA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C806F1955DCF; Fri, 17 Jan 2025 19:11:16 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.39.192.203])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8590519560BF; Fri, 17 Jan 2025 19:11:14 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, maz@kernel.org, sebott@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH 2/2] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
Date: Fri, 17 Jan 2025 20:11:06 +0100
Message-ID: <20250117191106.322363-3-kchamart@redhat.com>
In-Reply-To: <20250117191106.322363-1-kchamart@redhat.com>
References: <20250117191106.322363-1-kchamart@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: U3gRkWpKbDlA

PAuth (Pointer Authentication), a security feature in software, is
relevant for both KVM and QEMU.  Relect this fact into the docs:

  - For KVM, `pauth` is a binary, "on" vs "off" option.  The host CPU
    will choose the cryptographic algorithm.

  - For TCG, however, along with `pauth`, a couple of properties can be
    controlled -- they're are related to cryptographic algorithm choice.

Thanks to Peter Maydell and Marc Zyngier for explaining more about PAuth
on IRC (#qemu, OFTC).

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/system/arm/cpu-features.rst | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 78f18c87a81..7f99f7614b4 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -204,11 +204,26 @@ the list of KVM vCPU features and their descriptions.
   the guest scheduler behavior and/or be exposed to the guest
   userspace.
 
-TCG vCPU Features
-=================
+"PAuth" (Pointer Authentication)
+================================
+
+PAuth (Pointer Authentication) is a security feature in software that
+was introduced in Armv8.3-A and Armv9.0-A.  It aims to protect against
+ROP (return-oriented programming) attacks.
+
+KVM
+---
+
+``pauth``
+
+  Enable or disable ``FEAT_Pauth``.  The host silicon will choose the
+  cryptographic algorithm.  No other properties can be controlled.
+
+TCG
+---
 
-TCG vCPU features are CPU features that are specific to TCG.
-Below is the list of TCG vCPU features and their descriptions.
+For TCG, along with ``pauth``, it is possible to control a few other
+properties of PAuth:
 
 ``pauth``
   Enable or disable ``FEAT_Pauth`` entirely.
-- 
2.48.1

