Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4042037wru;
        Mon, 30 Jul 2018 10:46:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeieq1qdw0qhsqsFPl1++PCJP0KpFi70yRCcI5/9ikyjF3VBEWUS+d6SMZoecsvzSYYnOhG
X-Received: by 2002:a37:18c4:: with SMTP id 65-v6mr16467444qky.415.1532972775600;
        Mon, 30 Jul 2018 10:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532972775; cv=none;
        d=google.com; s=arc-20160816;
        b=jCaDwPNPVfS9KomieAC9S8Io7OryNwukRRSNRbpKxR5ZaMDHrumikISoVw/dWLWlIF
         HEwATkHCST8bXHz9uwtfpgRGWBjxEncN2LS/b6VQB/m0Kvlvz/oL2R+88rw1ous3nLub
         jJ3p/0MTiUT2uhtfW02gCRlW1F6VcU8/DKdLk94LgbXi1zw/M25UXiucttFd+1Ha/V2u
         ZdKoDKTUzeYIPF2CEHvQ5J4wuin6aTccaHIbGpLqTKDcila97oFhvfovbrDWZOgkaxAO
         H8LATFkGbE5zxu9U/KuHODR2LkXXv5ICLqFgZB8mzpBZlCz9aAJDCvtjnllqMByFbO8e
         SfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cuGvdaU0egAKBzu0UGDo00gKWSjpt70DrHChAmEGkHY=;
        b=quqg/zWfDyUPLLKrJTCa00Xyvswt//mYkX3ixe5ML/Bx5QH0vyGDLmMvN3WqAc4bn3
         TkUiPgvXwiTXqmlw4sCRLdLNPi88DNx74x9rJLjLTlYf3yZEHDcG4sqrP6SGOXO4PnoZ
         kWJMwK2tDlxCLwouzQlfiK6gjoW3nxmQ6pWI1o2sHz/SdFIwwYt1hilO1M1YAiDKm5to
         WylJjXm0sNSGukhYuLFl5cun2L2Ri6LYC4SGfsA338ODNphAC4iFyo6q11UzRbTcjMXU
         ZQKEN+A2y2iv8Rj1omXS6ERHDHC/HeJIYyv0x7Z0KlzepAmqYrd1F7CsTgnP+kFcBGEL
         AHpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZqCbIM0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y196-v6si9261388qky.244.2018.07.30.10.46.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 10:46:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZqCbIM0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkCFL-0002d6-4b
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 13:46:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkC0C-00084U-5U
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkC0B-0005or-Fo
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:30:36 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35475)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkC0B-0005oU-Af
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:30:35 -0400
Received: by mail-oi0-x242.google.com with SMTP id i12-v6so22780114oik.2
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cuGvdaU0egAKBzu0UGDo00gKWSjpt70DrHChAmEGkHY=;
	b=ZqCbIM0Squ7cglsQWvQW7RvHvpWP1Vvl08yHsaqliZeoFkSsUy6rztIvwL14B6G//W
	gtKf+k2X1J//RO+czxR5KfsVsbyDNDotKlHQUHvSYCyL/oSQZe8WBpO6+aErbgHyPZla
	4dNE+Z7EUqWbORZad115Ovnld4eigU8e+vPUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cuGvdaU0egAKBzu0UGDo00gKWSjpt70DrHChAmEGkHY=;
	b=ikbIlT9exbA9p3Wji6oVZiJSIsP+gYM1aUjFZh1eW6i3o1quL2NP6voZVVA8bbHerJ
	DSG+A9rLA2fXh+ul1ZqR6PlEETPMtPmclbFlPnAl9fRPIZ20sTgpltcUtrh7gZFARA92
	riSA55dUN11hBcBXHOavvPZ+J/Swbbt1WvardfQWsg0eYDQTpFWHMfHMTia3EnoZxViA
	/ELSh4ZjK3btzV9+SX4mmkY6c0SboZAFDtnC88Gv60GXY82LazFxeJG9JjZiEKtr8A0n
	lu0XXgxgucgbG+cgXXKvnnRSkhX1U9k+hepREhFmAoP+KQ0rpX4LarFnKoF7z1mF046q
	dJBQ==
X-Gm-Message-State: AOUpUlFqyG5glcPqkh2oLOYD40utQhnRKJIJTAA6HKpCdDCny0f17pq9
	V+PH2nTcdj0tbSYkArG2W2zp6wvk5Qar8zwDCQCP+A==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr17684888oib.337.1532971834688; 
	Mon, 30 Jul 2018 10:30:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 10:30:14
	-0700 (PDT)
In-Reply-To: <20180725085944.11856-2-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 18:30:14 +0100
Message-ID: <CAFEAcA9M=yy=Cu5pgcVkeBsS_pRmW9dKEV==t2Jd67d2k6gp7g@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v3 1/7] hw/arm: rename armv7m_load_kernel()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: edJZKKsjkRx1

On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> ARMv6-M and ARMv8-M need the same kernel loading functionality as
> ARMv7-M.  Rename armv7m_load_kernel() to arm_m_profile_load_kernel() so
> it's clear that this function isn't specific to ARMv7-M.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/arm/Makefile.objs            |  1 +
>  include/hw/arm/arm.h            | 11 +++--
>  hw/arm/arm-m-profile.c          | 81 +++++++++++++++++++++++++++++++++
>  hw/arm/armv7m.c                 | 60 ------------------------
>  hw/arm/mps2-tz.c                |  3 +-
>  hw/arm/mps2.c                   |  4 +-
>  hw/arm/msf2-som.c               |  4 +-
>  hw/arm/netduino2.c              |  4 +-
>  hw/arm/stellaris.c              |  3 +-
>  default-configs/arm-softmmu.mak |  1 +
>  10 files changed, 99 insertions(+), 73 deletions(-)
>  create mode 100644 hw/arm/arm-m-profile.c

Another rename that shows up in the patch as "delete the old
one and have a copy somewhere else". Maybe this can be fixed
with suitable git rename-detection options?

thanks
-- PMM
