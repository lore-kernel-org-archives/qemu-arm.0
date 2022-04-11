Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1473744lfq;
        Mon, 11 Apr 2022 01:59:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO1uVdpMy+R9TCbZvb1bvmsrn0jYGLlGugMf651OszQzTQXidpmev7ozknTdwqQHgYNdk9
X-Received: by 2002:a05:620a:1728:b0:680:9c1a:5579 with SMTP id az40-20020a05620a172800b006809c1a5579mr20585854qkb.777.1649667583512;
        Mon, 11 Apr 2022 01:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649667583; cv=none;
        d=google.com; s=arc-20160816;
        b=KwoD99bdwq/hj/l9JxZ84C6YZSquCdJ+CkHKPxbW6w+NABlw7anyidj04SOgQSRz/w
         7FgLTkmRcMOLYa47g6AWOtd3OUYyz9fzvtY2FS+8+yNXx2Hdx9LRhKIzk+Z3vd3MJZZG
         2YUHBMyfJNuI9DF+sZHKQvJuwkB2Bhol9S1l5mWVAgcdg0uto/w91ncYYpUDDAe0D5K0
         cPJZnAqyXj7JTPjB9MI/lvYIiAleYKnegkgCfGLagdtLL4YcnayOQv8MKrXuw+ENxrlZ
         ZGgPpCdXZjdQChS4qFJn3cqz8DfU55yF7iiEQw/yZmIwjueFfItidd78k0PQ0MECO+u7
         SZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=k0tWhAn+DyB3Ad9GLCgaxzncSaO/42F3qxFeZrQj4gY=;
        b=qI9B8KbJAAU8VEn2trvMfzZe/qNAMeNvhwBJ23eitH4yCQMrOxDDO3U1+sqgBsKGnM
         ERt5eWU41G4ybm5BK3YiFyVrszjzqgbaMkU9rQpk4ET3f4v9bUnEZ2DxMnh8gX82t1N/
         ge8mDBDCMnNIvt61ZBJSNYKVgHyn4kNK3fwqolxe7yR1j9xRIamc0bZgOyTwfKGCZSVp
         Vz7cc3Y6B0h3WLLIT07z0O6Yt2IqqlE8G3VxnN1Y5M2C3LTXqohaaNKLZxBtGRBQkzhg
         JLquzxUDsYa+AfgtYrK6t1xPK3WpKSyuqcN5VR+wrVT3Tgbla9o+tCFu9jW3sW0XxMNv
         YPIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn4-20020ad45de4000000b00443d796651dsi3871715qvb.458.2022.04.11.01.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 01:59:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndptf-0001YS-1N
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 04:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ndptS-0001YF-9t; Mon, 11 Apr 2022 04:59:30 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:47132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ndptP-0000hW-4q; Mon, 11 Apr 2022 04:59:29 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23B8kigb091894;
 Mon, 11 Apr 2022 16:46:44 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 11 Apr
 2022 16:58:21 +0800
Date: Mon, 11 Apr 2022 16:58:16 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
Message-ID: <20220411085815.GA5967@aspeedtech.com>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <66783c6a-4942-23c5-1052-0dcab389e177@kaod.org>
 <20220411020727.GA2461@aspeedtech.com>
 <77936087-0391-6b9e-6087-e62f016f799b@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77936087-0391-6b9e-6087-e62f016f799b@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23B8kigb091894
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
X-TUID: wB22grIi3gST

The 04/11/2022 08:23, Cédric Le Goater wrote:
> Hello Jamin,
> 
> [ ... ]
> 
> >> Do we want to be in sync with the zephyr naming and use ast10x0.c ?
> >>
> >>      https://github.com/zephyrproject-rtos/zephyr/tree/main/soc/arm/aspeed
> >>
> > We used aspeed_ast10xx.c to support minibmc family such as ast1030 and
> > may support ast1060 in the future.
> > If need, I can submit the new patch to change its filename to aspeed_ast10x0.c.
> 
> I did the rename. Please check what I did in :
> 
>    https://github.com/legoater/qemu/commits/aspeed-7.0
> 
> and tell me if you agree.
>
Agree and thanks for your help.
Thanks-Jamin
> Thanks,
> 
> C.
> 
