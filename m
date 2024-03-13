Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2654992ejc;
        Wed, 13 Mar 2024 11:50:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoqzbVqm8D+8M+gz8UYGJJ5Z3wmAIs3gu+5o9iTFlmf2f1ai+xhjFBeKqGOoqjgec5jHT4lBSErPktyFlJ8bLZQvLVC85g
X-Google-Smtp-Source: AGHT+IG/w7Hpw0NTouleA+WJl5LhVbRw6WOSsBlbxcCi8r+AbmvDBbD9z3LVJ5ihrpBYgzyp9cTI
X-Received: by 2002:a05:620a:4008:b0:788:723d:593b with SMTP id h8-20020a05620a400800b00788723d593bmr793790qko.75.1710355849174;
        Wed, 13 Mar 2024 11:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710355849; cv=none;
        d=google.com; s=arc-20160816;
        b=HNRi5sA/LvNvPe/9BmwJhnCc5khX5U2eBI6pe92FkuH7hS/Ms1NVJccRfvChbPvoCO
         JQSsVyt0axI6BXbn3eSLp6KVfbu7/dBL8iQ7pE9pk7Kjm/YUrGSgami+Lp+um39FELyr
         b+lwUn4ypTXx1PvFJXKN3+OuMsz1UHWCPpNYLe13ZAb+1EDqLN0FWVhFkfjRME6jTOCJ
         uTrmQgNf9TBcgagHUftI6ksl1jl6c2/xCxOJdXA7hTMoT5NdEiv89qJAojMfkliwBIYz
         ikc5nqeWUoOSsad3zeAlYTa3rmYL3Nipm/so/qLqwdr58pEpTm3/5v9rb2xSgRLmN11Q
         +Fhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=X17Ya2bvpA+4v4TFaE60WLvpjjO6zpu/JP88j5/yX/w=;
        fh=+RDUvGSNesoarEotIkRMk9W28RCl/8bL3qe3gsCDF+8=;
        b=y7Fh0+MV66t3Q0KJtbos/hIY+iQVYQsJ3flHeLwOVAdmt6i99Yo+i8LP6q7c56l+GC
         MbA1LtjStngInIPHtFACxFubfGBum78uPnMKjolnvoat7IxhDgHxboyEVl7bZJy1hpkw
         +ccyQfC673ECE7cvdks75XUt/d71P6/vD3s/N+krFdneNjmCHZNbk3lh7Sl3rgEehgDK
         MqPeXd6tIacHeTSwa4RTXipnVV+0scEp5v/UU0QTwn9maUdXIkGAGlVCq6FInZw4qQOs
         rTpCUPWf80atce0xwjQSfWyMcfPGtVsQt7DJkPM9mFqqFZnYEbkOy3yEbZwDvwpP3nP0
         HLtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f9EtNz/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24-20020ae9e218000000b00787ccc153b9si10035012qkc.192.2024.03.13.11.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 11:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f9EtNz/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkTgS-0001cP-Ga; Wed, 13 Mar 2024 14:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkTgQ-0001bc-Ai
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 14:50:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkTgO-0004FF-JO
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 14:50:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-413eb7cf7dfso1645685e9.0
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710355831; x=1710960631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X17Ya2bvpA+4v4TFaE60WLvpjjO6zpu/JP88j5/yX/w=;
 b=f9EtNz/ZHx+4BCXzeEHkXEpAhnaN8ZnZyFxpL5FjMAdnfsbQ/1Of/RbL9xShaJUS5F
 yULqqs6v5sOFcH77Ogc+/+BcentQA1brFuEVqO0jZSaI/w8BWyiNaePKU6m+6lyC+4SG
 eBUJlmYMULvB5pCyz/ZXFFOnWBOpT+yGUZqMiR97+gMTTYUpsmxgxgavA+bixsaOhJEZ
 6c+xmKvmEQj8NFBWccqKjFfWjAN5d+WU8VBrg6khXE2W5ZCRIGRVKf96Z4nxiMiWHRfG
 kWtMAJBh8s60PS/HxeeN/NQhV/2UQil+32yGgpCrq7U3twnBCvqxrubLvuRQWmJeIt6z
 Cb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710355831; x=1710960631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X17Ya2bvpA+4v4TFaE60WLvpjjO6zpu/JP88j5/yX/w=;
 b=GXt6+bh8Pgsp0ySlQ7/AUp9gcY0eTXdNXdv9qR4dSurRWy0jowFV5n3K6lvD8Q+i1O
 LmWGM5H2W1iQc5vJ0QSPH5Qmu1W2H6R54GRFbGZHQV/c3kG78EfU/oQlNiMkS/a4cfTa
 KfXsdfb25VsizLBp1WPz9WBD/cK2Pl42PlAuMS/7LNLswItam4ArtVI/i1HRR1ygU4cB
 MjBuZCTdxtSztgoJoGwZltrzxZ5wTqz3LnGpc6JwPgfWkHRmSSSjv3D6FkU6xyCfQhec
 lyJyOe1G6QDQJRZlyvM5WtCwUHZbb8jO5FABh/CpSBjtjbLXeqYlnzx1pnAyz43xNZcX
 6i7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYS1JJ1JjP200CNLwBi3PvRBRhIoIxOR/mfD5MpiRQKSuH8HdOQD0xcySz0bqBknSchCI+NMQw/IIsVXRdf5k5k5Uh
X-Gm-Message-State: AOJu0YzxYv/MNYzHnxP7IzbcdPpH1jWk7sDnosD674LHQrwAsRxwl60F
 yJc0PIpqc10pO4HA7riZ67M8spBG5Gj+KAdOQzB4TGoXSTSOWIvXPKtvnJ5V7jM=
X-Received: by 2002:a05:600c:1910:b0:413:1ee4:692e with SMTP id
 j16-20020a05600c191000b004131ee4692emr631218wmq.9.1710355831312; 
 Wed, 13 Mar 2024 11:50:31 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 fj14-20020a05600c0c8e00b00413385ec7e6sm3088148wmb.47.2024.03.13.11.50.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Mar 2024 11:50:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Eric Auger <eric.auger@redhat.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 3/4] qtest/libqos: Un-inline size_to_prdtl()
Date: Wed, 13 Mar 2024 19:49:53 +0100
Message-ID: <20240313184954.42513-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240313184954.42513-1-philmd@linaro.org>
References: <20240313184954.42513-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Mb/Ll/wdVeWh

See previous commit and commit 9de9fa5cf2 ("Avoid using inlined
functions with external linkage") for rationale.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/libqos/ahci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index a2c94c6e06..135b23ffd9 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -662,7 +662,7 @@ unsigned ahci_pick_cmd(AHCIQState *ahci, uint8_t port)
     g_assert_not_reached();
 }
 
-inline unsigned size_to_prdtl(unsigned bytes, unsigned bytes_per_prd)
+unsigned size_to_prdtl(unsigned bytes, unsigned bytes_per_prd)
 {
     /* Each PRD can describe up to 4MiB */
     g_assert_cmphex(bytes_per_prd, <=, 4096 * 1024);
-- 
2.41.0

