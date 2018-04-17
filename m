Received: by 10.28.4.212 with SMTP id 203csp4254274wme;
        Tue, 17 Apr 2018 13:44:27 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpOEmMVVRzMmsdaq488YI+Z3TRDkvW0fI6/T4oFljBvm+vMi1IThS5gjEeDv6Z/ykQhk4fz
X-Received: by 10.55.221.133 with SMTP id u5mr867166qku.376.1523997867325;
        Tue, 17 Apr 2018 13:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997867; cv=none;
        d=google.com; s=arc-20160816;
        b=gPC9/VVQ0bp7DzEXqhWXFhIo6zegIVMhUkjtNAvPPyE/dGtf9Q6JzQWgISxck5vhYX
         36n7s9VxcwtPqhuZiktp1CCW3TwdnGgqM7vwmyalWtu+of3y7ALs50zvQQnqQbGcTxvx
         JHNjQMqdWS5WhtmQQKdKEeeB1cdUs979QAxpmD8YqGeeF5jOEiyjQClvGpHaR9g3OwIo
         vr7v28HUnOnJy6mh+tUkHGjuuhLqXX46OkbLeY1+BqH3BPXtpoNVoyHN0R1yhrvuDZm7
         a6W+0UVayHFwZN+8uzSW1617uB6sorylc2y9JdAZW6Fvko5v8sq6tvz+4YbBHUt46xEC
         fnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=aBxdIY1oqvr7K82nKIVVBzL4b7c7k/ABpQ+yLjQPaTw=;
        b=QsqGiIKfrrTlsQB7UZ081VtukZzaNTLIFFpfV9paBqnb697+/jstg6IU5j/T+Qh0VD
         HepUEmJkwoP/aneiU5EOLHJsWMY/Vh+3s3GK3g3ugK0aqqvdgJp2geX9Tpyg7F6C3IWZ
         FECTTGMbnQDBFYmWsACuxd1NR2RL3LH4NzmtEg/x9Y59SLyk7qpYKqm6YGFh5AuPNNbj
         mRyb53sRWuXxaV3Bq5kF4EaScD4ieSTDSlu5ONHoEGeZmP5O+H82U2AhbocDmRlcSRz0
         Xceq/alZ6o15mcxFsH9f7LHQg+HR9LJbOQIRK9WS8DbnX4YDjccrb/PJ1EC0l65wTTh+
         DlCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=ZonyT4iq;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=gSlWzbjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n137si5869775qkn.283.2018.04.17.13.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=ZonyT4iq;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=gSlWzbjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XSk-0007MT-RW
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:44:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNi-000376-3Q
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNe-0006e5-U4
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNe-0006UW-EY; Tue, 17 Apr 2018 16:39:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id AF2FE6110D; Tue, 17 Apr 2018 20:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997548;
	bh=0oKULlpn8JuVsEz+Gu/ZC3s8HQ9Kx3McMdVTHUim1uk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZonyT4iqOQQaxdObkOWfr53EfblEWdvIHFx9EbVF7lRDGY8Mh4gsU2kSO9EmUmXZO
	wKNh8+zZfm+2nj3bnbl7uXlqFvHzTr56hcky7vrmH2dZtzGw9K0EiFTPYnVAoozXGO
	9Su0CexSzaenaXSM+FBJ9X9cvMp99rSg45Wb+kig=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D32961133;
	Tue, 17 Apr 2018 20:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997541;
	bh=0oKULlpn8JuVsEz+Gu/ZC3s8HQ9Kx3McMdVTHUim1uk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSlWzbjmTbldhC21xMaFrqazfRskm9Tu9w6ZwjDCduLrtxPPUnCwfYROdAQtCdyT9
	Yb0YObJIvJApbCR/vFqWGE8DLA2OUcOHTr97/InnkgEhH0T+wMMcpbHhR8o8AeOyP5
	k67Da+ERUNWsB0hXbHFKhzytDsS9rAynzSqslEmo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D32961133
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:57 -0400
Message-Id: <1523997485-1905-14-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 13/21] target/arm: Add ARM_FEATURE_V7VE for v7
 Virtualization Extensions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EdX/Janw6+O8

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 target/arm/cpu.c | 3 +++
 target/arm/cpu.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2228e4c..9d27ffc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -774,6 +774,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error=
 **errp)
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
         set_feature(env, ARM_FEATURE_V7);
+        set_feature(env, ARM_FEATURE_V7VE);
         set_feature(env, ARM_FEATURE_ARM_DIV);
         set_feature(env, ARM_FEATURE_LPAE);
     }
@@ -1490,6 +1491,7 @@ static void cortex_a7_initfn(Object *obj)
=20
     cpu->dtb_compatible =3D "arm,cortex-a7";
     set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
@@ -1535,6 +1537,7 @@ static void cortex_a15_initfn(Object *obj)
=20
     cpu->dtb_compatible =3D "arm,cortex-a15";
     set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f769ae..132e08d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1445,6 +1445,7 @@ enum arm_features {
     ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
     ARM_FEATURE_THUMB2EE,
     ARM_FEATURE_V7MP,    /* v7 Multiprocessing Extensions */
+    ARM_FEATURE_V7VE,    /* v7 with Virtualization Extensions */
     ARM_FEATURE_V4T,
     ARM_FEATURE_V5,
     ARM_FEATURE_STRONGARM,
--=20
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies=
, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

