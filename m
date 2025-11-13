Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54332CD5BD0
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 12:00:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJVzQ-00082t-JY; Thu, 13 Nov 2025 06:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vJVzG-0007l0-FJ
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 06:59:38 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vJVzE-0007UN-PE
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 06:59:38 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5942b58ac81so545168e87.2
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 03:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763035174; x=1763639974; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVJadbzVhhoEha0LPWhaDRWNxXnQUDBpTDgn4MKWgo8=;
 b=jGQAEtQRvgj2sDiRncx5gUAmzhb7lla1qtKhiniRADSTYO1GZO3qPoPNJDBSVT5bM3
 d3UvqCvSO5F5G8RLlUnNxwO+KOyKlt+hiumh8i/QixVoYk8QBYUtqCnobY2tjWzN88pd
 cVb7BAlGLRkXi25TvqQFaw045WrINY0W/R+bz0rDtRnNowxuKNX8PfZuJ5VJegsp4fUF
 bGEir0bNZGW77LPTF5Z6m5gyckEFVToBeHbC4x7DXwwiZG1TAWFByWA0LtaLkCEDKNWs
 X9GQCK0WgzN51ADImwsgqU0SlnQ9JeRw+KyTvBZAL101HMiEk0AF68mtbZ09w7GVxE8W
 w1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763035174; x=1763639974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VVJadbzVhhoEha0LPWhaDRWNxXnQUDBpTDgn4MKWgo8=;
 b=kcaGBX1PRgVrUZCOCKTVh2k5+Yg/WH6qAoTdyLQruhK+Xq51ukDv6+JiABQSQhw+wi
 eBY2aCkpvYQ6bI24yh/CpeaWKhO9swot48GxHu1GmWf6rvUPzBTfDD90vvTDV+GhYUEH
 LEZZQXlh8ic4vvJMqSXiWExPVLLbo2y1Z64cvbtaonZotJHBwh2jZiYW6Ge0Uc6sQSKV
 qaR19WmS+WHCIbi7OsSB3lStSb7zkx/bvs5AuYGvxXUhoooiD7lUD+CUxxbeldo00iRd
 CqASFoLd4C0we4xw47AcgyenB+yp8TGgeYYRXxyUMik6IW+uxyX1NiiQmBlfQztr7WwX
 YSxA==
X-Gm-Message-State: AOJu0YzVzbSDPyWhiJjsabsL1CWH+bzX3wS6U2en0hOYyTGDNhVSDeCv
 eFhnQ9yBDpHgfGsaL3UKZAxSQeqeWWV14NtTW2MMcdOTKfqoc820aqzV1RzhmletAEhqVzLIxIw
 dvXAhgoerS4tZmEKDkzw5QrfHFCb4I6/pcQ6yvAzcVQ==
X-Gm-Gg: ASbGncvk/nrGUXz2uBWigWdR4UY6gVsE0xgZRVw+72dyPPcEktflK02n8eSFMl3Fvlo
 ooe6lPFKRaiaua1JibzEVnRx1RavCrzhdfi6RHpRaQcnuhET5VrCD8NgRMjEFPoHWgfIOI3eyS8
 NzGf4pgfch06+kX0eRdkqUrL2JKQeG6dpabqO+oXGQcd5VfJhbGrC4Luf6w/L6uE0Mahy6LSdEK
 bRUnWkdJ4l2TZmMhnQL0CcXAJ3/aLZiMYKf6UTBwh0179Ly+GX1T096v9KeeVYkrBR9GF8=
X-Google-Smtp-Source: AGHT+IFUKG3nA//YaQZBuHjirAse05rPxxeRjW44qBb+wCs3IC7oXEFZxFPsGPEsIP/mglDiIDCeRaa6jvwEsx0yX7E=
X-Received: by 2002:a05:6512:31d1:b0:592:f5f9:f5a9 with SMTP id
 2adb3069b0e04-59576e3c63fmr2173275e87.36.1763035169628; Thu, 13 Nov 2025
 03:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20251105154657.37386-1-skolothumtho@nvidia.com>
 <20251105154657.37386-5-skolothumtho@nvidia.com>
In-Reply-To: <20251105154657.37386-5-skolothumtho@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Thu, 13 Nov 2025 19:59:18 +0800
X-Gm-Features: AWmQ_bmjYJUBjMNzxIUksNR0XPxJr5d2Yqn1M4Mu9ond4jTJYqg2__y0xHK2CS4
Message-ID: <CABQgh9HzB9yCD_rYjGFX5ZC7RX2e2iVu_FZPU2Vm-kuf3jfm+w@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] hw/arm/smmuv3-accel: Read and propagate host
 vIOMMU events
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com, 
 mochs@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com, 
 jgg@nvidia.com, kjaju@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lf1-x133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi, Shameer

On Wed, 5 Nov 2025 at 23:49, Shameer Kolothum <skolothumtho@nvidia.com> wro=
te:
>
> Install an event handler on the vEVENTQ fd to read and propagate host
> generated vIOMMU events to the guest.
>
> The handler runs in QEMU=E2=80=99s main loop, using a non-blocking fd reg=
istered
> via qemu_set_fd_handler().
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>

Still don't understand how to use this vevent.
Is it to replace the fault queue (IOMMU_FAULT_QUEUE_ALLOC)?
And only find read, no write, only receive events but no response
(from guest kernel)?

By the way, can we use vevent in user space application? not in qemu
environment.

Thanks

