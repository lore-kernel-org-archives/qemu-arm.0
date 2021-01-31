Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2712042lfo;
        Sun, 31 Jan 2021 07:14:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbV2zu3/GqdJSiVO6jGvJNd1m5288rrqZmlVcroCTbRHOM8vBZhrTDoV2QxymrstEGg1NG
X-Received: by 2002:a25:cdc6:: with SMTP id d189mr22861683ybf.13.1612106068830;
        Sun, 31 Jan 2021 07:14:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612106068; cv=none;
        d=google.com; s=arc-20160816;
        b=UMrO3BmrafQFAkrYXqcN6E4GM6b/U6Hy4ZwZ7R8dVepBMy+KHMsv0l2FBYm33NjCtl
         I4qKZx2pJ4xP4hePbEYLs8X/18N47UJr8sWc69KSqYNNpZSHhr1V1F110L7IwNswASo/
         tISOFZMEvmLffpsXH+iZMmV0d7lsoLVcBZHhpJ2D1nuvOykTsAlLgsGFu087h3tGSUbX
         0GslB2X8JmZPsOQNhc3TBPZLWvAO0lna5CoX1FEbOAnKoe8qknHfskwdVOPz8pU/PZ46
         Kp34c1nrFSzMa9P6a6bIlSmx+OmZ/CLu/Ph0oO8K2fuEIDOzmaJniyFni2hVwzc3rULS
         AWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Tau/sJuxIvYCq+2aNAnlvFVViJN2yuLitklopPIVzDY=;
        b=Td1Vhi9sNsYaC2I1SIfYRHnmvONvKP11Zt4/a1WDZOZaohQ6if5t0NwLvL24mQ9mUY
         b3URQ7TNIHlgqwdSQNnWmUJnq8b7iIzSN1UuJeWEVuYxLzZiGIqIbnWrGzY1rLJOZotr
         1xiGQ8ExBTkGv+rtl/aZsuOH01zUT0u3OYzvqsMBAhGmfNE4fdsDmkf0/J/ff7lKtb79
         5ou6VUO5BYls1sN6MxEsAlfOR8usLJmGqNz57shVTtry5Q8bT6kz0Cu3g9nPOnZBSTaj
         mZcQG4YW9nN2aGRw3s1Ol/nQP/lG7nWODMMRyFiBJKuJYv4mTs8V3sl9Jkx1KdjOvT9t
         Qyew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="TtWZB8/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p197si15646148ybc.155.2021.01.31.07.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 07:14:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="TtWZB8/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6EQm-0002f6-6w
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 10:14:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EQb-0002cd-IF; Sun, 31 Jan 2021 10:14:17 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EQZ-0006iF-Kt; Sun, 31 Jan 2021 10:14:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c12so13855013wrc.7;
 Sun, 31 Jan 2021 07:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tau/sJuxIvYCq+2aNAnlvFVViJN2yuLitklopPIVzDY=;
 b=TtWZB8/t2fGCTKPS9HwAzJglAjEs3XhKNgQ10V6CGv/IVr2o4NQWZSxN4e/9qWsQr/
 s7c+vSi0yTUrpWbYHyA6LuZ82fgKj4MzZZIDqP15vj7/2W6qSEcrMUI6CpomFOYcBCZP
 4ZD/V0TegzVx382HwYrfnONiumFDbruq3vHNLUd2rommJNCsfmM9bDonINn2UsllBbjJ
 hp2vrE34cF1ZnDFgRQAlXNlStJRO1RYlH8MaDzKQUY46qEDK+nQJHtR8Ym/jcA1Tr+xx
 BnUwm2+p6gqip7L0BJLPHJk7zvgfDbHIr+Uqr19agZdfydwDpGjESuvORj4VxqcKWNNh
 jW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Tau/sJuxIvYCq+2aNAnlvFVViJN2yuLitklopPIVzDY=;
 b=AgHb7sufZma/iV3h7qw53Km5hb6efz+ThTVFZQNGftlnVkpL5YcGJ+j6A1M/gCj+m3
 DrXn/VW/xsmhQsSOQGrhPW2OEg6fm7P4pxcfmHHBx+U0p3U85S1Qiktwou15eqhc7c4N
 MXIfrcUNBx/TZKAotrL/m1bCxkeogpB6hAMo2y7NDejubQpkteM6BV0sGJ7Yne6QO8Yp
 EElmu4V3QhiZ1c7vam/9+UWc9M7RA9ZU3lc9dJq1rVOyRerrG3ku0feeHlLsEKp9Q62I
 DpWkTeFqqnr6m0zdNCY2EdYJxls/mK4VG22U5hv3rCXgjRS7AzZ3KVNqazg6d5CKsWk8
 l2RQ==
X-Gm-Message-State: AOAM532rd9IdtyIGLIWVrc1pCPsEwPUwGbe2BYYht6dKSt1IE0q+H6uj
 qIHZaLAENB44vG9W0AwfIeGxfeqNl2s=
X-Received: by 2002:a05:6000:1372:: with SMTP id
 q18mr13720695wrz.280.1612106052749; 
 Sun, 31 Jan 2021 07:14:12 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id t205sm18622237wmt.28.2021.01.31.07.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 07:14:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to TCG
Date: Sun, 31 Jan 2021 16:14:08 +0100
Message-Id: <20210131151410.318649-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xaDuGdzq3LXX

Peter mentioned [*] KVM only support ARMv8 targets. Restrict the=0D
non-ARMv8 machines to TCG.=0D
=0D
While this is still not enough to boot a raspi3 image using KVM:=0D
=0D
  $ qemu-system-aarch64 -M raspi3b -enable-kvm ...=0D
  qemu-system-aarch64: ../../softmmu/physmem.c:745: cpu_address_space_init:=
 A=3D=0D
ssertion `asidx =3D3D=3D3D 0 || !kvm_enabled()' failed.=0D
  Aborted (core dumped)=0D
=0D
This increases the odds to have a KVM-only build pass qtests.=0D
=0D
[*]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg777669.html=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  hw/arm/raspi: Trivial code movement=0D
  hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to TCG=0D
=0D
 hw/arm/bcm2836.c | 38 +++++++++++++++++++++++---------------=0D
 hw/arm/raspi.c   | 22 ++++++++++++++--------=0D
 2 files changed, 37 insertions(+), 23 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D
