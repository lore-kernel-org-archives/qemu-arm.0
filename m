Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp600727njc;
        Tue, 25 Jun 2024 00:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDh+ICg8Hof21alrWlSXVGvl/1fuw5MoWEEvzonfXXs6pjLegBA5JN9J/Yer7yy9jn9Xknedlamn4cOUvcMPBdZCKzFBr9
X-Google-Smtp-Source: AGHT+IHk/JpqzBwy3+tqrg62D+KMDFBa9lQwAYPg7GqGImZz3af71JTURARRUEtlaFk3uK6YRHjK
X-Received: by 2002:ac8:5dc9:0:b0:43e:1231:1040 with SMTP id d75a77b69052e-444d1802dcbmr117177491cf.20.1719299308840;
        Tue, 25 Jun 2024 00:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719299308; cv=none;
        d=google.com; s=arc-20160816;
        b=HO97KiqObgPCjvMKOtIvzYPPaw4zCu5w3+v6PXof1+pCj2y5eCepC6nSkFwfYxqzD+
         iN3TCFofvrREN4uKywsWiYVXXRXUNowN8XjC6fDwQoAjVj9x5HvH6udAGOdgYZi4QYcr
         nRjVvuXD/4GdXBq1GfK6urjiW+Wjq4WIwFAmYGRZbeWj8Wc+C0EkeV8oRVw8YdVyvnTv
         NRHrkgidexu5n1FL7Dk4Rupo6Jc9WDq0M3k28rb4n70EsZnHAOR/C0fd/FBPPoYqX7Yp
         NS1QulcZL43cotbgNA1LrlKyPaEknk9LxCnc4yb30/H3wE6hk3Wf/5LRyGuRCy1X8rFL
         fm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=FFg8ODvS+5b8zBBOGYzt72zcj8y8RzeQLLrlVhbJHEg=;
        fh=N2H2zGIwg6wxsGvJSdLbUlk7tQI0CzOF+cEb8Z5scRc=;
        b=kb3DkOrYUqGyoXLmLkRloyfil+c8A/UVwFAFrYscDBqZX6cib8wTN39RP8Ty5kCTYm
         Y1hvNUfj77jFbFj285WQ5zOj6COkPZq2rd0pIQUKu97+N98iMwcZXeEtHYpad16hoZ+R
         W9aFzzIgrhlGkED12sbwHE6W+Q3WhkuoEJMJRwz8fNPWWlyJiU4+sErdl9viLua9JsXh
         OIaseZ0T0IDTYs2ELcTVHMIJx/ie896y3B+HDRdwFgtUb5XpldIeM5ukcm2rVBrINv0E
         O+RGxu2tBuR7wiodqWXxj8fn9up10kT8bEb7c5FqCmSvHQTsQy9CDu41pPuMkLo1gJGq
         sS9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2caac06si98644951cf.802.2024.06.25.00.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 00:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sM0HO-00010V-Nd; Tue, 25 Jun 2024 03:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sM0HM-0000zl-Na; Tue, 25 Jun 2024 03:07:48 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sM0HK-0007Jh-FB; Tue, 25 Jun 2024 03:07:48 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Jun
 2024 15:07:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Jun 2024 15:07:41 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 0/2] Fix coverity issues for AST2700
Date: Tue, 25 Jun 2024 15:07:38 +0800
Message-ID: <20240625070741.2852946-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Jf9nanGOM2zI

change from v1:
aspeed/soc: coverity defect: DIVIDE_BY_ZERO
aspeed/sdmc: coverity defect: Control flow issues (DEADCODE)

change from v2:
add more commit log from reviewer suggestion, Cédric.

change from v3:
replace qemu_log_mask with assert dram size 0.

Jamin Lin (2):
  aspeed/soc: Fix possible divide by zero
  aspeed/sdmc: Remove extra R_MAIN_STATUS case

 hw/arm/aspeed_ast27x0.c | 2 ++
 hw/misc/aspeed_sdmc.c   | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

