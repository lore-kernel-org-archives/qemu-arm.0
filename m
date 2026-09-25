Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CAFC9831E
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 00:05:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9tRA-0004VJ-M0; Thu, 24 Sep 2026 20:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x9tR8-0004Ry-KT
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 20:05:10 -0400
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x9tR6-0004bv-OY
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 20:05:10 -0400
Received: by mail-yx2-x0d.google.com with SMTP id
 00721157ae682-8a8288165fbso3834117b3.0
 for <qemu-arm@nongnu.org>; Thu, 24 Sep 2026 17:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294707; cv=none;
 d=google.com; s=arc-20260327;
 b=Z3LhqeMz2Hbc9aeCGm237iEim9klNVLrCGwHwq87HkS8OBnKZAwDgc0+nBVATKJ5o7
 F8t0msXyi/EHk2JYA1LJnH7s3045amSQoA04KW86AlF0pVuxrInJT2uTFQqCPT0sv9g2
 LOoEb/Dx58HX/FShx+A750fX1UtxhrQaBfO4wtzVeAMf6dHjU/ENAOBinkwBEKupgGf0
 9Db54xqTeWKXyIOX+Fmyi8HnMRVudHnIgBcqLUsEag6Hz8+sP9fcg4jUuCWqDHluFX92
 ujp7s7yFhpaKOiZSKiJfkEk3Q5U+SiQpX4Ds/0rp7ZatVFbe8vh10f24WVL2ybrD7Cwv
 +CZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=THFKGI5+Bokdkdl0jWd/+1qSxdO1Cl6vplCduDfW+EA=;
 fh=uVVeNdZVLB/at+i5QbEYtWMFh5KWwOet9saLiSHGuug=;
 b=cxqHTL9Oc7S3h3DJKFwgb2Gik4VXpXo0HcIaxX7oKXd49z5ys+/1XQ0cCyPLn7JbqU
 0ZJehPqF6bD3OHHFO+FS1XquatnLcMbCUJD0kvwT4mGslsPwZnysJT+im7CcHaS4cuTa
 46MPTqugmZ6SO5n5j9I4O3mGecEfjQXRbiGIUh/pKdT4XrylIc4woc7Vqk3UlkYyDRHI
 SlNRNWaaUBbIraZ3yUR9mII4PXMMmEaOBUi9QokdV1zp16CmjGCwXXtUlYpKxT9TcsRb
 neOrg4ZDhxy6away0d2T8N/cJLzXfRQc2T3kpZSTmfONqT8HglGq+Ho/waC56ZSY0TDo
 1yKg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790294707; x=1790899507; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=THFKGI5+Bokdkdl0jWd/+1qSxdO1Cl6vplCduDfW+EA=;
 b=RpJ78D3LMxJrF3KjoxX8YtgU65WnyJ8CeLbk+ivyP0SZejVOlSPEWO+UPxOJ/Zi53L
 KxRZ7oDozDMtkXCfd8kDRzjp/fQfB5ZGa5Fu1CJm2zly5ImUkYMdXsxNO84f1BVlNuPD
 EF0z6TXSPJP6Y5cBWkdkfuIcK84y0exv7p5M055TNzSausIxgtWUxXv3949aKE0gjXTu
 8EPBuH2WOuBA75lkjLFWtx31x7GGJinEG8coOR47E/M/4XPURXvzSKbiil8eTubCAddk
 50j+yHwu/KZIb7O8nGkhvw8xZAxp3/QiMP65RqKy+TH1Xygg5a9OSdUFBGNnyUNULqBH
 uFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790294707; x=1790899507;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=THFKGI5+Bokdkdl0jWd/+1qSxdO1Cl6vplCduDfW+EA=;
 b=otZMhdF22D/1/0FREh+sWcMVLsIlNptAo6i+Z0FWovR99Xlg/9Zq0nxV5388h6+dx5
 aP0gXpZLmtHgkWTEiKghTwtgYy8JX7vYfzajCon27km5qoV1bUiJtAQHxma/Rrh8X1cB
 S8rVSynyc/uMdmQ+QJKE44kK0qyHIipVVtmgwgQyYa8Is4LNs/06ityoogTpjc7VGcYH
 OjvP0Lqp/GIQOkDUnJf2/gmFTJ8Ajm8+s03UgbGAu07kFcrioROIaYaCTF/ZEOLa8phu
 wHv1/Z2Ig641OYuX3XXHYpGNiYIVQUyLKMSy498iOFD3Bj03fQTnm4jMlnFaarmpFCo3
 L0JA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwmQC2CZpZD+0MLaqPYOrrTyY0tBxJbVaKsbSf7/QvQcOLlbjryj+98WXvdsgpvnWxnUrIGdRzT4A==@nongnu.org
X-Gm-Message-State: AFuF++lQxb+OHWiHN3yixx0hEX4X+/ZZf019pYvm9DUY8JFfzo6SLGfW
 lC5g9rfbT2UnCZZRpWoYMmNAe1yGzMCgNOD7QoH6qV111PSD05O1OJs4gEMNnui9wawctySEqBm
 nlrnOJO4XiP5bAtHF/6Z76hi84Rhd+6A=
X-Gm-Gg: AYBFou3oAmC+BGog4pCNtcLka2lPQEosdJUf/IeaicuEYmstedofNi7eyXgRmd/KNn4
 Q/T/odJuG04rHrnXvhfKSRvafKTE+pGds52cHMg5ILaQynWs7Bb0Mzt6kFDrjVmTp/HIf8OqwWZ
 K10VZD0yIrNr63GaBUjc9TwSaFM2wiArO5B/C4bTDFD5w3T9wA8V6r4iLhw0Hwtc9rtwWVeVOes
 FwyhreR2/M8He/DHDBqh7Wk+LX4hFbugDOx25k+Q0+HGXW3ir47RAmD/NPgZkadHVm58x3XFX4B
 JGKZwEAgJyiMZjOhSOv7wi02Mlk7Crb3se3JdkkM0X0qJ2mqxqAPnoqL4mu2
X-Received: by 2002:a05:690e:118e:b0:672:d609:6bfe with SMTP id
 956f58d0204a3-672ed32167bmr2613560d50.39.1790294707282; Thu, 24 Sep 2026
 17:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260825084224.1827672-1-bin.meng@processmission.com>
 <CAEUhbmU+BQ=MErMdF1t8BHp-Xzwc2PbFY6pN3wtAgYKbO7jdaQ@mail.gmail.com>
In-Reply-To: <CAEUhbmU+BQ=MErMdF1t8BHp-Xzwc2PbFY6pN3wtAgYKbO7jdaQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Sep 2026 08:04:54 +0800
X-Gm-Features: AclHuK_MXEl-ur_paSEuduhOrrrD2iPyXDlk9VNgzE7kU1gjnLHP4KYGeXbJ8z0
Message-ID: <CAEUhbmVoMnHDiNGG7KoGYECewu-JdiuCuB+aXeyq4ohVHo-H6w@mail.gmail.com>
Subject: Re: [PATCH] hw/net: cadence: Honor subword lanes in the GEM registers
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowangio@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Sep 4, 2026 at 4:16=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Aug 25, 2026 at 4:43=E2=80=AFPM Bin Meng <bin.meng@processmission=
.com> wrote:
> >
> > The GEM MMIO callbacks ignored the low address bits and access size.
> > Byte reads therefore always returned lane zero, causing guest driver
> > that reads the station address byte by byte to turn four unique MAC
> > addresses into the same value. Partial writes had the corresponding
> > lane-selection problem.
> >
> > Extract the requested little-endian read lane and merge partial writes
> > with the current register value. Preserve the existing read-clear,
> > write-clear, and command side effects, including dynamic queue
> > pointers.
> >
> > Fixes: e9f186e514a7 ("cadence_gem: initial version of device model")
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> >
> > ---
> >
> >  hw/net/cadence_gem.c | 94 ++++++++++++++++++++++++++++----------------
> >  1 file changed, 60 insertions(+), 34 deletions(-)
> >
>
> Ping for review?

Ping?

