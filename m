Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3945139lfk;
        Mon, 13 Dec 2021 02:06:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9wOIoazoz+pk/I90RBNTJUSf9IrgdAt4NDiHQQGttbmnUWvmUYP72vrig0kR87QepFDZe
X-Received: by 2002:a05:622a:1102:: with SMTP id e2mr43859003qty.194.1639389978387;
        Mon, 13 Dec 2021 02:06:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639389978; cv=none;
        d=google.com; s=arc-20160816;
        b=F15j86WCooU60YAu1aHwYGZrdcpO0Yme57DGsRFc6P8nnDxUGNyAHuukDscTPmrBMe
         1tK8aAbniYUt80GkgZjBaZSdPFMGNLCJLlO8HWYsj7/SltaSLUTkY8lX2Gls6K7q3nul
         gWaSWrvfCalKEGhw8iWaiXMpX8/tkakLl/AMBFfqemH6nU2jPzaec0cQX0y7iI1Wq1H5
         R6kHS2dCRB/QauHj3R7Ljy1Jo4DFi4x4jXLNSEAkg4rKETFB0o1cGGXfDmgs+6kEa7et
         TvFKCTNoLu0LNWm/J+H1DmhiUZov3DVS0xBGeX8V+nuEaEaKqapb7qVJuCmy2DE6N4S4
         Toag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LUai4RF3uWcr98wEaU7RneH+aH/wmUcT9WxbjbhjsFg=;
        b=h5UrSKL+HS6dN7CJTliMAF5FoN856pN2yxDtcMynTRCpbEj1iz4jzbZTWtqLOwuuBO
         nVVEOQ5HqBAvxDFBmCBB0qKeJdwB3I845KBBN35hBib8ycnP42V8zS7PFivWWzPMdvBj
         fziFNu1tIznjB7o68VcoBrhRGmfdemaCL4rvLpY/Z3NOLxAd9A1kVwnvLvn7ymX+OHpB
         Ku3VjJw3LFIvKc5PV1maxhpjBlhfVRfsI4mlWhbhTzyARcmUHQv73X/5XL9qL9h3qMBW
         NEvYPPcuYqj31myOX8eYiyjwNhJd42/Y8tzirYOvtpZe+Feg6w00etGm2IpCMRugpLQA
         e5oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jjc9zx9C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si11257387qtb.563.2021.12.13.02.06.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 02:06:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jjc9zx9C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwiDp-0003WD-R5
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 05:06:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwiCy-0003V8-1X
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 05:05:25 -0500
Received: from [2a00:1450:4864:20::433] (port=45900
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwiCk-0001XC-G8
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 05:05:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id o13so25986812wrs.12
 for <qemu-arm@nongnu.org>; Mon, 13 Dec 2021 02:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LUai4RF3uWcr98wEaU7RneH+aH/wmUcT9WxbjbhjsFg=;
 b=jjc9zx9CBJzWhgcgO6dLmBKP7ARGJ2NZNpxLg8CC3tW10KQyozDlni+9aFvQZzN8PE
 UdZVMGdlPa99raaovc46LXU97m+C6/3czOV49GY7W/O4y1cnUCs9UnA4++34fqr0RZm3
 OwrTnixGFhm4TNiTRWQM+LUwdPU8IUqFYU0YzdhR2o7ZtmUsiO4jgtbkRq3k6YjqWTdI
 byaBU3S/liSTXtS94W+TpFxWQLQYmXLhSD4HBO+cXilT5SkNX9tY7dpUaFWKU37JHoUP
 MTaVhI4c1ODNnOy0asUTYE7IMGJdujAqO2TX3lY1SiN39Z3DF4Vj5DOZ4epruxildqiR
 jKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LUai4RF3uWcr98wEaU7RneH+aH/wmUcT9WxbjbhjsFg=;
 b=BtW8kIwBEEyG9SkV+9jjbuVyEKqjocgVKIFSU3GPSNurv5J0PUT7EUYyf/KzRyKEpO
 pToE7cTMqF0wobkjUPVh1EE1+PvPdQuCJaHiG346JzZORU6uIKcmWCtbYvk9up7VU5LP
 +vtnu8CHfTrySBSllqQT2ffdXvoSnR50T8GxS3kwW1m50j6zNGuYVY1jGaufuavA16dR
 gdOZ++NNXRtdCA+g3sQzKWsaS3JZSObiS8/piw/n8LAEi/BdykCORPy5GbfkSOtIDppu
 cUsjZvPyTRF0WJ7Vrduc8SnNYWTke2yvMhr/X94iTHlsOVRQD9TWycVB4mXs3Eizgpq1
 yCKw==
X-Gm-Message-State: AOAM533FWiz79WZi4JwkjvfD6eOKkfr3oGNTLSVEleTQk1IPaxmF2Ize
 HeOcxwnhs469dzdOTZqMBvVvXR0MUdCR4mPt5eYQEg==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr31550863wrn.521.1639389908518; 
 Mon, 13 Dec 2021 02:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
 <YbcSOcEy//0DSMtL@myrica>
In-Reply-To: <YbcSOcEy//0DSMtL@myrica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 10:04:57 +0000
Message-ID: <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eric.auger@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WByWWEhs11/s

On Mon, 13 Dec 2021 at 09:28, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> > On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> > <jean-philippe@linaro.org> wrote:
> > >
> > > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > > a VIOT table. Also add the tests for the ACPI table.
> > >
> > > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > > series [2] only contained the table and x86 support, which have been
> > > merged. Everything has now been reviewed and should be good to go.
> > >
> > > * Patches 1-2 add the VIOT table for the virt machine
> > > * Patches 3-4 are minor fixes
> > > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> > >   q35 as well, which didn't make it last time because they depended on
> > >   another fix that has now been merged.
> >
> > I believe the entire patchset has been reviewed and you are re-sending
> > it so that it gets pulled in after the release?
>
> Yes

To be clear, do you mean:
(1) The patchset has been reviewed, and I plan to resend it (ie a v8)
to be pulled in after 6.2 releases
or
(2) The patchset has been reviewed already as v6, and this (v7) was just
a resend to be pulled in after 6.2 releases

?

thanks
-- PMM
