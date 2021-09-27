Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3978780lfp;
        Mon, 27 Sep 2021 08:47:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTnFlzr4IqlGy23iURHPO4VQRdv+tQBfxU8/jD0iMdX177qR8eTeMTYlHmnTppe/6Hwqok
X-Received: by 2002:a17:907:7817:: with SMTP id la23mr770205ejc.195.1632757626599;
        Mon, 27 Sep 2021 08:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632757626; cv=none;
        d=google.com; s=arc-20160816;
        b=ea8LkYS8vQhlfz9DGt3jyf89EL4fiO4EADeKihWVw8TwIRxKcMyTVufcV79HcXuuVj
         H7JEmiscYxZ55HhCv8CsOWUKOjJ7YCmM4FVaCB7Gwg7mI/rfd3uxUBnPKKe/oWY1bR5Y
         7WpAv743+5U9vLuzZLIq8B6rLC/xDW6CHOVvb7ZZEYHErFm1JOvBSO9ToppWhZrm/AnW
         2N07gXJtoKj3XuJ23duLgRsxhLogh8UA7kKGIGL8LTIRvAT60KsQh8uV2KW5caAoEfdS
         u/XgYEIc6JMbRHQ2s59DXDkYh7d+G7w8lJ2zh/dVQ8w03lKvK5ND/cgdHdOIqj1Vsx42
         3XzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhzsQ4P9M/UVf0EdEr4phK4AOpgIFR5ehRHTQe1IBw4=;
        b=i5osim8jqksUC++6Dzk9rEc+aLJ0zilvA+crBVH3BrzpBeczC0c/yyU9g1fblWIiuw
         wA4WFa4lXkCetwBGJqUoCXWGsCsX7rdNo7UdGSOsCmwFKKr8GckpUmVRrOm9c7SUTd7L
         qLyXPYLPLlCYlcqhzLYg8WvLLaLdaI6lwfBPwlhzilpbwVCeko9PBQV0h6WAx1fKfGXy
         iD6zRsV95Yijw3RPMy3z2IPPvPtrYsQKDDFZyA+ZRtSIMgddUB3sktJAUjhRZPYx6eLz
         xBWISFYqudj9eItPZjL5jKQpfnmufI1ewjN0BNEcr40Hp8/u/yLfih2so4fP4x1qjeWD
         +MrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=icRFkUf9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ce18si10415153edb.540.2021.09.27.08.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 08:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=icRFkUf9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUsqP-0000gW-Gy
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 11:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUsqB-0000d9-3h
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 11:46:51 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUsq9-0007TX-1Z
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 11:46:50 -0400
Received: by mail-wr1-x433.google.com with SMTP id t8so52878973wri.1
 for <qemu-arm@nongnu.org>; Mon, 27 Sep 2021 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nhzsQ4P9M/UVf0EdEr4phK4AOpgIFR5ehRHTQe1IBw4=;
 b=icRFkUf9xz+Sv35UzSGJ2PaXmkCWmKCqmCXd/uRKy6bmUd37Y6gsZZcafzqnnBrhb9
 HAcCGhT+owQx5dQYCKuaqXHVknLqV4+yhMaB76zXlOCAZnGMDAxLPzOeACAiDkwhUZ/y
 qmOAoUH4hQdKiOG9/9dWgik276HLQEOiv0eIQEVULEXS2onjvI70d0T0j2Ro6JKYPEap
 qytv4BC9es5TgLfjMGegdeGcUMpKEY+slEY4pZF9lLOhzQaIFz6rXZZoWIjsfNA4qBVK
 Pfq5dt8cMrh3MmZhl46rQ1fWt9d7P7o8B8s2zMpESC7/JnDYkDfibrUEerbY2u3nye/Q
 zq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nhzsQ4P9M/UVf0EdEr4phK4AOpgIFR5ehRHTQe1IBw4=;
 b=zpkUrtaxxbiww5LJ1kWFXpR7y7bZ/VJ69ka3GjK6Ch6bkUHwQ5VDjj5HBa7BrIXIAm
 Fx5DwHyGzu4AwZc/N8TtBLsT0C/9jHTESDzV2QQ9lR7SgeGU6dCtieGID5botn6vQeqL
 FkMTKdxHUOiSowTDaIT/VNas56xW3BbxpC2GXR6D++4+NnMTcw2ZOkwS+reInYp4TA9B
 faVfIwA0Fegm0ShSx1kardeMJLF2jzyavYosFqQc+RC/HWZGsvXapG3Y4M/nFjJbxWwk
 jXqg5K33sqKuwQ9mFys3TofIJvgLeq95Og5q/KskEV5WtNYuTeFecyPmpTB4sYldAmgw
 PfkA==
X-Gm-Message-State: AOAM532KV52OW5in2onjWXzOzRWMy68MO+pjPMJb0LJNRgsZNlymOEFB
 oJbyAnGcwM/z7Y6B83umC0w6pKJK+kJm/gR1wAASIQ==
X-Received: by 2002:adf:ee48:: with SMTP id w8mr590268wro.263.1632757607229;
 Mon, 27 Sep 2021 08:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
In-Reply-To: <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 16:45:53 +0100
Message-ID: <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tk3CxCs6z16n

On Mon, 27 Sept 2021 at 16:18, Simon Glass <sjg@chromium.org> wrote:
> On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.org> wrote:
> > So what is missing in the QEMU-provided DTB that it needs?
>
> Quite a lot. Here are some examples:
>
> U-Boot has limited pre-relocation memory so tries to avoid
> binding/probing devices that are not used before relocation:
>
> https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html#pre-relocation-support

It's up to u-boot to decide what it wants to touch and
what it does not. QEMU tells u-boot what all the available
devices are; I don't think we should have extra stuff saying
"and if you are u-boot, do something odd".

> There is a configuration node (which is likely to change form in
> future releases, but will still be there)
>
> https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/config.txt

I think u-boot should be storing this kind of thing somewhere
else (e.g. as part of the binary blob that is u-boot itself,
or stored in flash or RAM as a separate blob).

> Then there are various features which put things in U-Boot's control
> dtb, such as verified boot, which adds public keys during signing:
>
> https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.txt#L135
>
> More generally, the U-Boot tree has hundreds of files which add
> properties for each board, since we try to keep the U-Boot-specific
> things out of the Linux tree:
>
> $ find . -name *u-boot.dtsi |wc -l
> 398

If any of this is actual information about the hardware then you
should sort out getting the bindings documented officially
(which I think is still in the Linux tree), and then QEMU can
provide them.

> Quite a bit of this is to do with SPL and so far it seems that QEMU
> mostly runs U-Boot proper only, although I see that SPL is starting to
> creep in too in the U-Boot CI.
>
> So at present QEMU is not able to support U-Boot fully.

My take is that this is u-boot doing weird custom things with
the DTB that aren't "describe the hardware". You should be able
to boot u-boot by putting those custom DTB extra things in a
separate blob and having u-boot combine that with the
actual DTB when it starts.

-- PMM
