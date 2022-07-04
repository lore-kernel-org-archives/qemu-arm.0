Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3187253lft;
        Mon, 4 Jul 2022 05:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uXIaCR2r5FTH1n5d0Fn908QWawXse9AoDXiAO7MfbX29Vh+7pvwXHBTBdf7hpIoRkqPNOP
X-Received: by 2002:a05:620a:404b:b0:6b2:5f8d:9e86 with SMTP id i11-20020a05620a404b00b006b25f8d9e86mr10657834qko.484.1656937712833;
        Mon, 04 Jul 2022 05:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656937712; cv=none;
        d=google.com; s=arc-20160816;
        b=eSM/sE2oSo/l4/08QaTetsr1YrULuD3xjeqcXSMx8fZK11YPbS4FKnZPImkequ2T9N
         5n7f/DViii5GeSbJJO6xdJhTgn/A3X6BomfDaAiYECk1t2MX2jS74MVLhw71Wx0kPJnQ
         0ZmTUm5mIVFZSo0P6toOUMO79gBqGJtSo83NRGG3LnfK5LkH66dQGi01xB/WrOYMKHh0
         rEMwvvwippcsNSPpdDniHYIeZQkIV3S2eWWQnOH4Jt622t2GxQwXBM8eisoRjCwqI3lb
         qWy5uq3SXQlTUZbJhNRbRQPJSptEQv9mvXoTtoDasNgBjb4AL9+fN1QTSeI5FoiZFknG
         Tq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5kcCsjb8Qmfk7ZzzqpYc76PrXeMQI/nnyAj6l/1VmAI=;
        b=wsYY62OuEHxlUksmuSLHnbq972a5NpVewN02MvvyFyVdQW24Avi44cTHsxbV4LwUgu
         zIGkNIf91gNBkcdEHwlzVVWAxhIVbyUBpm0veMCT+TVWtnQKg175GMBfmmeS+QdbwzNZ
         aZh4PB+9W0vgyHtmZdaT7uqeehM8IwpM/Zo6kA7eIViNRpiXYc/L8SBGAvnfMK1oGC0a
         /7CJI0+MDkUzf/AWq1psbeNa6IgMIjMGEdoPBhr6X+WemxLpbLXpbpmLLc1AP3ShxXiQ
         M0nSxhwQ711NucEJmykSqGpQ+Cgq+zK24t8Ul1+nuoDrIFRYn+mSZQBBpgowcuhv91sv
         AE1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEeilrAH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z188-20020a3765c5000000b006a77d059ffasi15518801qkb.253.2022.07.04.05.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 05:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEeilrAH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8LBn-0001Du-PE
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 08:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L5u-0002Jo-1v
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:22:26 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:38701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L5s-0000TE-JV
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:22:25 -0400
Received: by mail-yb1-xb32.google.com with SMTP id l144so4089509ybl.5
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kcCsjb8Qmfk7ZzzqpYc76PrXeMQI/nnyAj6l/1VmAI=;
 b=bEeilrAHAo/YoF+83cG4kVMomNEKOhFgQWfmgNMIgJuJZw6JoAfee9dr/MZsKJr9et
 lTIG2fjvXrqYmz9dV/4UNoeT26K8PwPGBXxF/m7QlKgsn1M8MrjR1V2ysx+EOBUXxJZa
 h6dyp0DrXtS1RObPucb0CxQQi39tsvM1zANBbKXmhmOtP4Mmnd13DInB4HWPIYHiO9QW
 bVDEfy6uFgLdtr9DNh5AcxCxy8NtkjFb2jtrSBhDJY8hMv8gRS0y8StrN+kY8oOC6/B4
 H4588W5lHXdBKA6/JOQN6aQ8CmF3revtKeMznpuzTdRpR4l7+WND+412ZYCnO6Vd2gGC
 5/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kcCsjb8Qmfk7ZzzqpYc76PrXeMQI/nnyAj6l/1VmAI=;
 b=CKhXqeSxKO3tuTGPizcmRcn5Ft+nJ1GhZ1p1qFqHP2FQyuuO9PSb5DODsQP1tDDyNe
 mE+r/amkYONue791UFE5tj2P/xWFtYA+iOD3OdcToFOKiXhUNtm6pwdPDrGMnl3rDgsd
 bQTgr47m/MymNWWfSxeeVhFmll1WJpOwFVWSatXcaJZesnoajrUFostzRWohu3d9gl/6
 UtTVp88eugEpA5vpjF1XFGW4DdF1CyPSPnolHYai12phZTDoM4n0NvWxzI7yKKRl2FQg
 7Hxc+V0AoYbeRPwqcQwM+CN5vAkkd0Go0pNRCRqtfMdP1LSKJGXUpe5iBBDLGcMv3imd
 oBVA==
X-Gm-Message-State: AJIora8PX4hEZbFjtFWXd2DThs38tQDtLgV+cd3F6wooCDioRTbCRYnf
 0I16ABJNdou+Z9uMm9WcEBfbgaNmtezN/cv2FE4QMw==
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr5716532ybg.140.1656937343606; Mon, 04
 Jul 2022 05:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-45-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:22:12 +0100
Message-ID: <CAFEAcA8tW2UCw_fuyQMHta4Q6MgVsvCKtBOYhzv9ccr5kPhqaw@mail.gmail.com>
Subject: Re: [PATCH v4 44/45] target/arm: Enable SME for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: bopDN4cUE48O

On Tue, 28 Jun 2022 at 06:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
