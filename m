Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp329872lfg;
        Thu, 8 Jul 2021 22:49:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLA/HL9I5Z78iqu+M2OStuvlNwmPLulN+U6ELyZSdnX99HmrSxqxF9UBiBkrfVS/QdnceK
X-Received: by 2002:ad4:5c6d:: with SMTP id i13mr34161008qvh.26.1625809761953;
        Thu, 08 Jul 2021 22:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625809761; cv=none;
        d=google.com; s=arc-20160816;
        b=vArFLfASZiiBOibUHrMKt1DyiqENbdX7SwEbWm6fVPZ/aJsiuDlo9Vt41wi1r2FPO/
         2DP4jhcNf40CvxKqtm1XXNTZpI2pGXv4xPVFquB4eXcIyo0/EbDi3owe0v6I2lLhck7k
         sW+gxl8DRP6HnYPnM6ebJtPH5ZPxnwpX+sPVIXGwnfE7Xyhk/5KjezWUXhZ3xbR3alKv
         L3i4pjZtle785gqNeCRiETT5ddqFujIrKS3t6HAJU9TyK7B0SurE7UcVdXe7TR7ljyD+
         UvZ9vXl0l/ShSOt9xZBM4P0eZNSIgU86acyj8SWsLbgUOslh9cn+dvUEH9Vwns6lp6ac
         CfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=ls9KsjjC5mimnP8sP7pWy62KbnSWwIOAc99yRQnyaKU=;
        b=SVcp24RqzUePBZoVVH191eE8SRmHKg/41KLrJwukj0praGSJIyhAQzHTMqdqa1T61D
         sSiRNNdno/gaL+0gsAoafdvGaUhd0MJ4qXEkn6ycdiio9u6MkiAVVYgSBj6/TJCHXbQ/
         YNdeD80OcE4b+4pWe/d+XQFInhQsNFnzKTIMqus9GSiBgVycZhg6QE2gi5+GPdMyGJ7S
         n8hbiQlh1q3u0nWK6aB5ypFN5iNe7Jo0xaKS1Ktv4P0ha9o8eiMypcyAgCjnH/nduh/7
         pMLBI2h0Nb6G9DAEPcbU64gIYniqp9KPkn7mGD1wDdeVthEOFjf2zPWcOUiiQhrPPZQS
         KITw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=mzXQHcH7;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=kFWBhvAr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si3968394qkk.87.2021.07.08.22.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 22:49:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=mzXQHcH7;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=kFWBhvAr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1jO5-0008QM-9H
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 01:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m1j6o-00056n-5C; Fri, 09 Jul 2021 01:31:30 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m1j6m-0008P8-IX; Fri, 09 Jul 2021 01:31:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 65BA15C00EB;
 Fri,  9 Jul 2021 01:31:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 09 Jul 2021 01:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ls9KsjjC5mimn
 P8sP7pWy62KbnSWwIOAc99yRQnyaKU=; b=mzXQHcH7Y1Z8lr4vCaDwlU6eyafTb
 e2+RdjJraItcBf96wYgpLp0QDBoyXD1sc8islezniIh4O9AMp8lKrXvL6Zvc7VRA
 itaB8Yd6SiwLf5jCARqHBrBYwEe/52wFisLkFnw6Ac0oSpnPOIh+RWlJsn/oA2lS
 2EIy59ThvQ/N9B6a+9lXBYMHKfPyUc3sRBVpXwNbXG+akl47e6V0KDAR7JVVjh7w
 57lzQKzWNCNGyme1eaxJ90ulgqounnWN/7hOcpojCprb06jEcArrWtDkhLpuuERm
 7vJW2lSpEPGVRdh+f2c8xI1ZpY/kkx8/E8gS84rOhoeGwB8qdYM7JHAXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ls9KsjjC5mimnP8sP7pWy62KbnSWwIOAc99yRQnyaKU=; b=kFWBhvAr
 K6wmHAGOQ8MjNXm3ALu99zoc/2TBXPrmHaK+t68nz8ftNLcwuYUwwA1wBkHFlqAo
 GHlwtHXnRWSRMDwA1Xnsnq/IHa3Cnwnh2SJyJXBe3JBKAke+7Bu3Or26QYYn6hPA
 rN1YTKQv4IUY2GPiEGAeS2mDyVKpA7G5s6eic6SQFZu+Bm4zrVDXiwrmFNBC8sDq
 yEuxJnlE+fobfzOGChwC+L8MFypdH58qfP7qN01evNF+bdzw9brUtC7TqxTzr0jq
 Kl2EAcOwZJyCgluozQruCl61lTb2o6CNJDqMtV1BXgimvYA9tGov/a54jn3jYKJr
 GUKHBOFV8g8r/w==
X-ME-Sender: <xms:Lt_nYNDQUwf8aRhjQ9lqXCEFyakLww6nQWtl4pK3erru4BhMRbi4Ow>
 <xme:Lt_nYLjkAJTZYddx9QeLR2lgnzjbCReGzzb9pQbvxbaDfH0tk7No_66Bgb5GZQCJ5
 MFwOfRiVHW6ul2fkg>
X-ME-Received: <xmr:Lt_nYIkK3zIBxV1jz3AOVWf0FAnfUtvIdIdgWIOiyb1hd0OwysOJ4Xv-IVUCI2fHIlNeAaHvR79tceZyms62G7RV2lcNyNLXqedyaTdnETIVR4Q8FtrW8JvcxeeyrNgTGjmjUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Lt_nYHz-ndVbsJvusU7G_Q72QNFTuLw9OL_hhJ1ogVywT2CnmbGDfw>
 <xmx:Lt_nYCSHfEUBW_Ijz_cZQHWOyLIN8m9DpvMbcsDvITBzLTn1xSDubQ>
 <xmx:Lt_nYKZ-hsUFk0cl0pi6nCKMVmISCGIgBqluVFoDpXUeIzVyzJFmcA>
 <xmx:L9_nYAfTpUyGCBP8ktIZLM5LGCHyfimjDT8BRQefm6Tc-0A13jznnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 01:31:23 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] watchdog: aspeed: Fix sequential control writes
Date: Fri,  9 Jul 2021 15:01:07 +0930
Message-Id: <20210709053107.1829304-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709053107.1829304-1-andrew@aj.id.au>
References: <20210709053107.1829304-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/F3acOdQHfy

The logic in the handling for the control register required toggling the
enable state for writes to stick. Rework the condition chain to allow
sequential writes that do not update the enable state.

Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/watchdog/wdt_aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index faa3d35fdf21..69c37af9a6e9 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -166,6 +166,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
         } else if (!enable && aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] = data;
             timer_del(s->timer);
+        } else {
+            s->regs[WDT_CTRL] = data;
         }
         break;
     case WDT_RESET_WIDTH:
-- 
2.30.2

