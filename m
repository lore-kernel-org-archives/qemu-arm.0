Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1368221lfc;
        Mon, 9 Mar 2020 10:09:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuqXUSdxLrc1LDWaII22EbMhoxtBcZn6z/jRkth96sLJlDP4wP2P/VNGV5zLuCxJufZoQzM
X-Received: by 2002:a05:620a:a90:: with SMTP id v16mr9824651qkg.46.1583773783849;
        Mon, 09 Mar 2020 10:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583773783; cv=none;
        d=google.com; s=arc-20160816;
        b=Cou8FjjexkZrN3Z0SNLiTH4v/nPUGJmx+vOVmRNR9KcS9Fsulc0arp0BddpbeIYKwz
         SSmf+XsmsIAXXnsg+cDes8I9z083R9E5dXnEfz+3AthyUyh/Sqladd433SRAv1kdXQB6
         SgnMaT+/DpRTQ8Og7XDHO/0/o1T7pREuYQU9ZffFYmdwIfHvVhu5h3ftIecb+3BDJfME
         Xvurc0p1/Lvk1TW5qX+xcJHvS6l+ayAJS3tjYLRstmAOSZLF+bb6VKJ/ff15D63r7LKy
         u2FlatSOtHbbrO6+W6hoqwvMbGvk8wZ2/y3OhEYjbYWbVYcjPIEPNdNIrrH6/qpZk9cu
         V0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4YR3WLemMhh2GvPEM0MGp2LdO687Q4RFVclOD9Kaf7M=;
        b=L6fnw17Z0bZPW4rmsLc3dkXTwdePwXqm5IC17C75N58joluVcdbQejJbbORK60bm/w
         1YPvh3LVokkB6DVCPx/3SNCt3ADlzKNjBo8jLH13T6jmnaiz8nkXIbYjF0osczDXqiBb
         0MB0sHqzv8/nF/3IKQbqcMOrbHdlvnabe4yO0noZOYNWV7Ar0jGX7OevQDscNiQ1b+4n
         /Itvq7jebgqXupxjAPcPh6jChxTAfcHHCR/5Kpbp2mFI1UczUhVUx737WWzZ7YmV2D+E
         zD0Wr50qFmxlbpcCIDRZI+Ec1ZASra7cvCL9a/CLKb6fNveWmidXVy12hiumlsqx8WpA
         ZuuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qpdMTxR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e50si1160402qtk.304.2020.03.09.10.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 10:09:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qpdMTxR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBLuR-0004qB-9o
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 13:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBLuJ-0004pq-L6
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 13:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBLuI-0004Sb-HH
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 13:09:35 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39764)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBLuI-0004SM-CD
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 13:09:34 -0400
Received: by mail-ot1-x342.google.com with SMTP id a9so4098704otl.6
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4YR3WLemMhh2GvPEM0MGp2LdO687Q4RFVclOD9Kaf7M=;
 b=qpdMTxR9Y7falk+VKMteP7Jm0YUVuQeqKwswC1pJQ81EHL0oZjnAwsTdCbXW4TCJLz
 XhIvh4FXklZYPNn9Gf4u+GjHXs2nwQ8JuXyRZAGARCO+s0V7ARAne8wDcLEzkrNTTRpT
 45MZ9lcqJUp+84ekceVV2AkUlIdL1NW4ThW2EBEFmP4rJ6vv3BYxF1WBrm7VatOqBujz
 O/k7ylJdH57/mRzj12BQ3ZUDFfRYBUsdCNOfJc2jxAPdqR98o7MQ3bNmQNKHxuYe6Q4Y
 6IorAJ10UcbVxBZA/cvEq/cNKNQm2/gsbxZQ7ScNgxrg0Km3AdqIYWUbrwOwkNsAlv88
 A+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4YR3WLemMhh2GvPEM0MGp2LdO687Q4RFVclOD9Kaf7M=;
 b=ixgbhHsK2/L0sbps3xThhuXyCiZdjcY6PfszWPcV/On0MN7PUTz/VJp8OkNiqs6qdn
 IQHo2y2vPfBvXo/lxx9nFNaofjR+0OCLyhKK9Z8Hvu+ytccfF6Gjcc59a+vKMfKNs+JC
 ywRdNMZJfmWAtCK1itP7YgTe01abPHjSdR6hhYUjiMl5KY4D1Bauwx9/trEtrAVhp9HJ
 4YhSY5l1iGjBV29avU/xfDMrxxamG4/+4fA1z8FxvfmvaUab/ABprluugboZ8pky6LMu
 J4coqpHlwn9Uv6LxK1vOVkpaqCMJCA0k9md8V/BKYgjTD2OaQH65lipUM9LFZu7PjbpL
 mEZA==
X-Gm-Message-State: ANhLgQ37cn7Cskr1E2o2WZtqIgoo4GwfusJURdzr+8NMHn/nfQ8GdLda
 wvCo1TAFZgb2eFufYaBoXT+8JVJBS0b0p7Pv76pCoQ==
X-Received: by 2002:a9d:6c05:: with SMTP id f5mr2940112otq.232.1583773773037; 
 Mon, 09 Mar 2020 10:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200301170443.12904-1-linux@roeck-us.net>
In-Reply-To: <20200301170443.12904-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 17:09:21 +0000
Message-ID: <CAFEAcA_VuY+1egn8B6=Tk8PKGuhAPuP4-=pwuWHQGQsfdXB=dw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Wire up USB controllers on fsl-imx6 and fsl-imx6ul
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xXZ1UBccVQQv

On Sun, 1 Mar 2020 at 17:04, Guenter Roeck <linux@roeck-us.net> wrote:
>
> This patch series wires up the USB controllers on fsl-imx6 and fsl-imx6ul
> emulations.
>
> The first patch is a prerequisite for the following patches. It provides
> a dummy implementation of a register widely used on i.MX systems, and
> specifically the reset behavior of this register. This is needed to make
> the USB ports operational without full implementation of an emulation
> of its PHY controller.
>
> ----------------------------------------------------------------
> Guenter Roeck (3):
>       Add dummy i.MXS STMP register support
>       arm: fsl-imx6ul: Wire up USB controllers
>       hw/arm/fsl-imx6: Wire up USB controllers

I'm not a huge fan of the "dummy device that's really just
implementing 4 registers from the middle of some other
device" approach. Unless you think we're strongly likely
to want to use it in other places, I think I'd prefer
to just implement a (minimal/no-functionality) model of
the PHY register block.

thanks
-- PMM
