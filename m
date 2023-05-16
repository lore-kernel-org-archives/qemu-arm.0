Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp661198ejq;
        Tue, 16 May 2023 13:35:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qFE8D3thWGNxi4sIcuzhJfgmiuZ9Ltmo7eCa9u6NOjqbMds0blatKeuXflkzVqbAGzJxh
X-Received: by 2002:a05:6214:258f:b0:5f1:6bee:f58f with SMTP id fq15-20020a056214258f00b005f16beef58fmr65387244qvb.26.1684269346797;
        Tue, 16 May 2023 13:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684269346; cv=none;
        d=google.com; s=arc-20160816;
        b=dHeexnUmt78WIa0xWDD4pBVjUzWOSLnqeCiPBCKj/sgX/XZGn1EMlJQxt1Ir0Sp30f
         a/C7lbF0fVj941WdnvOPxifUu0ANvqtUwaw17MoTsMmGXndcOHf2Y6Sh9hWETrm9Uxgi
         +mUIo7hUOBdpbOKf+arAeME4DmYXAL18IzJNbxGVZaj1oJgy9lAEiRnKRygR6T+e1FvW
         vOwXQ/vTTm7XLchNVqvpldK0fQHQsyeRdB6YOY/oN1KgyL72Rc8zC0NOG/2iMK+Yowmp
         PkWEITJZ8dXmBpOAy6L0nl4cD0vMOxA2A6d4ChiGkVxsREVoEldbjeMwejw0lEQQPt3K
         ukBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=rBTwWhE6PBDQa6im+pyD3394JhJZUNBDisIOMyZZvSs=;
        b=LdyLdAuW7P6BcmwCET7faD8CUrnITLi+TorWxSjdZgtbhdSm74fUquO/MZ7oTYjiZx
         XI79G7tgXm5/zzPKZx3+Wwe+CeLEx1qXJjB3yXclJBv0BRC2zvuqmeFEBL1qLzMHOFyV
         7mtz3c/T9HiXE/3eKaoABeLk8smxPh1b6BXMoI4pNk6VqVdOuwjd0+3WeDShxdJ31zUc
         po1/J1wGttfJMKJDkcZHjz3Z/lx2IEeDzv24sn8aI/2rGFv48RL0ti9SbWs9Hw0HxF8m
         d3dcl4vVftSS8BwB1siLMfEYMN4vfRSO2ZWhDnoSKtpc938eUjt7tk5SqBSpjEQKiOvn
         8pxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=yCepxvDs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19-20020ac85fd3000000b003eaa4fff6ebsi11942331qta.26.2023.05.16.13.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 13:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=yCepxvDs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pz1Mt-000663-9C; Tue, 16 May 2023 16:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3suhjZAgKCj0rlnrsZeZfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--smostafa.bounces.google.com>)
 id 1pz1Mr-00065V-Ql
 for qemu-devel@nongnu.org; Tue, 16 May 2023 16:33:57 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3suhjZAgKCj0rlnrsZeZfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--smostafa.bounces.google.com>)
 id 1pz1Mq-0006fm-9q
 for qemu-devel@nongnu.org; Tue, 16 May 2023 16:33:57 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 5b1f17b1804b1-3f41ce0a69fso60415e9.1
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684269234; x=1686861234;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=rBTwWhE6PBDQa6im+pyD3394JhJZUNBDisIOMyZZvSs=;
 b=yCepxvDstnpphWVHBeMBVvp65vlPPnhrE5KPaeq0WMpnzxqQBc7sr+IrRRebcUfrIe
 Rwo6UbAL+fw0k/4ei7r0PTNVuMfW5DilqQEroQZ+jFUxYRNklAtLq/KDwJIb3QGTAgrK
 n+eZKbytXxmBWRvKUk5kdjTVjv9Q52FQ+de1uHK1c8mTvC2r50L6Xi4JWLiy0evBsbwC
 HhIwDQdQkn5clFPxOSAxM15WJdszezd0zUr9+XnvjzNCPwuw19TpcpmvFzTeTZZKuiE6
 D7xKh5JnP+SV/B29FA+AhtBd6SSKMQxWcViaZLWWjXwM/Ah5JuB348EfR8vuRvAaV73j
 MJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684269234; x=1686861234;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rBTwWhE6PBDQa6im+pyD3394JhJZUNBDisIOMyZZvSs=;
 b=MFUJ0U6Fzfmn6VQjXRTXXpN/K46AGTRiJmhdnHDHvOG1Mi1e4qXr7RP7Mp1NLU+UsV
 k91m+DTQYpQ/cj788tjPCKyfnYTVLDwPJp6RGQ+XgaWKpofhjQcW5jTFVxGvfvaMyQI6
 TCI2hVpGeMf1hqmKfsM0VCgQNfLz8YVDs8Db+LCohLbjfXrBBrrubrE16yz5Gh5BB8ds
 THSJU64fqS6UGL2Db/uvrUsOfHvkbRmfgCPZq8y6QJhSVH3O20wJgKN6Z7M6doriNO0r
 lntf3TTQYHfzvYPnubxOZAbROlPU6cbBGAOFWjMAdnqLW0Cv5B7qaYhsWcIxouuuisrN
 hhHw==
X-Gm-Message-State: AC+VfDwQB7HKsLQE+QyF84vA+he+gpfEkk6UWFhLEvtnQJ234gUKvOqK
 VOc4Mm4hotLN4dtsjpOf2Z7Xh/UJ3AMTjf+dsWCSagwz/hbpmrcMWgDlRHvoHemHFKoJFwNV+WC
 US7W5OuogoqMj4HPNO4VDiZhJpBZnNNt442iHvsvf276jh6dHU8pgJipagW8gY1jHcw==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a1c:7c10:0:b0:3f4:2610:5cb7 with SMTP id
 x16-20020a1c7c10000000b003f426105cb7mr5541663wmc.6.1684269234441; Tue, 16 May
 2023 13:33:54 -0700 (PDT)
Date: Tue, 16 May 2023 20:33:08 +0000
In-Reply-To: <20230516203327.2051088-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230516203327.2051088-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230516203327.2051088-2-smostafa@google.com>
Subject: [PATCH v4 01/10] hw/arm/smmuv3: Add missing fields for IDR0
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3suhjZAgKCj0rlnrsZeZfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: su1UkyNAMkKx

In preparation for adding stage-2 support.
Add IDR0 fields related to stage-2.

VMID16: 16-bit VMID supported.
S2P: Stage-2 translation supported.

They are described in 6.3.1 SMMU_IDR0.

No functional change intended.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
Changes in V2:
- Collected Reviewed-by tags.
---
 hw/arm/smmuv3-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index e8f0ebf25e..183d5ac8dc 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -34,10 +34,12 @@ typedef enum SMMUTranslationStatus {
 /* MMIO Registers */
 
 REG32(IDR0,                0x0)
+    FIELD(IDR0, S2P,         0 , 1)
     FIELD(IDR0, S1P,         1 , 1)
     FIELD(IDR0, TTF,         2 , 2)
     FIELD(IDR0, COHACC,      4 , 1)
     FIELD(IDR0, ASID16,      12, 1)
+    FIELD(IDR0, VMID16,      18, 1)
     FIELD(IDR0, TTENDIAN,    21, 2)
     FIELD(IDR0, STALL_MODEL, 24, 2)
     FIELD(IDR0, TERM_MODEL,  26, 1)
-- 
2.40.1.606.ga4b1b128d6-goog

