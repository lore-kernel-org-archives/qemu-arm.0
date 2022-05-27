Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1247256lfh;
        Fri, 27 May 2022 12:40:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzbWOxJhsfEPbqxrkSIx3YvRYdPDxo+tSA8P8Ve2NAa89qy2klgbLzCAg2bXZXgcRWg6u+
X-Received: by 2002:a05:6214:5192:b0:462:305c:83a9 with SMTP id kl18-20020a056214519200b00462305c83a9mr25285993qvb.128.1653680449584;
        Fri, 27 May 2022 12:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680449; cv=none;
        d=google.com; s=arc-20160816;
        b=1Jglu483PyaDuJ98138eDH8DGjhXVseguc2HxsOjxr/dLLAusI5704Dc9y8mAgMX1c
         TKoLySvzDLwjd3DkdfqDSc6B95/9/xiCKFZmaOsU/CMcRL4/atYeXlZx7amNi+++MzUl
         71HPwRzV+XnJoiXF5PKJJ6dYp5RloPpjCq7lGRmWYU6SBj23PbGD8eIvKY6orDJnT1X5
         PuKbpn5kvd+6oy3IfdGJPKH5XALixSjZFiVdoh4G4C+Cn3MJfA9wJDNv1+egyZxNqYlW
         bkU5/d4XdJVINoxOmEAggkw5dzicrvK1mirkEH6wsA1F5jfdAqbNYqWRVj51/Lp/Qa2a
         VyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v/Gjf6qj7oQJrc8fIndDZL/PahcE1ttP0aSQGMu5LyY=;
        b=EHhVdc7zMhbkGlZUc9BM+79ZpbUrtFt4rCVmkdnqyiPEvuXvyTHs8HUEu0v9M63gk0
         XBGiGn9yf990UQq7mHOucgA/5gSKiyQ+Gq34ZI7kL75j4At9bggm3ZF9nKG5O3GjO7jy
         95aeWarjD1tjSflNuLRRW+Vii7VzOFzcT2d8ZKDTYsOrpqJqg9gMUhyooxkJO2ajj57E
         AjfzJh+jCNnhtzTprogxai8AlPAaFK5o/OjyOuhmOlKhIxVNWENEuvNBVSV5WSl7P2VY
         7L/RxmPLT0iBtS1XyGPQcb9ZvXG2Cxr6EyQEne+w8PShd8Ze7F5MKRGGpuves78Ccpcn
         k1yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JdPljj6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020a05622a065100b002f9a2442ae7si3217148qtb.181.2022.05.27.12.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JdPljj6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufpJ-0007Nb-1x
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecP-0003h0-Rb
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004S9-IR
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:25 -0400
Received: by mail-pl1-x633.google.com with SMTP id t4so1898851pld.4
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/Gjf6qj7oQJrc8fIndDZL/PahcE1ttP0aSQGMu5LyY=;
 b=JdPljj6iEXUsoytg2HU4OlQpmOsmw675ld7Q43RgjKJxvBs54TIXbB3r0qvdDUOP+S
 GYYcxES4BuQyOLn+PxqVqfsm9A5vfVuYZ3v7IUcOhJMlr/wJAc2giuOZP9ldkRF2nncQ
 kvqO2+jkvRgZCjbmKutBdT5oFy8gBrIp9BAmRFqsc7oV8OrSVD8bh4hOb298b2KcMaG0
 aetREmR6XPBbpiD3CTauZvImRUVHT5t26H05rUJeZWZvZXM3rp0IGNsm4uNAww+tHEIx
 dbgS/FtAS+ITuPtRheIvQZeEKjfuhl1vd7qNzpFkFfK6eDmBhv9ycqphwd2/WrgJlEGD
 Dc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/Gjf6qj7oQJrc8fIndDZL/PahcE1ttP0aSQGMu5LyY=;
 b=OMfFywqob9Im39kC42Qmfqmb3aa6t4wS0YeVXDap/An6UX1GKYaQ16VosJgTgAQjFc
 lK2Mqi+0WJ9UpivlUvXArnFZwS7KMT8rQCVN2jsQzgKuAx8XsTrSF5sEP2BkmQICztuD
 DhFEIb46KcAHK81fkye3aIV4ZwKpKWMFgJX5KtfFWar9M1Q2Dm4dfZBSn7ncvLmY9Mpc
 jJNw5MOf3NhEANvd9CMJOXlBjM9rGS1EDKwZuIzPvyquzMDpCYVjBbfgvCZDgQlkFHoR
 mr6VNJclbgczEnvxAavaZueUcwBjqah74wfGN/Au63NQxBjWNsICwx47vDBjdQSfdL1u
 uHKA==
X-Gm-Message-State: AOAM531p3vBN6wBgDyyhFTR7SgWWYxQ5MioBidLn0xL13F5oxXY53DWE
 AlI9khEhq0+Atq6j9gQzVAIMIw==
X-Received: by 2002:a17:902:da8c:b0:162:33b5:6aa1 with SMTP id
 j12-20020a170902da8c00b0016233b56aa1mr22932175plx.75.1653675788185; 
 Fri, 27 May 2022 11:23:08 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 064/114] target/arm: Use TRANS_FEAT for do_last_general
Date: Fri, 27 May 2022 11:18:17 -0700
Message-Id: <20220527181907.189259-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GK4YxLTs2ati

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 841c1b5644..caa587506c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2622,15 +2622,8 @@ static bool do_last_general(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_LASTA_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_general(s, a, false);
-}
-
-static bool trans_LASTB_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_general(s, a, true);
-}
+TRANS_FEAT(LASTA_r, aa64_sve, do_last_general, a, false)
+TRANS_FEAT(LASTB_r, aa64_sve, do_last_general, a, true)
 
 static bool trans_CPY_m_r(DisasContext *s, arg_rpr_esz *a)
 {
-- 
2.34.1

