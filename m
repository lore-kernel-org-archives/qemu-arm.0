Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7234790ejc;
        Wed, 1 Mar 2023 09:45:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8vGvN/p/cea6Lpw6jC4/t8BjYxjLP31NYPoAYqGdV+mYXJ6JI3mFFn7t1CThaWcMkjkS1+
X-Received: by 2002:a05:6214:238e:b0:56e:9551:1980 with SMTP id fw14-20020a056214238e00b0056e95511980mr12596263qvb.5.1677692721852;
        Wed, 01 Mar 2023 09:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677692721; cv=none;
        d=google.com; s=arc-20160816;
        b=K9mhzoKwztw11sCq4BRafTDl5mK+W+8QrXSGjSDt2AL+Y5/sy5aA5uPdP0BY8NfG3H
         e/W6ffskiKVZNlR5Kbh7J4O7eXPsT0qGSL8eqqoQGQMu4CdLZJp618KVbeAQoAIvFVPU
         wgrUPHEhvOuzc0yOn6tUse6lHc4gMzj++aSlEum6HpNOrOhLrkO5OK7LaOxccDnGMMbZ
         m6NDngINcrZ1tKnKCQvk8nxnhCJn2W+pDZFv4w3eRYuQI1I75C67KEzgARDPqQ4V12uX
         8CKiCNY5Rt+fHgayRBJRSqxwpbuFOirvoVrUkDSAcW3gAIwF4x88A7VriV4cZV25Z6KT
         ll/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bzBn+hBJ3rtUcWEeK3vX5NNyXIZ1owxoMMx2e5CQIBA=;
        b=mtBSNT7moq0ie/DtM2fEUXsvwUxsi6TYj1YAq7PVOpYCkvXBPPGGxF0jxsUapfhxVp
         BML3LW41UvkkrmWrXBxqfE6iQcD7mVtZLvWpmMKhnRWXEXmzFFgELpmGtKPEaBzbmdj2
         kdAHjJ4Qa5WI/7iLeESBpK4zoe1tqcpR9mUa+249GrR9lAQba5PSFRzezB2BF84LZAn3
         ER0FM4jJQbGgi4QxzF5W8KRhbbFsKBEC+Rkk2b3raVEzIOpj67cVdj8rOhr9dDWla4Lt
         R2r7ocqbw3wcreljhynAX6BqNJnezSnSSCctHm7EZvyv/wkg//cCO/W0X0c2PHg44GCe
         s0IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojvRsWsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28-20020a05620a0b5c00b0073b9cead6f9si10230955qkg.76.2023.03.01.09.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 09:45:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojvRsWsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXQVl-0001Z9-4V; Wed, 01 Mar 2023 12:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXQVj-0001YW-QG
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 12:45:03 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXQVi-0007cI-2b
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 12:45:03 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so9018wmq.2
 for <qemu-arm@nongnu.org>; Wed, 01 Mar 2023 09:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677692700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bzBn+hBJ3rtUcWEeK3vX5NNyXIZ1owxoMMx2e5CQIBA=;
 b=ojvRsWsPuQDFimAx+ThmNB+4RMI/+TLEyG+jjMWCDtro8WjRZvnn25LTKRcHULLxvo
 d/wtaoQ+LgA58hWWw76rfcifN/QbQro5EsVsHu2kDzkxHxFvNW9kK6F7iFHii+nVba4v
 gfN9l9O4dzc9SVWMjFKgChstQb7mB9bpzZkAZhf6oDTw1HYh/i/gE120FOKU977nK1K2
 a/zj2kFn18aupuoZtR6Iyp4XJVTR7RlLS76XJoFxLFk1S9n5dVA+UbLxHZr61++rLqGt
 B3O5TtQ9g+g6TzdzioNvFnO1Z/iBBs/ITwihCWkRTC1v8vfjFXsxBYhUjDzD22mvgAdA
 nDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677692700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bzBn+hBJ3rtUcWEeK3vX5NNyXIZ1owxoMMx2e5CQIBA=;
 b=QWCs5PNDP5wmNQc3YLA3AivILiyjHb+g3ukeFfUbJycEPH9aMuG6JxjPu7bjJ/4PUu
 K3kzoYyUNDpF7WjI1Xu9aQK6tJuBg8vVr4ujNS6o/Dh5Jok6qz26cipSo/F8sfZzP+6q
 ZTm045hV1C5ZcMLRgpGPOJhEZqL7yx72Cy0LpRldrYjs5dY370b2uAThhhmDnPP5hJjM
 gNvFdaYy5nUiRH2TUKNx3P4qblpwni3N//PGNJ+mBPqUPItEHPTr4HHL5k+z4oFy8bMu
 4OefdI2Mn75S8CanyAtatXTUE9iH/SDGfDHPq9hU9W0LdwEYvZxeMYGNz7XQ3ibKcG3+
 QKEw==
X-Gm-Message-State: AO0yUKUrHun3RBT6VTN60H4tWf1xjlqoYZyCmQnPsPmBm4R/rEmfX0pE
 X+Pt66td6jz3WhVnJzwWo3ha2g==
X-Received: by 2002:a05:600c:3acb:b0:3eb:38e6:f64f with SMTP id
 d11-20020a05600c3acb00b003eb38e6f64fmr5469288wms.8.1677692700459; 
 Wed, 01 Mar 2023 09:45:00 -0800 (PST)
Received: from [192.168.45.175] (41.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.41]) by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcde8000000b003dc521f336esm258930wmj.14.2023.03.01.09.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 09:44:59 -0800 (PST)
Message-ID: <36f0544a-7fe5-1154-d339-f0162b715a13@linaro.org>
Date: Wed, 1 Mar 2023 18:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/11] tests/avocado/machine_aspeed.py: Add an I2C
 slave test
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>
References: <20230301165619.2171090-1-clg@kaod.org>
 <20230301165619.2171090-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301165619.2171090-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: uFcqJuZNOT5z

On 1/3/23 17:56, Cédric Le Goater wrote:
> The Aspeed 2600 I2C controller supports a slave mode which can be
> tested with the I2C echo device. Test extracted from :
> 
>    https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg00183.html
> 
> Suggested-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   tests/avocado/machine_aspeed.py | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

