Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1536601lfc;
        Sun, 21 Feb 2021 23:53:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbToMuBTSC1rM4CF2E3ak5aUfoJKU3WAchuGOSR7JuMl8CingFQJFSvcQec2ccl7XpuWnN
X-Received: by 2002:a25:ab29:: with SMTP id u38mr29851795ybi.327.1613980383348;
        Sun, 21 Feb 2021 23:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613980383; cv=none;
        d=google.com; s=arc-20160816;
        b=iFk3GdotYFtJNx5NIBUKUUZYuX/WolC4M1Ggyf2G0q7lYj6QL18yQ/AToYh/iPNgmx
         OPjXu6sxh+HASLSew9UzyB0e52/cLKRySg9aEkGYsl9a4VJA6+1qtZGJLTAGvPgp69Gm
         F4TaTM0ffcR1cZQiJyXLY0tOiwJ/PYEIz0gXIaf4NZ9ziWZPGQ0M3MIWeUk+3JBs6UM8
         eSEQVVs5na1dnrzLStgSzq+SMT4oUZmOcpJazdVehZOefrLqGmoBSRHW0RdwctaCh677
         3Ni+JJC7p2Cb4+9kpdYluhcttzqJKCo5G55YOp9g9XGijNk3AUPV+zOqnnLCduqzKZH5
         klCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:subject:from
         :references:to;
        bh=6Rtyu/Mg/V5WDnvOL+0naBVSDQ2Yhg8qv8m6sEDQ9Kw=;
        b=ZD2qywsQ75AzSLf4QTfgWxLI8P1Yn8zO9+05XNmGH5cy61uStvgCKpsoTb2jgrz/DY
         AHMkMNYKvZX4vL7YPR1pf6vbYa6phOXs3U4JKZjex5Jkp5Py1J+81vLzwPcy5ExoqhKI
         IFVLz9r6IxjaeD4St7wTGe6a8UxIrtn2NhsjUOP6AofWzGp47WPqGLFG7V5fFt6WhQ0U
         rfkioVnKSAv3k24Q8hlThaLFpUTgke8feoi6z3WK/CLVVVcpGjJqUjLMQvcrqSJdPy2H
         SOE6R+7KMxf4YyeqTOtKslprOh0f4zy0eFKUMiUHWX+I4Dq/VPj20R1Dp0WQ0U7DnzhH
         Qbtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si18140834ybj.393.2021.02.21.23.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 23:53:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lE61e-0006oR-Oo
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 02:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1lE61W-0006o0-2m; Mon, 22 Feb 2021 02:52:54 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:33752
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1lE61T-0007y1-MU; Mon, 22 Feb 2021 02:52:53 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D7492DA0774;
 Mon, 22 Feb 2021 08:52:47 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210220212903.20944-1-richard.henderson@linaro.org>
From: Stefan Weil <stefan.weil@weilnetz.de>
Subject: Re: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
Message-ID: <d5f00b72-4436-d891-a589-20bc011630af@weilnetz.de>
Date: Mon, 22 Feb 2021 08:52:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71;
 envelope-from=stefan.weil@weilnetz.de; helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zcZux0B2PTjt

Am 20.02.21 um 22:29 schrieb Richard Henderson:

> I guess it has been a while since I've run aa32 risu on aa64 host.
>
> The launchpad bug is something that should have been seen from the
> beginning, but the similar aa64 operations are expanded as integer
> code, not vector code.  The aa32 neon code has only recently been
> converted to use gvecs.
>
> The cmle0 (zero) bug has been exposed by the recent constant
> propagation improvements; previously we saw a reg/reg compare.
>
>
> r~
>
>
> Richard Henderson (2):
>    tcg/aarch64: Fix I3617_CMLE0
>    tcg/aarch64: Fix generation of "scalar" vector operations
>
>   tcg/aarch64/tcg-target.c.inc | 213 ++++++++++++++++++++++++++++++----=
-
>   1 file changed, 182 insertions(+), 31 deletions(-)


Thanks. This fixes https://bugs.launchpad.net/qemu/+bug/1916112.

Tested-by: Stefan Weil <sw@weilnetz.de>



