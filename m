Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5373406lfp;
        Tue, 11 Feb 2020 10:00:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEalX0yLXLF66+9LhtiG/vOWyjaYefN+Kq+lIDhgGB5YfcNI3zUPSDImUmS9IF/k/aG29X
X-Received: by 2002:a05:620a:999:: with SMTP id x25mr7172719qkx.87.1581444006793;
        Tue, 11 Feb 2020 10:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581444006; cv=none;
        d=google.com; s=arc-20160816;
        b=u65O8JLOGCG0TNZ8t2dLxtI+hgiqwG5M2aB5fvoq3u2IBTgD7quq8DdRK8FsHfpbbP
         J0oef7HQ5+ss5QJTJ7SSU0WpoiHLou+rQsYYqrd5ZmSjedw8mi6aJGuDAgvt+/0y6sVY
         eRQZgRS8+5z0+7tO2yv6aVqzxKxp9RIVA9dI9EL2GlX2BWtXXUmgUwwuBv9zOAWkMjbo
         btwvhrsTIhchB0xwSQewRC0f3FgAtisOzlOa89vx43dMPHwoImeA/CPj41BhLXODj95H
         5acKeKfIbhLzVbZ/q0iVBIfBbmN23TA3un9GuR9o1DhmeM5dEZ5G/ZZsaPddX4qkRUXz
         ozVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZSGbPEDVE8gssL6qNKIjRs0aIa+88scQYQEG+Ybhuk=;
        b=Xia9ZqbjzBYetPxaF9VfJUHID6jANIUYRGWbOnTM3lMluH8Mm7pNilNHxQefw5KJxV
         iuXOpcaXPdxFwpjmHxTAmCrkzyYiwhzvCbdy4hv/BW3+JWNqfXC6CqI69lFu9PVmtrtO
         6CFaNVo3ciEw2pYRRNbqBL4l397gD83hx7y/6TPxqj7ONa75bdTqRZJoIhO6LXApqAVF
         Bp7t9wesLagQD4a+C6uaorqexdExB6Ut7P42Ov7y2THuscBpxPmOtyKs3GDiRt5yMCBh
         ufOh+UEVjW9ycZoelYvQInpHGL3wYXbJpYjrpTeneu2cDAo1sQ5BnPjVp0bnPXwnDDsT
         UB3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v3z6qDSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d52si2253459qte.328.2020.02.11.10.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:00:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v3z6qDSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ZpO-0004aS-4p
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37807)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZpD-0004Zx-HC
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:59:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZpC-00025R-Kb
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:59:55 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38810)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZpC-00024Q-Fc
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:59:54 -0500
Received: by mail-ot1-x344.google.com with SMTP id z9so11015193oth.5
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 09:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CZSGbPEDVE8gssL6qNKIjRs0aIa+88scQYQEG+Ybhuk=;
 b=v3z6qDSlDyPIuaiKU2aiMYJuRHhyfLUHyKcWFm0vj2xH1PrLSphdkFGEy60nQLs2tH
 oXslC9x/w60CufQKPLmQBJOFKo1PyZ0wU/1XK76ylHyafuIPGU6UC05LjpOlxnSPO3/b
 T9S4rVaoVc465fDbx1hpIlRSOGX3wy8hDv0x4OCoCYjuqbgvLLyMn/I2gKFs+a3dL19u
 sGsPPTV5R5CURFbzAznrTNaGEmh052by4UjPXj9I6TFR5QJvyGkKXeAYJ7OlHwxO6Oqn
 H9xQGUjjG4AbA3lXuOnnuOfLM0SzMiN5OZVQ3yp+jC9E8wJW2Cz9k+C7J3Y+5I0bcDBE
 yGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CZSGbPEDVE8gssL6qNKIjRs0aIa+88scQYQEG+Ybhuk=;
 b=X4jSr3W1veGNV256arUclBg9k8gn+79Pf6n27NaDbNSmSHP3YXdw4+/PQ8R38G/JRx
 4QDoefZx0fL233im6TBYQzCwQcNR/D+qse3TTKT1UMWOY3SkOLgSuWfmH05J0tJq1hH+
 gz+Lc0yclQ6d5wJ3trkD/6hLUAWcCebE/IaRdn1HtWZ9nZIo/so6uKethC/7Km8pMwud
 wqReKGMD9l53FQ871X7SsSAQLagHxCr1tvgZxxQKcT1QxCWCpGWJyn20dk7o7i7xhN9P
 dAbwJQL3wM4DLRc9Ct7yTBVJYpZ1GdytXIqHOVlQZ59RTTBZsxPGe4uhKmSHMXotEQ8k
 H/Mw==
X-Gm-Message-State: APjAAAWhBRQ9pCABhMPT6mrpFLtaxbGTKxjqOHUyJ9yzxzhWaip0pSfC
 r+xDz1NCXZjIgIx+Bs7d/TqqtoA3vaGiEUn9NnePDA==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr5842415otq.221.1581443993597; 
 Tue, 11 Feb 2020 09:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20200207095529.11309-1-rka@sysgo.com>
In-Reply-To: <20200207095529.11309-1-rka@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 17:59:42 +0000
Message-ID: <CAFEAcA9VsZ6b=hX7Y6gFwEd8U8dWmMKxi+QVoWAj9Saj-SRBgQ@mail.gmail.com>
Subject: Re: [PATCH] i.MX: Add support for WDT on i.MX6
To: Roman Kapl <rka@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-TUID: zXiKIosMTTEP

On Fri, 7 Feb 2020 at 09:56, Roman Kapl <rka@sysgo.com> wrote:
>
> Uses the i.MX2 rudimentary watchdog driver.
>
> Signed-off-by: Roman Kapl <rka@sysgo.com>

>  #include "hw/cpu/a9mpcore.h"
>  #include "hw/misc/imx6_ccm.h"
>  #include "hw/misc/imx6_src.h"
> +#include "hw/misc/imx6_src.h"
> +#include "hw/misc/imx2_wdt.h"

You accidentally duplicated the imx6_src.h line here.

I've just fixed that when I applied the patch to target-arm.next.

thanks
-- PMM
