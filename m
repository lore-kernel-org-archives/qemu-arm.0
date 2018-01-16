Received: by 10.28.173.206 with SMTP id w197csp4107816wme;
        Tue, 16 Jan 2018 07:54:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBou1WfWZ1DfiFk/aK4jeAeo3nmP+TciFDR8NXl4dj85cC4A2xT94VpQzDhnkPeIxcoMLrfzJ
X-Received: by 10.37.209.18 with SMTP id i18mr323119ybg.337.1516118098271;
        Tue, 16 Jan 2018 07:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516118098; cv=none;
        d=google.com; s=arc-20160816;
        b=K6GDk4tkSguzRHZZH5wjbaQlkNLTkBSBTDxj6mRvm4S0TS4lq7BnoDBkrHHbURbtbY
         Rvj561qp+sa3Juf1eaPd/DLxl4pZD2r4c9Mp3HtbYgwGcprmaqf+vBRPzYPRHOF2xfnD
         8gfBUbvV+yTn0hdTV6l7rL24Ti2is6z/2ZmIsgF/kQ0Q0WPG7d+KC/GdnEKYsS3izXEp
         M+ANWai+4LouS+nPTG+YZOvi7/B1jveIHWHHVDxkIuluFqmIfjqvYcJwpfsoE9AMCmpp
         QmMqtEENakz8edBPsLIsgJm4/P4+hATXr5z4x8ZwuYEY5U+qgoola3iZE73QDb8D/+3V
         +dYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Lu+dUf9lB9s7qHbFC99TermPWCY/k4UtyPtgcAjuDOY=;
        b=p1fyb4EF/wJj8zoext4sTE44KXrKvWS73BsvZmFt4Ki0WBO1Y5pHFa+JPpz7zfS2kD
         HngqTysyArBlBH1iiD11nyAPwfzYCSWiOxYOCJw5D8g0NGZSaZmk9YHV1VLW7N0tKD/E
         cRrvaRPKukb4pV0MBe3G+PflrPuKYhNBx5pSJ7p4HMeQ+8qTkRThvYiBPxQ3/hddN6nj
         rozWVqgFnKBSkNVHQ/vvEXmX228Htn3g1O90AApwzNpQKrYjOy6gUW+bo3ruuXS5+/yu
         2ETH+NuvmfhJBF47Hh73TWxFKM73zxoeYcClA2qxN8vLoA065gU2+ZPa3aXWHZ8nhfCZ
         fN1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JEdB+WSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 206si550163ywa.316.2018.01.16.07.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JEdB+WSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTZh-00054j-Kf
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:54:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebScJ-000760-KY
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:53:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebScI-00075S-OC
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:53:35 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:46057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebScI-00074s-Jd
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:53:34 -0500
Received: by mail-ot0-x242.google.com with SMTP id r4so9986656oti.12
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 06:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Lu+dUf9lB9s7qHbFC99TermPWCY/k4UtyPtgcAjuDOY=;
	b=JEdB+WSZ/YuoI+Jys2T7PBGee82lqe3MpysmgGI+FL268pNZ++Z/KJIaP5f40dAUr9
	apKP7XNzaFfCQMQdBk3HFhY2GcfjFp9GFKOv8nLyVu4WO2uOJtL5bihBIOVsw5TXNK4s
	V0/BL61iNQ7490/2G4MCXQ9i1YODEDgGjAFBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Lu+dUf9lB9s7qHbFC99TermPWCY/k4UtyPtgcAjuDOY=;
	b=UJfyzoz6i/b8IBEJ5hyWP/aO+5BUUvzjQquddAYNE5tSfCa5GwCdgs6tcV0yoKnd4K
	BAvI8u1xBeuJZ4HFzUDCQ4fLvHVFwMu6coWCh4LkfNqbUAEggWjZE2Euz85FDlwbGqod
	0lAifOTuDkgVJ5PQEYw5ZZsf8dccHIzs8oZf0cK+SwNiSseUecEWbE7PnzrDAcTXqg5k
	Tt3KzRnPxNaI/Yq5P8sN8FrQC+l0l8YzqctP40hDuTC3hl00owHiLOnC4GjrESb80U00
	ojL5BXrgEff9QJOMOyMLnoRGmQeIvV1QUsxQXUYKfG2sCd3RP1+AhKYTaD2m5CcNb5zu
	N1OQ==
X-Gm-Message-State: AKwxytdcbvPAg548yzrXCj19KMRhWp4FkytA/e0vX7KaYN9Yk6pMjv6a
	AgTTY6p7agmF40w/rgJVFxspnp1B3bZibbEWNnuyjQ==
X-Received: by 10.157.29.247 with SMTP id w52mr846674otw.91.1516114413912;
	Tue, 16 Jan 2018 06:53:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:53:13 -0800 (PST)
In-Reply-To: <20180116013709.13830-14-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-14-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:53:13 +0000
Message-ID: <CAFEAcA9fSDjPs0bAcKY7wGDJkhv6sXPWwzNo9DUMBjZic8Y9Xw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v4 13/14] hw/arm: Move virt's PSCI DT fixup
 code to arm/boot.c
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B9s6dvleEKDB

On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Move virt's PSCI DT fixup code to arm/boot.c and set this fixup to
> happen automatically for every board that doesn't mark "psci-conduit"
> as disabled. This way emulated boards other than "virt" that rely on
> PSIC for SMP could benefit from that code.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/arm/boot.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/arm/virt.c | 61 -----------------------------------------------------=
--
>  2 files changed, 65 insertions(+), 61 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
