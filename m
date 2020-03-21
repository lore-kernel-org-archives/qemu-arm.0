Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2112874lfe;
        Sat, 21 Mar 2020 05:58:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vst46t91+m9iE+ieP6oNgLtKoPMRuD/8LVuXewIz1M6ju64RGCYHBWoEkfCvZJqq1yCJw2x
X-Received: by 2002:a37:d13:: with SMTP id 19mr11861386qkn.404.1584795529087;
        Sat, 21 Mar 2020 05:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584795529; cv=none;
        d=google.com; s=arc-20160816;
        b=lW+uuAxy5i/gXWuz3Awv1VzJlhedlPxwry694zln9Gq28FsmVZlxXBSMg27Gejyf0B
         XmuPjng5jFa+lEoMBAghiiin9wkAPYKxMuGvVqhVnYTlyAoDOCFr3yQjDZ6sejPFvXYX
         rdH045ARZs52jROfjHVSFXmuDGK1l3qmM1yqkD8tLKdLmiy6hhi09ni5Yn8ebpid7MnR
         aV2VI2d8dl8V/8Rl73EUpvIiapPYVSCE19+SiaklOFJtTSj28HstQRuEJBMHhAuHGLww
         wMtuWPvHqSHIUQ7gORajFTY+EU6f8ExJUDW+IuSWKTywcRsUSX0xlBc4aTo+PpyWn4Ih
         o/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=ZnluphLnzU/fgaJPJLvRMacBb1Eov1CCVngcn/m+wI4=;
        b=t5hmbLWQRqrUewGfV9P4GPRXFI5JxyaeBzf0KMJ8405nEvVbsD1MoTYetYpsRe6bTC
         HzSaZ3nutEywsU9y5UB7MmpcETjpGP3dYXd06blPgx0CFjMSUUQPvL36zDdvKszeIoTD
         DHw5scSLFJ9YlmQT/SaMYvh6IPgXnVGtfMfkcs+SoEAstJe30KOJ5xHlCFM4fxwxkJvV
         X5iCgYH+DluCUf3w0bQUcO+eyy1wY/MSgUJAJyTH+zNHUjdWalsNmmIb0XCfuocnjfwq
         zYw4eJs04AdRo0NV0J00ZUu+CPS9gDHDdWfcKiqTgqICeV+cySccKWUp0Bdov+HXBE5j
         wyCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si5027554qvt.100.2020.03.21.05.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 05:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFdiC-0003vD-Gx
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 08:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFdi4-0003v4-Aa
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 08:58:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFdi2-0002n3-N4
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 08:58:39 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:44100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFdi1-0002Vg-Kg; Sat, 21 Mar 2020 08:58:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F0227747871;
 Sat, 21 Mar 2020 13:58:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CF6537476D5; Sat, 21 Mar 2020 13:58:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CD57D7475F6;
 Sat, 21 Mar 2020 13:58:33 +0100 (CET)
Date: Sat, 21 Mar 2020 13:58:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0 04/11] hw/input/adb-kbd: Remove dead assignment
In-Reply-To: <20200321114615.5360-5-philmd@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2003211347330.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-5-philmd@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-964345878-1584795513=:82121"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bE521BHbA9wV

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-964345878-1584795513=:82121
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix warning reported by Clang static code analyzer:
>
>    CC      hw/input/adb-kbd.o
>  hw/input/adb-kbd.c:200:5: warning: Value stored to 'olen' is never rea=
d
>      olen =3D 0;
>      ^      ~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> hw/input/adb-kbd.c | 1 -
> 1 file changed, 1 deletion(-)
>
> diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
> index 0ba8207589..b0565be21b 100644
> --- a/hw/input/adb-kbd.c
> +++ b/hw/input/adb-kbd.c
> @@ -197,7 +197,6 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf=
)
>     int keycode;
>     int olen;
>
> -    olen =3D 0;
>     if (s->count =3D=3D 0) {
>         return 0;
>     }

Is this variable still needed at all? Looks like it's a remnant after=20
a1f4971863 that can now only return 0 or 2 so you could just remove this=20
variable and return 2 where now it's assigned as 2 or change return olen=20
at the end to return 2 or maybe keep olen and change the return 0 above t=
o=20
return olen to silence warning but I think this could be cleaned up.

Regards,
BALATON Zoltan
--3866299591-964345878-1584795513=:82121--
