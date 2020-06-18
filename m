Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1259075lfm;
        Wed, 17 Jun 2020 21:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7SIx2rC3oTFgTGL9/C72WOQhGghlxUdzSz5q/IADDD+s8D7IOUVnYjD+CWgmfnABgI57Q
X-Received: by 2002:a25:384c:: with SMTP id f73mr3465543yba.272.1592454423922;
        Wed, 17 Jun 2020 21:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454423; cv=none;
        d=google.com; s=arc-20160816;
        b=D5oEoOwb8UGtAWJ7X9cZcKIjhFzR02bLfe5sOw/SmuneV5+ImuOoX8Bug430GvAq/2
         2ly9o3pqqKr67APMLhWR/HqgsNLdXEc9rLwKMgQqx+zhZojOoSxEbRkOuRw/vJO86mW/
         js8OSCElwA4XacJkoxTi/eZapNn3YxFfzC7GpVfuafakdZtjCZ9WDPSo6+cTEJIrkbiX
         FCiQRvs1XzXr1V5nlKn8nnraBz9UFrZD2c5EgsdN3Xs1wsiy0d75HlSxwi4QcQfe6MAI
         pVikRV4LjFCeAxr2vi8DxZEmRcwAbfsU6cyOSlg6e5p8XxECAAZIA7MfMHuaOa9jO+Vc
         bVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SYhTH7/NoKSZMnkGd9mMb4nrqyxVnLFVoR2e/Dwfxy0=;
        b=lwZTxnd0ODKvF+VCAD4Y7Si5pY8XMJcogIbbcIB+4lxe/pXMyL/dv0wh4JK2ulAK9s
         nuQWeFU38yQazfMPkYfkvPHAJN+ZuHYbpHUFFp9XErpEvjHwLHlR6jdFFQlYI6kH+x7V
         gilsH7w9XKqZn6mPQme+pHpo85LB9PVJ+u3aZ1dikggo3UxaOxDid0jW4EPaFCN8ruQ0
         75Tgl9TDxWyZX68EF+OFXIPRNagqd8HASv/2I6dUY/cpH7PdfI6EaL3OadQTCXZAi9ru
         72hqeKQXEtpBHbY50mk5r2mQhMUQVbgPXS+AeRpGjsSmkEYDg1qkkB1bq0R9UW2M2QpC
         9J/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bdRYW64H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x138si1493486ybg.413.2020.06.17.21.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bdRYW64H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlm8l-0001ir-6d
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8b-0001g9-Uy
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:53 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8Y-0002FR-MW
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:53 -0400
Received: by mail-pf1-x442.google.com with SMTP id x207so2197480pfc.5
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYhTH7/NoKSZMnkGd9mMb4nrqyxVnLFVoR2e/Dwfxy0=;
 b=bdRYW64Hb395HdicS6bYyY+bGfI6LT6K3jr+lkYBl2rloASfODwrF3o3SWoqOxc6EX
 QCg/AejFxoP0UL9YMTiue9UZ4k/xdnpjW4fbOt8UjF5MMJa32QwO1vwcXVZaOKEmAv9a
 P2Glkzr559TE86VRoGblkBggXGYKVNTCeI4livOr9WrAHpSQ1c/er0xmJfy6ErzngjhD
 yZfJkAxBDaIIJ+koziHNd3u5pNBeXLKFL79sDxZfSQ3qm2gKBPgd2pHKAdr0yv0TWqpY
 ny7yXo+kyqL6+yaZoYQOrPCJpyqx0KUpQVZehEnHqwkMXdUj5d1bR26CRMWj+LI8++fI
 Hheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYhTH7/NoKSZMnkGd9mMb4nrqyxVnLFVoR2e/Dwfxy0=;
 b=gG3+4Pr+ucpPp2n29FCsZqsgOPFgDYjjVA8kJCk7l172qoenJ4vl7o862a9sMdY4QF
 /5zmGjbAUNhs6/E6+/kN7gWBt3BmX6AtjxP8D8J7Z0rJPVRNrLPar2l7gZ+d5BOCsneY
 t2CFhUTCYxLe2wdFuQdDHWYzVrTyIitZl7CBuy7lMtw9TrKSR7nqZCT6Z0nJMaD+SO13
 h5lK3Sn8Efjj9loVjfBjfwOnFL7U0Yf21bHGImIvl9Ff2xqmpo1K8/wRmy95myQKxyxo
 z/Waye+WR9PGPBtjh3+l80+bq4sudRawzSdo43geeomRL5aa1VIFZpPTvAU+pjgmXVhH
 U5qg==
X-Gm-Message-State: AOAM530IDwuoW33drcJszheOnJ+XAJQCWmUcqShcphijxq4Clw7fQMFL
 Dp3s9yzgx62nQ7eqXIdPuv75Lg==
X-Received: by 2002:a62:7dd1:: with SMTP id y200mr1857673pfc.184.1592454409462; 
 Wed, 17 Jun 2020 21:26:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o16sm1162035pgg.57.2020.06.17.21.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:26:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 002/100] qemu/int128: Add int128_lshift
Date: Wed, 17 Jun 2020 21:25:06 -0700
Message-Id: <20200618042644.1685561-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5AjxCQQ+Nq98

Add left-shift to match the existing right-shift.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/int128.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 5c9890db8b..76ea405922 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -63,6 +63,11 @@ static inline Int128 int128_rshift(Int128 a, int n)
     return a >> n;
 }
 
+static inline Int128 int128_lshift(Int128 a, int n)
+{
+    return a << n;
+}
+
 static inline Int128 int128_add(Int128 a, Int128 b)
 {
     return a + b;
@@ -217,6 +222,17 @@ static inline Int128 int128_rshift(Int128 a, int n)
     }
 }
 
+static inline Int128 int128_lshift(Int128 a, int n)
+{
+    uint64_t l = a.lo << (n & 63);
+    if (n >= 64) {
+        return int128_make128(0, l);
+    } else if (n > 0) {
+        return int128_make128(l, (a.hi << n) | (a.lo >> (64 - n)));
+    }
+    return a;
+}
+
 static inline Int128 int128_add(Int128 a, Int128 b)
 {
     uint64_t lo = a.lo + b.lo;
-- 
2.25.1

