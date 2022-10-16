Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1973693ejn;
        Sun, 16 Oct 2022 15:24:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49BxTOoLTSBZ/FCm41BV3by2I5a9MWD2MxQkwjcoFvaIwprGZN1Oh2Gmkheiem18/aG0Tf
X-Received: by 2002:a0c:f4c9:0:b0:4b1:b290:a4d with SMTP id o9-20020a0cf4c9000000b004b1b2900a4dmr6472449qvm.68.1665959083581;
        Sun, 16 Oct 2022 15:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665959083; cv=none;
        d=google.com; s=arc-20160816;
        b=S5Ml0UsvuUeGrdoZ+ac10Fan8LqK9WPOSwrdT+Coc031ddX5U+1TXhWq948A7+cALH
         ZAL+pHvHl8AY/NyGS3ZUNLEKvNdcFbnp1/qJy1zDO8Z/AbD6Oub11hJRZBaXJ1Uo7hnG
         OLzYiiZsyShn3gsJ3wGvMgsfiXVTHRb/MYY4FbyB/UfkrAwbSquNYYYDgSYFJ0sGHlLs
         1H/SWTbEnwPy+9M4O74TgUOkDB8WKEDsixVVVEwYlw7Ohgyv6FlNE5MlGtio4pUyrvb8
         TZIQ0n2h4It4FE5bHBinkZO9cNsIDN3MIgt1lJKevgHwu2mH2mE6HtFcDuCisHPO/uaj
         78oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=yvpxFPaUj+ZXAWVXJQXvOWuj7sn5Js9Ipp78z4V9Grk=;
        b=CgI9uM5oGpdidgmI1kQQl99D4JQSlih8ROGrZrFdLjU+htrvR5Twx/LMBEI6KcHoEe
         TAGhvz96dVL3wB1BOp/pqtqauNf6mA4V3dFU52+VwV1uW9SDcOrGrrKVDk4ID6O1kV2z
         EJwEZcEuWwKIN5OLyruZlOvP4vDxiSiNSsH/sBjMNuUwQ+Cy6tKTZ77wNiVflH4hSgRo
         nRqVh+cdvgEIDoKYEfFEOz7atcgT1+qWdfxGQtn0tTa7jsV0yPdxM6LOUb7gjqCXd6n3
         JFfOrFwudhoY//zvEQJIsntVFw+uWBpNeel6bzgjvJQMpVphUhd8GwbS4m26n9NWLaoi
         kX+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="YKi/2NIB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq15-20020ad45fcf000000b004aa5e02f027si5129607qvb.155.2022.10.16.15.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 15:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="YKi/2NIB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okC3n-000608-0P
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 18:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paxi.three@gmail.com>)
 id 1okC2y-0005vX-Rz
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:23:53 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:43688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paxi.three@gmail.com>)
 id 1okC2s-0000tn-Nf
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:23:49 -0400
Received: by mail-il1-x129.google.com with SMTP id q11so5033711ilj.10
 for <qemu-arm@nongnu.org>; Sun, 16 Oct 2022 15:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yvpxFPaUj+ZXAWVXJQXvOWuj7sn5Js9Ipp78z4V9Grk=;
 b=YKi/2NIBT5cLxlENUY6VxOo2+FyfQmrME2jCPNd4yAuCBO6icPMA8ppFqFDACVTX1a
 IcwjOCXwA5fgJ0JvL6HoUa6L76ZEBxzxMWfaCveXnqbZmnXUPLHSFsiFHX/9B1ZXm8Bs
 lFeoKrL2Qrv7w5b3f2E2BLO2mT2cPCcCpFk32idThh7u1zQVxYxEJ+b8xu20/OXN7qT9
 b56oxM2XhMDVDyy3l/Cee/zNvGZ2z6hpWY0I222FgRLUw3jbaCjBfqZyMgjqqfCDuSIF
 aDgLBKFCAPU3BgZqWV3iqdNz9YcAsZxNNzFjBbNJ0oo8PteB134aL0BaYR7V7R5cdS2M
 vLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yvpxFPaUj+ZXAWVXJQXvOWuj7sn5Js9Ipp78z4V9Grk=;
 b=cCarnSYFFNoGt2IuYWGMtiDYKntljbNnxB4qXLXnbHgki18Qf/xlYoW3qsrc+DEt3b
 tOYEEiO/HN6othbM07zU3oVIzTTEtkUX/yvuiYMoaV2XAZQpkUvmy2IXuVfIfEPOp2PH
 hzgo3rq3SCyXMvWSNMv6u9Sec6r3VZvqq2laBi7aQ14YpvKCXV2bAZC50sxXqL9Fco3y
 YnR6k9inBQ2OPD3vNqlPV/O71oKIVRla3nLCY6yX2Av+bF/+vaVKRk6aWO2BcmkQGDZy
 9ee8LVvFvnFtF+5goeJ+XkVzr5old/ELgtMDK0R0icRCH53HS5euYFDgMihV3+FLVhHv
 KUxg==
X-Gm-Message-State: ACrzQf2gH1CqL0wV2HX3iUinwncQfmmDYndOAJaSk9PcoHprZng4Emrv
 kuciuEM0lU1ntXuTZJaRa4uFFiB+eLaLpSnxZpYGVrXw
X-Received: by 2002:a05:6e02:156a:b0:2fc:4266:f56 with SMTP id
 k10-20020a056e02156a00b002fc42660f56mr3574309ilu.140.1665959024947; Sun, 16
 Oct 2022 15:23:44 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?4K6k4K6+4K6a4K+GIOCvqQ==?= <paxi.three@gmail.com>
Date: Mon, 17 Oct 2022 03:53:33 +0530
Message-ID: <CAChpoR45q6huduz7J7jrOrJz3gqHYT+jr1j=QKnfmPbj=wd_pg@mail.gmail.com>
Subject: Running server from within qemu
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e4786b05eb2e4f68"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=paxi.three@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: U9K3oHcgCk3X

--000000000000e4786b05eb2e4f68
Content-Type: text/plain; charset="UTF-8"

Hi,

I am new to using QEMU.  Is it possible to host a simple http/tcp server on
a Linux which is running on qemu, without any accompanying vm (KVM), and
hit that http server from the host OS (say Windows)? What options should I
choose in army (command line args) to run any TCP based server from within
qemu?

As of now I use the following to start my OpenWRT Linux on QEMU:
$ qemu-sysyem-arm -M vert-2.9 -kernel openwrt-22.03.1-armvirt-32-zImage
-no-reboot -nographic -drive
file=openwrt-32-rootfs-ext4.img,if=virtio,format=raw -append
"root=/dev/vda" -m 1G -nic user -nic user

Thankyou

--000000000000e4786b05eb2e4f68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I am new to using QEMU.=C2=A0 Is it possible to host a simp=
le http/tcp server on a Linux which is running on qemu, without any accompa=
nying vm (KVM), and hit that http server from the host OS (say Windows)? Wh=
at options should I choose in army (command line args) to run any TCP based=
 server from within qemu?</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">As of now I use the following to start my OpenWRT Linux on QEMU:</div><di=
v dir=3D"auto">$ qemu-sysyem-arm -M vert-2.9 -kernel openwrt-22.03.1-armvir=
t-32-zImage -no-reboot -nographic -drive file=3Dopenwrt-32-rootfs-ext4.img,=
if=3Dvirtio,format=3Draw -append &quot;root=3D/dev/vda&quot; -m 1G -nic use=
r -nic user</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thankyou</di=
v></div>

--000000000000e4786b05eb2e4f68--
