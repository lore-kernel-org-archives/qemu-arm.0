Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp124254lfj;
        Fri, 14 Jan 2022 05:30:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEuwRuLL4kKd7FmGtWDP9csbJM+dT/duEyW0CCl/yMbiVgIJGK+QKejxYf2rMyAdcPsFTO
X-Received: by 2002:a25:ea49:: with SMTP id o9mr12380236ybe.460.1642167025512;
        Fri, 14 Jan 2022 05:30:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642167025; cv=none;
        d=google.com; s=arc-20160816;
        b=DbhjhLS9BncpQfIhZPtC5w8ArdbzblVn9pijrFIWEeaKiFznfFdZTXA2K8GCyc4T/k
         8kzKT2Jy/5UiQosCX0kVNEtUc/eaFihHolR97QRtFuJFU7Pay5PjdNG0ljwr/GriZH+U
         l6mK/Lo9HSDWYJZoMEpmQ9zuJo7C4XBdaBYRT1lXdsR2H6PiMNzrGJ4IrUpzw2cGtCTm
         TUxlX9pFXBxyuqPwB2SEvD2pDUtHp61oz/Eb6tiZx6MO6OVlwtcmwVpKgEBtybGb9821
         JEyqtor6Fabn7EOw1EsV8yqpHz+CFmUawyeep2WhwY5yBG4cCw5MGHVFybuYw9teIQ1i
         ROdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45BU1TyXYIU6ZQpMIAT9y5TJvkLsSr1DANDKdz7roec=;
        b=CDvhf8y2WePDUzxNT6lfdM1N3DziGUofON0KdHdCyr4JxUjHfdlnssoABmbE7vsu+3
         Kbn/e8+x7iAPcJWDTLw6qDK6Mz7oK2OOxJN9/JEUoyE5r59MkMgkcuBgIp/uieM4gfdf
         LaIJ+46+z7SylFuCrcEmQRfP5LVtlQGOEb8FmfNrjc/5bpzQIiJ8xgvXtINtJeGOrhUv
         28yVxwFRFo5/hwGPthtY7g9uViYfTJGoI1kvWKBwIRQFPEc+0EosUMusjpejotZV81t7
         /ev9fo5LSAvNVbxBLplRPRAjGHHCQpr4xFtjFxvrdPceoQsVkBKeK9HXFWHxW34HJWzf
         8ZLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IhdxRGB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si2985062ybn.374.2022.01.14.05.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jan 2022 05:30:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IhdxRGB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8Meu-0005pW-SZ
	for alex.bennee@linaro.org; Fri, 14 Jan 2022 08:30:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MeH-0005Jb-Ph
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 08:29:45 -0500
Received: from [2a00:1450:4864:20::42f] (port=46637
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Me9-0003tP-TW
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 08:29:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l25so15564332wrb.13
 for <qemu-arm@nongnu.org>; Fri, 14 Jan 2022 05:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=45BU1TyXYIU6ZQpMIAT9y5TJvkLsSr1DANDKdz7roec=;
 b=IhdxRGB3RbL2k0xDyoGci81KDz4jR6KpmBcFWA9dbMeQu2KsYJWKRuqqLzcP65BV6g
 s1UPf87xuCACs1HqB1nn1tSQmTMthT8lmGYBtib84Z99L294rPueGJaEaApC9uptT/iD
 R7kFN1HIcHkazO3pJNAij9Rly44+Nsd0J9AV6cM4LfU6B/+XhxrdpHNqE+rwP+A8sV9J
 Zwo8WlDaGCVYv8o1PMKP39N5L/5bG0ApBrJB9BUvIOnwwC4nZzaHG6xpeFJiBfymQhRv
 z2F4i7mI2N9IxYaNgO0r1A4CviNOwOJs4k3tp5mH+piuCiHyOgBy9ztVLFUTIx0FooO4
 bSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=45BU1TyXYIU6ZQpMIAT9y5TJvkLsSr1DANDKdz7roec=;
 b=xx1TKgrrIFGAn6X3oW4SZ4lQUtunztWblMxGJSQDNekNDnj2nvNzsB3DAn9YUscfCy
 ohsZ4sx6Rb+WT+n7ytST3Km4hhV6ccMh4TZ02FtBdjVrVKsqNkXCQpU+j5JQnCBSYoWz
 yh3meKBkDO+qTRqJmGneVN1kAMQVeiGaos6kxKDxBMWsjOTXgXPNUcnYH+9M6TOggp8P
 PQO4M3Vc/tMEfCEnXUnc9cR92wdBRa4i8StsorzYdKd9y+fdqDqud/0s4vPBheB0/MkD
 3AhV0CyKYGtQIFRXUCFq03T6f4hBCjC+ulPpDyRD01jsQ8IqDjQeWVnSl4j+QhWocrXy
 y5qw==
X-Gm-Message-State: AOAM533DWm6Bp8kVdVGp0ASbWDYz3w/X7W286om/YbPMthDd/Vo82MuT
 6Gl70iFsgmCD3BYg2zO8DXIhjfJDZrAc93IhK/ls+Q==
X-Received: by 2002:a5d:6848:: with SMTP id o8mr8752373wrw.2.1642166972802;
 Fri, 14 Jan 2022 05:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-3-shentey@gmail.com>
In-Reply-To: <20220112213629.9126-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:29:22 +0000
Message-ID: <CAFEAcA9_raOgBRLCj9gkUqZc2jgL=aNgzu08FBWmT0vC8-mvag@mail.gmail.com>
Subject: Re: [PATCH 2/3] pci: Always pass own DeviceState to pci_map_irq_fn's
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BqnmISH8rQo/

On Wed, 12 Jan 2022 at 21:36, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Passing own DeviceState rather than just the IRQs allows for resolving
> global variables.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
