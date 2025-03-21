Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp235606njc;
        Fri, 21 Mar 2025 04:25:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcUQRLhuVhmlUuXaW0+TtgVWM7sscnB6mG+KkOOACXVhgzR2aNGGMEMOWFxXG30vcF5baOxlgJs0aXKA==@linaro.org
X-Google-Smtp-Source: AGHT+IF+QT7la/v25cXnYr8iJ56pzXa/MFK00CtvS5PD5Ya9tU4q6zirjKMMe1gJAtvMOInfsahz
X-Received: by 2002:a05:620a:4444:b0:7c5:6ba5:dd40 with SMTP id af79cd13be357-7c5ba15c2a9mr355918185a.17.1742556342324;
        Fri, 21 Mar 2025 04:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742556342; cv=none;
        d=google.com; s=arc-20240605;
        b=XobBmatXJNAHyMlQ75I5Iu3akQaUIN1HHIgI0rBArKR5NLSXaqw4X8MJKv5Dn4LYtX
         +Nr5d9uJuVv4TyQnXiMSvREnfdLOYlZr0lZaF30xj10XmOomxOIi7RuczVRqtGeH8JQs
         rKwLJO7j+iQLFxbkC1hpHyrXlYIkmmGezm3JEy7vyi4ov1FH9PgZlUxIEkibibWW3vdm
         Nb4MmH5H2cN/1EjcrWNLflObqHtVniszKbnbCc7NhHWydk6wiZw7OQZacEECN4SIWs70
         WAnkz9x7+WRIP6OnUnv3mngZWUkFhlj6qVfqryQSZ/hP47bsdgO20c8sRV5ENINXjbFi
         b73Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9vH8UmsTVl9pFvTYnHstPZudBd2C6Qn5erg4QfltUDw=;
        fh=NAemCr4H7/+6PKPE7ijuGJKYAK7QJ7bz7TXRqyVlLss=;
        b=BEHP4eQXb92XFOPS8F1ts1NttX+eLimXmzieB/ZOwG1ftnUxGLqasCjknB/2jm6CXb
         89ZrC1EyBTVeJz3T2GcyA7vZfCEgob+3tEIEGfEJ3IM7MVr2pY/tmWmxJPW22+MuFK+u
         GjIi+7j3bLtv068Kkt3+qIB1u+c8Js6JP37YYwomUt9L/6lZZoLte6fnQQKPdgRPHKNR
         8tAg1sLugkfzLtEg7gI93WKs2JLti8a4j4DyM+zGTFzkEIGr0QLmA7jAAR522kctYJOY
         B5xkAiyb+/mtEvUBNcCZASWHd0lEPaET3WnngutH8dzOtP708xyJkHuVauGiB9NwcWWN
         W9OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgMx0PEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9362944si166056985a.523.2025.03.21.04.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 04:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgMx0PEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvaVL-0003vx-3y; Fri, 21 Mar 2025 07:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvaVG-0003ud-T8
 for qemu-arm@nongnu.org; Fri, 21 Mar 2025 07:25:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvaVE-0004OP-BV
 for qemu-arm@nongnu.org; Fri, 21 Mar 2025 07:25:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso8579035e9.3
 for <qemu-arm@nongnu.org>; Fri, 21 Mar 2025 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742556327; x=1743161127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vH8UmsTVl9pFvTYnHstPZudBd2C6Qn5erg4QfltUDw=;
 b=PgMx0PEs61XRjPmZ2ULXErS8IL9F08LY1PhBHHvaJAfksmgFE12RCD7PTzu84SMh9a
 j9LsYRIkxvKcjuhreejmM0otf+J4rjIIliIq5/1RvSMmCG35kCAwskyVWG66GANGF1V4
 eF2bisBvb7nL+VuyVF5T6WaaUTE+Q58qK88k/7aX7VmQqNmM6RNhiuUY5N1LfKZlzjTR
 AbLr/5rcG6I37CSFs8nlM7NcHbQXFfcuGMkukZ3Xvq1J2OpjoYIBK7W9NPmr2VjRvgwc
 VesnX4wyo5LnX3SiuQf8Xg7ys0Cv8ddDVbbyxmNtfaZRRHGTccRHdKyUNkUg2FDGSzhN
 +Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742556327; x=1743161127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vH8UmsTVl9pFvTYnHstPZudBd2C6Qn5erg4QfltUDw=;
 b=Q6IgCofBsZyZP9XQQhJa+b9b6JPYcxSfBgWEXfk+oDXT8WWZDHIRS72W8MLouUb3rt
 YCUGNG5maQawKDENHSrgIvEQsF6XJWI7nBdLnIxsCOJdSzNGR/Sahm7VIMcbzr8JPqGR
 xV3wXogx0JJ4g4jBquO2f/vEyVqznpqH0mJYjk9+MUxucYdqvQ1k7SA6DrswLqTAxdL4
 udROXxGU2RrNrmugsIiSr6I0SYj8iowZG++9z1ZR6d2VA4hh1heEDFv71GM/gXjZEFJW
 B2OMZf+c14VUCz+vM5LkZpmux+OeMja+/kvPFLAyLimJsqH8TL8dulteAiaNmF5c+S0/
 y/uA==
X-Gm-Message-State: AOJu0YzqposptCQ6Tr7iBURJa+qvHqDjpoigX5bCyetbmyo6yRf9sN55
 BPNQ4JCoDTXAp4jcDmzyoHujT0qyNaexk0lMERvOIE2NYnjR5qaF87UbgwP24PTq8MXSDLXVJnd
 Y
X-Gm-Gg: ASbGncvMJXkoGdv/447bAwxgzd3pmwafDYm9oZpKaoPV4G8QFv+C/z8zvsAKHOXaJor
 67rNIXbfCfVdage1Q48n2qpwSiSH9b1X41OYOm/yGIXoErfxWsYmj3CngScYJCWg+QWe5O+CpEr
 XqhCKRhkdNn1X2oxcHFQjxm3WXtD7SUfxyIAX6dLKso6HcP1BMLVig65U6Yofvp3KY7kaAzFLPr
 y3bwepimbizx0S4ukGF+iHs+KvcZnFHiOY7l1azofL1GdU8pdDw4gTAZ9zK3g+E8bCeYs9HR3Ft
 Ek7SqYOcyjhyd0Y60VhtGovYVGd5OiIBUDmtweQmhkFM2BlSI1c=
X-Received: by 2002:a05:600c:138a:b0:43d:224:86b5 with SMTP id
 5b1f17b1804b1-43d509e38eemr24686085e9.4.1742556326636; 
 Fri, 21 Mar 2025 04:25:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6767sm2132614f8f.66.2025.03.21.04.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 04:25:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 1/3] rust: assertions: add static_assert
Date: Fri, 21 Mar 2025 11:25:21 +0000
Message-ID: <20250321112523.1774131-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321112523.1774131-1-peter.maydell@linaro.org>
References: <20250321112523.1774131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lg2qBzxlXSpy

From: Paolo Bonzini <pbonzini@redhat.com>

Add a new assertion that is similar to "const { assert!(...) }" but can be used
outside functions and with older versions of Rust.  A similar macro is found in
Linux, whereas the "static_assertions" crate has a const_assert macro that
produces worse error messages.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 rust/qemu-api/src/assertions.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/qemu-api/src/assertions.rs b/rust/qemu-api/src/assertions.rs
index 104dec39774..bba38cfda11 100644
--- a/rust/qemu-api/src/assertions.rs
+++ b/rust/qemu-api/src/assertions.rs
@@ -120,3 +120,25 @@ macro_rules! assert_match {
         );
     };
 }
+
+/// Assert at compile time that an expression is true.  This is similar
+/// to `const { assert!(...); }` but it works outside functions, as well as
+/// on versions of Rust before 1.79.
+///
+/// # Examples
+///
+/// ```
+/// # use qemu_api::static_assert;
+/// static_assert!("abc".len() == 3);
+/// ```
+///
+/// ```compile_fail
+/// # use qemu_api::static_assert;
+/// static_assert!("abc".len() == 2); // does not compile
+/// ```
+#[macro_export]
+macro_rules! static_assert {
+    ($x:expr) => {
+        const _: () = assert!($x);
+    };
+}
-- 
2.43.0

