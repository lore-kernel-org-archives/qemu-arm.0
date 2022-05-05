Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp955620lfj;
        Thu, 5 May 2022 03:23:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPmbPw8Mkr73TCwFvUng13zHNQD+XkRXsKBGzoOoAEf6aMC3rIdoU6vtX7LzA+l5F1hJCo
X-Received: by 2002:ad4:5c8e:0:b0:45a:9692:14ad with SMTP id o14-20020ad45c8e000000b0045a969214admr13204083qvh.116.1651746226141;
        Thu, 05 May 2022 03:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651746226; cv=none;
        d=google.com; s=arc-20160816;
        b=AOTwXOE83cnk/cxJSZxGc2Mu7RxGNF7+Rd2gE2qgX327yNw/1NUdKQm04yytNA4TTI
         9E72mgrV7E/Be3blO4hezscGlujTrJjacjVSySxRRNhCyQg+VQutMZ1MfVpDiR47rvHn
         XWxY3UKl+PnMN2oboV5BQHdnsii4n0t20BteH9budO6b4QkuP8v7EgRC7GfIYGUZ1eKs
         axInmK8ob85EcrcvJbPg+FRat5JcoMzT/6ph+h+ayZqHkcBsyEgW/9uVESPLY2/WVVlk
         XVOW9EaZ+dfNfsVxPIdlBnkHmMzDb/0zPRYSl/pjBWL2QSb2yAE7dZi5hi9Zh0rV8whA
         tRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oCcmjq+KLY3vt2KkeOarmC/lBvM+SdG85UFm9C3o/18=;
        b=RYlq9pMG8L89h14EfHjRZl3nUwG6sxUgVUXqzDiRCruT6zaprATs/ZdCczpnH5hNMa
         Bs2TxeOLxW6KfpGFqcl95++UxE/8CeTApLOBBNXXfBNSlKmZ8Uf6Cg4JaRR74fLdkNBa
         kQIM1GHdoF91+saoXcmroo59mhWC2ZV9H0N4UtBiU1EqSuNVPYaAzswEbduGbaWmD87G
         vpNJwwyb0sc8bnHkF0582X7S5nWAX8v5wH3fLRZEvHE3snkeXpUdSOrL24PNzaZKdo2K
         gqNm0nX8rUPnlfFH5sF/BIGxeYy8BFbwj73WgQQljOoTCszyerL3OzTa03xgop8DmuoC
         XU4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ck7isc8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a0562140dc500b004562dfa4544si806364qvt.152.2022.05.05.03.23.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 03:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ck7isc8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmYe9-0003yO-J5
	for alex.bennee@linaro.org; Thu, 05 May 2022 06:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmYaj-0008Gl-Hz
 for qemu-arm@nongnu.org; Thu, 05 May 2022 06:20:13 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmYah-0003fP-Ic
 for qemu-arm@nongnu.org; Thu, 05 May 2022 06:20:13 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id v59so6784648ybi.12
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oCcmjq+KLY3vt2KkeOarmC/lBvM+SdG85UFm9C3o/18=;
 b=ck7isc8UC74dw3GSzMNIria59n0FzcjCIfneyg5km1ofMztVcCOVR2ciHZKKvSCkSv
 CNO0g0IeqQehbaojxDTcfT5pcKFypRnQB7UC/zs/jGl2EZco2oh88AEdSg4O0H8yNlbm
 wpjDkYopjDN9X3NGZlkBZoZy5f8inB+5kI7rJUMrmgtvPxMk4OgZPs2qKvjvUzIHB/BU
 s+OBalPrtMu44LTHa3B5gnvX+7ByeGXtR0kuuPxkQeB8kxkovzlJVnATuM5rE9PwDKtF
 Fzl8VbHMdA9Tu9Cx4d86QS3lU3nI2mXQKrtXa7ADvw4BjtukHIvFIfjyRIxqwCjNwOvj
 u0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oCcmjq+KLY3vt2KkeOarmC/lBvM+SdG85UFm9C3o/18=;
 b=vgxNoM8C7BwQyFrc1nyJcwyoGL2YUHKjSGPMfWltxLifkoM909Abt01SBbZ4RhKqdY
 Es9woAuZ3uoMe3daRANUDba7wW5DP9P7re964pFtdIhLWUZpXpY0211qRK6rWJ/PSKMM
 R7KWKSK60i5uzwmw4Rby9cYGhl9OqRdhN1JYEKeKQd62NF9KNjEeKXplfJTJ3ocRy24Q
 v8IY5rBsezOHjjtLqHDeEDeOseQJRFoL6/cnqhdY+wSScDYT6oS9wgPL10XSpIYQWFmx
 wRG6T7pemq2lM+a6NpTbmnzslsQVmtspjvvNhM9ZknMso8rm6SW5wFFUMgfeJHknTgrb
 63iQ==
X-Gm-Message-State: AOAM530EH0/bLHA9TJe/mHz6k+TNTJkUh1WYEvZFVPKATHf4qORGMA7Z
 0KjuJdWIs8aZ2AKyT7dV5lpz2SAOyFA9NLKS76A70A==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr21107949ybq.67.1651746010440; Thu, 05
 May 2022 03:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <4ad779bc-09f6-4041-d671-624fd0e22cf9@web.de>
 <CAFEAcA-8Awh2jbKTBCig7C-oAfVhs3iuP3E6EzkW=DVAKSZ0=A@mail.gmail.com>
 <b46706e1-cf63-446d-f614-4c6adf16d72e@siemens.com>
In-Reply-To: <b46706e1-cf63-446d-f614-4c6adf16d72e@siemens.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 11:19:59 +0100
Message-ID: <CAFEAcA_G_Ff6CNu9T2E2bj7UjovDy=DqPy79igoz=QVrh=TEpg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: virt: Add SBSA watchdog
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KNagv5faGiB8

On Thu, 5 May 2022 at 11:17, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 05.05.22 10:40, Peter Maydell wrote:
> > On Sun, 1 May 2022 at 19:07, Jan Kiszka <jan.kiszka@web.de> wrote:
> >>
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> The virt machine lacks a watchdog so far while the sbsa-ref has a simple
> >> model that is also supported by Linux and even U-Boot. Let's take it to
> >> allow, e.g., system integration tests of A/B software update under
> >> watchdog monitoring.
> >>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >
> > The virt board has a PCI bus, and QEMU has a model of a
> > PCI watchdog device -- the i6300esb. Can you use that?
>
> While one could do that, it implies using completely alien Intel x86
> host controller bits on this platform. And, thus, would require changes
> in firmware (e.g. adding a driver to U-Boot).

> > In general I much prefer it if we can support use cases in
> > virt via pluggable PCI devices rather than hard-wired MMIO
> > devices -- it means that only users who want the functionality
> > need to have the exposed attack surface area of the device
> > present in their VM.
>
> Valid point - would making this opt-in via a machine feature be sufficient?

I really strongly prefer the PCI device solution. If you don't
like the i6300esb you could write a model of some other
PCI device.

thanks
-- PMM
