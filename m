Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3234944lfm;
        Mon, 13 Jul 2020 05:28:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb4NHm+HpZGtdTZzYMvV8s5wp2Qu7zOQ0yf0xBnKqZ7/bLnJBP1YKaA2F+TtIMWTC2OElt
X-Received: by 2002:a25:2a8f:: with SMTP id q137mr89896202ybq.462.1594643282840;
        Mon, 13 Jul 2020 05:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594643282; cv=none;
        d=google.com; s=arc-20160816;
        b=WBOFm30Uz0FT3bVmgSwU+vQLiwtCrEUWoeRSiBMD3igSC7wXNqQKU1vKi38eyIkYHd
         CIJCvoqBmgpVySKqfp57I4DMm+xzj/XMNjD2AyvbAniiHE/rPCbUGemsjAWTD6xyrDc9
         x3oyrVs04oMFBlie+OnMlZOpwEnuWr2hiAiyGnzDjZ+I980DHMlaPTj8hAmd3TzWIHWO
         BHEPvYAE9hjlaFoV2GHlMA8j4V/BrKQdGj7i7YP4cFkfZBX/VXrnPPZNpvZv5CauBoBN
         8ybig4/oqGlbz8sWVMgVXn3h3gBAatde8eh1AEKxvJR/ynIIoCAAQ7g1nyMdzZhX2lsk
         V8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VOICyT3wl/EpNQqGgOp1bHXDUkMptuwBmOUfLQ1I5qo=;
        b=nqhGK5Iu3xw5sWORBOQPOzVmf1CmGsHuXaBXyJ8qipjtsshTQxeldIZjN/esO2C1Jm
         DfUdBlaMrOuzVTVKiIGaY72j6eU+n4J67RVF6lP/hBc5YfBXf/xL/r3+HYLW6hEYIqdU
         STeCyW6chOSr8hBcADM/8Mo2EYIuRnzaqlHSM/JdJMcXsST96vH+JOKK5GkuI4VHppSS
         WbFU4vCEWxPyYL/fhFMmC9El0Qsw+lPNwPeJ29IfZ7gXhVEfrli5PDfxSQp04Z+uIlqc
         d2o3iRT10G3WIXLc/+3SgdGt7fWIqfxhAOlKViU3aGs/zrkP+7Lj+jtGt8sdmnIhkAKc
         VY+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i+amtIx/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si15722629ybk.297.2020.07.13.05.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 05:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i+amtIx/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juxYw-0000p5-7H
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 08:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juxVe-0005aO-RF
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 08:24:39 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juxVc-0008Gh-UL
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 08:24:38 -0400
Received: by mail-oi1-x242.google.com with SMTP id y22so10772028oie.8
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VOICyT3wl/EpNQqGgOp1bHXDUkMptuwBmOUfLQ1I5qo=;
 b=i+amtIx/gAkjr8bLVPaFPzq7r+Ek88quHLausbPiga+dP828zMdWO5Hk1P5ap25VAy
 usOIYLZ0LMnEHbmugH6OdqiP34PFtCknU7lKbw1vJRmK80v9DTZPwZpa1hIFxwiU8qz1
 IVK3lxbL5Rxg2HcP8XIKYLmPKeEea2YIGK8Lgv4SNbHlwuiubnHYqNbgHIK7SuZZUOb/
 nQIp0Oe0e7AyBn4GNNLaMz3N9uir6fK8/g5jRdewauD5+pHGV8FJ2JYvCu/IaTyQB8G2
 4rzUiofh0QoCtQiW2r+4d8rW0z0xhqxi/uzZYV0a4mTxMUBPHdkqapYQ8OskA85eQDVz
 pTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VOICyT3wl/EpNQqGgOp1bHXDUkMptuwBmOUfLQ1I5qo=;
 b=mzKWdmR4vHcvIYliVWi1iulKLTmFOnF2GdhGmk8sd7uhdz5WAnS3HHfzH78G8rSzmu
 rQhZDTJEwzdyrEejGgxt6YVkhS96ZkmtKGVFBcgSlZ7YJGlOF0JonTav50SpoJbMD0ZT
 VzTWtZYyjYLuWLr9WehINuJpRqtGNYiLf8kes2FDDx+sjeS9/QDjooGTMk+c1BYj803N
 CJmfEH+ybyueTWPb0FgfTS/jaIioKLkKqlFsQYZvYPHVr7+OgZC00vLK+gljq2e3pz27
 MTP8nrbl56dO1YNahUXGz+30HUE9jI9MkOhbLCIQghgb/nkO18XN6ldP8SCsomD2Nkkt
 6UCQ==
X-Gm-Message-State: AOAM532xHpyBZN56vz634yZ2KHAgeDPUZaQH1cljSKWaPp4XD+Wj8mZJ
 4u+swztxJEP4bDHfy4SOxrZ0tIICch+voo0luD1ElQ==
X-Received: by 2002:aca:54c9:: with SMTP id
 i192mr13781214oib.163.1594643075538; 
 Mon, 13 Jul 2020 05:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200705173402.15620-1-f4bug@amsat.org>
 <f21c68c9-a4e3-76cb-7484-1816d5742163@kaod.org>
In-Reply-To: <f21c68c9-a4e3-76cb-7484-1816d5742163@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2020 13:24:24 +0100
Message-ID: <CAFEAcA_5hKh2z2M8ESwhZ=6x_xuv6VVdxUxB=_iZ-x9hujLC=A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/aspeed: Do not create and attach empty SD cards by
 default
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sflfKrcrMa3C

On Mon, 13 Jul 2020 at 13:20, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 7/5/20 7:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Since added in commit 2bea128c3d, each SDHCI is wired with a SD
> > card, using empty card when no block drive provided. This is not
> > the desired behavior. The SDHCI exposes a SD bus to plug cards
> > on, if no card available, it is fine to have an unplugged bus.
> >
> > Avoid creating unnecessary SD card device when no block drive
> > provided.
> >
> > Fixes: 2bea128c3d ("hw/sd/aspeed_sdhci: New device")
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Applied to target-arm.next for 5.1, thanks.

-- PMM
