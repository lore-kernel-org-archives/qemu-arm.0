Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E9ACD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 15:51:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wabUp-0005VM-Vg; Fri, 19 Jun 2026 11:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wabUo-0005Uj-D2
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:51:06 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wabUm-0007EX-Ur
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:51:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84532e3dbf7so1362596b3a.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 08:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781884263; x=1782489063; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K/drO9pGnXreGVKeGJ1egyIXtLTEMK/m3v6zLvc5Crg=;
 b=T/bG8L9LLL5bpKAu64ZUaTqA90z54CxWtArKw+WdK5q4GLBxbYIO8goXXOso1NVj18
 REsYM5Mt9kEVfiXYroE28abip6+JH/FwEwnFDe81xLZgFS2U8+SirIrndaIgn4LUIPd3
 gEDsry9ZOLt+0M9dNSKZvmOFzNF3BxE/3gqurGiqLXo06EErWy4Xdl6C0Zxv/a/qYe5d
 savof4jEa/qgQIga8HK1cQph92MuKBtPNWMOL8V6SZByUbGyYaGsS9M/T/h/lFMGxmFg
 K4pSRxpysT2RsmSC6YWYe+lUURj2B2B+nnGJdWDulm1qAk+FEE6QYC5WErkqfXKDWtTH
 IkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781884263; x=1782489063;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/drO9pGnXreGVKeGJ1egyIXtLTEMK/m3v6zLvc5Crg=;
 b=V8Ata5OAid9D8PZC+hkr18S8Wwo9vSNhMUNHOiSIzQL6CLt49EEqUps5eVWORs64U3
 GF0GvChC8ylicOA0nQzfsQXS6n2BVKSsZwstgbKFfNELEi12Vh1lVwfGsueHiWo4HFwW
 vlMqSSGDxsLOlhepvZBaMOTlPgdxg/aMv2lg2WHXfwGWGagUxM+aN5RSGcZ8JJGszrWU
 Q3wD3HxHu9TvGb0WySB3x+JxBgfa6Fo9PxOmBQOXBeP56Ipd4a+VLyMkqI1PNGwNcfPp
 sqg4/iXx1kw6D+j5Thk1b89+Q3qmjyjlqwkUcTPU2zswbdZSuOzyyy1i9wqobCPmEehF
 YLFg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bgo2lnlxpAYr5CWJO2z4Gb9go1J2mNsbJNKeAdnYSQWE6MEIOnAaxXW8HCYAqghYwRifbnjZYQA==@nongnu.org
X-Gm-Message-State: AOJu0YzYcqk9ms3O9ZlOxEWkAoXdeWjlBQBnKBtTfoS0W+mm6l/9HUAW
 d7OegS0vVFUnFf2YwH8Xb044tXxQlYUhze4Qlt7Xiar3Vd29WICpOdLoYC7wGpfPND4=
X-Gm-Gg: AfdE7cnjw6BfqR5sKaoOzUqk9Mwvbt0fzzSHHXH5pSY3CCpJ/5xyYKDb3rBjHBtRyVQ
 3L2d5pDGiK2JPPNzAQGM0DgbTfy2HXoGB7zrcVGmtkrFa81mazGLcpBY+zVjHQahe2bamB5vRIH
 cI/j4lggLoEutuymbaIsZ8UcIvTZryQcQUjY75js6KAMgPn6Mr4uHK4jph3B4DV3FlZ+npjjK3A
 RJcBsnHBHa8EweSumV3Ci/EXFDXM0lAvVUnRmQe4v1NtgxvqK5F3A90Fs26R8eXvPO5KRFEs8Ps
 dqbEnYh7kbRDQ9x1czKPv8KsQoi4uEyMQCjJwXWqWcWqKXI2uVv8wNbHj0Ni4ilUiihLNk8e3rv
 7Q0791V700AOqn0/t/im8oQl53EaoPh1KeD8/McHAUFxk4W1ZdDQotjqYgYmTsQjfC4xzThQX9/
 VfWtdOScZV2XbpYgEjbW+qBcZs/QI7FCPwjA+JXDlhmhLUxUMs1R3rFh7TbA==
X-Received: by 2002:a05:6a00:339a:b0:842:83d1:ee6d with SMTP id
 d2e1a72fcca58-84550aff364mr4294744b3a.45.1781884262628; 
 Fri, 19 Jun 2026 08:51:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8455384df1csm2733091b3a.52.2026.06.19.08.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 08:51:00 -0700 (PDT)
Message-ID: <f818fd19-93c3-4d43-bcc3-fa11ea92947d@linaro.org>
Date: Fri, 19 Jun 2026 08:50:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] target/arm: Enable FEAT_SME_F8F32 for -cpu max
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-11-richard.henderson@linaro.org>
 <CAFEAcA_K8C4x7jCy3afb-NFH==38a7-KoiwmwDTAUXY8qxfeJQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_K8C4x7jCy3afb-NFH==38a7-KoiwmwDTAUXY8qxfeJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 6/19/26 06:54, Peter Maydell wrote:
> On Thu, 18 Jun 2026 at 05:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Are you going to do SME_F8F16 next? That seems to be something
> of a pair with SME_F8F32: each feature implies the presence
> of the other.

Yes.


r~

