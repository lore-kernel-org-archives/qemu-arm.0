Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3519130ejb;
        Tue, 6 Jun 2023 07:15:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7h1nm3KeupCPWNITIhaGK1b6qOm4G0MqSYhwWYOr9Monk7jwPq0dMmxlNuOAhW/WWfbcTD
X-Received: by 2002:a05:6214:29eb:b0:625:aa49:ea08 with SMTP id jv11-20020a05621429eb00b00625aa49ea08mr2396368qvb.27.1686060919342;
        Tue, 06 Jun 2023 07:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686060919; cv=none;
        d=google.com; s=arc-20160816;
        b=IcZb1Zf/yrzRqjOjtd/FISSsTtwlqqTI0BUbBU2gnO5TxRuuaP2Kn+wUkO5VIDawr9
         Mbz+io8AnT+RJaKch7rWLsAx/q/5iG7SsABiv8Ud1Pqa/0Iq7T6sct7UPiW66x52idkn
         zOWjtfm3yUmZBQF5OtJ1OphiVVqgvTSIOHr2q+dBxGc6vjU4vXR7+YoIW6AD8Fct259I
         HO8it1duUKiuy+dn+neSKzZSIG6P0tn6aZXoAskW3cJt0mPUC2Xw8N/2/3UcDkHT4Ge5
         bcplQV7ncex8pybkslHPf8mq4+HSrFG5Ev0/IzbbtyxVrQGH5mYgNIdIAHtOX79ydXzp
         oiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MdSAUEH/HsOMWhs4VgQvGHZZxYfe28F2myfB/wfOD10=;
        b=QF8+ALR2mp60FnQs6zgY9OanQB4OC3sMT3/gtRGzzUX1UJDiYUHQV3+5AqsxYZU0tz
         5X5Cdy1ZWGOpB5qZOEA3oxOJFeAWjQzTV97D9Mv7X17LsxtQOCmz6+xaQJV/kbxF/ZfO
         UY0c8n6gi8KSzan3cBTkqqDIdDUivEKXwQujUfZO/oaJ3K3bDqlOkbzP6bJ5YOad6a+7
         6egwoUCB34JICe+MrUGaKIAcKTPclKaR2tWvBpQU8rjok9ul/O8kx/jzlqfxmK6zm1dk
         LBEs/LFLHtVKRYhB/JKupFBF5MCRBXGoWUEXaeV5zByJXFN8D9HpSTGjoJXYvZdrjYdB
         zWMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UT6fGinV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22-20020ac87c56000000b003f4f522dd90si6296113qtv.457.2023.06.06.07.15.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:15:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UT6fGinV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6XQr-0003rD-8y; Tue, 06 Jun 2023 10:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQp-0003pO-PY
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:13:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQn-0005Va-6p
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:13:07 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f7378a74faso23863155e9.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jun 2023 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060781; x=1688652781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdSAUEH/HsOMWhs4VgQvGHZZxYfe28F2myfB/wfOD10=;
 b=UT6fGinVWQRGYWdTINjYUvoicF4kkRg5Mbyk2hQTmTiKqz84EhF4z/chYgdKc2FJA+
 PJiaIcB28xqgMogMEgNz0IJYuCnV9bGetVRGXPcg1b/AIHpLrmqfKX7D2F2m9QbIFYcj
 ed1H3OPF4bT/uQE0jdxGrbGvpooo+6leFCEAlQK1Q955r0lidVVwHLJhGSz2fFN9OH1b
 wDTdfdiYwZwqYNPgo5uK5lo++9F2HmAGL4cJE4kdDrwifwLlJSh5wUfYgK247VrCHwIY
 gk5RQkE8Wk5ybxyK292TwjynyarzlWmZI5accoKp3CLWio4qxcR9AUizYCmBa3Unprb2
 T8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060781; x=1688652781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdSAUEH/HsOMWhs4VgQvGHZZxYfe28F2myfB/wfOD10=;
 b=Rc/4OLBb0YkezCJMqey5elXWBExi+7Bs4eAfKmZH4l/lba6REXESWp7mRlO3c4bO+0
 SWOZc37B5lPM4yFzHhkVG79cPYNA7nD6Wl9ZeGuyC1e4Uzp7xXBFnYG+/TB5Q4EcImYc
 S47FVbonQbnYmj88v1ROAPd6OLmv8sBOsjauZmxp7tqM6b4Fofk4NyTlPi664jq7C4RG
 SKnFhTM9LLoTmk82VrRXIbRJtI4+R1BSV7X9KchUAe+7BS1Opfh0Bh0B81if0ohA+Xtn
 zv/N7aHC2ntmniOkYJNMkHOUSZZUM1bGhILDgK1WohM5fvr5C81Zxwesao0iISWEHWkm
 yqEg==
X-Gm-Message-State: AC+VfDwfl/JtI+nZShng+992gb+ZeLIhNJofhGeqBWeyhzQ085eZkJku
 DOCgTkRtZha+Iijn3ty+Tmci1J073ozfx8XHZ9Y=
X-Received: by 2002:a05:600c:290c:b0:3f7:35de:856f with SMTP id
 i12-20020a05600c290c00b003f735de856fmr1984628wmd.24.1686060781410; 
 Tue, 06 Jun 2023 07:13:01 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a1c7916000000b003f6f6a6e760sm17767263wme.32.2023.06.06.07.13.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] bsd-user: Rename elfcore.c -> elfcore.c.inc
Date: Tue,  6 Jun 2023 16:12:48 +0200
Message-Id: <20230606141252.95032-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +9LDgICyUql9

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename the included 'elfcore.c' as 'elfcore.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 bsd-user/elfload.c                    | 2 +-
 bsd-user/{elfcore.c => elfcore.c.inc} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename bsd-user/{elfcore.c => elfcore.c.inc} (100%)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 1f650bdde8..d2dced3d7e 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -121,7 +121,7 @@ static void bswap_note(struct elf_note *en) { }
 
 #endif /* ! BSWAP_NEEDED */
 
-#include "elfcore.c"
+#include "elfcore.c.inc"
 
 /*
  * 'copy_elf_strings()' copies argument/envelope strings from user
diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c.inc
similarity index 100%
rename from bsd-user/elfcore.c
rename to bsd-user/elfcore.c.inc
-- 
2.38.1

