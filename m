Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2592004ejb;
        Wed, 25 Oct 2023 02:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBXklRz6xMh3rbCzXqk8DfvcX5VWr/zVZAAMSyVaKV4U+xarfv1YOc/TieFCAz+Qwyv6An
X-Received: by 2002:a05:6214:f09:b0:66d:58a2:d23d with SMTP id gw9-20020a0562140f0900b0066d58a2d23dmr16592334qvb.61.1698224399851;
        Wed, 25 Oct 2023 01:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698224399; cv=none;
        d=google.com; s=arc-20160816;
        b=GwUIM1BAEZzO5H+7neJPyiyllSwUJI12DCUsurq4HOsUtDXiPKD2u92GZLIeoOW6qc
         Yyo5Sq/IxSDsIrXqll45jSV4VaF8ajOXIpNkFJO/iPIHFLfrv5shqWJk60dwvfMbEyA2
         o7jTF01f7iAN+PCBsQ/yfM9y4t+fRZxDc4oTcSre+Ni3Bd+OH0fcDQrC4J+YDNYj2rk2
         yeNS5evyKoP65wbwDhYtU2lm2BmcLp6KubMX6G939IDt+YFkQzLuT2CGwoaAHRrmeSO7
         0mSydyRn58nDJh+H2eSyPFlIdZqziV/eghhXg9h4IiBssCpoyzIuhKx3NBgTZa+hGrgs
         GL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=R60pr65nzkomK6at97cArqWhBWqpqP9APCJyI0PYtik=;
        fh=ORX9PSh4Sbz0ygAUusUWqj2NQTr+rQi2V0bYE0yL25w=;
        b=c1qLiS3SG1Qy7a8uErX/AsBVRYnh40qrt5iCJxOL9vLq4sYRZiQFoedsr+RG19Gmxt
         gVTkmlqTezP7Kg5Ls0n9PIeoqdMUxboe5wyoJYsd8pIKVI5iSBUpHk7IqEc8T7vEAupq
         3SetpwlO9/eQC4MsWPN7ra0P8yOlSj2IbjZCXdTIoPSXbOhVyvuvbHkDrHeqi/LGgb3x
         ++1DE0atX9cmYcvwSvZmk0rPPuYK5yw7eaTzKbcVuybwqrbloaBWryIVYBzalGV53yeV
         0suFktm0zKSKLlbLK6eKYIJlMhbaLLsGElO/D8B2LcnbZScy6R5PLe+XBetwQiRBvnyz
         a3UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dl18-20020ad44e12000000b0066d05425791si8088963qvb.249.2023.10.25.01.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 01:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvZjr-000844-6C; Wed, 25 Oct 2023 04:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjp-00082y-Kt; Wed, 25 Oct 2023 04:59:41 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjk-0004N1-7t; Wed, 25 Oct 2023 04:59:41 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFjXx6y9nz4wcM;
 Wed, 25 Oct 2023 19:59:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFjXw2ZhPz4wx7;
 Wed, 25 Oct 2023 19:59:28 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/12] MAINTAINERS: aspeed: Update Andrew's email address
Date: Wed, 25 Oct 2023 10:59:10 +0200
Message-ID: <20231025085921.733686-2-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025085921.733686-1-clg@kaod.org>
References: <20231025085921.733686-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: btkEACwHxO98

From: Andrew Jeffery <andrew@codeconstruct.com.au>

I've changed employers, have company email that deals with patch-based
workflows without too much of a headache, and am trying to steer some
content out of my personal mail.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d36aa4466128..cd8d6b140f46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1131,7 +1131,7 @@ F: docs/system/arm/emcraft-sf2.rst
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Andrew Jeffery <andrew@aj.id.au>
+R: Andrew Jeffery <andrew@codeconstruct.com.au>
 R: Joel Stanley <joel@jms.id.au>
 L: qemu-arm@nongnu.org
 S: Maintained
-- 
2.41.0

