Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1947030lfm;
        Thu, 23 Apr 2020 07:24:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypLScWWtP6XWUp83LClACByFmQ2uHzfwcUoCbe4FTRl9Cte0j0DMtKu20yoI2J1WMpAR4uUB
X-Received: by 2002:a37:9b4a:: with SMTP id d71mr3718035qke.382.1587651890972;
        Thu, 23 Apr 2020 07:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587651890; cv=none;
        d=google.com; s=arc-20160816;
        b=sV+H3Pel4c/ujVOcz60KBdetwvlziE1XVLItCogimvHhR7b7hkV4pziITgyl2nKedd
         iixE0s8J/BraL8Q1llt5Ths8/CzTSy58WLNqfqniyX280lqTVMAGTJy2xouNbQgG265T
         y3nMVkg/fqt7ttlKQU+lWamjajqrjd3Gg36gYuOIM81ZfFG4VHdvX71qJkAkJ9Rk6VNc
         byIaRfK+KuIjQl2/qRfV3JFRUo9XO7Q5jxyB9mmyWRS/1MjtFcSWPPcj/C4t6KrbKs/b
         8h9i7Iu/D6jeq2aVpDp9xOZVpm9uiPtfSJWunncZKkReIBqMP1MQcHV13k4MU0TQTnDD
         2mzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eMxQk6ZIfsvwZJ7HQpKIUi+W5t1H870hsH8dXn0Zsh0=;
        b=jJFsT51NWDavysxisFysthtsd7HzRv/CtjCBm1ns4zGAPntNfJWgFc/+Wta2WYnZWD
         GOZHSNPo2BT5B7WwgGTc0UeVX6yQ6wBf2MmWwlCyJHkYscFYTHUJEai/KjiR0WPn+Za2
         8t2X9ACjvAdfxYjZ3TS3lc+Kdfdr4u/2jpO0Tdrr1n3154RpzXwlarnvqyMfVoS0xa8z
         pUIWP1040zUm6aupaMA5tbvIh1Eq7ddDEYX7IpF22XPWp3xtWc1KtM/bj18DFG0DaRMF
         xVxglbbI1zFsebFjikmEG/U1Fj2WC7phZMCXMBoe6IggqOyPtH3JdVZE0XVQEEfQ6ih5
         p5gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RBIpIlsA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si1710976qvi.192.2020.04.23.07.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 07:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RBIpIlsA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRcmY-00034y-EM
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRcmO-00032Q-OW
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 10:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRcmN-0004ju-OR
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 10:24:40 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:36851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jRcmN-0004i7-Aa
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 10:24:39 -0400
Received: by mail-ot1-x330.google.com with SMTP id b13so6327757oti.3
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 07:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eMxQk6ZIfsvwZJ7HQpKIUi+W5t1H870hsH8dXn0Zsh0=;
 b=RBIpIlsAXxpMPl7nhadJXsZfdv0FG2as78OzQGCBOq/8ZKjyatEE202nQ2ziwEtIDs
 w4rJpDhXBIV5OBSA0nNsb53rRAcmQRbu6gpmGXg0qIV9RUON+5wIhfgz5MTuopruA/nM
 rcGM34OxHHUnx0MjSAMEUa8mqWwpBk1mZUOKhhzhR7X/y1vS+hRnp64iWkcg1rJR7hXx
 j/OueE8ptaTWIYiqtLC9GUaJGumdYkChRJi7XF35wm97b8Ym7USIFBZ+TzSZG/3lsElr
 2zXMDXNLvIw6mmJzSs756iCgyOKQR1LBC9qAJGdn66sZBBKv98UY6StVQZgrXIWicIvc
 5Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eMxQk6ZIfsvwZJ7HQpKIUi+W5t1H870hsH8dXn0Zsh0=;
 b=rvkz1FsxkHrf3gL60qLfSXxHt+azdyMgH2gJ/28z3Uq1IV0Y+geEZD/hsrjnOpKmVG
 3/qyxi1KKOkP7cHcnbKYzuw8YZVbM84FBebn/xMe+pQPtk/Z7IL4wCK0n0jhKtZyrTgf
 orUEsKqCHlFKqVeuXQF3UOpyX2BPzL86XzjDhT9qDpa2bsNSmoIjXW9rgyKsivnThg+c
 zSXVLT0yWrv9hN1OySOhX/+99W9X6Juq2YIlKeEsdYIHT0wgbefEBHpChiSdtr1NxuZg
 NeK5lhNJaffcjYVA6qNzBJlHV5rnCH+2ZW1yCAcCrBG5SdXl4la6qlgAIpm9GaGw8m4K
 EouQ==
X-Gm-Message-State: AGi0PuaS4YLxBC+iHAAYiVoYx4BFa0bSKL8KQLDMTSUXZEHLobfZeZpV
 1cVOCO0V9n0RVo/hgd5mlk//ZTKeUtz7FX4SS4pg9A==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr3553278otj.91.1587651877339; 
 Thu, 23 Apr 2020 07:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
In-Reply-To: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Apr 2020 15:24:25 +0100
Message-ID: <CAFEAcA-9yy=4kLs-8yU9ay=cfk=kHut90Kt69zuKj8k-UVji5g@mail.gmail.com>
Subject: Re: ARM SVE issues with non "standard" vector lengths
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x330.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::330
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZWRHEAm/GPPO

On Thu, 23 Apr 2020 at 15:00, Laurent Desnogues
<laurent.desnogues@gmail.com> wrote:
> I found the following issues in SVE while playing with a vector length
> of 640-bit.

Just a note that emailing qemu-arm doesn't automatically send to
qemu-devel, so it's usually better to cc both lists; otherwise
you tend to only get read by people who've subscribed to qemu-arm
and also configured their mail client to flag up "sent to qemu-arm
but not qemu-devel" emails...

thanks
-- PMM
