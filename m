Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DDECDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 10:20:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wchBW-0005a7-1h; Thu, 25 Jun 2026 06:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wchBO-0005ZZ-59
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 06:19:44 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wchBM-0000lB-7U
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 06:19:41 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-660e9ff0587so1319756d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 03:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782382779; cv=none;
 d=google.com; s=arc-20260327;
 b=QpXuaQ54dRXacm0Ld/LVjT3NaVFEPzszhYBMly/KShPGD/U6+TBaY7FyhOS5Kgdv7t
 p8/dFsxRzPtxYa5DaBMik8AiCCJSUQYH04HTC/lNG3ys5W45WXBKG7wYpZPqLL+1qtKJ
 jYNQp5UjvHk7EvX74eeOSswCd7T+BhybkfQ29979Pkli+b7jiF+MWxRdQMmoe3rOwANF
 UrO8bERXo/l4YuP48C+suAIqIQvDp15kg2/irY5OWlQazlkC39hH9N7KE4ZQeqYJYXd/
 dxYBf0f6NztMenGgzjFzblWfcj5WvS5HeQAbyLaCqHsfEk202pl9C2YY8X7swUvH+Wyg
 CA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oaAzqeAzZY7GNKiLs4DAejh6EqxG4sx3r+N8tUvF82o=;
 fh=v3LAyF7EgKumITQGu71oAuXOD0IzmJFSDESAqmr+wiU=;
 b=M8wQo64kzABnljhsqr1/Uxerm98XSMRhZwtt6lPW1zofp3dGI/HG1hbgOvCdmw/Ct2
 KhJVbcuC26GGcq1qVnRtqyWZScROO1qbYE007hMigCa1mrLe+gNvSx+0nolLD4VfPyc8
 sJOCgB/CeV9LC65fUG34cvBJ324uyTv7gRRbs3FPd9o787WHnl3rPw00ERj+4UpWckaN
 sOdk4EhDnwloPUP68av0C+QWfC+WDm7GKvkPTi3qaAPWRg/vr6AP0dI9KoqHLAVmxQFS
 kC/gWHMVdceoDtSc3ECu52upw9RtpFJ/5gYCgI/GShvI50s56APa+Ms/EVPg6xdY5xRy
 g81Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782382779; x=1782987579; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oaAzqeAzZY7GNKiLs4DAejh6EqxG4sx3r+N8tUvF82o=;
 b=TAqaJz6A7wSkvAptPajQskFfrad4KkB6vrUJWhd4Bfh5fGgjzJLl+dQv/Awy8mZhjD
 S336f11gBqMoG8sQWdj8FelDHU/fXzdJZcR9E8J2j6smKdhpsI1+xKQoEFW/jENCbZIL
 9xGjLMvg25LDDFcmPtU2NyTTzuYePC8jxnLKVkgs8EOT7FT9o5Xy6GBqI3VzIrhgm6Jn
 F4QyCW01Ade4qI1qHcgrf6Okjf1qR5wo6za0sZjPS95/TUoqcylHWz8Cr2Cq5oXFiyeF
 7z61ijuL99o7vmchr4sBe6G1Cm/l+zjkxJFTydbecs5hyoIBNcSu7Hv+GOhtXMB8XpUR
 yScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782382779; x=1782987579;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaAzqeAzZY7GNKiLs4DAejh6EqxG4sx3r+N8tUvF82o=;
 b=PQLvJ+33dO+dEBtnpbMAaa3+AINFsz3p+vAjCZItp3wrUbfSiu+Y6HoB/Ir0gtLMCC
 XfDKIWGI9F/TYurPqzNHaomJHn13XL1pTARYbBpkAWvZPfM88S3XdVylQi5gQJKREmYM
 /woPPJIKLzSZNmNZzJhR8gVWOy6b7n1QXi7Ieh0qlbgDeUIRyTZzsMDPsZDmA2DZBn1M
 Sk+YRXcUTbR5q3giM/Gf5tLxNYlGKaTMaMonWWjK8Iw8pARgVpDwiZUwoHSXb87DEKDD
 YrXyhOTw61UrvLmlyE5yknHfepk+WCN0NfCu2yZqf0VGUUO6ZaUTXqdO/YJat6gVLmy+
 gw4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpwMFzk5ZWYOzDITYBIe2pocYK34RgUKnQzvBwg40xhGO0Vk5oqcqg3T4v+RZ/M9bmYj31M+P/M9g==@nongnu.org
X-Gm-Message-State: AOJu0YyEX+9yT7c4EM06LTqUwxPC9W5J5jEP57+zD/OxPmxhXXqF91Ov
 W8aeKyM31d55m97Pzt39hp3DklSPBeMQTfWeC8EAeBaxIvD2JxcswcLIpGHAwd9z/ldHUQYxwT3
 KIKBkGI8OJgq25a28WsuC4ezSxJoka+yZreaQIcwhvs1mbkoNo3uwh6J4iV78w4w=
X-Gm-Gg: AfdE7cmvIXnNUkDTF573W9kQChFVxqTTHp1WfwF2JO+0EeFf5ftttUW3+paxiuvvESs
 1z/SXvmWnyz7yKbGHjyqdlljfGKgLCInbWVnaakX5Xhx+aWlXjAC0lJfHkEMcfKcBOlUgVm6N8E
 k8zA2X1kpBKs/I+bLAdA3cDMoCQicHhAmsylHm0Zzmm+bpux46srhA20ZBOvdbM0MDHoBcQTCn6
 /tF0Xd6xvGBtbuKfZc9JrhreOFqlWdKqEj0yBOzhFejfkQebK/HYHQAS/klNi21wy7CTN3/GnmZ
 2zrm7zQlsQSy/EqoR0GZiQ14EBfEdTBdNeUo41v7f9pKjBhivdPh9ooM
X-Received: by 2002:a05:690e:d0b:b0:663:209a:a6f4 with SMTP id
 956f58d0204a3-66488366246mr1188044d50.40.1782382778926; Thu, 25 Jun 2026
 03:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-9-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 11:19:26 +0100
X-Gm-Features: AVVi8Ccvqg2FEfiZ3LPz_jXLSlKWMaobbMV9NhpG9UsdrWbAIpyVfZIyFEi2JKA
Message-ID: <CAFEAcA9JzhxrBhs6G_Dov3zanQBBPPA93VErEfiKNyw7ni0oXw@mail.gmail.com>
Subject: Re: [PATCH 08/10] target/arm: Rename FVDOT pattern
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Thu, 25 Jun 2026 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename to FVDOT_sh so that we can introduce an insn
> of the same name from FEAT_SME_F8F16.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

