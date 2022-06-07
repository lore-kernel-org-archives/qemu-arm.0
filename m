Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2430126lfb;
        Tue, 7 Jun 2022 14:36:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfKVB3wKGbS4tPqasZpY9SbbqocrfMHz2x6WrHJLEEFKo0t//k1aq5V+RTWhM2whQSLoTo
X-Received: by 2002:a05:620a:27c2:b0:6a7:1db:a6e2 with SMTP id i2-20020a05620a27c200b006a701dba6e2mr186516qkp.150.1654637802200;
        Tue, 07 Jun 2022 14:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637802; cv=none;
        d=google.com; s=arc-20160816;
        b=iauVXre5jYAua7ftd1qaJpTsEU5e3dElH+H1dyL8BeU7A6CvuBdu1cG9Q8LuwKgNmZ
         prlQkHGmgXR2vT8kkezneCwnotcCQA/3LZP0djfS0jVue5IlqmahNDUevOaNjMpE0sW8
         J1s5wZmPco/2+cuHFb5XuCAB9/2/gScXTOBNkLr+/c07jI1DLEX8Kky8QCXt15hWZeee
         EPN9DTL3X+Ld/YBx9m8aWNVYLGujAzrL+CmNqAyoX6fWkE4+wIhKw615dO71NLS6klQH
         Cb0LcVm8XsuCIikshNJmTAnQRMWWwl06XxL7XWL+muFaSQk67LXyNWZFxy69QSIP7Ckj
         9Cmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
        b=hMI1iSiY/ilcafqLfVaIZ6ebT9ZtA2UfZBBuqRlebt3Foyso48+loWdul8wFqHXjaY
         5J/FENfP2cE0O101LACYP8DF7M3ToLWDd+9ciR4VOHs6Yjn2dR+dU5NlFjWAG5FxyRNj
         ezmLIZDvve7XAk/JA8K7hok2X2rkHggH6PCTm8O/wEMAaAuDLgqU4FxzI0wB38y5iAvk
         pUu8YSI0MgWjJgqzSPmp4NyHTVLBv+SfhKv306dCEBrMKRFql5Z6ZLoHtgkeGuLKPjNx
         JxoPE5zxqeIbBxuw9kJAB3CDn775RBQd807Uw8fB0pOWFQmtBIx9pkgDiunatD1If4X7
         lHYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNhECIZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a056214076b00b0046b9f322394si3731487qvz.524.2022.06.07.14.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:36:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNhECIZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygsT-0007JQ-Mh
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwy-0007SN-Gs
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:16 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwp-0008Gx-Kt
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:16 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso4714136pjk.5
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=QNhECIZfk7oXX4TE9R87booFQt9t/T50LAmiq+zoqQAZWrgkT2o3S0mGBjzposkb3R
 mjlJu02Yf2dyBm4Qk8xn5vqhrpZoX+NSPyRjYV2+33wvHUyUrvsajSKKQR/01XZZfJh7
 6UKU7JjIf38Lqwjgfdb9gbT7gZf2G7t2GbM6BntHq58P/hPgSXbeusjsYQckeA/WtA6n
 w4ebrTZUJKCRutmsTRUn7ngtRmcJptOYxYewcJUCQ1392Df3avAEEfuuEvRRhCMkHVDt
 R1PmDBkVhgBDyOd9I6+wtQFj+cYYFV3hppR0yDqZbsa1Z0wTIlg09E0aOxCJE0Lpfpmc
 sOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=Ocwm+Y/kSfG5kSEcHhu64kF9S54EVLvXZqIMij+wt9ZfFAz24nHCDLm6H5kG6BaWqH
 KAXD+YIO9CQUV+qCv/uJ9SuytugpUq5Rsxhuc9S6NyasUeuuA7a0eshTWv3A6XFz43aY
 R6302gxNJavWAziv4/sSKqwPjukpHSMWYKXnmE4F0pEcdgkR1ZEwQKJEmItVKn7ITDMp
 Jhg4wHjvG5xi/xqjns+HafThDeXSwTyNuombnzdRox045vGOdnd5zDf4V/e2pXkMbK49
 +Q8UzOlv96mvOrcRW0ChJfsGOiFGWiMJnU17pJ0Sf7r2Kz7dwF6Jb26wtr3R0QDAnFrX
 SRuA==
X-Gm-Message-State: AOAM533Xb0XlG/tudTD646HhtpfSQCeLk852wKD7azdEhzValKZey9IR
 MtJGsayaRD7si3mLqB7KQigjVA==
X-Received: by 2002:a17:90a:fb93:b0:1e8:a809:af4d with SMTP id
 cp19-20020a17090afb9300b001e8a809af4dmr4690771pjb.7.1654634226886; 
 Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 64/71] linux-user/aarch64: Verify extra record lock
 succeeded
Date: Tue,  7 Jun 2022 13:32:59 -0700
Message-Id: <20220607203306.657998-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /yaFz5i9yQ7+

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8fbe98d72f..9ff79da4be 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.34.1

