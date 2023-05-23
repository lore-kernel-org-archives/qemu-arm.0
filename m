Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1890101ejb;
        Tue, 23 May 2023 06:47:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5T/sJMpzdgRa9CWcAZdKeihRa8HOOMPgE8cGW7VS45ZX+GLTMk1uPFEcfCasD9PEIlplpg
X-Received: by 2002:a05:622a:608:b0:3f5:367a:138c with SMTP id z8-20020a05622a060800b003f5367a138cmr23534480qta.40.1684849655133;
        Tue, 23 May 2023 06:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684849655; cv=none;
        d=google.com; s=arc-20160816;
        b=RM3a+KfSmPAqxI0eluNs6DhIxt18445YJrVZuD9pL66lw1NdNX5mJSoTbyX45u184W
         HyhVYr4/XKDnlQk3wgDO6tFORvV82h0UgPoLLprqwLyJJPeWRIJGzOg5TGvNzUo628eA
         q6IaoWLSCb0p8+P+quqMu5JHubCpNx3+MSlgf38BO6kZi1hZLMmMhfV9Hq04v4n5ElgR
         TqPcEdpow1VnHdmyGiXf8IzNDSfwrucoc2hjTXtJZ7vzQDIRyrRkW7O51xQ9hGdRNRwR
         uC4ldpshDSBwBTahvcxKcWO5+DYwTTihMAkBFVNqq2MQi62ZmYOtI3WGBy2FSwunwis7
         WvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UkPS9xg/J/8lUisIzColvVKGP6xoCBQoW7JU5ZMZeEU=;
        b=mlbmHGjzua+pbbldpsdLSWHL/DuUZ88GlsTBbCq5fLJqUYyUcqixoKio/1DTbR3Gm8
         NwEwMWOkTFUR7pGJCT1vIFu47FpF6MqUpnWUrTkO1Yl82sxH7sTl5lPG/Vvdh7nQhge4
         jeu8Vf91DFqO1/mAOMjvBft2gVAXHfpukFsT9zIlu9mlT1uQluCIRMsagf36UzufzZhi
         Ye0L2gVrRx0fmolBBJ/F1kTtJm12tOS2CtbSGM7pFr+CZUVvTdh05iEWwU65Qp84KXa0
         RxXUHUoxQ/iZjQZwjFskxFnq/JRiOGywxlqtw8bHJWelgKX5ZMz7PZhRhEoXqCwRYrdL
         MRNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J55PBR5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp39-20020a05622a1ba700b003dfda8e2b48si5161276qtb.106.2023.05.23.06.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 06:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J55PBR5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1SM7-0007XC-JS; Tue, 23 May 2023 09:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q1SM6-0007WH-4z
 for qemu-devel@nongnu.org; Tue, 23 May 2023 09:47:14 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q1SM4-0000yw-6B
 for qemu-devel@nongnu.org; Tue, 23 May 2023 09:47:13 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96f818c48fbso815391266b.0
 for <qemu-devel@nongnu.org>; Tue, 23 May 2023 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684849630; x=1687441630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UkPS9xg/J/8lUisIzColvVKGP6xoCBQoW7JU5ZMZeEU=;
 b=J55PBR5IYGi0mCV/zPKA0B1rH3b53lROYnpRvxogkWq3VoRtrh6qfhwJZ09poXcEoO
 //37F6bK08rlW/d1jhcaA3KQz9ZQG8dYwfmTXpIiwxmtHooQlRI7L0riNR/lXtnR7gZ3
 QLS+tXaBg2M7kp0tln20QNVgrGwudKhzYGSbGx1JWBTPQQPz1Pe++Eju3Jb236fyEUPb
 b/F/CovEJ54ETL7Ey7/uwSCBcPUfv3QU6II9A3o7330B9c6xAOESChtuBgdZT6x+qnJM
 y0RLOZMrvwYep/kZ1uq+mOAhi7HVRkXTb1tc5oiAjOs0kkNuJcvJ1a3ZnQupWNc7EDdF
 REQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684849630; x=1687441630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UkPS9xg/J/8lUisIzColvVKGP6xoCBQoW7JU5ZMZeEU=;
 b=SBRpLv1uLbfKtKo2/0f9la18V1TexdqIsge1KO5vh4TUZ9/8iekbUOSvbTFCI5g8D0
 JN/4xYMm8rODXVr4F9wplX9TEVgels5T7urb6cQofnzf4MqdZaWUuhaeUZLTlSQH1d4P
 SIWwjTa3ryKbIk/UUwOSFPhCVy+oK59GzCrIEHnt8wyYEMnUtGjgIJM7CgEEfmRMC7hZ
 nMWeeGjHX5SViG4fxhG1urKpaXEC2N4JojLTp7COl6BepJY4O8bgwcFACYSdHVYf6pEV
 nPnq4XzBf8RqXWBpwvaYuFxLAHnz7//vn4NaKZvcCWn7eZcU50qsMo5e1qBXFRaxzIae
 tBIQ==
X-Gm-Message-State: AC+VfDwrjRT8USFAdOEm6KWmw11WC8xr8m2aZb4J119ZXbgmxzhH83cY
 QY00YwxpAXiWTlkWwek9u/jiVqXpYIvVCnZ34gd9ew==
X-Received: by 2002:a17:907:2d28:b0:970:d85:59e9 with SMTP id
 gs40-20020a1709072d2800b009700d8559e9mr5881519ejc.5.1684849630314; Tue, 23
 May 2023 06:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230515095015.66860-1-cheptsov@ispras.ru>
In-Reply-To: <20230515095015.66860-1-cheptsov@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 May 2023 14:46:59 +0100
Message-ID: <CAFEAcA-jzesTY4ROwUmntqMc6f2XbrLAgpEd0q4_sATJnjg5UQ@mail.gmail.com>
Subject: Re: [PATCH] fsl-imx6: Add SNVS support for i.MX6 boards
To: Vitaly Cheptsov <cheptsov@ispras.ru>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m3U4AUaQud3U

On Mon, 15 May 2023 at 10:50, Vitaly Cheptsov <cheptsov@ispras.ru> wrote:
>
> SNVS is supported on both i.MX6 and i.MX6UL and is needed
> to support shutdown on the board.
>
> Cc: Peter Maydell <peter.maydell@linaro.org> (odd fixer:SABRELITE / i.MX6)
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE / i.MX6)
> Cc: qemu-arm@nongnu.org (open list:SABRELITE / i.MX6)
> Cc: qemu-devel@nongnu.org (open list:All patches CC here)
> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
> ---



Applied to target-arm.next, thanks.

-- PMM
