Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2955932ejb;
        Mon, 5 Jun 2023 10:57:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dOJs6iX+Y0svfZAnBGWimr32P8pzvzIGY15oL+f7Uo9N5u3P+AbuTc81CM8N2GuqZBwUG
X-Received: by 2002:ac8:7e8b:0:b0:3f6:c0f7:a5c3 with SMTP id w11-20020ac87e8b000000b003f6c0f7a5c3mr9478985qtj.32.1685987845434;
        Mon, 05 Jun 2023 10:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685987845; cv=none;
        d=google.com; s=arc-20160816;
        b=YXs9n9XzMFQNYzizG9oAdV4LBv8XDrKd8XqrETcI5fgDl1zlhb7S6Vx1C4S5xJdDlH
         rkGcWG+9txSK/74X4YRBxOoS9q7oS5uf4dVddjroX4+PzccfhpHHr3FPW9FKRm2b7hum
         iV61bIpFgDLUPtIClEqKVAAcYiU4fS0TmsrBcyx+DtAQpqJRJJ33H8EX1igIjaFgntnZ
         i5+i9h76yPRylgBjmvmcS7MrfmlH+ZTVbYSkFGPhq+e6OxUgSg1NyDJyqV57GrxE8IK9
         Z2Zrdzi2dQZowlEgaRcxGVI+EvTVSYTYkkfLj2RGA+kjbh4a/CpJbwobjrUijDNrJh+6
         6B3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KhI/znFwSdhfbldr+0O5s0+yrpOF1eXn2lep7KpKZYc=;
        b=mMdxOA7uqe0UuwIwB8wK8ryMP4jJHWopHjuQSFU41hmz+6U7Zowi1glaGVdMCRvoYC
         XGq1A2QDHi2wBRhKLs3tOYGYGJy+EIC4Ek+HdurY4vMrL+lQoJxKa0WX5xzd5imEPbFY
         XTPNehyc4wajk64857CXUkawZVn/7Ngg3qaiRcEdqlw/A862yta0X6mrB6F27NgHCNQo
         VHeZMWyjU004TSIsz27+6LohAcNprR0/NkBZOUgLxNUjNm7jC2gZajImlmdnx0UUedjx
         U3m7MTEoTC0HghA822qczXBdMHWVwjmK/yhKZwy9E/9ONEAU7Yy5GhgyIl+FNktAaagH
         +KJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFeKOM7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a05622a1a0300b003f6bac3d8e7si5083320qtb.251.2023.06.05.10.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 10:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFeKOM7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6ES9-00067Z-LD; Mon, 05 Jun 2023 13:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6ES0-00063a-QN
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 13:57:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6ERz-0001Wi-9N
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 13:57:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30c4c1fd511so4152522f8f.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685987821; x=1688579821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhI/znFwSdhfbldr+0O5s0+yrpOF1eXn2lep7KpKZYc=;
 b=DFeKOM7TGS0wAcUYaY3EIjwqC3Gi6SUDTMP+KmiKycyZPLATFkppylrblqSSXGd0H5
 ilWdpuCCGr7CiLKUq2o9+EklnNFNECobjT7XY2uUUWhLkkobpe5vawQH+i3OKnPm3c37
 UcK5FVkwRRKXnFjHvnwSjnzLaUYxiJ1nC9jDJxqRNtBh73YmttPuDEQBbMkeOZqk+ud8
 wPlWJJ90xxxfLbnpUcXbnbDlnC+m1bYYjMRVd3KAN0hIlhlrleFcGDrTY4Q1MvyefhJb
 ZmnIMSMaZfkRQsVfvcv304LqkwKcRkS48vsD8hyYgrM2VAHdhK8zhbHKJUQfcyJNzKWK
 iDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685987821; x=1688579821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhI/znFwSdhfbldr+0O5s0+yrpOF1eXn2lep7KpKZYc=;
 b=PPrFax4QfykDy7uvm4vXaZGyFr599lSTx/kyaqlInqV/swFcSW/qXhU05HbqZgbaZf
 fPM4b4Y8NfzRguXSo+rlvTiPNuwJhRgLTtzSxUvo3znhRPaIfCpzRi3ezJdGLcZgIPVa
 S2H26rWYoiYfrqwzfi3+GGaW7RcJfXBpM14WcTtDx34rFWgeF9AOsgVkrtoqRHyn84/0
 1B3ze0De1egE2Gs/FGItWs6rQSyqTe/PKv/Z4U99Ks6JsymV3fowj49R1k7SAw4Udfjq
 oRcg25xbQsD1PgzNTTtIjWq83WohmTqAgxv8pSGzR+WpfW5mrrgywLycDfv5UVmrlLYp
 cksw==
X-Gm-Message-State: AC+VfDyzwq/ZuoWc4csfuqqvQTfLgcZzsZn+oDD6B3x2LBMW01BFdk1K
 uk6ZWCY5tuuNBHz748d0g4rWFjTR857+Z5bt2ck=
X-Received: by 2002:a5d:48cc:0:b0:307:7e22:dfc3 with SMTP id
 p12-20020a5d48cc000000b003077e22dfc3mr6598286wrs.63.1685987821752; 
 Mon, 05 Jun 2023 10:57:01 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d6a04000000b0030aea925fbesm10298902wru.50.2023.06.05.10.57.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 10:57:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/5] tcg/tcg-op-vec: Remove left over _link_error()
 definitions
Date: Mon,  5 Jun 2023 19:56:44 +0200
Message-Id: <20230605175647.88395-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230605175647.88395-1-philmd@linaro.org>
References: <20230605175647.88395-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: QsVlIDSwvU91

In commit d56fea79f9 ("tcg: Move TCG_{LOW,HIGH} to tcg-internal.h")
we replaced the "_link_error" definitions with modern QEMU_ERROR()
attribute markup. We covered tcg-op.c but forgot to completely
clean tcg-op-vec.c. Do it now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/tcg-op-vec.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index aeeb2435cb..4e46b74fd7 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -24,17 +24,6 @@
 #include "tcg/tcg-mo.h"
 #include "tcg-internal.h"
 
-
-/* Reduce the number of ifdefs below.  This assumes that all uses of
-   TCGV_HIGH and TCGV_LOW are properly protected by a conditional that
-   the compiler can eliminate.  */
-#if TCG_TARGET_REG_BITS == 64
-extern TCGv_i32 TCGV_LOW_link_error(TCGv_i64);
-extern TCGv_i32 TCGV_HIGH_link_error(TCGv_i64);
-#define TCGV_LOW  TCGV_LOW_link_error
-#define TCGV_HIGH TCGV_HIGH_link_error
-#endif
-
 /*
  * Vector optional opcode tracking.
  * Except for the basic logical operations (and, or, xor), and
-- 
2.38.1

