Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4687726ejb;
        Mon, 6 Feb 2023 15:36:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/cfNJ74gJqEWL0cUo/XP3r640fNVqoVGfOPDzJS978igpIPisqNu8dkgBicyWubQ0Xqp13
X-Received: by 2002:ac8:5c54:0:b0:3b9:a532:a1c with SMTP id j20-20020ac85c54000000b003b9a5320a1cmr2093184qtj.25.1675726566669;
        Mon, 06 Feb 2023 15:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675726566; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/ty+f12Ol0ixnOHOgh/k6/e9ufLCN5Xe/UOfNgqjAMTrCQlLytHCLYDxKyFYzpw9k
         RRnmIx5ERklSJTactNR6nyix0vEXVPKOzZUH/yd1E5IwO1cs5o+7NCje3z2Y+uyjdd/D
         K1EnZK2F1rQ5/MknDWQ/jTeTHCvcpYrYXub0ZxXMMf/tkdQTdblbR0tHN5vVG78ho5/0
         +ZEJAyZF7XJ04ALRFlJdfzrPLfuYI7ars1wbZThALzxQio9ghDjgZni067+EbANKpPiQ
         nGi47dbBw9Q+bqU2368UNECIKabnfzoOFK0kep+lFjIzxkNDziRAXRwzxxwFILDUozBK
         q6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=vFsWxZhA6QPnt4GsI20du9iPkTYQvxuV4k70tA62ahM=;
        b=hfc4A2xn8U+1NAlnKi9258rOwq/YllV6SF8CgYsbnZu87id+cq7KGmXbKwlRyg9AWo
         lcGgPNXbg24RI00C3Koi5iP1JS1AmOlwjffVM0MqaUXFJXXB5Ky7wuPpQ9vO0UQ0xCD+
         c2Loqye6jBIu9/EMGRiTvE55foWS5pHfkVxFNR5VQ6QZlwi8ngJMOy6Xsmg35lmtJ0mx
         Jqq9YfLiJb3N5G5z5NMAV4oc5v5rs+Dlh64lHBkm799QgNjvRfyZiAuhSklNsw7+ZeQF
         /d06kitYQBSv2K6II+L7zQEBWoUKFsMjvvsBBUNle/nuNiyLMuyaK0K1FKlBnNKhnzNq
         Gvgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RFI05uy+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020a05620a411500b0070668df333esi10420512qko.98.2023.02.06.15.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 15:36:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RFI05uy+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPB1E-0000mY-NH; Mon, 06 Feb 2023 18:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jY7hYwgKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0a-0000Kq-IR
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:34:55 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jY7hYwgKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0U-0006ER-Iv
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:34:48 -0500
Received: by mail-pg1-x549.google.com with SMTP id
 p27-20020a631e5b000000b004f3880f6673so4097068pgm.14
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vFsWxZhA6QPnt4GsI20du9iPkTYQvxuV4k70tA62ahM=;
 b=RFI05uy+DHANnC3nOXUHf2gufeA55tqe3i9o8XkotRXFMPZrERW/Xcrrb+UKqObrFk
 UeGdH9pPEWGMxE8w2AjuzoxA3brVewFpPAXraj1UPDUvjQifyf4VbtQ5uJj3KLohCq5T
 IKk8YBp4fSXlBI4eGTw0eemN04078SOaIAtmypdiPhX9+sxlKc8KhPICS5teheCBC7aL
 /IHC5EuptooSdaoRJVsvL9LlhKzKiWE5FGXPpVsgwbeX+uEA++SxE+IUZL8gOF6RsCVT
 xynr4Ix8DwDi78b5OH2APw/0gq5DQ3/KRxSVzLgxUD207mkIit30eBdFEe9QPqMZmaNV
 knhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vFsWxZhA6QPnt4GsI20du9iPkTYQvxuV4k70tA62ahM=;
 b=JrQx7bHVA9kxXdUO0hjO5g0tDJxiqHPFmecJXQfTvKila4Zg4jfVPEb1PafivKYpGZ
 WVhQJspl2SKkm1e4Kxhw+zW+vkGOHRkIeUMYeWHFbyOdcLhl9JXbLPwV3HZGSKtyYjtC
 NxCrEHRfgh2bWLAFRlsJ+yogQ/MO1jh1aIThFeG4F7hCMObU+NV3XKAKCPIvUR18Xs3f
 AUc8pTTOMPA3YiDRpo36nChd+dhA7Tg0f5DihGcxH/rI37bp86Db0JGCEekqyBGPSkDm
 4XXOyLeIh/WN35KUx5AK5UifkMxT9bc1xmc7q4/3lIPESBsBJVENmGk6GidZLM9gXlyK
 vI/A==
X-Gm-Message-State: AO0yUKXDNjpraXLKM27eui4QvfC8pGR1NIHyQYJOaE0HH2iRIRxcrzaR
 L4H+3yAbC3s4c+L60EhiEIJWyN3m1tkPkQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:2784:0:b0:58e:2111:9c42 with SMTP id
 n126-20020a622784000000b0058e21119c42mr282874pfn.22.1675726477964; Mon, 06
 Feb 2023 15:34:37 -0800 (PST)
Date: Mon,  6 Feb 2023 15:34:26 -0800
In-Reply-To: <20230206233428.2772669-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230206233428.2772669-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206233428.2772669-2-wuhaotsh@google.com>
Subject: [PATCH 1/3] MAINTAINERS: Add myself to maintainers and remove Havard
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3jY7hYwgKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: DNZCmeYDjemk

Havard is no longer working on the Nuvoton systems for a while
and won't be able to do any work on it in the future. So I'll
take over maintaining the Nuvoton system from him.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa10ecaeb9..347936e41c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -799,8 +799,8 @@ F: include/hw/net/mv88w8618_eth.h
 F: docs/system/arm/musicpal.rst
 
 Nuvoton NPCM7xx
-M: Havard Skinnemoen <hskinnemoen@google.com>
 M: Tyrone Ting <kfting@nuvoton.com>
+M: Hao Wu <wuhaotsh@google.com>
 L: qemu-arm@nongnu.org
 S: Supported
 F: hw/*/npcm7xx*
-- 
2.39.1.519.gcb327c4b5f-goog

