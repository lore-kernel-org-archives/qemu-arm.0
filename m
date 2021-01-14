Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp139057lfq;
        Thu, 14 Jan 2021 01:51:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIf1Xx77N7V42rgZS3Od0Be0ZMHR72PHH6AHs+GGbONtkpPKW0RXm3iGdw38xH9/vcZfUi
X-Received: by 2002:a25:c655:: with SMTP id k82mr9393057ybf.153.1610617868099;
        Thu, 14 Jan 2021 01:51:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610617868; cv=none;
        d=google.com; s=arc-20160816;
        b=QDm45bSsARom0OQAxHUyXnp0st6D1JXO62UZl7lI0vZbFhxeiFfjm6uT7R6netJGP+
         qEsJL0a+4aQEjfrSQ0WczEwVZ6EvkWaf0uFcuTf4mvtVEHLm9Rk4Qt/hxrZ4mObgw0zu
         1x0oNpP3DSHPB0MAMj6Da0/+dpA9n4r0HDLCa0YkLBGaR8agdvpcYv1RRGeVEbGqZlG9
         kzh0yC5PjPFJbRRkcptNwRrugmKILm3daJ7sP3TdcBvo7notHOKaid7fGT1jm2hXZSJ2
         /I144a0ZapuIYVfb3FFJZHRMOeLE4U6HY8T5X8xbemh3Yxajco0bBOVODXsJg8EBo59G
         O0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CzMKyU55RFUpOhw/+mqOGMS64vLPHedKvSKg42gyNqE=;
        b=mDAhNhUIhq0WU+M9zVPKE7KnrtwqJ7aWl2CSaPSA85/hnr3joa/1unOKKSS0QZAzh6
         NtH5t+B05L3GDHyDUKd6OrdKkdqdE7R+j5RXQkUgASk11sQ9MlTKN1MobO1Njmku7EpG
         +LcCw8EFtI5yDguh09r3QW0HNtYCQJbp5dbSVvZGxcSgzVjJxfj6zYskvEVgFitOCT+v
         fYliTiDDnQr8EdZkU0BfBHOza7/iGbbvm4oZYuFvDwr9lZU6EB7ly+4/QBwRK8YW+0Zk
         uS1mE7/PTJ/m8iyL5lgLpMr2EixnW7Z1OEXCHPjEZ4hdUApPDCtWFp3cJNr69/J3DnAf
         mmsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bqDDjwns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si4989291ybk.458.2021.01.14.01.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 01:51:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bqDDjwns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzzHX-0004M0-GP
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 04:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzzGo-0004Km-T2
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 04:50:24 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzzGm-0002kq-OE
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 04:50:22 -0500
Received: by mail-ej1-x630.google.com with SMTP id e18so7203491ejt.12
 for <qemu-arm@nongnu.org>; Thu, 14 Jan 2021 01:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CzMKyU55RFUpOhw/+mqOGMS64vLPHedKvSKg42gyNqE=;
 b=bqDDjwnsqMY7xln0OBHIp3EBMBi0JpJGqv3jVkVoVfmKAad89HrPQ1whKV1DlLueBl
 jl9FTFRJZikcS8dP1vTIOCaOGVVLLLqLdR7/P9yOr9BK+r75gbbzboblDJ4ihnRi61lg
 +2uvUaa8whjp/+dkLqxaYXrABxKnrUtRAeSpQl1vuO0Xh9JxOZkpQaSlQp5XVh9X+WbT
 u5KTpAbsgbA2gjDNMoBDL4xTdYiuEm5GcgKNxq1/0fUq09Y4D8F9VwIBil58SxorJvPf
 y3qkqRJwnP17t2ykpZC6tIvlyes1xxFWd0h0RLwC+cbdycWw+EwTFycmoYN6xsJxL/vD
 JtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CzMKyU55RFUpOhw/+mqOGMS64vLPHedKvSKg42gyNqE=;
 b=KcC1kyuf5FgYVgjrJ4+liEYRWdvV/R87KoLzKC33A40TaCzvc1RkivTWgd2MrLOtyz
 x/fx9UdlaWfjxTABL+7iRSLcQ2bHM0O74kDo16G6cx6igS32FEPAAl3m5b6GPPK9vaLr
 hXl+HjjLE5vg9zN/8Ud7EL+2ELwjd+F6io+AXXDGItIHurAuxj9qtifhFCZwOGX2tmcW
 VfK1hGKPgrOws3KKH73G7FnioaU7ZcXrA2FdZV5zMk8VYZrePm5nnIEdm7Ci1lal2MNy
 hpGIbuETYT7udA/6RCjMNifm6DjCaOC/iQcLCIaG8m+9hSyJvNgfiya4tZ82pVEga/Vy
 FeDg==
X-Gm-Message-State: AOAM5336chKaAi9kDUFT3J2bAu8QYHSj99C7chXgGYZEKdR1iCQc8M/i
 mYKTuF8jiTJ8Nq3IAceLUIiO5RWP4lMaVCEsxdTJtA==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr4728402ejr.482.1610617814708; 
 Thu, 14 Jan 2021 01:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
 <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
In-Reply-To: <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2021 09:50:03 +0000
Message-ID: <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YFbj58Ft2oQ5

On Thu, 14 Jan 2021 at 00:04, Andrew Jones <drjones@redhat.com> wrote:
>
> On Wed, Jan 13, 2021 at 10:30:47AM +0300, Maxim Uvarov wrote:
> > - the same size for secure and non secure gpio. Arm doc says that
> > secure memory is also split on 4k pages. So one page here has to be
> > ok.
>
> To be clear, does that means 4k pages must be used? I'm not concerned
> with the size, but the alignment. If it's possible to use larger page
> sizes with secure memory, then we need to align to the maximum page
> size that may be used.

I think we should just align on 64K, to be more future-proof.
Even if secure software today uses 4K pages, it doesn't hurt
to align the device such that some hypothetical future 64K
page using secure software can use it.

thanks
-- PMM
