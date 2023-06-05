Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2956148ejb;
        Mon, 5 Jun 2023 10:57:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7BTpVNKQsYp+U8sUkfVufBX0rKMjqH4HIrB7qdoGcXKVkSPrAFgZk0Z7VYrxn3GDkic56q
X-Received: by 2002:a05:620a:6694:b0:75b:23a1:3643 with SMTP id qh20-20020a05620a669400b0075b23a13643mr553199qkn.4.1685987872182;
        Mon, 05 Jun 2023 10:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685987872; cv=none;
        d=google.com; s=arc-20160816;
        b=tyqzupcrdOzpmiIXt003eSCm2M7+P1fQfM+pibFXhQNv6aTqB48SY2mMtCb6ptuCvB
         mMi/2Bs3aw9xPxxMXCiTTGBWspHxgd3NvJ4qQbk+YwTtBLgnH3avL9l5TPSn3+UG2GmF
         t6EAONhJmYaDdjh2tAIA35dDLcO3CYv+gjofoiWCq7XWJbOO0mqPIYsPGG3LKOFwsPnb
         b1/RyvmMZnX6puTxuxScblT4ZahOWrSTXqZzIlnNqXLAiNWxpZeI6UJ0GTbXD62YoAjO
         yjkMGdELVbTIxMXwm+Di3l+rSsSh3XtoWeXh8K88JQ3GXtS9MCLb2SZhvayHM1j8mzqz
         M9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4h08X8wNRk/W0u78n9MISqwTuuV4tVr3G/frFQxS+nI=;
        b=ufaWfUHZG7HUS14MwHmeEGqUfAJBRwKyCk/EWA1yGvXzcJLU2ognEL3wdKnDvTuvWt
         ATJXLfpTYduvDz2GbZv5ZEZAuWd+Z8Ofu8NLf0XqieN+9JpnORIF17rw905PQRJLS6Cx
         LkbtNC2limphjHMh+2YwXsm0g85LGy0j5HgoK+tHdXEZ32tT549cu2OkBflf9YA4iLxb
         RwFPjfU8h9foBqe7LmyBSMJ9BSUMyWVtRSoL21rB6yoUq0NHqf6JJtFFIeJId1ZHE8IM
         BK1kOlFBC7ao6KhkPkDyi7vnueJu1zEgiPFLW2kJH5eEo+wLuE0FejjP1MQDo6fIAYDv
         s0sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcKTKezU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020a05620a079300b0075cf56f09adsi4818127qka.537.2023.06.05.10.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 10:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcKTKezU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6ESE-0006E3-OV; Mon, 05 Jun 2023 13:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6ES6-00064d-F3
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 13:57:10 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6ES5-0001Xx-15
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 13:57:10 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f730c1253fso18973435e9.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685987827; x=1688579827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4h08X8wNRk/W0u78n9MISqwTuuV4tVr3G/frFQxS+nI=;
 b=fcKTKezUZ/2SC65EQvQcTdBnbWzOpKzYNcwLoJiBXZ/uGvBPcBZuoXScM2Th5M20eQ
 poWoihXSCRNZo0BnJFQ5EJEG1YYgBZpUTcKpdZQUMpcXTJOEmbiSVVQcOwjazsl53qEe
 6XkYgA+N1jaf/e8eLlJfseOFOgNM2j+BTFwtXpcr9uNw/zCP6wiel0VyUGdXY0TtLEuR
 f0okmS/JN4REKY+s8TIq3taaIAAAIAzzlcFgcrEozH35UcQarVcnH2W0x9cdyxlgHYz5
 agEz0M7/qo3AOoBmFagcRe0aEsOwz0ZDYVlKB3Lb8Sco7PF+NeS98k/WM9On6T03xAWb
 mdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685987827; x=1688579827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4h08X8wNRk/W0u78n9MISqwTuuV4tVr3G/frFQxS+nI=;
 b=Ct/ZGw+f1hxDgLsQa2buEZAo+AXfDWXDUczXt0O3xgXiUemc7MseKNftqAMNoz+dc0
 YMtqh/huDi1MTvkPpm1xwVmPGX5bCoIqYY/tJcSAbp7fw+GpiN9e80mzZR9NEQebjLi/
 Duz9JbttBT5Fr1bqhUZvJuCBrI87yYsSus2kEPb+qgpHjKzlfcoQ04wGBihPwKSkQQkF
 c1nKR6RVcS0oD08qFJ/YFGySj8I8IMmzh0h70+vuoo6fvle7nSdHWGtD+JON2Er4fzAX
 SV+3+dsnww50Z2vnI76KUjiVRSB72bqBE4r8iodZVKQGLd4d5KUd4TMtMSWB4ylKV2A6
 VvVA==
X-Gm-Message-State: AC+VfDzvYRlQ4jiZGyguE/e06wktBpLVBSDZSrTmVe7+zQxnOT4hEnKO
 RXwCWa6BuDtoVTj6C1pg4GwiiQ==
X-Received: by 2002:a5d:4d82:0:b0:30e:32b4:88a9 with SMTP id
 b2-20020a5d4d82000000b0030e32b488a9mr4196675wru.5.1685987827201; 
 Mon, 05 Jun 2023 10:57:07 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a7bc7d0000000b003f605814850sm15194456wmk.37.2023.06.05.10.57.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 10:57:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/5] qemu/uri: Use QueryParams type definition
Date: Mon,  5 Jun 2023 19:56:45 +0200
Message-Id: <20230605175647.88395-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230605175647.88395-1-philmd@linaro.org>
References: <20230605175647.88395-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: Pr+M0VH3dmy1

Follow QEMU CODING_STYLE, use the type definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/uri.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index b43f35a6a6..2875c51417 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -96,7 +96,7 @@ typedef struct QueryParams {
   QueryParam *p;       /* array of parameters */
 } QueryParams;
 
-struct QueryParams *query_params_new (int init_alloc);
+QueryParams *query_params_new (int init_alloc);
 extern QueryParams *query_params_parse (const char *query);
 extern void query_params_free (QueryParams *ps);
 
-- 
2.38.1

