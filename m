Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp251565lfe;
        Mon, 16 Mar 2020 09:08:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuB4yJpYCke4PkGxsWLvDu5yLlD1fO8H6uXmJWUb5Rknce+oNRpbIPzai1KsMteP8d7hhRB
X-Received: by 2002:a5d:5504:: with SMTP id b4mr61047wrv.181.1584374895394;
        Mon, 16 Mar 2020 09:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374895; cv=none;
        d=google.com; s=arc-20160816;
        b=P9r9dW38KNjr66g2aXMSoeqQ9CrBTbqGcZWL0WwjwJ3VQqG9TBJzFVSdmwPYlH+mfR
         +PKL2fkBaxkpzuC/mkK0bBOYh4+Wms1B6mp1jYraR7Gekot6mlE6Hm78vLRJzJZn34EZ
         u7JCw4hH+VozRefWIguG0cOIfExSu3fxoMsLSJ7fjTa7YtiZkWznyCvdXlBlI/Mx0gwQ
         Lky2uQNFvSDBHg1akmue48V5/N76KNPq6Yau8lHYWJtfuePMPrTRhGdP8lwHK/jwOy+3
         CSgy1IqGWGOPLGF9ilgLFKNx8i3A1/vAMov1LHxcdU4pnlUJDjXzk5b9qfy9JOeqSOt+
         lXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TnhwsKKx2kZHqqWBEaWLP72fKQXGq24cvJF0rKa3l1k=;
        b=R1o7MaentFV8HU2dlCxh27hDc9hJoqZoK6/N/vNB8fsq105CFLv3zSPtSnewkRPwX9
         Nw/xNgnQ8wNaYB1gUKkImLlyZZZ7ZgTzB9t3SWHNomBUZJ/AYt4+4p5/Cw2bJBGgMuga
         OhfxykCuR9qOM2kaKvwnMoIuZbmniHE8eOeRQ5q7zMyjydRzEZ18q4laeGyKUIdc50mr
         LBNOekbMlUEX4XzE45Ydbh5FfuWJTIUNPM33ozfI7BX2E5Zh6MMLWoc+BA7cjkjC3P5e
         EhQczNOxs2zVbDhDgTdQe2cQXtEJA6MfL09bMmq3stgcL9kgDusamvHq+N1lAFW497Fj
         sLQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KPhMxDSU;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id d186si15756293wmc.134.2020.03.16.09.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KPhMxDSU;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TnhwsKKx2kZHqqWBEaWLP72fKQXGq24cvJF0rKa3l1k=;
	b=KPhMxDSUnqCxokrf1pPv1AHygl9hIW4R3zS8RYShkU//v6t2UzCLkOZkE0gDwVckJIUbvn
	vaZzJDf0GnC/BCufRJ/bkhZmVJoZ3cTvXCS1utYZHBrEcO2XdYOsDfRe2Y1Ep2P6ioIEqU
	uNfvaQFNLvLfZIjd0EOVvDHLk5OSmFo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-7QWMnThtMRmD9XxJISwmyQ-1; Mon, 16 Mar 2020 12:08:12 -0400
X-MC-Unique: 7QWMnThtMRmD9XxJISwmyQ-1
Received: by mail-wm1-f72.google.com with SMTP id p4so5071057wmp.0
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMtlamo7Zl3wCiVgcr8iciiwh4khJI79F07LAInMKRc=;
        b=bFE5UORwOgde5XiLm2FaIYRQtNsBEKSrnBqj2jfc7nndxREMw8Vd6+5RcVxLalC3/f
         stJuPpVsn+yhob8meASzCXGSQOqrhgoIkSNCnoGk/f2B2pS6OeUvpkg1/svR+xasHBfm
         vEjE6/hqP9wuXpYVOY2vMZnIdxEa2Ct1IxpLVaNZFAfXeoc7qU0zrvMLqcggAd8bjbtM
         zLHb1hxvbDIQwgkBD8Zo3b+MTAYbBlKbOwra5aFG7YEB9NweoltZ2pVuixrM+NVYGuE6
         TpoUupmAlNSEo0oRv9RPgGQHyWQxSTHQP5UeC+XUVwKfAIWRb5FfhkecLuV7j/aaUnf2
         uzQw==
X-Gm-Message-State: ANhLgQ2vI8W9awubJGM0ulq7wQnRv/kPpMmooIJDM/YBdeMzZCLZx/2t
	fn4jGSu8r1I6b94hSV0NgOaTIgt9IjY+opKWpyygyDa90YSk1QbyIKt/z6mFeBUwiX8WQdaZBxN
	zAGzi/3xpDvcGtr4p
X-Received: by 2002:a1c:3241:: with SMTP id y62mr29793843wmy.66.1584374890985;
        Mon, 16 Mar 2020 09:08:10 -0700 (PDT)
X-Received: by 2002:a1c:3241:: with SMTP id y62mr29793824wmy.66.1584374890780;
        Mon, 16 Mar 2020 09:08:10 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id 127sm70683wmd.38.2020.03.16.09.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:08:10 -0700 (PDT)
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
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine on KVM
Date: Mon, 16 Mar 2020 17:06:32 +0100
Message-Id: <20200316160634.3386-18-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +iukLzyhI9WL

When building a KVM-only QEMU, the 'virt' machine is a good
default :)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d0903d8544..8e801cd15f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,5 +1,6 @@
 config ARM_VIRT
     bool
+    default y if KVM
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VFIO_AMD_XGBE
--=20
2.21.1
