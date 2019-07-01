Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2647384wru;
        Mon, 1 Jul 2019 06:20:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLt/W3Vol891hlpgDOgpIavFGFeQ7Vxp9EZb6JIl6gEhJXua5pfLnflV5r2EetZNPwwCWs
X-Received: by 2002:a17:906:63c1:: with SMTP id u1mr22996315ejk.173.1561987202504;
        Mon, 01 Jul 2019 06:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987202; cv=none;
        d=google.com; s=arc-20160816;
        b=OrRLTg3S533rZfDAw34hFlrCoKWpqOghDQuprmsfUreGEwfvE+XlpBuVTMfK3USTNP
         /s6MunmDVelLFeCtQU2SDyNcGgI3MUFu6bU5b8fRRjaFVwA6ioivHoWCLUa3jJDE6fKx
         ivgXDi6NQIQ5OCjwCsfVGLjLonOzXq/ySC6Wxo7cmWhVxeBoPyNSf5K1QScAMBlLu1vz
         ZCMT5+kJa42kAKcDfvnR72aLcVKKr4NIfp9LCjdVSNmUHchouMhHZ25K8fWNlGGriWdW
         gfhd125nE00eaCE5LUWSFn0CdI9tezOxRWGCCkuFCJgfW7meZk6RbjlP01/YVLrs+aor
         Z7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=pUQv6DkKtWq0J5A/w2iXR4PnuAkD1maDWSI1k7bmNiQ=;
        b=tVq1NGHpd3YF3sYRwGTs6ceNjOzXedOcOIxSgTPlwYE1+p4RnEJxexyxXciACZ5c6P
         3MecYLniZP3eU8Idn+mU19WQe9i5I/+n0D2ttd1mroPA6qYxrIudCpGQKyZfSYmOq38j
         ZyK9kxaZF07ZLFwwllz5ZdevGwKbwWJ8iM/IZSzOoYTuQWy/tPmXhDKmBPSqiZl7ECF9
         Jk/uPPctcxSJvyIDklDH6BnMawrcOe6vfCIxnld21wiughrhSpzzoFdCFGVULVgH1Lbu
         lTJMBcpWGrQE+NgXqOILLCQc8jjBGEC7SQ/UbWWnOFGEXwO3uKTAX2brvzpSoV0SRWEM
         QKBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="F6Wj/39G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si9273251eda.193.2019.07.01.06.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 06:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="F6Wj/39G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhwDx-0004Aj-Ic
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 09:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwDn-00046i-DA
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwDm-0004Ex-8w
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:19:51 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42595)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhwDm-0004EA-1y
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:19:50 -0400
Received: by mail-ot1-x342.google.com with SMTP id l15so13415794otn.9
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pUQv6DkKtWq0J5A/w2iXR4PnuAkD1maDWSI1k7bmNiQ=;
 b=F6Wj/39GmkLR2g9YeQEkyTn7TSEqBI43kOKZ3yc8kiDRcjlv9cEf/VaDTNhuLrHOhi
 BAIMHLoBY9zRkEwFAehHcmh7fRuUXN+PtG6hWS+kVxEDvsi4o06PCVy72ndU9W69wgJ0
 ZKDXHdKoGtztksNd8EjwMq/cL77gBkvHwI89D4yFTN765aBHv40Jya5fEfZB/4SFiggh
 wAUxQt4bHJpQSywUPXIf+s5auHl/lOy0L5CeCgYq+rbMQlIeiGb1KuqI5CPaLHSm7u7R
 WBkjlC7qWmvsobdc2qTKbBYZ6iib2dXPUO/LD+pq7Dm8QRTS/bbyWIsoaQ3osEWaVo0K
 77RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pUQv6DkKtWq0J5A/w2iXR4PnuAkD1maDWSI1k7bmNiQ=;
 b=P24OAHIs6M28wWmCKOwfOja0ZarjBvFc4bvvLlefnY7fmn4fKSP/ts/Oo1jsPO4bRK
 DBQEJDifbXsze8U/+ZVnQavS6e5C8IZ3xePzD3X0Jef02q31ER4R7s6XflWmHvc6INwL
 3gbUX4387+ECOU0wfGwWTiiricU/wAmpxxyvkyRa14TqsEM3fKbN1sGY9k2srHZAYaup
 MPZgwaPpCINad9yaY7wpgkzxE3I+X6ZHGj7O/6/FJGBVzWOZazY/1u35yPKYB6ZfEU5v
 co7ZPEljucwuinfKZ/Xsve25c2wbhc+L8m995H+U4Sc8GxLdclJlmQLvgoyjfqxCUwSO
 gMsQ==
X-Gm-Message-State: APjAAAUHG3vMYEFQHQ7bjxRG4eXWHPv7VkzhTGIkfUNcSPhaCGtWNakM
 6zTwOREZq9JIY7LgPmiypLH3iQBJyw8rD/4UKr7Cu4T1k9w=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr20522827otk.232.1561987189075; 
 Mon, 01 Jul 2019 06:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-17-clg@kaod.org>
In-Reply-To: <20190618165311.27066-17-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 14:19:38 +0100
Message-ID: <CAFEAcA97g-eHyq0cWL5+3JH2xHLVrSaP36pm0G5djkLcVoK0HQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 16/21] aspeed/smc: add DMA calibration
 settings
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oeb7bFTIm7Oj

On Tue, 18 Jun 2019 at 17:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> When doing calibration, the SPI clock rate in the CE0 Control Register
> and the read delay cycles in the Read Timing Compensation Register are
> set using bit[11:4] of the DMA Control Register.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/ssi/aspeed_smc.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
