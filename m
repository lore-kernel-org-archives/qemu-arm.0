Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6154FF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 16:28:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHOoz-0000NG-9l; Mon, 27 Apr 2026 12:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHOow-0000Kr-Uh
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 12:28:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHOov-0005Uh-GD
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 12:28:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so7115367f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 09:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777307307; x=1777912107; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lapVIV5YtBRg6C4v29HcHGAO148vT8m0Xk98WzWDokc=;
 b=rJ5W3AS05iXMnNf/Yg0G/0knXp+M/vkhHQmH19VxBhk0CaKC1F5kR+wXiicJbgpxM/
 TBmXCZ4W5okH6gtwFYk+M7cHoO5+rrWJ6Zim0uGPKzVUtnxuceBD7Q0KBjFcGWIFhPeK
 hAMEF9xgQIq3OdOq3be1iu6Cs+Wr9J1nYrOfMn3YD46XSz6fxVkeDNFihtHFSybNS50+
 PL/eYH6xSUT8NQEdZlqqAAKTrjXqqxnm3ivwKtN7iFvC6PzapOhUOnO3odoaXq1P9GgX
 VuhN37pMJMqKQdZYZXfOwox8tZ86YzbmSkmJOMPqjJWwjdR5r4v+ljYPx399jEflqVOo
 /Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777307307; x=1777912107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lapVIV5YtBRg6C4v29HcHGAO148vT8m0Xk98WzWDokc=;
 b=s9tifJlKLoO+K7Ckh/pjRppbNY9Fq9Bij2K3MHQygiiaEsFHNQaRFYwmaqwdGvQ0LG
 5QkKlLZzQu1ZD+xHIgTkoNESK7yQQ+DeccXqJth7Pk6rZa5EosYkQNRBt0Tfw7mdPArp
 +Dp3a42x38iWVCtYpw6dDV5IDBkkAj9G0MN2fFVyS8knlVbmeuB9qo6bPldP9kqlnj0z
 bdIoz4tEkoxJRSfUcR6zRTRGTQlgK1bHrq54R8GIArvUaZ7u/iZgVnrG20tis/8krGAt
 MuIum3HxNaO6xjusD3trUGcQc++oi2At6sCNSCE1VegPBlAW1gvh0BQuFOuhXCxhwBh3
 yXkg==
X-Gm-Message-State: AOJu0YzzZGuZjDCu7P/maWJhvtHUqJk8EeXwv2Cnbr7PBoAvL5pR38Cs
 Srqe9jV8sG1mNkCC11wZoikuoH4ZfqSTJU3Li+5S9C3ecq+Swlz28m1QAU3m3n3Z15w=
X-Gm-Gg: AeBDieu+SfNNtDDotwRRSprrrNlPPCH8xI7uQYB6LFYOubv6Jj6h8TySwcV48DzefK7
 EtA1LlB/IAoA8XQS+012kh/N1J7/IiYd1T4mqmntenkL4cCee6WsmjmsWU44mKW27DwQXlJwfjp
 Mr93vaLvfBXu3aSSTmz8FUlzReIV+QnHsYO5Wh4U6D5EvFNjZ+keyRvnW9qff1YiLq90rH6itdE
 JqdEs396ShliMaY0FMiBdPmr+s5PEmiEqb4vL940RWIPf4ue6DKf5r11EY2XT8Q2teT0gU+kXEn
 +sOUo8CYom/9zCtwt5hh59lMA9JhO3Fa0obF4MC18NSkZhqelb8AxvLv3rGrIYczaDrHlOOyvor
 D6CgVS2GyFZOVpYqvcsURg+l19EKWXnhHlxqNUj5iN4bBgYM9nnruVlNakdQN62WNHH/KQSLFhK
 3Q11bfEVXAT0IbEN9WHDHu41YssDHwo7OM9V3MebiEQlyLrl9gV0fhSMAuw9wUoAkFdX5WQdS2+
 uhZ
X-Received: by 2002:a05:6000:2dc8:b0:43d:6fce:3ef with SMTP id
 ffacd0b85a97d-43fe3dd2b9cmr68379195f8f.21.1777307307400; 
 Mon, 27 Apr 2026 09:28:27 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1365sm86301467f8f.7.2026.04.27.09.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 09:28:26 -0700 (PDT)
Message-ID: <d30a622b-fa95-4ff3-a142-fd2442c8d777@linaro.org>
Date: Mon, 27 Apr 2026 18:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/84] fpu: Drop parts_silence_nan
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_silence_nan at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 12 +++++-------
>   fpu/softfloat-parts.c.inc |  6 +++---
>   2 files changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

