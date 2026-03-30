Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC822FB3CEF
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 09:49:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w79Et-0004CF-L0; Mon, 30 Mar 2026 05:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w79Ej-0004BK-GV
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 05:48:45 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w79Eh-0004rB-UF
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 05:48:45 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64eee7b83cfso4100205d50.3
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2026 02:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774864122; cv=none;
 d=google.com; s=arc-20240605;
 b=cVMYKKWZm04lkHec28+k5M1ggdvj+c6kD6lczxOIDmNTuEKTZyPHLssx7CvCGUZZzP
 qOqjniQmiJmlwplF0gCXYgPGzm5dwXSrqIT+tCNTZdf0ScBxaqxtaDdSXBQwV7L0sR2n
 /NYhe90lJCDsQdWyBqhBDqr+oVU6gk5DxAatExdjU+URLp6L9385q3H+kKs/NvA5RygY
 k1yiAuHh5z33/GP8uQOHT4p/YSnN1IHUtjLp1/VCOTKynVwh8S1sJUXmEPzmTr+lScLJ
 nEOMgu4rFm9sNl/j1fqSmcHdAk9LQrZQh+XZIXqCZzmkCnyXLbgjHGVsHemuUJC0b+P+
 Cp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=iycBXHR4OTtAqOojCOVJqRWbKeXzzC5WpBs226XflUw=;
 fh=SZwPCO4KAQE5K1TTlyMDDuchVJnQEOTjnaUERZeIh7s=;
 b=B3mXqzItxR5IeHR5N7fVK0/5a8rVRrynqFHBCkWxUmG7YCNv99IAtBaQzWKII/A8rh
 Br7pof+d7EsCwGQBeHPADdfvoi1esd6Gi+v/4+GFf1l5EJhUEVtxwyNKs1o9nN7mc1VS
 ojgCWqt+mmSzayIwi8BqyMErWjfhhxEdk2w4eXXFDLRUIu/dAKvPz1btQj2El76CBT7C
 fKhq/K1Nd0+kMdKQzYDcQIBsunuLpZD4vca0IvXPjJYFeonsAbJ8DBwX6KLBnFs/IAMF
 NGCxl2bOoHAaPh+46HNASvLek6CX4XLXQBiCcG0hgUdK6Pz/nv9sCKozGnxNAySzVtua
 u9wQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774864122; x=1775468922; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iycBXHR4OTtAqOojCOVJqRWbKeXzzC5WpBs226XflUw=;
 b=ruYXpEr9ZYy3j6YVrbaj9F4d9kaXuHPmUfsVOwGR7IG89f6ztp+lP1Qb2ec2r+BFeP
 2tfXOP5puZvwMSyVD8seya90JADqz1OoolrrgUQPUAEecG35XsXu7RhQbp9PsbdF9XYq
 MJMs2ANZYdSal3Zdk4xRXEFXzYikKwtHgTthtrdIBRXsZuT7rREGYY0D0Q53wsNjHzYC
 m1R5R2BhWw0tuGhBA0Wdz5mK6IdC/RVmMOaCmLqDVQb+ZTbn35r7LAdUR/tpscuq5Ahg
 2IoLPs3B+QilTseXEPta7Rb7ym37PDLkaby1Odw9DlJ2DUo8KuiH9QwjIltckcQHSUq4
 6w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774864122; x=1775468922;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iycBXHR4OTtAqOojCOVJqRWbKeXzzC5WpBs226XflUw=;
 b=hFmzUEva+HSiP8qgjcu32SN6vl1nCQ0PFpqnjkklz/Box2PebApjWDnChngto2aj7z
 xIWfEVz+nSYi5o84RVgvHjinhz/bwNrvgLBRG6CMdicCTrD9zbyCM3XhvFyQDejl1E+a
 Acl3orlDqKRi66f7Q2DEmbelcbvUkriDM/jU2lq5ZVgzuRHK17JHhOr3Zp+0i1JwHMCL
 +vzNIZbNW1Fcp9Py3yZY2OQtpsYkO2gsjyCWRPXTlkkpALfuOnoth3TAcng6xJumYJx4
 8YDtvmcd6OiwAa/NxiEWBQsjg36t5QZrPMafEv1CFOCz5mpSBcyPWpSxsGVaShcxiV7t
 NkHA==
X-Gm-Message-State: AOJu0YzmYziK9el04oFMI7u5SjEvbUGLzcbRCrzKhOgKNbI1JuyDVu3D
 h8VF0G9rn7/uJ48c6uw6mUocLbkWERSUYZ4M6WMfChk9Z2lAzcA7kHTR1VJU6mp74mZfI6VprlM
 Vm/YUxxM2S6UKxsgeQisehvbSJn9XjeLXxEJHfoKcDw==
X-Gm-Gg: ATEYQzwtFXv95fVcQET8NrM2yDpLKj9kOv63MvIyRwbJP7P5QfsVWbP7LBkkURkYKk3
 IpfeaAF8CXtp+FH4m478r9mRkOEDKZy0t57hOvuiP9XrmOaYfQT76JGh9NbabKnDGASwrW9u5cX
 eBB22KxVBNWE9nP5TSIyChg5NutXG/97Kf03bFaAs95jOyZW3caRUC7BQqP2tvcHOxo/wg31v1N
 RtnzI+mmsZsgWPdSLmsl5o6QasVgPQ0OvIlHoqtDoOLjVGmWxCqvd+Adw5ucfTc7hOoXpKE28QG
 VU0w71JCeBt2BcXVCdTgRIlolLCCpgeoVPmisIYqZ+k8Uk4b+UEeDGZXiwKZhl+umeM=
X-Received: by 2002:a05:690e:2251:b0:64e:a1f3:e5c9 with SMTP id
 956f58d0204a3-64ff741d88cmr7876521d50.57.1774864121679; Mon, 30 Mar 2026
 02:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260327145012.907264-1-peter.maydell@linaro.org>
 <f31d3ba2-b843-4322-aa8e-2c5a1cd76fdf@redhat.com>
In-Reply-To: <f31d3ba2-b843-4322-aa8e-2c5a1cd76fdf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Mar 2026 10:48:30 +0100
X-Gm-Features: AQROBzCrCjyaQBwlWbMfmSV8leTPOggZ0jndM_HDgwKjxlOLP347-UrJGdJj008
Message-ID: <CAFEAcA8UQsrFo3nQRN_3F6CAKQGWCgv1AsEP7w8FD5-EWDh8rg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Use strcasecmp to parse boot-mode
 option values
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 30 Mar 2026 at 08:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/27/26 15:50, Peter Maydell wrote:
> > In zynq_set_boot_mode() where we parse the string the user has set
> > the boot-mode option to, we use strncasecmp(str, "qspi", 4) and so
> > on.  This is wrong, because it means that we will ignore any trailing
> > junk on the end of the option string, and handle
> >   -machine boot-mode=sdXYZZY
> > the same as
> >   -machine boot-mode=sd
> >
> > In the documentation we say:
> >   Supported values are ``jtag``, ``sd``, ``qspi`` and ``nor``.
> > and that's obviously what we meant to implement.
> >
> > The correct tool for this job is a simple strcasecmp operation.
> > Switch to that.
> >
> > We use the g_ascii_strcasecmp() rather than plain strcasecmp()
> > because we're comparing ASCII strings here and don't want the
> > potentially locale-specific behaviour that strcasecmp() implies (and
> > we're trying to standardize on the glib function for this kind of
> > string comparison).
> >
> > Fixes: 7df3747c92d13 ("hw/arm/xilinx_zynq: Add boot-mode property")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> > Kostiantyn: I sent this patch out while it was on my mind, but
> > don't worry about conflicts with your series -- assuming your
> > patchset goes in first I'll fix this one up later.
>
> No worries, go ahead since you can apply this even for 11.0; I'll take
> Kostiantyn's patches and handle the conflicts.

OK, great. I'm going to do a pullreq before rc2, so I'll put
this in there. Or if you're going to take Kostiantyn's series
and send it out for rc2 then feel free to put this patch in
there instead of the one that fixes up this file.

thanks
-- PMM

