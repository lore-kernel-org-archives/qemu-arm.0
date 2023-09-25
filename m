Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp296807ejc;
        Mon, 25 Sep 2023 04:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGxnqlDPfin2/b/7vJEbBwpPOS9Nvsd0dfLkqtMmIlPRc5tjJ1ei/SwWVggXWgxytzf6tC
X-Received: by 2002:a05:6870:c114:b0:1bb:8d8f:9c6e with SMTP id f20-20020a056870c11400b001bb8d8f9c6emr6710387oad.10.1695639915177;
        Mon, 25 Sep 2023 04:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695639915; cv=none;
        d=google.com; s=arc-20160816;
        b=RaULHOWxR93MIfk8MGPfBhINPABPzCSdjVyZQCRd/Hk2kvvV3MAm1zC+GpwqB3T/Te
         YmAGhQP+iO5Fqg4+9HNOJiPY9A/QKtIIdcGIP+qA5bpDo+xjYp0K5rlvBnmQvLLnV6Vc
         Tt22pHKXNbr8/Zl+wR0zsiIjVp0dmzFCHhMuAOsUHyGpAzhAkV7930CvxD0zA7czLil0
         UUE/uONtbFO0O5AzHotDCeva/lUjuLerWe+tT1V6npREpJq+x4+RGdI28jJcRa89Nmqt
         EIgpdm6b1Aga3MnrqDDluJEDLNX6raNDdCGRKVmZ3y564ebNj8SuSeb72QKU6s+SRUp4
         vo5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=u1W6wTk6TumYLIo0sM/EwzlteheKi0DHnJGq1BRYnmk=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=UywYbQxddo7alEoMLUpxJAYk0AsBDlgqFFWUnRJoDC2js7e5poB+Nuies4EpSfja4/
         cBHH6hr95VcloDnuClTZLkJY7SgQ1nMMsmw06kWwqNBVGZ3SPkI5JwRshk4BuyNSQ8z1
         dmb18rbuVY7EY2IZxiqwKEsGmziczAirjRRnkZjVLcDJD/cVhk9RXivop+4uvYjKERs+
         bRDwuRYLD/5tsuwPOiuWdxpeu4n2hkMvT0jS5/C4jqbQDPbA+NM22Pi2d1JBr4D5UeQ7
         xps9YoMsWbrzYBVhtTDWchdLIhiXh5df9VqXa5fyT9SIsY2jMfjpoA14/HcJhr+f8YHO
         OO+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yRyqlOQb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kr14-20020a0562142b8e00b006563df78a85si5896331qvb.570.2023.09.25.04.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 04:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yRyqlOQb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qkjOH-0004gf-0K; Mon, 25 Sep 2023 07:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qkjOE-0004eI-HP
 for qemu-devel@nongnu.org; Mon, 25 Sep 2023 07:04:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qkjOC-0002UA-RL
 for qemu-devel@nongnu.org; Mon, 25 Sep 2023 07:04:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-404fbfac998so68863085e9.3
 for <qemu-devel@nongnu.org>; Mon, 25 Sep 2023 04:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695639871; x=1696244671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=u1W6wTk6TumYLIo0sM/EwzlteheKi0DHnJGq1BRYnmk=;
 b=yRyqlOQbPdOIF8L7f0ydCMDbVUAe5xc5APkcK0v7B5oJpcqnixbGJh2ImJTlPzy7rb
 3MqiBOvHQplExHBTBpWTAsYPG0ofHYSNnGv+qiSOAs0U4U3kErUC5Flymixi8dfdQ0AG
 C2iwhQ77Ccv2BwHnWM6H3zX/1qvy/ckefZejc6VWQo3tl5GanVWSxZ9ZO96ivORDW0ZL
 1BR1hjSnfhUfs8SSpwTm8ZuWCJChgoXuINElEeLdihThxH7xQ+pDb0I/EztTIBJqIfYB
 PtahQ/9ceWsQm2vuWNFHx2R9xsXREmUcjKpYg8QQI0JReQUFgRP78To1m8B9mqUD7nKX
 yy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695639871; x=1696244671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u1W6wTk6TumYLIo0sM/EwzlteheKi0DHnJGq1BRYnmk=;
 b=sFIamHja6eiS3HpwXMCGaBZw1KR6m1OycW9BPUPzLzeErxA31CQ3rVO8A/FXs0N2HM
 9/7KwBkPmiS6T3tidIezRWuDVJULA2jrP+FIcT0nRTGqGeUadBbz2WBp6WnGpVaBV7UO
 JFnoIubukP7OOfhUCqkXBdRwY+8hQN+sjW5niP4uSuiei86FoWvAaGoGvmZqFQaWaj/Y
 oTUmubZZYvdGM5bMEqDGrJEdt6+m/PJwEFW1rVXoY+GAqB0xkAJ96kdwDSK7W9l6O2Fr
 92RIDzdZPSp1cnx77MokugA4HrRcJS8Ac+mjG40/9oaDKGBc/eJnIXOCGyQSHVtoowkE
 waXw==
X-Gm-Message-State: AOJu0Yx/X6Wr9xzUl7AP0ge3xAHNDMu+D8EfHFdI6VbUGm8r/eH/I7E2
 HzqEbrFLk9tWf8MxXLu+sxrLkQ==
X-Received: by 2002:a5d:4a04:0:b0:31f:f9e5:ef05 with SMTP id
 m4-20020a5d4a04000000b0031ff9e5ef05mr6042442wrq.1.1695639871080; 
 Mon, 25 Sep 2023 04:04:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c294600b0040472ad9a3dsm11806803wmd.14.2023.09.25.04.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 04:04:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm/kvm64.c: Remove unused include
Date: Mon, 25 Sep 2023 12:04:29 +0100
Message-Id: <20230925110429.3917202-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: MrCBwWTw8gGW

The include of hw/arm/virt.h in kvm64.c is unnecessary and also a
layering violation since the generic KVM code shouldn't need to know
anything about board-specifics.  The include line is an accidental
leftover from commit 15613357ba53a4763, where we cleaned up the code
to not depend on virt board internals but forgot to also remove the
now-redundant include line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 5e95c496bb9..3ea9f1d6743 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -30,7 +30,6 @@
 #include "internals.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ghes.h"
-#include "hw/arm/virt.h"
 
 static bool have_guest_debug;
 
-- 
2.34.1

