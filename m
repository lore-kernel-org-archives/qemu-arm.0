Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F85CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3Zw-00036Y-Bq; Thu, 21 May 2026 09:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3Zv-00036J-Eh
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:36:47 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3Zt-00069B-OP
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:36:46 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-65c7a459105so6518515d50.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779370604; cv=none;
 d=google.com; s=arc-20240605;
 b=OeKzoXQ3yh7ejz3lV1gFOJvKnU7nZ39egl9JOgTQm6f3nJqgK3S+2afXq6oRuS1FuI
 mAmfxAmMlbhEl3V6mX6Qp6ddYUz/9rNfOfAz8bUpSC18YZTYpmkqD859ql3CWU1nVG2A
 2kptE5pvuVa17YEVMXwkYiHIPh/EqJy7HoAufFmW0Mo3U4+gYzMz9xzNOELwJdVfSkrJ
 mzkQK3ct1acs9JPJ+K1vu31TH8Y5LCOM9EoWzLWQ8iua66mt3nceG9UZ6l947nGcedtB
 2kUhzmJpL+UEi/MyZkXafxmj8iQYVQKBj5I59armE7TwnzEz3HPNzFI62/YyYoX10Haa
 r2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rPrA6+viXeigP8WjQobrxNyXtwBzDxNCHHIJauZQCx0=;
 fh=/Vctq2wIb3e+8ZNcpUjHLrDRXvdWE0oGugfFYRDRNVY=;
 b=DirVq/c60PUXbEEL9XZvTf9aagoYLUnZvW+V87EzYm9moHztRRhH04v8JYH2m6KFxM
 EWzuzPmnW4kkOZRJ/RwHTNDmdcSU/yCV3fqUFqAZ+BS4x5KtU9qN8zWutK/2BGjwrt3C
 xRm67pYUS0E5NKSqqDGWhbWEBGGlLzjlAA+zA7NKygEvMeU15blKG8LzXlYnbw5NRxid
 rXG80DJKLGtqz3NnadTMBUdopr2Lj30zXeubGzvelammlMAGxtm0dFmK9QczQgNh+Gr4
 v/HK3oPgkdtAWrxeKRSyOg+giwE6dJf0AkecrjL+gM/hU7lXKP27mkbOA/tAiA8E1/0j
 8ITA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779370604; x=1779975404; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rPrA6+viXeigP8WjQobrxNyXtwBzDxNCHHIJauZQCx0=;
 b=IDzHrJ56jUqYyBM/XKLvGd2I78Soaey+VrQweM/dmtErlqJ38UyCvNqicDwZC21/5+
 S7H6VatOwANJjbW90DWy+4dxQ9ZI4AxVhomAnzefhnFLgpKqbx4AWVvlMznPjPhagHJD
 nznYJXo5n4V+c4WtVy+o1/IT6e8HBToH4q6pisThkv2sw8sIYqxJdGRR7DzQQw7o3RP3
 lr4KmGOV/fSRrQPm3WNZgZoxoFnbT2Bsl64tJ+JI/z0wkSjGJTgbnMflM6gK8r5wU/B3
 OX3vyYFRQRtsz5BHBVA7rkx6GqvGUJltX85t9ieEgOlxiBx8dUsTBTmIfHY9DuuyUkPs
 Kjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779370604; x=1779975404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPrA6+viXeigP8WjQobrxNyXtwBzDxNCHHIJauZQCx0=;
 b=tBAWl7+UE4qpRPZR96Ug1wjntdYK9x0mpsUBMciL2Vwe08fzBYKCcjqg7s63K4LTGv
 NgMcddvu/tdql/nRvczQPukHLo4RbdK9/pmoz3z30RU38SnCrG3WdGjofSgGQqIRqnEr
 PJPMk40clsV9zhloYOgT0cHSW/0+NnTWL1kR4GDNz/c6ACpHQWoVuIcAlgq8/1sgnsB1
 DWXIUDiiL8r120pyCGSRQXaKhkt2WmX6gJbMIyEN2BT+8cmkMA1cyvDlyQCJ3+Ikgy2V
 SdJmcgTRtgpGQPjj2ExC3XgUzEFxFV1N4TW7VFBG8CGBhBlwKu+MD+seFwfKs699plOk
 vz3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8EXOZfrzfgt1bOB65fbWTSDT3UOfPztOxLg3B34xVL8c7HLpoX10hDeYiZaT+T7I46G8ZUOty0cw==@nongnu.org
X-Gm-Message-State: AOJu0YxU/1gE9AMGPRpis4Pyt+APQlmLYdBw7qsSHnl05dtokOV363D6
 Yq6wCGiY0+bGpQyJIi0Qb38UfOIUB/YGx9+kx+7Pk9q+Y8DRuhSkCj6fvVJulR+DvjlLqP4vOS0
 UqCkd9+1tkYZcg2g8DAQbEoPqBWSr0WotTzvIN5+fhg==
X-Gm-Gg: Acq92OFbYk1GzYoiHt6Ta0LyxyN2CySszkKz5G3Bf87lyFwyoQx0zbKUu6rvBS6X+BW
 1c3m0/38LWjYhOMeIBmdP2/zRyhBaW2KlZKep/PxdX4QiRbjjFBtZL0DNz76YfHPJUjVLMcHGQh
 uSupD6erQGdrZTq1KCJ+nOH9zwsmMlhMJzi1k55z2cCfR2l6DhgLkTVBp9HbolQWpMpBCnJKqZW
 QLYfDJBQtlC/htM+6/iEQh1gFwi5/bu9i3qtuO7XldA0Ay3mzbIg9VGzdwsosVnvadR/ZIZU7Vj
 lrRYKeSpePJAGXs0bwa6tW8/avnPmhWy+SniZbRB+L1CqpH96jvMpro302yQ6CYBtzY=
X-Received: by 2002:a05:690e:14c4:b0:65e:3e40:ed9b with SMTP id
 956f58d0204a3-65ead053ce9mr2129897d50.44.1779370604330; Thu, 21 May 2026
 06:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-2-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 14:36:31 +0100
X-Gm-Features: AVHnY4IV3591kgmAk00gURnbUy7QzSH7JEOyExI0if96mNYOdvaYuHdt59ZKofg
Message-ID: <CAFEAcA-nNDpO5MvMsQSGOX_kRo95LmHLO3AeZ-V1uthLSPEFCA@mail.gmail.com>
Subject: Re: [PATCH v6 01/64] target/arm: Implement ID_AA64ISAR3
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

On Wed, 20 May 2026 at 19:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

