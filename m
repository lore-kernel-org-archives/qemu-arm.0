Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1202629lfg;
        Fri, 12 Mar 2021 04:53:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpe6dRD869abAOty3yQV8u3yx8MVK9Z5IbiIkYyeGX0w1r2ZkKDB+Ey/vdQf2Mgz+zS2fH
X-Received: by 2002:a05:6e02:156e:: with SMTP id k14mr2636828ilu.200.1615553622363;
        Fri, 12 Mar 2021 04:53:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615553622; cv=none;
        d=google.com; s=arc-20160816;
        b=pm2ZZO8Qj34RGHev/Mkxk06vuLqbg5ruUjI+lUEPjAZUhNgeTs/BQpBJDUTE9RBx7Z
         16SuavtAzXujS5opIxHMBWZehXSxNWhv8B2StB9mHLbbx8VKiQvzN+4N7jFKboGI7XQk
         wa7L7559Fq3RdEXI2QuPvmr1DI/0cYYMdyAMRGljT6q12sobC38CPBtzwZcfG3mJfJEd
         PmJZP4/df8v7X7RyZzhmaAb6RXseryVL1V9bHGG6OhBOSuDlzOohhocprsLRNsFL9CXR
         RHEiDRdFy7moGgzfNDjZXYunobYuV9dHoy3ngvtnM+mCmgm6iyHq6+a92aGZYC5lJwSx
         1n7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kK4B1DHNMhEV1S2zBMHr6FgjFX847uDCfiiP2/9A6g0=;
        b=EBA9YxassXCsDdw/qZuAnIyFsBR//vGlFpzpS6DznnbZE54lShdZ4hHouraf/u6IN3
         K/IOabkh8CVBSLdXseVs4/Mu7gYEqUDNfrD07PWIEfx7R/l+i4PVX1xLPECAYiIFOIZe
         nkoS782XO3gWHoD+uFKDaFlZ9rV/vA7XfQwiJcAwvi9VVNmTdzh8/nxQzCzZEkPiQXB/
         2/x5iNWNtw7e95iNN/b692+qC/M1p1jomTBdXZbkvat2UgmR6G9ZKiJJYU6QzYbzaXcT
         +GnvjliQ/CSJk+P5EO8yu8kSbaReIFZeMmi1W0EwqnQTs0J6NNECBYTtgyzvlEGWayqJ
         BX4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i0DWE5zg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si5061407jap.68.2021.03.12.04.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 04:53:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i0DWE5zg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKhIT-0003vi-Mj
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 07:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhI3-0003v0-CN
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 07:53:15 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhI1-0000ob-WF
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 07:53:15 -0500
Received: by mail-ej1-x62b.google.com with SMTP id mj10so53136389ejb.5
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kK4B1DHNMhEV1S2zBMHr6FgjFX847uDCfiiP2/9A6g0=;
 b=i0DWE5zgSkpzJSt4P44oM10UzHy1fF0WRyp0st2Jye8LB00zJMuRyC4hDapaN9DH8F
 d3YyW0ywEPZL8XmIMiIsTmsRdPNdoojMJc3pbvatpsDUObRVQHUrjrA7wNp9m7GYqxhi
 h+oT4A2+fR6BLPLskXYS/7qIqQCOB+8g2zU4yyJVmEhpMHucGanDuuS9gxG0vlp91Kvq
 cw9d4dSKgixILjJPahzJGU4HeHFzI7GCg6A9UW3IltNDF7sMPt18jEIinxe2eGiNw5L2
 8oa1YsXBiqZgHSsr+iVE2aH4IBDDNtqEFL+tYHTVipRpCDw+DOejkKUPFzyOyIXeEyBA
 7UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kK4B1DHNMhEV1S2zBMHr6FgjFX847uDCfiiP2/9A6g0=;
 b=WcRlmK+JogG8zxHFB66zHn+3WTZKN5/H/9xFgXJ68yrRwPG8Er59997Ct3Biz/8SdQ
 h677900doQEW4m5uZOYjFAmey0ruk3d+Us1Jg9o4xiSQxwCihbfwA7z+YN5scc1qcNJF
 i3E0VmaX04x8c8pYqAWS0HNFsreCGnr22TVAhYxcvlnMDjx0tQurUaTTE8D/nQkv4hOi
 h6a6hMwfn6+Qd1skpK3QDebi1be4lCy+2+UmlVVZNFqToW3aBF99Mor972SE++5pgwS1
 eg6jtTvbA+uy99R7yC7LpzZ/o52dfpEj1+hsgpD9Phi4ZFrBDUimIcxtQQsqWKALwpJw
 Ol7Q==
X-Gm-Message-State: AOAM531PVHbZa7IzYK3n1e1IYWOGFWfEc/Wwq4cjAKZ6zo/m4zrJxY0R
 LTbgVbdcKNWBMhAjBXWOJnCLbYnAFZ3Js/5VElx1QA==
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr8291111ejb.407.1615553592454; 
 Fri, 12 Mar 2021 04:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
In-Reply-To: <20210311180855.149764-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 12:52:53 +0000
Message-ID: <CAFEAcA9WchN2TLCTPW9FJqbrpEisSOhm74ODuAotn9jiAQN6oA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mU40HEpNxrW4

On Thu, 11 Mar 2021 at 18:08, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
> device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
> the RPM of PWM fans.
>
> To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
> We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
> into the MFT module.
>
> The connection of PWM modules and fan modules are derived from their specific
> Linux device trees and coded in hw/arm/npcm7xx_boards.c.
>
> We amend the QTest for the PWM module to include verifying the reading from
> the Tachometer is correct.



Applied to target-arm.next, thanks.

-- PMM
