Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp74156lfq;
        Tue, 12 Jan 2021 19:29:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv5U4yy9sCvmYrWHC+ptzmcQrCtl9ayr5Wz/YQQaucdI3HQK+se4+jOR/cf0ljP+gyl/pz
X-Received: by 2002:a25:1541:: with SMTP id 62mr451826ybv.484.1610508563461;
        Tue, 12 Jan 2021 19:29:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610508563; cv=none;
        d=google.com; s=arc-20160816;
        b=AEECVpBP3XVz5tG57FH66er8jtV5GOn+Iq27LEuVl/m5/43MOuU1eIN7i5+A9feL5Q
         VyKKrUUBUo9bISTzICeatnX8r9+ihadd96Z151uoPNXrxx4jb90tSkYAbOOCcbzFi9I4
         JRYxKgwVgXEMxWiBnDe4Q+8QNGZTv9LMEXodf6kbvMcOUAQx6ttTJdnbVb4bOcflFCuf
         csCncMaLx1otEvHU59uiUthizZ6Eogy47bp98fl4gPM77Y9R6pS2CfdRRpdHCGPEZn2C
         RQEVMXBLpJLladO21fmDKpbpLSQPFIAeuWzP/ahlcapX6ev6Zh9jg5BZtn3YkKjf3LwT
         9xMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=L/xGhiAffFRK5UXRDej83VHjRmbOO4At1tkENfozVQk=;
        b=GuFYXALw1I3GnNiiey9RyUY8FE2VyOfPf4JWry7iSj1CaAnT/HpMw0iIov5olmiw6K
         Az0AHoI12Jf/RMMmIW0wFmL4kQw34FiEg69L9TEN0iV7y5knYGxZFXzxs4wnUX1nMJQ5
         W2Hzl6g1D+3lBSjZ1XCqmcRa02R9XYq6Ykix2lfE2M1jthYoBMM8dnJpSgiIDdMCUpkD
         105xTfvBs5uTkQy/IpIYP/C05H/p7wK3mcf+g3EiBA2amsaJ3xvH2rD8XQKsrLR7Sy8F
         laxDIoJIDxvJNe9yYmpzKV5ucjuvStp4yHcIOIrIDpsd/Q0DUkZevGr+JLSEKoplWEUm
         1Iiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="fsH/qh8R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r35si765945ybd.310.2021.01.12.19.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 19:29:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="fsH/qh8R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzWqY-0006Ns-T0
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 22:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzWqQ-0006NS-Ad; Tue, 12 Jan 2021 22:29:14 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzWqO-0007aD-NU; Tue, 12 Jan 2021 22:29:14 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id y128so827097ybf.10;
 Tue, 12 Jan 2021 19:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L/xGhiAffFRK5UXRDej83VHjRmbOO4At1tkENfozVQk=;
 b=fsH/qh8RdZzXz7BWQMr0QUHUmPtu0EV8t3JzaGrcjsbewLvZzc3kLSO1e5Xg+FqhXI
 XSmFND5fFMMIMEcTwBzTYBmCAZYnWY21VqyIDpseQoOFLp8VFOkGdL82MmfK8IKOs8iW
 gv3fwwULgZgcz7dxVeJplMgORozW/px3+WxglkhD6N0NUg4M40DDjxXXIc6J9X7pkniv
 lbt60PUZdXxh+6PtDNHFDWdX8sDaZMtzQYKxENS5VWM/FkzlRiflqN3F7Uo2laiN1XTM
 j+oMVAEQcvX78kHA/orN+vQ+P5zDouEnus7d7geLv0HagD/bphshD5fl8MMS9MFFa9S2
 5uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L/xGhiAffFRK5UXRDej83VHjRmbOO4At1tkENfozVQk=;
 b=nbCaX32L5dMK0z1c17MJE+2lh+f6rRp3mWvcjGVrW/Tz0TsvsZmJ4c+e8JASwG3qYN
 vQwzAt85Ok7/DE+XW15xbEOAJQZi3Rt3j6IVHoZ0s0AIG/FmKyxTZDFbMlbFUMGMsW4Y
 NJniJBw1EHfkaHXj5xZl/cl/6Y2bJL7KRP1aAv7geHfnqjeFbn+mDxaQDgA1Q07KUqan
 4+wQ3OuOmJh6EDaps+zhDMRB2M/a+y7zViZQnxt/sdyAdVm1CJv+TNl5W62P0eQtXqTn
 F3eRgx+1GkTTBVSB+j69MoZ6l1gufeehNzy27GmhMNIO3iUou3JGSqEBwOspXWDeCdvt
 +r+A==
X-Gm-Message-State: AOAM533MhgzGJQC3z0Geprjr+BlK9bYwLieQQJgZ1lcIi8VHDDNx2HG8
 so4X9K4rLsY7/aSgbl/RY8dFcuWFVW85SYRspqI=
X-Received: by 2002:a25:4744:: with SMTP id u65mr462730yba.239.1610508550965; 
 Tue, 12 Jan 2021 19:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20210112183529.2011863-1-f4bug@amsat.org>
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Jan 2021 11:29:00 +0800
Message-ID: <CAEUhbmVmqYzCg0Edirp4UFhLpGGWbm5jFiTjOw=0=EhnSMsz3g@mail.gmail.com>
Subject: Re: [RFC PATCH v6 00/11] hw/ssi: imx_spi: Fix various bugs in the
 imx_spi model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kyRtPNuzbMlH

Hi Philippe,

On Wed, Jan 13, 2021 at 2:35 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi,
>
> As it is sometimes harder for me to express myself in plain
> English, I found it easier to write the patches I was thinking
> about. I know this doesn't scale.
>
> So this is how I understand the ecSPI reset works, after
> looking at the IMX6DQRM.pdf datasheet.
>
> This is a respin of Ben's v5 series [*].
> Tagged RFC because I have not tested it :)

Unfortunately this series breaks SPI flash testing under both U-Boot
and VxWorks 7.

> Sometimes changing device reset to better match hardware gives
> trouble when using '-kernel ...' because there is no bootloader
> setting the device in the state Linux expects it.
>

Given most of the new changes in this RFC series are clean-ups, I
suggest we apply the v5 series unless there is anything seriously
wrong in v5, IOW, don't fix it unless it's broken.

Thoughts?

Regards,
Bin
