Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp826568wrs;
        Fri, 23 Aug 2019 10:06:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyc03NZPOh4t0+PEGDwU3guoQKyEzbZWYs5PqipNVeyx9aj8n7mk2bzPyv57+LyjZRoW3si
X-Received: by 2002:aa7:da97:: with SMTP id q23mr5671175eds.132.1566579983508;
        Fri, 23 Aug 2019 10:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566579983; cv=none;
        d=google.com; s=arc-20160816;
        b=obyxaVragWr+9sM1gSmczP+Uonr6sOyG7DmEDjw9xSOm62+QiMBLnFwTBisNeZbOKV
         K+mRE3d4R/ZcjK20JLrdDVZUWX3jQE3epJ5aJ+/lcWh7WY+illDLn4YhwNXKsjaa+NQh
         aaUOdv0nLjD04FTC11+pIcrrYk8xjpqYFY2qd5h9mZ3lD12+IGkq04qUE8AcGv5STHar
         /bj1Itahf/FP9LlZPPWRPTxls0z6wRTwAOIQB22Rszwp/5G3TEPWas8tjjAPqqQ/0Gyc
         E8VoqINWiLbo6isv5M6mazcga2iCgB6jEamn5o0LomaSIznqycpAMsS7IpDUWCvQ1xTN
         vUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WbFBLukMqRE4t7Rzf5sEVXgO7jsZfBnO2NXnaYZpscs=;
        b=p/V9KQ3J+RTuo2RM1RzcMZ7nB0eUfCIGz/zAiIdYYcBj5Mb86JfnPgtuPm2mYu5bZJ
         MDrKxqIiYcKyFraUWAiJnn5ljgFvDATJo7ccWogY4j0AG0b/p2CVev4+Y0g8M14sBvSl
         PC/IQcubVFivo3dGlzzZ+/JwAjTFCKocwONglnpGKnlxSP2VdySW78toAnOl7lYP2jLK
         nPxRVOBhQy9pkdfRE2kMhpb3hecf0UHotpGqUsPvdOXvnTTg0RYbwVlmPyKno6yiJSxJ
         hH2ACmj0jOQ7kJ0W4aQFLaZ0FWCkXnC853Eox02vuNqADafgQecrMo5G/gu/toKKa/FX
         lAwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dDSQXwVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24si2150431edc.56.2019.08.23.10.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dDSQXwVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59755 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1D14-0007aP-D7
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1D0n-0007XZ-Cc
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1D0m-0001Jn-DG
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:06:05 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43219)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1D0m-0001Ii-67
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:06:04 -0400
Received: by mail-oi1-x244.google.com with SMTP id y8so7518183oih.10
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WbFBLukMqRE4t7Rzf5sEVXgO7jsZfBnO2NXnaYZpscs=;
 b=dDSQXwVhJ0tjzt+pYi+oVZvQkpLDD+yMgsFCbXIgkVzgTid19fGlYqXCqh0KDh59Br
 tLaz0JG3CWPmCsN2SXJTJP6/NW9eXBVbp9dmMUDSSYqJSKmTXNDOBx02UBIEFkYiN4VS
 aU7hTMlcgiz2ALDvQUzhStHaCK3Pra8zkj2qPQJzchm6nm1QT4zkeEC+jHeeig0+hn+l
 3TiBk5lx+wlhRKQRwqbJF/HF0nd6WUO0IHB5e4zB/KQtX5v+eUaCEGXWGfr8Fjm57yOn
 1g+1ss6kCknD8kXiLH+GvKWAzkD1yTPwAoNgw9qH5EKo4ImyyhQ5YQn3oVzR2hrQ7H2i
 u3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WbFBLukMqRE4t7Rzf5sEVXgO7jsZfBnO2NXnaYZpscs=;
 b=QxuAAZHX8qAf+JXJ9dO2SNSROyBpbxRpMd9DbW9HM4j4vBXK+BNicFL9PlbIuVUe42
 Gpa6A4evyTE+rub+OstreU69r9DvNdZA03kQhfILRKugjECsO7dQXZRP08NaUxQ27vG/
 cgvtU1FH2y+MJuH+wzkOVWXpe/Auu7XQ3pi6SKE6CMHECXlkLs+Dp8/cEiaZvXc+5pxO
 LFU6+oIj6C/lM+u/gfK1pLvTbYI19lekI1FSqcYgd0zy0jNyaz467B2S7VBix1XCPVXd
 3XAISMOl4XhWiJGOzJ5fMXqAN6cG+Ipx4iNGDpzcQc0ski+lGnE0arAhppIi9MdvYyzs
 GERw==
X-Gm-Message-State: APjAAAXjuzYPlljC/2fIBkFOIStuHCD48RJY6V3ZDBCqpaNDYXxzwmaX
 nhwLEYxmUJcCYUFBPLyGborSFII4PqGFSZZDfKGo3g==
X-Received: by 2002:aca:4b86:: with SMTP id y128mr3885248oia.163.1566579963201; 
 Fri, 23 Aug 2019 10:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-27-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:05:52 +0100
Message-ID: <CAFEAcA8pE3oXnowMLcdOP6hPy9tKV-fkZffWsMWgcmg8bJc87Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 26/68] target/arm: Convert MOVW, MOVT
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
X-TUID: 0UirV5IxU1Ie

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 89 ++++++++++++++++--------------------------
>  target/arm/a32.decode  |  6 +++
>  target/arm/t32.decode  |  9 +++++
>  3 files changed, 48 insertions(+), 56 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
