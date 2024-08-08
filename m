Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp673751njc;
        Thu, 8 Aug 2024 15:05:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVL2o6+bVF34WITEFa9SESyTFQiTQjYjtBfqDrFOq5zMN+D2yK5DsY9rDB/qlRytNGLRJLaMTVOer73NmcTGGOqun4AeUYy
X-Google-Smtp-Source: AGHT+IGUZOms3uRszY2rTOwGFV3yh1A5MdOCJOOpfmdVCPqGGebPV7DBEzneGGmLjk3wK/p7QumP
X-Received: by 2002:a05:6214:469c:b0:6bb:9f51:b7a4 with SMTP id 6a1803df08f44-6bd6bda50dfmr49895566d6.50.1723154737201;
        Thu, 08 Aug 2024 15:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723154737; cv=none;
        d=google.com; s=arc-20160816;
        b=l501QQO7o8d1HDhKxmfr4lkdZxO38YpYDUNi51sxPRJR/ldl5ESNNG5Qfl1i07N+tI
         s+RmJ7NQbkuDLM/tT7COTDmCk7AN8MABJIQINtTPwEqTo6ABVpXI9MlDlxy+S9OXBHtv
         1LW8mqMv5QUbuwsqek5A1XM9tJ7f6yacZyu3Qu0EYsi1CIm4mT93Mw/pCdsBttBgcrwI
         ZbdT/xSgfgWcIZUJ2Ml1jHXihsmM5PVox9C6p6WKzrQOU6qHQOvb8bDTs8jml8A3PAul
         WK+55//HvUi2Gv/6g3xCpaZM2FfmDjetWP/bO1cVzUoFftR+P+Z6hhp+vnNrgJP9GoTg
         +RYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=IuI3haD4GuP1dlrjC8vm09YImosvZpa6Yg989u7C/QA=;
        fh=IjEvtsrNZv53w/M06Dcr0oowvphObXi5vwCDqzhPv4Y=;
        b=hmYnKQxPcrxZhIF4gOudQVydHX+4HcsPy1rcU4d8/dDcNB75CKGX+1dxu0A5pG6ylV
         gwYXPQaqLxSUzP2zFJJhCBAm/Sodo+EFhRMnCfc4Gy1yoxCEJDnNY9q+gEr5iSiVBGfv
         SjPRkou6MlZ+jFTx/NEA+1JnsrVlIJvavAU7OrJlnwr1StDKplT6aipdZEdo8Jc8vB2O
         4CjV5Sze4KhUbYEKGGXbEafp1kBOL/LA0/kpMZoWxFrApSb4uzvynZuchmfoBDDpqWcz
         KAsbgm9H4S/oWbMT0ZglQlinIV6zH6pa0imIWOfpqHyo44pwg7EnnunRe0Q2+oXt7wY4
         pvoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=TwPMNNkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb93156bsi55515296d6.596.2024.08.08.15.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 15:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=TwPMNNkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scBFx-0004jN-KC; Thu, 08 Aug 2024 18:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1scBFu-0004gi-Uk; Thu, 08 Aug 2024 18:05:11 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1scBFq-0005qM-Fo; Thu, 08 Aug 2024 18:05:08 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-70d2b921c48so1208808b3a.1; 
 Thu, 08 Aug 2024 15:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723154704; x=1723759504; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IuI3haD4GuP1dlrjC8vm09YImosvZpa6Yg989u7C/QA=;
 b=TwPMNNkLr6TuP9kh5FK44trWFR/g8+sEVGEIyukrllWa50I9hfviSjlngUKnHPb052
 HaZE9YfaQEDDKwPlfKavJspLZwQ6RM9oEgt62TjsOxo0ew8pChim88jvHr45AnRVt2zU
 Lq6PzgQg6JurLRmMUJ1HArhyA8kGImobQuCWzzAnl8nzKWIGGukQnpPCMpquzYlTZqiO
 HEgA2NgXGTD4XPS9x1rYiG9LhJJ7j7DXwzUwIEdOLU5fQ4ZXq0VnazZFG6hzwqtY2XFF
 14HxoEuZ305WvuYvwH9E940e9hbwl0OqHZzH89J9Bi2cL0b1XpuyxLgO20mvITvjL1AK
 KQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723154704; x=1723759504;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IuI3haD4GuP1dlrjC8vm09YImosvZpa6Yg989u7C/QA=;
 b=Jg7zDGdiwrf5pJIULLjLJmHUmIwJ0v1Z1yfRtALZJwswXozRlqigfunap4rM2q2W0D
 9UWZiPR83xRkKfLtZ6KFOz5RZVRGahGfasUVnecdOA/9yqba4OCcBEMY/o7uBaaaMz73
 8wqyMLVxhl3frO7T0HZ/iUjJvx0u8etGUJh1inv6t0YglbqiwuQRSPPK6jtAjsqKFEvC
 Lvhl7DPxsH3q3M9f5hw7RWvyNjHForWu4yJFRWF09f5Mgkh9j3NLkfz9AOS1nPWyEEAd
 GuIDghRAK2q0X3stfXmPfxSdZahEWk306zl6FCmcsi8BQMfhe94/xYDq+aAo5ygPfyEm
 gN+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9xe+MSheFaHA0V316fZLKW1YIlCbwqy+/8jE9LgR5I0N6DHjwruIGBxkB3wfplIsymfzhrRoYRB090nGnZjtMYpToWhI=
X-Gm-Message-State: AOJu0YwTHIjU4z3yINSaCOtbzs4YCUeeq6WghBFEY/J7C67fi5evGFG2
 PneiypPTg+Har0qgEcRRwmSAwjtCiaTrIgk2O3gD6QGUE8kUYv41
X-Received: by 2002:a05:6a00:3a2a:b0:70a:efd7:ada1 with SMTP id
 d2e1a72fcca58-710cadf80dbmr4207713b3a.17.1723154703757; 
 Thu, 08 Aug 2024 15:05:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7b76394418esm8763270a12.45.2024.08.08.15.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 15:05:02 -0700 (PDT)
Date: Thu, 8 Aug 2024 15:05:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2] aspeed: Deprecate the tacoma-bmc machine
Message-ID: <4e04f930-e7af-4084-99a8-2a3139e2bf43@roeck-us.net>
References: <20240625070830.492251-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240625070830.492251-1-clg@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: vSEcaiUwFj51

Hi,

On Tue, Jun 25, 2024 at 09:08:30AM +0200, Cédric Le Goater wrote:
> The tacoma-bmc machine was a board including an AST2600 SoC based BMC
> and a witherspoon like OpenPOWER system. It was used for bring up of
> the AST2600 SoC in labs. It can be easily replaced by the rainier-bmc
> machine which is part of a real product offering.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>

I have been using tacoma-bmc to test tcg,tpm-tis-i2c functionality
on arm. rainier-bmc doesn't support that, and other IBM BMCs which
do support it (bonnell, everest, system1) are not supported in qemu.

Do you have a suggested alternative ?

Thanks,
Guenter
