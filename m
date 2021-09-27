Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3954371lfp;
        Mon, 27 Sep 2021 08:18:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqYqoe1xDZlhi9dKaiJhnD7X4P/s6HjcUbFwKWiOOWkfyNrDl3V2peJl9zPCG4PJ3Hi88x
X-Received: by 2002:a67:e94b:: with SMTP id p11mr102020vso.33.1632755912034;
        Mon, 27 Sep 2021 08:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632755912; cv=none;
        d=google.com; s=arc-20160816;
        b=BQu2fadSZZdU/8BE1ZsWlhusN6hb/2wTqjFvpENqE+CD37tfg5xqnTPge/L/6llp0B
         sRuFIiLNHZVpQmIpgnq/J+cgw7gpQ/UYlBfLBJwTpv/qR7lbuVmrKi44rXXHF6ubn4IC
         smUQYzq9h9TS/4gFlSc8SR4HJJJ0Xw9QDs/Mu/wYTpGKMMTPmWsa2x28b4Pru9TxtI+j
         NNALQe0FONRayRNZxbFt6ScRSV7UlYfuGKNEuMdThOKMxmUCgHN7RB5WjnHRUvWT3vvT
         NDnN3UI4KcCwjVvHyUOcphkX9f6AEcDz1H8rEtL2AgDaV4jE2u/iJLOZ0kH9YSbXMUlf
         dzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNd5Gru1d6gt2MuT3knaFcvxWIHVgR33D0qJAIFCPlk=;
        b=tTe+jnvs6Fnu4mMWJdc+jH4+OCmSEF100aUGduuhv7j5KK89+OIC7vwEJ7tn/bH8aO
         e+jKk5qao+FaHV9rmUySkECSw6HFKWpPeJu7sloeRVm88cRU4TpltcxyPmXSZnWIUWju
         C3dY6oSb4o99izb7+sug5JAM+YpYYg5ktEHwBFDjOhj5s3Q3hn/8uN111NoJp/KLWd1l
         sCQPde8KpVt02g/ualAcV/7z/XHYowyOOIHwSAcQVpRBg11qLIJZ/RIPlMZxqINt8KoL
         7+wnuEcgZ6z3dUIGotxljtn1WegBcfC5kPbgfVnT6OvE/jqAXeWwYtOKeN2Ys0A3UmXJ
         yfDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@chromium.org header.s=google header.b=XdfsVD0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=chromium.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si4688248uao.186.2021.09.27.08.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 08:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@chromium.org header.s=google header.b=XdfsVD0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=chromium.org
Received: from localhost ([::1]:60860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUsOj-0001VB-N9
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 11:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUsOM-0001Rw-3l
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 11:18:06 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:40911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUsOK-0000Pn-9J
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 11:18:05 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id l19so18508387vst.7
 for <qemu-arm@nongnu.org>; Mon, 27 Sep 2021 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNd5Gru1d6gt2MuT3knaFcvxWIHVgR33D0qJAIFCPlk=;
 b=XdfsVD0Q5jUfBgeEm3Nd1HAJfBen1dV/zP3eC23k8ksCUssvKarms6+P75QK95zYyQ
 OEy6wmW/BhlOAp2WbA1iFyB6jrCH3L52+O8zK/GvMpvtShVMJXf/28aDPhlRtTiuctAQ
 4zMp5mW3wPijl9mIJ9u1bmCyldsOywsjuu0Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNd5Gru1d6gt2MuT3knaFcvxWIHVgR33D0qJAIFCPlk=;
 b=17KOQtycFXsjXIloMX7Jr+x5va9t490cxo/JPlKb+AlaTpzJs1PunPZCQ+feN6lAwx
 nW/qPOOZLToj0HtNELTqVEQZ5B6oCksPDjzRf0KT9DaGD+u2+YmgKkoFzSnM3KxhpEiI
 w68yyDm3EtAS8iDjt6waLvSSxs+TPZGFUJSbZPBXJiJqVl0eSVbXW5jKSOpe1TNtLXk2
 QKBQaRaJNZbQO/QPtJNxUWedBw44l+52kajCWoqh+/dcAXYU3EIiURFsEXXjF92J3MId
 3P2Mhy0P9uBRJFcdSN4YaicTj0FtaotZnNyZ3mkkOadL120kLT2Rh5XHJZoB0KkiZiVw
 J1Hg==
X-Gm-Message-State: AOAM531wBo4aeJ/RI0M4rEl2lj9nAAPWQ/4awJ3Rv/iQQGSW1dF8XJym
 reef5nwfIJRw+jtrHDr9ZCAWpOtKP8r46i1qM+G+0w==
X-Received: by 2002:a05:6102:3a59:: with SMTP id
 c25mr396589vsu.15.1632755882509; 
 Mon, 27 Sep 2021 08:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 27 Sep 2021 09:17:51 -0600
Message-ID: <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=sjg@google.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: wjJD2FbMQRnF

Hi Peter,

On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 26 Sept 2021 at 19:55, Simon Glass <sjg@chromium.org> wrote:
> > In the case of U-Boot at least, it uses the devicetree for
> > configuration (it is a boot loader, so there is no user space to
> > provide configuration). So the current setup is not sufficient to boot
> > it correctly in all cases. On the other hand, the 'virt' feature is
> > very useful for testing U-Boot, so it would be great to be able to
> > support this.
>
> So what is missing in the QEMU-provided DTB that it needs?

Quite a lot. Here are some examples:

U-Boot has limited pre-relocation memory so tries to avoid
binding/probing devices that are not used before relocation:

https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html#pre-relocation-support

There is a configuration node (which is likely to change form in
future releases, but will still be there)

https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/config.txt

Then there are various features which put things in U-Boot's control
dtb, such as verified boot, which adds public keys during signing:

https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.txt#L135

More generally, the U-Boot tree has hundreds of files which add
properties for each board, since we try to keep the U-Boot-specific
things out of the Linux tree:

$ find . -name *u-boot.dtsi |wc -l
398

Quite a bit of this is to do with SPL and so far it seems that QEMU
mostly runs U-Boot proper only, although I see that SPL is starting to
creep in too in the U-Boot CI.

So at present QEMU is not able to support U-Boot fully. It would be
great to add this as we use QEMU heavily in CI testing, e.g. see the
second column here:

https://source.denx.de/u-boot/custodians/u-boot-dm/-/pipelines/9260

Regards,
Simon
