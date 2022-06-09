Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp718433lfb;
        Thu, 9 Jun 2022 14:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3MXuBHB9Qu0Td89hBplUn0NRrFopbAkeh5bNCUsOPB8k2fDGkBZDNIgG51jUPyTxLJeNQ
X-Received: by 2002:a05:620a:430c:b0:6a5:f604:1c9b with SMTP id u12-20020a05620a430c00b006a5f6041c9bmr27958485qko.756.1654811462951;
        Thu, 09 Jun 2022 14:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654811462; cv=none;
        d=google.com; s=arc-20160816;
        b=U+GAEhY1WIC6p4DDTvWEyMumLmczm/HyN3EmZ0Kgmt8cEsWIVyTIj8FWae7ME0w8uE
         19rJah6dtVh2SzJckzdjFTeCPzEvQivCsTdGxlaFjw1Q45B+XnbNbPCIVJMkVYlyMaIH
         b0ts8qSerVKKxm6syHMxZ9wZnr0wr3U0XMqQTPLvyqxtTMzIxWsuy6vHks/bMrYMZCFS
         XMwun7PawKIp1v9dtr82plbaHhg2lq/WjwDL6YEjpJ+bc8FKHaTrRoZsDQ+L3eUwi3Ru
         U66TKUmq7JboDlw47nsulOZYwipRlK2Snzpj/7t09EnBdEK31i+eCgBPY1tSX0bvexKG
         8g3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vsqf8N62860auClH3oBdFZRtQ6UBVi/79VXogs1EQR8=;
        b=r3O1/wpCLcOGr7z3eaMctZiZprPwktiAI76nE+9KczNd57L2ei54PP6MClWfC8U86V
         iJRnbod6sSNem4/enNwvAYL42y7SKB2RzFDVdiWxC8jBHwu744q46n+GBEWyvopOuo6u
         m3XE4Zqn2VZcGbWFS1NLD/aUcgbgjMquOXrZELBzYcy7P+EEJJGeApVTQRdGOSH6/XJd
         TsLYa0WPh/x28EhY7H3e4ZjyH9eEJSw+CVUMko9XZy0XjU7CUvaxS5GCtXRvLdWqss46
         b3RpYO0Pma9JWXecCeIY2WJ3z16DEsa0rs2U8ebriJlaZg8qY4iLufvUcYgJQEqjMUKm
         o1iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cXI22vo1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a189-20020a3766c6000000b006a6ab57e54csi8770381qkc.414.2022.06.09.14.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cXI22vo1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzQ3S-0004Q3-CD
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzb-0001r9-OO
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:47:03 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzZ-0003ob-Eh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:47:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso503436pjk.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 14:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vsqf8N62860auClH3oBdFZRtQ6UBVi/79VXogs1EQR8=;
 b=cXI22vo10QmrX9B+JYwrHmM9OxoRU++psGmRA0L/A46NGxTmDZo5n+gMDVd0kGA94y
 JHAu3QvCMiYnJ4n8mBictfY8JQ/IArew53jicOGZzc7Aa1BC5/A3yVTuF8GW5Zr+CO4b
 ZCMAqrtpIJrHTFDmUSYbf/vbSKXTj73v5ebw+QQnH01hucb14boJzVAaLF5/4Q9UPzym
 42eitg7wPrzhP641Y/WcggTBfToy36vD1xmltARcV7jMSSLIGmoeVAopp/m9yGreIiWj
 yG8ZD7/+OyCuHC7kpKByxQmliR1mfvSeZRrfi1CkUdPtVzd5Azvabw4v1KwT6Gqu/LbU
 0VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vsqf8N62860auClH3oBdFZRtQ6UBVi/79VXogs1EQR8=;
 b=eYh206g4UIhc3cjC2Vnq+1wkqQtB5kd17ZPBO+CIEWkTm4npF9f5qULtq1Owbz63IJ
 sff6z4Kx1rPsgrzx1zIg96nBTOtMJZtdk4cY8lSE6ie3gVT++1QrTYMu2X9MIqMLCPjo
 EOB54XdPwtAz/sx6EmieH2ei/Dm4uCKeM4p+mFkqVk6rK5QknGagAFvyR3A1uq0cJ+6z
 timrmK8boN7/eC1bnUuhj18OVM0DJabEvhwgO/4C2/brPGVM7Bj6WRLKOy7YjizR4ffH
 xWLjTkNBowqlEscBoxq20iZ/IVfNYk6Nt5y9ygiwmUWh7Tup5F1Dpfk+LMHzPASmJ6lw
 gmxQ==
X-Gm-Message-State: AOAM532xCFnkUuatw+IPEg2VbRMfOvf2CqWYZQdR02GmQjRHyYF/wgG8
 1jDBNEFsPoTds8+HNmNZZEyFZH6fPXKdTg==
X-Received: by 2002:a17:90b:20b:b0:1e3:290c:c2ad with SMTP id
 fy11-20020a17090b020b00b001e3290cc2admr5325596pjb.163.1654811218469; 
 Thu, 09 Jun 2022 14:46:58 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 gw9-20020a17090b0a4900b001e2f6c7b6f6sm179167pjb.10.2022.06.09.14.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:46:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] target/arm: SCR_EL3 RES0, RAO/WI tweaks
Date: Thu,  9 Jun 2022 14:46:55 -0700
Message-Id: <20220609214657.1217913-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Krt+bV2MpS7O

Adjust RW, fixing #1062, and adjusting bits [4:2].

Changes for v2:
  * Fix patch 1 vs reset.


r~

Richard Henderson (2):
  target/arm: Adjust format test in scr_write
  target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]

 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 18 ++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.34.1

