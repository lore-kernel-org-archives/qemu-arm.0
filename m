Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00D3C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:17:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEA8-0003I1-Hq; Wed, 30 Jul 2025 17:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhE17-0005yA-U0
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:07:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhE14-0005kV-PB
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:07:16 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76bc55f6612so220226b3a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753909623; x=1754514423; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RumQlkc7hEzWm9lGIcgWyhIVpphtcbkJHVovvoUjnZ4=;
 b=h0WLpiAQrRt8Z/vaHeVsenrokvDMMZV9F7PGhgCvQREccPvQNb2VILIUKPAvVaiICe
 t1cRhkKemqT8JNC6zAuIMTn5JUKhfbVkyC1pnWpRS7BHGArRO0mdGL8IOyPvrx7zhR0h
 7X1o9N44W1ZJ/7+QlWWAKZAJXpV/jjb4ygRj4rnZF5SNAze/Ati9szxEuSat7fIk9/aI
 aLLOnUK8gnrPWaoCU2KGyLPRCTE54X6D74UW/ueAAJdq80n8HRaMx7UweSG1MyWLAacR
 SfPI9K2sWWgM/3X9hPtG3lMYuwZNv58S+YjbvkkW5DHPmBt68/QPzF8ieWKueaCJmbTH
 yvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753909623; x=1754514423;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RumQlkc7hEzWm9lGIcgWyhIVpphtcbkJHVovvoUjnZ4=;
 b=VGqbLG8OYbk5QpL8jvQ54g5YdSzIkr4svN0Jh5KXz+LplftRs+JLXI2W/qCA3PePoE
 yNWwEe2vRXqfOJLETy0T68xWtoQzARLHqSQPRaD44un+l4cW95k7LQqArUhkgH75PJBl
 aRz+wDEVbhvt8NOjqENkf67Dj/KpM4IeH15HxQSIsqzM86mIgmiZA3dFIa9+yKsoZ3z0
 S7JZM/r1LHaauxLQPorXrk8bJDGOQtpvStQVqAR6ib/PfrWLeSVv37R1eiYyPjCtk2Iy
 sHCCTA3wFoaVbF2+VnlDJOMQQ7cW9Q1JGOJVxiDyAuXOSa8OIYerlmbyjqGn7oHfojiZ
 n2Jg==
X-Gm-Message-State: AOJu0YzSg648UoPMJ2OP0BCrYeJGw9k3MdVmr1k+N0k5/PyF5pUsbxcn
 A7I6yO0TAs7nqZVGOaXIz7hESVjV36Uj+a8HYQ40M69UJCYSlnpsx06PcKWGrpaZSOs=
X-Gm-Gg: ASbGncsccT1pFxdPPtAGPZfZiPOGgZFEhpfL74cFg6DYU/2pqOUPZxb8ecZ7/2i7xbI
 BgAjrtHpcJ/Phjd0XyqEwmxiK1f/7AzbZj5SLyHcixBY3GDPq37AE3QIfsFhjLuad5CxwT8qph5
 H0g4+SFPCMNC+DgCMtgtJTRtNBuPcndu9kCnkoHqDfPX4QYFQJsUR9VlDT/fh4Yplca9w/gg4QS
 2gGdLf5d+jUJInlsSqWPsvnNLT+DR+qkrILnuq2MwWXwJ8uSCzHv8cYduA6aYtP0rcyBAt/eSKm
 rb5aYgspO4H9GfHF1nvwuJT/fwilSW8oQsULaR6OkDXIhb9zzkEWWFHTVml+mw+XD5C0lZefKk7
 DDl2t1uy5BjKT3NGtuJpH8N0+Tv5Wfcpfyy8=
X-Google-Smtp-Source: AGHT+IGcO0/vnDKPMu+1eGlWGp84zkP86iEjhCMKq9XAXdj58hAdUB7o/hLD1rIHCnGLyQfVupJQNA==
X-Received: by 2002:a05:6a20:7490:b0:220:88f2:51a5 with SMTP id
 adf61e73a8af0-23dadca295bmr13671500637.18.1753909622737; 
 Wed, 30 Jul 2025 14:07:02 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6b0817sm9859096a12.54.2025.07.30.14.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:07:02 -0700 (PDT)
Message-ID: <b9cc7220-c3c7-4954-a8dd-996cbccd52a0@linaro.org>
Date: Wed, 30 Jul 2025 14:07:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/82] include/hw/core/cpu: Widen MMUIdxMap
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-29-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Widen MMUIdxMap to 32 bits.  Do not yet expand NB_MMU_MODES,
> but widen the map type in preparation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h | 2 +-
>   accel/tcg/cputlb.c    | 3 ---
>   2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


