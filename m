Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp928306njk;
        Fri, 24 Jan 2025 08:31:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXq+E6KXyXs2NeLSOJhphCoViBGhXl7cXpQbyRnrETdNVeX5L6wUjWMfaJdctRWgVP+eR3MBL08Lg+YDw==@linaro.org
X-Google-Smtp-Source: AGHT+IFiAOKGNJKQuUoexUrRqV7joyDkCflpdnJeCUXA8pgx+3cwr/y801nMePbUteWJi1u4pavx
X-Received: by 2002:a05:6102:3706:b0:4af:c31d:b4e8 with SMTP id ada2fe7eead31-4b690c2e78dmr24663682137.14.1737736307009;
        Fri, 24 Jan 2025 08:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736306; cv=none;
        d=google.com; s=arc-20240605;
        b=HvjJeRfNjs3/dkvaFj2WPOl93rth670/v1NWq79mlH+WKebMyw8AvXZ150jJQ2n9k6
         WwitrLxIfF90dALq1DNsbLR1U5ZHxgcG/yWh3hyE8EXqgD2nkfN0vwgtC2vNk++uh9rw
         l+SqKmbIdGbjNNs2tAJ1HQ2i0jMAR9EVp10NZlw7AW4InY7J+EEovtwRqp3oTvSRKIpg
         X4FoLUUh2xTuYwhQx9Ma0AbbmcHFZT92nVJLKJSEJZjPuKopNGoDV8TBqvB19cxMLuWG
         ZTkHwMuK/cC2QbpCOfO5gK7yvwv0CGDQFCL/XCyhg4VgHFJRyIDVtc5qXAlhlP+VXpNf
         UMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ctBdNSCgNxxr/c+03Jcl4N1Ew17aMUfE9iGYWizzwVk=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=jB0xrxJd38BukNuREqK+h9nRAzBuGKyFjXUbHYz0NosVgMlkNtVt0tbpIa2AOdZ3ed
         N+TUn+0i8fBM/fMeFbMvMYqQhJ9qebV359LSobwVQ3S0Dlk7LI/2ybpiDekyIpNQntWD
         Y+n36gSMZkgM/lOBCXCrxwZ5l9OpRvfP0w1/te8mvokw9yJW3X2XJX3gqH1a11ELnbVd
         Ca/alCd9okqcL9uG9FUinTXoTUURYh17OHhAezCav+tU2phgknCJzDd7VMU++JDjAKz2
         YC3D6gvzNolFW1IYrc6bd/FNQ2ctUiJmxZ4dm+7JiH8wSKFiA6Jn44o2dhDYqGY4prPX
         /iIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YxKEfvmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709a2880bsi843342137.655.2025.01.24.08.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:31:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YxKEfvmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMaJ-0007YF-VG; Fri, 24 Jan 2025 11:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYQ-0003vq-He
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYM-0005V5-TL
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so16740095e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736144; x=1738340944; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ctBdNSCgNxxr/c+03Jcl4N1Ew17aMUfE9iGYWizzwVk=;
 b=YxKEfvmXa9Y9G64ZnuDpcY9yti4X5TcJ4OeKS7yeUa+t9Xqw6jKjckSLjqS1X/AjWO
 pSKJy3HtVwrJdJUw8YT3Gamyr+Nytk+CJNLuksxUfmwbO+a+7JwJA8v/S+88YxSloW7b
 mpX56ixk1biWCHRGwtyDMLRmPZOrAZnif2D1rrpGRaZFPzxFyhKF70tpxJwHjFzzV5ZC
 VVSBRzdZCTUeRTIGKj/vkCskxjkc0yoG0zSFWexB/A/WvxqABxGs2rPUi3Q0Q9gJZLol
 Tjj4YyFbpItr5ur1hSIcGvhuZogBcQm9nLrf//9Tsd+WOmfvQIiPQPTDkXKSPYClMVWW
 6a1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736144; x=1738340944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctBdNSCgNxxr/c+03Jcl4N1Ew17aMUfE9iGYWizzwVk=;
 b=ATuB0qKn7xdQWeUW+r5RhBwB9IcN0fusElozMqUAmfeqnFUn3K3pKB9FnBtSOFuUPJ
 HcaYcCUNp9xv1L95s9mIJqwZIBb5+q1qq0Tpgo/lZd9NEKyBMc7Zq8ssSZtti5Wh9iN9
 hh++l8ZWVSDd4UAl+qyXe4c5bgd1wmrIa0Z+PTxRgFMmDWjW7boSgXjLbIFBa/u1yN7p
 OvjbZKE5IHCvCcwW1nkS86gqyzvv3zUHsoEBQbCZ7WVCItVoizDUiKK5b4OPSb2RlrQp
 RobEI5Nsr4XHOL8HwD/h1CeIiqcvCq8FIEQUVidsi0Ws2b6vhVFRQ/nZVDoSY+3e5maQ
 eIlA==
X-Gm-Message-State: AOJu0YxaPPYaLzlus57mrPscT0kyoKr/iMHZsZU7rOEpblNHigXcU8LK
 H4rj9uUO7f5QpQFbl/xtKiQJU+aA4aixsU4adhLh6N5DX0OKWtolyjD0OpwC0K9tMt/R/VR+Rgx
 d
X-Gm-Gg: ASbGncsyMAHnw4bjyWvoTG8iol/wpCT6QuxcPVuxPQyPly5QPYTdLG+T5JkfdAlBJum
 4HG40Zjhh484mthuD7AEU8clapK4rrqBXaNFsaXjxcMkmeh6i+hnNJJeCOavuetsLo3xOoBcPoL
 IXnOMCKhWCaWAEqeMPuWFIyrOI4emDoRPTlME+sxfwjFuMjuZlWyIVsDqWnTHHt9cOcDqAC54hF
 EqFovbSZisOeYQaLdyi5Ot7zhaCDM0sEl89gfSUwexa/RhEzdsmuVXbq8ApBr/WrguveMJLJwzV
 Q9rPcUlW20c=
X-Received: by 2002:a05:600c:5112:b0:434:a5bc:70fc with SMTP id
 5b1f17b1804b1-438913cfa0emr282088945e9.8.1737736143921; 
 Fri, 24 Jan 2025 08:29:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/76] fpu: Fix a comment in softfloat-types.h
Date: Fri, 24 Jan 2025 16:27:41 +0000
Message-Id: <20250124162836.2332150-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9Nzf/JgVwGz5

In softfloat-types.h a comment documents that if the float_status
field flush_to_zero is set then we flush denormalised results to 0
and set the inexact flag.  This isn't correct: the status flag that
we set when flush_to_zero causes us to flush an output to zero is
float_flag_output_denormal_flushed.

Correct the comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/fpu/softfloat-types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 4a806e3981a..c177923e319 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -312,7 +312,7 @@ typedef struct float_status {
     Float3NaNPropRule float_3nan_prop_rule;
     FloatInfZeroNaNRule float_infzeronan_rule;
     bool tininess_before_rounding;
-    /* should denormalised results go to zero and set the inexact flag? */
+    /* should denormalised results go to zero and set output_denormal_flushed? */
     bool flush_to_zero;
     /* should denormalised inputs go to zero and set input_denormal_flushed? */
     bool flush_inputs_to_zero;
-- 
2.34.1

