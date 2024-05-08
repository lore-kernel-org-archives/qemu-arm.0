Received: by 2002:a17:907:a184:b0:a52:4db9:938b with SMTP id om4csp567902ejc;
        Wed, 8 May 2024 07:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGd1HkoNwHSHhz3PXQvanrS7wMzkGZc+oTgK51FT2LuG1MP2Z9A1tO3vYEdScqNyXnuzcnDVWoTotrKigAysE45e8dtELh
X-Google-Smtp-Source: AGHT+IEwe3AudwVwXLq0A74f2bLA/ZLg+5wF4BKPHwOiqMu1uhjJQ9ZPPVBOX/Ce8TkVjcZaehW8
X-Received: by 2002:a05:620a:290b:b0:78e:e8ae:c15d with SMTP id af79cd13be357-792b287c9ffmr339829285a.63.1715178929960;
        Wed, 08 May 2024 07:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715178929; cv=none;
        d=google.com; s=arc-20160816;
        b=fYf66vQocgWdeR6iru0R3yN4U004IwxPV4LHHAvIibVfw22lnSJ8diubD4pFAC2sfD
         JhU/P9NcVSmibEEwnh7Tmtd31KrGuuoDgmhm/I3Eu/F4Gs4g9q88+3A9QStDjFOff/pV
         WQiy4D/jW1MHN8wJ0QoI53bc+4T6piXZkOsUxuO+8bQ5tynb5PXgsKBw7HOvC5xeUbQ1
         a8xE/bOZpAY1nFwMLdQh0PldofwooGvwCd0P6tMM0JFm7S9SVLH39tLWVjiMe5wdATNl
         U1qrIG8XCjM5aPFAN5MHgBzQ1bqwlETLMB0fHmx0KHj6R26utG0Fe66UcZQqYsdjlzHo
         MBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Znvm/tKg0F+01QfyX6rQqjcFA81lmYWx+WoExy2PfEY=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=MTwgt12+Nqzgq5hSHtNsy0rKAZNs6GcAxUaooDpG45q7f3tLTHXaGfPuI/zLZWoFsn
         ptU5Afl30P20cjFYbb8KrWwT8I6WM84WLuOmFalnPwAYjTxWe1Dr/kOpBp/xVp8A2zc/
         5u4raNOvt2mgZRR7OIZtgdOgWy561ui9CZhW2q//4OkBekwahIU4T3mCPOX8YnoGZeAO
         9T1pV0U76EU369NskeVKK3l+L/cv5KOeefKEx677mCS8MKbj3ihiI6N81AvYp3xJLmI/
         GP9m6ZuyVreNBocmSELbj/4ogP8rbfuM1eNpoJHW0fPu5S97XkagX214WORzR7BQ4lQD
         pHfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2SQ8HD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow29-20020a05620a821d00b0079064bf0de8si13161999qkn.585.2024.05.08.07.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2024 07:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2SQ8HD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4iO9-0002hH-Ti; Wed, 08 May 2024 10:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s4iO8-0002ej-0x
 for qemu-arm@nongnu.org; Wed, 08 May 2024 10:35:20 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s4iO5-0004g4-SU
 for qemu-arm@nongnu.org; Wed, 08 May 2024 10:35:19 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51f71e4970bso5251064e87.2
 for <qemu-arm@nongnu.org>; Wed, 08 May 2024 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715178916; x=1715783716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Znvm/tKg0F+01QfyX6rQqjcFA81lmYWx+WoExy2PfEY=;
 b=l2SQ8HD6YP7oG0IlxktHvI9s/0Ks3yGwFhvjBqgkr+Ka+S1cf4JzlJJmSsG5Y0lTWp
 3q8JNaTVB42vE7mBh5K/Fqy3UY7uW3ZJFVwxTHvr2t79poVZHM2i1B3uBkOPYYeBNRoV
 /gqLRd7j97uNRw4XDdpzhm48MDZm4lsFHffspI+ijipPfiMhC5fdxySCofdpCbXcJakZ
 zr0GTZ6EsPlaz3GHvMXmGnA/t5v5UZ+LYn5weEhAYSyw10Wne1Yv+sK4YXUkXGqzhpw9
 ThX1minno+KfdL2m3DeRKC6jwoAxEpV0laVZ4sl8ZHhLToWGP0sl5b417zepM2c60AqZ
 wk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715178916; x=1715783716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Znvm/tKg0F+01QfyX6rQqjcFA81lmYWx+WoExy2PfEY=;
 b=Cqz5U0CWC1cb3UJDaUNNXqVBOu9cf7Lntz41fvcZGAaJhZnuxSNHB28022NtTnldfs
 YxagYuJ5aFcKrPhRX9ZaUSERsU7/AQ4r1MTBtzfuNh24ozwUKpxcxW2bjRR2r6XmGuC7
 YRPzuGf87oatvw1oha+TfAinF/++XQUusFvX0GCUUZWFNlxBobAMGbyOa551apjnx6rq
 eq35pU3S5pV+Wyo1TPkeXH1ak1AlfN+JlyAbpC53N1DWKO42FaavQDttcb4fv9xD0sPa
 gAHni5tj3nd4dHHyR2f6bKDL3UQxR1MedOO8QJWmU3R3GVFRRhrdBM9kW2nDoVaklhN6
 cggg==
X-Gm-Message-State: AOJu0YxBUiQ5jNCEDB+lgAfE4px46Y568v6rLyV6tGi4f2vmsVFMOXq6
 evcXtxd5S/GZVs27p8LpBbRekruUwtWzmxFpnQRgJWhXASkgBwUgQAU+n6OYgKc=
X-Received: by 2002:a05:6512:3157:b0:518:eef0:45c0 with SMTP id
 2adb3069b0e04-5217cc520d0mr2390867e87.48.1715178915749; 
 Wed, 08 May 2024 07:35:15 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-250.dsl.sta.abo.bbox.fr.
 [176.184.10.250]) by smtp.gmail.com with ESMTPSA id
 n4-20020aa7d044000000b005720e083878sm7610286edo.49.2024.05.08.07.35.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 May 2024 07:35:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] hw/input/tsc2005: Fix -Wchar-subscripts warning in
 tsc2005_txrx()
Date: Wed,  8 May 2024 16:35:13 +0200
Message-ID: <20240508143513.44996-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
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
X-TUID: fHzGy27W6kev

Check the function index is in range and use an unsigned
variable to avoid the following warning with GCC 13.2.0:

  [666/5358] Compiling C object libcommon.fa.p/hw_input_tsc2005.c.o
  hw/input/tsc2005.c: In function 'tsc2005_timer_tick':
  hw/input/tsc2005.c:416:26: warning: array subscript has type 'char' [-Wchar-subscripts]
    416 |     s->dav |= mode_regs[s->function];
        |                         ~^~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v2: Use Peter suggestion
---
 hw/input/tsc2005.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 941f163d36..8d35892c09 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -406,6 +406,9 @@ uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len)
 static void tsc2005_timer_tick(void *opaque)
 {
     TSC2005State *s = opaque;
+    unsigned int function = s->function;
+
+    assert(function < ARRAY_SIZE(mode_regs);
 
     /* Timer ticked -- a set of conversions has been finished.  */
 
@@ -413,7 +416,7 @@ static void tsc2005_timer_tick(void *opaque)
         return;
 
     s->busy = false;
-    s->dav |= mode_regs[s->function];
+    s->dav |= mode_regs[function];
     s->function = -1;
     tsc2005_pin_update(s);
 }
-- 
2.41.0

