Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5376666lff;
        Tue, 14 Jan 2020 03:22:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRg7tfQuvjNPyNi2tJ8z45HqUWIFdT2jQof6t0d7qmeijAVVTWd6MD85t+Cb/DQqr6COpa
X-Received: by 2002:aa7:da03:: with SMTP id r3mr23045073eds.163.1579000946314;
        Tue, 14 Jan 2020 03:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579000946; cv=none;
        d=google.com; s=arc-20160816;
        b=RMtzaaUcpkJRfzDO0mGKOyHze7x8RBhESx6o4DifITZEytMOTHuqzPZGz9/v70vx4R
         LBiO77/y8Q+oJMe78m27+r+5r9RkZt59VLx6ac6ZNuzphe5KPMzOCacBQMnaXRCKTw98
         u4natIjD77fuZrjGahdD3p+KGGwbdjXHshAD9a61AZOhfmsAuHsTUQordZIjIGG/7YeB
         d8SY54R/q/KY0XnHc6q6hUAsa1oAdamJR+uv+p2jEg1BQ6cNAS/zWyAoO/wnUoNM6iFw
         0E4VWXEVmCDRtWrDKaRFfbyeO6YMh78TVjp+B39u79jwDf8pUC/zDUcA/sxUOP2caoRK
         BpFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=42IyICU/qzw8FWIibaG8XJJhqypIeJououtKd1vQJ/Y=;
        b=IUS+WOl3wv8U1GzOUaTnlasMInhV2slzxImNm0w4rnAUbxr5g/eFm1QR8QTZkLjZGH
         uhdu3xYAJ+rBQhaUDS2l8NWGRf+aJx8iONpOlZls2HocTEtnKUsAKQYaqwA6dgRbLBO8
         LqhPmPAa9RMPe7vVz+PICgT03Gb/0I0rfm3b+XyfGYWxxv59yqH3MuJTWq9m6ARYayLS
         VQX6Ly4W5PV1PbSidzGJ+MiHH/3kqyqSK1dNzKDUAb/Fboff3PdFbWp2XCF79i9s+gAT
         FjbGsPczREXEIIsMZc5EDtTK6BykVlo18H90aeSmWD/ix4xAoseFzmrXXy+uVw+qWRya
         uu+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KCjiSLU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay6si9778426edb.105.2020.01.14.03.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:22:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KCjiSLU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKHB-00080L-6g
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1irKGc-0007du-Nj
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:21:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1irKGa-0005AV-S4
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:21:50 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:43672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1irKGa-00059k-Gr
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:21:48 -0500
Received: by mail-oi1-x233.google.com with SMTP id p125so11417739oif.10
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 03:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42IyICU/qzw8FWIibaG8XJJhqypIeJououtKd1vQJ/Y=;
 b=KCjiSLU03POPTL6dUmEHDkkCTKUo75X4RIHXyYxiJaHWpgubr9Mzrl5VolD8ZQBgv5
 KRsG+IwuBZPUsdzsEY25AuXEZBmc+Vvhka6BPSdSENayDWFp2TYEETc7HWBfypeNfnnB
 ZG+ZT1VzbuHOsiRotZcQ095uSn8UCjb5AAd0kcHnVU/tGgcWSQYeJ/wXKTS6OGH9Erod
 VC0A8BaGtY89BoackniRXSbJFF6GfT1W2TY9FYwzAHMkz7PKiJzN9lIq13LIt9NuEOKf
 jHAZ3DQr2KGhvr20iFkSF5mVvvozzHAQQy6UkQU331HuHhKnP0E73yKEhMQFr6zRohzy
 UcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42IyICU/qzw8FWIibaG8XJJhqypIeJououtKd1vQJ/Y=;
 b=R/hGzcAKzsqoINs2SkbVRdAfUHzK8ykOsUsK5RqBStqC6Zv5DtDvJyPWd10i5uMSHD
 N96YhxYWscJHTOOkz8xUcRDmAighoGyY8YqPiwuv9z2sTcEbPuezw1/lcRey0QhCdq60
 V2l1msIK8bLOweYKgrnijFufWIo9ntrPYUFXU8C8ZkQA0kJe3bl+R86FUlr6D2BHcE5V
 pRJdDVdpC27gd9ZyYnkT4rR7ZKZcxOXHRJrXe4UHw3sqIg2Qn0mWFfNDXB++2aTXfx9C
 WK+eZhuXNL63boHXeUKjvU7mATi2hw0zM90q3E++P+ZlUq7Ar+aIQTbCpusZBREGsCuW
 FB1w==
X-Gm-Message-State: APjAAAWpfyHOmEZsxsqMItPxCcOWrRCOu637CBYSXtPVyg4hxVNj7i17
 A3yLiptIWlPSFkRz0N2s1f43sQjXc+vW8G98u9Dlmw==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr16571686oid.98.1579000907120; 
 Tue, 14 Jan 2020 03:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20200114092606.1761-1-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jan 2020 11:21:36 +0000
Message-ID: <CAFEAcA92xHe3T2teGQmBgkL1qSGoY6F+rd8a4A_ghw=CL98vQg@mail.gmail.com>
Subject: Re: [PULL 00/29] Migration pull patches (second try)
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dwU2tsMe52XD

On Tue, 14 Jan 2020 at 09:26, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 3c8a6575985b1652b45bfa670b5e1907d642cfa0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200113-pull-request' into staging (2020-01-13 14:19:57 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/juanquintela/qemu.git tags/migration-pull-pull-request
>
> for you to fetch changes up to 4eafab585c091050b5ae63130f46fe46ac919c3a:
>
>   migration: Support QLIST migration (2020-01-14 10:17:12 +0100)
>
> ----------------------------------------------------------------
> Migration pull request
> - updated QList patch
> - initialize local msg variable

Also, your patch 1 has no Signed-off-by: line. Ideally you
should post it on the list before putting it in a pullreq...

thanks
-- PMM
