Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1930094lfg;
        Fri, 21 Feb 2020 07:31:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfb1zg3nvZJzfWGQE19tvT1EE5AxDJ3T3hqiS86SvGVFYB5BsZiNVizbBlKaLodg19iIOJ
X-Received: by 2002:ac8:4b50:: with SMTP id e16mr31183782qts.89.1582299084762;
        Fri, 21 Feb 2020 07:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582299084; cv=none;
        d=google.com; s=arc-20160816;
        b=SAKNYSSuddLJ33vhDRtxZwpZtjzqhytGl356cP25cEL1aVRGo3EgvlNKbmIWd9b99t
         2qihBckEos+LLSFhVGNVLMFyovo6YJKoLx3mRaVZxs2/VO3lSIKEWfiYpBc9mCc3s8p+
         2J8uShHt/hh8JwJHhmS85gqmwzga21niLiSkp0Bb3oimWRa3Ur3jL0rrOYeBZuNatQrO
         GJVhbyBexs6wwjVjQCM3QytwIuBiYACbz8FkcHsnff0+SdWrv/sdOilETM1iKGsxnntp
         r9wlqQ0sSiYQOcKFeCP2+z2vHc6/3CZPGhmjMZrkJ8QUG2AR10PRsACWyRK3Y+dts6M1
         SZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U1Bc8loQDFjm29dMTknkB+5dvxG15GcFWOZsq8q3zjw=;
        b=tynLv5nNNHVREnDxGml/8xdo+vfIwi0jbB6uMWPBYbt0G7FDgqUX32JCGZZgVOWY1b
         GvKSRijq3dVEtvLFMafqiGEPeor+W/oZFtXYsa7flhJLdocQPuXScO7jXl7CiTee+wC+
         n3zHnQA56HFkdWjuoi6cvgVqXujNq+J9oQl0vfxCIwnukviMdGS5pmXQOtG+0XdlgGHT
         7nmA2ZVR4kOz3pSd6EIxQoBrShxxuNTzrEuJv7IpTCBKTvli/WTEuOAhTrKnip7s+rLe
         EIsxjUA6GX475a+slvUOQBC5xk10usElAQXuH/WMZYrYbFC0XWIUzlLlvIEaC2OlOCNA
         /F7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bnlJBnih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14si1470803qtu.118.2020.02.21.07.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 07:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bnlJBnih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5AGy-0001gs-3V
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 10:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5AGm-0001cc-3l
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 10:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5AGl-0003EH-2Y
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 10:31:12 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5AGk-0003Dv-TR
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 10:31:11 -0500
Received: by mail-oi1-x242.google.com with SMTP id c16so1951360oic.3
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 07:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U1Bc8loQDFjm29dMTknkB+5dvxG15GcFWOZsq8q3zjw=;
 b=bnlJBnihavmyKnvky7XWfdBkN6rVSeow2KHqhBS60tykGRbCR8UDJ0Q54XOKzXfQ8V
 93VXHvy9xrPtLpKpcgto+zRmosbQ/R7gQamRQQvBU0J50uyZaJN9o9XTjfjnlMIPzAyH
 8Htn5SpL/3Dx0NexOg66zj6adwzdXi3WK4uV1TxVzSzQIYPvrNCX0w1LyAcTy/VNh1Nx
 IOajBnX7qdTD+cUObx920RE4Oe8BKTm2KmKF2aw6cqmohX79gmrT6xsY2U4E+xIiRRAT
 ZaKYywVn4/r913Ex4JJZOlRDYf9w7mSKwSNg6IURS4tVm8sxzEMUCfXRPVMK5KIamC7C
 0ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U1Bc8loQDFjm29dMTknkB+5dvxG15GcFWOZsq8q3zjw=;
 b=eaI4OhfC8FAQwXD0xDpoGwVgpSityjFJWQmp+Q3gtOYOUWKNmBLONQIfJrsXxSwCEg
 3BxKkizEX3jBJy+0wNUVuMXw558smnw3zpO8xliLhxayKkzE/fSjicRLKU7h+IlO7cVC
 N1Y9zDjMgJl5GDeSqXb7PsbMpy4FAnjzqiIse8AfPwgesCbKStMWYLOmqJix1hVs1BM0
 BSZxwkGd6z9zV3xr+kE9C38K/v1J9Gnk8E0mPdJD4Q/OiOFsNsi4L7yAV4PwOEOMInpk
 CvxzlbHyGRPub+vurtWxhJfMO+bruH4i4jeM/k7xeACH9ztA6NzfUTEpasJ1DarbhY+e
 dcLA==
X-Gm-Message-State: APjAAAXPXwm5/u6D53flkxsBPgN7blOAx/Fm1wrTn+cHDQ0AO6nhskZ6
 5x7zlMSz2uTDIOFIUkNuoJvZ5GDEveMnfTeho+KfCw==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2391309oic.48.1582299070080; 
 Fri, 21 Feb 2020 07:31:10 -0800 (PST)
MIME-Version: 1.0
References: <1582270927-2568-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1582270927-2568-4-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1582270927-2568-4-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 15:30:59 +0000
Message-ID: <CAFEAcA9BgmTT6-1pifQhRPNyO5KVdXpdNbr0tGYF5Waw3tN3hQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] cpu/arm11mpcore: Set number of GIC priority bits
 to 4
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anthony Liguori <anthony@codemonkey.ws>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yJVPKve+ywo9

On Fri, 21 Feb 2020 at 07:46, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> ARM11MPCore GIC is implemented with 4 priority bits.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/cpu/arm11mpcore.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/cpu/arm11mpcore.c b/hw/cpu/arm11mpcore.c
> index 2e3e87c..ab9fadb 100644
> --- a/hw/cpu/arm11mpcore.c
> +++ b/hw/cpu/arm11mpcore.c
> @@ -15,6 +15,7 @@
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>
> +#define ARM11MPCORE_NUM_GIC_PRIORITY_BITS    4
>
>  static void mpcore_priv_set_irq(void *opaque, int irq, int level)
>  {
> @@ -86,6 +87,10 @@ static void mpcore_priv_realize(DeviceState *dev, Error **errp)
>
>      qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
>      qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
> +    qdev_prop_set_uint32(gicdev, "num-priority-bits",
> +                         ARM11MPCORE_NUM_GIC_PRIORITY_BITS);
> +
> +
>      object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
>      if (err != NULL) {
>          error_propagate(errp, err);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
