Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501AED3EE77
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 15:33:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viwZy-0002YR-B5; Thu, 22 Jan 2026 10:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viwZx-0002XW-I2
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 10:26:37 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viwZw-00005c-5m
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 10:26:37 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b884d5c787bso67740366b.0
 for <qemu-arm@nongnu.org>; Thu, 22 Jan 2026 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769095594; x=1769700394; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lJnc7kBoipKDrnnn2FeG4648XrAxL/dkWvIlbY7J8ys=;
 b=A8TL+IPaH4FxmBH4EvcHrrFBrMo2qOuj8/IXpdd5xT34HAJ267BbMvnP5UG1PnrjE/
 3lAtRA8VckV4DQ6PkEAhf2iWLQ+PeZ6COAGJl4AHb4mxUsH5QM5W2gWvIjYoRaYvIVI8
 PcxQoKhe4917PORY77Uln3OWBwWQM++dKH7m1XmVPY9w7O8tYqjJsYbvRbvoeSNqYDon
 eNUV7MEHXse44G7nvPCeCsbKF47Dd3BqClB0RDaoGhFSNeCSkjdzb4zWB7axxMSLALWt
 iTDVqLs+NIV36ohcOsu+sU6wXetrkwutQk0xuS0ZqNirrxtXhjYDC5+3oGLa7R6IpC1M
 7kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769095594; x=1769700394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lJnc7kBoipKDrnnn2FeG4648XrAxL/dkWvIlbY7J8ys=;
 b=WmMRkb7Tld6DCnTPr6PKrlWSLeVh1ZgKybmkhy/DkBmZI7L+fVzpIhnGdAxMsxrx9I
 R6eCZ1ja9pEslNSwnMWl5xehgdMi5cqAv1NpbJgZtC0Lz0isMpV4UZ0EFalwQcejjirm
 bZqOCpTESbpLxsi63fQAoa+ORIA99PH3oV0v7HvjRdfuTKqliqpQO09DcFbubbpAuuUZ
 wZtgfYQTH0h35zHLwt02fKoowWi0oEFq/+dpx28lOfbCVJZEKKYUOZ7AK8QczK3H8/l9
 lFBMnbC26lxmiF993SMYU0XVOc+Q6oGWc0tX/oTan+bc+qSAmxvCLKYdfhnBGexc62mQ
 /7oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7zRsB7WAaPEdC6fmZQMiVfCSSfhc8N2we7D2ssgTqQzBO45q7kLDJZ42o+aI+l4gxsdDMRGYlVA==@nongnu.org
X-Gm-Message-State: AOJu0Ywc6gZc+kBJo59AhsYcBFIteKUNfm/GxqL4nC4HiR4sRQER85Dg
 hsJLLv5EPxxECOERbcvPhyQ8UpzyhcRfwyhwjZGRR21N9t4H7OIgiPzuhk7A30zm5qg=
X-Gm-Gg: AZuq6aI4Wfgu44nQyEoJiqnoHFtFqX8tKx5WDMuZzKfHMO/EiNhHxeVk8x35lddw/fQ
 gCE8zAnDBP5uLOX1UyrZe1U2J4SV3jlLsLCzFQedPdxxdtSt8wK2eSL35j7WzpkBx068Z1pJqXI
 cngMKUibxKU/El2Tx451CvlOZMeZD1J2AJ95xfGxsncUotu4D3PjY9AFRUg7qXG5H6Qhy2WGo32
 8lgVT8wSU62cRCWLainwzbY3P/1AVMDiiyNaHyWDeqYaxbJV0YDL9K5iyg5+Rsq3E0PbV6/fCTk
 1qviBLjk1x7pwbk6uuONjB9d/1Qs/QG6rVltKX7qS1rzQgBZufKl/vqHYpMaBe81wjAQQnq77Zc
 ZJwOErnDKub3tu00jzk5tb2sJKWLUwMQcFLp0h4XwS1btPsFBkFH1alMlesOPSYms3KTBQ7kpfO
 7WeVWBaYnbaA0bP+Xef2QtCdBZnlL/TxDgwqVtmmlU9RJOfXmfHJ2VqQ==
X-Received: by 2002:a17:907:94c4:b0:b87:7485:b4bf with SMTP id
 a640c23a62f3a-b87965c103amr1791489266b.0.1769095594511; 
 Thu, 22 Jan 2026 07:26:34 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8846fb359fsm68538466b.25.2026.01.22.07.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 07:26:33 -0800 (PST)
Message-ID: <a19e26e9-4097-4028-854c-daa14652e93b@linaro.org>
Date: Thu, 22 Jan 2026 16:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] hw/arm/virt: Drop VirtMachineState::tcg_its
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260120180339.1416328-1-peter.maydell@linaro.org>
 <20260120180339.1416328-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260120180339.1416328-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

On 20/1/26 19:03, Peter Maydell wrote:
> We now use VirtMachineState::tcg_its only in the
> finalize_msi_controller() function, and it is always the inverse of
> the VirtMachineClass::no_tcg_its class field.  We can simplify to use
> no_tcg_its and drop the VirtMachineState field entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c         | 6 +++---
>   include/hw/arm/virt.h | 1 -
>   2 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

