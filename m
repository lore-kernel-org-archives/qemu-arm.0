Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2540833ejb;
        Tue, 24 Oct 2023 23:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqLqJT8eZ/iUm3QBcwU13BEn6h14gMhrYPVj3CfckqaUUPZSEXqkYlSaMN2V/60hHSsiYm
X-Received: by 2002:a5d:4108:0:b0:32d:8185:9526 with SMTP id l8-20020a5d4108000000b0032d81859526mr9289955wrp.55.1698216953117;
        Tue, 24 Oct 2023 23:55:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698216953; cv=none;
        d=google.com; s=arc-20160816;
        b=hUCuvqaVk/olRm/CF6MKspwlVT2JwHqStSdCivkOZwLeQPola16bNflOCMm2/euiLd
         u+lnWozgnPnPCHWE/mFrrjZd4D1B3eULNP3X46gOZGTYqPlDZ2v/CCF/ripHMYXAoIzr
         ADl8ERmXw9LBtq5NkjCadQ2GWRMP42Hsn7QQeSPsy+8bJgK6pmf2hIwL618tRfJSu9Yl
         dITqn6uVdpeqxX3MqG8E8kyc0aBoNTcUWQjyo25nIT7rMAKJYtbxaEzfX/TbTGxvtY1J
         ah5+e/kJPHaAMTndjRczxZMEUu43Ze6nW1EvtYHRBlhhUDjJg77f3z9dc5QmeDCxepfj
         VhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u1N4iB5qyuXhYbGZOImwLflm5tVzhud2jN7eFf2rhmk=;
        fh=CtzI2pkgytRcYhpGzM67m6gnAwNIi1NtjpQyBuo6/eI=;
        b=oj5iCTmex+PMQf+tCbDgSAUPgvpjVSbKzNEUTfd2iTOR22UJq+vsiTMy4fWa0s965y
         58vAiIq3LWiKBJ2H5LkHagQt2myqEmxTrrZTNKfnEo8uk0ZkJu8+twNGKgL0vGQFe2IY
         IJzjyOkfiFpPCNGBQ7q7UPo6M5+Mui1NWKTVdvLrUVgQ4q88jQrtNWjX6gB/s8XLVfKK
         FKto/UAKy7SLa0N/NY/VURurngDgN+p2lQDxZdDcHtQyxHj0VDQe7OfSoMGwcKytIZVg
         41WXMWiX5uZaOoD5BQ9Ibm+pko8Gv/QFcb0pkBkBWXIYoK+S+/QSD7RE4t7sZvnxWzIs
         5uFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ui4hp91l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a5d4247000000b0032da31b9739si6962407wrr.516.2023.10.24.23.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 23:55:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ui4hp91l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvXmI-0008Tb-10; Wed, 25 Oct 2023 02:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmF-0008Sd-UF
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 02:54:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmB-000711-Td
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 02:54:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso3570453f8f.0
 for <qemu-devel@nongnu.org>; Tue, 24 Oct 2023 23:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216837; x=1698821637; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1N4iB5qyuXhYbGZOImwLflm5tVzhud2jN7eFf2rhmk=;
 b=Ui4hp91lNnDoUXWXHbqYRg6PgF1X3kgL2rhzJa88iNQxuFV8dEqP5W9W8oFdlNkg0N
 Wdam1VmOyCDQmbAkkoKRogdEOk5crjMsmCuSRso7A9bZVyM56b019AXxSqwtCd3GOlQs
 TUjoUMQbmXovq8bHmQSoSu5Ele67O4nXG+XVS7G0ka2MO04/VtL4iud9IUriAzHQIwaH
 7s9ESw5+26VhfWRFDccEhprooTF4Nobw9Cf+aWI7HMS0gS5qSeStVy4gyTPp0OSeZzYe
 mzO5H81V/JKVZ2+Gn+XnjT1FjQKOlGOI/yl2P/YGfc+1XM+hLL1DwDO0kgZPzNWjg9Va
 k1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216837; x=1698821637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u1N4iB5qyuXhYbGZOImwLflm5tVzhud2jN7eFf2rhmk=;
 b=OmLJl+P4qFfAg5pJmtdzll+rEB2FG6VTlf7XqoeMjnzV7y/UhOCTmYfHWDOcjQGYBT
 UiEDT3AveTuPB3oRttSJIbXhv8vvMI5/COqtpRGTACHIRK8v/m+nh1k1K2h39LugU1Mh
 2worp7uSDA3hfL+hVnFeQPIn+CMG0uTKxS0C05mM9P1JHGwVHlXBFXUZVC1Lp3iiaJZ3
 Wp/X3G4BK5hRA7CyHcImIDAQYBk6jq2oxMVujfTX6jwwJ+Wu3Vfw7QSeiJCZcjen8JOb
 78wwbVvix2SRDQIIjoDD9R5Xg1B82BWEhdaUPcAuazHex1ECUYBWQy3nW5MNvy5i+dn9
 1NAg==
X-Gm-Message-State: AOJu0Yy821djE93WMp6h8+sKPBW7UJ9n5mWGZe1gNnkAYZxOxS6ZUA1S
 s+SpG2bJh37EBTaoXeylsu9bLMIy2p2nQxujrkE=
X-Received: by 2002:adf:ed8e:0:b0:32d:9d99:d0a5 with SMTP id
 c14-20020adfed8e000000b0032d9d99d0a5mr11157008wro.5.1698216836919; 
 Tue, 24 Oct 2023 23:53:56 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 r6-20020a5d6946000000b00318147fd2d3sm11326018wrw.41.2023.10.24.23.53.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:53:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH 06/10] hw/arm/fsl-imx6: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:12 +0200
Message-ID: <20231025065316.56817-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qpK865cT41AD

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/fsl-imx6.h | 1 -
 hw/arm/sabrelite.c        | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 5b4d48da08..519b871014 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -17,7 +17,6 @@
 #ifndef FSL_IMX6_H
 #define FSL_IMX6_H
 
-#include "hw/arm/boot.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/misc/imx6_ccm.h"
 #include "hw/misc/imx6_src.h"
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 41191245b8..56f184b9ae 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx6.h"
+#include "hw/arm/boot.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
-- 
2.41.0

