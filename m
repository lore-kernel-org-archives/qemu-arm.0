Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1320823lfq;
        Sun, 10 Apr 2022 19:09:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1Mjb9ZzP94NzGQtSwYMb2D0NI72ydjJ0iZwxmEZQO+ESDg2DOpMD/GzYpO8VOmD/G9KhI
X-Received: by 2002:ad4:5bc1:0:b0:42c:37be:6ac3 with SMTP id t1-20020ad45bc1000000b0042c37be6ac3mr25224929qvt.18.1649642946943;
        Sun, 10 Apr 2022 19:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649642946; cv=none;
        d=google.com; s=arc-20160816;
        b=gd5zeCtDVeG3lx85nriZ9bapf30f9MAKQkAr3LUdVBJPLdKav9zAx1/VXM+qHgoNMm
         I/Uvhc2VMyzlQENKIv1XfZKEohSL3PbPsLWev14uTlwsuCn+GwhJkZwNbrw1SPASZCtI
         R1NYTXIbOqDVlQ1qBUO4xxEyseoCdDbWZ97hJGYUPY556FRuhTHEXtCsNQTEevVUbrW2
         M0V/OpGagmy3Mq8IxE4inwDW2T78ZfUSl8oHLaHR2fUcilvTaP3I5DP5zNUZS2Mc64Qb
         84T4YFoGkrAlYFe95lfpIv7g/NJb9UNaL6GhAYhcE+2GI7p9qAU8EsR1PvNtBShRm/o/
         rT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=AtfojaaL9uMVa7FfA9G2/AT30mThmxbyvCyafIWHC3Q=;
        b=vKlWhoh7GPeNYb7QdO69M2YrkAB7GHTEl5G63RSbMrYYVy+g1iQH9niL4KfBsnYn5W
         KF6k1IEdTqS+3V5TtL2Q0vna2PPM0Rezc2M5MArzZzVu0i2zEmAGnuR4UFtmlRfowEES
         NfWIiaRPoiVd1Bo8y4BXri+qMnYzMYlJlnsXRrSzTPG9LWhlhgODiFC5K4c0/ZXRxz8u
         04Z7pUC/UZt6es8cwg9owuOgNBPA9hJkVhkVLJfNJO2/sTy+4MOHVBzDubROrJ0whMR9
         W1gevNLjmWjcL3+25+4yH2p02Ms+aspUtfzVnhCzpy8ffF4JoRFgF4WoLmxkuS9v66on
         +6vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j188-20020a3755c5000000b0067e4be23976si3423610qkb.443.2022.04.10.19.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Apr 2022 19:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndjUI-0002LM-FW
	for alex.bennee@linaro.org; Sun, 10 Apr 2022 22:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ndjU8-0002Ks-24; Sun, 10 Apr 2022 22:08:56 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ndjU4-0006s8-JG; Sun, 10 Apr 2022 22:08:55 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23B1txrM053510;
 Mon, 11 Apr 2022 09:55:59 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 11 Apr
 2022 10:07:34 +0800
Date: Mon, 11 Apr 2022 10:07:29 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
Message-ID: <20220411020727.GA2461@aspeedtech.com>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <66783c6a-4942-23c5-1052-0dcab389e177@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66783c6a-4942-23c5-1052-0dcab389e177@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23B1txrM053510
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SCC_BODY_URI_ONLY=0.833,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:STM32F205" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c95/tQJR29oj

The 04/05/2022 16:12, Cédric Le Goater wrote:
Hi Cedric,
> Hello Jamin,
> 
> On 4/1/22 10:38, Jamin Lin wrote:
> > Changes from v5:
> > - remove TYPE_ASPEED_MINIBMC_MACHINE and ASPEED_MINIBMC_MACHINE
> > - remove ast1030_machine_instance_init function
> > 
> > Changes from v4:
> > - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
> > 
> > Changes from v3:
> > - remove AspeedMiniBmcMachineState state structure and
> >    AspeedMiniBmcMachineClass class
> > - remove redundant new line in hw/arm/aspeed_ast10xx.c
> 
> Do we want to be in sync with the zephyr naming and use ast10x0.c ?
> 
>     https://github.com/zephyrproject-rtos/zephyr/tree/main/soc/arm/aspeed
> 
We used aspeed_ast10xx.c to support minibmc family such as ast1030 and
may support ast1060 in the future.
If need, I can submit the new patch to change its filename to aspeed_ast10x0.c.
Thanks-Jamin
> This is just a question. Don't resend for this.
> 
> Thanks,
> 
> C.
