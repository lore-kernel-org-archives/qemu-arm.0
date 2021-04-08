Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp958693lfr;
        Wed, 7 Apr 2021 17:22:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3SjwvexGe5h8FquGtL5wRw9kwo2mxghR1QLsC4/23QlciCPVM0FMGjMHfSLs8p0V+thmy
X-Received: by 2002:ab0:1c45:: with SMTP id o5mr4247969uaj.13.1617841320695;
        Wed, 07 Apr 2021 17:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617841320; cv=none;
        d=google.com; s=arc-20160816;
        b=Zcqz3nO4TlBGOTLjmxT9027hPrnvWqLCxyC2LU6T+MP+wKvKHRC5+L/b3FPwmp2l1R
         70l1rBNDGSg5aB3sEPfI1rahyb2FfIog+z65f7XBYSBXIod8Tfpw4x3pQhTd+YeoKrUY
         3ufGKyLADRfZPdZcU97LfFgeWZftnN0jNys7pF5HRpVQflih6JRYNq0ygmoUX1sM8H2N
         1Zx6yXV7tmDoiVl61Og/pztV1ffl2YetV0watNZgj2S98pk7pw/pqa+m++885il5BDKg
         9OXgKRyQRcyzI99KWsAysDAaDFALXIo0XMWQ7oq6EEZZbEjaR98U8vR7saB2oRY86VIJ
         R+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
        b=r3ZE/9JCl4onIAFirysCnpSCgZEm7Kt+X3unZ8s1CcX6UznJsmQdB+QYvzPzKKyp4f
         gs0ta1Jb4/ru1tlrFRGwqyPJeqqq2LrKcdxc6i22aDj/5dh0txGNOF6sSAARovy1Zzyd
         NDYi+sYAOLp/Hk/iSxyK+vv55XSpBxI3CG2P7/vHa6Uf6oBQMIDf01yez7dYLiw/CLnO
         Iph/IMEWL2/SOSzbyXpdEbvTO3jf1nFnoxdzgIBJefIqr5wjpCEnGOmJlQw8f8YTrJxO
         vLd/LVxdfYRsXz/GzZov1BJgjrxs/mn+9a7cL/ZCbflV91Nz07UQQoJnU4zG24ut5D8e
         qwsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=T8F2BdCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si2314527vsj.31.2021.04.07.17.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 17:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=T8F2BdCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUIQp-0005lb-Sv
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 20:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIQ0-0005Hj-8W
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 20:21:08 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPp-0002eR-Ra
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 20:21:07 -0400
Received: by mail-il1-x141.google.com with SMTP id 6so272893ilt.9
 for <qemu-arm@nongnu.org>; Wed, 07 Apr 2021 17:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=T8F2BdCg9Xwz9klXJ1oZB/EAyOBoP6h8WFUg2AK40+MoKYlYCSNpYPvPzsJTVNUJRX
 G6Uc/DT0T9L+iH+bA0FHmsHYop8NnqOqVIfjPq5qU1TaJz1ztndoPBjrDIoSPA4hlYkq
 1E8csSufo+DGxISqXyxJXbC0wZ94bXO9wPHf+SYCYhI3pJ7Jpf6m3bMgUay02X4DP15z
 IvkpnQgcu1ix629Jzazh9xSpypiA7mtgHqjBtHjQrItjs8qkNRrI50kqMaOjpWG4X8+a
 T83DvSscClF9es8Ikuw0rVglOC+c6wjac7Sghttubs6LkCuk05w/b35gWv8L/er+7svM
 /zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=Rmu+Mb+ccOeycmKWQOLIxXkmqmB1S5tyfCXhLEZ8EsNEh25zjOxwoZsq2l5YcpMs7T
 SWLvSxcMGePXw53jIQm2LYHdgTaeyZi6GkcWYOVbD9QIVuO/HZyoKQwAGxsFafO50oqp
 1bpTaqXdH+/4cC/B5QkqqDFALlkUa2Np7vmKnFpsZXUm2WBXUPvexMK+rcDJ/hFIkNlb
 RwHUJV412YdOo911CikIzefBydmtR0Z303D9YnXGOS/wAqxDzIveSxWAoT/OUBYaMFcw
 GJJB7fAbTo4YZXHRKVQpfY4PCWnafp+F0hF5yQ3qUQS1LuQuC2rLl4XHvXkSrTAOt3jO
 JLYw==
X-Gm-Message-State: AOAM533lN6RyFp7jxNWeN4/o0vwSXzYbV/MzVRLtFrvrMMbOF19QGVHA
 dergQx9bKD2dmRTqfQfm5o/ECw==
X-Received: by 2002:a05:6e02:6cf:: with SMTP id
 p15mr4855650ils.237.1617841256915; 
 Wed, 07 Apr 2021 17:20:56 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id 11sm1818393ilg.53.2021.04.07.17.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 17:20:56 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v6 4/4] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Wed,  7 Apr 2021 18:20:39 -0600
Message-Id: <20210408002039.18027-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210408002039.18027-1-rebecca@nuviainc.com>
References: <20210408002039.18027-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x141.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MKqnXcKnPKD+

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..f42803ecaf1d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2

