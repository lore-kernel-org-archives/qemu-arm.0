Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276686ejb;
        Sat, 20 May 2023 09:29:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+ACWIcmhBNQoOwpuqx68Xq4Mo0uBljrp4+6WC9iFY3NWKDo4fyPBIcY7u/pWU7tcriCSm
X-Received: by 2002:a05:622a:608:b0:3f4:ec9f:95e4 with SMTP id z8-20020a05622a060800b003f4ec9f95e4mr11198253qta.6.1684600162964;
        Sat, 20 May 2023 09:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600162; cv=none;
        d=google.com; s=arc-20160816;
        b=Pt8RVAYbmJKC1w4M9k9xredZHY/T/XYPoDPxUbok9brz5ln+QSBAtfWr8juhjlFbjG
         jCNzSwLBgtPSucctOwJpQ+2XdUiYlHnH5LMzbOSGwia6aOTEQHjqd/sIBOrX4WZP7E0j
         iiY+oHogiron4rhzN1zUjujLuX1aLyKevjXGSbnSgVyt8IQPaltqQkaU0x4ZbJcIXFt6
         vNAJxJS0d3QDS07NnC5LnyMJphUr8PesoG2fl7AsXdb2wQajecvepnmmLSKcqTEaGqsL
         t3rkSJpHcmRhwLhsB6Y8RP2nQFGHyxBmsQEDJzTYfKGKylT1Dbh9PYqDPcmJPuUQ73mK
         TGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qoslcpBGrNylzkKTGRsE4PymBBD7m5mdTsORg0M/q+0=;
        b=pEks6lkGMs/qviSvq49/4hzEIwkWWGt+FYOtadAa7XKdV9YG1QVbp1nZ7Cqlc7eTIk
         f6aqMYbNePDOKLsC0UeYXar/O/taVSn664sGcD5IOXM1JbHW2durNeNZqasQr/QZEQG2
         YSN5poVIzUoUS1b4E2tIHnDKXmhzWUzVthuvKNvmVMQnzBGmp9eMiKT7RP3ksHzOrF8j
         2/tJ7vi5FFvZECYg60iznyRBCGwjUacXml41IbMnDovyye9n6nNNJ/Ht9xp7pWDYyP72
         EVThiEP5Ht3zuXG5RDRNvBbe9zQXQMX6gxJvPnDFwJzAJv6M+tLfMW5MMjapdez/lr3t
         zXjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T64ArRbU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020ac85c4d000000b003eadeb5429fsi1342170qtj.473.2023.05.20.09.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T64ArRbU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PPm-0003WG-RQ; Sat, 20 May 2023 12:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPl-0003VE-PP
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:41 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPi-00034A-L0
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:41 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1ae8de081ccso9155915ad.1
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684599997; x=1687191997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoslcpBGrNylzkKTGRsE4PymBBD7m5mdTsORg0M/q+0=;
 b=T64ArRbUugSqIW7icPZKpZ9mqaN+wHRWLTFNW+h7CUqPl8ADdAGpTHdprrVGukBILX
 HKp4EAvdyZRK6GTkExyn3zJU9f1bfajV/tOTa9JYHgC2iO42w4BkODy8ShVHlIPGvhwL
 zow1U/aif9AhGdkFlMYiGXPHNuIHpUdBMVjg7neSb9/UP9ZCFmc+LsyA1tB0+NNw+gdm
 XtyXJ62o7QRIO0btYuaCxr4StKwEHqJWiMl19/Bj1n8VPTMReQv222t1T5hxEayH4/Z+
 hoUh7ZTkFceww5lYUJF0AaFnFCAkKAxoUiZkttYzzvgSOtqj4Ce5KxhSyR3wg7PT7weB
 MtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684599997; x=1687191997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoslcpBGrNylzkKTGRsE4PymBBD7m5mdTsORg0M/q+0=;
 b=h3YXuRqjgfN+fuiVXjLjJfx+UkoS85k8541JyiVlv1zy7JluhqWbhV4AgaGM79kh/5
 L/61yUiROXK+5sIWugZ210BX2n/+UedSM5LvhJHXoTHu6w3rxUPViI/+1n1JfCEeEZVV
 t+VU+XZbsaByq/OcOY0H+iDswrQfM0g7x/qhSIoFb+sNGTPHZF0/d5/x6uiTyj/d4HqJ
 uN4UoZm9nMc+0KwyMz9Np8M/XOS9Chz0KSETVNS3bMLwpRbUc+Q3o8s5eT7FFEFsxe4m
 QdsVlXESzHGWSOJFvmQIO9Q764JM1CSbPiiVtL1lfJL9hdhFgj3Lr/i01v3EOAvo8GS3
 WaCg==
X-Gm-Message-State: AC+VfDxaH/P1MvdRy3zkwOT68uU1Evep3KSZ430AYm43gk2r1ssvbCs4
 Gvdy+ymc3fAVqVvKpq41AJr3iuQF/FpIcyFO3/E=
X-Received: by 2002:a17:903:2444:b0:1a6:9762:6eed with SMTP id
 l4-20020a170903244400b001a697626eedmr7579258pls.22.1684599997354; 
 Sat, 20 May 2023 09:26:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PATCH 01/27] util: Introduce host-specific cpuinfo.h
Date: Sat, 20 May 2023 09:26:08 -0700
Message-Id: <20230520162634.3991009-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: N/A/zMpaW8Q/

The entire contents of the header is host-specific, but the
existence of such a header is not, which could prevent some
host specific ifdefs at the top of the file for the include.

Add host/include/{arch,generic} to the project arguments.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/cpuinfo.h | 4 ++++
 meson.build                         | 8 ++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 host/include/generic/host/cpuinfo.h

diff --git a/host/include/generic/host/cpuinfo.h b/host/include/generic/host/cpuinfo.h
new file mode 100644
index 0000000000..eca672064a
--- /dev/null
+++ b/host/include/generic/host/cpuinfo.h
@@ -0,0 +1,4 @@
+/*
+ * No host specific cpu indentification.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
diff --git a/meson.build b/meson.build
index 0a5cdefd4d..4ffc0d3e59 100644
--- a/meson.build
+++ b/meson.build
@@ -512,6 +512,14 @@ add_project_arguments('-iquote', '.',
                       '-iquote', meson.current_source_dir() / 'include',
                       language: all_languages)
 
+host_include = meson.current_source_dir() / 'host/include/'
+if fs.is_dir(host_include / host_arch)
+  add_project_arguments('-iquote', host_include / host_arch,
+                        language: all_languages)
+endif
+add_project_arguments('-iquote', host_include / 'generic',
+                      language: all_languages)
+
 sparse = find_program('cgcc', required: get_option('sparse'))
 if sparse.found()
   run_target('sparse',
-- 
2.34.1

