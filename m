Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCAFCDB479
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Jun 2026 12:56:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wc0gL-0004aO-D2; Tue, 23 Jun 2026 08:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yisooan.dev@gmail.com>)
 id 1wc0gH-0004Zh-Rq
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 08:56:46 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yisooan.dev@gmail.com>)
 id 1wc0gG-0008WM-9E
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 08:56:45 -0400
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-37d70036426so1571745a91.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 05:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782219402; x=1782824202;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6swxASzh/shRJLEp7Pk/oVO3/j140Xn0WoM0mhZf7Uc=;
 b=ndA9po1oo572FovtT5DndsIgOQQGI+GIvQwePwKpm1OsjuFAl+4Q/NnJ+CxUzr78P/
 dnKTcuiO7joyhonHnk+KxxUcK7ajguIhjJ6/Ba4AwQJQlBJcfnTdm+XU34cGp9RVp8jC
 W/NnVc9hgsYNOlqo0jz64cpl1uIWqWPJSyxS2vNWryFL+aKE/ezZpftVJt0Zi6fmB4L8
 DHdfeWMkk2pgAQB8K0QnkOg82mV3yeO0t1jjtu9QXYREJPOFjFrNG9/vAPNWEruUgBDm
 9Ipw00yheJiTWW8ipChkZcwrzcgYYD5vv5dPelqdOGlaMQ97gLc02ljBk+pMTFmvJCun
 hzPQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoWeeFIgoWdMX2EHey2T/9cM+bK+JDTa6klnBWG3ql1R8eem8cbMSw/CNXI1xgOWY5VQ1s7GnmWRQ==@nongnu.org
X-Gm-Message-State: AOJu0YyE2z3axp1mzs9a26aFllP7C1fulXqHfOyKc2bNQgqkmdmVJSpC
 RMAmbf5dQhbrvJ7s7XnFoAQDrsUTtYFRrprUNVxcUa7f75jYEKewKNo0CUMM0A==
X-Gm-Gg: AfdE7cnG+F7xBW9gwpayT+pweKwSqQDdGtuDcMz5mRtk3h9hKddF+4oO8jSU57jqiLS
 DYfpdfDtHv7Uytpcp+6mFwOptE+59BZs84S18aiRrBEU5t6hywjXM1eGNaaHcWGKweixGJz0Fao
 KcFvXXmYUb7+9GaNQTpsePDicpmb4IzaxhHYQQfPS+5wLrcVF0PxIELGw9IyTtid41w2z2vLa/B
 WH5cxTvRQ9RxiOz8P2C9qQRUYZP4VMWwOdejhmgP4aG97mtvbbD61d8TMZ+klKuxtjadCo6rZoz
 j+RB4/HseXDEyTJLi+rAgt4ZAeSQj6zrmFX2BTmo9UT+b7s6mJRGa2aQG/q2iC/GWvTi4ZnD61r
 mBPyEuuN5KsMFCzjL/WF+jiI5PatVANUhee12tmnvn15t6eo/branVzAw0gZ7JCSVWAF5YB5ORi
 qBWHcz/tEtQrY3+vhQF17iv+hQp/Bx2mb1amrF5fdAg3MZ61+vTuTyDuWEMUIAy1f5FCRR9llpD
 6AgHm3u9woQsuA4RObpGBZ++3ND4R4=
X-Received: by 2002:a17:903:46c7:b0:2c6:b87c:e5a3 with SMTP id
 d9443c01a7336-2c718ed74e6mr194294015ad.15.1782219402494; 
 Tue, 23 Jun 2026 05:56:42 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([1.213.237.162]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7436af310sm110579705ad.2.2026.06.23.05.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 05:56:41 -0700 (PDT)
From: Leesoo Ahn <lsahn@ooseel.net>
Date: Tue, 23 Jun 2026 21:56:35 +0900
Subject: [PATCH] target/arm/hvf: panic the guest if an unhandled exception
 occurs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-guest-panic-unhandle-v1-1-6adfb6d4221e@ooseel.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDQAyF4VeRrBvQKAP2VUoXc4kaKVOZOKUgv
 rujLj84599AOQkrPKsNEv9E5RsLmkcFfrJxZJRQDFSTqQ21OGbWFRcbxWOOZRI+jF1PTSBrTT8
 4KNcl8SD/K/t639bsZvbr2YJ9PwAFGjwMeAAAAA==
X-Change-ID: 20260623-guest-panic-unhandle-4921d2aa69fb
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Leesoo Ahn <lsahn@ooseel.net>
X-Mailer: b4 0.15.2
Received-SPF: pass client-ip=209.85.216.47; envelope-from=yisooan.dev@gmail.com;
 helo=mail-pj1-f47.google.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

It's worth cleaning up all resources that the guest taking and to quit
if an exception in el1 could not be resolved.

Otherwise, the guest will get in the infinite black-hole by
unmodified pc.

Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8b902c6882..4358cf90e8 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2533,6 +2533,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         cpu_synchronize_state(cpu);
         trace_hvf_exit(syndrome, ec, env->pc);
         error_report("0x%llx: unhandled exception ec=0x%x", env->pc, ec);
+        qemu_system_guest_panicked(cpu_get_crash_info(cpu));
     }
 
     /* flush any changed cpu state back to HVF */

---
base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
change-id: 20260623-guest-panic-unhandle-4921d2aa69fb

Best regards,
--  
Leesoo Ahn <lsahn@ooseel.net>


