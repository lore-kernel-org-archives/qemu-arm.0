Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A71CCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:04:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyvN-0006el-HE; Mon, 20 Oct 2025 19:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAyvL-0006eV-VE
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:04:20 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAyvJ-00060D-47
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:04:19 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-781ea2cee3fso4369125b3a.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761001455; x=1761606255; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jTec9NXjNPhqfb2H8I8J4o5vO26CAcSZgQI4J6ugA/Y=;
 b=iDibgYvqr2KFbfxqyXOSGmfpqy3ZBeuAKnkkZHAEW72q3mdmVly/eQuNDLMsUCkV8z
 9AlaRdlHAkgWmhI89Wg//dvM+gM16lJxfRUZ7wsl7H5SQ7Lf2QIEeJiMjFTd3TCA3dvT
 oGdLFKGKOaGruSURuFFsnN/mIL+OVGvVWkVXDt/TaOsiMpbco1zVRBdhzJXh1MBbLYTO
 odj1MpumDHm0tDZJ1OU8xDlHwIkHazmtaWX6X0BN1tL6Kl/DkIDZh5AevV6yCRTRDj7i
 SPloXApj+3AP7g839+24ia39RpaJ6+y3fEWz+Rj8lvUr7XvsYhNymSPGh2plNoT2WaR1
 /1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761001455; x=1761606255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jTec9NXjNPhqfb2H8I8J4o5vO26CAcSZgQI4J6ugA/Y=;
 b=CTjWfHMozkKtfCc7JEnnJC35rBbWgPinYcClIMwtY+/1ZxDpb4rk+oqXb+wK6HB3bI
 ysmjmRSeLUQvGIP3nTUq7aPinteum/Onippt0lHiE4o8VoeSg0CejRU+BBtNbzo1GKaw
 DvJUAFtsyrhv+QvPDu9QEn/vbFAMevEtxLSvJ4H/zei+TTGhHbmSleSi0/nuk3solA9r
 CEVR3+XfXlDfno8ivv2Dn4DDSVlms0+DvCFhw1fbW5C9nwLki1ZMq08vhlID8k1nC9vG
 34eOvIZN/fsYvkIpsFxwVtja+2R6rhmIKYQ8mxFV6pAclyCOUibJOFfwN+R2IHb8vchp
 FnFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5oTMZu3OqQzhBfqDGdr0luzbUX3fo6tI4/uw/4RHLq3aVIhUoXRo9ydGShx9NEmxolORlpIi8mA==@nongnu.org
X-Gm-Message-State: AOJu0Yxja5XpVFE2uHG8pAAdK16fjHbbBhtN0Ozrm9Dt0eFHOlX/eeRZ
 8MCxJUILShxIwHPRP/OSc+ILCQwTOjF7zW6e2O0JvCleGrX23iX1opI3TMOdes5enwFS/3tx9Ao
 hmCbSpT0=
X-Gm-Gg: ASbGncu+sJSvyXqXK5XhqLxh/KCS7jXy4/PimJHa0vX3DCL0cDlolW1ASEUhPch1s+1
 UI9A65R9DDq/An9FbvfKD91bxJh5NAUa2TDl2LgVnkQWNh2L+uhuCEFODewGp/wDBHWbv/7oCjA
 bQtd4GJzl3KSIgxxzTK6QviO3qIbsowEyFP3WN/rjvyzCuTln5sklSQbStUgodVz5OdmJTB58CV
 /YttfvLL5/b8GUONpbMJHHl4Fm2B5V9ktwoiO3jYvkSSAhXOGPvPHBLbpKVI4HfdFNrfJNCDX+d
 rAE864hUkpga+mkbe/rIreClJe95Dy5azKbi3Ok1x0DYCazIMwv5vce3rvre6KkgxwbGzzruj7L
 n2C3Lv4rWpQBk/8NnUP2JgOzw91PO0r8pBVbXGCmMoi4eDaggElhkLWwWmhz0LdzvJPhj/Q/yZ6
 zTi2V3a3PXr2+LVw==
X-Google-Smtp-Source: AGHT+IFu2rj1j7aBVRNXkFisSLoQSMABgfY5OEFHNY4sjHRD79ZEcOEbzTZytRL2aujZAuhkt0uxbw==
X-Received: by 2002:a05:6a00:94c3:b0:792:2dd9:d8e9 with SMTP id
 d2e1a72fcca58-7a2208fe6camr19365627b3a.4.1761001455321; 
 Mon, 20 Oct 2025 16:04:15 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2300f252csm9328158b3a.38.2025.10.20.16.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:04:14 -0700 (PDT)
Message-ID: <d1779577-3198-4361-9301-3af46d8cf995@linaro.org>
Date: Mon, 20 Oct 2025 16:04:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/30] qemu/target-info: Include missing
 'qapi-types-common.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020220941.65269-10-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020220941.65269-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 2025-10-20 15:09, Philippe Mathieu-Daudé wrote:
> When adding the TargetInfo::@endianness field in commit a37aec2e7d8,
> we neglected to include the "qapi-types-common.h" header to get the
> EndianMode enum definition. Fix that.
> 
> Fixes: a37aec2e7d8 ("qemu/target-info: Add target_endian_mode()")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/target-info-impl.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


