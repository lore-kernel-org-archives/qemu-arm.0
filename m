Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4184668lfg;
        Tue, 4 May 2021 20:06:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF4KCi7aXDSPN2qhZjtol81Y3LpxymVW2PvFiu6hDr4Otl7Lm0T2ABBxrb2rHyeNk/hEkn
X-Received: by 2002:a05:6e02:92c:: with SMTP id o12mr23758588ilt.256.1620184007378;
        Tue, 04 May 2021 20:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620184007; cv=none;
        d=google.com; s=arc-20160816;
        b=dyldjEUDJesAuZfjoIxta+59JSDlmFz4avitKbvJQAkhI6Dwl1+InpmfafXgnvem0H
         HSRi79EOahMdNcNgZPKBO0Uoz3hj3jr2zr2+ebTsD2FeGgb0/0SSVurJ8X9Hul+j1Hy/
         9ifVlLetUqza1+yvmfVhePXfTSo8vHpApuse1FgxgSGxwkBK9LOkUZpL+eT+z/bzwDma
         2gksOKgkCPrLz4adRCVBruqlI2+PdHL5uMsWXkT3z5UcY0LTPQenPAlCwAk83R+5JNSo
         kBzHhsGKLGQ4Qi1q4Oe72XtDV9wcvSo8o3YCxM0L+7x8k0NUKS8+7QuEnoT+ZE7tUzD0
         Wyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
        b=DWVM6bx64dydSlO9dr4zrbj2cS45llxhNwyzCeo7711Txv7+cJpijFiyOfFHKrzo2w
         cNzUc/rFVrrXm7RKI4mkA4lTrZsa6Xc4pGFahGWyh8LY1r5pliLt2aaHxR1XK/KIpnCI
         e1aWTuQM+BHe4ev0c3TdAPaJzF5q8GXbnlMiwx8KPpUrzf4eAvFvwCwVThkPg70xW3CU
         RkmZsIALE6CJBxkF+syDybJ5yVP0c898F88VDZVIuEGhPk2dupUJkTj21CIJg6NKn6pT
         2oP7ywBkVbAyknBhwMeNBETDDzVn5H9BnCaavwFFOqbAfgVQAB31TVFeGY/tHxlGoo3B
         vCtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=05WXkcw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si16130116jaa.31.2021.05.04.20.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 20:06:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=05WXkcw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1le7s6-0000NW-MJ
	for alex.bennee@linaro.org; Tue, 04 May 2021 23:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qg-0008FL-UZ
 for qemu-arm@nongnu.org; Tue, 04 May 2021 23:05:18 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qZ-00034K-DK
 for qemu-arm@nongnu.org; Tue, 04 May 2021 23:05:18 -0400
Received: by mail-qk1-x72a.google.com with SMTP id v20so305758qkv.5
 for <qemu-arm@nongnu.org>; Tue, 04 May 2021 20:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=05WXkcw2sOlbiq6nu0JNKVFANsscIs2gaD5SDLLLZ56buXsFk0UUyUgHR7GV1gounI
 XNbucrzS3z+xDT+1buUDiiF/mLuDuao0LcVQnrzwnr9TldqlI2hoRwsl3N6KR25Dfbdv
 9n14jqN4ih+adVEXih6Z/fcfcq6ez2sNJXTfm2gROQ4/+4FDh+47YC3xsbXUq84JWIiq
 i//jIGNHhMibUhrXMHrG9AUAGM6KSXAYw9TWWYq7plQ856QoDAaloSbrfnH/sl+uZpHg
 zUa3PtTvelX+/Kk7h831r89wJM6nCm51ruTquXX0epcOqlZFRnOoHadBC5zbhUA2OUe0
 4BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=mU1Z2pwWbPNusZ7fI4BrEPukheTcgP25E5t2G0p2vhiXkz3L00tsMhp9gF8QJO6JQL
 rU43RqGHrnxbPr9THTSHo8aAzCA+r+jMvSGauxRVYsvw8OFXEBjiAjZ6obzPZzxmQMqW
 FD0sl8rY6LaXkB+fw1KKoXwvTo04v9FfS5U9mckvuYnzLR0itxRDA5HRkd640hzT6aTU
 SFFFlgPSEMRg7rWaHF4ZnYyfkXolK6fMxDCLo2zU5Obi/Pz/MR9jWsqohtB9cdCE5LTO
 TjG/xcE0p4nnunVYjJWfymnKz5Ai8MEu99BdjGMPTjzhVvTu7xIa7GI9fSzqSbdzSexT
 fKIw==
X-Gm-Message-State: AOAM532T328wMyffAFtQh80G5a1ym8NTbauJ0d1FDBRKYw0cso2sHiZ2
 WqQsjOON+tQmW1fuxKTB60Xr+g==
X-Received: by 2002:a37:27cd:: with SMTP id
 n196mr13036119qkn.420.1620183908054; 
 Tue, 04 May 2021 20:05:08 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a63sm12270550qkf.132.2021.05.04.20.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 20:05:07 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 4/4] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Tue,  4 May 2021 21:04:43 -0600
Message-Id: <20210505030443.25310-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210505030443.25310-1-rebecca@nuviainc.com>
References: <20210505030443.25310-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: S14xANL0IZJ3

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

