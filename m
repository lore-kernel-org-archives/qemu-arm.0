Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp786947wrt;
        Mon, 11 Mar 2019 08:42:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGBBmMXJqDg4lTTOwhnyCNaNqYSYWkjWYmBTFXCS/lyjBlwFQJkVUtPlBbI0Pgs4Mza+XL
X-Received: by 2002:a25:e68d:: with SMTP id d135mr26866559ybh.334.1552318970233;
        Mon, 11 Mar 2019 08:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552318970; cv=none;
        d=google.com; s=arc-20160816;
        b=BrCIUPse/Ut1NAfnxFqt5+91YaPth+rd+q0+icdypg2NTI7nvZ4VLPQSIyI8mKVyW2
         5k/BiAfRrTage0x73ZRab6kySNVWyS0OZ0NtoYygLDUJEaTYXDHSNLZ7WmCh36m/phOM
         4bn2+mVpQSJQnxwpRt9AaxsbAWIuBVfVsq8rY29K9Fk61l0iNEXmZd9D0ap0aLtuRtC8
         79czcokNULntJHiyaLCozEx1Y6UWu83rYO7mV0Q1UfV6c40QAKN/jGZUR8TMiHUgxTfM
         DBnD6rc2Xcu8+xTvxnnTvEI4tZayPnGwhvPfliB1Lj2GiyCF4eBBMQKa1MkSkIe5eov3
         3vXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agFo9HJYAf595Lr0l0OD1ZQ7Fie//HtP8itu38XADI8=;
        b=bV5rtoaiEe8NGihUu4VSA2llOIzoZOdAfYMXmxmFb/qg4UQ+fazAJ/f9yyht05/mvr
         NGtTu1thEhptrDDwDM2zvfZdQ/q7qtVzI/aQjYaEtEWCzW/46HY3CQ4Ok5SzvLRU98Qz
         cSODSpLBMwEE3hDDTjVmrNvPuPwHhe7wZmQI8EJYbDGOt8mt+C8M3yU/0OJ4bS43wyvF
         5Tp+7yJzs70mS74SGbe0op0GKFsvnYBh7cgXIZClfIsTL6POT6MbidnQOumzNYZpTqpr
         RCQj2FvVKG/sVnlvBxUB6HTkIY14HEGnrdq4B4P3tgppGybeBA8QCjbdQx1zb/6QtqTQ
         axrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jkwKNxc7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o75si3549916ybc.90.2019.03.11.08.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 08:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jkwKNxc7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3N4j-00064O-Jj
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 11:42:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3N1W-0002qg-NV
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 11:39:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3N1R-0005aU-3Q
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 11:39:30 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40195)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h3N1P-0005Zk-5p
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 11:39:25 -0400
Received: by mail-oi1-x243.google.com with SMTP id x187so3994435oia.7
	for <qemu-arm@nongnu.org>; Mon, 11 Mar 2019 08:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=agFo9HJYAf595Lr0l0OD1ZQ7Fie//HtP8itu38XADI8=;
	b=jkwKNxc72qtk5pk3w1VR0c4p3L+8Il31KINdCdHbFrU2wMqID58AY6aAkP96v3ts/a
	cbsR3jz6zLe2WgzB4rZ1ZxxdLK7633eTUeLHghfG4c+z4L425GCw2yR+S+EVBx2gkK8P
	JS7ZM+OkYYck7H81xv5xlHtZeCEAMFJHpLjROJ+SeQGZOekU3XEPUShKcH7xGAW3FfKv
	BAg0xYeqarwvfycET9SD6HSa/K0SKHx5B21EnaSQxAP93yZtLuBtls5l9n2x0dEopacy
	Y9BqnDMVDQmYvT9T/DVyhheLw35nvhDg5tFJPgxPH+BFPGzFOdFQrh86wMS1qVQR/rc7
	NS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=agFo9HJYAf595Lr0l0OD1ZQ7Fie//HtP8itu38XADI8=;
	b=LBIFn3RiJCDvQMP5x1+360/gV9mP5oto6co5vNzQOA1c0y0XIPMLc/nZLlu7zCmp6B
	aJtRqG1Ttgt58dfjPMnYvX173FdQGmuR1Qp21dQapzHlCKllwlHwdrPY4lhPE/JRlM5g
	mT8YGSIZS2IfM9JPyrvvFWU8VeDm/wnsHwWVnFKYmjohRT4wADcKY5zNRSVNkX/N8llO
	BnurhiVzIWUjgzXVEUtaVnCGGrZCLpY44HRUlOBPliVAqSEIOqU00A5r2Ax9JwQZyBKs
	Hv3bEp/yiPZc9juF2HzunAICgJH+FYjLPkyXBSPHEGgQMvOgSEEmIpvuA2djWTAZ7bse
	rRgw==
X-Gm-Message-State: APjAAAUGDyr34t4EoPvxza53rdQF9zA6b+n47M+zP2ff7X95AXMzQ+z4
	CCMh3L9nuO24ughBI3oHCpWkosYGnFUwR+Nu+LgXQA==
X-Received: by 2002:aca:c1c1:: with SMTP id r184mr192095oif.146.1552318761782; 
	Mon, 11 Mar 2019 08:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <0184EA26B2509940AA629AE1405DD7F202153AC7@dggema523-mbx.china.huawei.com>
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F202153AC7@dggema523-mbx.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Mar 2019 15:39:09 +0000
Message-ID: <CAFEAcA9yr3trFz7ZFsS-P-g=gxe=MX6Eet_dTdcOCSdhW7_J4w@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [RESEND PATCH] target/arm: change arch timer
 registers access permission
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJTjT14xux+u

On Mon, 11 Mar 2019 at 15:24, gengdongjiu <gengdongjiu@huawei.com> wrote:
> So If QEMU defined the timer registers read only in PL0, even though it has been configured to have write permission in PL0 by high PLx, we still cannot have
> Write permission, because QEMU will firstly check the defined permission and then check the configured permission by high PLx.

I'm afraid I don't understand what you're trying to say here.

Yes, it was a bug that we marked these registers as read-only for PL0,
and we should fix it.

What I am trying to say is that
 .access = PL1_RW | PL0_RW

is exactly equivalent to
 .access = PL0_RW

and we should use the simpler version of the expression.

(If you look at the definitions of all the PL*_ constants,
you can see that PL0_W implies PL1_W:
#define PL0_W (0x01 | PL1_W)
and similarly for PL0_R. So all the bits in the bitfield that would be
set by PL1_RW are also set by PL0_RW.)

thanks
-- PMM
