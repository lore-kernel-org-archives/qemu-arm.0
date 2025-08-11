Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC432CA0EC4
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 16:36:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVV0-0004aK-0h; Mon, 11 Aug 2025 12:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVUx-0004Yr-6l
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 12:35:47 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVUn-0004Z6-D9
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 12:35:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b7848df30cso3110354f8f.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 09:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754930130; x=1755534930; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iitPnH7BC9FEKDij0hTVv9+s82eF19wI4Dq4GfS4fzE=;
 b=cSnTuLGRbw1oVzHCnbkZ/METNLvJPBa3q4gttMAOlheki8bI+UBxKKB9ljhrUEHWkX
 QyAeS7OZLzznUA9LgsWI55QZiWBGRm+DJwVm/IZiwA+iQ27UCiURRjxs7v3WLcjQCzTj
 W/dtFr8ukrcs6H0ANX+TxAHHFftjr/BpDkdajS3zPpEwLelrd3PTkE3GNqWot/IqJ+Sf
 aqfqggmMvhnjtvBt2ZentdlRJyBZy3JOnr3hlvUgSbX/9O6U7EhYhA7DsJUrf0CCi68A
 sSS1lving0+UvKGuXBN42kKdMtsCOAK5AqJKCV6zZDK/tyI0DArOLp1FF46AiIOtkbZZ
 G+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754930130; x=1755534930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iitPnH7BC9FEKDij0hTVv9+s82eF19wI4Dq4GfS4fzE=;
 b=pAiLesBrVrAfK9ucv7BeY2HuF1T8oVitqP+GuywFF8Nv7wWnWiqED+MO/h72zWR0RB
 5CSHEFSsrS2mfmAeZKBgTv+xGefOo/hfhrFezcj36bMopUAkvpxQ/7ZZMd3z+UuAMl/2
 EpeTlg7Q39spNc8fxq0bemV8PzQOLntqRvxzhSx37k5d0sqDahQ33Zw9ueFjyKVD0Yvb
 JeNqPBiHVEHz/I5/7pPkBl3eeUKrc6mdR8+/Dr1dWegZQVv8ospOv5w+sECE89eyp73B
 O34Cexw4zhL8GmXZ9mSiMryh6ZrCtzRUjn4cg4Tc+jiheC8lBUWA4DxjAJlQBvTCRkV1
 6KAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIQrtToKx7WifO9ETRVX6/0BW4tffxRuTsLzmwgJSoo/ICVkrn8Z6B64YlCR0TWv5mYHDz8F9hFA==@nongnu.org
X-Gm-Message-State: AOJu0YzuGG0Ij0NcyKAVvNoRgQ3L16izASIrMDo4OzKLND2I6kwgL3yV
 ouvgsKl6KQ4X4UOCD9ZsoPrV3rxPx/R2N5Cyv0okVz5tiDxK3072XubrjbyBR1ytf/4=
X-Gm-Gg: ASbGncu7bsHiy57SKC/mnMRHd0uDhpgTBpMslF/OzbBWhxf/wCd6yjh/yhhapPiTMhe
 Knjv8tgs159FHnMOLlRMeeZfVg0qYhWtDP2/uhFqanMpFZQ/lHSuBLlrksNfRU/WUtIO1xISeYi
 DIXUmN9uizTSXH+GmxxfIX54nG3FI+DLr/13T79WuoYeWI8KUimH2GvMsuxHdVQNBzlKE1Wsjgs
 pLOziWJnM8xt+hs8HkXe5eDCXskxt4dTmyydeaZtbvJDs707U03fX0Qhb7kxN0ut06y6eq8ae47
 PfNof9lBPKjfAbONYBv6ldyMQw+vcBo6e3GxUAd4CP/R4ktTtowfjTPBWVb4zVdYxTGLLq0R6hZ
 t/MzKjKafYqs9TGNMOuo6LqB813mFQxGx+y8PLIB82F1x4sLmzJcPn0MF6WITAgVGZg==
X-Google-Smtp-Source: AGHT+IHLaiBuDpvQKBIABKUFe6t4hkNhHEaBy1w7xazNdDrkqtXX+F6z3OhDmSzWXd+7DNw8RTesOw==
X-Received: by 2002:a5d:64ec:0:b0:3b7:8acf:1887 with SMTP id
 ffacd0b85a97d-3b9111c5c02mr192524f8f.13.1754930130515; 
 Mon, 11 Aug 2025 09:35:30 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bc12csm42036510f8f.28.2025.08.11.09.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 09:35:29 -0700 (PDT)
Message-ID: <1041b7d5-36ea-45b9-9998-b18bff421565@linaro.org>
Date: Mon, 11 Aug 2025 18:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: fix URLs in PCI hotplug test for aarch64
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250811162315.59997-1-stefanha@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250811162315.59997-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 11/8/25 18:23, Stefan Hajnoczi wrote:
> Debian trixie has been released. The "stable" alias no longer refers to
> the Debian bookworm release, so URLs referring to bookworm artifacts via
> the "stable" alias no longer work.
> 
> Switch to explicit release naming ("bookworm") to make a permalink so
> the test passes again.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 374a245573b8 ("tests/functional: Add PCI hotplug test for aarch64")
> Resolves: #3073 ("PCI hotplug test for aarch64 fails due to broken Debian installer URL")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   tests/functional/test_aarch64_hotplug_pci.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


