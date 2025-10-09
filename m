Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB25CCD185
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 14:05:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6rGq-0001yg-59; Thu, 09 Oct 2025 10:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rGj-0001qa-By
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:05:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rGW-0007YS-64
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:05:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-421b93ee372so553035f8f.2
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 07:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760018701; x=1760623501; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2T7ZQ3/lLAk3M29Bew4me2nM4QAug5J+UBD6PqRtKlM=;
 b=nyXpBEj9tmuxANpWgooD7kXLA0ztHUcaFISlgD75yM+cFOsKKl2f26nwRxRD9lkDka
 PeXKKg29Ayp5FZi5ME6iOyJa2ChtBCP1AvQWnu7vhcUCDvbjQ3ntt6joHvwYcn5nmajo
 KkBBtHGwdvQ7GBdUhZFLbe8POb4+NoiTGPmWbnhwayBJ+rMNV6lrl1dArvDPiPbhbrP2
 PVwcRzoMraebSwNRiaaWBRMUSypo6OgX1BL0K+jQldzjpegMWOKrCZAcSZ3iE+1ocFfd
 lso1y3p+BgnsdQqToUWX9W+hxLypVUNnziKNj8TCwZYt2ULqJzH1qD1C79rdwgdT6B64
 ZAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760018701; x=1760623501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2T7ZQ3/lLAk3M29Bew4me2nM4QAug5J+UBD6PqRtKlM=;
 b=ZYRBLqsapmd3eVtajQ05IJjtVl0yuUv8bsv9xm7hKSArCzOLZUtPGGI0ZR/FEQrGNq
 16Zo90JJF9dCKjRBWM4C7+eKHy20ooV//+dodfT6cFjmBYD3x1wEcgyKaTjiJfwcptgq
 qhos0vtcdYw/dGyVCkHAXA9xDTeK27LLCnxOLXhuwNecViVYyVEMD287n60FYasJnjxV
 ctNNP1dU401LW/k6YikJ67heEmk9gkEfivHYnC7TmVBvGIUiGX1r1L2gQIO7zcbpFRzG
 FXCyYGOvjF5qY3tQgJPdpugcfkCbJbI9b39wx5KQBhHZWhfxghObZQeWAf/WlDLDHRhx
 FUGA==
X-Gm-Message-State: AOJu0YwOhupBH+Ito0HKs3j2vtKr9d34oxXMzXHCw8Q58xO8sd6pZ5u+
 CsOfwv7Apwx/L+qikYskh67Laz8pTxSpQJWdjy46Xsskx0Me8Mzs/+DWq1FyKUqnJOg=
X-Gm-Gg: ASbGncsBnPGzPHCuo4PgZaSWQ5d415jakqEAX9DoWHJK6w2XrOt258fjFgnCWNu8fhJ
 D1le2K5aIJKp7zCKASbTp1HjP+t+Pqt8vm7tz8nFmteQQRjdK8R7zdWHSwGyfwbe2mpG6o2NIgY
 jgnfaXH8ZqdbObmwQ+Jh+kj3Tj2eY1LK0Je4MR///3B5LKwfCsvj3hDnXAlzkMMm8VZlEhlesP+
 6G0A20KrxIorWHzeN15svZzEGqaRIZuTJqvI9P6PH6X/zE3FZgLC6wPQWdQtBcC+PuYCgGVj0b7
 adcTWwtpaQHLCL1wCaiXj8CSxEFzVfQaKfxXfhsKch75UBrf/wt5EZaUEnNHO0nZlamQ/F+eC9i
 hTiQbjifNhMU1kTkJH/+fMWCZiSZCkLmKFX08/XtqEyDuM4+RoxTq5dvcQhRKdVVpKgJd8myJ9T
 OvMy0qBuWjz0cMYXYfhA==
X-Google-Smtp-Source: AGHT+IFL/QkGzZg8pfTosLEZ4pr8K4/bDy+uSfoWIsrgLxbYEqIx9b3pYLAlVOiE4JiuB6LNqqbUBA==
X-Received: by 2002:a05:6000:25c6:b0:425:8568:6fd8 with SMTP id
 ffacd0b85a97d-4266e8e688amr4889728f8f.55.1760018701264; 
 Thu, 09 Oct 2025 07:05:01 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f01absm34588922f8f.44.2025.10.09.07.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 07:05:00 -0700 (PDT)
Message-ID: <a3f5e334-0fdb-4e8e-a88b-469e91b36603@linaro.org>
Date: Thu, 9 Oct 2025 16:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 40/73] target/arm: Split out access_nv1_with_nvx
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
 <20251008215613.300150-41-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251008215613.300150-41-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
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

On 8/10/25 23:55, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


