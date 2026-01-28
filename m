Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC05CD3F082
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 15:58:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl7w9-0007MB-3P; Wed, 28 Jan 2026 10:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vl7w8-0007L5-1y
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 10:58:32 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vl7w6-0006EE-GG
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 10:58:31 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-81e9d0cd082so5569663b3a.0
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 07:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769615909; x=1770220709; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GhybA32u9o+IGQHaJ18S8Xl69d1olQn5ctkEPrtdHjo=;
 b=OyE929yocbwli63+z2xYdBKOm19nbyW1v+vMsVasybtW7h/qlx8kcFtXCFErsD5Wj8
 ALmWVSbYQ1SJ4WhqUniiaOQ7zVg2DKbFmRBTD6nPc+FTwxFyV59niVs+qXBJNAH9OBSa
 2ELC+473L1DTEI9z9d+miofuYfnpxYVfIkYDR57AGso61pI0SyowHJcW1C214UfJdOaE
 Hb4cKGMb4W46/952YTbq+z0BJTNPIpeOr9GkWuF9SJqRW77c70ZsfSr7vtWS7GvrDAsV
 p4WEq8aI3snVgaHJ29DhjUshXl9hPWJBtFrivj85zpY72/SsEpZFUaC8q7QcrsSCGgOo
 +XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769615909; x=1770220709;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GhybA32u9o+IGQHaJ18S8Xl69d1olQn5ctkEPrtdHjo=;
 b=otdVP/t1v5xxRf5GxeJGf91M+wjrOIg5Lgyp+429ezWYGh9fwPFWLsd7uXuTSXEcwl
 pCsVbpDKicEOdbYkP1TvGEyQG8MY0a4xZPpXTcuWCPdsnSuUqP/PAjz/mong7w716TQC
 EDjVh4ffa6js3KU4Y64ExlVYlF1JX1cJPj8Wjxp+II1ehEErJIM7R1mMikw7B+BAQXES
 xPEF1QvlWgV5VYVXzTw3VD5FcX/kzUdBgdolFIagoX+GmLBAavycF1Vi4cctfqWJZljC
 y6FtT2QO+f7Uk/CFg9+Z8js2c9JOOqZ82kWbNYbVzb/314P7317qkq7kYxqoOYZBCil9
 CjzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyqewECk27/I8X76yoRhQou9JIBwbDpZ+FUv0WZqbwnEJl9QLtdyJgQ8ex8J+StdkOfTYGAAhyZw==@nongnu.org
X-Gm-Message-State: AOJu0Yym8c9qtjEr7cNC4wGTZbVn5ifRmC+eaiiaX5ShdJnQFgB3leU8
 ByC3vNisj7yRj22WLArMvsU5a4TLX6xya61RPN8b+eeUVGwy/xxeCNGE1JivLxaviCM=
X-Gm-Gg: AZuq6aJvOr+XHTxaFE3Gw4a0UUu+Y7KFPqMP5L0hivMY9dNmq+fzIy/SNKA1TsUvM68
 ctwRM609xujBA8RNEO79b/+w0okRzt+wmEttZGkqfo2xTxPlwGC0c5T7uGD3mH51UUA5eC5qh1b
 MzaCraPWfQl6ap029bylPYPzOMY1yzTrp5P0kAx1xCSxubsf8Homiz/kcq3pi4jXWPLPqc0yW7K
 9KQM1SV3XMydg9CAfzsc7lCkBzj2asoP0NA7uPL/CcRoIw1Ei+GhA+xHxMDiR4qDRkiFoXXhoyH
 WmAXn6QoB83YdfRngZ1dZKJ+R109iuADPOKJ2Xeps1wEwA48jZlRGDtqrR1l+RGZSbMbAKRJuWQ
 7h6nVJ8QLIVQJIws7nwcC64wgS3eDG2ghHv/G06d1NpLDVhgPtIuzUDLmgdIuVr1CjD7t20silY
 s6KsjeJ1rMvQDwBEoImIMF0t6yH5reU2Ojwnk2mr6dC/Q2rBcHZp/eSkEp
X-Received: by 2002:a05:6a00:1304:b0:81f:3fa0:8c38 with SMTP id
 d2e1a72fcca58-8236918241amr5483374b3a.20.1769615908851; 
 Wed, 28 Jan 2026 07:58:28 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379b6b2bdsm2987263b3a.30.2026.01.28.07.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:58:28 -0800 (PST)
Message-ID: <2c0d1fd2-3645-4c4d-a793-663812ce333b@linaro.org>
Date: Wed, 28 Jan 2026 07:58:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/functional: migrate sbsa_ref test images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
 <20260128105839.3487840-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260128105839.3487840-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 1/28/26 2:58 AM, Alex Bennée wrote:
> As the builds in codelinaro.org are going away migrate the binaries to
> share.linaro.org. As the hotlinks don't encode the filename we need to
> explicitly tell uncompress how to handle the files.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/aarch64/test_sbsaref.py | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

