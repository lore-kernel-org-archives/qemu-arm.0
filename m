Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1383633lfb;
        Mon, 6 Jun 2022 06:52:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNDtlesVLfF3nrbQAS14a44gClPhPA3MKx4tZBK8TnNrLvWJuaTG/Wh9Tb0H2WDQvWZ4s7
X-Received: by 2002:a05:6214:766:b0:467:594c:2dc3 with SMTP id f6-20020a056214076600b00467594c2dc3mr16893305qvz.99.1654523574365;
        Mon, 06 Jun 2022 06:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654523574; cv=none;
        d=google.com; s=arc-20160816;
        b=ntAHgaJqnESg4GoGXSdjvDRS8XDnITtpdGWFDw5506qhPl8lLcjOZun1Wm3c+v5eKp
         fqrfLa4Fyvl9XrKmuHowyevz1HJV6mezbLN6Xm4e9mIqB/advcHLMwpFl+n1wgOy92OA
         Giy3ntaZf3EyFCCeTwI89eN+3PVdzqZ2v2q6RkH6R270rXu37zLAxxr35PWxUXYaRJPi
         1CbaUn8ms6CdMJk4fRLzfFnVb74atV+jY/vCGQPkV6k0KSp0rH+HVkzlU+rV2/Nrdio2
         YdqA+cH0hygIuOUctueRkef8H3WrLKtWzzbrxBSe1kcocxMmEPpgmf/E46rjHI5wH31f
         vm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pIjK04nCBmY09P6J6lluvziMpkoYq9WyiLZ58TThnV4=;
        b=nFHZbUv89cbUIRH7gVzgVYuBEf/tQuBUeahaEPuOaCVH1hFgKidKg5FmCdhQ/D1C1Z
         OohxBC+jhNqvR/IfeA00QIhSG3po967RYFHPK8/LTayj3wye2WLNmg3dF7SdFWw3YkJg
         uQkEffnlwcAwLlRF2R2U9rV0RYXIGaiAWuPHl3GsTMn/RORz5qk521X2ZziwZ/ksKKyn
         YgTokLsCpIGZC++k/0kqWtP9QJEoUfs7iu6rApqrhVchRYPFA6oKecF/C8hTemz/D5Vu
         hIyolmLMBj9xV04Lt/sQznrQoed8TWnhjUR/4EABNcPf72BN+Z67R148mEVQPLulr5Y5
         T2Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6tfn8J2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05622a054700b00304da67cae9si5988734qtx.550.2022.06.06.06.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 06:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6tfn8J2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyDA5-0002hM-KT
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 09:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyD0J-0000Xy-RM
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 09:42:51 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:35519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyD0H-0005zN-98
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 09:42:47 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id t31so25775011ybi.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIjK04nCBmY09P6J6lluvziMpkoYq9WyiLZ58TThnV4=;
 b=O6tfn8J2eo/2A63WuxZNmNxUzD2XPHs64oL1w+QjfmTchUh2/BkP4P6vfgPBtY8Xue
 fhEjaH6RAzYcccjWdb4S7wNH+2a7MrrvN08Rr6E09Mv/flriw44EbnHqddv92WGCpxAd
 hEsCFoamdhh/poWNx91S8U6uvH2obBVYhpu+P5U7FDjAGBgpxTlYhjmWlIl5ZVJIUHnz
 hYN2KEFPUtBMTzaYyXYK/S5Dz7TJYaCL1JGXDA6nG1yWxgLVqLIOoO7tSidlHo4jfUsF
 qx5Em8b1tF1tJs13wfnitunRi/e+jel5ZBYL+98oW2pjtD+DfnT9kXP5I/DRoJ8cpCiX
 dSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIjK04nCBmY09P6J6lluvziMpkoYq9WyiLZ58TThnV4=;
 b=xddsaxzBm+hie8BRhJdAGP0m/NYQ2qNZn2IsSdH9VkAysny/g9kV9kLQZF4ounwsIY
 U0nATJafl30eFX9K9/qiJwJM3v4kYUgnjjAT0HtIg9Xyacb1XNbWrtkRAeuRkx22QYe9
 bzDNR35EKcOx80cP1ZB4W+Li5qs2F1AsAu0bR2ObJGweYRtwAjyLU35MMBbNY9LBPhXk
 05vTsXurcakYv+BaB25Y2wQEzpCoXzB6I1AgB/tFOyLsUBrLvP/Ikju86O/kfj12u2CR
 R1QJuBr93PeCOOOi/BFDQ+lm5RU+TrMtq4mQj4j0KGT0gz3kJ+/ctj8fX/PCyCTLvNM+
 q1qQ==
X-Gm-Message-State: AOAM530nDn4DDEhPJxQHiCcsJNdH3k0C9c6GshKJZOLhpm+bhzpoAiP+
 x+dir9vM1h7dyaBdywZ690jfqLDO/cOTiUKgpZ8SXuAo6LY=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr10144713ybt.288.1654522964328; Mon, 06
 Jun 2022 06:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-27-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:42:34 +0100
Message-ID: <CAFEAcA9DugkyRQ96qGTLdxirCxCqJGgh79RvksARbKW-cKW4og@mail.gmail.com>
Subject: Re: [PATCH 26/71] target/arm: Add SMCR_ELx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
X-TUID: 8JKTd1j4lhCF

On Thu, 2 Jun 2022 at 23:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These cpregs control the streaming vector length and whether the
> full a64 instruction set is allowed while in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |  8 ++++++--
>  target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 2 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
