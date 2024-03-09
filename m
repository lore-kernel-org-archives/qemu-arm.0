Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp369882ejc;
        Sat, 9 Mar 2024 11:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYm+WQuew5hO1TrkdROgMG1ky8YEPY0XIxu1eh7RECOuthesCMpHOCRPsw8g8WM2MtqZfkR/3IqDhEMbjk1bdeSYvx9mCd
X-Google-Smtp-Source: AGHT+IG6e/xuii+IMa/4KsUlYNgc5UJNcwEG+r2QyJ3yLsmlsLdOzyTJVKraenfXpiulDU3tTBuj
X-Received: by 2002:a05:620a:5236:b0:788:2175:db7e with SMTP id dc54-20020a05620a523600b007882175db7emr2913671qkb.37.1710012573415;
        Sat, 09 Mar 2024 11:29:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012573; cv=none;
        d=google.com; s=arc-20160816;
        b=W/0BzzTTpRSjVDZd3UDcdXSrhOg7EJw5DthT4UGVS/Op2+BHWkLJffSpGcWX3eifI5
         eZpamDXjzyr317BKZnPHs6E7UZkgGMWqKcQNZOUqbQCsweRAPYnPEuTN2CSVf/GKMLgY
         0Bh6JRAXVajVskR88/YYvWS3xOeAf4PLN13aknnIoX/VMRlw63gGHWZfU/Zq2mcIxl/D
         yxGDBf8wTuX1AOdIuBqt25WyJLJlVM+whc4K2ikajAqWvrznSqYg/5v1m28MC+3BpCG+
         QPburC26/yB5Lz3gQtcPL3p6B96NCh1cU7ixLxjT14s9WBOVEmZLq75jARqdeSYi9WJ9
         ybuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i2x/6JhOMSh1e4AFrzigsCMOr4MSgOhrpELj7cZb/3o=;
        fh=1eUHcBrTaGxIkbrS863LCz4Vm37H2cKTulPuPHgk1Hc=;
        b=W36ksm4kr6RcL8iDMxvMQkIo1Ga7MYb0463z5Mw+PP+KyfN0ii30rnqHZrQEUckey3
         xbLuhrXzFIqADRoZi9fkYSyLCFzxWI1UhSgi/01u8UEmy8/EFlR5Cpw1cDMP0u5EuPlu
         JXP2BzcuMFcDdnolYbwKlEpzvH4gY1LuBRUL2kFFAed62YTpFjCNVI6UAf0CEQzfsGoE
         yvxo+W0O0qK8tSeU5Lip+MyXpE7/GSPrky7c9gHSn/Wjh/Tcfpgn/paktvcUT1vYkRCD
         vVYkgYeVEy5bEYEc+Wtu6nSAzDtWYNKWtNQrxnAPfBhUx652RC/fAyOz8g+NSfQY3RE2
         fjWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o71V9S/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020a05620a0a0a00b0078824a53a6asi2066875qka.341.2024.03.09.11.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:29:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o71V9S/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2Lc-00006V-LL; Sat, 09 Mar 2024 14:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2KA-0007I5-Sr
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:25:43 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2K7-0003LW-9m
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:25:38 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5682e8f21a7so2339923a12.3
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012333; x=1710617133; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2x/6JhOMSh1e4AFrzigsCMOr4MSgOhrpELj7cZb/3o=;
 b=o71V9S/tFWCUUoD2gRbRDJumvGbsCbOE4vR3j3PnNWuG7uAa3wBxq5Iir8vUgJ+dRe
 8Oe6M9/K1sxIexy3Io77iYFRO+mX1MWcPCxReK3boy/3hdkCJEF+FNj7ve1AydeTsHyE
 sKGnBC/TdM7VgsG/Yg5O31Jd4SLvEpM9ZhTV017X1J2smOatt2Xws0GWPZ9AdbG0552b
 y6dIK5x3ut+shu+w/W3B7qIzH07Wca45bwkWMam0nTs9+r/3q6X6TxlGEQbOFAsW5Y+D
 NbhjvgjU9mguO/Q0MPe9daryfmemZDruILxgte0WyNzOAtqJZFpsVvAPNQjZsmAG8yAi
 Yg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012333; x=1710617133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2x/6JhOMSh1e4AFrzigsCMOr4MSgOhrpELj7cZb/3o=;
 b=or+6D2jbOINoxNgPViLKdAw/zyKmdyf/q+PHXLmFAjoWk+DZWq4oecb6sgp7hzws0Z
 wEtUfmvWCAYc66l/5MrTQFUkqyjNjzytK/X8DfsTNLyCoPtsBUiwjjKof54MMQRcWPan
 2Qf9x43DBfdsOWHO0M5+1zlDY/ZPG4dIdHkBrsz25sECpzc3gJ2x/cbuNLMuHstfDdKb
 VxdEHj4fkR5D+RjllumSFNhLpU0JLz/IDL7fuSYo9VVp/tUwdmT+G2mP5IjNm8aAaOAY
 zgj2GHjSNYEXS4j2kqt2wgma9SssGEowLvvU6702zNM9OT99pWUs9hNqwU42W8yt5tDr
 mvZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4sqGaUJncSpcZq94oFOMjuJ7lEESzlQI4XtVfs9qkjr58crdQ27Qkkj/DJfOVUXK5N2KqvSp/PZ9fh4mkpU+3F9FO
X-Gm-Message-State: AOJu0Yxd5lR7QUxZNCTERuFtUaYDrVe4CewvE6gaTRGRGt8DmT42oOXF
 bs2Fv2hRifeErMtnUm6WjjG58EJZeHhPTHRZQGhkrD47SC95wzOI/9LSjsCx+F4=
X-Received: by 2002:a17:907:a0cc:b0:a45:f6fa:8c20 with SMTP id
 hw12-20020a170907a0cc00b00a45f6fa8c20mr1533733ejc.14.1710012333792; 
 Sat, 09 Mar 2024 11:25:33 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a1709067cd000b00a45f63d2959sm1165361ejp.210.2024.03.09.11.25.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:25:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 33/43] tests/unit/test-smp-parse: Drop the unsupported "dies=1"
 case
Date: Sat,  9 Mar 2024 20:22:00 +0100
Message-ID: <20240309192213.23420-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Uutk77zKdWsh

From: Zhao Liu <zhao1.liu@intel.com>

Unsupported "parameter=1" SMP configurations is marked as deprecated,
so drop the related test case.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240308160148.3130837-5-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-smp-parse.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 24972666a7..1874bea086 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -607,11 +607,6 @@ static void test_generic_valid(const void *opaque)
         unsupported_params_init(mc, &data);
 
         smp_parse_test(ms, &data, true);
-
-        /* Unsupported parameters can be provided with their values as 1 */
-        data.config.has_dies = true;
-        data.config.dies = 1;
-        smp_parse_test(ms, &data, true);
     }
 
     object_unref(obj);
-- 
2.41.0

