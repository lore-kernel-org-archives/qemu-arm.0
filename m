Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp800891ejb;
        Thu, 19 Oct 2023 14:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEneQLmVhkWAuQybuMZhwBqlKWpt4Nwhd7ZjurAr1+NJV0R4n0BjIYbCGbQIE0OK66ggD0R
X-Received: by 2002:ac8:7d83:0:b0:418:1088:7d83 with SMTP id c3-20020ac87d83000000b0041810887d83mr3582663qtd.2.1697750474768;
        Thu, 19 Oct 2023 14:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750474; cv=none;
        d=google.com; s=arc-20160816;
        b=hzDFsleTbueBGgVcbjKKypgynIDMP0WYFhQuIj+1r0HsKaJBRfl98ZZbP5ejMLbCjk
         /AI55abl7+oDYThEcC+Q3mWeQZUxbnj6kNM9WkBXspfokgvBT2sI1Xmc+oGCeKWTvFjU
         Di/eM/m/qEV1eDov80wTwrmNBHpnxNAQdKbe+mOI4pYjHL36n+FQHU73CywGCFO9TGkP
         8WvY7eF6NqT7LoJYMwVNp8IZ+c/IGqrabNt5dzw01gzMCweDx9ZdXqewFl2/DPX9VGhT
         lqYDh0XO6x/t0hww79YFVFTpoFAdE8sycdCXziSsuGPEVbUSnZGtMSp6uNVuVd0sPOqA
         C4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qBlkrh9XfjJWP3OFrpnOYz+jcm6RPWBlnbPyzymUXR4=;
        fh=XajuQtpltTokiJNywaRuEMZPgoM5Skz0J95FECLljEQ=;
        b=d3hndwWzoPUU9U66ZF9ZQucy453U+vlwVvQrVCtCyHdBD9Z1CF76QppHei1Kf0uw0W
         DzfnN+HBefzbz/YLiYg1DsEREYFMAt2ej7b7qJk6EAQ18fzlRrvyXGltY02VM45rs3nm
         BhF9d7/P6eXI/Ty9zeipufdt3HwYhDRZIFGvjPlEe33YK6/nQfw0pXGuiAvZ5AelVj+u
         zrrMSjoRDm+OTl3jcU8SRErV6J3MvXwIttEi5DeCqDPcikdVhnGfhBv7VGsYbTfHrIml
         jMJTYjXrNQyuRIFHH6anNzIpzxicc/fFy4gx0Id5Ph7QmKtoZRggxAx+Hur4cRzYPU0t
         r9jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i6bTcQDN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u37-20020a05622a19a500b0041986eba0c3si252715qtc.350.2023.10.19.14.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i6bTcQDN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaPw-00052H-3O; Thu, 19 Oct 2023 17:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaPu-00050i-Ed
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:18:54 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaPr-0004jc-Nj
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:18:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32db8f8441eso121316f8f.0
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750330; x=1698355130; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBlkrh9XfjJWP3OFrpnOYz+jcm6RPWBlnbPyzymUXR4=;
 b=i6bTcQDN1XqcRXhAn6iPmjvPNv9e4WKHXNw7r5vQLZIgxBlL9t18uelH5nZ8itBJ+j
 Ju94ziSGVfqy1dCdWai0ya0ly7YLEiRAql75O77C/ogHHlhGhsFwPsHwMxIzCcVaimUb
 3lRQg2CMxP+tkJSNTt+YWVwmfkT58DTdTWKJwiGWot853XShTAzcTpDty8Hce0OqdSdx
 kjUfGLaOp0Tnggmimji9J8Ke2OrbBDMA64L/RjcFlfO8K7fayH2tbyES8U9eX60YkIkz
 OQsW+kzA++dwTRu/2PR71Z4IgdTEwCgWrAI0eApfooPrRisP5I/FszNc+wQ9wKCphQ0l
 yjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750330; x=1698355130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBlkrh9XfjJWP3OFrpnOYz+jcm6RPWBlnbPyzymUXR4=;
 b=mR5NfRD3NjKpKb0xy3fllJKwhXGdscWaTecStP2Im5AVus1LhMVnpbUnhtWyE8HbfG
 XUoUKmxKmQcYeIFlSkxFf2re39nDr77v7mteWIKTTKJwPneOacHCVfvuYKdKOwPDS2FM
 BRuIxCZiPsXxsrBjubt0pEFw2uUag9lYrzQ1yqUbEWhCXE6JkSeeIVaq7WKtth58JntH
 AWmW2nf1nKDQmDwTc31kVqUjZklECyELNwZq1qv/A5WpkclgCNjzUbzD6MwhuxDayb6Z
 XF7VlW6qVBG33UAJktQyaV6/WM2O2N92XbfVOqxVXrnkWKrI5QLKHNI1O6dVXz3lWrIb
 u4yw==
X-Gm-Message-State: AOJu0YyWk8QMrTX1ham6wESohSc/Y0krt5w3KjQZphDJK2G2TRHa4j/S
 /GDDbISBl2xGd2FuNeuDQ3+3amYQsACiB9v79BNV8w==
X-Received: by 2002:a5d:630b:0:b0:32d:8b1a:31ad with SMTP id
 i11-20020a5d630b000000b0032d8b1a31admr2287558wru.24.1697750330284; 
 Thu, 19 Oct 2023 14:18:50 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d5609000000b0032da7454ebesm208905wrv.79.2023.10.19.14.18.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:18:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/46] MAINTAINERS: Add include/hw/openrisc/ to the OpenRISC
 section
Date: Thu, 19 Oct 2023 23:17:30 +0200
Message-ID: <20231019211814.30576-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3JwAJvNTXMvN

From: Thomas Huth <thuth@redhat.com>

hw/openrisc/ is already listed here, so we should mention
the folder for the headers here, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231017154242.234133-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 91ca93328a..fe11c98669 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,6 +295,7 @@ S: Odd Fixes
 F: docs/system/openrisc/cpu-features.rst
 F: target/openrisc/
 F: hw/openrisc/
+F: include/hw/openrisc/
 F: tests/tcg/openrisc/
 
 PowerPC TCG CPUs
-- 
2.41.0

