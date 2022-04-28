Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1621738lfu;
        Thu, 28 Apr 2022 03:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEKFpzex3czNrkPAJNQ7QWSZ11mHoUDuncIWv4Xu0AJ4zPK0mFogQktyUDnyjHQANW24jv
X-Received: by 2002:a05:6214:765:b0:446:5ba9:acc3 with SMTP id f5-20020a056214076500b004465ba9acc3mr23506053qvz.113.1651141632887;
        Thu, 28 Apr 2022 03:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651141632; cv=none;
        d=google.com; s=arc-20160816;
        b=HCXkiJG/QFSCMJyIKgtsGoU050oilVSSHJz83I49grIQzDSkOStIFy8To1GsZzJWq4
         mJijG3vp2rvdkkAvn7Z8OLa9Juz7JZ9yfMUkboMDtO7vVzhyUlMLGL5IiLJzpKfje9va
         4F57k+QqgbtbLqnhlxd4G7EAvUzAFl3Nr4MohtJJDqIfVVRE4x1sWkvxLh0wX7b/PljL
         KAhyY3L1Mzn5UpBD8joIsi/64aI1OETUy6Ezn2/z1XTWxNsONpipqI9/ZRkm0iv//pFh
         VVt0SCPMHaEdd9Wm/PAmaLESR/pvYAyRxUmtqTMr87WoPBb2ny3M656sCsd3wF5u9Qi0
         Wqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E9ia14ThDKbyGKD53H2IwGmPo3bG2Bkov2wu6wBUF1M=;
        b=vxhW9oIL0INmkAHtuw72PLlv5dGMQoGOAkqS/qDk7uVX8ioe0GixCEm4PqBTcgTKon
         viz+Dnry8ZWhKWoMLwN11uOpOwRkYMOrZWB2h1iC7h+GyNNGBFGcUhH8rwKJr3rTJ/iV
         oAjgP9MbicuRB0OHq5ZR6uPOcH65ea7NTXQL31p9gmko39B1NBUJxK3WuHmDqqYKffd2
         aHpJITuvIW8X1F71AIL8ebZDiQD0/WHAC//UPTH4Zg2Pg5wDtGXQKMOhTqIvmjS5yaU8
         nW20t+lo2+iZH0kWkkGAO80GV9pjTTvu10iojppfZtXU6Z1kBVCYa2uiqcVoXFZNC3EG
         Enfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cAN+0Vxm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a05622a174500b002f1f29f5f20si1526222qtk.746.2022.04.28.03.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:27:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cAN+0Vxm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1Me-00074b-Bt
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0w0-0001hd-0G
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:59:47 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:41877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0vw-0001j8-B3
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:59:38 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ebf4b91212so46820617b3.8
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E9ia14ThDKbyGKD53H2IwGmPo3bG2Bkov2wu6wBUF1M=;
 b=cAN+0VxmBDB2uTWvSe8ARTrNaB07j2lZQdIHXn7qgkWDdpyJgCNblklTshnHIlx0DT
 zPJB/O7bJjkXgyLNdLbhV9hBd5Ky4fRu21LA5p+NUbcTLHD2gNtnucn5uwSYNGnESX3P
 xkmX6yCDT1XB4I0q5KAyEtJXe0zdFyLENTfiesMW42pmGRUvWLf/22E7sSVgbWWzgtTW
 duCDS4KkEZ0EV95U16QLzu0PwzTVVm0RbzCKgd29pPSDMn9KkyDQCeNlwkU3lPikqe+E
 He0tV5FJviHsA5MCZXHshiW1dY/7/SX84zykE9MqYc3q2Evzy52ZhvRlAxiF3P5Kx2/e
 ZUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E9ia14ThDKbyGKD53H2IwGmPo3bG2Bkov2wu6wBUF1M=;
 b=xehQXPgnNkN99R6Hc0h4pXitcFm6D9gsqvmPQbJ52zE0ZNX8n2fD94yxUiczfdl6vd
 FgWUlHWyeAiQWmEKEtfyE9jx6L6lyJAHHX0e1U3pKY23eYig/Ss8Sv89iJDRLcz3u1mv
 XMrzNglsI5Z5w9iBLIO6tdzti+tG0zBmesEpDk6uER+TIVATu2R9C4DoACn8O2Zgv4sz
 qtPkCDw2cPDlc6wfk9ynLrD/a6BNqOXebaynUnd6jc1T2151W9Cp0Acd7uACWlNH6TfK
 OD+Oosf2W/wWAnXW3bPbOWMWoHBZShYNYr8oZbxvqg1PxN+9CiWzCeQQBNYBTBXEIJXH
 3ACQ==
X-Gm-Message-State: AOAM533Telvci/g7h8Ww2B/XiwpZLZsTGHFTKFObxXp3IcU/mA1RHj6+
 Fp42g4nV9jUEzVbN31/cCWuWQobj9yEitfyy96d/4g==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32395011ywb.257.1651139975373; Thu, 28
 Apr 2022 02:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-13-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:59:24 +0100
Message-ID: <CAFEAcA8pZqCYxDZ-AvWLJVSHiHcqmNLWmfPJJnt1Tqbqf6SYzQ@mail.gmail.com>
Subject: Re: [PATCH 12/47] target/arm: Use tcg_constant in disas_movw_imm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: agyWEPx5AEGF

On Tue, 26 Apr 2022 at 17:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
