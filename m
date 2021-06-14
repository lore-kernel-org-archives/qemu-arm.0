Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2075334lff;
        Mon, 14 Jun 2021 08:30:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfMBcUiog7SjffIFRMNSVSFl9MTEvxWfN4wzsjxH9tUI21QxcM+TgvAMZVotre5HgSSfXN
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr15470207ejk.327.1623684640918;
        Mon, 14 Jun 2021 08:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684640; cv=none;
        d=google.com; s=arc-20160816;
        b=RmwfjR2nnql6b1MdhgtDq1K0NizgSo4lz6iltwhVkRJB/No29NTJEXTejfHBGl5LNC
         BZDCKqvD4c37+6/OlOvhl7uJLAfCIzsoWt3JceeOaa/sA7Ozv4rQ6iDFnYSpEUSCqbmx
         LuzoL3bvf3YWNTLUn8GMujKCXxgo+xGSRPo8/ihX9aRDYpOxDNskMOk8nR5KgDCmgSQ6
         NeiU3Xh35MQSXhDqLK2DiPWGaRfz/FaVSP7NQhgKWPdjytdVhYYH4hNdtkp/chstWfCI
         LGpC85WOzL4Q3TQcgGBG3ztpTkJzLRCEYTc6Copn/9uisa6lkpZg9ztQOK42dou8fiOf
         qD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GLjCJA1aqkfuAtjVDAHVb/JY5jEizK36+MJvk9xH9xo=;
        b=g5Ln3aBUjxRFf1mb72KauIOzgz2jkjiaWYZLjwHFd/dJmUaQaXGHauuUwFBkrEsxov
         pL4xWiePUStHVx2W65BGuJRUeBxoTo1T806vYtig7ZPInh0Ey5bkpJMnQXHHvNLCgDfg
         qSE4jip3aMqUZqNCWQNdKh/prCjmU+C3jZRJ7JqLR95aqEZJFmpEX3FPoIOvw4PgVoJn
         RMimBjFy1yvQH0jUTQek8W1JQkpb5FPj0GYs7IgRV2FohoAKNrTLn4vOkbRgVtDKzcaL
         NaH3TQ1tlGC3vf/VhYfuGrKI7DPlp65TUkoncDLxK0nqjr8eDtppYeLKq5ceozAEumWH
         5sqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sOHnibqL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si11733811ejo.404.2021.06.14.08.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sOHnibqL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoXv-0004ot-Ui
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEq-0001oU-6i
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:56 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEZ-0000T0-1y
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id l9so12340851wms.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLjCJA1aqkfuAtjVDAHVb/JY5jEizK36+MJvk9xH9xo=;
 b=sOHnibqLAtY0k+AaZOPcr56LH53hm/kKYM/IbNaxpF2sBeqyP/olbfO+Nl4SfMADIM
 kJwZw0eEpB53Ab2oy/5bod00E1rTVPncEIg9AmmDj3KP/djaMjK6xCk09oPMzSriAb8L
 CBKiN6+jeOqNwNCofAJAXcIOTnDifNqr2QchWM8oCTmCDXASxzsbWiBBG6poaNviWl/4
 Oh3V5LW0/YtnVRQaqqUndmsZBF0q9hwTkjYo0dLcKnezbXaPr1RlQLfGkrP+75ADh5D1
 DtcxE0ULQ0wFFX5N/fqx3Op/XwDe22Xs+v1T9ZRQ9tmcKV2Uh1ncoxy81yleNKwUgGT3
 qEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLjCJA1aqkfuAtjVDAHVb/JY5jEizK36+MJvk9xH9xo=;
 b=KOYmJZEOOhE8gzHRHnTlNk+Tw6PtpPHwvdgYdombOPOoJNGLKv+giKo+UWBwBRF0HS
 1ayJepfJixeb0g3KE5Zu33tURRallaYKHWgxU95MQncD7aeceRVEMG9/vOpOWdHF0exb
 NIsb2Lj4dqLIpenJOz/uw7dyhBvGbZB62jIa27a4bSnnpng3uLU+xWbQJU3FlKd5kwSX
 dJfualOURWixIZbvdPRXM/6H1rpNMV85FnI/tgbiOgw+Uc9hm3UJzLTLiJufa92bh6Mv
 IeAd6kzJLtggeauDlYeFUAMPUE1LUIARJDS4+/YgbmzQBa8bT2O/LURo5ET94Y5p0alf
 vsmQ==
X-Gm-Message-State: AOAM530lCV3Dadxy1zWMNNfJH0pUDwyOTvtFDehDGIXfQunovV6frzRd
 J7GQhgUQCJiX3j9LBGYU6MdBXd1us0QMSQ==
X-Received: by 2002:a05:600c:3b86:: with SMTP id
 n6mr17092888wms.50.1623683437698; 
 Mon, 14 Jun 2021 08:10:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 33/57] include/qemu/int128.h: Add function to create Int128
 from int64_t
Date: Mon, 14 Jun 2021 16:09:43 +0100
Message-Id: <20210614151007.4545-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YvVg7+NmuiqC

int128_make64() creates an Int128 from an unsigned 64 bit value; add
a function int128_makes64() creating an Int128 from a signed 64 bit
value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/int128.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 52fc2384211..64500385e37 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -11,6 +11,11 @@ static inline Int128 int128_make64(uint64_t a)
     return a;
 }
 
+static inline Int128 int128_makes64(int64_t a)
+{
+    return a;
+}
+
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
     return (__uint128_t)hi << 64 | lo;
@@ -167,6 +172,11 @@ static inline Int128 int128_make64(uint64_t a)
     return (Int128) { a, 0 };
 }
 
+static inline Int128 int128_makes64(int64_t a)
+{
+    return (Int128) { a, a >> 63 };
+}
+
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
     return (Int128) { lo, hi };
-- 
2.20.1

