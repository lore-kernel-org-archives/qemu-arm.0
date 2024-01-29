Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp26659ejk;
        Mon, 29 Jan 2024 00:19:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaf2EKfCTdx/t3ThwNtFehpsc7H+5MXjLaIydk1CPdNn5D92MStkK8RD0MdnK4JkKXCUQE
X-Received: by 2002:ac8:5a84:0:b0:42a:9910:3be5 with SMTP id c4-20020ac85a84000000b0042a99103be5mr4248418qtc.8.1706516361045;
        Mon, 29 Jan 2024 00:19:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706516361; cv=none;
        d=google.com; s=arc-20160816;
        b=ODm6d2lvALFNVE1FXmWwXUVsWyfq0i9xpjWQYay/KSXr+DfuGvbZspw3bG/eRCGuL/
         +2xTIWy+8dbsKc2D12Xk8uzU0EK4ckUvRrYYWgx0dY202B0KiPWH9RJyZa0D8nRgL8R+
         Ru52cyIKi4FEdR+X+2FIkFrB22r2qRATbhvHi06KIjrn13IrLkCS10XId0ERDnFpw0WR
         DarD7MbA+1gxerF4DHmZvEOghYhAsAMiQPV0ivI9+kTFV20bWoSCbMtf5B8Adk7QZkG6
         MpQYtcI8AU2U16FNLnBXiI2yBpGXnHKRN66pNEmoVXxODBEdSEYZ4bs0d/5zRjnXeaUM
         KrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DH6dhIDWWXABC1ihzAnPTR/OVgE0/mIvBxbIQhqVWGs=;
        fh=4MFjWk99T14cOfrd/QAZZe1F8g1v4KV8Ub1F9CwTKmk=;
        b=rfnx+mOcWDPham/FXO5Ax+nnA9shxWodZv/XwMszFzwV8qHl3/1KBEATTAPGhQBFID
         YbO/uYKOjF94/2y7agBeQJ96IYbx8KrTcHkJrrd1pzH05hbBlS6EqhTujfIP84dFSZiW
         xvwbzSX/SUh0U+QPpiCfZa+Uoo0AGIyRwSNoxlkWUbKjpHZj5nCKc2iZU0QnOtnqAKDH
         AM3+LN/21VgOu7WNJGXnR8H9U7dlUcbnCqsfK2XkMHFUgBB0R1erN71G38Mx0Utd0ccr
         AO54EJmosqMALYTdncZXCaypGemdHWvTrhbGfI99tBzMoNe3KYinAb2kArlBrb06R2pI
         B24Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZHg17iU4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a05622a148a00b0042aa94859a0si716429qtx.738.2024.01.29.00.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 00:19:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZHg17iU4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUMr0-0007BQ-Ve; Mon, 29 Jan 2024 03:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rUMqw-0006vr-QA
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 03:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rUMqu-0008S2-7f
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 03:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706516327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DH6dhIDWWXABC1ihzAnPTR/OVgE0/mIvBxbIQhqVWGs=;
 b=ZHg17iU4VCvrYtVrZxG01k9p9Z8j0skfnXA6VED3HufpTNGCGjq9KQdp4+Abvg0HXWAlyZ
 XZ7vY6jPLKhYCvQiC4rwdyk5Fs5XFPYT0wwnmDzt00y1ehCX0jDg9UZHOC2EJmGlBlZEu4
 oHS2SiGm+pIV9+hStIzgqHpBnRLpsFQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-awp6nj8CP9CxSzRHTmfmsg-1; Mon,
 29 Jan 2024 03:18:45 -0500
X-MC-Unique: awp6nj8CP9CxSzRHTmfmsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D23FE38130AB;
 Mon, 29 Jan 2024 08:18:44 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83F281121306;
 Mon, 29 Jan 2024 08:18:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/3] target/arm/Kconfig: Stop requiring CONFIG_ARM_V7M
Date: Mon, 29 Jan 2024 09:18:35 +0100
Message-ID: <20240129081835.137726-4-thuth@redhat.com>
In-Reply-To: <20240129081835.137726-1-thuth@redhat.com>
References: <20240129081835.137726-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.485,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DGwf2e6EIoSF

Now that we made sure that ARM_V7M code only gets compiled if really
needed, we can drop the hard requirement for CONFIG_ARM_V7M in the
Kconfig file.

Tested-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index bf57d739cd..3fffdcb61b 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -2,10 +2,6 @@ config ARM
     bool
     select ARM_COMPATIBLE_SEMIHOSTING if TCG
 
-    # We need to select this until we move m_helper.c and the
-    # translate.c v7m helpers under ARM_V7M.
-    select ARM_V7M if TCG
-
 config AARCH64
     bool
     select ARM
-- 
2.43.0

