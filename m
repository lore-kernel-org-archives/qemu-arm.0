Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp617571ejb;
        Thu, 2 Feb 2023 09:58:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+SxLEQA7QuC/3Ab1PHSsI7PyfqY4/YEpt0H4KieWUzYT2QCoNPffXk5AsdbUSWXgshg5cY
X-Received: by 2002:adf:c754:0:b0:2bf:e6b9:1746 with SMTP id b20-20020adfc754000000b002bfe6b91746mr7474293wrh.16.1675360728219;
        Thu, 02 Feb 2023 09:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675360728; cv=none;
        d=google.com; s=arc-20160816;
        b=W+kOvq/Q4qrSisEu8z/+sKg9ho3TPXTcxYBfij+NbRpYE2Ygiy/TXdf0agrSIGVNoC
         ldA8zk36vtzqLtcvU3b9YIxKuN324xUY6WtRa6km8qi0N+dJBvl/w11eMjYLkPHUu9Xa
         ktnkF60rGjcaXcdryR2cBsl686iuL2U5nOkHrfTMppjMxPCOjd+wnD10aVvXa2BPS87G
         KT88s6CpPDfSN4/QPX+jZyCn6kAdwx91IECxUUGzWv8WvGUPIkRzHSiXf3s+fNiT+EKg
         LxwZhHBCNUSK8JB12bwsUliO72+kiapaba29O5hrFQSL478qHsFujtrUdwTn/VS1oQar
         e/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WDUufeD4urBHxMtx/WT/mhl2y4uXGjnOKa0DWhCPUIw=;
        b=qauQ3kDkGRtgZcmidboAGGxO6kGYNutdTCYvykuxaGxYV1RDiIiw/N2DvicPI+28nB
         Sti2C8XCNJX2UNqIPy9s62mi86TlSgWlXmWv8S6Yqfeky2qu12mA2h6Pp0W9ir7Bc8Ur
         0HztsDMfloZvgZh3zpoEJA8hvEklEMtvQ8PkrSqVh/JP1WMBtRGKBx5QwfJCvPYWQ0rN
         tLsVSKQLKB0qbwBLpuJVKK/d29l93iycfs/Fo28rHfcx5k52cQYnMHXa9DYjdq3Tl0Ex
         oogjeUV4S0Mdhz5k5PqoVugM1YZJ3dalEYjuslabckQFLASykYiyhgNLmLu0is45rXz3
         B0oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yWM9/Ii1";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a5d4b42000000b002bfc36d4c9dsi135787wrs.487.2023.02.02.09.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 09:58:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yWM9/Ii1";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNdqy-0006Pt-VJ; Thu, 02 Feb 2023 12:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdqx-0006Pb-V7
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:58:31 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdqw-0002PI-HF
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:58:31 -0500
Received: by mail-pl1-x634.google.com with SMTP id e6so2627680plg.12
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WDUufeD4urBHxMtx/WT/mhl2y4uXGjnOKa0DWhCPUIw=;
 b=yWM9/Ii1UvhP2Ai16+cQgGMKKNTjAfiO3MGtu0Lg5HYNIC2pr+a6hpfFxqo8ONcbDb
 dp+0o5lBwh/JQ6Lur1o74aPmPqPBclfL+ejeCMci6GC3XSnEMH5zMn92jq85xQDHvuZ/
 Lw+o6PnoQ3jcUHe0Jrg/5G7o7rcoK4z1O+NWkSNgAusaKav1MqXMmQHMt5KVlA1Yqo23
 79MV9UJbjh+M6Im/LvlhHsiXLs3j2xVGc7bP4AMuZ0Yo+B9jYfbOgEXc0ORXOeZHnuAZ
 3tV1z5BLWADstbEa/RI8UpsT52jDL2uZy03WzMyyS73urgZ8KoegU3PBKQvIHwrvaAQd
 uCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WDUufeD4urBHxMtx/WT/mhl2y4uXGjnOKa0DWhCPUIw=;
 b=k2ZYY4IVlASD2HJJWm8qG9XJjLihiosOsOjnDL77GOHQlA8UaxFdyWVp5i5GG28kEK
 VJ3XiDcGD6cemYyuxda4Leji/qXv8EAK5s4hzdRJ+k6J6qffAlCnnBydcrspLd4j1KBA
 cCWKQ67CYU24Rc3V5iohICmsjJYMMpkXMYLtSineKpDeTSlOomtnfAJQhxNGtJyZzmVX
 ndQR1GMOQdJdlssWjnyKdWU/8+dmUEB9EnP12cVanJsK3KCxVUD5phRaUTcXHzkL1HfQ
 a3LkqWKtaGFg/n2KTMgz3QSUasZB92EBbtzoQXtfEVuAnbomUhFsgMNFGodqnphRPpB2
 5zYg==
X-Gm-Message-State: AO0yUKVDhvjPfeslX4sv8mcAwUOuuwFjmcK41wdiXpptiBzjeAJaVsft
 M/eMaydxbpHzH7QQSIHWxkCi6l36RTspFLAikeEMBw==
X-Received: by 2002:a17:90a:5a42:b0:22c:19cb:9489 with SMTP id
 m2-20020a17090a5a4200b0022c19cb9489mr670657pji.137.1675360709161; Thu, 02 Feb
 2023 09:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 17:58:17 +0000
Message-ID: <CAFEAcA9fwuSNBX0oY_Gr5jXAQQwufzkaY1zkySkTtB8Gyh30SA@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pevvpolsDq2y

On Thu, 26 Jan 2023 at 11:44, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Cortex-A76 supports 40bits of address space. sbsa-ref's memory
> starts above this limit.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 1 -
>  1 file changed, 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM
