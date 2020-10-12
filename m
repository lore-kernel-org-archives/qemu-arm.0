Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1164194lfa;
        Mon, 12 Oct 2020 08:58:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXNSHlrjlgP+MJQGPMuIcNmEpKKKPw1kwYetaZn2KZnnVvS6qo3LYioSOF93nx6w6Tb6ky
X-Received: by 2002:a25:8749:: with SMTP id e9mr13909534ybn.356.1602518289764;
        Mon, 12 Oct 2020 08:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602518289; cv=none;
        d=google.com; s=arc-20160816;
        b=V6bsvEwfaKZyx+NtJ2XzWAdMilnGA6qzYX9pbq5zucuK4fBr5nl29f/TZwsxnkyGYz
         AnQv4u8FWfeDnt09AcNA/ilHoAurbuFNVxBeJvtSsGuJXqaqVLy9Iiap+L6hBYXLOBN0
         wbaUJ2TMidsCMvmlBDjpkruziKyv19nbvSp61Ob8yrjNX2pMP69brPLR9LDdFQapu+p3
         Nm6f7CCZIHxk5NRJC48fZhOG9yWHt4yZ9+hsSlRJOuNbqDV8q52+veF6mg70TfCUCJOy
         /U8jEGRe62GK4TUQhci0cBgR6PRM7cnV0XnwHldY8NtyYCsRTxJ5WjscTd+n+x+oR6cT
         96OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MHkoxi+EkVCFW4Wg+U688/CA12tSJrQLvZAe0iXiD3s=;
        b=HMClo4kj7KPRB3tnWAdSuyHW+re5H1OFqljCrosWwsd7Aa4ff21ekuXe3W57/1RrZo
         N4HPL1jqeE2NKcbwNJqnFjfY3RdbknSU8DibcdafEIgx8a7YDutRPCG6HJR5gZQcYjlp
         rC2y5PnHJG52TtydHMyV6FhNdszErc/+EJ7qgBDxWpqsZX8cW49MCHKWgFYWCKmQuYl/
         PQxlr38H9affesaYw0NuxvTJgi+gYhVCS5+RsZAeahbtHC6dHeeeOcpHbPVLUAhEdmLO
         obrugEj83zGgLlHtkDqsPJxp+fpZCm32G3Wo912N5Mzdt6klfU9lSJ2ZsQJ2ik+QSqN0
         Up1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TDmw4Ab+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si15001776ybo.363.2020.10.12.08.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TDmw4Ab+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS0DB-0004qE-3f
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqs-0007Qo-C1
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:35:06 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqe-0007MN-HK
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:35:05 -0400
Received: by mail-wr1-x444.google.com with SMTP id h7so19714031wre.4
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MHkoxi+EkVCFW4Wg+U688/CA12tSJrQLvZAe0iXiD3s=;
 b=TDmw4Ab+up5ZPeCCjMTDp0maLBBjXy0H1LsNGgtWpPV7uMX3CCH28eIbi4HRKCgNQV
 lhl9cq0lx8ya2CWBkYCr8n8uzDU/qQYL6e6WmMMlwZ7rJGaX3IsevZRFEaET7aM1zj5z
 9SzQ5IZ+hY6rVkSzc9X0Kd9Xt51ljObJotFMwNmK0X6Zp9q+9R4spQIrTwMEXlIv3xAE
 6vKdA3WiMiRgiD0yX5yZHdDJ0UaP5eXFGyeJJJDCk5dbbbelCmBJLa/UivU1/crsLOuF
 XSPnHtIMN167sOUkxS756LgTNQaunMxzLvPuIw5CfSucOhaJyS72sghFqI6Td/Kv0T1s
 DzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHkoxi+EkVCFW4Wg+U688/CA12tSJrQLvZAe0iXiD3s=;
 b=WlkOEGVtAtLKs/pv+l454IROb+Fr013YZEDwsK6sZ8VsDVY2AhTizo0vnevbQE3H83
 I6QntMuL7zZ+19mMbZtnEXsZMkq0lCIybI7YxC7AvYqc/yB7UQt8UmpIobwmaQtTWgH3
 QRA20jB07yBY6DrQ2n57jnNwO46POklRhqrX/0bnvTpeUhDEvTedNnDGq+OUrqOprXk2
 Y4lhWGJ5KMhAfHEgAVXcAyrF8rGESx32c6e2uql4DCRANSLnmXxqSFV55KYF1k0h5YkM
 X1KGHEb7hCDsFk1woaQ8wa3kOKhtXsXgTpRBEPxbxit6YnONmDZloVQtxVQAjHSQ7VFA
 qCkQ==
X-Gm-Message-State: AOAM533K4AGRReXi13YQ6j+aCHK0AlBcl/sZVPu489VwBiYoz+IN2qi/
 NpjtgUUWxsdEVNOqWSHqh6yWneC50VJLvuN/
X-Received: by 2002:adf:e741:: with SMTP id c1mr19304521wrn.16.1602516879214; 
 Mon, 12 Oct 2020 08:34:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] net/tap-solaris.c: Include qemu-common.h for TFR macro
Date: Mon, 12 Oct 2020 16:33:48 +0100
Message-Id: <20201012153408.9747-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g4qpAYpbu4KN

In commit a8d2532645cf5ce4 we cleaned up usage of the qemu-common.h header
so that it was always included from .c files and never from other .h files.
We missed adding it to net/tap-solaris.c (which previously was pulling it
in via tap-int.h), which broke building on Solaris hosts.

Fixes: a8d2532645cf5ce4
Reported-by: Michele Denber <denber@mindspring.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Untested: Michele, could you give this a try?
---
 net/tap-solaris.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 4725d2314ee..d03165c57c9 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -27,6 +27,7 @@
 #include "tap_int.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
+#include "qemu-common.h"
 
 #include <sys/ethernet.h>
 #include <sys/sockio.h>
-- 
2.20.1

