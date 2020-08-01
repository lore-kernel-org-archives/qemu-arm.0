Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp4558207lfy;
        Sat, 1 Aug 2020 08:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJayi0ZD9ro3sGZ9KzgftnD+zfWAidmqAsBGDAE01AItyu4zIJHk1++h3UT3gVXabRspbg
X-Received: by 2002:a25:e782:: with SMTP id e124mr14561627ybh.92.1596296732962;
        Sat, 01 Aug 2020 08:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596296732; cv=none;
        d=google.com; s=arc-20160816;
        b=yOS8hirf89cXgFgZoRzHbPFgjuLIxhgm9f/+UbROhp4wQ7JLobK/x4HdOGyJzwRtaA
         5j99E0vKOs0Tuu7MQPe62/O8nbsB3z2D93NI7J/BkodZ0TE31c1Xfb2+x8oj7n9nZjyQ
         dg+0cKKH2wKvNQSWkzTwz+9V5PVCcRYoa3eeK9OWeq91pOx4rHHGCLagKGJ0nrLneLTz
         tqAPrFNMMuUGMKzkPJ4YvKJQQdL8+WdbWSbGzrVFsy7yOYQtr7gXO+NzSqBiHoVp1yES
         c/wo/Rt+pyyMIhVdYJm9zOegOLC6jcb+SAwh4TjcMXC2jwyGHlbbs8amMevuZCQGG0Fe
         j7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/G5EwyEZOhwM5qjeJdk+w8sNjQNTnMmTEq8RvvFau1k=;
        b=q9nvtNj5yOh+MoInbIQGpjtdwb5T82Nf95DdBb0U1ZbXVRcYJtadbKlTuNmV65H7NV
         ZRIQ5M7ArxqNVjXlAsr+9UfXWpid8ge8afVeqm+7sQyDi7+pCcPhZAvZZuYQzAnMhfwd
         2BOgab9otAFva5BuahlginnxpvCS2MW0902cSVsFpsDgc2pouRMGis541ruF7gRZPeok
         tTmLq64Ef6yn0nNAA47VbD+a75X8viz8lI5+Pei84BeAyGQTm8Wu1Wz4h8h/7nHzUafK
         Jz8yOgKSPLg74QnKW1lmhGSfLXq+vOsI/jJCB64GMpTkOZS9/TY7tYOTq5+pXViY/CuF
         NqVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xgVaAEbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k37si3866088ybj.178.2020.08.01.08.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Aug 2020 08:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xgVaAEbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1thU-0004P4-9W
	for alex.bennee@linaro.org; Sat, 01 Aug 2020 11:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1th6-0004JQ-5R
 for qemu-arm@nongnu.org; Sat, 01 Aug 2020 11:45:08 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1th4-0006M3-E6
 for qemu-arm@nongnu.org; Sat, 01 Aug 2020 11:45:07 -0400
Received: by mail-oi1-x236.google.com with SMTP id q4so17744432oia.1
 for <qemu-arm@nongnu.org>; Sat, 01 Aug 2020 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/G5EwyEZOhwM5qjeJdk+w8sNjQNTnMmTEq8RvvFau1k=;
 b=xgVaAEbzAoBtKtkWmuzFW62o7lf3UxNDA3frXvVCu/gLhMs7YgXus/+XFfCkcSrPza
 pGmPlPBG4h8a10AGT8RPboiVLKUNbXuPyZUD7uLG/63EwuCpTgrh8VmgD4rrIXbz4o3g
 XUSUB7PDyvyH60xK1G3RLibpEUbt2M2zUb9Ure/7GrI7r3csQX8H9iPBYbsyDjEspQgs
 3JFuwHaWZM8CW396tPDMUFN5KdBg+oDdkJVjq4b+ypOo5EzOClW/0dxugEV0yR9i6PGM
 mVYsCSDYqWzLvITpJFlnwVfhRoLTmhxbFa6uJCSj9QifQMXzaGflPt29N0HkTGAmhN8p
 0E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/G5EwyEZOhwM5qjeJdk+w8sNjQNTnMmTEq8RvvFau1k=;
 b=bUCzeKtd+QWZRZ7Tj0rVe8Mcoxpx8/IGwTB0FzQAs00AVzI45xcU55AgRexcZTgyVV
 dLCj0Ut/yEkf0e4RpWgjMaon5J4PRDQ/31g6aIBnSjg8HpIc5bS57fs9ebNwaUFHhbP1
 PTW2Ud/Uq1Sn9PMW2L3ITj+4liQyM3fuIuhzMxG31I9JA7Dz5RVEUJen5GlCaBxfXZjX
 UFD0nLJ5Ukdpq+DfsZrgUudmY77c/5ditHTts1NGSImyYbirkKbLUuQXbt52clU1KMCg
 K6TdI610NDAnZYEdPYLN7PUDE8X/SJX7mijgDKQvSMaBB31QR4hlLdd3SEdddyTn+6an
 d1RA==
X-Gm-Message-State: AOAM5309C/QrX46fC/Wo6rr9jzAgb2PVGZgvSzKHp8UuBhzWc4xkDV74
 If7LFBzsIcsv6+c93bYPKFXd7hF40QCrOIi7zxM/Iw==
X-Received: by 2002:aca:48d8:: with SMTP id v207mr6566783oia.48.1596296704392; 
 Sat, 01 Aug 2020 08:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_eCeq6s=ZbDQq_TXvw+6xBGEEkRePFYOYpzGi2qZNAJg6GPQ@mail.gmail.com>
In-Reply-To: <CAF_eCeq6s=ZbDQq_TXvw+6xBGEEkRePFYOYpzGi2qZNAJg6GPQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 1 Aug 2020 16:44:53 +0100
Message-ID: <CAFEAcA8m9aBS2vcqWS9T_gzWph51dX1aZyGn=LUuxAGQYAOepg@mail.gmail.com>
Subject: Re: QEMU emulate serial snps,dw-apb-uart
To: Muhui Jiang <jiangmuhui@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x236.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2d3u/qlp6gk3

On Sat, 1 Aug 2020 at 14:37, Muhui Jiang <jiangmuhui@gmail.com> wrote:
> I refer to the serial snps,dw-apb-uart. It is a widely used serial. For example, the mvebu-a9 board.
>
> I was wondering whether QEMU supports this kinds of uART. I tried to use the serial_mm_init, which supports ns16550. However, it does not work.

No, we don't have a model of that UART. (We only have
models of devices that we needed for the board models
we support, and we haven't ever needed that one.)

thanks
-- PMM
