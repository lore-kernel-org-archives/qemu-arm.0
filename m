Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4A1CF45D4
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 01:25:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfT9o-0001Dn-7A; Mon, 12 Jan 2026 20:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vfT9k-0001D8-GF
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 20:25:13 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vfT9j-0002ox-33
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 20:25:12 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-81e7477828bso1763903b3a.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 17:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768267510; x=1768872310; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XiQK1KwnkUSyuyhtVy+kNGdeCjbZ9iHhdXohnMaXpU0=;
 b=ma1WZFnkhfXL36lqsEveKMzmIdIC12GRYtMOjvMh48uDFGqytgo+H/2JjKPRfgeJOw
 7RyHR1jj4dk/2TkZsm4DMac1NPc2Egz2VdE3fGXWDicij77WYiYxQSEKnPxZ+7w9bGLB
 f1YGxcCPp2X4vaqBqKGzXyFdUjTHOx2+kyZb60bfWxSnszR3s0p6cKQfCccjpgdBAiWK
 tv67tL6nLmjudXVjJtKou668GEV+zHwCAQFIrk4JODLivZzfjRQaIKbnISQmU8B0ybg/
 R1J3YoRuIpXMmnAy270BOCJu6newMZR9Wa/D/wsBrmC4Fj2r+ombhOt7H+z2l4te8PBK
 21pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768267510; x=1768872310;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XiQK1KwnkUSyuyhtVy+kNGdeCjbZ9iHhdXohnMaXpU0=;
 b=T27Og08iPvMspb10BZ8ErKVbyQMxwwoiFBG4fh7adt94g27RQab0F5mBOU5zo2kwFe
 Q8tJ2lDcufGjCRD8sT2ESkn8la3T6mNzygQ/55iqbJENvpgW4t7nyhDr18ak6rNZMTE1
 XbTDZXswoZOjwSEPCI9S+tsCMBfKo+Pf6OQjJlemO45RlttvfGo+qs3ALIq9gGXU81vz
 jvwdC303wTB0yV7h4YlY8N4davjM5yi3ECQCqFmMZajIDz+CL2aDFXGKJ3tSwdMKoU+b
 PcccRaODD5rivq6tP8jJabWNCmk5XtmI+uniH+VSNn90iL7vGtVnG9j+JCoc9sMKwpNZ
 289w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC8IlcR8IArRW/GGEvDzwTFtbmUsqiVnGIBwWH8B7jQVT/rSyb8FwCReKUVId0YQ4tooDiyVvmHw==@nongnu.org
X-Gm-Message-State: AOJu0YysCi0anewos5Ph7/E56KgUejchhaNd1cKk6/9c8Tzcr2V5WJWB
 DUYkggq3B4mm8WRLOyfGY1DLFZgcx/FuviSyAMVYGTk0jC2TgtZJkRR3ndGlgPtcGoA=
X-Gm-Gg: AY/fxX4om3/uV1TMxr5NZxqTOeNgnEILEulS9PZkEmZu9ys7KPvQhe19TzSHW5Uosrw
 si/8uavAfN0lDot2nRq0Es2zbk9uRkKhzNUkAqRTK+uaWUDb3cJm+jxRaVndlGi1vqHmnl15Clg
 6hM/TQfay4yIE5Kbt5SLdRuAe3v/08L24ItTj4qTDTM8LO9X0XAM62ttpCeu2G7dlRBJP6YG196
 a8u2LbvF4IVuDFkD6pwsC/TX27eFWi+2SdO3qhbQHgXRR/ycAs2VLoQUsHO+6LP5w6ZpeCikC4s
 apI/99Xk/f4QzLhJ0tMIAvUEwZp26LIO+Y2JH5ncRc3OzzcpB1G79FUcw7Q9SBalzhEQaM2DA5G
 aKvWYwyLj0qcAtP1DyL5Ya04GawjWR0YbelbMJh6lcm5vV4MjSW3JoyHTsV1/3//imOSSjiQvoY
 2XtqdxH9QwoMNsqP6zIthNfhpUA8w=
X-Received: by 2002:aa7:88c6:0:b0:80f:4667:a94a with SMTP id
 d2e1a72fcca58-81f6f74ed6amr907776b3a.10.1768267509494; 
 Mon, 12 Jan 2026 17:25:09 -0800 (PST)
Received: from [192.168.15.8] ([101.187.175.172])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe9b8dsm18571634b3a.22.2026.01.12.17.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 17:25:09 -0800 (PST)
Message-ID: <88d53232-08e1-499b-9b52-b307ec663719@linaro.org>
Date: Tue, 13 Jan 2026 12:24:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/12] include/hw: expand cpu_reset function docs
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Zhao Liu
 <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260108143423.1378674-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 1/9/26 01:34, Alex Bennée wrote:
> Add a hint to the developer that this should only be called from a
> reset chain.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/hw/core/cpu.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

