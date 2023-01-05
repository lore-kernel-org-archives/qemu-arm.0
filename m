Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp453345ejb;
        Thu, 5 Jan 2023 08:57:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsAiGshYZZ+fCcEDaDmiGT1lBgRyqy7YKvbTLeFxV/vunm7hODnoDcKexoRpLAIO+kmAjgu
X-Received: by 2002:a05:6214:368f:b0:4c6:e970:e251 with SMTP id nl15-20020a056214368f00b004c6e970e251mr91301281qvb.0.1672937870444;
        Thu, 05 Jan 2023 08:57:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672937870; cv=none;
        d=google.com; s=arc-20160816;
        b=KXATU3hcY+8C/VI2JtfUFPUqchbtMq2+QZK/LYIJ9p2ABJtzJP7dyWlj2dWY2izaWF
         Rikcr2hS7FyYDlBph2l9eySFCGoOsHr79OB8eZ7vXKrMTHEDSqZMJdhIL2VY2dlcWofn
         y6cNClqjOiPkvdAJFeCIltc3cYR3dVIguEVpA99ioF1uQ4EqdjV2TdM7i+KG/6p2il0I
         asiq20UVEAMxaeCdtGqkNUHlmuJ7k5otgAmYbCH7PNGeq6jI0WXZOXmnTtqMlSttA8e5
         Q7BFG14dP65rHszgxh+DoD7JtUZk4G3PMTNKJzJZio0KAG6Hu6q/XSSR61AjDN3DhxJQ
         SdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rGtRxuXL9poxRWlNrH5xQKN+RfdxdevozKxSbPlo2EI=;
        b=S5F065Hv7Zlf8CPGkvPYDXriCVsrNJGHe4fnxG6oeFy/tWGfz7m3zn/pgFCj2UMnP+
         Kgpdc6CxpK8c4A2KXnYFKA7E2GjmuJprnVanBe7EuGtEZ78aGaWw9VXa6o1wWSwENCRE
         IWH5UNHlun4Yi+KWffHvh93HHjhosm+n4WHfcjawEnSBgDS9O4Axb9WOjw0ItiIzUI3A
         sdt7qPnSx64x+BwWAQ8eO/Q5oopg3JnmU74DZeKmRs77whbenkZze/O3ZWjtxRKTyEJU
         lw4LjNqiyKbGRYg3GzsyghsvahzpMQFfiL068H61F/4qWmUlduYHYnPGVPOstzeh5IK9
         E0Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s105/w9C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw6-20020a0562140f2600b00531b4817772si10904542qvb.340.2023.01.05.08.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 08:57:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s105/w9C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDTSG-0006T4-7o; Thu, 05 Jan 2023 11:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTS8-0006Qg-IE
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 11:50:53 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTS5-0000ix-CN
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 11:50:51 -0500
Received: by mail-pf1-x433.google.com with SMTP id 6so23001536pfz.4
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 08:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGtRxuXL9poxRWlNrH5xQKN+RfdxdevozKxSbPlo2EI=;
 b=s105/w9C5UPSfNSZIYZWJLYonE6u1QM1UlIjrKHNgjlRcKRooyoF6PWClkDIto8MM2
 /faO2vWCZv1LYjcWjVBNrum7iY77GbHXKCJLwuFCru9IUs263A8IBGHfKwN7bL72ChQG
 yxQRJ3Vfs/oSbAQe0ufSRO7uDkONy6JbMVITfK6kfSQZ1QN7OvB/nYx8LJTBjRlWdOgL
 xY+w0Rha1EAtYeotkJF+Q5WJyFHJ7wc8CsVnVOjDfU6CJMjQQEPos1c4VJWIeo/v6TFm
 cy6H+A+oH6WnFEZczUEyUovJfDmPBDw5V8D+tXLeFm4YvUTESmltb1f790GJNteiKojw
 j+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGtRxuXL9poxRWlNrH5xQKN+RfdxdevozKxSbPlo2EI=;
 b=OrNc090L6fzRfdRmEwUxLCfgbZcrtIj7Yg/9u5vZYS71vhcSJiT800IwweVVuLt/MF
 pbJ5/D1DzxWMODKZOmqz2Wf4R3GFoRSc1Bgr8IAHl2azitQiZ4hpNaaDTv3m9RjkskFZ
 xq5PSVy6Hc2wtruy5uerccM3AJ8kiMG7ewhN8ZVSh3aJnyYH5kFg9IX5DN8vFiUlPMRN
 T+NO5n/cKkeinmik/t8FDcQJBaZhgoh+vZlzlYdug0hqcSm5RiDYZK17AiBYJ/H1QkRz
 s66Z29MPiqkL6lio+UCM788RBGn8q1pjvhfW40zwWGNuuF5Cka1hCQsYgbUTeqvlom5V
 lraw==
X-Gm-Message-State: AFqh2kpU4PZvYPtEpNoAw8NuQkxZvMFnhhywysb3gHbY/TTi0N/oG5yT
 +2dyPfA83loJbzRunh63cZxeIBADYlHA3J99M/ob6A==
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr1125257pfh.26.1672937446491; Thu, 05
 Jan 2023 08:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20221221183202.3788132-1-slongfield@google.com>
 <CAFEAcA-zv_ny28MJGf4s9T1+3PwK8WRurVgiQnA+8UWbkRawkQ@mail.gmail.com>
 <88f5cc21-69bb-18a3-718d-90d2c43e787f@kaod.org>
In-Reply-To: <88f5cc21-69bb-18a3-718d-90d2c43e787f@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 16:50:35 +0000
Message-ID: <CAFEAcA_ez-_WHW25HCW36Vewa0rKDvUjvGCHCkX_Z0M2igW9tw@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Stephen Longfield <slongfield@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, venture@google.com, wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x/Eh/dRZ1dML

On Thu, 5 Jan 2023 at 16:46, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 1/5/23 16:33, Peter Maydell wrote:
> > On Wed, 21 Dec 2022 at 18:32, Stephen Longfield <slongfield@google.com>=
 wrote:
> >>
> >> Size is used at lines 1088/1188 for the loop, which reads the last 4
> >> bytes from the crc_ptr so it does need to get increased, however it
> >> shouldn't be increased before the buffer is passed to CRC computation,
> >> or the crc32 function will access uninitialized memory.
> >>
> >> This was pointed out to me by clg@kaod.org during the code review of
> >> a similar patch to hw/net/ftgmac100.c
> >>
> >> Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
> >> Signed-off-by: Stephen Longfield <slongfield@google.com>
> >> Reviewed-by: Patrick Venture <venture@google.com>
> >
> > Applied to target-arm.next, thanks.
>
> Did you take the ftgmac100 also ?

No, I missed that one (patches arriving over a holiday
period are more likely to get lost). ftgmac100 is aspeed,
can you remind me, are you handling those patches at the moment
or would you rather I took it through target-arm.next ?

thanks
-- PMM
