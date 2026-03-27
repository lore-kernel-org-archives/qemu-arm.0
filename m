Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3244510F287A
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 23:25:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6GYe-0006tP-5A; Fri, 27 Mar 2026 19:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6GYa-0006oS-PU
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:25:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6GYZ-00070o-38
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:25:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-486fba7ce4cso26811215e9.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 16:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774653933; x=1775258733; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XwAfQ3Cnq1v8bF/Y/hZpVxKRlEq+QFJ+8VzSzTqam/M=;
 b=L74l4g5mfTG4CApDtRCK6xaLVlWyNleF4/xFEIlmt88uLiiyusUvbzEHfrGteZULUJ
 oEECp5i9KG6NAlrYmOQDq79IcJRC0YdII7vmkgcPNAfDzFFSo+4qODINhKy1wB2Qbd+M
 Oq5CgA/cM1MqKImBpwEBAeEKlVBRUIqz7jtt/fr5bDF6UlCduZbUpVeX3aQ21vRb0Y1U
 1f14C116ncq6LEFevygb8xnBunRevJuSTTnAyW1ejVbWX9nuQ2xi733jzhwYwi82NFTp
 JyWvjlbFgremKMbqh1voa0Bah0ZJJMco2ltNy92OL5QKCAmj2lQ1f3Ge+S9W35TZN75i
 DNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774653933; x=1775258733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XwAfQ3Cnq1v8bF/Y/hZpVxKRlEq+QFJ+8VzSzTqam/M=;
 b=RT1TaHKGFLNMY81YubcIuPsgkn92Xj2TBkOqSCqMtQxp9vfLoS3r9A57Gbiv97Ra8Z
 aQ/Rd/Vy+UDeXP5Z1kYtuuaW3iDmyM3MpJYerSOS7soEZnrMtK8zJYXc9g6IH24IjeH4
 D3KYr4bZlAA7s8hhFpyxGyCwZ4/Y2gzHEg73cPP0S5mqV8hcek3kCTUo6QG6je3UtPi0
 W+WYU8MZDjGz3Jl/3HtKIxtaOon8oe46EUL4as88a5ckAXQZlZ+7IGhZ9pOwpDuyKT/n
 1kiukmeC95KcEXXWIm5OVX2dkjqmmwh98C1qFATquQzyGB0EscSjzE1tsJy4xrYoT2EN
 QZlg==
X-Gm-Message-State: AOJu0YzGdRNA/ftPYIDISoSro2GkJdkzzG4KXdxCbHZVGT8ZW2x1S6+G
 AEeQqdJR1MjBdq1nq0V1tGhLD57NPx1iH7WfXUjoXP89Caftvj/pXMokK0Tm3Xi/sNo=
X-Gm-Gg: ATEYQzy6Mle9iJkbOwmZVtXd/LpQMHgheZZX6C0VE9LcUnatzsB3EqSpBDZowHGhe8X
 dFrKsdWo2hdkmDiSjQUrkdoQEdCzwhaRWedxGmWQIazQ9YcVOHHO2EnQ7L07XFbbZHnoe31pJ1U
 4KiOwJt/P1xABYyOqdafELh3NeSJ7a5fWWw8IWC0gb8RZJupzJiYIUk2133VsOw6IolJnnpa1Ie
 ANFA/8K7C8MaJ/p2l/ZgFqddXhjTq5GC8Bh4sy5T2N9RELa7eXJpLOsx8GAGA/528KooPRcc8Pl
 n7Mo2/7oQzliYTZaVGzbzIk5+KxtEtfulqxJ59hq7GW41ujQUrAQNg37Cs3dnHl+sAeB8xAz8Sp
 Ihp0XfswdFR0gLAqVAslLoGkFvA7qVoM9RuvI9xbPZ+ROkmA8iGmoeXJidotqEmdYsc0JdTgVQZ
 trppT3TDaL+JSsBBxBdgEab87ojBRIbDr9JfoqxIW2SvxO8ULjqeAcBH2We1f7/dKDQy53eBru
X-Received: by 2002:a05:600c:2d4c:b0:485:364e:9328 with SMTP id
 5b1f17b1804b1-48727eda499mr41036795e9.16.1774653933432; 
 Fri, 27 Mar 2026 16:25:33 -0700 (PDT)
Received: from [10.202.147.66] (147.149.216.82.rev.sfr.net. [82.216.149.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48730688694sm10508295e9.11.2026.03.27.16.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 16:25:32 -0700 (PDT)
Message-ID: <a6f9b903-8326-492d-b639-9058c8d8f935@linaro.org>
Date: Sat, 28 Mar 2026 00:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] include/tcg/tcg-op: extract memory operations to
 tcg-op-mem.h
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-2-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327165042.604105-2-pierrick.bouvier@linaro.org>
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

On 27/3/26 17:50, Pierrick Bouvier wrote:
> This new header defines a new type for target virtual address,
> independent from TCGv and is parameterized by a new define
> TCG_ADDRESS_BITS (name was suggested by Paolo instead of
> TARGET_ADDRESS_BITS).
> 
> By default, tcg-op.h include set this define to TARGET_LONG_BITS, but
> it's also possible to include only tcg-op-common.h and tcg-op-mem.h and
> set TCG_ADDRESS_BITS manually, which is what next commits will do.
> 
> We preserve existing MIT license when extracting this new header.
> 
> Implemented from:
> https://lore.kernel.org/qemu-devel/a68321f0-3d54-4909-864c-9793cda05b2a@linaro.org/
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/tcg/tcg-op-mem.h | 126 +++++++++++++++++++++++++++++++++++++++
>   include/tcg/tcg-op.h     | 100 +------------------------------
>   2 files changed, 129 insertions(+), 97 deletions(-)
>   create mode 100644 include/tcg/tcg-op-mem.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

