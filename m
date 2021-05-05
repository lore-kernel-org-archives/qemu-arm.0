Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp268093lfg;
        Wed, 5 May 2021 05:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0sdRE+olox5QCXLEU6njuVHbATyKaUWwiJhcsyCaZ0Yskd+kAC3XEe367AABBiApZMAvY
X-Received: by 2002:a05:6e02:1152:: with SMTP id o18mr25410400ill.174.1620219144404;
        Wed, 05 May 2021 05:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620219144; cv=none;
        d=google.com; s=arc-20160816;
        b=dmwXDpdrYYCXCcqHSWzPIl00xItp5H/mvS5fMowGCZdZjuZdqSv7o4kwvTCYNWGo4Z
         pHaxeWc/2JZCGsNqgcGdzCEEoz33rZV/i/mVFSfI92+Z1C7wOXmVTgyok+KONSIE2DEu
         mwbKQz74k0D3ScB47O/1QAeeLbAahpwIeT/vUvwr9K/2ZhYLIsp61DT23ZLcgelzJJFU
         GNy/wwi/qw8rWNH3++j/1QdnvVj/GXCjwX8gRtwhnfFJ++Yq/+7IxxQ6quHNGPF9ZwWH
         kZq5KXpiPk7BGxjxeJ7Jy93Xg3s2iGJC/HwT85hD+nUpwc1KDpELHFDNfO63dI6HfuNj
         ypuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+H1OWX8UD0LqwV1inoR3zZEYWvYJbF0KuDtqUUZiYuU=;
        b=qYMf/xlgEQE2kq5y2Ru/J1DxC/pZepiWbJIQnjpl/DV/N7YdfO10V+B4WEydemsuVh
         nGu0EcbqJhcBDRglUu3Kc41OEqfnpef7clg+m5SWyOsXRkl1FgLZAaXNj2TZkvfnpdUe
         Ogquvl67zXyyUjGE81TFYK/uanyS/NS++ErCQMSnGQ/dCiomcaVw9gWhfFFN2inBAR7w
         TvauR1qMEmj304MTN0/S9x+YjHcf/6hQe1GwqzglD9uDAMWCc6fm3hicNexGuQ5j2GU5
         2aIyJVu262eqR1ygwTSRKe+e+285K5UksuHA2wwj5z2mSYdtuKEev7Wcc58nlECqeSo4
         5kvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0qRFskL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si19959436jak.73.2021.05.05.05.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 May 2021 05:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0qRFskL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leH0p-0007PX-Ij
	for alex.bennee@linaro.org; Wed, 05 May 2021 08:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leH0U-0007OI-0M
 for qemu-arm@nongnu.org; Wed, 05 May 2021 08:52:03 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leH0O-0000Wp-N7
 for qemu-arm@nongnu.org; Wed, 05 May 2021 08:52:00 -0400
Received: by mail-ej1-x632.google.com with SMTP id n2so2643989ejy.7
 for <qemu-arm@nongnu.org>; Wed, 05 May 2021 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+H1OWX8UD0LqwV1inoR3zZEYWvYJbF0KuDtqUUZiYuU=;
 b=i0qRFskLONVWRCd29sn9DRZApAII1ChxZ0Nc5nk2sf8eCiNC1PuyBBbnqS4F/mQOKO
 ddFiiXAvdTkkgywzayoDkzjWyDB+v9wR25v3bdvnZBefBmEJLB4ZxXH2srN4dlIIfSuM
 RBBNFP1K+Yg34s1gNSCPhiLxtwIVgLNuKPbQ+mTXFEVmDiil4M62ErQ5G3upGnTXu0+E
 VrckE7GHC6BRRxVuBDL9I6CzGer+0ALvxCsrVHYLFEKmjb1LOhs1TXLVrWF9z24H9YYN
 j88NfyNOO0XyLvU7AfAgZRNankzQBPAJYAAolteTrukt3fbWyYqMFBnbbVpSthx8SXNk
 UE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+H1OWX8UD0LqwV1inoR3zZEYWvYJbF0KuDtqUUZiYuU=;
 b=rh9bqgkGJZjjisFhIJA3C5S7bE+ITYT058f01THJUST/DSYQpJLtSWB8oP3yyi0F+q
 6xogY4UlPLExmZ5VOuKAM9uaw6x3qTLTpLbZUmXU0XXphKQJcRN/7Ay7qBz50LWzX8+S
 YO+j/9wIYUADbXatwIxWe5/eyeFtQsx/eSqpQncAq4FWBinIzPjl8FwKxWSt2sH4KVyG
 CA2UyiDZB+G9Z1bFv/tkLrBejMnhLW2IGCMMVPbLkmacO0CRj9tvA4sKm7E7Yttd1eMN
 zWbYv6V5SEAQh7Gc7si8F2g48J4ZqX7N/kefIoGYAEACCr9UVBMzcm+Xq3SUVRrMRZSt
 fiYQ==
X-Gm-Message-State: AOAM533tPMEb4fzuQ3wCTpZv76c7m7wI1+yHvVX5aCb/fhzfIM4bDwNO
 KRs15JzY1oOzkXFkPxpTV3rQ/Ci+oPNuSSrQuuxRUQ==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr27022850ejb.382.1620219114954; 
 Wed, 05 May 2021 05:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210503052600.290483-1-clg@kaod.org>
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 May 2021 13:50:48 +0100
Message-ID: <CAFEAcA_Y=BDwdFq7-EXANtK2Z0F0rWBFG4-NcouCCygNYhC9Bw@mail.gmail.com>
Subject: Re: [PULL 00/18] aspeed queue (v2)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lGccK88uQ49H

On Mon, 3 May 2021 at 06:26, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338e=
a4:
>
>   Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210503
>
> for you to fetch changes up to 9cccb912cfa865f0bae6b156fa94e2f216dd8835:
>
>   aspeed: Add support for the quanta-q7l1-bmc board (2021-05-01 10:03:52 =
+0200)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * Fixes for the DMA space
> * New model for ASPEED's Hash and Crypto Engine (Joel and Klaus)
> * Acceptance tests (Joel)
> * A fix for the XDMA  model
> * Some extra features for the SMC controller.
> * Two new boards : rainier-bmc and quanta-q7l1-bmc (Patrick)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM
