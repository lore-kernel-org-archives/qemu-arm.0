Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp593605ejb;
        Thu, 5 Jan 2023 13:12:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvuBW2T93321W34Da4ON0gHFhL2OYG8CfLHsVB5aWOw/Vq5uHalJdg9YPIH8DAdRfoa1FBh
X-Received: by 2002:a05:6214:bc8:b0:531:a63d:d81b with SMTP id ff8-20020a0562140bc800b00531a63dd81bmr35990983qvb.35.1672953122151;
        Thu, 05 Jan 2023 13:12:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672953122; cv=none;
        d=google.com; s=arc-20160816;
        b=B7QQ/fkCAS/e1vaivseL38/i8Gx+s5Qgh3kyyRzoeV3Zwn4HacUyuqmDze4Whyiie2
         Hv7ZuDXVAVnCxlH0ka/E22uZtMJht2KQ08NC59FX93+6LtpXe3GcWFqYkLHgZXAp9Wre
         mo4HPUVM9oy8qkvjiKUpzCilBgoJH7eFXWOsc1/SLnZbgwmFWNlJ6rbuRMYoRJLgjl+v
         Z/7aqSlSlJDk+A2eDmZgx/ADOnBD1EZBgLkDhYR52JDs0/6Flh65Bzfj9iLcj0b5RQiG
         ndg9VLwQ+UMrptYdBixPZweOTMdKg0jqBmMfjkjqqchvNhfhvJRSZ/V7AxR3v5o94P3Q
         Csdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=d+RpvusK9cnsE6w0qozTaZcHo/iS1D5theKau86HMpo=;
        b=LB4ZTAmkwCPXnOdH1hh7X0lAoawgwsK+XObyDwaPWTyY2Whp/oqmKvOtw4xDkpuOnU
         7R5WunpkACo+bH6j4PeW725B6qSsKjOymxKNLyIUSUYBOgZqbNq/DBuGIv2goyefXGUn
         xtisMrcMj17USw+vKjlbaqINkVWLJnKcjGea82Yt0FhtVEfaUAoUdAQDAYpwzt7ISIp6
         KPeWkgOniCjvUbzivduYuf3KY2tVUA7R68VJ2fsZkjO8dB/R1RnjPkzMB1mjxJhttq+I
         0p9Ach25+tMkSJ8n8k34rB53Uwm7ddJXu3B+LVt0DO6vo8aTCHl4GNSJTfvimBqYAfqA
         2/xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=n3xAnOSn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020ad45bca000000b004c7399a21a9si5625978qvt.177.2023.01.05.13.12.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 13:12:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=n3xAnOSn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDXWp-0001Gp-8e; Thu, 05 Jan 2023 16:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1pDXWl-0001FY-CD; Thu, 05 Jan 2023 16:11:57 -0500
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1pDXWj-0001vi-Jm; Thu, 05 Jan 2023 16:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672953111; bh=d+RpvusK9cnsE6w0qozTaZcHo/iS1D5theKau86HMpo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=n3xAnOSnG+mFA16K4eL4/3dxYnbhc1RBp3e4hhXV81lSm81Y9XRqy6dS0qDb1rXqf
 1GPPOENGBpBs5BBktJ//UHpQG5+TyKiLG+0JDhxb3BmZLEfAXaAMnWZTAkKr0XpzWs
 iLLvCKS2Tss6plWxYiHEd/hDkHdzDa4+WeVVXRqFuNQAs9lm5U5OhtXC5gc6o4ts7G
 nofukwnXhhHuvew63uDyU5AQkY8xf6Xq+mPL0tZUxi06AHNtrbCWMdivARYIFeUxKw
 kSNmBGXMx4daxMoDF3kDtfUeWH4HTz+YHb81itAFd1BVGiXME0mf30/gH5xCEhibmf
 ibjTmsgwe/t/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([77.4.96.127]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1p0YIq0BTD-00HPnG; Thu, 05
 Jan 2023 22:11:51 +0100
Message-ID: <0370e85d-1724-7a67-3241-0bf1dd68a2d4@gmx.de>
Date: Thu, 5 Jan 2023 22:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git v3 0/8] hw/timer/imx_epit: improve and fix EPIT
 compare timer
Content-Language: de-DE, en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <CAFEAcA-pyZ+GENR-X4C19LoL4MTTV1PcY7Gs26_DzTaFX0g56g@mail.gmail.com>
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA-pyZ+GENR-X4C19LoL4MTTV1PcY7Gs26_DzTaFX0g56g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7BXOA9nN4NbXMwb8gVhN7J7F7b3ef79ZYFhFZyPYbWhr2QFwNmN
 vdIB1jHqHUITfRpSuDfHtvbgnnzKWxHzVlARIxtQh58LFrLLhpzFPRGodJ283Iw/5DhAFba
 6knEF8pb7tsqtX6Kqx4Mmbg8EY7uV89wqXlV7/ycaCsVkKcQOCQ0pt/gbNXE4czMwB3UrXU
 SQ2l+aZHeoLjN3HRXNsjg==
UI-OutboundReport: notjunk:1;M01:P0:xR+g9dhW7/c=;JYJIEcy4urq+3FfGpPdg/aBlqgb
 Z6UjfdkizzUUC8K1Q6TZDj03LeYAUXXd6yU/b1Jqo5VU59du+oXgl1hzIVZd24BaszFFOAxwf
 mVR6ovttMqa8IRMttfSKcTNIr/Xvg7T7Urb78YkIqsHJVmr5f57wEkxAhYoRaLGMw9+NYEL0F
 tL2idJoh+n8TdXV5SlUCSNLo7gNzO+1tjwHtbAiG06e2Sk5x7UgmcXFQf0pSSkomyW01r/f0E
 ZDO+rXPOPBBvgehbIp8R8PVdoBV+nv9Ba0pqoUk+MGnH7yn6dAwa7GOMpdV8SxVi1VXton/Yn
 aKb+JyxsYtNToE0aDTAJByuXTogSUq9KdUPJJrQMB1t1ouwLV69Z4JU2Ow6NYyVjMWz5nz1c2
 ILXh4uz9CdM8Q/vDiKnGdYHg5G8B9SH1JhMsgqoaseIMadz7YvsW+Amub4AYeeyn6OMbVISjo
 tLxcaPYJTA/YMewQhqdJnw7WU3gcGdAF1vwi9oFBiWrnMpqPhqOO9Cv++SSf0+V3HAa4qQdhb
 g0OGPjxpqGKcSTt68cyXj9T79bGhtXfyCMnMcZJ+b8CXz80WOS4sSdFJnM4/vBBo4fVz5BB7k
 uaRPsLBVYFjd3pQXjJnFndZki7s6MUU+rgKbHOHn+OsY+k1eEq4icvt8IPbrJEatHUVDN9JN3
 P3Iy5qzpTSbv6JegpGqAfr9JTIWYO6F42IWmOIhz53eDTF7PbqQ48iUv66O/xYswPxfZfLxCI
 w4BNwjmGr78y0yoAN8XqY/YhSQ8MZy2RpAG7isnOQXQrSyi8Pxm5qm8c96Kl1PzzHq3feO2Y6
 qUDqt7nBEhjP7PoBrdPHNxKfnhBtzsiCMu1RpMnprO04KzRSo5vYDHMJiaSSW5FmFFmdRSrnK
 Kng3RBfqZl/2rszpt9HbyTTT+3eunJrUv/HodF1g4BW+ppmVCgvQNINdUMTo0Kt9vYWYzlpsE
 PAkTpg==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h3q/TBggeTAo

Peter,

> Applied to target-arm.next, thanks. Sorry it took me so long to> get to this.

No worries. Thanks for picking up the changes, and I really appreciate
all the review feedback.

Axel

