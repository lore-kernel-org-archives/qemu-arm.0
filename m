Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A751BCA0EE4
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:34:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umuZA-0000l5-A5; Fri, 15 Aug 2025 09:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umuZ9-0000jC-6L
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:33:55 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umuZ6-0000zb-CG
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:33:54 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-76e434a0118so614864b3a.0
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755264830; x=1755869630; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S9kBEZJwRHdS1z6l2jhnNM5qi6DDBuoPnjz3YSuWe0U=;
 b=Povq678g1ORGI+GESUyrXedv0gOaURC7qkZSzyF+0JB+p3K122gSi0eCodqu3/8Cut
 3dJgzoxhSfL6eOSVQEYsmTQ88Rnnl9fTjQiNJoJ42xTWFHv5UOzTiI8QiXqFJI9klH9o
 sioIR1qiWz1DG1krayrH1wgKCRuqYB+puQMKM+NPx/Lsu7QssFTVYskCwyY6Mre+0rMh
 tNB55gxMnrUfttCtdZBn4CUjOSOqKGPfSjFO6y2LukuBEMB8sEbbhMg29agS1Zbdn7ao
 HUp6q7YSc3hCtgg+vTd3eYrYf/7FhZsLCP7CaXQFFiD4Sh2rbdZnhNmA7cPAhcCRyfrX
 ZsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755264830; x=1755869630;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S9kBEZJwRHdS1z6l2jhnNM5qi6DDBuoPnjz3YSuWe0U=;
 b=EPqvTi5TbyTgm9opocFsj4mSe6TAOJRzizqlKHG91965rChmEl9GVpfxhukusQWWjF
 iq15hYe9NlGIqTrsDiS8pjFW0W6zrqILxq4OWP+ACgcioy8/Yd71yuK9px8jua+ghqTV
 YIpglqVYAQjxXz7wOr5vl2xehxhelFKC3cSMOBzYe/VjxNQNEPRVRP4DhfJbuI3qUISj
 0qhq9qVHaRIS0C9mYBL6KwIsxJilo58Vd3EUzPYJD+uJbfPJDOPh0vzWP7dlwOpdKZd4
 xUQJCXmUtb4iZut8Rllnclx3sq5Ljy6Ey7RO28Qe50TKvVtjDmBf9OWC8UIPiCs0VdEb
 mlHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb3zuxHyEhVxHcdynIMJ3e87Ekj7TKIh0IgoXKnPhnB8UEcMZHh7gnoInwLLIL4/7KuVVFc+9orA==@nongnu.org
X-Gm-Message-State: AOJu0YwU67ilbjwjvOpTNiD/UDb65CGHSi6i3F+eUodpyVdNENmlkNwJ
 yyByJlRi4WNrEp6h/0bbdpNRP/13A1rXomtszwu/2ZN38qu/nCOWkI7TYwHIgK4ZV8OATnzXdFO
 k96zNjL4=
X-Gm-Gg: ASbGncuhgKp34b9I9lsjLOmR1P8XHVe2U8ZB9SG9rDNLHdKNhDiQi1eUp2o8LGXlKAU
 /r8t84igeKIJzQQSIHU6q/9M0XOPennfaFHfAVeludhJWkWcULUvGJmi6M66w3Rmx4A39XjnUOE
 p2q9S364J2PasYZKQA/Op+eTbrz5vZhng/M2rQixfsr3bHg9PsQWzw719R6T9sHBqQIkIZHwMSi
 8JGVxauit5OOkxB51ADinHTqUVsdPobmWFzJYnfGFz8KtyRePOxdpDK1g5/djatultojblFuYew
 xNtS/Lprrp1MqdQ/QZN6gUNMZkx2ayte+RjX15Ax2em5V+KHGX1tdUMudkkwvKZEeISXOagId+K
 YwG9AIWseqGL6KBD5lQ+lQ68lXTbBHctD7RXge9w=
X-Google-Smtp-Source: AGHT+IG0L7LCUw5MQGb0s8R5i3Y65m1vQ48A9MjiYuJN2C/JtyyvtUtPqIjH3VHjhHZx7hFjzGd8cw==
X-Received: by 2002:a17:902:f68c:b0:242:126:476e with SMTP id
 d9443c01a7336-2446d866ae5mr36519825ad.32.1755264830091; 
 Fri, 15 Aug 2025 06:33:50 -0700 (PDT)
Received: from [192.168.4.112] ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9d016sm14475025ad.35.2025.08.15.06.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 06:33:49 -0700 (PDT)
Message-ID: <2099c9ed-9d2a-4820-aab7-bc942ca44206@linaro.org>
Date: Fri, 15 Aug 2025 23:33:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] target/arm: Implement MIN/MAX (immediate)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250803014019.416797-1-richard.henderson@linaro.org>
 <20250803014019.416797-3-richard.henderson@linaro.org>
 <CAFEAcA8YsRWk-dFMpnMc7ZgJNhOH5WuqHkhJ-0g2WATE6mAqdg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA8YsRWk-dFMpnMc7ZgJNhOH5WuqHkhJ-0g2WATE6mAqdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 8/15/25 23:18, Peter Maydell wrote:
> We end up doing the zero-extension twice for the 32-bit case,
> once in gen_wrap3_i32(), and once in gen_rri().  Does the
> extra one get optimized away ?

Yes.  That's what the z_mask stuff in tcg/optimize.c is for.


r~

