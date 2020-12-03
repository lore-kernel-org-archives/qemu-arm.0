Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp301902lfb;
        Thu, 3 Dec 2020 04:02:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2Pvkjy5CH0FPZknsFMvxlq8OS+e8Ysv9h/bUtrTZX0U5ufi9Q/cvPB0cKP9QRWEJzAAP2
X-Received: by 2002:a25:f88:: with SMTP id 130mr3931018ybp.130.1606996964108;
        Thu, 03 Dec 2020 04:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606996964; cv=none;
        d=google.com; s=arc-20160816;
        b=UmG3p+8WIIhxZg60ZaUCXqABdmUA3MFYcD0NNUWG2ilYCx5XEgnF2g74tHwWy4BXYV
         6UuFwlyoFowj6+2QZTZfW9qsmM43LbkKuvBMXW1Y2Se5FBTioi8S2hXbKIx+YAtRpiMF
         xlCuyTmqB29DRaFD58WUkA/ub9NAvPoCwS4uCQ9ZdYp1tZMj402AtjwaZV3YE+orzt+D
         ePKUmlpPUsAYqndXwbdgkaP6xrfWAO7T1Vz3C+vTaxrEU0Yt3uhI6+CqZ2w7gZxuujq7
         Ji8nkOvpgPH+h5anD1L1+yBeXR/22xw7ifyhwZ2cY7MFu7tKGyfV2pdFYkdMXpEm8t3A
         yMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l2EX9rFVjdU8ZgSy095fWUbIKXz7hjNnhxld8X3d5FI=;
        b=G3chg/cYpUVpb7dOFtW4vdHDjEJ437EKcUsqCPnt+6kRKa4YvBKJmpHMQk8sq/gZsZ
         JFwqEn5keVM4SDmijZYk39EO0wHdpc2W97Ek6DLuEplMWX+K3zGGZwABj/qMX1k8+Kea
         8ioMDWe3JNbiO+qDcy8V3vVFj6VgsOGUUBmSEKAeP91wkv6TNOxmeKy15GBSvRbsCT20
         B/PRmGyAaSwRXh5ck/V2abD82xFfXqzgGI92Ny53v1+0TpSphJwpKEE60KdQSCOZjbkI
         mEvbbolasIPg3oEi3hEHamO+U6wDdVEaUSI6gK1vcPv86VjZOKB67pscswhs0VwY6lrX
         bOEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HdfeOvDK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si1718602ybg.353.2020.12.03.04.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 04:02:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HdfeOvDK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kknJr-0001hn-GO
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 07:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kknJb-0001gj-2o
 for qemu-arm@nongnu.org; Thu, 03 Dec 2020 07:02:27 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:42130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kknJY-0008O6-7M
 for qemu-arm@nongnu.org; Thu, 03 Dec 2020 07:02:26 -0500
Received: by mail-ej1-x644.google.com with SMTP id d17so3049423ejy.9
 for <qemu-arm@nongnu.org>; Thu, 03 Dec 2020 04:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=l2EX9rFVjdU8ZgSy095fWUbIKXz7hjNnhxld8X3d5FI=;
 b=HdfeOvDKg+0k+ivKN1VzVjNfTTmsGN/JGslYCvK52MN066+KjVXo8mCCCXcChoUlYJ
 S0D76iiQAApA1SwPpIOSD+LxwpCfPBW1mTrCaLhdeRPomZ/EfH0lRXPBHpOSNsRx27BZ
 xdEvVXGGx3Vge5AzbqhRyKbGpXeZXWRLk5XYbt8THj+rizAlIv6wQOT0txRYhyBUiQwG
 Pn7Dyv2sJRKNTnHxBdUDSYlrGUNNThU7JKlR75E6ZWSKp0FSqQkllJix/cFCfG7KYYq0
 LXl4YzUDScOFY+KBHg76dgXOq9w2HIlui6YbhOzEwvJx4a4WocRd2ts5obNTbw/Pu50z
 a3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=l2EX9rFVjdU8ZgSy095fWUbIKXz7hjNnhxld8X3d5FI=;
 b=uZXseO8t45+eSwRW8zUL41F2ND0Ze6FSr1ZK/EX03aO0U3Qp4LdrOA3WQLK+GRtWqs
 vJpDCnGHfDv99o0mp0JX8ZszCy5GEHKI5En/p4Xltm+P5H5yRLpssa0rI8qNkSUPJ3qC
 JeoKysoJbDfkK4gvLVmgv6N2SxKk2utm6f78Seaas0fGfsb5YcuAAYHUr6AN6CiRNpkV
 KStdhSIjv3ojNQoDfNQjuguHEXh4OBxfXCTr1Bcmg12OBSJHOEfQZgebZyOInrxlJQJi
 hNoWJc1c+29zQTAH8Jp1RJLDo3HSEEyzufYjH5dtQgr9GhsCXNLOjaPTVRGLqHrepQGm
 6pvw==
X-Gm-Message-State: AOAM531RRfvQFzyxHZAJQVfJy2NXQ/GuDEpPF3FnFOsMbJjjqysKVDEZ
 j6lUMxRBR1pJ1sI9E1N+RK4ymi9i9tesW89qyHZHtJ7UHgE=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr2154051ejf.407.1606996942513; 
 Thu, 03 Dec 2020 04:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20201119215617.29887-1-peter.maydell@linaro.org>
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 12:02:11 +0000
Message-ID: <CAFEAcA8kzf-PuETU=3WuDnwJ3Nw+MceO6UwEA5A_ky4a6nKRpg@mail.gmail.com>
Subject: Re: [PATCH v2 00/28] target/arm: Implement v8.1M and Cortex-M55
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yYR4Lpxo4dZu

On Thu, 19 Nov 2020 at 21:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This is a v2 because it's a respin of "target/arm: More v8.1M
> features".  The bad news is it's nearly doubled in length.  The good
> news is that this is because the new patches on the end are enough to
> implement all the remaining missing v8.1M specifics to the point
> where we can provide a Cortex-M55 CPU.  (There is as yet no board
> model that uses the Cortex-M55, though; that's next on my todo list.)

I'm going to take all of this series into target-arm.next except:

>   target/arm: Implement FPCXT_NS fp system register
>   hw/intc/armv7m_nvic: Correct handling of CCR.BFHFNMIGN
>   target/arm: Implement Cortex-M55 model

(since the first two need a v2 and we don't want to enable the
CPU until all the pieces are there).

thanks
-- PMM
