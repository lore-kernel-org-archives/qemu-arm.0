Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E2DFF8875
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:58:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIA74-0007oS-Vr; Wed, 29 Apr 2026 14:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wIA73-0007o0-Ix
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:58:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wIA72-0006OV-3i
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:58:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so69908f8f.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777489098; x=1778093898; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MywGsl6Zqd2GkRVneAtWnLJaVY99z96aO2sZb0jIuHs=;
 b=Bv/IW9+JCJopIRVANaig5pF6xSPP66mRNOjF7q5HfSYthhn1GI9OpKTw5DZHQu7WxN
 WFRyWvGol5tS1Ztmmjnu3qkP+3pTLnuIh1uYQXJuXrBI7OLR26kKiI4kkEyoBwi1lPWD
 4g7W0QaRWjGWmak92vT6Z9hBAKbKqBKJeWvmyjkvHqYnNEA7M9IbW4+u7NYUiFFmAiMC
 h7mjiMzE49i2MtWEYNd4PpwX5RmU4KxbUNJiLlRZ/tKT07Mb9WzGk/qa9KyfaEy65ENp
 A+yQbQb+F4DzOHoJJg2ElZAwjSJtHjoJdK+kn6b9fPOIVRVQC/1JPI4lKHppEvzpCV/F
 F7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777489098; x=1778093898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MywGsl6Zqd2GkRVneAtWnLJaVY99z96aO2sZb0jIuHs=;
 b=EgJtvnzTIg9s2MdI4iucPK8CDh4P8mysCOtIThp51bnGGOeApt+p4e7orx0sQxzeqO
 i3zlSjcNu2Q8IUp7HKJgLwweofdjdwSYN+Zv5TyVyJX1kCD5d7G4ktOWqFBKnYxupD/C
 Tg+9/uN2UsydW5/wKHXPjaANyEysp2q9M2Di/RVhJgL6HCN1Rdl8m86KdZRwFDQKrzjf
 Ac3wwf9O0l7oUvp402ge3DpZ+G22RmN7leI0fToratdArSXQOuZDtbx8e68LeIWcZfkW
 NEk++EUqpN102DVUafcOeQmNwK6Ndcsv+1+8iMvWc22GxzFMyA9PTTw170uSs9sgv68/
 qRYg==
X-Gm-Message-State: AOJu0YwzcZ9OUzLiFQDK09nNXbPgVo+f0co/SaGomxlWsoAI0KZk0LzJ
 9RzVpKrY6h5FP3tyA9Q6f+XuTXQVa87Is9tIHyTggWXiqTnN9mA8O3kZp1S/rhJ70eI=
X-Gm-Gg: AeBDiev4RrLMnHOIpkyDm5lQoGM39ftzBLnlzT0g4SsrWu3Njh6reoNbPj8hUrOEVDV
 aB049NAIYrj1JbkxEz9sgpvoas+5yNXUnWBvQ0iiUU5QOjc9bkzl8DGbFM+timQ92WMYLW0zLrc
 UNK0JsSLdySkvYNVQaZ0dyFXVauJtTQA5FSz8d9zOECe0z2Xi2UoJ0EYHlw89Dbme03eQQpzo3j
 hvmSAqfBrgBefvPmySGOzhF1yjA5ZHrJeKaqtJKMFr03+GgSENO7fB3H/EugOCMW5pzCc85p9to
 OWGPDzxgzPEQVq76FoZ5QtZhPebe8excmyDPwDO9lcc8SLVI/Bq4MvrZZh1zVS1wsILjF6dBJJY
 zyuLIXFw5SGOqLk3zuQVDkwG4AHFqzrrom3Wam+lF0mQpXq1OYKi8US7H1nsw2+4jE8WAb+ZIiT
 iNaOzto8/vJRon2yYIwaLkEQahAcO/c4BkQLvYQy4LfhoXA1TME15exmi5eq3Z3FMpx9EDtQAjY
 ndu
X-Received: by 2002:a05:6000:24c3:b0:43d:7828:1f81 with SMTP id
 ffacd0b85a97d-4464b86e6a0mr15557529f8f.41.1777489098181; 
 Wed, 29 Apr 2026 11:58:18 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b3d481fdsm7818813f8f.8.2026.04.29.11.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:58:17 -0700 (PDT)
Message-ID: <3212c718-73f2-4f08-b78a-f2ef82066255@linaro.org>
Date: Wed, 29 Apr 2026 20:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 48/84] fpu: Change parts_float_to_float_widen to
 parts64_to_parts128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-49-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-49-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Rename and return FloatParts128 structure.
> Use switch instead of 2 ifs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 39 +++++++++++++++++++++------------------
>   1 file changed, 21 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

