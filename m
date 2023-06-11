Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1370532ejb;
        Sun, 11 Jun 2023 01:59:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ43NQffY5IRrYhqRQA59nZ0bXzYZyoBCHPo/aoJUjgDld5Te25pC0B3ncNrAq0y4MaY1B29
X-Received: by 2002:a05:6214:2582:b0:626:3bf8:aef1 with SMTP id fq2-20020a056214258200b006263bf8aef1mr8679402qvb.23.1686473981043;
        Sun, 11 Jun 2023 01:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686473981; cv=none;
        d=google.com; s=arc-20160816;
        b=D7KsZrSd4ureFeGBTpUjZun3GB5WY1QluUTvnWPzo4QZgkCcaOL+ifBEUzP4dWkPle
         Pjrde8GBtYn2KInL0GL/a3Lcen1d/C9WSpMnsSzjhfIqNug4vvlRJV1yk4UmUDOWPLwr
         FtWpVnOToyOk2ZZ8N2i+k0A3SIScCV4pk7IXha5qk1q4GKecrEBWubH8meXIaRXN5ExH
         J9EbVSbN+coqqPug5Ubl4kqjDebYBym2NzSxjXS7BOK8L28kK6tYctIqFR6ieDmp0m73
         sEF8DmMfziE35nhpzDceQTsFqKqX4zZFPy21oLQS1p1UdQ3HAIkm97M0sFKRsp1LG29z
         CZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IqcnN0KHRLtGoEUii9PLdnN1fRMGq2pa7nlyy5bf34E=;
        b=dGEaMG9/y2KMoLjs4p7JSLn6FZj3o6WSQo8J7zb4KsrzoODGcUWCG9J31ePK65x0Pv
         E3kMVSYGxsMJVxabOG/axIsP7UVhyBHtzWq92shzg5nBXK5Eh+V9uem5gvGV9oa+6J8e
         WYMyKmOyeE2/mR84UR+1ocjjnlk1iF4ziZQuDhzvHmjtIYBHhHYhtVM8/ByzYhlhUfTa
         Ykyy75gFPgJuZvRGCT2/z5DzIP8XspjDRwr/mFhTKnMRvHXLSiyKcVlpq5t8Yl8B2CAk
         H8DKG+sB/0J7eArZw1OW9f92wh6QQ8gHhWz/M1oxB2RFVYrdT46L0vS2KhnEQsd9YP2V
         x7ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zn5IlRML;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu14-20020a056214234e00b00626287fd4e5si4579473qvb.273.2023.06.11.01.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 01:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zn5IlRML;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8GuW-0000wR-Aa; Sun, 11 Jun 2023 04:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GuV-0000vw-9S
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:58:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GuT-0003Wx-O6
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:58:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f7368126a6so23031555e9.0
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473932; x=1689065932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqcnN0KHRLtGoEUii9PLdnN1fRMGq2pa7nlyy5bf34E=;
 b=Zn5IlRML6eagcijKlh9JGnDDOMuta5USJiO1q223b6mIWJCIax8URXH77t2TbzkGON
 oZlNbdL28efKdRqVfH9qVUn2VDtSQVkBWqvotbrUcFXhviW6t9tLx275casmOF2/bG3N
 n2qk939pVIQDsnkfDHpOK+Uz85K6ZfcXCer6HNd1KQUXMsmTJQKCNW1PgAtVXUQHwmwn
 yGjc/AupEKYsRDJCcST3g2dDkBMRxOeRhD7ucyKdj80D4LKJE9izMAg2xY7jbwjvAYyt
 EwQu4LzCjySG7JsovOXQZiT/5iZRau8rQlzo0oOI4w3alTDdiYVsEP356GgtikPv05Eb
 obow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473932; x=1689065932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqcnN0KHRLtGoEUii9PLdnN1fRMGq2pa7nlyy5bf34E=;
 b=LOPfH4pK03yMK10oNy8PfdLdFvJtE5ctfea0IHuO+eFCNqP0hjvD7c5L7Z980ngriA
 0s9wNa1cjOjXT88oU5dDwrZGMNK1+c3J3Yoc2Mqz/h9cC8kCdRtHsgnuafXt+WeakTJf
 lTvG1YJvQgUD4Q/tKQXDk+4Lqyldji4NFqEhCaF24b0J4XDoNY02KrA7FvOTTICtOkZa
 Mxmer5nqo5Uqibugrwu3UQs0JXtEXKdAIPBOIcTc4x6l/WmEFH8FKtxm674Uk7QSgs1L
 8SLnsuFUFgosMqBJ9R5KekDqrtwCw6yln1mNXK2MLPy2ybRGb4OcPpBjgYUlFZNyVb5g
 z89g==
X-Gm-Message-State: AC+VfDwLpzqvjpMkyVQBdPwj1521VNua9iLuUnc7DWnfD1opZylqS6hf
 8gibZnCJoGHQ54cKiGpUkxjZNQ==
X-Received: by 2002:a05:600c:2255:b0:3f8:11f6:69ff with SMTP id
 a21-20020a05600c225500b003f811f669ffmr2007877wmm.10.1686473932215; 
 Sun, 11 Jun 2023 01:58:52 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 a11-20020a05600c224b00b003f8126bcf34sm3482776wmm.48.2023.06.11.01.58.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:58:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/26] plugins: Remove unused 'exec/helper-proto.h' header
Date: Sun, 11 Jun 2023 10:58:21 +0200
Message-Id: <20230611085846.21415-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: 8lNxCJP03ZDb

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 plugins/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/plugins/core.c b/plugins/core.c
index 9912f2cfdb..3c4e26c7ed 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -25,7 +25,6 @@
 
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-#include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
 #include "plugin.h"
-- 
2.38.1

