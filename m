Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABD1E6ADF9
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 22:36:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXoVE-0005uH-F8; Mon, 22 Dec 2025 17:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXoV8-0005oQ-Sm
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 17:35:39 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXoV6-0005Uh-IU
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 17:35:38 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7baf61be569so4765465b3a.3
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 14:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766442935; x=1767047735; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZsPPA1yeSO3RwBD5KQi/rftlTaoCCVx+rH8753eYz4w=;
 b=tLnmFfXcqJOQw4RKGl8fkmasZLw/EpxjS8WbXit04ngUpkQOGEIXeZMHhoUiy7VTOS
 8UmeGO/FE/yZkp+TSda/5MjWnwFmSi/rOtde6T8i3swLGsCNZDVj4mRMXN2q5WlCkk2o
 HHXbTzZzEck6Hh01vGsfJai5Rfq0Z+SSg+ELEUrvT5YK0sDM72vFWJxrRY4GeZOj1hUP
 ym3Vk0J60UHT0+GX1q3UZVz9CQCyGm1SXMkEbxudRAY8LuVcZJ2QCEZLT1RQIL00XyOg
 bAfk/ycSdvhnixlAhsI0ix/fIH9zgKBJvsjahj3fHPSag8oowmccK9hYxOxckCugod3J
 UmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766442935; x=1767047735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZsPPA1yeSO3RwBD5KQi/rftlTaoCCVx+rH8753eYz4w=;
 b=UcBfgPWx1ATtnnFn3h+sBAYRumeKvsyaug+eg2PwmUWvWmLfcQs/BvghlGaNN2FzFr
 YXXwWbmFMbsLfrEXT0yfL2Gb9lFTl5L8cUVs9xXTNlOu4PdE4iwSaPIno2BnxAlltN1F
 lhqHyOOjk9M4v0f8TyniMDkEMnh5QnhB7NKbu7RvE7xt8sPDKC4z5Fsp0Ov9VnopQxdN
 0CD6NrwCW5RnRXs4l5s0ZzGDzy7SbI5LF8v+QO0GVKMFxL7PArsDtGdKKKumU2Fxklk9
 XwVelz/HrgwYW6MF7U7jSZBy03BhXYJEuURNsUDKeKjXCa8elh8xdZMhhDCVneoZEGKR
 /F8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyHrH82xH+cFHsNhTjW1zW+Iklf+jg//U756GKu0OX9XQGQVrZiaqYZjg7rasnJF4Hc9X+vahhhw==@nongnu.org
X-Gm-Message-State: AOJu0YzMw7FTnY/SyYZ9qQ09y7V/yDMtPsw3cxI4GhBM+ptouWLfkIHi
 3vb0m6lEmVnPfi/l7kdrGRW9ul0VHDEWN+ARZqBpy0GeVaAyB4QLo5IjwarJJzyLkbY=
X-Gm-Gg: AY/fxX4/PmjWvNqznX53S0v6dVZHa/Be+AYUxwUXJ2YTcuO+M8vS6eSomHuW59w3+Cy
 J/6Eg8JrycZ9CLzD7Ld/eVIN4F42lyhSeGJlbcxM+thboOWO+cAyIRhYIh04Nbg1Ej5EnfvVuR8
 8+cIQoi5B/ypnKC4pWHQhgdXj78BZcBJehna5m41AT5wBgO5GtbwWyp7rU1QPNNDWE4A5njKJPM
 wCGxcc4vF6YieZYsxBOAwRrQxkp9bfQPPs8EQNAk1qkut2sdiUHRVb0ln5/9N/4ZioeQ1UU8A/G
 QHQBUYE59Fli/fvEpEp/9/oSIXf5mlpdePhrmRezuZcCRT4kD1m9+NDlNVujRnFCO9QAyTA1kpI
 lQ+rUJvpuUgKAUt/W/IOb+PxotGDUxm5AVqf4z9rTgY9deMxXFyY5O3h8QQOjVXy1tV8kczFi4i
 AiMcmTaFbHVOCH1Lsl0YWx0EpLrTxHjaQLld0Aya0+Jx7aRS+lcerFFyQ=
X-Google-Smtp-Source: AGHT+IGByNqZ1INfiHJSv1onsUFag//FhDqoBzMy5T7Qsue8pjDl7sD9BhKmxIqzlx0XndyP1ak32A==
X-Received: by 2002:a05:6a00:8017:b0:7e8:4471:ae68 with SMTP id
 d2e1a72fcca58-7ff67966c94mr9703260b3a.52.1766442934595; 
 Mon, 22 Dec 2025 14:35:34 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7af29dcfsm11481497b3a.17.2025.12.22.14.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 14:35:34 -0800 (PST)
Message-ID: <079547cc-a4be-4f17-86eb-a33c752c6ad2@linaro.org>
Date: Mon, 22 Dec 2025 14:35:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v7 5/7] hw/arm/smmuv3-common: Add STE/CD set helpers for
 repeated field setup
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251222124517.3948679-1-tangtao1634@phytium.com.cn>
 <20251222124517.3948679-6-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251222124517.3948679-6-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

On 12/22/25 4:45 AM, Tao Tang wrote:
> This change introduces STE_SET_* and CD_SET_* helpers to centralize and
> simplify repeated field setting logic.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   include/hw/arm/smmuv3-common.h | 79 ++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


