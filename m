Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3832380lfa;
        Mon, 2 Nov 2020 03:13:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTMXAKan9/xXqXAIQjsTkVzHUAmyKoBgg9a5FjJ7qbwxd9qheHLV5FRZqIKITFjbljXJ1D
X-Received: by 2002:a25:ae09:: with SMTP id a9mr20798907ybj.31.1604315599644;
        Mon, 02 Nov 2020 03:13:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604315599; cv=none;
        d=google.com; s=arc-20160816;
        b=EWG8PiuDxQd241dZUWe+8F6DeGI5NuDvOeja7LQ7LnhWWxrZ4WXYnuQ5vZW3ulFVfe
         3rpzIl2vBJeSBDm8hXCOlI9qaANK9N0tB/rqoapSxLVRkV447hCLpY+wXRucko8cisPV
         RiN0v/OqAnrMK5JFj43W62QUyuhc2YbFeY7MBWgEMmg85AcACEDgr7ssbQ/SozlNvQAS
         qwCzLDHNlptLMKrFTUhNy1riLPK5xU4ppbNQi+Xm/RdKIkwWpSL5Z8nJGD8+MaDLmD08
         3gSlHZ2u5tUIAT+Bxx50i/zqQVlvKAVc+IyGc5IWnLCeZloagjK34S+/b330s9TbBt9S
         J9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfeX/a+AchVjQcqP2lFZDZCdUFs184FjMKpBV84t+OQ=;
        b=Cd3ImQRk2p9ktDfJwgwjW0giFvfkH8PQ8K/iZ8hE/RuaqEaW/DlT9Qd5vV3EhimQXX
         dIBWy1WflC4HLC/3Pc3bZRewGFRON+847xn1TLytaJ15bUDtRMDur95cnK4ocEDAhmCY
         nojEKqX5ayYamXYPH8fEFhwoT7eYhPGpGtvLnjWe6efux3QcikEpDrAbYxtp1oamW8I6
         WP2Tey6KDQvXcCo0jo1FWhf0KOiXSpg6UHyQUMqb+KWqupiC1HKu6vz4jPSf1k1R5AsV
         G989/m0Yo1r3whe7VPG78I9PD1oMwctCngnSau3bYl+e7/Cr67FtQOo1CZNZGU80ghjJ
         Ub7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QRZJLcl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si13875026ybl.37.2020.11.02.03.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:13:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QRZJLcl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXm2-0001TE-Uu
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZXlM-0001RU-Gf
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 06:12:37 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZXlK-0003PZ-Px
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 06:12:36 -0500
Received: by mail-ed1-x542.google.com with SMTP id k9so13965311edo.5
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 03:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hfeX/a+AchVjQcqP2lFZDZCdUFs184FjMKpBV84t+OQ=;
 b=QRZJLcl6pdKHSN9sVIN/iG5OGl3VAp56elkA1F3YYDXnjWUbs6rcRAR7Vsh2M36h1/
 SFA2i5fC6RNH+/V6/W1to7YoGdk8w2rPSjjTKC0DShEs4MLMWCu+05+qdOc71g6ONwg7
 Scbw6hbEVmdXB6Px7zSztVYWq4mtt6BgqZ9fTZ67ghvY7c6Q3rZpl3bQ+8/2STD6OCAI
 SshHiHNpMVAZ3J+HQoGSjhd8wA2LeIe2IbHKUNLNow32cRLSp+Tcj039E+GY6UCIxA7w
 EI25+coDsHyHJizGI2MaChV4i1qkeh0pD7QAbO5TSUu2QxBPYwX/lHYX4hrYWQoabmuF
 Z2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hfeX/a+AchVjQcqP2lFZDZCdUFs184FjMKpBV84t+OQ=;
 b=g3ooV4Aio5A6nbSH9+qvzZJjh9/Ja9MHGENnxMMAGgqXp0HL3LO8OwRWDviZLqOhRz
 +7fZX6NdsQ2i/hsFpYKYZDCvVFK4k+iLMS3kd9HDqnHTcYvYCoQZy76yHVoH+mnZ6zeW
 qafmkPNmReO/7YV07mnayVSN6/KRuGxswYPHqVq16yciqI0vj6EzNPXu4VN3fesp/6vs
 QqsA+UqreNguMXxwl1Lisa9DJmI+9l9PPdodcZj8jxZva4mWp0EgSGqs/PO9KdES/OnV
 hz0J9Ubhi6QsjGwNde65po3JwJPe7HIkvT2+hO0Y28W+eh+GKB9N8QY33j02pK2Nxc87
 M8Vw==
X-Gm-Message-State: AOAM532FUDrffdAI+NYBJm5yJ23cqr7FX5d1tb5LBvk1XmKcJyLHIKQt
 wiWCjEftSvdYW/iORjzHLG6aO1SkqC8yY+tgS3N2Rg==
X-Received: by 2002:a05:6402:4c6:: with SMTP id
 n6mr16341518edw.204.1604315553097; 
 Mon, 02 Nov 2020 03:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200921221045.699690-17-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-17-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 11:12:21 +0000
Message-ID: <CAFEAcA-hBRcOXmNbHPaPCuE94_g8dS61mPYyQL_JnYPCrBOZsw@mail.gmail.com>
Subject: Re: [PATCH 16/24] virt: Register "its" as class property
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: adXW+TbkzSh2

On Mon, 21 Sep 2020 at 23:11, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Note: "its" is currently registered conditionally, but this makes
> the feature be registered unconditionally.  The only side effect
> is that it will be now possible to set its=on on virt-2.7 and
> older.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d1ab660fa60..986b75a6b89 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2484,6 +2484,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set on/off to enable/disable emulating a "
>                                            "guest CPU which implements the ARM "
>                                            "Memory Tagging Extension");
> +
> +    object_class_property_add_bool(oc, "its", virt_get_its,
> +                                   virt_set_its);
> +    object_class_property_set_description(oc, "its",
> +                                          "Set on/off to enable/disable "
> +                                          "ITS instantiation");
> +
>  }
>
>  static void virt_instance_init(Object *obj)
> @@ -2511,11 +2518,6 @@ static void virt_instance_init(Object *obj)
>      } else {
>          /* Default allows ITS instantiation */
>          vms->its = true;
> -        object_property_add_bool(obj, "its", virt_get_its,
> -                                 virt_set_its);
> -        object_property_set_description(obj, "its",
> -                                        "Set on/off to enable/disable "
> -                                        "ITS instantiation");
>      }

This leaves the code reading
  if (vmc->no_its) {
      vms->its = false;
  } else {
      vms->its = true;
  }

which is more simply written "vms->its = !vmc->no_its;"

thanks
-- PMM
