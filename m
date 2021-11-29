Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4079813lfk;
        Mon, 29 Nov 2021 12:06:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMUDF+1HVL/LiJSsJtrr4it2XQqqJANPcWlyIl9zRehxGJeS9SqDFT5/WsPQt+feG+xq+8
X-Received: by 2002:a05:6000:52:: with SMTP id k18mr36834009wrx.192.1638216366070;
        Mon, 29 Nov 2021 12:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638216366; cv=none;
        d=google.com; s=arc-20160816;
        b=Q4PdRTE+Vfm7CvlluxjL7SWbHByu4nVPsJW340nNoKVynlFkgurKSTDDz7XfVqdGkp
         +utrGW/HYdDDYbB+g1HMtfXTJk64+VbzxI4ejO2td6RxPh1/r31mNyb2dRLzNvYnxUHF
         x5Px/xxTWechiGZ+tO5hZB+LawT4lxYVF4uSXe9q+cPp42aGPj3SscPI1sCaolkwYyeI
         isVn1W/zkd9J+SzCBj0hvhAE65Z0HC3JGs0HTWgUalroHOVbyOfxRrUqfIzWTdAYsOsF
         jMWUeXd78fhqIO2I76Hq1wZfw/u2H3bMblhIPk0T42m6NQPHCWpko+BDmCUnP3reaZ/p
         k2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qTo77hPRZPJCGOc5lQV7xcrmA1XxlNOYWfSFKOfnGds=;
        b=LYeXvfKeg8/IUFShAKbR0aM2sQyAfYqoVIYlS2BaTXkJYsYaZlV/qF/JGGOxBi5fS5
         L8vW8D9LF7PA9FckjEWw5rgStXuvmm1T5rrOhxJggrgvOGxGQ2lFuVqmO6MR7A5cIlVa
         NGBlTgCJfQn6Nu/vaf03sJ6jzbnoKPZKAjQbmpq6eWFkCFHVza2F2fgaDkuS6H3s/CIo
         KtuWVH9PLQoqPHs5QAcKMCxHCOk/cQzOCq2uAH/OnzTBLQBsqQe3Xz8OCg1OqA2ycOST
         F0BJV6m9j/u5ISWq9aB5fk2uW8Jny6jSdzAkhwdpe07cPMJTEZGehg6qeslbCT6lF4qW
         hiPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aAzoGrNo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si2984684wrh.306.2021.11.29.12.06.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 12:06:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aAzoGrNo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrmub-0003Uc-7l
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 15:06:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtz-0003Or-0B
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:05:28 -0500
Received: from [2a00:1450:4864:20::32b] (port=40598
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008Cp-Hr
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:05:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so17773898wmj.5
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 12:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTo77hPRZPJCGOc5lQV7xcrmA1XxlNOYWfSFKOfnGds=;
 b=aAzoGrNoqXqMNypiP5U/kE0CsU0QtfRtwkYpevgOcyzVCTVlv2cxqxXzo68x9rFerP
 LDOc0klBji4OqtegXIQpC25bULBnOXLZ+21TdLWCXLghRpzFWTIcAKDHaVpof9MYya2b
 9C4DgLLCZPj/QYW14QLkeUUEnJzt2QuX7MSSyEqnB8SmlaNlQcmbIlphAPT4mEuzGKtg
 EXHjj42xnl9OS+3hFFteS+XQ1C8kOvhIA183CUP2MdB8t3H27qe9BlrhTHwMXzxuOzRf
 Ih6qPkfn3hCzFDWBGmnw/3wMNZgW4kZKunOu1IEiG2jFUjWXS3zzkcdaTBkrwFHJpK0w
 FOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTo77hPRZPJCGOc5lQV7xcrmA1XxlNOYWfSFKOfnGds=;
 b=lp1WDnZevl7GtuSX+Wxde9ps+cQzyM45fUxo0/VV6FjYJ1axtJVJRCj5gfZoyQnhaw
 clC/JYLjHoZO2q103jrky8fSiLhmQHY7j5HHTmXsYeLYFmKVOrh5HjdJUtFJn5nmyHwo
 hAOdhwxAxyWaNcHDYulxCicUAIdCdGIeq7hOz64QwJ87jviHNxxgo814ctgCj8zUPDNd
 VuZxhUJJ4spjPj98THXcDaVzMMcmvZZZmh7c1QZ4CNIjmtX056tgtdn7s3Rh7++q7UuT
 MLLcs+C+N0roAe2QcSvNA/uieMoMvCR/WynxXCYU0pmfBF17Hxvr01s9xqAdsEXZhWOj
 KaWA==
X-Gm-Message-State: AOAM532lEn1yfjDHKhzQSkenDYreyPWhzMlpCSeGO9GS8Q3A0CuwUuPg
 +TmCxUsUiGiKBSnPXT/ls9eJ5md1OGAAag==
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr163020wmq.195.1638216315776; 
 Mon, 29 Nov 2021 12:05:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 3/4] target/rx/cpu.h: Don't include qemu-common.h
Date: Mon, 29 Nov 2021 20:05:09 +0000
Message-Id: <20211129200510.1233037-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h2WEHV8EBYN5

The qemu-common.h header is not supposed to be included from any
other header files, only from .c files (as documented in a comment at
the start of it).

Nothing actually relies on target/rx/cpu.h including it, so we can
just drop the include.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/rx/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 4ac71aec370..657db84ef0a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -20,7 +20,6 @@
 #define RX_CPU_H
 
 #include "qemu/bitops.h"
-#include "qemu-common.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 
-- 
2.25.1

