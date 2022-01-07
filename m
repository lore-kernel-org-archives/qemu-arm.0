Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp257604lfb;
        Fri, 7 Jan 2022 09:07:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuVD+fXNNLnSVYtyfJAN97+g6qVHZPvTj7cQcxgYYhqIrgypDX/RU5hQ4BnEnfRkeh7a5V
X-Received: by 2002:a5d:8f99:: with SMTP id l25mr30454182iol.150.1641575265932;
        Fri, 07 Jan 2022 09:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641575265; cv=none;
        d=google.com; s=arc-20160816;
        b=NDd6t2FX0Nar6PJZAzYHnuvS3wwNLodJFfw6RsIrwVpPvqXe3OS4d2R8lsWUnuzalF
         D09xBpEwmMsFwZgzbPoNa/b/3LXKFlfwcXsFpexkYTzS1YggMwor5klQ8pZkqxZKXwJO
         ox+EiU0gKZ3bFKdP6YDhMFU8MtAmuDDXTcsVDt0ttfyA21ZQr1uF/2XI/elmSjBfpFc8
         sCsi93eJ0oS2Hu0M+0EuppoP+QWKU5LpWF35QNxP89NW9gAM3pAmhgszUPfrMpSSciyq
         3iJsqAd9+04oUm78p3t8x0AatLNYrlhNOPZi99AT1aMLekumspjZlbIAgHCfdpFoemxe
         T+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zwh5KDXzLWAINVccTw2By6IXGN4pWPKTNWlFH6mmFzQ=;
        b=0RgnXW9c+wmmJMM9wzDk/qaOsiYMOQyKt+/4cg4T3939Rt6nxsan1x4lpHA1elibDH
         TceeAo0RxkB/zYS36UkpKos+zN1Q1GOj4W4Smg0cdEzewPPstXRWgEPI/Pw3YJQJvpi8
         oM7uHPP/IPNBfxb/DYvVVz1vY0XAkha3QlXHCpbTjwff0orAlUbkgK+PtDYmAGqWral7
         xlhHNleNqxWIpcbwXM82NgYRIuZDpNxQXOgpdUUeo7sFDuV/76cfVWvl4l00zQfyG13h
         ThZDt3RcmfsvzZtnzwDhQlgN/UjwwMTyg+7N7uGxB3CmDBTkKlPcvlapmnLV3Bmvh9jU
         kduw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fJnmgBNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si2531027jak.131.2022.01.07.09.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 09:07:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fJnmgBNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5siO-0007Xs-8c
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 12:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sgu-0005nv-Bd
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 12:06:12 -0500
Received: from [2a00:1450:4864:20::430] (port=42654
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sgs-0004fT-PV
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 12:06:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id w20so12241505wra.9
 for <qemu-arm@nongnu.org>; Fri, 07 Jan 2022 09:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zwh5KDXzLWAINVccTw2By6IXGN4pWPKTNWlFH6mmFzQ=;
 b=fJnmgBNLd5/czEZMJ9vl0FZOD0C1+eZzHfnNEbw/hVHmUcjehntZIULSr0NwYoGxtT
 mY2o3G4yi6kym1uWK2gQ379Ca+1gOBTEFVmgoSyWIGSiGtyXpYF+AzCI60jfJvks1Wj4
 q6a2W7eHtYlDJg1SIaRjq4b8L2Vgr0g782Ym5OzAF4RXosXXsQpxPDzrlNXkbxJ+9SiQ
 HFeIJqp93vplkWXcq2skH6rw000qVg54+/UGXCNlaIZydLsCpnsD1XG4kVdL3+hfLoLb
 6lWIqNsUkSuEP5OkIpY79uJqPyy2g+lXuTGbeb+di3m1yuvJxrgiu5P3XljRonPvmMc3
 sWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zwh5KDXzLWAINVccTw2By6IXGN4pWPKTNWlFH6mmFzQ=;
 b=D6g4XhQC1v50fmfK/Tdz80+gEVFVpYzfeBySofzX9WHtfJUInmglls1LPtj37oJSve
 tyhwrJLBo/1GGAw+1nsSoFhAsXHfnqG7+x6yLuP72luQeT3a5Epfu4KjWSgwDhS/hAzT
 DTWY2+QIRig/Mi5alGYspuH2hi7siY7osKKTrf7U/+3ApCG2i9j2WaVd8E0SQv+DXOqg
 Gj9h+Mk8MYnJVvbTlXTqkKNjqsAbzlnCdJ8fFHKQjYY2pTIHkuJpwLToJdguM22L5SCu
 ljo/2MRxqg3c5+wiylCVB7joX8uus7T4RIhazuRvr0GfrlES1VJDRYY+CGma4i4QqaEP
 PTBA==
X-Gm-Message-State: AOAM531LBqhLQbTPgVfeBTR4ypfagKwQ145IEzFr5YhAfxMaVrtdv1GM
 1s2pbVa6reaI0kVd7ihYj5+OIwzdUHi+AcnZKKA/Dw==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr54025607wri.295.1641575145088; 
 Fri, 07 Jan 2022 09:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 17:05:34 +0000
Message-ID: <CAFEAcA-r2+_hJOn7KHCtcippCnpm=guJahCMK-d0yQvRNU1cBg@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/arm: Add more devices to kudo-bmc
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: wuhaotsh@google.com, titusr@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, crauer@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LIFix29aSuTQ

On Sun, 2 Jan 2022 at 21:58, Patrick Venture <venture@google.com> wrote:
>
> This series of patches adds various devices that are defined in the device-tree for this board.
>
> Chris Rauer (1):
>   hw/arm: Add kudo i2c eeproms.
>
> Patrick Venture (2):
>   hw/arm: add i2c muxes to kudo-bmc
>   hw/arm: kudo add lm75s on bus 13
>
> Shengtan Mao (1):
>   hw/arm: attach MMC to kudo-bmc
>
>  hw/arm/npcm7xx_boards.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
