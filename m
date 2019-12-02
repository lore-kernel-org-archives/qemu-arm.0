Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12764876lfc;
        Mon, 2 Dec 2019 05:45:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqx77fsWJzSIcQ+EZDU+c3wg/kBtL97V190fWCrlZItXkkun/5dyW9dkeTt3B99e1Y/XTQMn
X-Received: by 2002:a05:6402:148f:: with SMTP id e15mr34245765edv.254.1575294343917;
        Mon, 02 Dec 2019 05:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575294343; cv=none;
        d=google.com; s=arc-20160816;
        b=MVWJJs+Kvx5zNW2FRW0aK0KtjHNU3NqC9R8fQLLV3Cn1ofq0EpZQq6VoW8fJviiyP5
         zPs184S55KsoZ4z047sihTP7+tQ0NZ+MtYBv27f4fHwxw9AYxzpAJMKZgCSwKkd632XU
         YXKYmr96T88ergUt0/++q5l8ETXbTh2mlOZnxmqq3r5Yk2yhP/0UOffkMPlcMXb73hQT
         7vl/cbuwaUSFLcadAQUPsya5mdCCeliVvqMhelGfRMe3x/ys75M4W4D3/37hD3OOXiV0
         wVxB9bX4TA7eIzKMJegPcCh3hVgwujSISSdjZX37cVL1/HxrrvNPjkVtQtOZPnzIWSqL
         OoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNCsfXRsfWtMe/ccNNxw+9lM/I8D9p1NJg7vYX4iwto=;
        b=QXrFkg19YlHyfQ1qVh2PnWuH1nkXFKWV4GfcRpSNG7HDuojkDie8JuKraVsamwcpkU
         HeMHvlg6ETvuB4JjjX15raheGXloirKXI9tGlu1kjfQlspGJjypmxjmkz8/p81myzIAi
         bhvpLoGjVHJoUyGy0AJkEnzhOtArMpCAm+xYi0xRLWv0fg0GIU+Dv6/gsxpKnaAxC0ej
         ZJPVOVQnBLj5axGGkqm0SOFWPltgl27YrQW5Rpvr60zI7VDE6bQn5oKjZGlsJ59vWpZh
         gt2nHlodlUEie3Q1cQup7LcjALtouB14iYTLlQ3wZpTg47DTalUjOpz+ygtQEuC5WQEp
         H90w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GszemOh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si8370761ejn.389.2019.12.02.05.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 05:45:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GszemOh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibm1G-0008Kw-Pt
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 08:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibm0c-0008HA-Hh
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 08:45:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibm0b-00021f-FN
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 08:45:02 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33539)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibm0b-00021A-9v
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 08:45:01 -0500
Received: by mail-ot1-x342.google.com with SMTP id d17so7547099otc.0
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 05:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNCsfXRsfWtMe/ccNNxw+9lM/I8D9p1NJg7vYX4iwto=;
 b=GszemOh2qwGzBLjApmjYSNZ2JTIrzG+/uWRRrnG15sjyz/gqhzW050LjQ7RzIVOFMh
 d/34ZiuyCFqlDmSgEREJEF9kFaXCVd6dksSzcYTV73OdGkab5RntwQzuAzZ8sLicqe2O
 9phzehzJGyEQL4sWDYRWol0qaRDk587Z1bjdU/cBRWIpjMP10hBnn5VWrCk9e2mHU09S
 mwaRUsjRJQHQ86/QPFGndOlwnv7iQNpJ0LwFVe2GjkCx9ae6tB4NYcxdku9YNIZaO1kK
 +Zodi3RNp3RhI6vRedjt9/vgUtceKpadfK5LfZ6j2D9u/9BgxqfIJ6l8lGJAkPwxiNjw
 j61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNCsfXRsfWtMe/ccNNxw+9lM/I8D9p1NJg7vYX4iwto=;
 b=M1zDsgb56H2aF0QUNq81dLv8E43sYprIInzqz1toHgFQEAAnzJDbA0C5H5mrDD8cC/
 rWbqpHpFT8coUcxmwNc5KFGz7N9p00CnpX/QRxf1uB6Jd+rgpp2hFLA2iPAy2mDCYyFN
 wqcs5kKeNhvjM/WfFyjp9bzz7pSt6eJbt9BYaa2YNBFUklKP5k4spkXdcG8rTUvz/9pB
 gVghDZA4LiBuYnQhJ+WLUDWKuTDTrjyGs1ZRaG2ab3OeOSG5u3zSFqCh7s6h1BLDLtQc
 0GVXByBfXjvBi4qdLn6d+CVYoTVqjDcNJYlv2dg+80AijnyJ/yD7SjB+my6xUOhjbp7v
 HIrw==
X-Gm-Message-State: APjAAAVXzrSpxt84+ixbDYfcRTSH04gFDEkeIfklJQy1dUqUZ3JXbhCy
 VERZo2WOxQdiDi+055XgSTV3TJMUbLzNp2E4hXnCkg==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr22150584otg.232.1575294300474; 
 Mon, 02 Dec 2019 05:45:00 -0800 (PST)
MIME-Version: 1.0
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-3-damien.hedde@greensocs.com>
In-Reply-To: <20190904125531.27545-3-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 13:44:49 +0000
Message-ID: <CAFEAcA8mBqt-zpoYGQYa1OwRzT90Vx-QUEWcsDH=eFecXVk+OA@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] hw/core/clock-vmstate: define a vmstate entry for
 clock state
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6yD00pSVyo3b

On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> This was in the previous reviewed commit. But it can't be in the
> clock.c file in order to allow linux-user builds.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
