Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp916868lfq;
        Sun, 10 Apr 2022 01:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb4vvZDzoDXJIz0y3gVb8EJUcOvjEGIyS36QNuMGJaXVuJZ9fkYm/3Yi0QKW37xrEZXcTX
X-Received: by 2002:ac8:7c45:0:b0:2e2:293a:7966 with SMTP id o5-20020ac87c45000000b002e2293a7966mr21980853qtv.478.1649581047311;
        Sun, 10 Apr 2022 01:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649581047; cv=none;
        d=google.com; s=arc-20160816;
        b=K9sBQYHFi67qTp7ktF0L5i/Yc8ipWcb8KPtGtk36VwNtuSkjGcNnobM4uXn30+SS9Q
         uoCJK6yo6WQldJUbT23pMR49yiVKP2rQJgrASwxgI0RxbxH2WR3XQty7KDiH0l80T5nL
         MAL59+lGh7aowLwfNlWcstIjzKbbEUMV1mDjF2dNCdhbqePkvZYn9/D7uhUDP1RgWGZm
         QQrtsMV+b3CCaq+HjFrlDnwL+znvGi3K/EUSK2FxygOcfej+iugel8b9yn5KF/ZyY7zV
         CBCXvRkwZUoz87r/TNWU/e+iDbHZfWnqcMumoHjv9gwHZa7duVYxfDYIySOoZhDkBiSG
         vlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XggvBUhDnV601uCEk3Xbd5mzPN3qdhXkLM5Gh1Tg0zs=;
        b=H0bhhkTPpC/17dFSlJKMQciaHxg6ZC49H9me/IKnFzP1bD407yLk/zbEfnYRJmrjja
         cbo/WxAqV/VjrfoeNzuhm88+TwIBHrr5TPf5u30DhXjShEV1XECi5VhD+UPCM2zLg+oN
         7DS5T5QYkCWyg22HIVroHEZiHQ2DSI82YPxuVsi/H3f2NB290LQzrWtK6nPjuvg+DkSb
         /P1KE0ejdGnogSUSKmpBSFs4s0S42hcnRgURVmH9DW/96BSIol9WJiUQpDnj3DbpOkCR
         aB5zJ232tfkPHFOJAKf/6xqYkkaRdBCi7r13HDeYBt400nZ79bOT43Om5TiAYCBiCLsP
         +lpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sLXWPpPB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05620a440b00b0069ad44d7f43si3256216qkp.700.2022.04.10.01.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Apr 2022 01:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sLXWPpPB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndTNu-0003dr-RG
	for alex.bennee@linaro.org; Sun, 10 Apr 2022 04:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTNB-0003cp-Fg
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 04:56:42 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:34799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTN8-00020z-Sm
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 04:56:41 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2db2add4516so136609537b3.1
 for <qemu-arm@nongnu.org>; Sun, 10 Apr 2022 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XggvBUhDnV601uCEk3Xbd5mzPN3qdhXkLM5Gh1Tg0zs=;
 b=sLXWPpPBJq5wNj4RbSSYArrp30alFTAr/kUfNi0Ya9FdR6v+z07ZtBarAlkQLGIssO
 Rt6M+fBY8zamw2DBceAwJHPH8+g0OV3pZlZzYdF5pS7OJLrGGfaXm+8ux+dH87aboyOu
 LkMPQkSLQx1L3+DC+n8Yi1ZFHheEzV83QZ0kkiGi9LP+0OV6iz5XXUqzh35Yd8WkGrIf
 C4NzDq6vtWNOWv0ZIe/D797t489oNDS8DycJAXjC3RElvAzzxayD6STTDMJEGiZ9tpu9
 akDqokuHA+kfU7/du2GiMN/0JyYvq+ksA78Qw7qyxhrpPaN4Cnb/9PqMNCYBsVukrTC1
 01bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XggvBUhDnV601uCEk3Xbd5mzPN3qdhXkLM5Gh1Tg0zs=;
 b=X0AbZL/B077yluCR9biFgMSfOrl/mP32bWh03nhAlk8Dd+Nd0WI0Q53RZAm9AlUIaG
 XGCr/d3EuYRFloiIxjTnMqBljiactSnqTL2we9N+6rS0ZdQOiXUaXBqcnrzDLRvlQ3Om
 HUYoM8YFTzf9cWozRtkio8VMiQFOfkQCc9oHkydOsJa/69I1LVnGk0Ws93AHf/lYV883
 lUURgh6lf7la3UfjqJwLRZY2F6VP8Bimb2lLPiRhUiRsu7ga4ITXK1QCstROYH1t7Qrm
 uFF+d7RkblKwj98rlWoWMlrv4xWPv5GXMuiIdLfDztz/cpWJLmky/zcyHXRc44OmOc8U
 oKNQ==
X-Gm-Message-State: AOAM531rs4I2PCF/h3g33DKDkdZY1lMofegKeZaxiwpBwxQDGistmwzS
 /scefTfmhKf/qlUq4AUV6DzkgKAn3OaffeyHxeellg==
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr21511500ywa.455.1649580997545; Sun, 10
 Apr 2022 01:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-30-peter.maydell@linaro.org>
 <5d7391a6-21d6-01b4-fee0-289c3891def7@linaro.org>
In-Reply-To: <5d7391a6-21d6-01b4-fee0-289c3891def7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Apr 2022 09:56:26 +0100
Message-ID: <CAFEAcA87X7z_KSv7=FGHRxZe6wttRvRLwKMvnpnvNY=UZv4bkw@mail.gmail.com>
Subject: Re: [PATCH 29/41] hw/intc/arm_gicv3_redist: Recalculate hppvlpi on
 VPENDBASER writes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W52twaWlQf+z

On Sat, 9 Apr 2022 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
> It it really valid to write to vpendbaser with other than a 64-bit write?  I suppose it's
> possible to order the 32-bit writes to make sure the update to valid comes last...

Yes, that's valid. The GICv3 spec states specifically when registers are
64-bit only (see for instance GITS_SGIR). As you say, you can write the
bottom half first and the top half with the valid bit second.

thanks
-- PMM
