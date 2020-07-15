Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp875713lfm;
        Wed, 15 Jul 2020 13:55:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn+9MaoJCuQHE4Ty9HLtsRmeviDfBsxY6+Vd1EgZh1A7qufW5eVC6vVk+89sSs/XDbhusF
X-Received: by 2002:a25:6fc2:: with SMTP id k185mr1349073ybc.461.1594846510991;
        Wed, 15 Jul 2020 13:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594846510; cv=none;
        d=google.com; s=arc-20160816;
        b=hmE5/5pCD38CxAX7uruVf8z/v6aVneO63tadlRw3KnoD73xs/OH0kff6zTN+cWF6ry
         UunSjrpVd37vZBj8+hNdqZgFLPe6xYw3wQZHRPgjtYJvEou3p4OKoylwKNNzduWn53KQ
         DaRSSw0qHjvqUSQTXQ4mE19XSLq3If/tqi56kFOdvo7KKzQa9X0d0WO7oc8zTVNEPvlj
         +fGm8LPu0VAY5HFx1yI4lpvcEiJLCx2Vasj+Zitf8o+yIsMjOrLJNbclzs1x4GfVh01+
         eBrsedDcucfuhoQk/Mj4puVFczFEGyd8/HRCx8NLafDww3Erc4b3Qn2zuaFO3UXB0IOs
         uYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wT/iOl04LklyNTYNy9oe4lH+HwXWt0z+43Slpq7sUEY=;
        b=aFZF7WdwMqUPxoMYQIkcXuqajBVCnCH0gNd0GUUJ4H0oYARFScCA3g9cU8LElYZzX+
         bBqBeSKyKZ1RVH/juJ1n/UUicYCnTn9phMf0ajdb30h9E3GPTWwFTLFIW/G9vGhXdSpL
         YkwAglkMNjkO3dNn7LCOvHtRdg+2buKuYqUzrWNd7wQNj2KBFJZ5MU8eNfeqZ/AoiiS5
         tbbRtl9FZnGpbU1YpcKtwvr7elIRvqGNW7/JTTjr9gtsyC/AOLydlPqbtgyjfQhJY5mK
         mW9YlJOwbqy3pmFRt9bwLVYLzk4FURu12l4UiyOVLmVCiqmgAGysfWLP5taFfL4EmJk7
         6lgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=W32fOqLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si3642193ybn.422.2020.07.15.13.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 13:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=W32fOqLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvoQo-0001C4-Cy
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 16:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jvoQg-0001BT-7R
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 16:55:02 -0400
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44]:36215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jvoQd-0008IT-22
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 16:55:01 -0400
Received: by mail-vk1-xa44.google.com with SMTP id s192so815244vkh.3
 for <qemu-arm@nongnu.org>; Wed, 15 Jul 2020 13:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wT/iOl04LklyNTYNy9oe4lH+HwXWt0z+43Slpq7sUEY=;
 b=W32fOqLKFp27FC8IwMTmryxnixAzU2cia5CabloZ5wqWP5HS8Lkl/ixQGpRArRwExj
 Txj7ouJVdfHR+kERw14EXy6NZMFvT3i2x0v6uq6HLWtfH4PfO9w8dqGkVfvRPQtkufF0
 +UdGbR2sOACUpd5TpyKJ/RA4uDsjE4cU6ADRZxXx97yewYyPskWBQFy3t7HlE9oUWLxi
 rC/m+mZqp7LO/POoKIYA8Mi8EvHNUhpCSWCl1UQH7G09uioCIEjUiTjDRWvGxmEkoQbI
 wrIf2TaBC9ry3sXYP5/YQje7jxCNElkGSXTzG6o3vL+Qc8uP1TiTtVjoZisIpcyReCi7
 hT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wT/iOl04LklyNTYNy9oe4lH+HwXWt0z+43Slpq7sUEY=;
 b=ZARVoNZPNSV1NU6TJZFA2T2KfE4qowB1ZaPQEcOI3obUv+WSXvy1ZOl1Z6RF51TkOI
 Qts+hcM3CL0/+Y5v3VcHwWcpYt//rVZB7nvEBObEee3U7dOlABtO1Im4fFi5Ki/0KL0w
 b72PQPR/u0qWWWwUjz2t+L50DGbdaCK1FOxAmS/ucwSVRq6YcCyxD8dplDJjqkRcHock
 iY9AL18sGiRdesCdBKb+WUL2/qeFjssBNwFyiVakNRUVt0E5e27Z1xdNMWqKiSp/+ajZ
 et25eAfSlCvGzO9XSV4J07V8gQzweGDl/3WHSci3R3aIQFRUwLWfJ6oqUnX2Du0FOXOD
 WD+w==
X-Gm-Message-State: AOAM531gMHBQDra2kTVemhVYIJaOK1Y4qPfLC/iAGHpUMJ9Erj1erWVL
 gDyC5KOk6FkZ4+KpbQXX2roiiTNQVTg/Vj3BI9BcuQ==
X-Received: by 2002:a1f:9144:: with SMTP id t65mr810292vkd.50.1594846497712;
 Wed, 15 Jul 2020 13:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
 <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
 <875zaq78xq.fsf@dusky.pond.sub.org>
 <19733456-a672-595d-e721-e0ef26d7f665@amsat.org>
 <87v9iq2hkv.fsf@dusky.pond.sub.org>
 <e87663cf-7cb2-ca6c-a751-e5c1cebc5440@amsat.org>
 <87pn8xywz2.fsf@dusky.pond.sub.org>
 <b3bc658f-a865-8e6b-c904-01c7724e89cc@amsat.org>
In-Reply-To: <b3bc658f-a865-8e6b-c904-01c7724e89cc@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 15 Jul 2020 13:54:46 -0700
Message-ID: <CAFQmdRa9FiP6yX=XDrJy5KpjifQyVkQiY6DXtSoJSvfoq7Vm6w@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Qemu-block <qemu-block@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>, 
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a44;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQIXA35ipAWq

On Wed, Jul 15, 2020 at 3:57 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 7/15/20 11:00 AM, Markus Armbruster wrote:
> > Now my point.  Why first make up user configuration, then use that to
> > create a BlockBackend, when you could just go ahead and create the
> > BlockBackend?
>
> CLI issue mostly.
>
> We can solve it similarly to the recent "sdcard: Do not allow invalid SD
> card sizes" patch:
>
>  if (!dinfo) {
>      error_setg(errp, "Missing SPI flash drive");
>      error_append_hint(errp, "You can use a dummy drive using:\n");
>      error_append_hint(errp, "-drive if=3Dmtd,driver=3Dnull-co,"
>                              "read-ones=3Don,size=3D64M\n);
>      return;
>  }
>
> having npcm7xx_connect_flash() taking an Error* argument,
> and MachineClass::init() call it with &error_fatal.

Erroring out if the user specifies a configuration that can't possibly
boot sounds good to me. Better than trying to come up with defaults
that are still not going to result in a bootable system.

For testing recovery paths, I think it makes sense to explicitly
specify a null device as you suggest.

Havard
