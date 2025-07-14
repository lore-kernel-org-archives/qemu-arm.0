Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D3C83F1B
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 15:09:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubKm8-0005IR-3P; Mon, 14 Jul 2025 11:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1ubJLl-0003gZ-Ie
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 09:36:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1ubJLf-00023I-ON
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 09:36:08 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-749068b9b63so2845990b3a.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752500160; x=1753104960; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xRdIBPORR2L6dl477UWcK22j6l8WxApGJI0v6hHwTAc=;
 b=sFOhM7FkJesJPlnolYEv6cyYWnLiloR6SeLVMpEC6ohMDawNF52y2XcK7EXrK6oLU5
 TMYSf98a6p/dbCny1VzvoGAWXwr5pWyvJFjFaqhnGjr94jg2UAzR1Y3Zpwl/tpoWRn/K
 lSiCrVKJ7FzSwy/AkNydNhVx3+gN1dm2dpR41zUhwjqeDgY29q5UpH4LijfVxgCW4nUg
 Ur9PBSPovAtdjoCczcEkWcA2tstXeVCnKFwWxTUYkgr8NFDLpCtJVWKEAwA/p8jb/K/7
 FxI/E1HdZri8CEuug4PPhwc23ZlNZg2fMSEfcWt/YeldvuNP+htJBJMydp3N10WO8f1e
 lOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752500160; x=1753104960;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xRdIBPORR2L6dl477UWcK22j6l8WxApGJI0v6hHwTAc=;
 b=IAzN989TbPfPATCu0hG4n99Cg9THsUd/r3uOxy0uQ4Aof5LDwkGIfSNo73UmLF9+PE
 XmPnxUEDOntKZORuOZVmqCNJjTk6zEzYCe6DllEeVkrCYJ8FlJ/D/Ud3Yo8KdiX4Ao9n
 bFcMY3DTUO6SkX/ZFY30dA263dmsSxYA9stSZ3VdOCkFJ+K6OCikR0KVYt8ydKbi7IIT
 EAz/copk6P8at+PkZkJ1bo/RfW81XF02/DhU9/EQqzEuHNspJu3bdLIdGYs0v3pFafe/
 zXBErJancklDnZlE4UMt3gomGtBjXpsEMXl/Pka4n9Di4dSbQF6e1zuToNwOroNujpFu
 Nk5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAtC0e6J8Hjg8zcvx+vnYrZJMPNbOF8Awh+1s7d+0gDmMdYutIz2GfZqsDypMqn9LUcaYzZCOqPg==@nongnu.org
X-Gm-Message-State: AOJu0YxyOqM55p3Bun8F6gh6pqos2OEPovpiSJtAirpjFaR6YTyMJWNl
 pgbAtwk9RWNbGJxoEKo/WSoxKOKNT+h97QDozlYV6Qnwsnj0usUBhDf++GhyCc5qRL4=
X-Gm-Gg: ASbGncvMGSpgStMLFZ5ZCAf9psIQ8CZpGDEGkC0dutObGAmCFBjPZY/epRLHsgO5HKc
 iTf/6OX+m8gQdy8R7WaNn7x4qQOp3mcPwFQTuSfkztdZ6zt+VFAFPVl4uYcQB8TOmqBIiOIBKCt
 ZpifAGgI4O49Wbr6HIJCfzzWO+/FibbK9mLid6DmkQa5djnMN3od6+QaR21yRmQ1Ti7LCLGdaqm
 qXTmhlV0dqy6qXz6l5MOa5IiD3cw70nZK6zZtruBDYvM/f4s2AS5UJ/X1DtlMqefMfmszHfLv5d
 Sy/UXUIumD3pJG2f+4NbYh7/lkTDue6O/uFUDTdkMt/7unn6ecLbisNOKW7VQ/+rqTdkYC3ABDy
 dA5XLFiS6A4vZMLBqryMDhsPSzHwaYNLcRKpyuSmjQmW/JlIwCRhhgkFhYxOHnRBP
X-Google-Smtp-Source: AGHT+IHRCkohjCmeCWv7MFFIq0idXCb8pqy+rUdbl/bdmVpwz1BxW5jXtgbUlaGmlTdaAx2+3SM1gw==
X-Received: by 2002:a05:6a00:ac8:b0:746:2ae9:fc42 with SMTP id
 d2e1a72fcca58-74f1ebce5d2mr18847257b3a.19.1752500160105; 
 Mon, 14 Jul 2025 06:36:00 -0700 (PDT)
Received: from [192.168.0.102] (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f8b984sm10516158b3a.150.2025.07.14.06.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 06:35:59 -0700 (PDT)
Message-ID: <e5e99747-00c2-494b-b959-2d56f451d1ad@linaro.org>
Date: Mon, 14 Jul 2025 10:36:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] target/arm: Add FEAT_TCR2
To: Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20250711140828.1714666-1-gustavo.romero@linaro.org>
 <20250711140828.1714666-5-gustavo.romero@linaro.org>
 <21bfbfaa-f0df-413d-bad6-b69688ac381a@linaro.org>
 <65e20340-e164-4424-bc60-52d78b9a17b8@linaro.org>
 <f18a652e-b64c-4a33-bd60-63dfa93ffdbd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <f18a652e-b64c-4a33-bd60-63dfa93ffdbd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x42e.google.com
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

Hi Richard,

On 7/14/25 09:58, Richard Henderson wrote:
> On 7/14/25 00:21, Pierrick Bouvier wrote:
>> On 7/13/25 2:59 PM, Richard Henderson wrote:
>>> On 7/11/25 08:08, Gustavo Romero wrote:
>>>> Add FEAT_TCR2, which introduces the TCR2_EL1 and TCR2_EL2 registers.
>>>> These registers are extensions of the TCR_ELx registers and provide
>>>> top-level control of the EL10 and EL20 translation regimes.
>>>>
>>>> Since the bits in these registers depend on other CPU features, and only
>>>> FEAT_MEC is supported at the moment, the FEAT_TCR2 only implements the
>>>> AMEC bits for now.
>>>>
>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> This causes a regression in tests/functional/test_aarch64_device_passthrough.py, by
>>> continually trapping on an access to TCR2_EL1 while the HCRX_EL2 enable bit is not set.
>>>
>>> Unlike the similar SCTRL2 failure, it's not 100% clear to me how the guest and nested
>>> guest kernels are related.  But it is clear that the outer kernel does not does not
>>> support TCR2_EL1 (and also doesn't manipulate ID_AA64MMFR3_EL1 to hide FEAT_TCR2), but the
>>> nested guest kernel does support TCR2_EL1.
>>>
>>
>> The same kernel is used for host and guest.
>> Maybe it's related to kvm support?
> 
> Oops, no, the patch fails to enable HCRX_TCR2EN in hcrx_write or SCR_TCR2EN in scr_write.
> The same is true for the previous patch with HCRX_SCTLR2EN and SCR_SCTLR2EN.

Thanks for the investigation. I'm just taking a look at it right now. I'll send a v8 fixing it.


Cheers,
Gustavo

