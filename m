Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66232E98FDA
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 09:40:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAlrV-0000tR-89; Thu, 09 Apr 2026 05:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAlrP-0000sY-3W
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:39:42 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAlrM-0001JJ-4C
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:39:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso6520795e9.0
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775727574; x=1776332374; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ELFGL2WrLDDYG6szntjODti3hgx+XgDueR1SctaY3k=;
 b=eC8YAIdB1WCTm0JNeJiXcxRRph+iAEaPh023Durdi3aw5pAMGCd8XJqeusrQEECCGM
 6fj6/pgDciUqqTPs9vPH++KUCSkWqLQYqpYpUDiX51NMZSdBNnQuSJ5NuU+Ay3LO3OLA
 6xMMvln/Fc35YTjTWDlaZWV46pTIz4Bvd3D5DqaTqF0TNRsFxW4OIDZkJ5ySviKj00X2
 2DsCELAeyFQr5Ii0mNanuTVgvBdYMXDPLG0QtEk+P4/1MSgTb6m2dwSI7jDMHyYkf7oZ
 /7HETIlQsvvgXEJ7wrFbSllwdYhxmYvtIx1fZiDSD0Bd6xT3mikSG2JZydB4z4m1B53y
 y11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775727574; x=1776332374;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ELFGL2WrLDDYG6szntjODti3hgx+XgDueR1SctaY3k=;
 b=JczSPF7uABW9Ev+1kfPbit4nAn36yWHYSwcZUB1h/1HFYEzm9UdhnN6zghlFtlKO+T
 38T7i4exO1Q5np7st+nNpsXq7lYtg//u0+aJwC7eK+7eA7+qg7eKNKSKCfwVp9kgGkwn
 zicCdByZRozt1WkJGPtFyO5LcrywR81AD6CvWglhxN5Ty/ew64wXChTPsimGnwrx4zrF
 f2vtWobedpst9rC33z02rQ/YVeBe4ZcO6lxHSKNNaN5h03wnJNn287kPU4PZ4vWHZCDr
 A3TbesWVDEolFjOSoCTWxQ+EksFYI3zqh6887AmiLhUB3GbIIcm2pcQg2D+0oK9uw/hs
 zMHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8OlQtRw10CGuotAwwNo/9cO6LRaQkniDxtKQK0w3toUoaiO/HXdrWUnNfPS8VOzguU+3lxLhJ8A==@nongnu.org
X-Gm-Message-State: AOJu0YxLbKYR+xIb19+iHEJ18uU0Nra/IJSI205eYae5UqrMKfEo/I8d
 BYkWCBE12FH9MZOeN0LJ+bIkZw0nbg4cpNG1sAkyU3hugjwlz0IeiMrC3JzgUwj76uY=
X-Gm-Gg: AeBDiesFqAZH727Y8LiGtGXba3FLZdrO6GA6x41/+r3Hvah/xuyXOqQZtled/UAVG4g
 8o4qfhSTUKtGS/chOY5niXz5tOBoLXraRQYMtXC0xiSOKJFS/SEppAmjMwwZGkeYrIeBtN0BfGK
 ZiG5jWQaD+q21yR9LZRdgPwYB7nI8bhL7KRnwYiqT/Qxkr635Xv/jvyIkVB3yKQ3H8XmsJ0J+o0
 W2VOwvDIxZKpk1AFDRRMAoFxt521fU1ipFG43+CKUFHeyfQp/zmYBINBLmUHi1ldJM3ldhfDEyr
 JLYVdZpjJSGaFefpNkpk7W5IuIET4bADO6TdyDMaHRE0gi5Wi44XvkcgE60uNcAZHw4WARJXh5P
 7tQZEs+3jiuzTaWRCSPr2vfhKnV96dn/cphTILRN91A0bVisHlCyJ4tJp+F4dD/WjNOhc8JZxFZ
 ETjJPS7gEAUj1CU3SihL4r+qNk3vnMKH1tNiHOuN68MisgKs4BoE09nRImrd9HFZ2gJrWzBG3ES
 6NL
X-Received: by 2002:a05:6000:41c2:b0:43d:184:8a89 with SMTP id
 ffacd0b85a97d-43d595eb258mr3274762f8f.30.1775727573586; 
 Thu, 09 Apr 2026 02:39:33 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e1c27sm63442304f8f.26.2026.04.09.02.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 02:39:32 -0700 (PDT)
Message-ID: <b7273509-0161-4b2e-bf4d-28b648f71209@linaro.org>
Date: Thu, 9 Apr 2026 11:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/arm: Fix unit addresses of FDT CPU nodes
Content-Language: en-US
To: Vivian Wang <wangruikang@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>, Jia Liu <proljc@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org
References: <20260409-fix-unit-address-v1-0-946840930af2@iscas.ac.cn>
 <20260409-fix-unit-address-v1-1-946840930af2@iscas.ac.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260409-fix-unit-address-v1-1-946840930af2@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/4/26 08:40, Vivian Wang wrote:
> The node unit addresses should be based on the reg value (which is in
> turn based on MPIDR), rather than some arbitrary number [1]. Also, they
> should have been in hex, not decimal, as per de facto convention [2].
> Fix them.
> 

Maybe worth to add:

     Cc: qemu-stable@nongnu.org

> Link: https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#devicetree-structure-and-conventions # [1]
> Link: https://lore.kernel.org/devicetree-spec/CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com/ # [2]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>   hw/arm/sbsa-ref.c | 4 ++--
>   hw/arm/virt.c     | 7 +++++--
>   2 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

