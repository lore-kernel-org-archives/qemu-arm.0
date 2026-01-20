Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F87AD2ED0F
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 11:04:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vi9Wr-0006oM-Im; Tue, 20 Jan 2026 06:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9Wo-0006lR-5K
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:04:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9Wm-0003RS-Lc
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:04:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so60875665e9.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 03:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768907043; x=1769511843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W0JD07AZBpN55XM8F3b36pRGyGB8JsDnYlN4Wnuvsis=;
 b=DcU/s+WAJ9jz883OodC0mXZvcP88YOG+0oGTWWMG2zOgUuDULTHyOKJCD7tNahHDIn
 rrVqwUoGt+du8kXL3ylu6mkxQW5TlPttBQE8FurcmH7JB0Gyf658nqMLxCHYAmBXNyQm
 gdWxIotkRIlshU6OZvXdiJuWWlBX7fwQlLPWeHAFmlaGm7vfzXYXlIF5noSHD8Fkn3Bi
 GtsGHQc8PZfPsCmqhjNagn8mfwvK7ZFG+y3Gco6Vp7W4chX06mEUFmTtYNhDNoI5J1zJ
 RAf2UNNPr2ZED7UjWnDf29NyhWn9CwA/fe4kQWZZ4ux3SooUymgGVfEcTu6KXgPq+bIX
 DEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768907043; x=1769511843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W0JD07AZBpN55XM8F3b36pRGyGB8JsDnYlN4Wnuvsis=;
 b=AmOyvW/iXSz7PWmgnrnVy0+7DLAxSevHfyagbZwgA+J6GHfcIT90ltB/aWonrHGa1B
 iaSKMl/PUaZ4/on2YA9s/swyjXvpkD3phiDPjS9EmGkyWY8Sk1SrHTaRXBKwXYvWcTZ7
 UiPz/XRukXqZUQ59SW2LLPV8fTW3DK1xS/a4p2PvUqL/UDBP5AiV7sD/o4KpKnQpWCUa
 Ji6LdyFS61LJWqxfr4+QRXuZpTm4BejrRWRRM5SUGMEpsQc28Fnkz1VO+/CTLtVnz1WH
 m7OjL9QE2lBbt8VsTLoayleIKpv6P6hVmvwQsaKNcxnWYx4cJf3gXoWb/UqiKe3Rc9HU
 gxuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvcduVjF8lgw22Fcs/vFd0MzISnlKziLJRpTGek+ZXR22Z7jIGmULNoudwi2qe6j91N18hFiPw0g==@nongnu.org
X-Gm-Message-State: AOJu0YwmUMrjfEndGkttwkdAnkM+heKmGVTI9Y0dwIhW3UufKMjlmTFn
 eWAJVWRP3tuUMl17ukgTwsSjQy2afpC+O/o0Kkas4a4f4V6cku2css6KssuSp2VSiyg=
X-Gm-Gg: AY/fxX5j5uhTinQehzQTBxZoIR6IRei4A1mmn4PMDxmqh8fgeoxvY56PrhFex1owddq
 7/0sV5cvO911q2YWcjP6auB29qgyVHXCbzeA478a6s43t4Ag2PVhrCyQvqg1IHnrpe0xLmFHE34
 5gLVUkGLhjYhc/9LJUP47e4ZbH7tvdLWwwnJ/CMbNOyQMfh1Rvv7X7Nq2RpCiaxiZ2GkK+aT+FB
 q1LmiCu6jGTpYM9bYbidHzj/P4alNSh9kHksq8ZrsKBZhUjNp/owpEEVBTgI8/IB2/6BilFjj9u
 JAbacg55BZ+LXPzw31HwZUzO0OI7IFvINbpoTPJZiXWsKgLn2oGT+4aEJHbn/S+YEJfUpMEQfxM
 VozqGtZeaMyf7jEeGGl3faJS0xOk5i6caB5j/sxZH7oSh63bf8RBcrp6SUAkDAnzizM0bYhh4II
 tM303hMa3pVd0DvL+ak1zFlT36ZH1BYVq4e4OSmoZDSAE/Y1v/oxfNNA==
X-Received: by 2002:a05:600c:3e12:b0:477:76c2:49c9 with SMTP id
 5b1f17b1804b1-4803e78ff26mr16841915e9.2.1768907043040; 
 Tue, 20 Jan 2026 03:04:03 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4289b789sm299768515e9.1.2026.01.20.03.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 03:04:02 -0800 (PST)
Message-ID: <a4cdbd4b-f780-40d1-9e41-3c3ecea54720@linaro.org>
Date: Tue, 20 Jan 2026 12:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 24/26] whpx: arm64: check for physical address width
 after WHPX availability
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-25-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116135235.38092-25-mohamed@unpredictable.fr>
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

On 16/1/26 14:52, Mohamed Mediouni wrote:
> In the case where WHPX isn't supported on the platform, makes the
> intended error appear instead of failing at getting the IPA width.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/whpx/whpx-all.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

