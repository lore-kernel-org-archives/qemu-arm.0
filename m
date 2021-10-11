Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp366719lfc;
        Sun, 10 Oct 2021 21:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnYkKjes89iz1C0h2cHbBUK7rF7lZDMNwXit4wBXaOzAM2y6e5vrW1HvbQ/YUSvn3HufKw
X-Received: by 2002:a05:6e02:17c8:: with SMTP id z8mr17895516ilu.161.1633926433080;
        Sun, 10 Oct 2021 21:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633926433; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAM39ivBlafypLmHs3OCg5od4mkPDvH6qvDKZMy/AC90a+PFbT8jFqpuIRdIfOb8Rh
         qAB2B8O2TyrmQxnwYMh/2xctE3P2YDjsMSfETkSkvG0riwLJgbKoa/0LyIS1eDfOSVNs
         l7MAgTRu93pnw/2jeYZrooDtp1+GUxNuQCddHCFmqJySW6fnFgfGGBB+AbR4NHcCh/Tq
         w3Q68aDgjv7ROFac4BvkeOsWIoZ14P2fX4BKk5QVzzemOPm+tOQnCOLh8FrdQ3Uzr+dF
         9R2dqwcqqOSrQWqyNnmoJ8UOpfz7rs0AsHTtGPClR1SA9n9do+BWT9VvbM8LZYt2MCbW
         kN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=oNmOg4sGeWjFGv+5zDYPizo7TmeEMMQmbTOi5NfWolU=;
        b=H2ujVUa9Xw5JKV4xUgtll7g6HwWW8KNxUKhv1o16V7jMfwR0WYcE5E9ZVCoVR2GJeH
         hHjEmEb+QxgdL+dUCP3JpwDJZ2Yf1MAmLOJRyg7R6xvTLmbbfvoT9fA34W0wfRkB+7kd
         Fa2hbUPDcpxtMvMXuhtGTVcHR/ku/OOpLIF7YoHJKU+8jyJaYAeVKAvVpsV+6OOhaada
         c+Ziv9CJc/imPYw/knRlFWBXW+gI9L7PxkfHBatboBLdTTTKI3O+jnRIg0geMgR2WOuo
         DnbsELp63tATeggFR+i7NtV88WcKqZ5ktNtEeM5RnEPZ5G1ywrUEOPuLWrtFsMAakro8
         23vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pzOp7Igv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si8987048ilv.29.2021.10.10.21.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Oct 2021 21:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pzOp7Igv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mZmu8-00008Q-Gh
	for alex.bennee@linaro.org; Mon, 11 Oct 2021 00:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irakatz51@gmail.com>)
 id 1mZmu0-000082-Ln
 for qemu-arm@nongnu.org; Mon, 11 Oct 2021 00:27:04 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <irakatz51@gmail.com>)
 id 1mZmtz-000128-0X
 for qemu-arm@nongnu.org; Mon, 11 Oct 2021 00:27:04 -0400
Received: by mail-lf1-x131.google.com with SMTP id u18so67986362lfd.12
 for <qemu-arm@nongnu.org>; Sun, 10 Oct 2021 21:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=oNmOg4sGeWjFGv+5zDYPizo7TmeEMMQmbTOi5NfWolU=;
 b=pzOp7Igv4pV501X9Jn6ZtbbAgJMpXUf6RwI1KQ87DccCyfRy1T2I4BPGsfI9YGhdTG
 p5UgTuhJSle4i2iQngyMOATfUgHJMqs2mb9KJaIuQSy8FXTkOwt82o2Gc7m7KHn36B9l
 4+CD9+F8wYhZJBH+LcTMaLLv04fZWVfduKhSqf1RrBcvuVfDtEtFtCfd957TYSSogp7F
 CYCnkRAfcVQR0rwxnrLbKrsI+5+lI5tJko4dExuW90yBgztULO0vSL+DG7UvaPBIXfPh
 kHW7NUezkVCYPV9T2fUZNyCwiV4aQvH0jM1gJ5YxmL2CboBEdc1WPW7cYVSv+sely3GD
 sKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oNmOg4sGeWjFGv+5zDYPizo7TmeEMMQmbTOi5NfWolU=;
 b=K4UpWbi4Gp14x0o5B8jsoreFb9awF161a8yY5FsXexyibkBcWUZp9UNlf35e01lAOq
 ypveOMcacK2CG+k0n3rbX9Qtnp3giIBEBogid6OWbkFerUxkA0JIpVIt53nU1Y59X3rG
 eg+MmP3hZfsrX89fGma+DBOPF+JPWB5jcbDkDfCB1m8/cf0CkT91z76+fqzq1xDqiA7C
 l6AI0HAGz4yQwScPe+cw5zDtQBHKpAnNlouhVI8ujn7OF397yHMc/ZRJMm6jcghpEQRS
 5J1sImOi0OzmwimsE8SNTe6xWE534kEYM93dMh7i8dMhd6UGMzr1V4Fi2KFwDFuJAv0p
 ASKw==
X-Gm-Message-State: AOAM5311GWPBJea0UL5+CqivNrWiN8WzqCX84b8wFp2YFOltNOkkbboj
 tFczFjRMf4imdJwfMgLvbZNCVC5XjCMawysyjirq+cS2CWo=
X-Received: by 2002:a05:651c:38c:: with SMTP id
 e12mr20182335ljp.292.1633926419972; 
 Sun, 10 Oct 2021 21:26:59 -0700 (PDT)
MIME-Version: 1.0
From: Chenxu Wang <irakatz51@gmail.com>
Date: Mon, 11 Oct 2021 12:26:49 +0800
Message-ID: <CAFLP=uBqHJdUva0TBzt08+1Z0Ydd0ovd9W29sBfnLZbieKJLZQ@mail.gmail.com>
Subject: How to run multiple VMs on ARM FVP?
To: qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000da05b205ce0c230c"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=irakatz51@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w4ReA5xmQI9s

--000000000000da05b205ce0c230c
Content-Type: text/plain; charset="UTF-8"

Hi all,

I want to run multiple VMs on ARM FVP with QEMU 2.9. Currently, I can only
run 1 VM (no filesystem) with the following commands.

./qemu-system-aarch64 -nographic -kernel Image -initrd ramdisk.img -m 512
-machine virt,accel=kvm -cpu host -append "console=ttyAMA0 init=/linuxrc
root=/dev/ram0 rw rootfstype=ext4"

Then it boots the VM in the current console (ttyAMA0).

Now I want to run at least 2 VMs with QEMU. Specifically, I wish they can
boot in two different consoles, so I can type to insmod some modules on
them.

How to do it?

Sincerely,
Wang Chenxu

--000000000000da05b205ce0c230c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I want to run multiple VMs on A=
RM FVP with QEMU 2.9. Currently, I can only run 1 VM (no filesystem) with t=
he following commands.</div><div><br></div><div>./qemu-system-aarch64 -nogr=
aphic -kernel Image -initrd ramdisk.img -m 512 -machine virt,accel=3Dkvm -c=
pu host -append &quot;console=3DttyAMA0 init=3D/linuxrc root=3D/dev/ram0 rw=
 rootfstype=3Dext4&quot;</div><div><br></div><div>Then it boots the VM in t=
he current console (ttyAMA0).</div><div><br></div><div>Now I want to run at=
 least 2 VMs with QEMU. Specifically, I wish they can boot in two different=
 consoles, so I can type to insmod some modules on them.</div><div><br></di=
v><div>How to do it?</div><div><br></div><div>Sincerely,</div><div>Wang Che=
nxu</div></div>

--000000000000da05b205ce0c230c--
