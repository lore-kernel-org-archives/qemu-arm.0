Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359FCEF070A
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 05:01:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpJOa-00019F-PU; Mon, 09 Feb 2026 00:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJOH-00017W-Rm
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 00:00:59 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJOA-0005Wy-T2
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 00:00:51 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2aaf9191da3so2007555ad.2
 for <qemu-arm@nongnu.org>; Sun, 08 Feb 2026 21:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770613209; x=1771218009; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BGE/+xwSc4Hh0s32nfOa3ei12tI+LjHdNW7Uiw62Kqk=;
 b=R17GW9OvHihi6n2qIxpli5IhE0JbwewpNMYSx5KueCdFL6LulAJ15iPDU5eZJ68QHn
 5NCbqXtwzbWA11j2Raz8iQt72rm5Bn6bjIAiwVb8Qmq8TmzAjcwnkpBZnZClnuzCAF5I
 B01JJryRIF+x1D4CzIoWvoOtBGN4hH0iTx41R+2uYIcegQwr0ZzPX/0VKIxhp7Z3STZD
 FcNuwg7gpXhZIWUwPxwWOoQmqdAXV2XVrA9l2nkcIytQh74T2Dj2SLT5SWhMdJlSYqsZ
 r4yNOtUWTo/X0LPLU8o5zU//Nx2wAW9hOTOTLbmaDwGLdQB6vTr0IKdSdzFbNGVOfV3Q
 QjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770613209; x=1771218009;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BGE/+xwSc4Hh0s32nfOa3ei12tI+LjHdNW7Uiw62Kqk=;
 b=d9mB5r0HEy1/cV5D7aKKRKZw5itDoh/yQ+rWiY5xet4KnNUoZr1vAOcsu+gqJ5PVXd
 0q9DIBeQ3TvULfaocSKSda01TbkXGCVR5U/Tc4pkEQLgnokhag/QLwh0ybuVghTLGq3p
 n5hxlisTlSEIehoF44m4X3O8maJKq9h5Too6aKSmahA/mBU7qL5Z3p4aMriGQN8lhWVL
 ZGDjpYfrbnIxdQy6P4JLeoqNYl4Zkm3T64p3ablBGJg8tTuDgzH/BIr/7gWvfxqjmYAU
 ZcfRPNvZN+V8DOtq0FHSfFcw+bE3nYFKTEFa4CpDFoEo1iO/uFZG6ufc7donDT3cO2cw
 pNmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWImQKvONipYy6uU9mraww/girodNAWXIa1qXNCdz/HcbRXgYzOqgnQtWrbj+KdI+UJiTHoissJRw==@nongnu.org
X-Gm-Message-State: AOJu0Yyul+F9+kjsvP+/IrAtdKmbFlT3dGvlq2V6XPcp82yenR/Acqyz
 iCm7Dl0RiyYaHxY95Y7ycqSGhJrzAR+KUYYlNCuGdYtt2JeuUAXgYHz5JQOWj4HBFRw=
X-Gm-Gg: AZuq6aIKuBf6AdgcDih885B29wrKRU3m5vAn0wCVegBQtTYuCv4m3qI4uJhd+zZAr3o
 oM2tPKBGnTFJHy0GWG5bewxli/EOnG/zNZlRurmAfn8u7N8oFu918W97ESJDj5/mAUW9LJgVSYl
 R6kiC6SsAf975SeQQhYZcH6RLZEIPN/Of9If/8kFw7jz8lks8d0lDx3IsREsKxVNCoG5Jzh6MtT
 8eDZ6bFaetdi4NXJp3qaC1+UxCAplriKFwTkaEV6JrIoUW3WwdKJOnkAJrIC1oytG4j4Z2+xYdt
 hcqnoYNl6EqpTgffw69fIygzq5J4pT54w4b7MPCook+//Li7HCpP/2Y6G3zv4rQRlxzsfRZ6GMb
 /U2976pRuqrMWL0Gsodusp2DaQcdk6bS8MXZgzbnPR8sXe4+WlF0G3ciMjqFkb0d/pyemRrtK4X
 fDg8sdyoEvzlIZZL/tgOPKofq6qj8CETPFJl4ik/XmRRc8/Syh5zdWvR7LXe7BYbKrs+B1JeUkW
 A==
X-Received: by 2002:a17:903:2ac6:b0:2a9:cb10:42b with SMTP id
 d9443c01a7336-2a9cb100973mr62690615ad.44.1770613208567; 
 Sun, 08 Feb 2026 21:00:08 -0800 (PST)
Received: from ?IPV6:2001:8003:e109:dd00:9c4:a3d:914:f9b?
 ([2001:8003:e109:dd00:9c4:a3d:914:f9b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a952217ffdsm104199295ad.88.2026.02.08.21.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Feb 2026 21:00:08 -0800 (PST)
Message-ID: <6c5eb308-56e6-487a-ad7b-8f0da70ab7cd@linaro.org>
Date: Mon, 9 Feb 2026 15:00:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] target/arm/tcg: duplicate tcg/arith_helper.c and
 tcg/crypto_helper.c between user/system
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-7-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260206042150.912578-7-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 2/6/26 14:21, Pierrick Bouvier wrote:
> In next commit, we'll apply same helper pattern for base helpers
> remaining.
> 
> Our new helper pattern always include helper-*-common.h, which ends up
> including include/tcg/tcg.h, which contains one occurrence of
> CONFIG_USER_ONLY.
> Thus, common files not being duplicated between system and target
> relying on helpers will fail to compile. Existing occurrences are:
> - target/arm/tcg/arith_helper.c
> - target/arm/tcg/crypto_helper.c
> 
> There is a single occurrence of CONFIG_USER_ONLY, for defining variable
> tcg_use_softmmu. The fix seemed simple, always define it.
> However, it prevents some dead code elimination which ends up triggering:
> include/qemu/osdep.h:283:35: error: call to 'qemu_build_not_reached_always' declared with attribute error: code path is reachable
>    283 | #define qemu_build_not_reached()  qemu_build_not_reached_always()
>        |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> tcg/x86_64/tcg-target.c.inc:1907:45: note: in expansion of macro 'qemu_build_not_reached'
>   1907 | # define x86_guest_base (*(HostAddress *)({ qemu_build_not_reached(); NULL; }))
>        |                                             ^~~~~~~~~~~~~~~~~~~~~~
> tcg/x86_64/tcg-target.c.inc:1934:14: note: in expansion of macro 'x86_guest_base'
>   1934 |         *h = x86_guest_base;
>        |              ^~~~~~~~~~~~~~
> 
> So, roll your eyes, then rollback code, and simply duplicate the two
> files concerned. We could also do a "special include trick" to prevent
> pulling helper-*-common.h but it would be sad since the whole point of
> the series up to here is to have something coherent using the exact same
> pattern.

tcg_use_softmmu is a stub, waiting for softmmu to be enabled for user-only.
Which is a long way away.

It's also not used outside of tcg/, which means we should move it to tcg/tcg-internal.h.


r~

