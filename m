Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp1942028lfv;
        Mon, 1 Nov 2021 04:23:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5FaZEBkQmyH7PBybiSHBEkZuOqQq4BAkdzlOZ1OTi3wHLJgIDzDCdP74Taoqdd5JeVD1r
X-Received: by 2002:a9d:6b8c:: with SMTP id b12mr9753933otq.341.1635765784840;
        Mon, 01 Nov 2021 04:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635765784; cv=none;
        d=google.com; s=arc-20160816;
        b=tByB1WChkgAKKcUd4aOqtoNw5gb1dA4On1Pk2lkgUdpbxGOFwFUrOJcU8YloJvWryg
         q3Y4jyBIR6HYcioHiyyFqSilWciNGWGe/XieQeDkfS8NcBrtmPW8tUwZMPmXTtp6aKtR
         nrCGaKaAG+7UpVqGRAKo+AYV/pl+lrIjUEs1y5mTy2Ck+Y7e3ox5Q4Lw9Zxmj0oelzu7
         vXkw74ypR2/yuGnJZYk5NqcM4z4bIGwP+26MWQiM2pYIE6tTK9HUMNMx3Ja2oy1DQwkN
         ViSJWjVWny0Ohz//pRCOm763R9hWr54oONxjmNHUmazYslohQYA+fVVTq3AtQEi/Hp5Q
         jgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SqdbSJaf7zs7O2VprUdgSGlMoh2U0zGtsbN19EkXrmc=;
        b=hxPsl8nIogLP0qEfXSDL9CHuEb79Qxw342xc14y/9z1kkDPsu2CP22iVhlqmULnSWg
         pH0sW8wxyC2AUF7UeYTnab8XQJbiNhH78aGsB0TwbfwAXTD4ZmLmRl/SHdn74EmQWtHx
         lonc3prNVsNUiQd/yDp0doQiSz98AdRCsVNCledshVZsbZ7sMtTtWK6QOm7H8f3rh8tp
         +iqfVoLC5iBcBrlkOijhU2qo6IQl4MvYMAMJAT/hFwij+UQiAl/iMNSg67sYe0w3KBFM
         wwoKzVZawUp3GCxeQT/ex7WKCd7vEKGdSVpUY+0JLhEN13lWChS8csM3UplqNMwqNRJ8
         qprw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e5RKuZkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si14460681otm.294.2021.11.01.04.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 04:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e5RKuZkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhVP6-00029E-11
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 07:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhVOt-00028Q-Pj
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 07:22:51 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhVOs-0005A0-AY
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 07:22:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id k7so27565500wrd.13
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 04:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SqdbSJaf7zs7O2VprUdgSGlMoh2U0zGtsbN19EkXrmc=;
 b=e5RKuZkXByiJzgaL34rnu1JOWPsygcZWPiEfTjWzvYBTbVijD/62zRZy0rYyEW+92v
 CegggPdrATFx+wlm084nuW7w9VXKde6Fo02TJmwiMpZzaCjXG7/SMp13iaAdhWxVm5LD
 /83+AQn9fiJim5Cr29UlI89Ak6Iw1Xi0qGD1BRJ3MKvOleEtI5b5FjsBcXmDROCl9MRj
 HEQ8Z7IEfqUr7KkYkF+6WohPA9S1mjUlR9MZBXSAdrI3Ir5wDbuZi7ZOjI0u68QlHHnk
 ft21XYv9LYPwWdDgNNTgfnZ/UhOnz0tW9B5rj/2YskxlPSacBlu/r1St0qWIa0Zt5hKh
 eiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqdbSJaf7zs7O2VprUdgSGlMoh2U0zGtsbN19EkXrmc=;
 b=GKPqNELc4Y7dnKB5e4KxTmIYCeQkLNhAsKLgKcvBx8oYBVN8fZmgfl3+DzPep1RsH7
 U9JyUlrNMFSabh5eoDMvmQ4EViFEYki3AoEOCfVSC7XG1P1Em++nNj9oY2DdHrG+AYTT
 30nPCGozbLSkZRKA07Ho+oteCMiOnlHXZpMzYUjc4ceUUR1W9qCO6wTDjgnt+voYHWbz
 bz/H1XvcOqL0jNRnN1kbP/L8csAnXWetQpInPlQ++vnAJWetIu4wScGZnH9K0QmrJ/tx
 Xsa4y+p4Baigxm9MQ+HYKWALrJDy0HZM0UmwvzLu4H6Z+n0o2W4cjcTiOr8TVK/3BIQW
 z22g==
X-Gm-Message-State: AOAM5314w31cF2v5Hlxt5V+F3N8Jh0pcWgiM6Xvo02/TAPowbOwyxmes
 X1xzcNXM8yyn88aSyaeSm7a6ohn97jGduD+U3rSO/A==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr37209491wri.376.1635765768793; 
 Mon, 01 Nov 2021 04:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
 <CAFEAcA9_nVnW3DnvomvytX8xH53KM24xfn5rCSywa3WWCwEZ4g@mail.gmail.com>
 <BYAPR02MB40381A62103A15406DB2132BCDAE9@BYAPR02MB4038.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB40381A62103A15406DB2132BCDAE9@BYAPR02MB4038.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 11:22:37 +0000
Message-ID: <CAFEAcA8CYB_rd9BotA3jE3bxSi-Nv_fL8uDz8PxsgxNsa4KR1g@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
To: Tong Ho <tongh@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LjnBX6eigcTy

On Mon, 4 Oct 2021 at 16:54, Tong Ho <tongh@xilinx.com> wrote:
>
> Hi Peter,
>
> I will follow up with patches to fix the memory leaks.
>
> Where can I get a copy of the Coverity reports that have the 10 issues you indicated?

They're on https://scan.coverity.com/projects/qemu?tab=overview
You'll need to create an account and request access there.

-- PMM
