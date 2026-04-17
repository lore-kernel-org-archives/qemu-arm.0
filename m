Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EEBF8DFE9
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 08:42:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDemR-0000Yv-T0; Fri, 17 Apr 2026 04:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDemQ-0000Ui-FP
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 04:42:26 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDemO-0000lL-Mt
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 04:42:26 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso4362635e9.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776415343; x=1777020143; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CIlIfN+qGbbSoDzudo7Y6r5NkSoDcw0gqphLXUApYpg=;
 b=CQ7KY1+7NOmrrta2qXeJs9QULkB3kfZrx3GfGPsU3bEYj54VeKoPOhqgpyBhw9Je71
 MaZexYqCIwLzw0jkjgGnRrFpnpjNX7bkLmwDtVgsJ4m/eMjcXEzgRi55+J3+iZPNm2H5
 ELvcAiGv+kbVrzMeukd9UIEBnTlQxsziXrDXJ7TfcBHhPbI0p+Ax40dICPAjpUnMEj7v
 vQRQijark+YEnStQNiyuje8xELsI4asX0ri81cuFsFNI4aiCJAZyGrSPgBZ+1xUP4yRw
 GXI7Qg47J9LwRa8TtLv6ROZxGZd5iKX6zeRtFjJFmLNLH4DViLOM6Fdf7xAMSll4W385
 flaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776415343; x=1777020143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CIlIfN+qGbbSoDzudo7Y6r5NkSoDcw0gqphLXUApYpg=;
 b=OLst29lNmBr+sSG3dd5G0kaiKU6B63OupVe/uohew4Og0BP2kZ5pVGqBmua059X1YO
 vgH0Obj+6zjDah5p6YSoVrRMPQidixGFszwbSX3ien08FC/LmvLjzGzpf/y+aiml9vRB
 zS8MygYuzHHmksayTzQjELJ5i4wKGgqgB4smXiDcv1Bh4JXz+daPgJJLAiqW5pmeSVK6
 SCr2abco+LdYDTn8IiLh0sEW98N5vEfIUR40yGh1uYMNDFtZZpX4rjK2Dll2Xcpuig9M
 8l343SNgGTCMjIs36r6+bTNUUF4MFvNJNrarGyFhXLdEuy6DKDP59K+lrnI83KFLy/lt
 wR7g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ZgfufIR2epFgbUqDq9wgVs8yWRVWvckY2QO7Av/wzjayW0wow4O0P2LmC+/cPIkkuk8uo0M3+oA==@nongnu.org
X-Gm-Message-State: AOJu0YwCHZc1F466w83IiVE8QnrZzXLdqqb/qjv2d1yAxjFGW8xjBZ3k
 PMCJEOaA9C6goJCbjus/EcC1FLItSJj4tr7I58RIo0/dP51gfugANElGpSW3fGYrpaw=
X-Gm-Gg: AeBDieusdZKK4WqvO7eJCyuOjtTK0GxjqKmz8orJkEUA7WA+0Z00zgNfp4c66tLazeL
 1kdRpgu7eVTNmx7jb0nZlGUl1j9H2cf4LGuEyYc/Vci+Fz7R7Xz0Wt8wDLwIx94MOwimzd3C7zS
 4kjPv5Z4uvCFdkXGdDL3PVHZkGqQZE7mo2eKr1h0XCVtwXexiWUBHdODshFMje04GQuPb91A/C5
 btj8n8kRMb1M4wU2M4gOKLKCzSgq9wwHfk8O+bWBHszRf1CAr8WiGtIjumhonZFROykhCELJmKt
 0KCjcjR9gIIH5a/q+bENcODPxcwLg/B3GQ+H5DdLF5L1aTqqQ5l2X/mHO6z5WuCwNNW4ZmrrlQP
 QpxuchUFl3CPz15OedDdIB1wq7SNfjMQC/3ESEQDCAJyzhIb6Eh+yLQ9v9Nu4dJGmW4RRhy9+CX
 cA1LN95VLrTiEJemSyRHLBcbIkvtCPnNAFIsgMVlaJ6G2JxG19mQp6aQIEmAuGC8Po2tf89aRA8
 MUAY6X5Xiv1LFw=
X-Received: by 2002:a05:600c:c4ab:b0:487:1fb4:7e1 with SMTP id
 5b1f17b1804b1-488fb7864c3mr26234565e9.22.1776415342506; 
 Fri, 17 Apr 2026 01:42:22 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb6e0b15sm12394395e9.0.2026.04.17.01.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 01:42:21 -0700 (PDT)
Message-ID: <62ddad7e-b9ec-43cc-8eb8-a6a0a8eddd58@linaro.org>
Date: Fri, 17 Apr 2026 10:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/17] hw/usb/hcd-ehci: Implement 64-bit siTD
 descriptor addressing
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-13-jamin_lin@aspeedtech.com>
 <3d289236-eba5-4b94-9930-bfb0086ee66e@linaro.org>
 <TYPPR06MB82064DC25F359E48B2D7B2D4FC202@TYPPR06MB8206.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <TYPPR06MB82064DC25F359E48B2D7B2D4FC202@TYPPR06MB8206.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 17/4/26 09:44, Jamin Lin wrote:
> Hi Philippe,
> 
>> Subject: Re: [PATCH v3 12/17] hw/usb/hcd-ehci: Implement 64-bit siTD
>> descriptor addressing
>>
>> On 16/4/26 03:49, Jamin Lin wrote:
>>> EHCI supports 64-bit control data structure addressing when the 64-bit
>>> Addressing Capability bit in HCCPARAMS is set. In that mode, the
>>> CTRLDSSEGMENT register provides the upper 32 bits that are
>>> concatenated with 32-bit link pointer values to form full 64-bit
>>> descriptor addresses (EHCI 1.0, section 2.3.5 and Appendix B).
>>>
>>> siTD link pointers are stored as 32-bit values and must be expanded to
>>> full 64-bit descriptor addresses when 64-bit mode is enabled.
>>> Update the siTD traversal path to use ehci_get_desc_addr() when
>>> following link pointers.
>>>
>>> Appendix B also defines high dword fields for siTD buffer pointers.
>>> Add bufptr_hi[] fields to EHCIsitd and use ehci_get_buf_addr() to
>>> construct full 64-bit buffer addresses from bufptr[] and bufptr_hi[]
>>> when processing split isochronous transfers. This allows buffers above
>>> 4GB to be handled correctly.
>>>
>>> When 64-bit capability is disabled, descriptor and buffer addresses
>>> remain 32-bit and existing behaviour is unchanged.
>>>
>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>> ---
>>>    hw/usb/hcd-ehci.h | 1 +
>>>    hw/usb/hcd-ehci.c | 2 +-
>>>    2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h index
>>> af8c080c60..6406f536e8 100644
>>> --- a/hw/usb/hcd-ehci.h
>>> +++ b/hw/usb/hcd-ehci.h
>>> @@ -109,6 +109,7 @@ typedef struct EHCIsitd {
>>>    #define SITD_BUFPTR_TCNT_MASK         0x00000007
>>>
>>>        uint32_t backptr;                 /* Standard next link pointer
>> */
>>> +    uint32_t bufptr_hi[2];
>>
>> Not used?
>>
> 
> Thanks for the review.
> Yes, bufptr_hi is not used for siTD. I will remove it.

With it removed:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


