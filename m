Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp451431lfg;
        Fri, 5 Mar 2021 07:34:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDkH4EVBzLafMWYAXaMAR1zyR6+0H1k/W8PDkx08rp183xgLnKF/IMsl+snHR0PYk3U8ZZ
X-Received: by 2002:a05:6e02:b4d:: with SMTP id f13mr8867204ilu.138.1614958492359;
        Fri, 05 Mar 2021 07:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614958492; cv=none;
        d=google.com; s=arc-20160816;
        b=1HFf+te3wqSKj9uH5/9bdED7Gm9gUPXgKIYFxXcnMaSro1BOoafNgIYUomrmyTF7qv
         vrRvftc5ly+axJ912IRV+Vsh+VKlBzB9LQo4CFuTJE6XcK2JCDQjMsr8mQkWGYwJkrA4
         z34gj14uYrz+9BiVoOK3QFf/IQn017q/NFEe1rILs7xU9bk5b0tfkHwyYL+hqBLjIOY9
         e/QiGcb4+UsQxdcUWEyDw8lsb8r/0r6+1kkDLS2ZnuRROafHvc7NA1JhMN1lFgj6i9OY
         Z9D+KFmz8U5Njun0HqK7A/KKx9CfccxX1+1g1hLKvFdurgxdzinlvvI3nq/BjjEfaZcR
         DYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=78+z7dCZe/BCWEvPqFAKoAuvdhWs2i5RrvNuWubjs9Y=;
        b=0F96O8GzuKdPIBHfGFh25Cfk5Cwm2ToHloPMQj32XaFtf6+318GUpIXiDJzpkmL/CS
         18Y6tY6PYGW+mYJ/hsslH1MSyQfY0O/Y+aSR8yv2RZePs21hXi8dsOexyeGEtvSy2dGr
         tz4PRO2u6HM15gSSzwKaRb1t9zcpSmlGbvR3mDszZmoAl7RGR9tXw66DnUGlML4QlWLH
         t4nl9joL7f91quZ1vzyvJ/N4ngxol96ktOq7P/ARqUtWONiEHAKU8O4WMjeV+mLBMnr/
         LU1n/x9UtHYLONQMxkOrrikIVyL6GMrOCOQV+KLoGRhJwZna7YWIXlX0NKrs6ruW1F/B
         9VsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HFoYHiGq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si2444416ilv.160.2021.03.05.07.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 07:34:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HFoYHiGq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lICTb-0007mV-MG
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 10:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIC8v-0001Sr-3D
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 10:13:29 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIC8c-0000wY-W1
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 10:13:26 -0500
Received: by mail-ej1-x62d.google.com with SMTP id jt13so4163405ejb.0
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 07:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=78+z7dCZe/BCWEvPqFAKoAuvdhWs2i5RrvNuWubjs9Y=;
 b=HFoYHiGqI2E4dbX7Tq3Y4T3U9RKqKGeSbL5VNnKvfTTW6zk3CTl9uwF5pnFEnhl1ak
 C5HDH6l1NESY8BXcv60Rs1sZoNzmXnOp4Eol2wSHzkMgttrPMnd6dpbVdxpKZTbVOsLT
 G0Zo3xSvx0K8pAE+bfoA5KHK6Rz21rS2Ix5ceEXQRay0D6V7lSvUb7lwdxYdbBpftH3Y
 BTlOrruDbzyhYiWiKRjrKHZk2X69JCZg+2gNQfiwqbrWCPPKVz5h5VF2vKIXZkW2MgtG
 K/L+Am6xWbpKeJRunemYdQvk/PItdRjbKAV1ENDuSMjwaS2KY9aeKZOknj1MdeoJitXs
 gvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=78+z7dCZe/BCWEvPqFAKoAuvdhWs2i5RrvNuWubjs9Y=;
 b=sbJW9uDd+JbHbzMzIMxP1U7uY+lEST7a2R20xb/0tUwZlf5Vgxp522lZ1T4FRtXTi3
 DJH1jLvugZfeX+ReR7o48XBY80++05xntDYesjSAk4FNybPJUoXMaNqPbNuZEpGA0HRt
 X5QNY/U7QGYO/cMJ6MlhlW37libWQoW1+LXqI4LY+TjMJEoO/PaKiHixfshjlCkl6ShL
 0lbzhgimMt7YKrf2NE0FccncAA86RGTorR1k17Rb4Vn3fRmJ37prfxo5fHwhX0rohCmK
 2cdHp9z50Wp301BacI3n8he9+cEZTwfVATWfd1MrP11wNVRC5E0I7UlGcUrgfsdYqjAE
 3pwQ==
X-Gm-Message-State: AOAM533471DzKox680SZxYzTaV5a7Fu+Y2jSvU1mlcUVTvChwZdw5bIL
 ei9zGINAPqw1WpEiY0iWJ43Ld7x3nO7PzvlSiHFicQ==
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr2648904ejg.482.1614957186080; 
 Fri, 05 Mar 2021 07:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20210304123951.163411-1-joel@jms.id.au>
In-Reply-To: <20210304123951.163411-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 15:12:50 +0000
Message-ID: <CAFEAcA9jux7H2cAwgrndvUv5=fivgQwbWDUEbU7rv7xUb=rz4A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] tests/acceptance: Test Aspeed ARM machines
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8GmPUYI6Dpqy

On Thu, 4 Mar 2021 at 12:40, Joel Stanley <joel@jms.id.au> wrote:
>
> v2: Fix ast2600 test, thanks C=C3=A9dric for the review.
>
> This adds tests for the Aspeed ARM SoCs. The AST2400 and AST2500 tests
> use OpenBMC images from that project, fetched from github releases. The
> AST2600 test uses a Debian arm32 kernel.

Just a note that I'm assuming that C=C3=A9dric will gather up the
various aspeed related patches that have been on the list recently
and send a pullreq for them. (Having been on holiday my to-review
queue is pretty full so I've just ignored anything aspeed-related;
let me know if there is anything you specifically want me to look
at, queue, whatever.)

PS: softfreeze is 16 March so a pullreq on list sometime next week
would probably be the ideal.

thanks
-- PMM
