Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3965828lfa;
        Mon, 19 Oct 2020 08:23:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf6+kILzeR9B+FuIZHdEpKRG18nf/TfiBgRQMOubDZQ6bWjiyXU3MhKaFUikAdKdrCsr/j
X-Received: by 2002:a25:1442:: with SMTP id 63mr245044ybu.173.1603121023191;
        Mon, 19 Oct 2020 08:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603121023; cv=none;
        d=google.com; s=arc-20160816;
        b=BpZ1gt01mqYwMB2MsVg1NfBWv2hgX09XpRCAEoZs162ruWs0/uJDoh3SucYxN1gELA
         ZOxkfiYkfQZmpbiJ5DKI3mYsziMow6g2t8J6nz6XeldaOHYSkVbEuevhLljg3twTgokB
         gAqMJqXM7t7cwSSw7ERJeZhGAo8w8Ibe/dbL5TgC16qwNU67A5d9pCTmhkVjEH/H2m06
         +fJ5CkgvOEovu3NvZxrjr5E0lKEpVQjzx3tGmELGf+x2SKkFvNxkhLbWQ8ZXVs+sAsRz
         ygtzkc3LCQqpfQ0XsAU9H8aTWm2xjWsyNCgu8cjs1cAJ8AlH/DVABqszGVD5eBBQIvTc
         WXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rEF8vCp0ne68s88LSiZAalVd6SH2xeZNXOAKExoOtKE=;
        b=BjU6xqpYrao6OtMRiaE6H2hK/mKfbNsuWi2AS01Xnj3XuBLGo8O+7BVs1qwdymbcMF
         tWtrHsPUBi4P7MNWnyDB4UG0Qu69iumLPZvWXJEYmZ2Sw5M+5u4Hq+AfSWv4nUsd0rtc
         c7sgtGxLfiqmNeLGS5VVvaTEZOAUL3RgwuB//dxVoBaxhIlwEz2fgrQ260L+pZWrQB/t
         xSQMKBHvZw1I4nH4PVYJMYApMK+a00fUYAAv8brKCir+K4Ll1bFzP/CACALHr22tV760
         KABqbWC+m/ctJQn2pE309iBozDU3cGHxWWx3E/04T1A0n72oggaGegykO+WiqdI92Dqb
         p/dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kr5wNKDm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f96si305092ybi.197.2020.10.19.08.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kr5wNKDm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUX0g-0002YN-HF
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUX0P-0002VK-O5
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:23:28 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUX0L-0003xr-9e
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:23:25 -0400
Received: by mail-ed1-x542.google.com with SMTP id l24so10669996edj.8
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rEF8vCp0ne68s88LSiZAalVd6SH2xeZNXOAKExoOtKE=;
 b=kr5wNKDm58CZNtiJgvXFBKp9c3+gbXYA62C3UKX153CcgyvaEFH5t2Jc6JO+3O7J6I
 4BpYo4iLK1ZMb99ku2yfMys2bo5/ZtRRUdyvisTUJpr9HmIPTJxjLXBXWzLinZhPgiL0
 AIMaSw0ENxU3tEctr6sHY/E63fzbO9tXLaIsn5z5mlSWBuDLz+8Kr5ZaVqKxtMEVsHp7
 qAy08+fk9v4TZDWhsFNLFNe6ROKDTc0pLD4Ve7c678ei2f7cM5ch/l2/F+qjVuqx8OkZ
 cRnrAd6g5ZySAufzy5ziCqRBjfoTxzi016RnR9iimL6W98U6QXe4ln43PfC0tPA5TpFV
 oG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rEF8vCp0ne68s88LSiZAalVd6SH2xeZNXOAKExoOtKE=;
 b=nFvND2XTs+kU5GVHSlBHkNH/aEgEQvHUIgzNrwtCCOVoV4cMij+Fdm7X8+bCfr0TtI
 BydVsBCRXYZr9qbcd5j/SRuP/8mmYbzP26OFGh+m7WGeR5yZPdRNJi+iJQI8OrOjXal3
 +VInQ/BO+lPNQugAX3zgNokE2RH20jGu/LUsLYp2r/dgwMYiUypshuQdToqtRNorb6zV
 DQIClxYZyJ9p4D6Ly+v51bCmFtaj91KxSOj+pE3LCmiwbi2q1qQyQXaRsApsp9i5rd1i
 DDaXm+HVqy1exfNNDEqiUybO0k0KxlaGadc9UX7NIBc4nnk7yE+cPhyF06MQ5LJpJ5NU
 kKuw==
X-Gm-Message-State: AOAM533eJJ5hOqL6s2Ju4e7ZD8Zh+gIOvbW08zJnjTT+JewhUEQO+XjJ
 0ftG6ZqQ3uDBRfkVHODZQpTVtislkz1OS/cklSP3nw==
X-Received: by 2002:aa7:c7d7:: with SMTP id o23mr353827eds.44.1603120998221;
 Mon, 19 Oct 2020 08:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201014213601.205222-1-f4bug@amsat.org>
In-Reply-To: <20201014213601.205222-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:23:07 +0100
Message-ID: <CAFEAcA9GxfBR-vFeT=QdmRwD1Y_6orED1bruXEsvyD73osV2WQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/strongarm: Fix 'time to transmit a char' unit
 comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LgZnahwJ6pqD

On Wed, 14 Oct 2020 at 22:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The time to transmit a char is expressed in nanoseconds, not in ticks.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/strongarm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index d7133eea6f9..ca7c385f313 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -935,7 +935,7 @@ struct StrongARMUARTState {
>      uint8_t rx_start;
>      uint8_t rx_len;
>
> -    uint64_t char_transmit_time; /* time to transmit a char in ticks*/
> +    uint64_t char_transmit_time; /* time to transmit a char in nanosecon=
ds */
>      bool wait_break_end;
>      QEMUTimer *rx_timeout_timer;
>      QEMUTimer *tx_timer;



Applied to target-arm.next, thanks.

-- PMM
