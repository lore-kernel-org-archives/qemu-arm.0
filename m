Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp506221lfm;
        Fri, 17 Apr 2020 06:58:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypKYciXHcLwtenPjXm2Le2yI9V7ZVNbzmBohKE4F8WeUoWOvUSsRAcBeZwIjkNkUV++PNjOg
X-Received: by 2002:ae9:ed04:: with SMTP id c4mr3448311qkg.367.1587131888683;
        Fri, 17 Apr 2020 06:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587131888; cv=none;
        d=google.com; s=arc-20160816;
        b=U89/021UjQgo1Myw3lusLnq9cl9NYeIp6h6uruhrv+1I7gViZ9P5Ec+KztFZND7k44
         L5Jd49tBF6aaF58V4e/fSkw7zPTkTD8VighKrnbnXrYGxHApLgXss00fPIRwtPriuoH9
         4pglg4BV5SUHBlci6PqSJiENvQ4qTDoLa3jv/i7ALsflNmpeVIvoxSwyhCUyudOJbovZ
         K5Hfmi1XcZ/kE1/jXKeFPiLPmOal1mbyDLI85apNNjZRgkFAAKF+E9tbhWp3irYK8a3Y
         iqAIW7NFYNFcrBpbXAMt+wl+yOrget6q8Dg+b3xjUNj3PFGmwzEB5XpEcagg+NVI2Scq
         /Djw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IkDKHSoXtkgxj/FtUPqqyiyfXjHOtFUFK0Fi91nt2NQ=;
        b=1KrwKnXTsYfgGQjfe4DXknh2JAva96gZbyMG46okpr9s1GMIgnZayjmGEXEF06dVLl
         EqlH1eoXux9B8aQFUx0oU4SfvZZ0Fszvz6yiqjD74ph4YTco+O7etvW5ubicNOxviHuu
         3aRD2d9CLEUdS6R60mcw/gHHLMBeFj8+uRrbEKHqPbGTzEvBvaSpwUj02gamKxGp8Yg9
         WGDVYqH0jHarcdkAs8A2rscws/4/db1HEu1oaQDnGH6x+Wg3QZBoqn3fbhQ1f3EdXgfN
         HoHmKI6QiXsv9u2dlG4Hc9aT0XiIOXlTwWPQHypxfeHWoepvyaEOkgUmj/yozmE56f2V
         wnSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I50gEb87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27si1003457qks.288.2020.04.17.06.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 06:58:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I50gEb87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPRVQ-0001CH-5b
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 09:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPRVF-0001BB-Ht
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 09:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPRVE-0004Da-Ky
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 09:57:57 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45515)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPRVE-0004AV-Cj
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 09:57:56 -0400
Received: by mail-ot1-x342.google.com with SMTP id i22so1448117otp.12
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IkDKHSoXtkgxj/FtUPqqyiyfXjHOtFUFK0Fi91nt2NQ=;
 b=I50gEb87GSWahboVJ5Cj/zt+uMKqfHnFO3lGj1aoVELzOp5KJTnzw2iQ28z74Q71dd
 CyNmYdInYJ8kQDh+pG3SDJNqFh9SFOkNoZYcA8igIZrsvcqw+bk3z37gz+vRWrp4lquK
 EwYip5m8//tMFo1d/G6X14JEtFatxtKwkY8c91qYBgRCXSiWJpryWnA0YPYBLh+voEJA
 pLdkMp/Ms+YQ/Mtep62ovz6NAKdYDfbKUB5GrNA4bvdDkdQxQBUJmQzOJ0UD8t50ijx1
 rC5/GhsQ6Q23rQnXrGs16Ro01DJO1j3mXWIhLkw/aG8eG9HAZmBAAMDrR5sz8h0Np7mK
 2vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IkDKHSoXtkgxj/FtUPqqyiyfXjHOtFUFK0Fi91nt2NQ=;
 b=pz04zYPFdK26K3w6h+TShZM9Q3VG/Oh6NON+FZsI6uuol0m2azfNVXAhNfhC1IrEGG
 zBsXu2dGPKkWvKJOWZ6yBt4n5f9J/ueEHHdJAuHYdTFWB6Gd0Vtw/srk9Zu/sdu+j0GL
 RcATHO0VQCg26pQwwI2IlF6ZPeeCFIMECgByEjJ3bWioorHaKygwOs6xhLU79c3/K7kc
 l43XbtCPcZbgBReZNEKRiVqGpPdpr1u+E1zgJp6RKp/Clo+JwfaXwQt84ymk/ox5nhkG
 Ry+YNNSuDL1301nLq2P+Y8kOQhjnInAhSVDesoHbytzMm3+QCOqj3FpsD1e3Uhs0cXtK
 ZIjw==
X-Gm-Message-State: AGi0PubYZvhofOk3euBurj5v3tNm50VrYqdZ8+Sf1ekiGZffGptaGET3
 IILD5e952XQXS2vWBpQ0Odg8kROwCIn+aE6zq6xzi/N+tS4=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr2674288otb.135.1587131874884; 
 Fri, 17 Apr 2020 06:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <1587048891-30493-1-git-send-email-sundeep.lkml@gmail.com>
In-Reply-To: <1587048891-30493-1-git-send-email-sundeep.lkml@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 14:57:42 +0100
Message-ID: <CAFEAcA8AOSEK4w+AvyLgOc6gX83_XN7FVvU7kkxpuTuSO3cz9g@mail.gmail.com>
Subject: Re: [Qemu devel PATCH v6 0/3] Add SmartFusion2 EMAC block
To: sundeep subbaraya <sundeep.lkml@gmail.com>
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1bxDw1FgHJN4

On Thu, 16 Apr 2020 at 15:55, <sundeep.lkml@gmail.com> wrote:
>
> From: Subbaraya Sundeep <sbhatta@marvell.com>
>
> This patch set emulates Ethernet MAC block
> present in Microsemi SmartFusion2 SoC.
>
> v6:
>  Fixed destination address matching logic
>  Added missing break in emac_write
> v5:
>  As per Philippe comments:
>         Returned size in receive function
>         Added link property to pass DMA memory
>     Used FIELD() APIs
>     Added mac_addr in emac state
>     Used FIELD_EX32 and FIELD_DP32 APIs
>     Simplified if else logics in emac_write/read
> v4:
>   Added loop back as per Jason's comment
> v3:
>   Added SmartFusion2 ethernet test to tests/acceptance
> v2:
>   No changes. Fixed Signed-off mail id in patch 2/2

Applied to target-arm.next for 5.1, thanks.

-- PMM
