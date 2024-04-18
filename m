Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1806987ejd;
        Thu, 18 Apr 2024 08:22:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVH4JUWWaGlgu0OpP+PmjWsU4bAJQtgqTDkGfLITVPzOfI/P7aOCtE13sJjZLTnQmDwlS2Pk3D173p2hfJtcgSQBvYJGjyy
X-Google-Smtp-Source: AGHT+IEr7eBuQmV+5nhnWHIqHtdvt8T3euDvgFWOrjSsuJsij+6jt1Kjd8UDAWE3xiGGY52H4/De
X-Received: by 2002:ac8:7ee7:0:b0:437:9638:40b4 with SMTP id r7-20020ac87ee7000000b00437963840b4mr2363314qtc.47.1713453730914;
        Thu, 18 Apr 2024 08:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713453730; cv=none;
        d=google.com; s=arc-20160816;
        b=gPseZv05iIcVJCySZl+YTxKwWDLSa00LQFft54rAgQ3KJRIMkO21VmLc2oqqiGZHPV
         Ofzjz8PfqTshbIYIzVzt7oPhm+XChPlZVpRzVQ24oE/VkCbW67cSWOFPPnKPGNmSnJBw
         cOvS4H3Jzp+QIyoAjKmfbGIr51KA47ztYgBIofWucRQ/41toS7GHIF1tOAD5qrDJiX0D
         O8rRstZsxKPTOhBJ5qPQhLUNJm6BA/YBfxG5wGvUmUs+PPyTfxX+FpH+yEJZFXWtMnYD
         OLPnrVV83wc6RC2X43n939hWRj0O9qp47/KDs9WjSege4A7uHqeAbrVCKow/KMj3Qvfu
         e5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HR4H5Zi29P/KVcxukA597bVylKrZeVE9mrUkxAza3G0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=PwO7mjNeFlPvXqCos3n+v2ap46OIG/Dn4+bYeu/iYwfQb5AAfD2GFBM0Zgn2mfw0GC
         DBE6YRDsVGma6bkNAulN/ehMItVBHHEcT0FLJ2Hgcks6XTklwbTpg/Fk8K3jyoO8rlAK
         +Fq7PwB611IZzcKCZ7G73DDuJ5fOwJ1YE1o0ROFLWABr0Yx5toWeFNcXiJOQLX3hDh9/
         hmC7EsqgZ+w9/yWzVBpvCwEOqUZh6gBzhzPFnoj/MzuaYFk19/YNc1rD2jN8WevbkEQA
         2eNK7JP+bZbML2LL22oqo2EigyGQ2+4fUrfwxmczWjreULTq9xb7DZRdDnPSDaRsqQf0
         sU7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uw1IcSpd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hg23-20020a05622a611700b00436e0ec2559si1626222qtb.468.2024.04.18.08.22.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Apr 2024 08:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uw1IcSpd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxTYv-0003JS-UE; Thu, 18 Apr 2024 11:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxTYm-0003Gq-8K
 for qemu-arm@nongnu.org; Thu, 18 Apr 2024 11:20:24 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxTYg-0004V7-Qv
 for qemu-arm@nongnu.org; Thu, 18 Apr 2024 11:20:23 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so12278611fa.3
 for <qemu-arm@nongnu.org>; Thu, 18 Apr 2024 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713453607; x=1714058407; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HR4H5Zi29P/KVcxukA597bVylKrZeVE9mrUkxAza3G0=;
 b=Uw1IcSpd38GmcAMGiHnEgiq51DsFb1zACQ64rvtGxrHxvCOLzVp0Q3Zrqs/xsUdh7V
 u+EfBQEXRZOU6Wg5ByIhDm9lPewZYy4ls35z/1ux1AGNNBu8bNV8do7euKDGE8q89cu5
 f03IMKn1WNb+YgpkZaxw7FGnIXjbCfYP5MVnLCaDAbR6XYmQAZCksurHlb1cP9AwRiL3
 IgbJ1Wf1jb+DIAjlryxkPHYUt2FoyRIxp4q+ClTVpZAQQ7mK8H8c5xOHDurFgN8dNVrR
 WJWOFy1fprfeap/PbchS3XcVlycsRvUYza1dvfwwEf/agk/Pa+6s4fbfNVbVTaMV8MGs
 hx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713453607; x=1714058407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HR4H5Zi29P/KVcxukA597bVylKrZeVE9mrUkxAza3G0=;
 b=I3pSIHc65GYGEL/+LJ0Eayt32eFcKM8HqFpnOWFu27bJgCw2iagbKhxd699BcQ6AGC
 SlImKTPczkzUgKtVDToV4ZnRKGpN3FwtBKjZ9/APW2eXPT4BD7I9/nZBtG4IoQPH9CO9
 +HLeEk6z6Qpxt5catYJgZ/SLPV4ozeR8WgthbqH7T2+GzPAkf17lJ805Fruep8FqBChH
 lBnZceOjr7woScjr9ZyP9+IK/XSSKpkAy/lQaDgRxzk/uMm0JoHU6sUwh//jiNkRVozz
 aOIdZnCC6yfWXdCumNEmxrRrSbEC+hYQci2n5uGqWBzYwnWrYcK2imxHnJNu7E3qkht7
 8qww==
X-Gm-Message-State: AOJu0YywTkGu+++TifU2c3hhEzGCNqOBUubDAHXKbJGk0B3c7LvBg8F1
 4BBylnnKwLRlrqXwXBQY2bTGQGzXyiJW2nNYb8Na/zHGXwuPCaSxkKXvr8ACbpE4mWfPxlQ4szk
 a
X-Received: by 2002:a2e:9296:0:b0:2da:8fd4:fb1e with SMTP id
 d22-20020a2e9296000000b002da8fd4fb1emr1973807ljh.21.1713453606575; 
 Thu, 18 Apr 2024 08:20:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b004162d06768bsm6886839wmo.21.2024.04.18.08.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 08:20:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/arm: Enable FEAT_CSV2_3 for -cpu max
Date: Thu, 18 Apr 2024 16:20:01 +0100
Message-Id: <20240418152004.2106516-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418152004.2106516-1-peter.maydell@linaro.org>
References: <20240418152004.2106516-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZeT+SJUtO919

FEAT_CSV2_3 adds a mechanism to identify if hardware cannot disclose
information about whether branch targets and branch history trained
in one hardware described context can control speculative execution
in a different hardware context.

There is no branch prediction in TCG, so we don't need to do anything
to be compliant with this.  Upadte the '-cpu max' ID registers to
advertise the feature.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 9388c7dd553..958c69f3799 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -31,6 +31,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV2_3 (Cache speculation variant 2, version 3)
 - FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 9f7a9f3d2cc..4445c5a212b 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1159,7 +1159,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 3);      /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
@@ -1174,7 +1174,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
-- 
2.34.1

