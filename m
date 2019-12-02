Received: by 2002:a0c:88f1:0:0:0:0:0 with SMTP id 46csp3181167qvo;
        Mon, 2 Dec 2019 06:37:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxtMMvGq1DpoZHHu6Em0r9m2PoQ5PYeMNFtuWu884uchczdAvErWz77RFRUq/DKrXv4fYz
X-Received: by 2002:a05:6402:1659:: with SMTP id s25mr27958772edx.219.1575297420613;
        Mon, 02 Dec 2019 06:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575297420; cv=none;
        d=google.com; s=arc-20160816;
        b=YqjQMCSSe6OCpPw6Mlg7xgElTpykEbrpQa3v3vJ9xODjet9VkcHAsP8BW1Ft7ADkgI
         c+cW4R7hdVYENHVAoYt9xFl//rq8cJHoLdJm5AwTXhPChBUQSr+c99+jRl2Z5FMxv8xK
         7L6PYMX8MaXMVShyC94HMOuOgXAt2Bh+2hFDonTGvswqH9Ppf8uLM/iKPerBqrsU7wt9
         q2rgpbH2KcGX+okhleyY56+4CHVIBaDRG2k+Evnw877gfFBUq7ku8ryFbuzlY5I99FQd
         4Wqnvfi2BTVgRtNRBbBOuYQ1YMGY7vN+6CGzqLx2N7mYN3YgOfk9OBkGbKRsy0zdQQDk
         T7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yagIx/TuVFmkuXmSVKfUN+M4CJhpe9vr7IPQM2u2PIs=;
        b=z9PASvsZbLnGnlLvlVwt8H3mk0gPRzZsntcsiyywpqbdwkGJOM6eIZrQZ6JrhKb8G3
         PpPWF6AAqFsq/O9YqJf419FJ87Gi++ns31G/MTDnKJpvxzFsEuFa7LB1iEM50Oo3K7IA
         nq5EnOo/N6+QDnqwvqVZG6mp/nN4sO5FnDBR7GinLN+PafTsW6ruglOC2N8I26hc2iqy
         U2tJ1v7QOkoZjNhG31EIYLTckMNXXZvX83m/mUtuVY7AnuT9cfCM9m+JWrM8u9OV11Yk
         jdTl6NA+cAmd6RyjxAPPOxY9wm52luzp6R6AhmKqqpV8DwTwNOJmQZy1a2Dsa/eQvVD9
         pnnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AwGkMoSy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si3813165edi.150.2019.12.02.06.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 06:37:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AwGkMoSy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibmot-0001Me-LE
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 09:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibmnY-0000Oj-T5
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibmnX-0008Lr-TN
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:35:36 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33175)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibmnX-0008Ll-OI
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:35:35 -0500
Received: by mail-oi1-x241.google.com with SMTP id x21so25504201oic.0
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 06:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yagIx/TuVFmkuXmSVKfUN+M4CJhpe9vr7IPQM2u2PIs=;
 b=AwGkMoSycbGw+xMuRIVpVKTB4t1Pe25RTYWodNhkHef09BzzaVYULPAxoby2NHo60Y
 0kUFKfsW5n1rNRgJe1Ky5bVZ++ecoqgjG6O1Y7ZVDDyd6/KW6XRso/R131oWdhNtHxmC
 fUFm2RBfYsyyZCqa5b37RQukOqLZhRGaTffVzxgykiWi+i6HwXRHIdfvIvbZtep40U6f
 nVHijfv+h4+uRjJZK8g02fs472lJR7NYZiPUtmhKKXJ5aCEzkOS4pcS8brJlEXszCjrg
 XwDnPxABfBUgRMyKZCSquTlOXGyRMCc1VEnrjf+p/mf0wQ8E1RSE+Sye2zz8r7/xcYXE
 mNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yagIx/TuVFmkuXmSVKfUN+M4CJhpe9vr7IPQM2u2PIs=;
 b=TP27JQwd4unRMPquaeIk3fEibCm+A4HDHUMbn4GDP5mF3JiL8Y+9PU08wKYwEgMo9N
 x6eKDhiWjYAcIlUlPAp2754Hjqf0/CVre8/VAsC/6ZKXSb6ZOi5kWek8X48d6OC4v2Wf
 FTAOeagHBYZ8AFszdFw4oeMgysRARTDW8oyE7Fso25aqgMFjeAAPNjc8nibY22gypxcU
 x4Hfnwmh+CI3JBaAyuy1JBHFG9f413ZkQIs+QD9FWi4ySevXQC6p7+T3/pF11+GRPLSg
 NnpBNEivm5qKVY2rv6PL95y3fXwqpaM+yxYWrs0gIEZPEncBWHb+AAjTmdDfhGefW0Ho
 b6bg==
X-Gm-Message-State: APjAAAW2QLj1b/+QQDOox2HGppiq1aJV88jy2ZNidgzWnLckYIfrIBY7
 EUbgRU594S8kK7y8h15ZJHOhiIF5jA8cDNJ1wwDLeA==
X-Received: by 2002:aca:edd5:: with SMTP id l204mr12580766oih.98.1575297334268; 
 Mon, 02 Dec 2019 06:35:34 -0800 (PST)
MIME-Version: 1.0
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-5-damien.hedde@greensocs.com>
In-Reply-To: <20190904125531.27545-5-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 14:35:23 +0000
Message-ID: <CAFEAcA_ekJc8a8Epgwq5M=bpetNVW_v4=tGbDJDxjOUyG1jRSw@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] qdev-monitor: print the device's clock with info
 qtree
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MYjUzy3QYKfM

On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrot=
e:
>
> This prints the clocks attached to a DeviceState when using "info qtree" =
monitor
> command. For every clock, it displays the direction, the name and if the
> clock is forwarded. For input clock, it displays also the frequency.
>
> This is based on the original work of Frederic Konrad.

Providing a sample of the 'info qtree' output in the
commit message would be nice.

>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
