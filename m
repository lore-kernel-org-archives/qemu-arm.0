Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp69008ejn;
        Fri, 23 Jun 2023 03:30:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6O448WWQMkFkWp4NZ8UQrxQhsM075LOQ6oa2h9+ntIXUaB/OiAuPj8mVk5y9jqy67zba1y
X-Received: by 2002:a37:ab19:0:b0:765:3fcc:4f9e with SMTP id u25-20020a37ab19000000b007653fcc4f9emr3251504qke.38.1687516244789;
        Fri, 23 Jun 2023 03:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687516244; cv=none;
        d=google.com; s=arc-20160816;
        b=BGmy0+LkdHOcIZEUKb76Xvlsxw47ben23t0UlMVv6sB6c5SCZ6KjNEqIy1kDW95as7
         Ahq+8N4VfG7vQj2023yvJ/HyH7lmYMjpg713TyHfF/wltszCkoqPA1Q743XIvMapDeg1
         vk+EXhCKjE0+L0zal04yUnQIzh7yqIsc7s/thkOCqt8ujVemsuyjaQZbtphEgSi45wZr
         6hKt8J5cElX2YDaAMyinlsrngErfdJmGsAiqE/OLGI8Abz442ISi5MettzFECKt8mdAy
         JpFo8G1JTsUUoew5f2uGUIY+p+wuChFG9AMHsaLsagpcqifzoZWA8pHSjD049AsQOkmw
         gGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=S9ksx/UadnDs5AooqtmHod5cgh8NeEHWBTNiF5vomBc=;
        b=u3HSTenAZm0yaYcQsOQLgJFIQvZa8NTQ+3rHeIf0uoSznbxeJF6AtH4R5Y95XuvERp
         27fknWqu4Q20F/lDRdLPD+g3Zqrt77Own3UUZ/fntuhWHii44s9Q5ZSrYKTsujYVZzpx
         YBSjs1lMOGIKvz1619/2c5Ms8gVHeENPJr3UNFdIYS3mKInekJpGWgQ5beJqFSRPL37F
         0wIt2F3NzBuHRwcO9HYUvJX1u0PbE/zeUYQolgy9K5Dfst+GSif3aAyeIKF0pzac4N5t
         6AUWoW5jEgZEmozBnih4GNwVLh+kD8QHNkDhA3MOISrLE1CEPQTlTzydDlgxc1XrUahx
         sqGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="un0r1xr/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz6-20020a05620a36c600b00730749b412fsi3435219qkb.612.2023.06.23.03.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 03:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="un0r1xr/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qCe3r-0003eB-Jd; Fri, 23 Jun 2023 06:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCe3l-0003cq-I6
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 06:30:33 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCe3i-00036y-Eh
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 06:30:33 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-988a2715b8cso297044866b.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jun 2023 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687516223; x=1690108223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S9ksx/UadnDs5AooqtmHod5cgh8NeEHWBTNiF5vomBc=;
 b=un0r1xr/YYxa2UbuTt270TCXGddSL7VuxcGuJPEwOc4uKfNjNbpjari9y0EV4vAzZW
 sDWZuMn2uha2iy7BV6MuuU+MHOzyfR58saDnegOABSWNIhVLih/iBEDw1xhfrcCa9iM8
 vD0ujbjqvGd5EgJqekIXGK4tqG/R+13pgR2WX3kri2RGZYD1BV28tEUrIFtgK2cZrpw0
 TSlzBmnqpJISLDK5w+gaqn7id2em5nvKiOdc+A3t/jUMXKFz+vhhdrztYk5gWW+EKcbn
 jembeabmVnmFv6EMCgZF3OOvBPu0IAiGI6ITOVNHZmWlrE+2ZIzRFBt+osKREaUR63jz
 nC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687516223; x=1690108223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9ksx/UadnDs5AooqtmHod5cgh8NeEHWBTNiF5vomBc=;
 b=JvBpwBTPSg4j090iLa83UXcNSkFoguYf9ZccX61fFmF9XLXhAWK77LdEnPKI5kVdjQ
 6sxH0v2JSoA6OailDtTVa5UdCGfEp331O51uQryt1LY6mxNLmEUSIRJNA1aVrf04Z3EW
 fwwyawb+6lqCQIffzJYrH+5CxjPQuWmnXWdsZKBETtxlVo9wcQmYkuZVJqzYf0qDKBzR
 bc4yzfzlisPXiHH/lu7iWHmld1PdYIe/oTvIIdhHP7O7DhZEP5UBjowqp+qoW9/Egzh1
 WLoEZbPiNmKJL46ajAIxXcAjNlPPqmVY52WzOlwasvnLts/Z5Iw/6jRULZ8AfyXG4/tA
 LNfQ==
X-Gm-Message-State: AC+VfDw9TpmrGPznMmytoxsSXSxU0kZ5KjUzqAZxBMbtn4CzirmFByMh
 ZDYQYVrItxpFWiGzNiLyaFvzNkSUmWnKH8/rwQgJxg==
X-Received: by 2002:a17:906:ef0a:b0:978:2b56:d76e with SMTP id
 f10-20020a170906ef0a00b009782b56d76emr24672116ejs.12.1687516223223; Fri, 23
 Jun 2023 03:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230619170913.517373-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230619170913.517373-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jun 2023 11:30:12 +0100
Message-ID: <CAFEAcA9pUPBx2aLtY_2DMy5t3yn=TbhFWhZbTKbXW1g-M+tnkg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] hw/arm/sbsa-ref: add ITS support in GIC
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Shashi Mallela <shashi.mallela@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: LwYNkhZOYvMr

On Mon, 19 Jun 2023 at 18:09, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> In 2021 Shashi Mallela sent v8 of GIC ITS patchset [1]. At that time it
> was decided to do platform versioning first.
>
> 1. https://lore.kernel.org/qemu-devel/20210812165341.40784-8-shashi.mallela@linaro.org/
>
> Now we are going through our list of changes for SBSA Reference Platform
> and GIC ITS is one of early ones. There was decision that there will be
> no option to disable it and platform version will get a minor bump.
>
> This is refreshed version of v8 one from 2021. GIC ITS is placed behind
> GIC Redistributor in memory space to allow use of older EDK2 firmware.
>
> New address is placed in DeviceTree for firmware to use. Due to it we
> also bump platform version to 0.2 version.
>
> Trusted Firmware will read GIC ITS address and provide to EDK2 via
> Secure Monitor Call (SMC). Same way as it is done with GIC addresses
> already.

Applied to target-arm.next, thanks.

-- PMM
