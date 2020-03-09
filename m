Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1629443lfc;
        Mon, 9 Mar 2020 14:58:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsTBHoSyoVa/NX9hYA2qr28AC58QOgEfLTCzUS/6vo52U7RA3Wh1RhOJunpSjEVOZ9uBMKC
X-Received: by 2002:ac8:94a:: with SMTP id z10mr12070948qth.357.1583791115891;
        Mon, 09 Mar 2020 14:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583791115; cv=none;
        d=google.com; s=arc-20160816;
        b=L4D/SiN1WwtDC1VD7iby0AMmbnm4BbmkAyrZxe1SSqMchFbZz4NShqTGBW7kr7f2tf
         a8JM+4zWHh/tf2s0dOnUAGyEKeTHf2SyXEdeKsTD6rRaxyaPPCfltBhbl39eRw9dbwfz
         lR8BigdaKdGSf/PlbWrzO2X5w9oQlLICXamuMeDi2sf/qP3ROPUGXXkiHJEhA7DsxbxB
         MRW1wLMkrawXbsCl6wG+YuyZBqfaNPK4xNx0apbVjxt0cLMWgjuM0kt8SInVku39KHuE
         FlcmV8tuKoJYGJmWyUDcHobpy9qhX9loFfBPGOWztFR5CEAyoYBYfkNRzBgjhlbcIghg
         b6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/bWoXSuiIZ/NdLhIJtlxSIZm8FTmVmD4iHSdiTEX+nU=;
        b=a+RaQIWw0oy5+W4psyv8x4QrW3VnTEddGQq/RriXTao82jkVWyV5bS3hKQfPyl1i28
         ScsVEl6MDXBEg4KsG05076mij5BrWirYw9dHh7IDl4sUzUhtDmrx7S0aO0geow0UzHSp
         31hsiudroW35tkc2o5cYAEchG+qhrb2G54o1gkQ+mNaisdIXrrmtXO+5ezwQlOESFomr
         BqmiaRtrX0IV7Aa4q9J8m+x5SylyDdG7bmRUox+PXX/hIvUvjqN+dROc6lKRPuEwUZyk
         TxX0urYxFZlCushgo+jGsqHpse3ueRXibOuv/Nd7+8KJdtJ4aDhJcvS21asp63eYbvyJ
         4ZnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbLskNbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si7024776qko.200.2020.03.09.14.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 14:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbLskNbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBQPz-0003D4-84
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 17:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBQPo-0003AE-SU
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBQPn-0005dH-PH
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52736)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBQPn-0005cp-Jq
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:23 -0400
Received: by mail-wm1-x332.google.com with SMTP id p9so1200010wmc.2
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bWoXSuiIZ/NdLhIJtlxSIZm8FTmVmD4iHSdiTEX+nU=;
 b=kbLskNbBt81qwQ0rt5iCUgsOj1dftPLGLlKH7JDY5M3PY2XCEVjcIcby8hg0bF8pz0
 OuqpG/1+w2bi7q1Qqu3jYDh3GSR51C3X1+3AigOo4IQ2SXtNaxAKIiyXoRBkrSvECatK
 ac7WVUBOrEt0NQRX7HXPNQyUuBBhXF3wR5smEdUYOVWPNbx9yXsWXQqzpYt8ukY3hMxR
 raX+w+nWW4k0MbpvFiGtgJ4EkjIiiAf6htNmn29Im/tvspuCoVk5wrESSkO12X1XxNzZ
 a8JZPye+CbUajAokz1mrLfLX9HPDBzkx3Erv1oXAUlxCwu2uhxFg5SfefBVh7PE0vIaV
 Rkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bWoXSuiIZ/NdLhIJtlxSIZm8FTmVmD4iHSdiTEX+nU=;
 b=McJaETHhtpqTQXBmRbAwtqnq3rlwcnLkmbHtN4gzA2/KFD9VaEQSbH6IfsCMWxTW4q
 MgsxDkPGnhJfb0x3/ngXO7QONV2WaHiSM3p68f/busZv+/UrIQwf5KwaeiZiO6eXV3TV
 jQF49m0FK9uARmU8PhvYwyPYBsEXyZhXKipao1PWKXl3TRJC4WJQPnZC+mGmyYo97w2H
 tMEix3M/2fnA8cJRBCFlQ1bYYaOta9QB+C82xHGBd1m70KVuH6BCwIB+wrDOQmGoDO8D
 JLCTBm2kr56rfZg2cqYw3O8XVnZPruogP5/gx8QipDtWN1MbEOykwSJlyLhs2ATNByRI
 Yx5g==
X-Gm-Message-State: ANhLgQ0918k7CZRVNNqFpWl7I83sJR2GAsTjuh0/GxVyxD8nxLDsN2Zb
 IoXECSjigZqmNeJ+oZG4gTe07sjFJhKtnQ==
X-Received: by 2002:a1c:7f8e:: with SMTP id a136mr1212979wmd.143.1583791102149; 
 Mon, 09 Mar 2020 14:58:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f17sm42207068wrm.3.2020.03.09.14.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 14:58:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] Makefile: Allow for subdirectories in Sphinx manual
 dependencies
Date: Mon,  9 Mar 2020 21:58:14 +0000
Message-Id: <20200309215818.2021-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309215818.2021-1-peter.maydell@linaro.org>
References: <20200309215818.2021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A0hbvsIxmQQw

Currently we put 'docs/foo/*.rst' in the Make list of dependencies
for the Sphinx 'foo' manual, which means all the files must be
in the top level of that manual's directory. We'd like to be
able to have subdirectories inside some of the manuals, so add
'docs/foo/*/*.rst' to the dependencies too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2e930688942..5dba949947a 100644
--- a/Makefile
+++ b/Makefile
@@ -1081,7 +1081,7 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html \
 # a single doctree: https://github.com/sphinx-doc/sphinx/issues/2946
 build-manual = $(call quiet-command,CONFDIR="$(qemu_confdir)" $(SPHINX_BUILD) $(if $(V),,-q) -W -b $2 -D version=$(VERSION) -D release="$(FULL_VERSION)" -d .doctrees/$1-$2 $(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILDDIR)/$1")
 # We assume all RST files in the manual's directory are used in it
-manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst) \
+manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst $(SRC_PATH)/docs/$1/*/*.rst) \
               $(SRC_PATH)/docs/defs.rst.inc \
               $(SRC_PATH)/docs/$1/conf.py $(SRC_PATH)/docs/conf.py
 # Macro to write out the rule and dependencies for building manpages
-- 
2.20.1

