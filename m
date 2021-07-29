Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5475527lfc;
        Thu, 29 Jul 2021 02:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+Db19kzoNG1hpsmDXkeDSCn3JSZyPgAjIB5tvAX3ekAxSjmZjfQnc4Os1sJoHDF+6dxJl
X-Received: by 2002:a25:14c4:: with SMTP id 187mr5406341ybu.236.1627551854435;
        Thu, 29 Jul 2021 02:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627551854; cv=none;
        d=google.com; s=arc-20160816;
        b=rjHM8OaIgsXuRiFl8RAQXPlkzC1T1LruE4x1TR/hF4iiRP+sZrIUsG8Hu9ktG42zDq
         qqiZ1EO+dgS7wtqsEG6e+vziHaHdaq++dNY706xxKelCrjXlC5IOovp26QZBpGieMHq1
         cPXAIHGTXuIrayMOWXrjDwNVmSP7SudL0uZLsXHwvJ34TUPj5/9kap2YfNjpBGMvspID
         QonSyQHUTjYupbVIaeX1NVGwZZPXieefkR7/s+3H90ydZQcKdVK9S3udWZrGUEjqDL+O
         136Me05GVjq9GZy0Xhb6ybOT8bqHZYaVqKtFVlyrU+OWk9bkOMfRk2UjaRl+vmJr+cpe
         SYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lne6nm+b8QN/YVq4G3DHwTADJQvygLl78P+89H3EuTw=;
        b=YomgrWWjDmbVenMSi+D0yBHXwQz+wVL4tjJCAEIEvRaasLskb2O0xaCpinc9kF/nou
         Tg8wFL7U2PfcpIhkSKhzSPqXf9NheFOvq0EGvKP38NGFPwxjMxCiikGQB+ED/s3oAa4Q
         7vsU57E21H45m+I6Uzcqu37XXAB5I434r51wxlnePIi7AVNAlBV6HM2CMCn+Xfqazp9y
         6Zsvho+epLwsKuT0L5LibZAoV1KoI6afkzQ3zzsw+xrR3kH4tLDes3lNG+QbhfYSp6ve
         YOXdRLDjkulnRu8ZACnsHyF9C9hHglIhNVAdZGIG4ryTvIDdaoTYgdMySL1THGIYSL00
         G6GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rs37zKnI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v71si2401512ybv.434.2021.07.29.02.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 02:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rs37zKnI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m92aL-0006lV-RZ
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 05:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m92aD-0006kr-Q4
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 05:44:05 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m92aC-0003bW-7f
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 05:44:05 -0400
Received: by mail-ej1-x631.google.com with SMTP id ga41so9598194ejc.10
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lne6nm+b8QN/YVq4G3DHwTADJQvygLl78P+89H3EuTw=;
 b=Rs37zKnIU7FmkH5I9gx92FEQm+iCi7CG1TM4az523Iz8PyS3UoZuOwTfbBJm0Cu8K7
 4UpFo2yBvvZ343UftnOTHayMB3hmAVVEgTMHZS9OJMug5NgNwRltknvqHuFcgtL2gaA6
 hBXMCl5T/S1zJ96nG6SD+3b6jyldHqEypRjmni6wFoKbC7RnX42swENMsR6MlrmFLUPx
 k9DVWKwJPI0isylP1bRuS1K00F3tzRKb3Rdie7g7Rh/bb/QfE/Fdo/DgAMhXU0TUk0na
 CfyEMhmNveWgYB/tz2oELYPi6ryCv9rQcPH2SRX/hlGopdjoXB+g2siqXEWyYrfrD8Xo
 W3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lne6nm+b8QN/YVq4G3DHwTADJQvygLl78P+89H3EuTw=;
 b=Iep0ynT61Q0AIQXMzdyjGEln2tlHdI4sfGp8npeHKcZ42BoM6C4Fcq3nOh3teoPStb
 Hp1HLoZmG2tVTDWvAeDonkLGV85iPrlT1wWyGBunsWkAYW05NSNqSUb4RPd0/U4jX0+o
 B81b6QkL1jziTy5raEQ3dNnIYLTGJg2/NdnDShCq8B2ZFDNeh8QvdJbHM/oj1sZ0C/B8
 k0AkUDgq+5eSki4VYhFvHUeamurxVo8NQcAYY9m9tiB2QfHglqHALyVyK4Tb0eMYrz+L
 XowVmQiY2uu11c6sCtKrZI+6UEr29bqG+WqEDVXHONbCt/QHhwA8HIk3X8T+uZuMpyed
 AQWA==
X-Gm-Message-State: AOAM530Cl9rjMG6MoApSvP1LufYjlceTCkoxCsPwR7czgEJvoxWFPIY4
 D81J1yrhbmy9WroAjDhZn/CYFZelJbDxSvDNcMNvjw==
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr3858587ejz.250.1627551841788; 
 Thu, 29 Jul 2021 02:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-5-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA-Dd0eh35CUo7_-_adye+DrTuFK471-A3JfBbegxoU9Jg@mail.gmail.com>
 <TYCPR01MB616010C1BAD136B9156C6B86E9EB9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB616010C1BAD136B9156C6B86E9EB9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 10:43:19 +0100
Message-ID: <CAFEAcA-_Q2D3WjfabyNXFnHsGsi2i1f=JmYVDGg47=EJamerCg@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/system: Add a64fx(Fujitsu A64FX processor) to
 supported guest CPU type
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NB4U9SUIHl8W

On Thu, 29 Jul 2021 at 08:31, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hi, Peter.
>
> > This adds a64fx to the list of CPUs we support in the 'virt' board, but it hasn't
> > changed the valid_cpus[] array in hw/arm/virt.c, so trying to actually use -cpu
> > a64fx with -machine virt will fail.
>
> I'm sorry, but just to be sure, let me check.
>
> Is it correct to understand that the above comment means that we need to add
> the following fixes included in "[PATCH 2/4] target-arm: cpu64: Add support for Fujitsu A64FX" patch
> within this patch to make it a meaningful fix within one patch?
>
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 93ab9d2..2e91991 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -202,6 +202,7 @@ static const char *valid_cpus[] = {
> > ARM_CPU_TYPE_NAME("cortex-a72"),
> > ARM_CPU_TYPE_NAME("host"),
> > ARM_CPU_TYPE_NAME("max"),
> > + ARM_CPU_TYPE_NAME("a64fx"),
> > };

If you want this CPU to work with the virt board, then yes.
You should put it above 'host' and 'max' (because those are
not-real-cpu special cases, so it makes more sense for them to be last
in the list).

More generally: how are you testing this patchset? To test it
you should have at least one board that lets you use the new
CPU type so you can boot some guest with it. So if that's not
"virt" then what is it?

-- PMM
