Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1684428lfm;
        Mon, 15 Jun 2020 06:19:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7r9+wzVOkVdQj/vuQv93m3viHJKT7QN5Lxqm+Caek+nOsXcHTxtmqnTT0a6wvvxuHi645
X-Received: by 2002:a0c:e84b:: with SMTP id l11mr23709142qvo.249.1592227163865;
        Mon, 15 Jun 2020 06:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592227163; cv=none;
        d=google.com; s=arc-20160816;
        b=UNGBITQYmYFe3VtdSUcpqhNT1E2hCOyZr/HsAGBVLqq5oKZMPPTGxvBBqt2tsmtIIX
         qN9JimSBb/YLIw9eJBOAnclIihIC6LOdDcApWFd5sjaEgtE+mOPseXpyX2OszUCI3ZDr
         KzNe1P9Dv2deaeqh4/WuP0l6WZGussFsRk51MWlshMq25H2dMHJH5SVy+KMGg2DJjvQf
         VEMMug4r6A374cHnJ/37ERbzMwDPJmoOCgmJFtifyoI18cI1pifRbrH4aI+LjNnpeY2I
         fyvQ//KawbZAcwf5g/A3zqrhvuoAIuxMJSXufZwf5U4GM3TMsoUwACKIDP3tv1D3l1Oz
         mvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iUa3F5rCLnPg5E82JxiMsvHOmT2nCJTCGiR/A4HOnn8=;
        b=qDcHGrEU/J95+EfRdPp1QuhYgTKiCT1Ot+772APhFQA0edczDPAeYMbOZfNps+c+Wr
         ftNlY/tyCICGgPT77Bi5Yuk5Yb3Ae7ZBWVYSvkzcBokDSg4o/RoSUPqLGNERSFkAhE8Y
         4MNVMrTe1bz6vynGU52ZfZaOcy0DUzhW4EaglvlYtHa5hGteTgeg6fFEfE0t4RxDwagG
         3hXNhsEN4qC3jB5haAGLQ+odC2wvJZeOM/LwLv2/ZSgTGxXq+hHlOg6oIYC4UTgsGfVp
         SbGucSHLAqDueV5M76s7IrhKVJl92fpgnxGaz76QNLvrBZeQ+3y0KV3H95RXZz/8lETp
         cxZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JBGDOzvw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si9195812qtb.247.2020.06.15.06.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 06:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JBGDOzvw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkp1H-0006F1-7Y
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 09:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkp17-0006Du-Rf
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:19:13 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkp15-0002go-Gy
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:19:13 -0400
Received: by mail-oi1-x242.google.com with SMTP id p70so15790202oic.12
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iUa3F5rCLnPg5E82JxiMsvHOmT2nCJTCGiR/A4HOnn8=;
 b=JBGDOzvwZCdrBBlyriBT6rAPFpDOCQRzdr2Ajqd76LW6eSRuuCq5tc6fn9KlT9Shyo
 wpZKFd6rxIZ0pc4nmLiinIT8xSRyoq6iJcwr7oNwkuza5TgQm+rx0qEbOBWpvO/4+vdW
 YqOXnKZJy5vmurde/sPzDYOwhIZObCkCWowxwR8fpC5zUbrZ3SZrzozg5tWod+abUWM4
 OHaqZIW0/Ssa6WgVrLboMj85iLgtCrH4IvSiGKxO+WyKnwAyL2LNrq/8gipJqN83toWc
 JMiqimt/8YGIscpGz0VUjNeNPH2oM53HA/TThPhCxRDuSqbEefulaJRvzOAG1Y0wprpx
 jkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUa3F5rCLnPg5E82JxiMsvHOmT2nCJTCGiR/A4HOnn8=;
 b=rxAjUFRVyctyISm6ZjkTAKQ8zRPKbCWSO8VSvKlrzLwcJVXb9aiQ57Dkp5ODVnlZGS
 EeDWiBBYODd8XTLCVxD6X/hPq8yVPlwUJ4tEMxdOoV47APQLPwd7HI027viRvG8ZxlsY
 e133W1kxh4snfwJYHf6a5TNl7023yv/Zq52UnLesRiFIHB12Wl7wDR5DAomyw3IVqKYS
 KJHqJRiP/U8i0Ygx8bj576lic5QoglmaMsjqKEK34+6qZDRAn79V3DqcggUDfqbJgLhs
 txEs11dGfAplE/JNpwAR+AWcnthgzzbZUXzxf4ZiiBKHHFn9XkuEbEJPHbKz8pMeWCLo
 t3hw==
X-Gm-Message-State: AOAM533QDEj/uUN1RcCS3JOnux44bnx4vs4jsftG/AC6rbZwAn574u09
 si812nWG5Pj4NKvdFokuPR1lgecTV0TgcQd2REleQg==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr8761584oia.163.1592227150304; 
 Mon, 15 Jun 2020 06:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200603145258.195920-1-linux@roeck-us.net>
In-Reply-To: <20200603145258.195920-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 14:18:59 +0100
Message-ID: <CAFEAcA-JZhwvim9QHCn2a3OYCfpjvo8U-LjNX0g+6jB9YMVFyA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] sd: sdhci: Implement basic vendor specific
 register support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T4RHaC/VEK3i

On Wed, 3 Jun 2020 at 15:53, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The Linux kernel's IMX code now uses vendor specific commands.
> This results in endless warnings when booting the Linux kernel.
>
> sdhci-esdhc-imx 2194000.usdhc: esdhc_wait_for_card_clock_gate_off:
>         card clock still not gate off in 100us!.
>
> Implement support for the vendor specific command implemented in IMX
> SDHCI hardware to be able to avoid this warning.
>
> Patch 1/2 implements vendor specific command support in the SDHCI core
> code. At this time, only IMX vendor command support is implemented,
> but the implementation is written with expandability in mind.
>
> Patch 2/2 enables IMX SDHCI vendor extensions for all affected emulations.
>
> v2:
> - Added Reviewed-by: and Tested-by: tags to patch 1/2
> - Added missing error checks to patch 2/2
> - Added Tested-by: tag to patch 2/2



Applied to target-arm.next, thanks.

-- PMM
