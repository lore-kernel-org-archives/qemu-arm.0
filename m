Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3599083lfm;
        Mon, 20 Apr 2020 02:05:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypJpZDPTDnXflKl9B49LaSfVYD/cBgpJgthcGaWmXHs6i7THX2hyiNE9IZAFmcvHT6jSCTLx
X-Received: by 2002:ac8:17c5:: with SMTP id r5mr15128744qtk.118.1587373537949;
        Mon, 20 Apr 2020 02:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587373537; cv=none;
        d=google.com; s=arc-20160816;
        b=jiENr7xBbdMQCwrzacFWMr0+56gDk69WwiHcXjlIuKBFLcXJSt6S7tozLao6mhl45z
         iD+nzqFfzv98B7bYzsmFlk0rTvG97wGoADTbYepCngdzNSgC6E/+V4jIZqYsm8bsExSd
         R/6H3GtmY6ZapNg9zUS2PN277N8iWSvUgUQ7d3rXUbEz8IRbfNwHSmImxNruOS8DvzxE
         zhc/uWW+N49URGbCjxanBpY6t1MX6H+9YdnFog5/OwdyWg30ziEjiQa9PgskKLwvGLC+
         GQ0d2aSEwZPO9NOJCEVt5+gG2wo5DZbFkNFSQEbbBgsWOs/Ie3/I0Wxa80SfHHms+IAE
         JzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+aRwRBujFFd4qByOEjYnIjVKWb5J3NYVKXHhT+5ioFE=;
        b=WnSTa+yby43kX0MvZ407l3o4ZphXM93+Q5Od8GQfHSGIqmTTB0I3ShygqGwxPD0xJ+
         CQvMBYXbnen8847j7sGt4JR3G1LecNFmkxCL8qIH8Yrt3FkFaXumDYTspNhy/UCnQnYM
         MVJJJjNYuM1LbNRCoCl2uD4yfe/eNzsbjy4Ta0E0irQ80/ITRnJvZs2dXEVueRpvahns
         6Xv80NXM7vzEACTq1emqCUsN/RDDKwLsSfPR+0dRSnWsyaGYAbM6+TklFdE+uHbiDZ4o
         AafONA9xR2SkV/Q/+v0x9x8Zayhny+RW+a4I3maFGYc9ADPR9eg3ANXYQCyGoaaw8RbL
         ZnlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pZerwcfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si187061qtp.275.2020.04.20.02.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 02:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pZerwcfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQSMz-0002vp-CA
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 05:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQSMp-0002us-3M
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:05:27 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQSMo-0000nF-EF
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:05:26 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46135)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQSMo-0000m0-1f
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:05:26 -0400
Received: by mail-ot1-x344.google.com with SMTP id z25so3977537otq.13
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2020 02:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+aRwRBujFFd4qByOEjYnIjVKWb5J3NYVKXHhT+5ioFE=;
 b=pZerwcfb+c9gWQUCKLHgMGLstHQAduAUkLOLPKT05mCM9H8Q8qpDUZDJLHX5EhbTOv
 c4joO651dkDlxoJdCTrzHCaGQV6qnDPqz84omQQfggnbzZx+t9YykQP1w/8yJUmzOdBl
 rHa1RDmZQQMd6KePuvE2yq0ZZmDas+NgdODu+gyI2GCp/k1r5dQYoNi/RuuxfRJcQtKG
 4ksEuJC6QkB06bnphOUpUJV9VnBG2XsZ4IQH/PayHYady+/NCXpTfdgBz2Bi+PazN3aw
 qTf71AQ1vYfb69fcS0WCYVrSjRMyIlj+eAeiSu/1O41wSoLv8RbISvKhd2dhEv9Mj6Ry
 WMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+aRwRBujFFd4qByOEjYnIjVKWb5J3NYVKXHhT+5ioFE=;
 b=g9PAbaMKyCcAWJae5YjIoenA3qitS/71AZ1gLCsOu9725SO2zm0NVAwfu04Tdl9HwJ
 GbxcQ2GiMcULeGTI6stwi3zVVscT4NYa+CynhwRNzsJWE3kPb5UeWULizN80Ybd7MPvv
 NU+5Bd0oVF5NTSOA/mSwmgfwUcGhfdO/OdvEckVp2CGQAm87RdRqweAqzrS/S5vDO+dn
 MbactCi4hB9HjjC6agu9wS3bwpjcpYCSm2HvXETH812Y11ahfYUvpiTx0jane2WpH61p
 lRu3uIpVX8rsLtj4eahoYhHCZSG9pfWAQvtOE2CFN3sM706fq5GrGiwBH533cjWY4lNp
 +Stg==
X-Gm-Message-State: AGi0PuYkAXdm8EqDInKBJOjAuroDKiOiSPvE50fhvbtwwCxP7i3MOG2W
 X5gxhEN20BI0gv711hAHTD9VLmCnBfG5iHJYdf1ZPA==
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr8926514otb.135.1587373524829; 
 Mon, 20 Apr 2020 02:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200418085145.489726-1-rfried.dev@gmail.com>
In-Reply-To: <20200418085145.489726-1-rfried.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Apr 2020 10:05:13 +0100
Message-ID: <CAFEAcA9ODtKo9K84wkArjvPWNKqD6NhuN8r6gt+ycLLXc_Bq4A@mail.gmail.com>
Subject: Re: [PATCH resend v2] net: cadence_gem: clear RX control descriptor
To: Ramon Fried <rfried.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 50plR2NUTfL3

On Sat, 18 Apr 2020 at 09:52, Ramon Fried <rfried.dev@gmail.com> wrote:
>
> The RX ring descriptors control field is used for setting
> SOF and EOF (start of frame and end of frame).
> The SOF and EOF weren't cleared from the previous descriptors,
> causing inconsistencies in ring buffer.
> Fix that by clearing the control field of every descriptors we're
> processing.
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>



Applied to target-arm.next for 5.1, thanks.

-- PMM
