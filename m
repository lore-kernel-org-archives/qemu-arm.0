Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2182406ejb;
        Tue, 24 Oct 2023 09:50:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAcMyqQrMkvpJKFxcXBLH65gLkYbYAfkqtGhQaGCYaHpfQQ66kU87DJd7kAhWhclO/6LgR
X-Received: by 2002:a05:6214:4119:b0:66d:4b22:f54b with SMTP id kc25-20020a056214411900b0066d4b22f54bmr16667977qvb.50.1698166259478;
        Tue, 24 Oct 2023 09:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698166259; cv=none;
        d=google.com; s=arc-20160816;
        b=rbqKCdfS3X0oOnk4pHaT8ZleLXIcGCRkE0yzi29GFlozKqpK+hs0uoXJAGBirsRL84
         yUSKJNAf2JRbTzRCCxGQ2L0p2dFkDmtTPsZGuizXr95ykn38vEaGIY3jiHv38ivh2raW
         ncYD6/MPA6bhtNEAuEXmBG733Not+jg4S8tJ3sEVx/oAqUEkMtWARrFVsQZkJPQIU49y
         5BbRqu3bCGbsPZQa/uGbtcMkqRbMNh/yE5GDo39DAo1uXO2a+QwMmGm3HJER2k1WISS0
         brjBLIztYEK9vEI2BIZAC+qhbr+E7iIUDJKjMD2aXgZ93W7Zon7spp3PlZwoAMdeKUR1
         2MTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=MmuUGoHCORY6b3xYBYNaxyA/xFjVN7W/5LtaDw8rdjg=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=LDXoSi2++lukI59FsGaVR3t4+BtE8nw31lqkw1Lbu5GjaC0rauKUdZE1hWJZLsv90t
         LJGYWNCx6SKcMQX/XJPZ8DidCVUR0t10Tc927vkcN+eJkk+Pcjpk7jaPDcQ0PRk9Fc7I
         rf9v0x7eHGkzbS1tpuYIvOQ6tfGOi33k9ckYfrzqvb9y2cyDlWa84XQC0cHZeW2SH/t1
         ll6Sfpd5nIc4zXhbckWndUBqSZUv+vJhaMMeFWMnWqEWwdfkUjKBq/+JvJPeTFlpwTTL
         l3KbnpXPXOCns3LnOFvtj9sls65uAaDxLj6GZE/lSUVmoH+e7o7sA84tRMPSFkVIOD9T
         lS8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z4XbLYhD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oo7-20020a056214450700b0065b231f117dsi7592294qvb.205.2023.10.24.09.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z4XbLYhD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvKc9-0002U4-Fn; Tue, 24 Oct 2023 12:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKbv-0002Fl-Ay
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:50:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKbt-0000jD-H5
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:50:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40853c639abso33977015e9.0
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698166224; x=1698771024; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MmuUGoHCORY6b3xYBYNaxyA/xFjVN7W/5LtaDw8rdjg=;
 b=Z4XbLYhD/jaHMIRK/fcyql0Zr0/OFPuawG/2f9+G19vzFWqnatnHNBBxoNP2qifOmR
 r0x3rguOolUdqPfeguqIHUtLTuojbelbtin69PYEUfH8yC/1kdtkn+0fKjegtfibKh+D
 HpGluAvBuyzrheLlEhFEccozT0o+fnTN0YQvP5Xtm/CjOmnAESxaGZCG2V2fEZ/aEJPf
 bnGnbe2eTLZknRsm5CfuPs1K3hLvb6sNWXFDwyaZmWVYAHjfFYR0nxsRoFaEhsbW0qNo
 aIXG3Xl0cMSxR4YWxdXFMBLLk3j96K6TawDNni13+V7yfk7XlA5V91NTd9SlqxBPBZrY
 VZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698166224; x=1698771024;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MmuUGoHCORY6b3xYBYNaxyA/xFjVN7W/5LtaDw8rdjg=;
 b=V514n1frsvP5qlKQRvGYO+AJqDzPX2kxc087r3ibKDNWLuWEoASVGUhIhRykYhYeFw
 mxSHvGN0zvmKdDvkaU0b1fJ1c+vinf+hmFv5/xu/vn9XW8jW/zMn7Z+f1ZKDjr50vlsM
 uasiRKG6u6VFXoJfev+hiHalvABScmDAuVyQraeu9vrUfW4BANKjlG0hEr4JMc4nY5Sq
 ug2VWoLjqYChRiRTZV0YZXFjyYlXmr6Y3n+eJUciQWFZgmN/B3ok89Ba576aSoD0l8eo
 PveXo+26h8R0KOuO7n5s5EwZzXfJdObbIqHZod9CSyqTb3h/pLSEujfIt/cTzX65hfze
 MeVQ==
X-Gm-Message-State: AOJu0YxJyzUyjG397/IENT4QiMcapB+3tyBMkBc/7pVxrqa3VGAHBT0K
 zGiZY+1Lj/FX+HdEGam94QawKKxRGUlkKa9MgLc=
X-Received: by 2002:a05:600c:3147:b0:406:3fda:962c with SMTP id
 h7-20020a05600c314700b004063fda962cmr10336284wmo.31.1698166224295; 
 Tue, 24 Oct 2023 09:50:24 -0700 (PDT)
Received: from [192.168.69.115] (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 y34-20020a05600c342200b004063977eccesm17177906wmp.42.2023.10.24.09.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 09:50:23 -0700 (PDT)
Message-ID: <dcba89fa-fb3c-711d-acbe-9dfce9b89c0f@linaro.org>
Date: Tue, 24 Oct 2023 18:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 0/6] target/arm: Move feature tests to their own header
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231024163510.2972081-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: gQ0oemr1Hj2Z

On 24/10/23 18:35, Peter Maydell wrote:

> Peter Maydell (6):
>    target/arm: Move feature test functions to their own header
>    target/arm: Move ID_AA64MMFR1 and ID_AA64MMFR2 tests together
>    target/arm: Move ID_AA64MMFR0 tests up to before MMFR1 and MMFR2
>    target/arm: Move ID_AA64ISAR* test functions together
>    target/arm: Move ID_AA64PFR* tests together
>    target/arm: Move ID_AA64DFR* feature tests together

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

