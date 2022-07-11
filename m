Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp809080lfp;
        Mon, 11 Jul 2022 05:51:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tdueGcgA7zpF+rKP2/W9PpMtl6/EELMc2afrwNipXOVYWPbyGG2NjFKayk2q/9g8+YsRIB
X-Received: by 2002:a05:620a:1102:b0:6b5:5fab:8f20 with SMTP id o2-20020a05620a110200b006b55fab8f20mr11199667qkk.560.1657543892677;
        Mon, 11 Jul 2022 05:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657543892; cv=none;
        d=google.com; s=arc-20160816;
        b=j14E0elnetrBTrtOFhAjUV+YCpH62QGlPmj/QaIMQGZ8nW/UVB2exDROWwTTVWUfyT
         zOdBA0XdyQnHsZtBUklo5YVJmk1Goec3+21PRTMDOqfc/26CCOqvdegOxToYeYpauNRs
         uaiBi/r4FB9s7U0KLkrWpb/3cDmDTslZiI63qCgf+gFIinHFrztRBj0Vk5+u3PCnnQza
         ZHpyRCqICvPS3u/SkNCiQlOHmb1vHqUoAjZ/3cXYlRlp2d41Q6Gbn2pOx0YmVFi7HOt4
         R73SdRrAdwvzBMr7rp7zcLJgT7By8ZCWfYczJTTrJCryyG5E/tQfugCGrFuy9BJLQF89
         2hIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TUpUoLVWGeJacuaeJ27qdwCvm9njmgM+eCTjqiPeboo=;
        b=GXJPT8zupWTIga3G06VvcEsQlK/88XJ+QJtL0dQvwa59GNvQgm5T7qeRz/NwXtPVNo
         oUzTS8J2MbHc1nb1E/WjohYjacFs2headqFQrUuy9m7E7BbnY0ZTSONWC9gigrvGldgu
         voTZIWTS5tWAJnXs6nVOqn7RqgNJECoGoK1vLu+s7k6LJqtMhF+rWHERlrPcnFDtP/mO
         jrkJNS+kikzNc2NE53H8ZX7o6bqQp78yX26ieePL+9F/r4TjmJ7Ww87YerH2QQ7HaxVt
         AcvtAYpXZC5D+YC9zmGAxQtafzMD89spoNQ5co4ruv39mbfJFczX2zn9EAE0asNhk7sU
         9RAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KtVH0Lby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv13-20020ad45ced000000b004727504aca3si4343921qvb.540.2022.07.11.05.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jul 2022 05:51:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KtVH0Lby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oAssu-0000nN-6k
	for alex.bennee@linaro.org; Mon, 11 Jul 2022 08:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAssb-0000mG-4f
 for qemu-arm@nongnu.org; Mon, 11 Jul 2022 08:51:14 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:36443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAssZ-0002i2-Jk
 for qemu-arm@nongnu.org; Mon, 11 Jul 2022 08:51:12 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31caffa4a45so47710657b3.3
 for <qemu-arm@nongnu.org>; Mon, 11 Jul 2022 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TUpUoLVWGeJacuaeJ27qdwCvm9njmgM+eCTjqiPeboo=;
 b=KtVH0Lbya551ddG9L/TOJwHksaw/7qcdl6XuCJesNiqeD1W8q6s+cKnJMYNeHxGov3
 WUkR3sv5qXahTdDi6eeuVUp/KBkOi/PmHj3JZmiJX2Z3elDijGIjtZtVErnU215v0AHZ
 QhHrv/Aym9tIiyKxXnvtevO3GwkYp7CM1ifKh2uhOJ6FV0Fi0k3nRHdN+bttfJwI4IzB
 lpYN7SEpcw1U7Bwf/4FCnkyCj4EQLMF4x4mzLf+nK+vb14IOk/F+Ic8SpuKpTk8HXsXn
 Vi1EJpChSfh7Im4dP2XXS95je3TA35Pe7ER+v6yat2ij5oGXpe+DgGv7iHR6j8kKje7K
 7epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TUpUoLVWGeJacuaeJ27qdwCvm9njmgM+eCTjqiPeboo=;
 b=AIOJukASU6Ut6uQZas+sFES582e9pV18eaafW+DPgbhr2nxzl3y02E6bgbJSTEUxwu
 XronbDbqRLgRec0Hg9f2v9tjYJm0BHXFWWMXpXJK1jziM0S3oU7B0WPxvrYtizK4JBj3
 ELjXbQlCVydwU/OTSdW0RvXSihq58xUC5QEDYaKWSvLu4/EodUbl5V+pVjv92YWrAom/
 Mn1WIPwYpcTTiZczlpGXnokB2AMzG4BvUzT5vd1LZY5fKOaTJJM2xwIsFaBD7v9yvfG+
 9CR922f8CmvcPfvIuUFq2Z/tL6Wz8DF8umbis5Bz5yK78X2f2RcxAlMWIwQX63T52i/5
 deqA==
X-Gm-Message-State: AJIora8EW1uJhV2iY1fvTiH+FsOrNfhgmnilH8TA1lOVuJHapzoxXS0a
 Qvv0B+fiQS8tDQMZSE0NtrmjAouMig2NLftUmobZvhNPX1M=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr18790301ywb.257.1657543870723; Mon, 11
 Jul 2022 05:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220708151540.18136-1-richard.henderson@linaro.org>
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 13:50:31 +0100
Message-ID: <CAFEAcA9fsPBy9DNxz_HqLcBt3srjfhOGY=Bkgg7MWp64xzi0+Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/45] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oYz43tS2IK2X

On Fri, 8 Jul 2022 at 16:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v6:
>   * Some sub-word big-endian addressing fixups (pmm).
>   * Logic errors for BFMOPA/FMOPA (pmm).
>   * Fix for PR_SME_SET_VL hflags rebuild.
>



Applied to target-arm.next, thanks.

-- PMM
