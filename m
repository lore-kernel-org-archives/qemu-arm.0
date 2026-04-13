Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC4DF531DE
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:16:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQVl-00049Y-8E; Mon, 13 Apr 2026 19:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQVf-00048S-VM
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:16:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQVc-0001lb-Pz
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:16:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso77046525e9.3
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776122159; x=1776726959; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xKsNNPYiO52rsK47bvfVpQ37esKQecELlA775ulScZQ=;
 b=pjuATN7NTU+TUr2ph5r9w5jE7g4IJkuF7eFwfieIDxRE57G8WFkOZyus+JfIYUeZNh
 lp6vCnEcVZyCyvq3bxHkhtj7A1IREtyGhMGvAFbta3QovlTcRMrwHrJl2MTHVJZa43Pc
 dSaSrRrVR3XH410Yx0KV4VbPMbZ8sfSBtq4pHityXMiL/5oF0jDbqL8iqr/0mE6TjGfu
 CSVpQ90DlWCXjuMAdb+Gws3FGMK3Nqw8lf1/t69QAmDF3iI2aIAazONowNzotwUesy+N
 pJw0yjWmaOiD2t8QAA+UvVlvK8KSfhYdd8WTNg9rYYdrTEI6fM4u95mhsw6eyWWMhdSv
 oYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776122159; x=1776726959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKsNNPYiO52rsK47bvfVpQ37esKQecELlA775ulScZQ=;
 b=iO1307rMaiBKy84NmYRNpGNWeakWCrhrBKmFf0KuC14VFE6sb80ZAYElCaxDc0l8TE
 JN5bx6JdY7ani6APTZrMoEO/PZQtLGjkM4XpgkL9LPk48znaSVCrqcTmvO3JQBNfh7MF
 c6zAChZRobOCpFnCZMVQ9OUgZHTqfVDozoS5tkbfT+6b39b1BshdACj0UgPB9/rMlL9u
 +VtZY5cfbnbtz3qRq3igUuQ7T3vgUXFCgKQ2stfgjdA5viIQOTMGvO8W7UCS1CTrXKC5
 v0usSDhJiSZk47UIDTT02cpWHxJ8SUt11xKiKahGqGeRhArB3eF2oAT+EqNOu4nOhQR5
 u8tw==
X-Gm-Message-State: AOJu0YzHQN06TwLXXA0pw2lQq4xDbn575GekcIoQgDYs1z4C/KMYRG8V
 CUR3cNIGe22tVZ7b8OJWmVff1feBXoWq2rB/skgD5MNjFnynsdV1dihbQfC+zwK/JWsWntI77fW
 8FlZjdS0=
X-Gm-Gg: AeBDiev6yklyyUOcX9LIli2iUpNMAkienBGKZ1kFcCKnknhC4TF4bqXdUK6oC4rhexa
 dlOdKbdFW+KyI6qZErYGaRF3eE+HO2umawm2fXBiGxMl6zXekqNtzutoHzHiyakdvpV9XWfuXbu
 EVy+PliuPkjKl+pb61SpPTw8S4gGioualcN6K8oAf29eOHTZKAeQUlCLjFcvTsMCmKPpZa73sIu
 4M7aQ8JjK4TlkspBASVqjmhK5HY/BKeEFAdU8S4V8vdZhX/5Ep09ORP7IxgYpa34a6q2Ra7FClH
 Ug2HVVyd4Nk881tS8tdEojS2itLgRbJvYWFMhMeacMudu25T4Wcq8hmcqmDsDXVWU+Ma5/X4U4X
 qzDEUkkWT3ur8EW8IdMi+XUXZ72h/9zdtPGPClMLT9vFTWy0JzhPNsoVzQnRMaK4PAPhkdBPH5N
 Ip8xITfEddDEMPYYZx9UkIhwce3D8oDqk/eDOUULDVlxphm9pKcOLMdxTk2akyfSFUOQ==
X-Received: by 2002:a05:600c:c16d:b0:488:be21:54ae with SMTP id
 5b1f17b1804b1-488d66504bfmr220136705e9.0.1776122158904; 
 Mon, 13 Apr 2026 16:15:58 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d6839981sm106683235e9.21.2026.04.13.16.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 16:15:57 -0700 (PDT)
Message-ID: <b198f9ef-d80b-476c-accd-e6dede79976f@linaro.org>
Date: Tue, 14 Apr 2026 01:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] linux-user/arm/nwfpe: Replace user_registers with
 current_cpu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260413230251.22537-1-richard.henderson@linaro.org>
 <20260413230251.22537-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260413230251.22537-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 14/4/26 01:02, Richard Henderson wrote:
> Use the thread-local variable current_cpu instead of
> a global variable to access the general registers.
> This also means we don't need to pass env to EmulateAll.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/arm/nwfpe/fpa11.h | 23 +++++++----------------
>   linux-user/arm/cpu_loop.c    |  2 +-
>   linux-user/arm/nwfpe/fpa11.c |  9 +--------
>   3 files changed, 9 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

