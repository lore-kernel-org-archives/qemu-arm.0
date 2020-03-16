Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp251594lfe;
        Mon, 16 Mar 2020 09:08:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsrdsEosTfSPazEGMdbJvDJxcmz7+o+ZIMdCS3Xc5KxRDUNIXqj+lDoHClJDRBuKdtkTmTf
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr19846360wmg.168.1584374896457;
        Mon, 16 Mar 2020 09:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374896; cv=none;
        d=google.com; s=arc-20160816;
        b=OGRIEdFP0Sg6DVaGnUT/vDwYAFgtkKyiv/2reSFh6Y8sgC1PEGwO150barEs9yaT66
         4IST/h2UP9DxRrjRxk4P2swtcCaLhXGssOsDfnc9S2t48uTiyEVhPlWUBC3y9aH1z9c8
         9zOO3ZOO4A9kidG5PEmJKJwwZvLBvirDumzisjGyXn//YrIhGqKWQxAC3ztumV30OjnG
         ZAnxDTy3XYOMHnS0OZRbMLMIzPvIkkycLa816nP9B1hCU0hhWBp2C2fjzMRMjMP6Wz1K
         muLc8cjXUggSuHGTq8rfnMzVlFphJYSarDf7LKtrcjWieeTDZA4WiJQIAj6nU4n0H0Y2
         1SVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MKKYJuqMYf+Eg6JeKj/mCe9oLeCOkHxBA5J4VpCzxs8=;
        b=PM5efShSo4mRTSFpRS8TBmcCj2YJWwcFLYzAVewIA331iL0ZZXZwFjlwN5cb29DFZa
         XRkYKZaFdC5IEEfP6OZdzKq6GFKCsilfNPpO2RNkCyu7wRFRfdqczwaJ9Ax1fpDoj7nK
         LP/lufhocP9FIrZxQV4iIOncXk6cuuk/mV0KueIOsjVWuuQWVUY+TBBns5FmVsrrTNev
         SnnXWhUvyi/W5cchaY3fLdZ204VCe1KmZ7+ouzkkOfgRXjiwOJ5feX9okRxbLAANs9II
         XDlhNQg97U1gLdwGtvPjJ9Xh6ib/u/MKzA/K6J40Ew6XhldsFgY8c4fZwBpXPmP9OcbZ
         +pVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fSngDGLa;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id i3si280187wrc.140.2020.03.16.09.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fSngDGLa;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MKKYJuqMYf+Eg6JeKj/mCe9oLeCOkHxBA5J4VpCzxs8=;
	b=fSngDGLaMD2STr5gmrXhM5DZhap3jd1EVrlfhHsHQmfYDLErRjcXSMs6KiaBeQlrmOVvW3
	S21kGtEQEvAi5Ht2cnfVEFmmzsIEjsWjBDqaINTdUXLkXPxRFF2/+ZZudGJVlYuwkBbaMk
	DhLdTqaNMQD1HnLZ8xtMMH5xaTgZfds=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-DvXDqcVhMsaqL5vuKVx11Q-1; Mon, 16 Mar 2020 12:08:07 -0400
X-MC-Unique: DvXDqcVhMsaqL5vuKVx11Q-1
Received: by mail-wm1-f70.google.com with SMTP id n25so4812256wmi.5
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QDZzTTq3ryTffSf3hGL4Htu3pk7V1G5isiblOtOvRc0=;
        b=WVJdf8SJhZ/+rt/DfS/FxR/TskyH0oqcgqk2anxOirXqr2VGYiTFZ+T3vkraXDh37k
         zE16g3uOUbOn5+mt2x73ZnJ4xlFzaB050QAT1ICcBtq8CkZzLEm4J/rE1V/yCurbi81W
         V8dnMYphJC26XFcgtHnSdTEWJvBKztufSImX/lmbZSJIVivScIurqtC0cA5Qx2E/QUG4
         Uw0n91xp88Ba5oP4YG0LosYD5He4mRLVBKz9/pAWKFpXylJszv4uWrnsWnDLM/VQ45b3
         Xl+7IumcrRiJgpbbuUXOxlKpcraQ0ZVhDdUMNDXH8fJnr3CzhVABxzLaFG+qXLQOBJc2
         jAPw==
X-Gm-Message-State: ANhLgQ2km6A66+1K5coU52LA/QVprdR2POv8oHg9NxfsErU4hZIpaRg8
	7VZMlWWLgAyHbJ+IZ8KfnR2cfrXcSlXWBnHVH7qYIjoaeJDajxoGULPYKAMW5N1qtZVTzR2IMMb
	oli/WSxAbYEaM+oGn
X-Received: by 2002:adf:ed85:: with SMTP id c5mr82534wro.41.1584374885377;
        Mon, 16 Mar 2020 09:08:05 -0700 (PDT)
X-Received: by 2002:adf:ed85:: with SMTP id c5mr82517wro.41.1584374885204;
        Mon, 16 Mar 2020 09:08:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id o23sm553874wro.23.2020.03.16.09.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:08:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH v3 16/19] target/arm: Do not build TCG objects when TCG is off
Date: Mon, 16 Mar 2020 17:06:31 +0100
Message-Id: <20200316160634.3386-17-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: SCv4SDKt7eZd

From: Samuel Ortiz <sameo@linux.intel.com>

We can now safely turn all TCG dependent build off when CONFIG_TCG is
off. This allows building ARM binaries with --disable-tcg.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
[PMD: Heavily rebased during 18 months]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/Makefile.objs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 993899d731..0178431549 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -60,8 +60,6 @@ ifeq ($(CONFIG_TCG),y)
 obj-$(CONFIG_SEMIHOSTING) +=3D arm-semi.o
 obj-$(call lnot,$(CONFIG_SEMIHOSTING)) +=3D arm-semi-stub.o
=20
-endif # CONFIG_TCG
-
 obj-y +=3D tlb_helper.o debug_helper.o
 obj-y +=3D translate.o op_helper.o
 obj-y +=3D crypto_helper.o
@@ -80,3 +78,5 @@ obj-$(CONFIG_SOFTMMU) +=3D psci.o
 obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) +=3D pauth_helper.o
+
+endif # CONFIG_TCG
--=20
2.21.1
