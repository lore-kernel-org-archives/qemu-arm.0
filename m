Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1703855lfm;
        Thu, 9 Jul 2020 12:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvS1aY468CMw3p3B/JDBnPqDqZhxyYqIQzuFuvYIjufbUhyTFtUuySXfuUbwdVx40+o6wR
X-Received: by 2002:a05:6902:709:: with SMTP id k9mr83895468ybt.245.1594321260457;
        Thu, 09 Jul 2020 12:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594321260; cv=none;
        d=google.com; s=arc-20160816;
        b=yKygvKgOM9EiWmvAAXbtrl7MphxNX3JtKwNof2S5MW6/y7v9zKur3l3eVfeAV8x7CF
         iFxqEf4C58f/4OLx+sdb7JRDY4pEGkqtZgJHAF6dh0VgnhSjSRaU+pdOvgEGFwQMpTCN
         iPH4tyJw/4yJSsX3NpxG2wckYnbgnNjpG+k9RbHp7+2rzzh204lZp5eVs475y27bnJhN
         H2BDwyoKhb6ogysqEBWXJNiiFfCZJzDCDfBA1LHjj9evGI4qstRU8WXACmsU2p8ya7XG
         /3rG6L+qtNf9ag8uPoH/dejDlCEUs/Sm+4SDYUNTQfjNCtAnoLEGtVZ6BfIhULFGoL8/
         xGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=95VhPjfLEHBiCVgOh1i8OPiRUJ3tTZfViGVGNdJFeW8=;
        b=QmLfmjk+UVWM08SUIFmZe1kk97nWk/GdWi3xwaS290JOLMvczgWVPhlXALGtBx4F2U
         faQFlfDcugrcjPaJV6uyB7q0zhx1Zcd8qxnPBRCTwO79weX+AUyrdYAHmKko3dVYAkqN
         Drb8pwEj81HEoWyUbGXPiC8nu8LGrwrqbqMlXM9hxouRQC1YtfbhI00vcAGchwqwC1fG
         VRWyMNqmqHhlXBUxGN9/xi0jt1Cv7Oy3V9WqYLYXFy5hKbN7PS6O/6e+Egfvyo0wunxS
         YLqDWZu3GK120OcyDWzK9o/8eetC+2gfa8rdJbbWeR8ytaG4nKJ5tVGb5hyBLV++BNzV
         XQhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bcw2QeQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si3303390ybm.102.2020.07.09.12.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 12:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bcw2QeQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtbn1-00014p-Pp
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 15:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbmq-00014K-Cu
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:00:48 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbmo-0003LO-ML
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:00:48 -0400
Received: by mail-oi1-x243.google.com with SMTP id t4so2732004oij.9
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 12:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=95VhPjfLEHBiCVgOh1i8OPiRUJ3tTZfViGVGNdJFeW8=;
 b=Bcw2QeQu6iiVjiXAnbO0F+xRrQx8SswyzCyyOXU/jkh9ZX8f89sC93S7eWs2EbjuHP
 gXkvsglL9m4XQGPJzE8TUYOHKGpMURLhrpPUxWlb7iheFEHNctEj+di4d+F77vFPTtti
 PhJm33fINiqlLUKB/Fybg26sfnq3eOJ6CxYeL3QEW/sJ0kkgIiwT+ewPl/icC4DsP4SK
 yXevbTjg6Nz8a44aMPSyLRT2h2F/1d2v8woOIEqO04bv4kLmIHJdPtidn9fubeDiB6dA
 NzAnLIJzMcy/jy/ZhaIHtNjKPfxOfUb+LrC6HV0OcvPGyjqVTLKhEiNOoJj6+U4q+Ejk
 njrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=95VhPjfLEHBiCVgOh1i8OPiRUJ3tTZfViGVGNdJFeW8=;
 b=WPU2BxhR0wDH5iKb6QmvsAxImhR1NNHxw0Gzysv7ev1EhyKVpQTdAQOqfhHiC5SP7k
 GDAWC2k7Hid9XBfwwUK2/C7IJ37u/api7K4rGircOvwGOsI2hRgCR0CXhzLiZ+0IF8IF
 ktNYdruFl7kPDgC6REdJPCWqUC0EvuMP1GHCs+3lN9BgB+m/fxLESe247UbLFbbkkUZo
 i2WNoRzaQyFIrI5g1ACh9pP3PPMl8OUg/H4bFkw4cDf0cUFsQ/ENoOqQXCD6X8X/A+vI
 RyWBXR6JKoR5pRiY9jqhHEOkgC0Ge6yHfVgTijFydHJalSszThhaN4vdb0sHNMd45DBY
 CDUw==
X-Gm-Message-State: AOAM530LvoydwGEcxV93ayADrdpfdguc+zCE0TzBH38ts8Frci9oBxiE
 G8VxFArw0QgaUDEhzh4bbSJLZU6XuJKTtDePeQ/Xlg==
X-Received: by 2002:aca:54c9:: with SMTP id i192mr1320049oib.163.1594321245523; 
 Thu, 09 Jul 2020 12:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200703201911.26573-1-f4bug@amsat.org>
 <20200703201911.26573-3-f4bug@amsat.org>
In-Reply-To: <20200703201911.26573-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 20:00:34 +0100
Message-ID: <CAFEAcA_fsBtBnzarO4Obd7-5766oSuHzDqRrK48VqgDmH5ip+g@mail.gmail.com>
Subject: Re: [PATCH 02/18] migration/vmstate: Introduce
 vmstate_no_state_to_migrate
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jHymafxaUSna

On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Introduce a special state to indicate when an object doesn't
> have anything in its state to migrate.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/migration/vmstate.h | 1 +
>  migration/vmstate.c         | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index af7d80cd4e..0922bc8efa 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -195,6 +195,7 @@ struct VMStateDescription {
>  };
>
>  extern const VMStateDescription vmstate_dummy; /* Exclusively for linux-=
user */
> +extern const VMStateDescription vmstate_no_state_to_migrate;
>
>  extern const VMStateInfo vmstate_info_bool;
>
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index bafa890384..d640cafad3 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -20,6 +20,13 @@
>  #include "trace.h"
>  #include "qjson.h"
>
> +const VMStateDescription vmstate_no_state_to_migrate =3D {
> +    .name =3D "empty-state",
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }
> +};

Does this definitely not put any data into the migration stream?
We don't want to change what's on the wire for machines that
use devices that start using this. (If it does by default, it
would be easy to make the migration code special case the
magic symbol to act like "no vmsd specified").

thanks
-- PMM
