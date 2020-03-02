Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2434568lfg;
        Mon, 2 Mar 2020 05:22:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxufjFxTPQ5pIF6HRg7t23FQp7JGIWlIZBQbPlqs+tFBg5rnPKlM1QSK6njw8qGh9xM7Xjy
X-Received: by 2002:ae9:e40e:: with SMTP id q14mr15646421qkc.419.1583155341358;
        Mon, 02 Mar 2020 05:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583155341; cv=none;
        d=google.com; s=arc-20160816;
        b=kccDMoKVSEyc/2R46ApdMwQjCCG3jKGYYJEi59l14ChlUKhekTUJ4svduGFzDE0nsT
         TlkWyiRfkEgcg7F/4XfbLqXdzr1Dlp+iRBThJH5QCwyxkR9XRgMHBHNkqAqaa5UXlqSu
         f/PNeTsFOdwDodzC5Z1ercV+pEo93kN7AuBBhPcGc2xxn+TAQkjPKazz8fzfzmRecpAU
         0EttnM7PyazX4cCNyZIOPtRaAdjzY96mtY/CvynC6S5A1TaU/qmlr4KFRBo7xtD/2pps
         D1rQagYDYB6he2fW1KAmHEflZhSV6aYB6mCIsmVJvk/HWIXLfcKecdDvoC6INDfb8vkl
         +sDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2XcAUaTOQNOWzMmbgQ3MBenvHZtifL5/JzGKBHBsYTk=;
        b=ElR969IeOlQauK9QxUqh2/fi+VYZRs1ym1ebuXQJcNCS5p3ZtYI2N6nERTNXHAbfEX
         dQpAaaYSDgOcFF3zssshyiu1keRVfo1aaSxdB1+KvTHwdyEBvRMUuxeS6i65sHpD8HiL
         6v063cJUQmBmnq/y8+mAYQMN+Ig/lQ0EbPV6To/aPKqTo00lpuPQJv9pO7kxACQmXpdD
         55UDiiFjkVHWBNoJBDAm2LVSYRI8McNia181UQWAyBptBDqJibrE0LsZImHc4Sthx0/b
         59oTNwHFGo0RIOLJ3U5NPpdRzsKaiLLm2sSbXfFEjyu9gsidS47UVNnMSiqr/ROMIXj5
         Zrdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xxNHkC8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si5648955qth.127.2020.03.02.05.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 05:22:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xxNHkC8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8l1Y-0007IS-QX
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 08:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8l1Q-0007G5-9i
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 08:22:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8l1P-0007DG-7R
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 08:22:12 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34119)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8l1P-0007Cs-2r
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 08:22:11 -0500
Received: by mail-oi1-x242.google.com with SMTP id g6so8523766oiy.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 05:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2XcAUaTOQNOWzMmbgQ3MBenvHZtifL5/JzGKBHBsYTk=;
 b=xxNHkC8TEOna7j9xp1yD9C3Ikkbj8NfNJ4aBc0IY6lan0O0XYaEthXTOt2r3HhuyNP
 W246zcfou9Jm1XHwIKGoBtVXC+w5j/ERPSRmT8w3fBSH9/UPT8LUv+S7gJF5drR6FS6p
 8EkvOV5Qik4FUNCHE1XKiIf6puGNk+PeAzTpZzwMrWZtiTujEg/5shYEhNqgxkKyLPNa
 3z6q6f1tKaKPE++vtMNEIafae5Ni02UsTOwaAbSemJs7To6PPMBXTdDzxkQCYDjIJLYC
 eUpgXHiamnlL4auc8rIk6Otm4GefWeyRcs0panyNQT1hHmnvqL2C+9Sex0cWoaHSJZky
 EliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2XcAUaTOQNOWzMmbgQ3MBenvHZtifL5/JzGKBHBsYTk=;
 b=WoXZj9/xso9L+R9wONd6eMJddbHCJd3ak7Hp74ajHo+uHQpI0F56IsLC4n9aQfkS87
 P4txxvN+Q57LJ0746vK62d1D6N5nYSvmUXZPFpvrOAWhok5ZbNYKS8g+TrQUW0VV5Uj2
 8yCWlCmmE/P42zVnYoxW2lxJFKMpHkPzFMNdBjK3dHJwnGn4Bl3a1SxQA7g4lFt5mrZ0
 E5VFLE0FqhPSwFas9kzG9spGqNRpza4IbiPNl2o5FDj0RnqhB/6/1h6ALM//CK4goYR/
 a9H4ZggHOTAfIr8YQTm6BMZGEQOq2liNoFLkt28I0ICXARM0B9LpUs4xQoX1gmpdI+Nc
 LDtg==
X-Gm-Message-State: APjAAAX2dvMruBENspISKYWQ5cJadVTxnOcjcUNKc8vOA2buATXjJfWQ
 Y2T1tVTSl0TS3HHXdJH7dkSb/846BwLh+ZaXYF5EZA==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr11569695oid.98.1583155330305; 
 Mon, 02 Mar 2020 05:22:10 -0800 (PST)
MIME-Version: 1.0
References: <20200227025055.14341-1-pannengyuan@huawei.com>
In-Reply-To: <20200227025055.14341-1-pannengyuan@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 13:21:58 +0000
Message-ID: <CAFEAcA9stgfbRGdn0x2q38vVS9NDyysW656+XkjfyVui3OXXQw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] delay timer_new from init to realize to fix
 memleaks.
To: Pan Nengyuan <pannengyuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Euler Robot <euler.robot@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rZLsx2acWMl/

On Thu, 27 Feb 2020 at 02:35, Pan Nengyuan <pannengyuan@huawei.com> wrote:
>
> This series delay timer_new from init into realize to avoid memleaks when=
 we call 'device_list_properties'.
> And do timer_free only in s390x_cpu_finalize because it's hotplugable. Ho=
wever, It's not valid in mos6522
> if we move timer_new from init to realize, because it's never called at a=
ll. So we also add calls to mos6522_realize()
> in mac_via_realize to make this move to be valid.
>
> v1:
>    - Delay timer_new() from init() to realize() to fix memleaks.
> v2:
>    - Similarly to other cleanups, move timer_new into realize in target/s=
390x/cpu.c (Suggested by Philippe Mathieu-Daud=C3=A9).
>    - Send these two patches as a series instead of send each as a single =
patch but with wrong subject in v1.
> v3:
>    - It's not valid in mos6522 if we move timer_new from init to realize,=
 because it's never called at all.
>      Thus, we remove null check in reset, and add calls to mos6522_realiz=
e() in mac_via_realize to make this move to be valid.
>    - split patch by device to make it more clear.

Hi; I've applied patches 2, 3, 4 and 6 to target-arm.next,
since I think those ones are OK and they're all arm related.

You've already got review comment for patch 1 (s390)
and 5 (m68k mac_via/mos6522).

thanks
-- PMM
