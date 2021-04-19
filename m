Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1219984lfb;
        Mon, 19 Apr 2021 07:27:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw272zAHokiCDFVD/Anc8yCbwakKJKjOXsJRwwH5M3zIeikSVzb6MuIMmZtZshPjbCQOjdl
X-Received: by 2002:a92:360d:: with SMTP id d13mr18930214ila.144.1618842457950;
        Mon, 19 Apr 2021 07:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618842457; cv=none;
        d=google.com; s=arc-20160816;
        b=PPHShZpfsdu/NwZM2tmIFJFIozOCrg9736vB4xA+Fz8BSOlS2O4ui6HBF8UgwUObJ2
         fbT+2YgNiL+HFoMixGixP7xP73Ilvf1DBoCYk37IrCDSKImAESxFhX0erDZ/g8bA00+R
         wB0DxV4YPtco0LTbG+TZ3wOHyLXa7yekLhJ5p+atZe6h+eQhjY75RhXHbMzOoG8iugXX
         VxzbU/i4Q4lP/qa7nLz0jdwwJuKJe3pA9dblbYVZPqeiIE1fFtgWv8d9mZ34ELQ3f0fl
         3J4vU6lI+KycHwLTqUWs+LGKyWcMUdED5lODGq59SkT3Ce8nrw+f/MNpIJ/cDrs+Cb8l
         70pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ScAKAxXcqIZhFqJx1nhpQxcyKpY4WaPRVOj2tlhdtLE=;
        b=s2elpb5t3lIPfE0WI80IddZCDcRpgWUYZSgg3impnex8Qx4WZ2l96EBkT54b53OKdR
         C1ApQDwiHnMjmqKnxcmMC47QEy+NTER/ARqmqoAQcWay75yr7YPQkmhU4U8MzOG5UpBR
         INwv+UrIe9o4nv6ofN/mkPfO8OKSLCe+KJlgZ5wztKLRTyM973w+R83Oh8VigI+eHYED
         sLNS0+FBQnyyLpq2NJet3h8Avyh8bIT03XrJ9poQt+shyBCjrVYDdTI7k5mPctoJHAwQ
         VdiSMsK9Q5KSRH8poJRAFjH0i3c4t/c2GH01NhrB7uLzvI9G63dOWyTNupZnMAQCX43M
         nupw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QEr/zkeM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e194si16713669iof.53.2021.04.19.07.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 07:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QEr/zkeM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYUsD-0003BB-Ai
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 10:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUs2-00036j-U9
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 10:27:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUs1-0007Ur-C3
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 10:27:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id u21so53250751ejo.13
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ScAKAxXcqIZhFqJx1nhpQxcyKpY4WaPRVOj2tlhdtLE=;
 b=QEr/zkeM7ydHXMeKUQoaK3j++rxwvu9Qkf2rHVXg3rI+Q3XAdKStGrZnCIRRQpc6PT
 M5NH+bEeTL+E/kAbkiSbgFP9qrJTYBjNyqWzAd8n41DE5suPrlZBpwhsI3plhcY8ha0m
 evFHGqgn8cbVA81axeACbxffd3Yq7eL/rfHYZI1mzxA20QLId37XW0qYaZcEpMBGZtHJ
 GmFKMqIvVCJ4NdDvxltoFJ5610aT/kgrEeoMDZSxiHF2dFyjccImi5w40SD3UgaU61Pb
 sXmHFyeZjs50HrUOKTZ26KZutc4WyjG3nfq2njBRzgDNnPAJxHLTxlokdsBqQHKTe0ok
 Rnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ScAKAxXcqIZhFqJx1nhpQxcyKpY4WaPRVOj2tlhdtLE=;
 b=OQtZHKMMCkQFopY3KSh9beqXugqCsBErteLcfqarqMJbayehh7yQrWRid7WfjASIfJ
 tSpuefLAUR75MKuK/M2XFKa453qlzp7LrY2RMruKJyWrAMkzA3Qzzm4UBjfx4xUUTZYf
 SVmD/6dQ5ZpaimmTduov21UCvISQ2E0ygch/qj01+hDGzkePAzcPwHJUM7EJSO5W7YlP
 IRMIZzXCVAERIxsrIgyltUYnRVAt2eFuR1u4QecnnteXzZx9cHZCdqNPcEu77vrc3I+7
 3oRVbOjLSK4FcKA/O+bkzv2mhIQCpdPmSDd3fQoXsK/bVF6Wdxd2Qy6bYyhamkouVYrY
 W4kw==
X-Gm-Message-State: AOAM532yFKxVYh4vEhoDY2AoATsAGOHvlR2vDPPjypcuCsaeDChwCZkP
 bfjAC/8tqqeB6XmCKUh37L8h8gVXRk+Aa/zExNAxqg==
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr22690736ejd.56.1618842443763; 
 Mon, 19 Apr 2021 07:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210409062401.2350436-9-f4bug@amsat.org>
In-Reply-To: <20210409062401.2350436-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:26:32 +0100
Message-ID: <CAFEAcA9s2hJdRrpa6-qBTaWs6v2AmhyjhOSs7kFrtE28+oFmWA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 8/9] hw/clock: Declare clock_new() internally
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l5mJuqUYoO0a

On Fri, 9 Apr 2021 at 07:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> To enforce correct API usage, restrict the clock creation to
> hw/core/. The only possible ways to create a clock are:
>
> - Constant clock at the board level
>   Using machine_create_constant_clock() in machine_init()
>
> - Propagated clock in QDev
>   Using qdev_init_clock_in() or qdev_init_clock_out() in
>   TYPE_DEVICE instance_init().

Why isn't it OK to have a constant clock inside a device ?

thanks
-- PMM
