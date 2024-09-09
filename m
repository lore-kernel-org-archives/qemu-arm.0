Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1015694njb;
        Mon, 9 Sep 2024 11:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYCf3KYCcbns+AwdN9+qIXO7ebcrzIvGuRo6FfDttlU0tMeSvZmHown9Li4f/8t60GoW2zLD255GHh0A==@linaro.org
X-Google-Smtp-Source: AGHT+IGV+Gf53Iwo3yxfV3ucy/8JX1IBCDGR15uLsjLe+p4B2830P2xErg4TC7kypxh/eeAH2Udx
X-Received: by 2002:a05:620a:4588:b0:7a9:b456:c608 with SMTP id af79cd13be357-7a9b456c94fmr652210085a.16.1725904988072;
        Mon, 09 Sep 2024 11:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904988; cv=none;
        d=google.com; s=arc-20240605;
        b=f0XB+lbAI68sG0ejrPrUSeyQgtbYX+ENkCjRwhayy+pMjSx6w45Wk2hZYhbwIZ+kKo
         NLkP0Cwbz/2+zIeDB3PjUzJY7XFBiZsU/RNauNj0tpwHhc1jiyNcRz29mJsXCKWTtydD
         XGllkoyziKkXnNCPhTxd/muZC6h6jBn8fTlE8hmT7zeHB0vS4SU6FhRrZ6zdtkNy9Q1i
         iUP4XpNcNbZ8CXg8PcnN9hIIBLjcOc0xek6hTW9E70OiZEBAJf6om5cy3mewvgv0H5Lu
         5iyXLIcqlboSlZGIqXr/eswhv7Qa5COqr+/69ncDQ+z6SP3dTnY8+TRRasmnojm2+FZU
         djlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ekos1C05kXz4BX7E2oaErKrr3DrBSiu9SoQ/HQodfdI=;
        fh=V/PjqXbUghaPqUsBfsynYwmnYNIY+Q2drIbV92ORpEo=;
        b=dGEhDHisXSyL8lLSYv64hZTCUOJ1RGhLyAHvc01ka+k2LMOdp82vJIJeFiKWZ8EWIO
         jlRZyoTFwvOZgjN4iEY7EEyeTxJGHpE8bQ6k7BsbSzN3VT+YukDvcQlatIpvldUFm7vT
         TcHQ03nsMJG8NdWsCYM/xvp55ycPaH01Bol10LKbaj3C+/KGh1TaSizkxy8Dl4oJsB+J
         hw0+fCT91qXAexHSkA7YnHvUTZfA0zHRi5qUS6dL8/RJBUJOKE0JzYXxVDpBMa54Mu6I
         3HxBO7zDy/hKWs182r9nwodbBfmlFDaxxiDydw6mNgxv4q5WsJepF8uLVFIFBIc5N6iE
         OUTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrJ2vzA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9bc308bcasi154095585a.618.2024.09.09.11.03.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 11:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrJ2vzA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sniiy-0007dI-2A; Mon, 09 Sep 2024 14:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniiq-0007A0-Oz
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 14:02:48 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniip-0001Kf-1F
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 14:02:44 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53661ac5ba1so2454100e87.2
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 11:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904961; x=1726509761; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ekos1C05kXz4BX7E2oaErKrr3DrBSiu9SoQ/HQodfdI=;
 b=yrJ2vzA6bEv+gNIJOpKfG+q9Phr8K/0y4+qGeLN43CYU5O0Q7FAN86NygWxsK3zehD
 0+DkLAM+Wa70/5NwCwiCrM7AaSzaMslcnFYg0OvGrYkgB8vTOZtTscKOFwFQAab4XQif
 asGpBRXWJ9XO7Ew/LZFJsSAmihf7cLEIFFWKQJw0pw03sFXc7R7mXFS94R1ys/7b7r+t
 s+a3yDNkltjhSo8EP9DCxE1u2Ik/skLTov6Yt2UW9YFqkoIEUao5Ics3aHHAh9rqnAK5
 52mF47ICeuqLxHcMPqrhdUL6m7Uvv32/R4J+z1qR9AqrlxDb0Wfajzf5+BOMHPLJ61KZ
 LHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904961; x=1726509761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ekos1C05kXz4BX7E2oaErKrr3DrBSiu9SoQ/HQodfdI=;
 b=YB4H8+pLz75Vd7qYC0Qls6AAUqA8D/1DH09kAMk9e+rlNVoy0lqBRJEHF1eDVmKJxN
 CJ5c2slTn9tbBS5Dv1W9jLZOGu68qhWkL0z94xRVcANW9njEo/AGjIZqNCJv+w7qn864
 NgRjPgDHC91Iwy3TmyZYB9R1jrgfRreIYt/I28TCWxfn+RLRI8v8Rf970XaMrO8F//a0
 ptlVrKJnSUVV42bCyeOtMVoHfvwHPiXEBnFtCQI2Y+u6TuH4r5tjr537mFgCBJ3oPF/f
 YVyMsf0QuOAi1Mw/mKc65b4EqIZb/qoBbqx1aDTa7ZQ8zgBphwrDCqIHKHX4D5mqo+0D
 DlkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULLSo9X9dfywMerbB5Wcn0IQLGuiTLROCbCorx3NcUQXdGmU+sw9NS88BDa98WytT5t9HpNKqBdw==@nongnu.org
X-Gm-Message-State: AOJu0YxFDBaLx+5BBYjzIwsA13d6XGYaKnbrbYOD8p78tML0wTMlZWIq
 kDAnpkFdfdVzOS9eezXXxNKXZox+L9iGzBHIc3nXLHBeRzRuIXwkkCCWDd8nl7sD090DT4Uq4r3
 v
X-Received: by 2002:a05:6512:104f:b0:533:482f:afb7 with SMTP id
 2adb3069b0e04-536587fce37mr7659606e87.39.1725904960615; 
 Mon, 09 Sep 2024 11:02:40 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c74286sm371479966b.123.2024.09.09.11.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 11:02:38 -0700 (PDT)
Message-ID: <f7f03006-9c7e-41a1-a683-db19378928b4@linaro.org>
Date: Mon, 9 Sep 2024 20:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 40/53] hw/intc: Remove omap2-intc device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-41-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
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
X-TUID: eHhUjdYfk+sM

On 3/9/24 18:07, Peter Maydell wrote:
> Remove the OMAP2 specific code from omap_intc.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/omap_intc.c | 276 --------------------------------------------
>   1 file changed, 276 deletions(-)


> -static const TypeInfo omap2_intc_info = {
> -    .name          = "omap2-intc",
> -    .parent        = TYPE_OMAP_INTC,
> -    .instance_init = omap2_intc_init,
> -    .class_init    = omap2_intc_class_init,
> -};
> -
>   static const TypeInfo omap_intc_type_info = {
>       .name          = TYPE_OMAP_INTC,
>       .parent        = TYPE_SYS_BUS_DEVICE,
> @@ -684,7 +409,6 @@ static void omap_intc_register_types(void)
>   {
>       type_register_static(&omap_intc_type_info);
>       type_register_static(&omap_intc_info);
> -    type_register_static(&omap2_intc_info);
>   }
>   
>   type_init(omap_intc_register_types)

I'd squash in the same commit the abstract parent removal:

-- >8 --
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 67bb83dff5..43a1a9ebe7 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -68,7 +68,7 @@ int64_t omap_clk_getrate(omap_clk clk);
  void omap_clk_reparent(omap_clk clk, omap_clk parent);

  /* omap_intc.c */
-#define TYPE_OMAP_INTC "common-omap-intc"
+#define TYPE_OMAP_INTC "omap-intc"
  typedef struct OMAPIntcState OMAPIntcState;
  DECLARE_INSTANCE_CHECKER(OMAPIntcState, OMAP_INTC, TYPE_OMAP_INTC)

diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index c14b22d381..f4f5f8455b 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -392,22 +392,15 @@ static void omap_intc_class_init(ObjectClass 
*klass, void *data)
  }

  static const TypeInfo omap_intc_info = {
-    .name          = "omap-intc",
-    .parent        = TYPE_OMAP_INTC,
+    .name          = TYPE_OMAP_INTC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(OMAPIntcState),
      .instance_init = omap_intc_init,
      .class_init    = omap_intc_class_init,
  };

-static const TypeInfo omap_intc_type_info = {
-    .name          = TYPE_OMAP_INTC,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(OMAPIntcState),
-    .abstract      = true,
-};
-
  static void omap_intc_register_types(void)
  {
-    type_register_static(&omap_intc_type_info);
      type_register_static(&omap_intc_info);
  }

---

But this can be done on top, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

