Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp116139lfm;
        Tue, 30 Jun 2020 22:17:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRmv5DOltTMa1xpAmfRy/lH8G/IQipz/WeN458SG+NO+l5Ze7TTqLvS9CgH1wj74pf+deV
X-Received: by 2002:a25:7c87:: with SMTP id x129mr35314128ybc.130.1593580659692;
        Tue, 30 Jun 2020 22:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593580659; cv=none;
        d=google.com; s=arc-20160816;
        b=Nifi4RoD8fr70XP8OCZu0sTbBcS0rUeMZ52aCa9IIGOSrDyQRyu2W9O6EUOli3G+a+
         rKkzZub35NoZF6eN0aY2fqoY1zQzjDo23ta9wYgU/+jj5WzULcy8NWhnYkdPIn8Ytl77
         tThNaa697lj1F2Cx9i9pe2cW640k7h/5hpk6xr++GgadNHLoPj0f+cskhK3/642lDIvp
         bfdixHVhIKycVg2/W6rilypGs4TAQh2MxFLH1hYqNR7runhudvt8RX1Cnmy1HxX4+dbp
         Swi2d9yhJWxYld6mijlp2L27puJ3DwOYwQVcU9up8T8ko0xqm6XyY05fHTMKdm7VdEv8
         LXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kF1nPewEs4svvfCErz+hyoR5AHqtb6HxSV+xtv+VcUU=;
        b=URRRSvr9IjK4FrquJyxaEfHMIfhKMEDVyNl3cZ+8ycsyobAR/cWtHzWaIrCS9K46MI
         IDErwG359OK4tSE0bmk5A9pzZ4s3KpA5BQVvm97VmHesjK/WeC5xZId3S78aLs4/59hR
         ToHGsg3UF0ciptiP3E69aFFCam+F6ZpGwiNxvK5y64PzFeeh9M7CxebLiPwy/kwHZf0F
         ot2ZajEJUDACS3uvkos3+nvlWMGhIP5SQYVtZ978ibzNVRzF8RwPaijFcmDErorQsRcb
         0TWGsdHK6OpwuMSlRgJN6numZjMi1qedq5p4jw5XXkO8E5kpH/pDansehtjpj9lx4a4v
         +DaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FYybjOT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si4418533ybt.353.2020.06.30.22.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 22:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FYybjOT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqV7r-0006fh-3t
	for alex.bennee@linaro.org; Wed, 01 Jul 2020 01:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jqV7l-0006fZ-1A
 for qemu-arm@nongnu.org; Wed, 01 Jul 2020 01:17:33 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:42178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jqV7j-0000Ff-Cv
 for qemu-arm@nongnu.org; Wed, 01 Jul 2020 01:17:32 -0400
Received: by mail-oi1-x234.google.com with SMTP id t4so1729884oij.9
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2020 22:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kF1nPewEs4svvfCErz+hyoR5AHqtb6HxSV+xtv+VcUU=;
 b=FYybjOT9+cbvFxMziY16FHuXG/Ck0qdgZYCQg5upjGOwcN0EoWNCMq8DeMoKfrjT9+
 lWgoaK6NW1S6SQLO30jgI32eKC3iUYBabtF+zSCSXPuprZBQWsjOW1cN3qZKxCqkWKpQ
 N6jb5TFSLSrqPUZYk0PcGu2o2ydf0D8eQPEN1sIYr7Fx3m9T6zz2JtQIYSoMbrWyZMMi
 4GSVtMiE3p/+ezbQLARwCvshipljsu/gXnP5FX/yTL6GaB9IXeqBmMHA3RYEtpwFTIWX
 TEk9nRNE03P0qQ71zbjf7bPx2oPAs5djLUqRCi1oiMx6qD3MtGHrXiJdDZFHNibmIvQl
 W6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kF1nPewEs4svvfCErz+hyoR5AHqtb6HxSV+xtv+VcUU=;
 b=Gznr3fchhU3/hdAkK4EW9H0KBJty1ChvAExS2fFanDq/LEXIqjxUHAdo+3Bp6LmezF
 daGoahLfWdHHHh8ApL1dHHqPutPJZof0Yp8IziV2LRjNh2jgZ2O3+q/mY4cOns5PQ4G+
 p8QNivZHPtbJONkmuc7A0z9eO9P6fX/UeJ5wD5ht219VwOy0peRkvEI0r460J3LSi4Ry
 jntyT7jLFXj/iiM/66auZhXD+IK2Q9vmdRh67iTeEXa3P/HyL6zOU2d+XULX46VP+ewN
 8PsCaKu0gq+4z6kea6iXNMNvg+LXAqtzz+bDKkwM+ZbMSK+7cKl2faZUGljqmi7lSfrf
 lxqw==
X-Gm-Message-State: AOAM530auU1ZHvS9Zgn8rv3NtxgPHaMHea/Vhv/6bd4DP8nRvjzCk0Up
 kPlyc92W0j+wsv7L6g+oiXFWRlI3FmUZ/rg3S1Y=
X-Received: by 2002:aca:3b54:: with SMTP id i81mr18015007oia.84.1593580650147; 
 Tue, 30 Jun 2020 22:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
In-Reply-To: <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
From: Erik Smit <erik.lucas.smit@gmail.com>
Date: Wed, 1 Jul 2020 07:17:19 +0200
Message-ID: <CA+MHfouin6Zmz+GrjWRCc_WzPF=ff-z_5V7BLv0HkL+SW9bRoQ@mail.gmail.com>
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-oi1-x234.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pquAU6qvvlJs

Hi Joel,

On Wed, 1 Jul 2020 at 02:54, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 30 Jun 2020 at 15:32, Erik Smit <erik.lucas.smit@gmail.com> wrote=
:
> >
> > Hi Philippe,
> >
> > On Tue, 30 Jun 2020 at 17:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> > >
> > > Hi Erik,
> > >
> > > On 6/30/20 5:11 PM, Erik Smit wrote:
> > > > Hello,
> > > >
> > > > 5d971f9e memory: Revert "memory: accept mismatching sizes in
> > > > memory_region_access_valid" breaks Supermicro AST2400 u-boot.
> > > > Supermicro AST2500 u-boot is fine.
> > > >
> > > > The u-boot tries to make a 2-byte read from address 0x84, but
> > > > aspeed_ast2400_scu_ops has min_access =3D 4. When I change min_acce=
ss to
> > > > 2 or revert above commit, u-boot boots again.
> > > >
> > > > Is changing min_access to 2 the right way to fix this?
>
> Ryan, do all addresses on the AST2400's APB respond to single byte access=
es?
>
> > >
> > > If you have access to the datasheet and can verify, then yes.
> > > Else I suppose C=C3=A9dric, Andrew or Joel can check for you.
> >
> > I do not have a datasheet. Aspeed seems quite picky about sharing this
> > and I'm just a random researcher.
>
> Erik, can you point us to the image you're using?

SMT_X11_158.bin

You can get it on
https://www.supermicro.com/en/products/motherboard/X11SSL-F by
clicking on "BMC/IPMI Firmware" on the right.

> What is the command line are you testing with?

qemu-system-arm -machine palmetto-bmc -m 512 -drive
file=3DSMT_X11_158.bin,format=3Draw,if=3Dmtd -nodefaults -nographic -serial
stdio

Best regards,

Erik Smit
