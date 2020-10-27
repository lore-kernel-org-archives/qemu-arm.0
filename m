Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3609296lfa;
        Tue, 27 Oct 2020 01:36:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+Fd82jv6va3dIFzv9YN+K1qjQHhp9++8hUwGTgeLHgZ8vQw+7IzsafcJUNL4vtpPbPCrs
X-Received: by 2002:a25:e80f:: with SMTP id k15mr1456506ybd.424.1603787812506;
        Tue, 27 Oct 2020 01:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603787812; cv=none;
        d=google.com; s=arc-20160816;
        b=HdBn5BYQdGBBOKeOnnOhkeVDYLw8LhqbtHE2gt0JA+qQ6YC1DYStzkfNi4iagxgNa0
         qiV23TWY7rBpUHi8eP9gNHCcVierG7fa0dBv/mD+3031icVpDrwaLtedID7GMfwcvGux
         grBtYn5kTMrr88uDotYHREuppdjDFoNTuLqc7dau1pMnJo8SjFe86Tx0e8MiXd8Qw1vi
         54ycNj7/+FuEqGygdoI59LSMmfZ3rTXHgG/NbNolkC9xKK8thowru6V2V1S/eJL6kTC7
         RYbVj2e5snBkbSLsQH/+6vzuDsqcscJ3l20uWDsolh2w09S5UAIz6r/wTtFxpU+ub1Jy
         koIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=CaL96iEgCuok2/I+7KQGOcMe4bmDpTV/ZVKiDt+5+PM=;
        b=fU6z3dOy5CnTodxssLY1BcX9C7ZaBvEQNhNj9GjwrCyBAqYjQ9H3efrLEBf56Gh/Sy
         +vcShupbn/SRYZUJ9Pt8S8XzpxFI5Ji7waYjqvyHP0UfPJi+q7FF2Webbqx/BzW2jGt3
         N81mJZFJobJjWUFUai6VdRfNb6Dv9w23V3lWXvyczU5mVREzoG1JOewAo9ZSftM6GcAa
         NVlaKFCmBsyq/W+qXPePPFQrRb+EmxWHdHU0Tm5dTK4yj5QuH3Sf0fg6Um6bzCymXAt4
         GqHpQAgRx+8bVK2u/Z5HW8MT3LJqNL84NcM4MOEo4MpBXAQd/PGzbDmqcR/MnezF02cv
         dObQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si922001ybj.11.2020.10.27.01.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 01:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXKTL-0007XL-QH
	for alex.bennee@linaro.org; Tue, 27 Oct 2020 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXKTD-0007Ws-AK; Tue, 27 Oct 2020 04:36:43 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXKTB-000428-Td; Tue, 27 Oct 2020 04:36:43 -0400
Received: by mail-oi1-f196.google.com with SMTP id j7so471892oie.12;
 Tue, 27 Oct 2020 01:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CaL96iEgCuok2/I+7KQGOcMe4bmDpTV/ZVKiDt+5+PM=;
 b=dRcKinstehXXmAGa4wnPq9Q6NcMVigxvWn+XcuANm2GvTII1Rcb5B5EEd1i2bcsdkK
 KMhXf2Sbthc+fz92Z76ek2Pe7jtVZQV907/1AEhzdU10wweEZLeDAFIAwyDLimFI1ekz
 yAY8l3lvg5FSylxka3Pu9UCaq5umEjGNjkPqJN+AgtLnjyrlFLw7gpiDWeUfaj0WfJnw
 lUUu9gUzU3l8L0hSaYwQ/COOrSRMVGHrob6+Wl1w5AZ59x4czEK7xqMs2b8ZIeIQmTrX
 vp7eUt6z+FzRXk7orvRLLvboBZ3oFflbwCXjY7W/NEwu6xgQCLmgAsyhobZMM1Rn4ZPW
 FOtw==
X-Gm-Message-State: AOAM531S7zsbPRD7mblSZ6xt+kXEiac8gMy3RlEPKcSrV1izniywWs4k
 HnzQmEU/L6BqBb+kpu+SwTGHM4X7HoYtYXCW8PsL2YWE
X-Received: by 2002:aca:5047:: with SMTP id e68mr637643oib.175.1603787800479; 
 Tue, 27 Oct 2020 01:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201017180731.1165871-1-f4bug@amsat.org>
 <f87cc670-a1c4-62ea-c4f2-5706a9af1a18@amsat.org>
In-Reply-To: <f87cc670-a1c4-62ea-c4f2-5706a9af1a18@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 27 Oct 2020 09:36:28 +0100
Message-ID: <CAAdtpL41q8e4B1RN-0TdnjEkwoOGcsWnNQ82H6gaBAN8r=mPzA@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/intc/bcm283x: Trivial tracing cleanup
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.196;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f196.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 04:36:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Luc Michel <luc@lmichel.fr>, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /A35V56PjaWC

On Mon, Oct 26, 2020 at 6:07 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> ping?

Oops wrong series, these patches are already merged, sorry.

>
> On 10/17/20 8:07 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Add trace event for IRQ from CPU/GPU,
> > use definitions for IRQ numbers.
> >
> > Philippe Mathieu-Daud=C3=A9 (2):
> >    hw/intc/bcm2835_ic: Trace GPU/CPU IRQ handlers
> >    hw/intc/bcm2836_control: Use IRQ definitions instead of magic number=
s
