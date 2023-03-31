Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp690233ejb;
        Fri, 31 Mar 2023 07:51:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y7W0Kz3tYWQFcBDz2tpBCSPv65Vzd8Npg9JRw5wMtLWM6j1EUtiy7JjB6C1Zz+LuK6xOi1
X-Received: by 2002:ac8:5b89:0:b0:3e4:ee22:a50e with SMTP id a9-20020ac85b89000000b003e4ee22a50emr26681789qta.7.1680274290140;
        Fri, 31 Mar 2023 07:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680274290; cv=none;
        d=google.com; s=arc-20160816;
        b=IGLPG15bKAecA0EljfcYrPoKzRF/7I7j+/Q7/4iWtBZafJh9H7+tH4LV9ElUNuVg3G
         HpE42FIpfz8GVZbOnS2ejD224kh2Ca8jM5pKhlD9pOuk9w2F3oDrii9oD2ZqT5O4RDJD
         FbCk+CcIhGvEW8s3vtFU74ALHYGRjodBQ64isQoyeZRyge2spghwoUP+RexYZWN1vWGl
         BGe3yC5oYI9xA/0H6rM+ba0uxLaf61VNI1d/gkfbQofbL9Q05bf9+5R4J80r35nsVWPx
         E3W87amzWQofFOT21GVtEd3W5vJ7n6ydC6jWMstGtTx+vabenpS1tb2hcu+BSGnozhD9
         mr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ob8zaLRhLK1pUzR/HANUMOjhD/K+he8dJVxHdozinP4=;
        b=hHSPfxOqSJ3XDXOiCNQNDuzDV5wCdT1AJ25WTwlih0EbnPj00VVINwi9tt4GyYcQ4E
         NtZGj0o27OUCYabeOGTk1Y97YHe4butTdXap/52ZZYJPpDFPSBBJ5d613CrjgYcl5Hre
         3Bfw5ne8XBOFMjKFI+qvbXkocjKcMNFjtBE21lNRCJc4s5ltQSRjW4/BzYoHN0nURe2O
         4tFl4Y+Aods+Qqw6jWTyx9hYrKbmO/cVyWhfpy06CZDlEfYwdxYfvo/OrSs01MnWt0L2
         qmKKlsMoh1fn4Ou9UWblRiroLHah+Sgoh7L8tcAZQdsCyJj3kEkZWkGt6CpjIEkw2v2F
         P8SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KbmOtAnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020ac84e87000000b003e4eea82a13si1666680qtp.412.2023.03.31.07.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 07:51:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KbmOtAnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piG5h-0000bB-Ua; Fri, 31 Mar 2023 10:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5c-0000a5-UZ
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 10:50:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5Z-0000be-1m
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 10:50:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h17so22680452wrt.8
 for <qemu-arm@nongnu.org>; Fri, 31 Mar 2023 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ob8zaLRhLK1pUzR/HANUMOjhD/K+he8dJVxHdozinP4=;
 b=KbmOtAnp8YkA81wg88UGSawrW/IEgo4NEx/o0ANveXBuH5zX+7VdrISCOSdrcictDL
 bClbIOPwajXZZv6JIo3JYGIkoOJNCb+02z1NZHiLokX0Ak1YPuk3IpXewww5i/OQJW5a
 xMO9dGYjFg2Ey7yKjOg1Rp39s3qO1B3lPRnQm4irGDOAiwcwkrIXBwTUr0UjsQpzXjLK
 FHpDsu39OJUrdxPXLy9x/ZORxxR3A/wKBCjP9qxxRPjDn1Upcr7aJ+Pj4xXLBzmwOi1t
 nc0gwQIy62Q7Ss5/gJkaPhJs9nIZIoT+hPlTedb9+apJstLGW0pptzQwXqhIVZ1g1Q0n
 DA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ob8zaLRhLK1pUzR/HANUMOjhD/K+he8dJVxHdozinP4=;
 b=2oFoGytFbAL7LdwUAQ9O9gnb0sapSEJVJsiviYCERqpXu7O5zhHC6KiMsXyQR2/diE
 s5u9hTqzYl1yv0lR7AMQVrxXRLdeRw7UtNNWTyRGN8KSp/UoN4HzYhAD5b1GaTkV36jY
 aZGfPQTSSr+1lyi20AhRJ4smfKVJ9eu0KaXtZfmwWTJfwWd03zjmOQyOAt8TXIEmgjjv
 KRXKGkWugBzFmNtUj8mov4jbsxCl6pL5VSlh9pcXMJsbCr1QUsGo/SIfXJjMR5UA/Kx1
 UWamPMLug9QDB+dmLr32/Kfec1Y+NkiObbXuTNyWQBMFcPgCNTFdUHAwJmHeJVTMNnrK
 uRnw==
X-Gm-Message-State: AAQBX9dutB3mRh5V5HPTQjGjy0my8B7xUTyZ/n7XKYyXkoRuuDupd7Kh
 llkcxTq0tOiWYDGV0/QiySmIWPlhUmIE0IqJqy8=
X-Received: by 2002:a5d:63c1:0:b0:2cf:e8d2:b550 with SMTP id
 c1-20020a5d63c1000000b002cfe8d2b550mr21365168wrw.14.1680274247651; 
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b002cfe685bfd6sm2339831wrv.108.2023.03.31.07.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Don't set ISV when reporting stage 1 faults
 in ESR_EL2
Date: Fri, 31 Mar 2023 15:50:44 +0100
Message-Id: <20230331145045.2584941-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331145045.2584941-1-peter.maydell@linaro.org>
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VsveTJUjOtWL

The syndrome value reported to ESR_EL2 should only contain the
detailed instruction syndrome information when the fault has been
caused by a stage 2 abort, not when the fault was a stage 1 abort
(i.e.  caused by execution at EL2).  We were getting this wrong and
reporting the detailed ISV information all the time.

Fix the bug by checking fi->stage2.  Add a TODO comment noting the
cases where we'll have to come back and revisit this when we
implement FEAT_LS64 and friends.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 1a61adb8a68..d5a89bc5141 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -32,8 +32,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     uint32_t syn;
 
     /*
-     * ISV is only set for data aborts routed to EL2 and
-     * never for stage-1 page table walks faulting on stage 2.
+     * ISV is only set for stage-2 data aborts routed to EL2 and
+     * never for stage-1 page table walks faulting on stage 2
+     * or for stage-1 faults.
      *
      * Furthermore, ISV is only set for certain kinds of load/stores.
      * If the template syndrome does not have ISV set, we should leave
@@ -42,8 +43,14 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      * See ARMv8 specs, D7-1974:
      * ISS encoding for an exception from a Data Abort, the
      * ISV field.
+     *
+     * TODO: FEAT_LS64/FEAT_LS64_V/FEAT_SL64_ACCDATA: Translation,
+     * Access Flag, and Permission faults caused by LD64B, ST64B,
+     * ST64BV, or ST64BV0 insns report syndrome info even for stage-1
+     * faults and regardless of the target EL.
      */
-    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || fi->s1ptw) {
+    if (!(template_syn & ARM_EL_ISV) || target_el != 2
+        || fi->s1ptw || !fi->stage2) {
         syn = syn_data_abort_no_iss(same_el, 0,
                                     fi->ea, 0, fi->s1ptw, is_write, fsc);
     } else {
-- 
2.34.1

