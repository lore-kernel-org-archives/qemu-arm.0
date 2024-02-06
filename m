Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1920481ejb;
        Tue, 6 Feb 2024 08:38:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQv0kUFT3CsUrKdfOM5gHUeTjXQVXAefxhLn9p8fpYmF4jSPFaiDNCMR9FhptSnxNJtIUJ
X-Received: by 2002:a05:6214:2507:b0:68c:5c88:9e78 with SMTP id gf7-20020a056214250700b0068c5c889e78mr3611362qvb.20.1707237535792;
        Tue, 06 Feb 2024 08:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707237535; cv=none;
        d=google.com; s=arc-20160816;
        b=1B2M156v5GE5GjXOHJkkTgEUIb50aam01K2H8jDSYf5QkVeCxO/QAtPT4VYOmq177h
         QOTUGhr2DmciL/blnprb5i+kc3za5CZXhjsgqoq1wAZhYdlX4c0WFh3cFF5a6mGS0tia
         UFqv+qGrEGGu25asqsScMe0Z9lRhxsQ5cyaEDdzub4f2HZFAX/IOpRewtA1jklOFeE/i
         sR2IhzW5kjwWUWfYAK19lsNxDDz7LmDt+6HehNM5cTtM65K1Z6vpa+3M25CXFml/uRlB
         24AV8lsat6QhonH0ziF2HTKZDsY0tnpIE1sa7dUSCcwmOHGxPxxDzL0VQGRjiNO8b7sN
         wj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gDbs2+l1RW6CL7rkOe1toFI/Q2v0nq7PGA06Let+8xU=;
        fh=ku4fFqL+Lo3RdLaGHcpbemYz/oY7G1pNtV7PKbcPIfc=;
        b=YnC9xdv9suAcAv97+n1yfSqvly67LOtm2XVoy0XKuuuw5KPjpb4y4Eklkpx1Jw8R9V
         aBTyI5f84SrwJkc81gL9f9gRaerovjHaBkUbNXghSlYkfbW1Ej6agNTa/I/ky5Gw4TYi
         7M+HFu4n00ME54/SC4AlZmjydyDMuFE9smp7sNchKSTZT+TNZyuaDj0p5NaZDzIqeXm7
         6zXj/29oPS6GQpyfE0h84bN1qEg8hwVOzDg9CN7WG5yJEmWlXMnhFsi+EZnegHEj0SfW
         KneGMXk1Fu3zKPvG7uL+bKG68DzWkYJwxGbrkoZOua7hiCOznCwlMcWTwdpzJumFiQwj
         MfxQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W/OjjWNY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWsioPkVzqk7IN1FPDKDkLYDDLtj33vyG2pIJ8Hf3BDz+87JHcM/r+1rtJUHieRag4N7RgCDZRe3+aDjHoiLTOJMlBbmk0W
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a0ccdc2000000b0068c5ca1a0a0si2734577qvn.111.2024.02.06.08.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W/OjjWNY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOTA-0008OT-P6; Tue, 06 Feb 2024 11:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXOT9-0008OK-OB
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:38:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXOT7-0003f0-MK
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:38:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40fe00cb134so11313545e9.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707237524; x=1707842324; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gDbs2+l1RW6CL7rkOe1toFI/Q2v0nq7PGA06Let+8xU=;
 b=W/OjjWNYHM+TQCguyhbY9/twyhzGtX4qy+bCEnzMVCuEPB+vU6vRNbiaCHNYxk79s+
 C9g28nkiw9KS16b+39X2pD5epfu0W6kMOojDANq8JdsGH4U4Uzo1cYhjKiwqeTvxIENz
 twhK5TgYIN9e+8laDo8L0s4LGf/eKoaekfrG2wnJQ7NtTuOmpkqPLuw8bjkEBdbHgdzN
 UccsuNRt07Q65XdToo2hVJTeEGw8Klqtff7d6PJKSSAc4CS5GcJdoC+Kwa5xLKUzfM62
 030FWa1kOMSDcS6skA3RBTEWXcy+hW3TyMQLBQKznlrKSjIIoMSlM9b9S2rCV1+j2/gD
 7iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707237524; x=1707842324;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gDbs2+l1RW6CL7rkOe1toFI/Q2v0nq7PGA06Let+8xU=;
 b=lmWTs+gvJCohfRnh3crXChOBUePiAv/tFjF4BhAnCnsEfPpFWFL7TpvZFtSOEZHE6x
 oU7sLIVIEbdCDkq7dKhWHIh4noLzN8YmcWKgimu9xJrxriJGAAqsh+JdXExlWZyrzgi8
 RJ1Ce4guhV+jxi727BylH83kpyhidayOuvoDmiq7F26mDkC6znD1M0zWOfkndp9QME5b
 555JdjTiT3rwGLpl8elyLK4+qZSXnPM20s5g4kTBOfK24ttFPDQ2j9fnB/f/nNkRNEB9
 +flKL9UTmJ2tUvlM0fnC63cAeD0FPVWYohwOBgyVUVvgK9X16+W9qON194I1aPN8b0Xq
 IX6w==
X-Gm-Message-State: AOJu0YwsUD+lHqeMW3MutTaE0rFEQU9vAwK0XT8dCExtvPa5nY/lriM7
 OAdT1KNLdBRhOckzfo8jMhp5dAkCwQxJhXOMGxLk6//tQNXm7bXihE95uzjuwbs=
X-Received: by 2002:a05:600c:45d1:b0:40f:c1f9:c884 with SMTP id
 s17-20020a05600c45d100b0040fc1f9c884mr2468524wmo.39.1707237524097; 
 Tue, 06 Feb 2024 08:38:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXIhhk69ORs6IUZ3nQ8GB18Dke6f1NzYH6WFQH51BKuO5GnQEmjJJ+zZv+VVzjsJM6kKLu7OrTnXD9suUD6jvmXUH8ZUtyKv0y4bCbfVxmBIYiPBbs34KyP4E3xsbpA93ILTtdYIQ230zha7aM=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a05600c349000b0040ffc838cadsm167828wmq.15.2024.02.06.08.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 08:38:43 -0800 (PST)
Message-ID: <f16762ac-23bd-445e-8116-d62bd242ca6b@linaro.org>
Date: Tue, 6 Feb 2024 17:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest/meson.build: Don't include qtests_npcm7xx in
 qtests_aarch64
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Nabih Estefan Diaz <nabihestefan@google.com>,
 Thomas Huth <thuth@redhat.com>
References: <20240206163043.315535-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206163043.315535-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: attjYr44EEHv

On 6/2/24 17:30, Peter Maydell wrote:
> We deliberately don't include qtests_npcm7xx in qtests_aarch64,
> because we already get the coverage of those tests via qtests_arm,
> and we don't want to use extra CI minutes testing them twice.
> 
> In commit 327b680877b79c4b we added it to qtests_aarch64; revert
> that change.
> 
> Fixes: 327b680877b79c4b ("tests/qtest: Creating qtest for GMAC Module")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/meson.build | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

