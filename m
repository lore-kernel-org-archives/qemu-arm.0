Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp634798lfg;
        Wed, 3 Aug 2022 15:16:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6jlOrrzU1d6OVGrp9XMTSyfyja0ud0Z2ZGTPu1s9OKimjiZmQCOrJLrj4ACmvx5nxa0WPe
X-Received: by 2002:a05:620a:31a0:b0:6b8:ccd5:59f2 with SMTP id bi32-20020a05620a31a000b006b8ccd559f2mr6882034qkb.712.1659564988122;
        Wed, 03 Aug 2022 15:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659564988; cv=none;
        d=google.com; s=arc-20160816;
        b=nT6b39PWWDCJz2ZDZ8NUMkTaYBqdPlwBkX2bHlq9UYYcInXfwdO2W5DRINkm5gCDrx
         Vk7yHk5jl/yJE+N2nTzuLr6UOG7CplBDj2DXZxk3Ajbn+AqmtcEWZZmcUM23TbwKvuuB
         fbHBbMGT/aGyIUIBSjYKT0qRnt7T81ZFYsg0o+6jx85ChFfsWdEXpej8x+uo4+vCJXkt
         BktD2PyxkpfI2csxOg/bvZsmCKTiX8mKskEKjaRzZ19YZS89uWxmjaDaN58/WIvcon1g
         qjMD68BLXC/w7yAiPIOG0xDDoC+wzdes8IsaW91+RKqtr4LUJtAEF4YzvSqIuO2+KE9n
         jKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=v8Sm/CrkNCOf8WZvt3r4LeHBwjg0f4SUSnW55ADVGlU=;
        b=MyNjJ77uQyrFHteYhNqP9PyI4qlggBHOkgStumJqE5Yp0xtGXFhmkP70pYlwZVnloG
         s1r3GmUJpq3tZpka27OrTJGw6zyu5w/lfQNYkuPxkQi+++kvzGsvY1LO8Oe4n2jUU2Vu
         U4AkUhrLY0cLvuPMDI29a2p6VEWHXHt50rFxu7zUjE7ZcO6yVxcVuzh72J4+uO8RBRSy
         Qg17P/33pLrybwTqfbGqP5aKgJE1uCwzC4CIH7dTht8LhBbCE9Fo+ZNBq2JIQBnn3Bg8
         M45VtY75suGMRYWVM3k4fa/I93+zNEYRjxOyvtDRHcEBTnYP3vEEYTI+8ucPcnKP3ypU
         C2Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ViOzthxd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a244c00b006b5be648dc3si12602740qkn.692.2022.08.03.15.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Aug 2022 15:16:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ViOzthxd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJMfD-0001XT-M5
	for alex.bennee@linaro.org; Wed, 03 Aug 2022 18:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oJMeo-0001Ve-Bp
 for qemu-arm@nongnu.org; Wed, 03 Aug 2022 18:16:02 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oJMem-0008Cs-MS
 for qemu-arm@nongnu.org; Wed, 03 Aug 2022 18:16:02 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z22so23128445edd.6
 for <qemu-arm@nongnu.org>; Wed, 03 Aug 2022 15:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=v8Sm/CrkNCOf8WZvt3r4LeHBwjg0f4SUSnW55ADVGlU=;
 b=ViOzthxdaU/3gKC+D51F8JWwVuhQ6y/h3F13FaOSAzstqUmJiY2uMXRZweoSb/LQHM
 1iOKCXNVzvnChvuJPVoZYdEHsalc1Zw3lnXhY9H4pudCi3ldTHBnxRgEoB7oK054mdh3
 MCvj1kn6/jDMcWqlYJnaM7oeU8WlgGp+PsQjAXPe8VrU0mbcu9slPA4dqEgIHLPjguav
 NzmBT6BHE0KO3NJMi/Clq3OwXubRIRcngBf0wN1NFZYcpvNz83pnPSI+tZUjDG52UeTy
 Av5HtKzLALdBgfGkwCWGDVFeMvhwgVlGZPHkuPZZKch9pkxxJouwUakSup3tgzQrqZAv
 NNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=v8Sm/CrkNCOf8WZvt3r4LeHBwjg0f4SUSnW55ADVGlU=;
 b=pZE4JTT2T01JEgAgwESFbRNohu4+PHax/GQxnil1IgJ+gCgZV2cW6K9yEmlSzr4aA7
 9a20j5R8MZfCfW5W6twsfSYjFMSCIo5NQoBNCrhqAeJttLDoEtsYR3HnLY3UFrAONFMT
 /bgIR/bE/D1jaPtciob3ceTWcYnq/Q/saQUu8pRwwHa9gW6ibq1qgSdUj/5g14gBMH5v
 20yzsw9FxcaRjQ5hZq668I9Bme5+CWL5na255Ormf6lP/vfPYSxCPuMXfTr7rvrXqAwE
 BAkHbQHLNTX9W0nwtLm/nwjStC9ULHQTVuODbtzIQchp1ZkpShky42pTPr5Jx9pEVuSG
 cbIw==
X-Gm-Message-State: AJIora+lkcG68C+F33TSVIzyz4Pcybz+QdSEIH4a4CicElqREz9t5jSp
 ieoPT6s7JTyXJaWgRSGfMTvD5jlX25A6LNDWrBF4Eyfj
X-Received: by 2002:a05:6402:5c8:b0:433:545f:a811 with SMTP id
 n8-20020a05640205c800b00433545fa811mr27489597edx.101.1659564958711; Wed, 03
 Aug 2022 15:15:58 -0700 (PDT)
MIME-Version: 1.0
From: Jon Alduan <jon.alduan@gmail.com>
Date: Thu, 4 Aug 2022 00:15:47 +0200
Message-ID: <CAL7npF8ZPDC+HOoJd=ssDT++KVbGyXV6bZUmri1anz08tfdWMA@mail.gmail.com>
Subject: [qemu-arm-static] [Known-issue] readdir() returns NULL
 (errno=EOVERFLOW) for 32-bit user-static qemu on 64-bit host
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d88b1105e55d93eb"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=jon.alduan@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: z4ieyDUAdM0M

--000000000000d88b1105e55d93eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello qemu-arm community,

I did not set up this email with usual format and contents, as this is a
known issue.
See Bug #1805913 =E2=80=9Creaddir() returns NULL (errno=3DEOVERFLOW) for 32=
-bi...=E2=80=9D :
Bugs : QEMU (launchpad.net)
<https://bugs.launchpad.net/qemu/+bug/1805913?fbclid=3DIwAR2IHfR7I3o-yoV-xI=
46iM1ZnSC5ZlNGUaXFwDdcYW-vg0qcN5wIXPTGmAI>
I have currently this issue as I am using libc2.28. If I take specially for
that, libc2.27, as explained within the link, the issue disappears.
However, I would like to avoid this effort because of maintenance problems.
I was not able to find a solution to this problem and I see, it is still
reproducible on latest QEMU versions (7.0.50).
In the link's thread a Kernel adaptation could fix it, but I saw nothing
valuable there.
Do you know how to fix or at least workaround it with QEMU or with Kernel?
Is there any news on that topic?

Thank you all in advance.
Best regards

--000000000000d88b1105e55d93eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"ltr"><div>Hello qemu-arm community,</div><div=
><br></div><div>I did not set up this email with usual format and contents,=
 as this is a known issue.</div><div>See=20

<a href=3D"https://bugs.launchpad.net/qemu/+bug/1805913?fbclid=3DIwAR2IHfR7=
I3o-yoV-xI46iM1ZnSC5ZlNGUaXFwDdcYW-vg0qcN5wIXPTGmAI" target=3D"_blank" rel=
=3D"noreferrer">Bug #1805913 =E2=80=9Creaddir() returns NULL (errno=3DEOVER=
FLOW) for 32-bi...=E2=80=9D : Bugs : QEMU (launchpad.net)</a> <br></div><di=
v>I have currently this issue as I am using libc2.28. If I take specially f=
or that, libc2.27, as explained within the link, the issue disappears.</div=
><div>However, I would like to avoid this effort because of maintenance pro=
blems.</div><div>I was not able to find a solution to this problem and I se=
e, it is still reproducible on latest QEMU versions (7.0.50).</div><div>In =
the link&#39;s thread a Kernel adaptation could fix it, but I saw nothing v=
aluable there.</div><div>Do you know how to fix or at least workaround it w=
ith QEMU or with Kernel?</div><div>Is there any news on that topic?</div><d=
iv dir=3D"auto"><br></div><div>Thank you all in advance.</div><div>Best reg=
ards</div></div></div>

--000000000000d88b1105e55d93eb--
