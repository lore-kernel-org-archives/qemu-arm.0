Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4479182lfb;
        Tue, 24 Nov 2020 04:54:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3X5hOnzFAvhepINvjYo9LAq0eWMh6iRwm8IBnu7TKcDc5nXcv4zQNH2G0KDZ6jS1qg9F5
X-Received: by 2002:a25:390:: with SMTP id 138mr6758470ybd.428.1606222481254;
        Tue, 24 Nov 2020 04:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606222481; cv=none;
        d=google.com; s=arc-20160816;
        b=IdTcvpElXLJbFOOBm8QUcAprjdfEYXC6I1btopK7UinO6gPF4K4Elptjf2lx3Y2Yrp
         KnCL+Ef3h65fdxty10JGKHFs8EnzUBrejg3fWFSHJ2qHbVhbLHWTYVI0RJ7bp8uL7Xaw
         serq/Xq8JeUdwtEsj80gkMPtbd1uyIEn7NcQs0sBd0lJGx+6jcAnQF+M0cafaVGJpHav
         77EtfQl3CgfzRveoIK6hmzyWQ0iaPkFaAoaTiMaPTOSN+WpvpcYrSv9lqZYeamSanxBz
         p3erZsuzpOwgYNfv+Yzl9xi8oU3s1zm5XSsMfd3ecRotn8xlh2RUecia3YkvD3XgLMWV
         fl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AWOBbJaK1zYGr1zJX2BYqMQCyMBOpi0Q0U6sClIlfIQ=;
        b=t0C9R7twcHMgc7hFDfxAzWLrPuhNqWqYMTPKGNbv/10P4kijvLIPuMdVA/baLUhHSo
         SyWSIzFonQXeyKrMQeRaQx1TROdkRjM0r10G1gcraEuyID1sNMq7+H3AhZ2F3Ut1PNAH
         zfCBuNa72jeLmdD6jmu6I/XjtqiQkvH3uRV6UOmrBeH6TfCdq5yAiIIc8IURMKA7/qRE
         i060AoMpI1pBLPqB58KA37Dz/dpx+MSXhJwGk/LITYQwA6qmckxCsY4F6mcOODRp6QIo
         +FaRve7hlVVM1V8XFGNM0QYnfJhk4q6UQkZ5zK1Ia/Zx5/vy0q7F3XZcnVOnGHcbt/jt
         ksaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z4wfG7Wi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p197si12926606ybg.430.2020.11.24.04.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 04:54:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z4wfG7Wi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khXqC-00031k-I5
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 07:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khXov-0002zc-AU
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:53:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khXoq-0004yq-MN
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606222395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWOBbJaK1zYGr1zJX2BYqMQCyMBOpi0Q0U6sClIlfIQ=;
 b=Z4wfG7WiQZSENpJPjEir2qE/iv0xFnG5GuQFg3TX2ccw32gJv72j5wSmdJl5SnCJHV5eQ6
 HQJFWeN28PMr1EEQKv5naFEAgkbnDdUc0wKsjxvnzbewnFzXu30Yb94pyDa7F/mTJgQ4v1
 hOfEseEN7RwdksLV+GGIl2rwO/qOZ4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-ioDg49OEMXKSTcgFQ6jHOw-1; Tue, 24 Nov 2020 07:53:11 -0500
X-MC-Unique: ioDg49OEMXKSTcgFQ6jHOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40F211006CB6;
 Tue, 24 Nov 2020 12:53:10 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F9455D71F;
 Tue, 24 Nov 2020 12:53:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] compiler.h: remove QEMU_GNUC_PREREQ macro
Date: Tue, 24 Nov 2020 16:52:35 +0400
Message-Id: <20201124125235.266884-3-marcandre.lureau@redhat.com>
In-Reply-To: <20201124125235.266884-1-marcandre.lureau@redhat.com>
References: <20201124125235.266884-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 richard.henderson@linaro.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RC/9R0IXrVM4

From: Marc-André Lureau <marcandre.lureau@redhat.com>

(eventually, future checks could be done with G_GNUC_CHECK_VERSION)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h    | 11 -----------
 scripts/cocci-macro-file.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index e391de15ef..82ceb33085 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -11,17 +11,6 @@
 #define QEMU_STATIC_ANALYSIS 1
 #endif
 
-/*----------------------------------------------------------------------------
-| The macro QEMU_GNUC_PREREQ tests for minimum version of the GNU C compiler.
-| The code is a copy of SOFTFLOAT_GNUC_PREREQ, see softfloat-macros.h.
-*----------------------------------------------------------------------------*/
-#if defined(__GNUC__) && defined(__GNUC_MINOR__)
-# define QEMU_GNUC_PREREQ(maj, min) \
-         ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
-#else
-# define QEMU_GNUC_PREREQ(maj, min) 0
-#endif
-
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index c6bbc05ba3..20eea6b708 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -19,7 +19,6 @@
  */
 
 /* From qemu/compiler.h */
-#define QEMU_GNUC_PREREQ(maj, min) 1
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define QEMU_SENTINEL __attribute__((sentinel))
-- 
2.29.0

