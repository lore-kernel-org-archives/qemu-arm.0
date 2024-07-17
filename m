Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp704792njk;
        Wed, 17 Jul 2024 03:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhP3mz2Xk2FImoo7bBkg9CjtstXYjH45sCqE9W/icabLlp0gh1n1efHo207Ryg56fj5D8Ryrza9P9GaSa9F06FDrMI/S/a
X-Google-Smtp-Source: AGHT+IHRTVvTdbH3s3kDvgLEs9+YAJjKuGBIYqEDax9NDC/9+itVLQV5Jq+8k18AW5Tjm2cLksew
X-Received: by 2002:a05:6214:2aa4:b0:6b7:427a:dc38 with SMTP id 6a1803df08f44-6b78cab3ba2mr15469176d6.20.1721210826244;
        Wed, 17 Jul 2024 03:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721210826; cv=none;
        d=google.com; s=arc-20160816;
        b=yHbilibOMS+weJJX6b+XpXokxKmHAL+jtxdWqsgDwPLlxs44jShi5YWRW3ge5iS9HE
         zAW91mmRr2aYTagaxN7lw+9vIcPQeX/xIP9ERIEjthA+HcOdBUtBknH+2sISfob3AM9u
         6rIi84cqXM96F02GJ6TX/QmPG7Hqr+k4XlubpiCijEauLEG3ObgaGY3K6vIDv74CaAhI
         9D7HQ8F8jdj2Fwx5+akB3Bn+tCvhBSj8rpb6JcJNVFBaZCsyPvzbqI0SU00cciFrcJUC
         syLgDmWMKpIaRGXLBEvc2RmOZuNvlwuIZsUiMrzkm5jzmV3j71eVgczPoW1chDesSZ2N
         DEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jWs9JejW3FZ56shDFAkkM7BYfXb8T8koH7owpOUML98=;
        fh=RFHFNgFBh7164redruPev4oEYG73iKSooTBHKqYS8nM=;
        b=Qf7NFlGupG5+L7BJtptURnkaneNh5LHefkpcBU2hcfxFRT6tR4/4SKVsdUEghumBi5
         9C33BfcN5llZSjXTdsGnThppUOKFl1VJbPYTkrhiG1Y/AszZsHgeev+qYxia+v4kJwe3
         aPu0Xyb/ckjgdb1ZSzx7qOxMH5Fhz7MkogMTHOp1KCERHBDdLhP40zTqvmiUVJLmVXBS
         uLJlcbjPmh1g9LngYdeHZydnRi+DAGjKnCcDmsaqvHEsEuPL3wTarhq1u8s3dao5y5J+
         ou3NW9RZjkefUPEVLrk6wxgib/0TYCoBix/SKJOyKTDik2eXTC2G863Z2TFoZShyqgED
         cikQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e09eHbSl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b76197accdsi94830836d6.134.2024.07.17.03.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 03:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e09eHbSl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sU1Yd-0004YS-TI; Wed, 17 Jul 2024 06:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1YY-0004EA-L8
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 06:06:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1YV-0001NV-Si
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 06:06:41 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4272738eb9eso49304855e9.3
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2024 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721210796; x=1721815596; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jWs9JejW3FZ56shDFAkkM7BYfXb8T8koH7owpOUML98=;
 b=e09eHbSlF1V3jguIRp3qx1Eg7JPyEAMBiM0snR07294d7awbzB/zofD+lwTVfoD+67
 FeGDqC5lQgrl4hdRfAvcaliyDkxMYYTbRrn2hcWr5JxjiIUk0qRtRMVLpun0kZkltqPR
 msO4UH0hjEVH+KJawiPmNnjqZdD/Um1Vai0Qiz8FknJcSYoPJJAIgxmtedYK/cijMt86
 pUC005hOTESaP2IsAtLDVkzOa3HrHQZShjF3o9Q/5ZR6s7yA8gRGGN6PajsTF4Xh9siQ
 fxG7DSt+bGEZJUdnQElbOt5btx9iu5yUH6ls9IBxvj5cz55KmxVkhrBRR4DC0FrVfFyQ
 Xyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210796; x=1721815596;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jWs9JejW3FZ56shDFAkkM7BYfXb8T8koH7owpOUML98=;
 b=QD1zBe73+hhmHq9VmHmH7M5jp+CQFOebFHkt4riWhzGqLRficxEBNKl5sJ6VjTjaFp
 Tb9iFd1a8XslM+PG6mHQM/bcIPO/j94bMsgORcHktbbidlYBxPHIChgcS6vGAeQFwtVb
 akPH8SHIdW4cYNaj1JcC7kYBFMMpQydzjkD5+N8+uBJYWWRzNiukFz/DORM5oNuEkJSS
 ovgWvLCN13Ieve9Yh8RjwDtyCVD2cCzZT0NQVmz7HB3pY6TOrC4/qJsn2gg8Fozpixlx
 N1HEnpb1qSVQ6wTPrGUMosjOiTt6imcbVSysA9nw1R6LMvPxsqyf59dGx2WzCIkpUldj
 Gt6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXifIIEbW8kV+MaCFA31G+qG1vxH3nT6SGVZfyYcVhxRv/VS3DzA6nD0+FoKXqZf1QKtNxEb3Dc52bSA8aaBhWW2O46bJY=
X-Gm-Message-State: AOJu0YxlF6o0Ow3PAtBOPI2+KXsQPh3EeGWcOVICjC0FXobQk1FJBsiK
 +f3IabA5UQFoY96EVfZ+qeRadd43ebcCIe80Q7FEYofJW+XN+GyD0hB7y5IW9FP4rGxYbqPQYGg
 +Q9AxAw==
X-Received: by 2002:a05:600c:1987:b0:426:5b3a:96c with SMTP id
 5b1f17b1804b1-427c2cfc334mr8405175e9.28.1721210796462; 
 Wed, 17 Jul 2024 03:06:36 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef57aesm160999995e9.45.2024.07.17.03.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 03:06:36 -0700 (PDT)
Message-ID: <343303f2-b348-4ad3-aa54-b8bb137f732e@linaro.org>
Date: Wed, 17 Jul 2024 12:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] aspeed: Load eMMC first boot area as a boot rom
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>
References: <20240717063022.549849-1-clg@redhat.com>
 <20240717063022.549849-3-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717063022.549849-3-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PAI+NyfrWFf9

On 17/7/24 08:30, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@kaod.org>
> 
> The first boot area partition (64K) of the eMMC device should contain
> an initial boot loader (u-boot SPL). Load it as a ROM only if an eMMC
> device is available to boot from but no flash device is.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>   hw/arm/aspeed.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

