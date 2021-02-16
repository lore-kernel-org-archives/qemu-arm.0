Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6502262lfc;
        Tue, 16 Feb 2021 06:16:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyxeVUKkwWXrmtgNvIO/JF7CzUPB45p0tYzjCgUelAkxt/OX8wQGgLwpAGXe9W+Gyu/NA1
X-Received: by 2002:a25:9887:: with SMTP id l7mr31204701ybo.319.1613484997260;
        Tue, 16 Feb 2021 06:16:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613484997; cv=none;
        d=google.com; s=arc-20160816;
        b=TJQzfZbuOgH7kOQ2YwlikE9/L37BTZmb/E/rP5J9x1YLRZ7oBkXXVs3DnDWYq8SZPk
         qqGO5zRPxu9SCaR5CECj2M5KL/sXgnFWUxqhq/mdP2PaDYwVozWn56nbjVHrTifWii0/
         WrqCItjJYpYUNd4/q38LELXDgABQhgMKG1uQpingp8L2FzpTuzEjSOgnSTpw96XBtBiI
         i7bRPQNb+gNUS9lsO43Wwg6a8XgUlHiPx3yl0uwI5PcnjwsRpToH1n2XBuWX9s5GPiq/
         5Zcen95Z/Gb8WMzCDt5kEhZoSS9Noz0i9Y8RDceJFQJp4hO6CarNu8SEcF7BqOPtMWHv
         lwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yj1oFFEoFpZlmKl9lKMBKEoc5H9KYa/mzAusSDfjrv8=;
        b=adUjHfHiMBFtGG0wlcYuwORXnlgRLC0CKt7e2pfXRKPB9csFY1XRk0tfMACG+SAWZf
         c+MML+MpeU2d9JLk7wq8DNlbeNyvvfyhQ0+gTmAmk6oC6gVYPiwgd6TCMKoQx/N+wvnW
         wIvecOld3U1lf+R/kN+j2I65ldpfypJGQDmDP6/He7nJII35wn05ri8ng6F65++JFLWN
         kG21wd6QHGU1Hv0FI+HfqzOp/rJ83wz2AlbRMVznh5w6mDdrqQFEXhA8SAeAevy/S1nj
         ZFCyUR3q6g/Ny4TizmDX7TNsEr97H4dGDANBYeAoYuO74uGzZIEEQigq/BTDGJGtB7Iy
         703Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Tapsl4/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10si15494904ybh.220.2021.02.16.06.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 06:16:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Tapsl4/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC19Y-0005wX-Lb
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 09:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC198-0005vY-Jj
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 09:16:11 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC197-0000rR-5n
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 09:16:10 -0500
Received: by mail-ed1-x529.google.com with SMTP id v9so7946049edw.8
 for <qemu-arm@nongnu.org>; Tue, 16 Feb 2021 06:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yj1oFFEoFpZlmKl9lKMBKEoc5H9KYa/mzAusSDfjrv8=;
 b=Tapsl4/Zbr3W4jxXvXh7fTcIKdxU2O8+HgH9k3qU1fOFa+GLOYZiunALlbmCvP0ryg
 N+1WRKqApqIF48/VaTLQFPuNy4BXb10wulAE8yDENEKnLLz/yF3CgYsRS/2cLl5ELoUi
 N/F4SUL1feTfikjBUyGS7q7LrXdafQK/KnbAOyyjf+V8J9ytyf+kNtQTexXWUEgyTNtY
 7zvQl6YnmZm3+XqKPRcmiqwxiRz3XUOvnR8oAVZKzHbwVaWIOCdBWXwR97kmjcJXpEm6
 1MvLqzlC+GB2SZEL1JrTPmjE3m3O1xIqS9IVvXJuC4r45HTkCaOZ8oLUJNzRTXRFNR4S
 o3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yj1oFFEoFpZlmKl9lKMBKEoc5H9KYa/mzAusSDfjrv8=;
 b=OoHvMwXjUtL8S+l662gSq6mmkbhMhpEzPIyFsMCNMmYuCNyHQfNF+718gcjNlC4Tf+
 OwQIbjRRInBLIu8AENc9KmY03RrfGFYI1KlEN3rd9dHg+ghaf0dcQtisGV6NVZrb9MMg
 f7pS/OgRLbMYjuyHCLKU/3UVtvN+Dij712xzGM62YaIFlqceHkEgQveQJeItn10RBWfb
 SM/S/j9IE+T9UIOh41Wvyl8cgyqtktl5eJMbIKxSlDjb3m6fiiY+/HcZbuG5xLuHk0Cm
 76n5ezH7FmBT98sTelG1g9r9FLWU3qig1X46IGqowjJr8rQdozjc5Wr4hEeM9CqOegP1
 Xdkw==
X-Gm-Message-State: AOAM530ZjX5GuDYeZjxkvKJFGJ/Oj6cGsuedmsEYQa+zd9tSbOEJyvVu
 FbTj62xwawbjtQ/o1GM1m6SF00aumKbiOF7mf/hTiw==
X-Received: by 2002:a50:9e01:: with SMTP id z1mr20960198ede.44.1613484967608; 
 Tue, 16 Feb 2021 06:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20210210220426.3577804-1-wuhaotsh@google.com>
In-Reply-To: <20210210220426.3577804-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:15:56 +0000
Message-ID: <CAFEAcA935ddobJrxRkNtxdBv6-Mm3THwTLd8Vfcg8hEwjpr0xA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/i2c: Add NPCM7XX SMBus Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3mxH7zXIYCL1

On Wed, 10 Feb 2021 at 22:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set implements the System manager bus (SMBus) module in NPCM7XX
> SoC. Basically, it emulates the data transactions of the module, not the
> SDA/SCL levels. We have also added a QTest which contains read and write
> operations for both single-byte and FIFO mode, and added basic I2C devices
> for npcm750-evb and quanta-gsj boards.



Applied to target-arm.next, thanks.

-- PMM
