Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp250208lfe;
        Mon, 16 Mar 2020 09:07:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsaEV9qg7hJm4E4Yd/00Qt4vwU8mg9lZwe1ZpC/bl7qzTf9znWbD9Xd/ER3sO7KIvDWMrqX
X-Received: by 2002:adf:8023:: with SMTP id 32mr60611wrk.189.1584374835389;
        Mon, 16 Mar 2020 09:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374835; cv=none;
        d=google.com; s=arc-20160816;
        b=ffvUXgDpnLU4lLlt5QMKwowN8bGzfR2+MaLF9zAPwrkdzC9+V5C2yAZArbDJ16wWpX
         BmJOnzLmNNqFLYafmhrOUOcn30/UlZrLu8vT/xPKknBcmUYht25Q4WEVVsq62qj8HDDA
         BHQxj1L0BPBvgDiSdYCA0vrkK8UO9RSoP17x+qfwfewhxNBEGbh3617lMwaO6d/8f2kO
         AGBmhnIJh0UI0br3jxbwG/Ug47/Zdc9rSK/pEuJnufv+i2mQ6GvZpepc45UixB0+iRsf
         VUfMg3AjLY00+mfqCqTqjtc2aizteECKsLZF7U1/2Vn9mJAZb9lCvPYtDO/4IS5fXahi
         v2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Yx+2IyWJnz1cKAJOo8cGVs9d/ga02LGh5bedgLQz1Rc=;
        b=wGcwY+VBLLlo2hyNI/IfCiRjTV7dy49XOw/CGXrssxJwtlF19Xh8cKu0VA0pm/grNY
         rOECnd0GprQ3pzgqQkorRlZ6nawBaFIg2qweebic+Q+KecUB1ViHzJnbj5/Cxx35RkPJ
         +ISKCyYu/HyZMBlznepAK9BAUhDt6p10VcYQReQLhMnJqF+GdeRr5zsZiYtqlK1UhHPw
         7+eaZadCGq06KBnLjUuLb5aPFZUf3lKULtD1p3Vvi8+thDuzR4pH0TSYgXOS3x6fnmsi
         Y4LoOpcnPmBBnb898EXz6d9FzqKL0Mo7t4J+g0ieezeK7ldiLlHmN2/hsAAGg8w5Fs5e
         i2OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fCFe26G5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id c2si257616wrp.550.2020.03.16.09.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fCFe26G5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yx+2IyWJnz1cKAJOo8cGVs9d/ga02LGh5bedgLQz1Rc=;
	b=fCFe26G5ukrvsFodtoKddSJi0ijLxfDTdthG7C3jXHgasHc+jyhk8csgPb7lCoyA6yqt+h
	wLjNmDx1/IzYD+j2pCVFOOfKv4TOt0DxIOtdmrUDIuV2rmgXb8iYcwXrqdx82S7Ukoq/BH
	cIFqPiTbUIIFWq6khNefda0ihGx8Ddk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-4rRI_dTxPxOpuCtJcz-Bvw-1; Mon, 16 Mar 2020 12:07:12 -0400
X-MC-Unique: 4rRI_dTxPxOpuCtJcz-Bvw-1
Received: by mail-wm1-f69.google.com with SMTP id m4so6001167wmi.5
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxNTHu0Y9BXexKmUFsNlCCh8LSzlOCW9yO82fm58I4s=;
        b=Uq6BogpbsDpcPvMjZBYlNkUCgn3LoNiOaG/macYBQOT/XXEGbVAjzN9AI95WIGJ/IK
         Vh6T9C3sYxaTz86vXsIV3dbUpImQRlMlE1qcwIz+iGlrAd2V98R43xDDAusDnseoU7Ex
         6nMiPTp3b0slRoyBysY/xOjsFDbO++LVMoPj4oU8BGjhQYa203dxI/lBPOXY6ULOzD5L
         hHpeNQYJ6RPCG+/QnXmZWdPwzijj2giBYtRLlUvBvkQJ2Imzt08Uif5O/Do4qE8BZy1e
         REHp5I/fpudWgy+/eztQuyTuCHRM3R/BiBSB4yt2JAlmnUyJEATsvvlO/inhvnb5qusA
         kXvg==
X-Gm-Message-State: ANhLgQ0CUf6oup9Q3vMLvgcEUbCnNsw94/QjMqTin++A6dO5faHzSp2m
	4KGsa7sCJVdt/7ctXlNqKbzQMfYkLdNLiZDLa7w5zayQjpPpIC9bhpXpKsVkX0VRG5u4HQOtKwW
	KTbQcKkLYNsGP4l5S
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr28456587wmk.172.1584374830945;
        Mon, 16 Mar 2020 09:07:10 -0700 (PDT)
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr28456569wmk.172.1584374830787;
        Mon, 16 Mar 2020 09:07:10 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id p8sm552349wrw.19.2020.03.16.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:10 -0700 (PDT)
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
Subject: [PATCH v3 06/19] target/arm: Move Makefile variable restricted to CONFIG_TCG
Date: Mon, 16 Mar 2020 17:06:21 +0100
Message-Id: <20200316160634.3386-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3WTmgPARW9/J

Simple code movement which simplifies next commits.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/Makefile.objs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index cf26c16f5f..0c6f8c248d 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,4 +1,3 @@
-obj-$(CONFIG_TCG) +=3D arm-semi.o
 obj-y +=3D helper.o vfp_helper.o
 obj-y +=3D cpu.o gdbstub.o
 obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
@@ -56,6 +55,12 @@ target/arm/translate.o: target/arm/decode-a32-uncond.inc=
.c
 target/arm/translate.o: target/arm/decode-t32.inc.c
 target/arm/translate.o: target/arm/decode-t16.inc.c
=20
+ifeq ($(CONFIG_TCG),y)
+
+obj-y +=3D arm-semi.o
+
+endif # CONFIG_TCG
+
 obj-y +=3D tlb_helper.o debug_helper.o
 obj-y +=3D translate.o op_helper.o
 obj-y +=3D crypto_helper.o
--=20
2.21.1
