Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3226777lfc;
        Fri, 12 Feb 2021 06:04:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUOZiwVTIPn3ycYmYD2flxG/Pa0FLPyx2LOYzoq5UKbXrl88B1b9AFDtSA0d/8M/6nLYrz
X-Received: by 2002:a25:a241:: with SMTP id b59mr4395886ybi.289.1613138656541;
        Fri, 12 Feb 2021 06:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613138656; cv=none;
        d=google.com; s=arc-20160816;
        b=e1TNtWPy4EqSeXFIjaN5pk/Da7a7DmaXN/6nWmSrzKGF10BIpbUDbUHiFh0Uho8/Jm
         8Bdb9c3F2z15Kh8glie/fhKPfVRV1cqF18AmRCpuC+wej0RFXSZk/POYfHxUBY5Z6814
         UKF1xW/8Q8J3m8ue0ShYcBW3oVGyNoS+Fk6VnBRZz25SpOJ9lFMsqVd/TEdm3+GRiDFA
         O4UCH6OxnEMP3AOQtpWpRVgC9mH2DUYJ6BqmqYp1osY6B45xXuOlXTgoOeP/YMtm6bfF
         kqfLfYvZ2/qcbMLZBhsATXqlgAxUYAYULUEuBONshvDMsIaUokjQ/irgw8PlOFNHQZKV
         zCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fF2W9d5LCIknpBvbcOHR3rE5jcx8+dqxytYCzruss0c=;
        b=UbMkqen/Lgb8yxE0iWg5FGroY0VaorWrywN8g5Yp1RprDwM/OLBs0lGpl0TUB76HA7
         yTT039bo9dfIpLmLywLHCXHvM8YtVjKwuPcTDi/04P47HHG/duFxBd/mCJAZbxASybB+
         cG/oynqhMj1y+gYBJ59X7zz/b7q175RTeKd5TxSpFSUxqhQtpriY7FPHP91cilunMXqA
         nmf/r0IqdB54N/MrFtW+DIQ9bVA7DgxQBDoK/0lhxBtRxW92QhUSD8LF/SuMFFib4dEI
         XygjkFwpUHf//TwZ9cMizXH8L6CXuv17NqpXEDkgzUtSyfDWuKAYF60CwokOA0hZDLjs
         8vEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dDhsn7zw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si8468560ybc.292.2021.02.12.06.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Feb 2021 06:04:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dDhsn7zw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAZ3P-0007sw-Ut
	for alex.bennee@linaro.org; Fri, 12 Feb 2021 09:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAZ3F-0007qU-81
 for qemu-arm@nongnu.org; Fri, 12 Feb 2021 09:04:05 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAZ3D-0002ZS-Ek
 for qemu-arm@nongnu.org; Fri, 12 Feb 2021 09:04:04 -0500
Received: by mail-ed1-x530.google.com with SMTP id y18so10936482edw.13
 for <qemu-arm@nongnu.org>; Fri, 12 Feb 2021 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fF2W9d5LCIknpBvbcOHR3rE5jcx8+dqxytYCzruss0c=;
 b=dDhsn7zwR07rShUkifY0jCaVqUEgnUwNXN2puZJzDfXWNRPpiQDBVU4DQNvX3KfoPe
 YuYySITX3bI1HUp3O8JasOBzxErDQsUixK73Bn9ecVsJoI8gMr2pZwts4ElmJpgZukI2
 B79VvJZnd5lPAuewzhbHHookBncoXbVD33FhUpNmWDhSjWFgt+ySrRUZ6SD/vlNLzlEe
 ulsglcxEaYIGLOxK2qF8XTkszpa0LNgVZyGxCLp1odkRQUOeXcu1L5xbG5Kr4ia2FrkR
 ciJF3xxUhvEFYp9wje5jyyoBZQSJJQUiNUNpjMkj81ohc4/k8gOOx6sPGwE5bDXaQTkg
 6NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fF2W9d5LCIknpBvbcOHR3rE5jcx8+dqxytYCzruss0c=;
 b=VGXlGTq7eTlXREYwwt4MxiplMVBbR5fEAv+Dot+7+/AZP5KJJgipwtc3PrQNSdnc3D
 jj1OnBMurkE9AD/viVtELNTJdCrN07bGo+Wtntm15QVriaTtp8iaJHlogZXm139sq9SR
 rkH6/zk3yLp0WgNYo/uRsF2WWPtlk3KeeH0mgTlLDKjc6kvnepouisWHJHPbJLf3+BzL
 1eqFC+RRjq7tBRWQm15pHbpi+PUtMDLMsqHMtkR4o9C5F+yw4aqS7Mkj9gwhrxC/h7mQ
 7CFrJMpD9thKfUJumxZPmoMbn3KVUVnJrDKk1dlu3qJazOMN86S5IZ4BhbLcrodLplzu
 /Lvg==
X-Gm-Message-State: AOAM532BDJFmtEbWeLeP0diN5J2m0nDq7BAsVpqJiath9QraFBoxuMut
 mmdjwcTOf637ifNrCx2HIU7SOLTgIHWRZU+venHxPQ==
X-Received: by 2002:a50:e80d:: with SMTP id e13mr3451195edn.251.1613138641806; 
 Fri, 12 Feb 2021 06:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-7-peter.maydell@linaro.org>
 <CAFEAcA-YqMQATkQXFZHQNy0-JeO2cFvmuHdnhF1+TWAHgf+tcQ@mail.gmail.com>
 <c4d9df9a-21f5-524e-abfa-dea2ea1ec16f@amsat.org>
In-Reply-To: <c4d9df9a-21f5-524e-abfa-dea2ea1ec16f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 14:03:49 +0000
Message-ID: <CAFEAcA8YFX+F6LwLAzQh1r=hAzn62h2xxv4FjfNdyn6hgwiH=w@mail.gmail.com>
Subject: Re: [PATCH 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UVZzs5l2qMYt

On Fri, 12 Feb 2021 at 13:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 2/12/21 2:45 PM, Peter Maydell wrote:
> > On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >>
> >> MPS3 boards have an extra SWITCH register in the FPGAIO block which
> >> reports the value of some switches.  Implement this, governed by a
> >> property the board code can use to specify whether whether it exists.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>  include/hw/misc/mps2-fpgaio.h |  1 +
> >>  hw/misc/mps2-fpgaio.c         | 10 ++++++++++
> >>  2 files changed, 11 insertions(+)
> >
> > I changed my mind about the property/struct field name here, I think
> > "has" is what we tend to use rather than "have". Trivial change
> > to squash into this patch:
>
> What about "use-switches"?
>
> use-x: 12 occurences
> has-x: 9.
>
> Is there a difference in the meaning? Maybe have refers to
> something internal, while use to something external?

Generally 'has' (or 'have') means "configure the object to
possess this thing", whereas "use" means "the object has
this thing; configure it to actually make use of it".

thanks
-- PMM
