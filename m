Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1723071ejb;
        Fri, 8 Mar 2024 02:42:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOaVVXX4qn0Z5j3A0MEcRf1HhidsAhhjlNPFQjnd3QkzLu2/me/wM7hM70lC7C2wRonmmQriu+8LH9xux7rjQkS5Q0kxr4
X-Google-Smtp-Source: AGHT+IFEdefhREAOlCvUiILBO+IkfM1WgcMiC9p+Bg1OT3ffwxYYFvxGPiuNG3Hk42YPa+bctik+
X-Received: by 2002:a81:6d41:0:b0:60a:a94:6ef6 with SMTP id i62-20020a816d41000000b0060a0a946ef6mr314452ywc.20.1709894560543;
        Fri, 08 Mar 2024 02:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709894560; cv=none;
        d=google.com; s=arc-20160816;
        b=hKYH83C4uAAMh2F6j7fuqhE+PkXeb6bUNDLUVKmc07JWGUuaBHV4CcXnTMMJ+BGC9D
         NMEtI5WMgipzUQE82X/0j8iorUaIW3YLohbHzuf/M4oeBeFp00S5TWnaBD5tGFe14ZgI
         3Ta4Q2bFECF4eYI+uf//ufsf+2CMZcP99oQj4fQd83nfVVbjEjEznEss6wWLYHjDcqIn
         /ebjtJRag/UWu9qaI0L3P0zFNTQUpRjJHWsBfxKneuA9hviFP7UaKyP3pSyE8W67+LAV
         anEI1qTtbtJ2tu+vOG+oj8U9ORafuCk0o9EVldGk2uXCtxntGRTK+/31IV0jyZ2evJe7
         /wOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=R8lL/g6oDQcA7TfztXytEJa3Vv3eTQ3pcbjrOlW+zS0=;
        fh=qUk3Wv8M1ZXgdOPNY0X8vo/Vd3NFINnKkGEtKvKNqeY=;
        b=KP15KlwyPQuBfYzytRfQQg2tYL74uKbVejzkqpSwIFVr2LSyuAVlmOHWQWjDu2kgaC
         tuiF6NsR61e7OqTTFX9AGdO1DTpSWEjm2IhucGfGm8hYln+8gOV4GDOf5v3Cn6Q3x2Aq
         TjfgfLG1BNe/X6dP+zsc1J+kLZcTVt1nrcnQAVGAv51q4DDU4SKFNtrhMpxqDiOH7eyg
         +DaCL+1dWSH52yt036dsFjUw+fg1b9OsWp1uFXAhI6Ar1mNMnogRw6MuIVPLYfzltQWE
         dQkjRQhvK0eic+nIdSB6tRAuPXW5Gp3HYux4QzwbiMBNnGU6p2Ad3qCiZCXtH65prvRY
         HsAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EgVWcsqz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020ac87dc6000000b0042ed29fbdb1si15605438qte.617.2024.03.08.02.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 02:42:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EgVWcsqz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riXg7-0007Xo-H4; Fri, 08 Mar 2024 05:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riXg6-0007XD-Eb
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 05:42:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riXg4-0002cu-PF
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 05:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709894531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=R8lL/g6oDQcA7TfztXytEJa3Vv3eTQ3pcbjrOlW+zS0=;
 b=EgVWcsqz0xi4DjxlJoc16H6svBtHnfbGd4Y5BLRa77IswN95h9DL/Bn19GOc22mZ4z290w
 iQvgQqUoHda6dhyLTICxROFp8+bsgSVFFnTdVZjCF9rcIH1ZdHxUiYxkKtb8dztvSz7RcM
 ncd0ywLXiwucoNEEo8wCYJ4L3jS9ocA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-DoegQFvQMletphR2VExa_g-1; Fri, 08 Mar 2024 05:42:09 -0500
X-MC-Unique: DoegQFvQMletphR2VExa_g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E322D101A526;
 Fri,  8 Mar 2024 10:42:08 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B0CB492BCB;
 Fri,  8 Mar 2024 10:42:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] docs/about: Deprecate the "mainstone",
 "tosa" and "z2" machines
Date: Fri,  8 Mar 2024 11:42:06 +0100
Message-ID: <20240308104206.480929-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: ghBA8EJYgTQx

Support for these boards has been removed from the Linux kernel
in version 6.3 in 2023, so there are likely no users left for these
boards. Time to mark them as deprecated in QEMU, too!

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 8 ++++++++
 hw/arm/mainstone.c        | 1 +
 hw/arm/tosa.c             | 1 +
 hw/arm/z2.c               | 1 +
 4 files changed, 11 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 8565644da6..da5cc91eec 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -247,6 +247,14 @@ to correct issues, mostly regarding migration compatibility. These are
 no longer maintained and removing them will make the code easier to
 read and maintain. Use versions 2.12 and above as a replacement.
 
+``mainstone``, ``tosa`` and ``z2`` PXA2xx arm machines (since 9.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Support for these boards has been removed from the Linux kernel
+in version 6.3 in 2023, so there are likely no users left for these
+boards, thus they will be removed without replacement.
+
+
 Backend options
 ---------------
 
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index d2e2e68aa3..c6018c6e81 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -169,6 +169,7 @@ static void mainstone2_machine_init(MachineClass *mc)
     mc->init = mainstone_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c5");
+    mc->deprecation_reason = "machine is old and has no more Linux kernel support";
 }
 
 DEFINE_MACHINE("mainstone", mainstone2_machine_init)
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 3ca2e4459c..9241867ba9 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -270,6 +270,7 @@ static void tosapda_machine_init(MachineClass *mc)
     mc->init = tosa_init;
     mc->block_default_type = IF_IDE;
     mc->ignore_memory_transaction_failures = true;
+    mc->deprecation_reason = "machine is old and has no more Linux kernel support";
 }
 
 DEFINE_MACHINE("tosa", tosapda_machine_init)
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index eb2ff8dbc8..c7c26bd726 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -347,6 +347,7 @@ static void z2_machine_init(MachineClass *mc)
     mc->init = z2_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c5");
+    mc->deprecation_reason = "machine is old and has no more Linux kernel support";
 
     machine_add_audiodev_property(mc);
 }
-- 
2.44.0

