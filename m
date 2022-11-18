Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp43533ejx;
        Thu, 17 Nov 2022 23:57:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UFKaTibnQqsdHYi20hJZdHpt4Tm2jKZZY6+EkRgD4Icj4zlPUzI3jIQ2p3mBs3g1y/LQB
X-Received: by 2002:a05:620a:755:b0:6fa:2346:22cf with SMTP id i21-20020a05620a075500b006fa234622cfmr4877906qki.438.1668758258732;
        Thu, 17 Nov 2022 23:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668758258; cv=none;
        d=google.com; s=arc-20160816;
        b=pR1cI+a3jG/kh+kSfFsx4+kAzwwF+DTGKhvlO0Adk9EZDCJ4h4/K+hfrFRWT0ID0NV
         XE+qJz0MwqWKO0Em39MUDahBsoHDEP+Xl6q9KrXRMKE2uzQd8XrzD9R8y38m0sF/oBzw
         5WsiK/EbBA16WuwNDOYYqOHGMldNCESu5CvxQcJ0eQfw0wrGtEAO7nyu85tduTz79zip
         VT8QfTUG+qh9P6piwRd+KCUBFp1HJVsoiXV/8gTjOb+/ZuDrgIyWCXQo+gFXFNvXpKCn
         74vyd6MhB54POqJj4es8OtbrC6GEMChREA8FZ25b4TbLiMf6njmb116XYJvajZUIjNJT
         n/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/RnVMtPCD0meu3M2O6AH1t7clMNEhGA9cv5gt4zYXJo=;
        b=biXFMVkR8CNq3j6sNOqhEQBwacz6PAJvZOyOx9wp1Cg3F8+vMXnN3thMvfZc7GVbzj
         NwETKMZbpu4f675YeXLCXt0NiFuSJAUSpiJk8iNoi9BdFHTo9fNuIiHzEuFKMUYg0j+0
         lo1OfKl30C2nDYMOLsUC1Wc8f1oTHBkL38PyP1f1knS5rWyAzoxgLbKBMcUhhE41uP10
         o9Jm4zjjv+sXLWNqEtAHv8XZs5EocCzQAMPDX4sonscl1QM3/xWgextEx9CELBtx4O4B
         Tb9kTJ0UHxdDkm5W3CPc159KbXdp9AQMsDXJND1OCINf8t+V9+RwI9y1zBElLMJ+Tfb9
         6m9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3Mam2Ds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay13-20020a05620a178d00b006f3b4d71957si1687985qkb.33.2022.11.17.23.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Nov 2022 23:57:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3Mam2Ds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovwFI-0003V4-JD; Fri, 18 Nov 2022 02:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwFG-0003QP-Uo
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 02:57:06 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwFD-0001zg-1D
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 02:57:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id g12so7975683wrs.10
 for <qemu-arm@nongnu.org>; Thu, 17 Nov 2022 23:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/RnVMtPCD0meu3M2O6AH1t7clMNEhGA9cv5gt4zYXJo=;
 b=A3Mam2DsHeCD7RpJQYk3oTWSq+SwLuFetkbfKaV3v24Tnoe3/KMNq2AqITXBE+JKk2
 2eJnHhqtYtebbppPXGYLLrxc7i1Bqu3JMBgT/3+oMDsy6QMYm66y4qkdI+8mDA3Irtcs
 mc0ae2a4ZP7kh7HJJuT3lwBpJpVvIK1tmloa/UHPxs9E5sQFLXexA6WbN5Oayffip4ku
 J0tNAxdDEePTF5rDoZYsfZQJD3IwmhYro+Ai4qmuKacm/L4/70z71jhAXAfnS3YsH5nW
 QBOQrgU0K6ngA+7T3FymhQMWDjTfTwCld7SDTHG1wnvK+oU3Gk8rNl9ev8YTzryo8Mwt
 wHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/RnVMtPCD0meu3M2O6AH1t7clMNEhGA9cv5gt4zYXJo=;
 b=Bp2OskGYyaPLXpe8PkojFu8OykXR9GL8sNXkW2hFhXNzTdRnsKgvHmaQYvD+9LiZfX
 UO5N5tWydChsflUiRjskBsqqDk/u5OrcVGetwgGvN31h8SEJZXSKhE4KdFwoengfTw+m
 p9XEcRdIC7IGpiUZ3aJj7uVxZbb32uEddfqvOydQzLJ9JBw1WxDv1vWSCK18+fs3CygJ
 Puv/Ijs4sR466rVm6h4Tmh8m2rSJQ+nLpjyY0mkD+HZqeiqXiUKM8NXV4zd8BbWG29z/
 V5o64FFkAgaX0xcerrmOi3ufUc3BO4TQhl6cw/798oTy3uIt4WooN5vmZjFtso0I+UK0
 ap3w==
X-Gm-Message-State: ANoB5pmA6MQt+NkAc+mbY5Whz/UkPqiG3qmD9KYcQgZGv+P3zfp4GvXG
 2iQ5H7TMehj4L5ogpJB9mLEdpw==
X-Received: by 2002:adf:d851:0:b0:236:5d2b:d71f with SMTP id
 k17-20020adfd851000000b002365d2bd71fmr3530909wrl.492.1668758221558; 
 Thu, 17 Nov 2022 23:57:01 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 v11-20020adfebcb000000b002368424f89esm2903105wrn.67.2022.11.17.23.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:56:35 -0800 (PST)
Message-ID: <ccb90b66-7e9c-1b6d-b9ce-e0ffd5e39011@linaro.org>
Date: Fri, 18 Nov 2022 08:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 3/3] hw/nvme: add nvme management interface model
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>,
 Corey Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Klaus Jensen <k.jensen@samsung.com>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-4-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221116084312.35808-4-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: nu8B4JESSyzM

On 16/11/22 09:43, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add the 'nmi-i2c' device that emulates an NVMe Management Interface
> controller.
> 
> Initial support is very basic (Read NMI DS, Configuration Get).
> 
> This is based on previously posted code by Padmakar Kalghatgi, Arun
> Kumar Agasar and Saurav Kumar.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/meson.build  |   1 +
>   hw/nvme/nmi-i2c.c    | 381 +++++++++++++++++++++++++++++++++++++++++++
>   hw/nvme/trace-events |   6 +
>   3 files changed, 388 insertions(+)
>   create mode 100644 hw/nvme/nmi-i2c.c

> +++ b/hw/nvme/nmi-i2c.c
> @@ -0,0 +1,381 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-only

Just curious, is this restricted license choice on purpose?

> + *
> + * SPDX-FileCopyrightText: Copyright (c) 2022 Samsung Electronics Co., Ltd.
> + *
> + * SPDX-FileContributor: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> + * SPDX-FileContributor: Arun Kumar Agasar <arun.kka@samsung.com>
> + * SPDX-FileContributor: Saurav Kumar <saurav.29@partner.samsung.com>
> + * SPDX-FileContributor: Klaus Jensen <k.jensen@samsung.com>
> + */

