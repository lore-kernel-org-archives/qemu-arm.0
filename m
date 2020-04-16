Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1876957lfm;
        Thu, 16 Apr 2020 07:25:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ88WykxdNpYA5EGE0KHnYRT4SeEADDyv9hia6GVDM9XckKmXRb5Onwx5/GYsId1nVu6DlW
X-Received: by 2002:ad4:58ce:: with SMTP id dh14mr232531qvb.80.1587047159072;
        Thu, 16 Apr 2020 07:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587047159; cv=none;
        d=google.com; s=arc-20160816;
        b=bjL3oyUihF6hY4danMSA6QnW7iCOFkPpp84ugAF0UedYvWWumO/4h41F32/cz6F7oL
         GLUkivDIYiFola3PgK9CTmAfcNmLG7Zq2n1eeiLwWfuTDRvZBQXY4SqdlJkXgnTAq8Vs
         r18GEE3+ibEqtPdEIny7A12pdS5FKVQNIY/xR7fszM5r3lojR2XTirmnlZd+qtlO4jDo
         zl99Ou4pWCIZ7FjXLbwKrXVwx/Oe4ajd/QfyJx4A5MppxoUQRlkJ3flFXdVDHGinBUgk
         IaxIPB6IYXiyjrfeLjDNTke6mPOT6xgGIUOTAvWzkTfrJfqGU2IujWTXvKlxxAf4akYJ
         oNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbEv7BSJhfmeZsEBRpflbOl0RzbW3gd+CcYyFhMsz/0=;
        b=X3Qt6EWXTCZexcEwIlcgVb2KZJ2Hfpv4ORnZRC/Rliib7QCzseyx35NKCtGBQKP4m4
         fjtoIbtOVEYt9XgB3YanQViGR09ctxP7yeDRTSpeiPOYnn0l5rw4Rp4RhCtrgXSvYBMB
         M2YT2VVoo/GWLiQQVHH5ueQqTbUqEjzqUqCbRkTgi+Cl7ZVxVVJUAhi3ZWB9URP+uQAr
         Kj8wmp/FlvjYgzVBjBs8qze/Y2Ag1u5CsV3CwxIgfX1Hwp+fMSy9s49nA/oS5moUvsBj
         c0aDPcHZEQcoZ5r6qoH4k4DVgyxf/IOEiKNwsJuUsU0ttFCS0kno/PJYL5kSdUtSfNx3
         FCaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nx6WPkmj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb13si11569930qvb.136.2020.04.16.07.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nx6WPkmj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP5So-0000TS-Gd
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Sg-0000Sc-4N
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Sf-0000hp-6K
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:25:50 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5Sf-0000he-1f
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:25:49 -0400
Received: by mail-oi1-x242.google.com with SMTP id j16so16697054oih.10
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbEv7BSJhfmeZsEBRpflbOl0RzbW3gd+CcYyFhMsz/0=;
 b=Nx6WPkmjbumIORxCD4Btw2twZpes4NHd52xYIkpjF0L3zQ7bO0V7D/yhfNnK2m8jRm
 oTIUGvTgQzXhS+FUD2+aBB8dffeiWpERFVph754KJfk00DCagH6cu43JCzKyOAv8d5De
 lCeOjtlI9wQTNpJPNtJo4kMyfCgq8vv6PM8adnCItjKI9JxGX50JmesKiQUIc9nB0xA8
 1Nsn/fj4E3Q/vou/7fSWq0fblqSwnSHvgU5fzi0gD+QQY9ak7pKMciGK5NCCkD4YXVKs
 NT4I2P0mgMYzBa5u7Zr9z5uj8hyQoikt4Ao/7plLE/S9oiDfF609TMUaOkzDb/Z3lYla
 +5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbEv7BSJhfmeZsEBRpflbOl0RzbW3gd+CcYyFhMsz/0=;
 b=aiIaG9xOO02/vsavtIv2hrRbQZRdREVgps7GlKWdT7oW7HYLqCt2wb+ZyjnQbEcnRW
 XUXJ6Vr260o7AWVoWQH3kCkuJ8jgLCiMu6vLgZr+faTa5ntxfHeKBgA//lDPMRlBncaX
 MZ5M0VhwGOPcfP09MIsaawCbLckF2g85RfOQz76KXhK6cQmPjyDBVYo6gXBovKwwrtdl
 atm1C/vdQbvtbsNyvMnLlo2+dpEOrxWnayrLgx2C337janPeYIJob4exV3eeall/QxKF
 lYSRKNZUDypA8MWH1hB83IgsZU9ekFP+JqHblj3E1mED9RxmIdeD/fhuuZkol6tfVrSZ
 IHYw==
X-Gm-Message-State: AGi0PuavNwhQYocThcKUzAbrKrgiKkZefoW5DLf5XsXnl52L9VG3WcRH
 RMLCl+RNw5w0G2PahPRfC4XSUGd1YBZNyR52GM2v2v0pigM=
X-Received: by 2002:aca:170e:: with SMTP id j14mr3047364oii.163.1587047148413; 
 Thu, 16 Apr 2020 07:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-15-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:25:36 +0100
Message-ID: <CAFEAcA9+GQbZ2COG=JnirsTUEj_CMmOnhxEwGZG9ZxYr6=s0dQ@mail.gmail.com>
Subject: Re: [PATCH 14/16] target/arm: Reuse sve_probe_page for scatter stores
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: catZ5Syepv/r

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 182 ++++++++++++++++++++++++----------------
>  1 file changed, 111 insertions(+), 71 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
