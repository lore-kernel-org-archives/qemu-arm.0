Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp1018732ejc;
        Thu, 13 Apr 2023 05:52:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350bAFd2dUEewkzPL/Uv7Vo+daYjeqymIm5eCtNriQ/edq+mMClXGBBnuTBtqRzp9j/NmTtMZ
X-Received: by 2002:a05:622a:1811:b0:3e9:19ec:44e4 with SMTP id t17-20020a05622a181100b003e919ec44e4mr3152931qtc.17.1681390338705;
        Thu, 13 Apr 2023 05:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681390338; cv=none;
        d=google.com; s=arc-20160816;
        b=04Bo4zLyYiX9zQhNoCqWkbT84l02C+VGRBDHHA+f0rjAbULkVQQvXNNU6nr5gHEOJT
         ks8t5ZDCbNjJy75D4jAFN5lubLo/yE2WjSVT6S04Q0CV9a2qFbnnluPaTVAoIbfRHK6H
         5GlKR2U+mATY+qbVloJvSzU9E2y3Dqh1+Po2buQMnknQTk2rMnHhQM9l71A6D2iC+ZXr
         FBOvrwqzUbMqqq4OJ6NuimWAe+Tlqy7y+WQ8JHAfinws7sfuKQSp6gkiNz6gDevp9k9h
         JJUgRv5YWGUd6xdBNyLIM6nujI9OiFj9TnuEeLJZ5lsONAEIoIsPJhKhsdNfKATU37hI
         UMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=C6jw66opoOyLQKmMYotT5dBco10RsxrjSZmWM3c1HqM=;
        b=dcD9WYBBixu1ypa//3MG/SEBXB6knzkJZhroOmTXgx0He4KgbUwHU+/TuxvsEsZNSD
         u5ObMO+aaiUhYgtVrJ+HtcvSg53QkF3gvYHwnUHzzQtnOBjCGi85rIsAfYTcLo7H7K3C
         M2PpZP7d/wh8JoF2McJq+3fuZM9mRvl1K31a7lkgzWCyH2jw3IokLa/p4Hl8aPLwItL2
         WiInooEt3MIwEZaLRMZmr+Sr0eUWlzes++AQJYvLaVhrNxqqnLCVCZNwGYa0GVXgf2go
         ZbWg3d91k+b5fBZ0CJ+iubciy6rRR9T4cGHoDXLsNMX+uMzCUcC+5TU/gy3pKfPSpeXC
         DB+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BxXUTJzI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05622a001600b003e951855538si962821qtw.440.2023.04.13.05.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Apr 2023 05:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BxXUTJzI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmwQn-0006L0-Qn; Thu, 13 Apr 2023 08:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwQl-0006Kf-5o
 for qemu-arm@nongnu.org; Thu, 13 Apr 2023 08:52:03 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwQa-0004ci-FI
 for qemu-arm@nongnu.org; Thu, 13 Apr 2023 08:52:02 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-947abd74b10so589321366b.2
 for <qemu-arm@nongnu.org>; Thu, 13 Apr 2023 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681390310; x=1683982310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C6jw66opoOyLQKmMYotT5dBco10RsxrjSZmWM3c1HqM=;
 b=BxXUTJzIZzSJHu+itdvi8qwH3i162OapudBE/f74HGNPSdPPWOdg9G8TYKJ/5CYej9
 rXWYzLFFla4SGL/xsQyOfOCGazKU6PkBBLQO1i8RCeF1gDNs535tal95zkmzohGZ3rW2
 uL/ZBOqgoGCxjxtdTEaZw9M+2dGDKcaofPciuTtBxvSu2ZVAB8NkN4KojWnkNJKKdcn0
 XRp2tVhpphWIq9bspl6FIBfF4CCOqMwRX14w+JaIDFn46lQlGjDKEaHwtfKigSQvgxYG
 8Q73MqFbw2sghrM3SiXvE5blvl8HvKcF+Z4YxWPW15BPr3Ktu117KAKHUtJ8Mqex/8LB
 iZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681390310; x=1683982310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C6jw66opoOyLQKmMYotT5dBco10RsxrjSZmWM3c1HqM=;
 b=aTXzGIySREXNrhDoQziFVgQzDMiUp8LBmj7z6J5oT7OreCOMrmY28mu2GDnfMWy528
 9Msb6H9Atga8LSPKcUCvNlc3MZjM8do6M7p1lVXP7pe+7J8YgSESKbcbQZhjrwjKJPMF
 AgHxXE4bqkKhb2z++Z+O1U1mlapPCJO42gx/fn0snQUknEeWiTdjieT+9MRHw426cD7+
 VQ/cOAcyGGTs3gp7rEMe6yQWiFQZl6wAk/PQw/EHY7IoDwjWc2gR0Lv9pFC8a+5X+onL
 yLpd8SzX41jtkAmbnXdCUZvKlHlMcrbazFdTnAzR4Zs9N7GQ56CEhgD9PbkrZi/Hqaac
 69Xg==
X-Gm-Message-State: AAQBX9dNviRDW1bXBc9lH0K4C0+ETOpeBrW07zdYwuZSFRmg7IEYF58R
 eo6SL/GItt6Gv4dr3CjjzH17h1U1lr3azC+lfMfmRQ==
X-Received: by 2002:a50:9ec5:0:b0:504:8731:4eef with SMTP id
 a63-20020a509ec5000000b0050487314eefmr1145798edf.6.1681390310426; Thu, 13 Apr
 2023 05:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230406002447.4046378-1-komlodi@google.com>
In-Reply-To: <20230406002447.4046378-1-komlodi@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 13:51:39 +0100
Message-ID: <CAFEAcA-2_gwOUgapmgSSFGVNiOk9Grse_E3TVo=pQTf-OgW2vg@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/npcm7xx_gpio: Add some pin state QOM
To: Joe Komlodi <komlodi@google.com>
Cc: qemu-devel@nongnu.org, wuhaotsh@google.com, kfting@nuvoton.com, 
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3+6EOdbtf1ve

On Thu, 6 Apr 2023 at 01:25, Joe Komlodi <komlodi@google.com> wrote:
>
> Hi all,
>
> This series adds a couple QOM properties for retrieving and setting pin
> state via qom-get and qom-get.
>
> We ran into a situation in multi-SoC simulation where the BMC would need
> to update its input pin state based on behavior from the other SoC. It
> made the most sense to expose this over QMP, so this adds properties to
> allow people to do so.

This does leave the simulation in an odd situation if
the input GPIO was connected to some other device -- the
other device thinks it's put the GPIO line low, but then something
external has reached in and set it to 1, so the two ends of
what is conceptually a single signal line now disagree about
what voltage it's at...

It looks like the hw/gpio/aspeed_gpio device has been here before
you, only that device chose to use one bool property per GPIO
line. It would be nice to be consistent -- if we want to allow
QOM to set/get the GPIO line values, it should be the same
interface regardless of GPIO controller.

-- PMM
