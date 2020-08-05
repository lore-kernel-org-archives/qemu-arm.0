Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp693756lfy;
        Wed, 5 Aug 2020 08:00:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4pTbM9MgGInT4/Zq6/IoKsELf+A9VkQ5YIGqtWMUX+x0DyhkT4+hwgPMnn/cmj2Q5CkTt
X-Received: by 2002:aa7:92d7:: with SMTP id k23mr3472222pfa.295.1596639656794;
        Wed, 05 Aug 2020 08:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596639656; cv=none;
        d=google.com; s=arc-20160816;
        b=OfXTZnDrtajspEYYWksN/uYHKlRSlyNXJLoTzitD2IUO+6CE47kvUx12H5ovwULQfm
         exGhlM1BB9M3tCFaiLSBs+CEpsTrfC1kuXDB244ZB/3beHvE9XmbHTDqRmxMliHv9H/P
         hERSeN6gEak64m4OrN1xdYQetZzVLzDgOkp2Xbvxpyk/+J1oHVqf35ezZi8N9mjUaPhU
         KdQopy3rDL3zP8zRUk6BHmoz3pqUgXyLi+19EkWj1W1TlDta2G/bR9k5Z4m+Bipy+hV3
         OeU6X9hXem6yX6bwhIZVwI7KmbgqlpN7XqjrEBfU5kns70uuCzsqW2hyfmOEu6LADw8d
         EbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=gmuT+GbWTjKMrklNATbcoPBcPrB4lEmkz6h2lT+MhrI=;
        b=hC50Sww4zon+ZS9eq4OJOVbALlABa9nzke4bCjqfxaPlQtaR5kAfrRXN374awNVivr
         5ald8FpHkSLoTzx5Rsk72xt5ZRqHT9Au7E49WENHhh0dsX4QqGIlV3UWxhNn1zfr/NFQ
         B3tLzxs8TjrBiDmmWQFOOOCr3t192nAbtEqe0wjysDYs/bqTQJGInyquvhIjacIa16G6
         71AvQeSeoVneSa6wFqWwYCDAQBjA/q5Uc5i0SdnGE0ksy0fTthDRRGx5qbwGdVW+aTh6
         IK2aGjGp8Zl7HfF8YQ30ijdrV1rM7pQsqB3QCjCmo5ybVX3WAfFDG73f7nBQIJiFbgUh
         bJ8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=iQ7sqD78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si1614572plb.109.2020.08.05.08.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 08:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=iQ7sqD78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:59782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3KuT-0006Qb-Us
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 11:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kononenko@yadro.com>)
 id 1k3Kro-0005xb-8u; Wed, 05 Aug 2020 10:58:08 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:38884 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kononenko@yadro.com>)
 id 1k3Krm-0004IV-7B; Wed, 05 Aug 2020 10:58:07 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8AA7D4C1AD;
 Wed,  5 Aug 2020 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from:received:received:received; s=
 mta-01; t=1596639480; x=1598453881; bh=WOYV8Dcju5qv3HfKHXNFX+ZY5
 r8qAa6xXt8iK++1BLw=; b=iQ7sqD78hCxnby69ooje5z/tYFp5Avau4LviPjeDc
 lxpxBJPKOIfkxCW6BHFYSBCcT2hQW4wk1Ny0TECV5V2ooM33Jcf2UdRWI6QXp+3j
 1xrd4SPm6hN+8WLCMxqn5ZbHA/XCm5DwTrnS7HZwp9Kg+5BXcMaf49JYhEwX7uds
 Yk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2EUduJLtVuQ; Wed,  5 Aug 2020 17:58:00 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2EFC641282;
 Wed,  5 Aug 2020 17:58:00 +0300 (MSK)
Received: from ik-ThinkPad-T490.yadro.com (172.17.4.251) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 5 Aug 2020 17:58:00 +0300
From: Igor Kononenko <i.kononenko@yadro.com>
To: 
Subject: [PATCH v1] aspeed: include build AT24X EEPROM devices
Date: Wed, 5 Aug 2020 17:57:49 +0300
Message-ID: <20200805145749.23929-1-i.kononenko@yadro.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.17.4.251]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=i.kononenko@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 10:58:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Aug 2020 11:00:32 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Igor Kononenko <i.kononenko@yadro.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pkd1Z4UJ+wMi

Since Yadro, Intel and many other manufactures use ASPEED-based BMCs
with attached ATMEL AT24X EEPROM devices, the qemu-device AT24C must be
added to ASPEED_SOC dependencies.

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
Change-Id: Ibf4fb7a3057bd43998c94d44609f402d3f088863
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2de34f0b73..0c6a032190 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -367,6 +367,7 @@ config ASPEED_SOC
     select IBM_CFFPS
     select IR35221
     select APB2OPB_ASPEED
+    select AT24C
 
 config MPS2
     bool
-- 
2.17.1

