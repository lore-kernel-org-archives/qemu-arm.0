Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7DBCD4F26
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Jun 2026 08:47:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbwn2-0006Fg-73; Tue, 23 Jun 2026 04:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbwmu-0006EU-13
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 04:47:20 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbwms-0006Gt-En
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 04:47:19 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-6607048fa62so5335363d50.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 01:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782204437; cv=none;
 d=google.com; s=arc-20240605;
 b=WVW6SZ5ZLDZEpGrpPCMdEgivKAz7ub58WZxXlKjsGbY5HPjz114ssGga/M6z6QMv7D
 ++cvRIqDDEPn+CBSXyCKrU/lCZvkQB9jJBNuq6J76Tftv2OHfNBAFsDVQ0Uol7hwLJ/I
 4jvSIyZt5mX6hiKnO8hGnNsbLXr8wSZuVgOodduGkpKc/rg0gTSmWTVeMDxfzFcKwhTU
 Op5uBeqrrm0y9Kyn1WNgfOmP3X05ra0xOyz31B5oY/rdptfkPuEFnvg1qI+LTpT68Z4t
 MHPt+m1LTBAtake+o03yGadTtzW2u9dUvEuq2KOqFM1GOua3PHCDcxrg3x6HChfzzZtk
 t23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=M+XN21DYYf+g94DnAvgVrPf/2DuUlhKYi3LWWUgGH7Q=;
 fh=6d6RE824JDgRiiuNykLSXVNeqzBoIaPh0PMjn9CtgwU=;
 b=Jp4rV6a5GA3RLfqDwXL0BFrH5HrNLqiJhio8TqdNl1mdeyGvdK6ST/2YxKsDnisHnL
 ja16Wl2JhKd1GrkpEHjb2rf859E3+eq+FwoFUWwxf8EBCp+4bolCnBgayI/1D/vyP5Ul
 KFngsz/ODcW91BQyqss22tC75eGB7MwSfTSo4PkvyJrFTR9P1N2ABIlr8l/0Ns657NP4
 on+BGyQA6C+5nvG8pajEgQ7ha05IvJA+o7ShKKvvyzhykgFUbFBwgsAXnxdoA6OzP8us
 BqnrnsQTHGrbl6P48nm+5D1Z6M3XFfDhZOmjjfcnhbZkCj3L/6O7RzgTo/bGLRSUMGu0
 0vYg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782204437; x=1782809237; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M+XN21DYYf+g94DnAvgVrPf/2DuUlhKYi3LWWUgGH7Q=;
 b=TH+FcYwKI9ltpY6WksYLny82W30q3Av9Y24s6aRcGy5OWdO9Pr8ngyL9rzNHID0qBQ
 wcy8hRMLgWB3hqdbruBX7osWqjm9Yi0p/sYdn9WeTlNCJTlQVYS/GW5seebGiFxCr0ux
 Ww9UCYbZLa33lxmKLdsuZv3BvNFfY9uJnDMvfquwwD3OfDsk9rjhEAonXtRDI7zwxyLr
 +UpIRDCoNeC7FdxeUDSUhiIKE0g1GflecXBZmJfQhSJvQjxP5r+ae8vTcxXgHCHSdKBQ
 4g5QmfJWGY4CpFoW5GRb+Ipi6oAzsHwOkUTwD4xSG6wXDWPswnVai8/Z+xkN8pGEX38p
 ZqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782204437; x=1782809237;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+XN21DYYf+g94DnAvgVrPf/2DuUlhKYi3LWWUgGH7Q=;
 b=mGqeoFZ/NmUn/Faj10Vpe1RR5TKzyAKw44lhSrY5aqsuYTRtRetW2UqE8fFBITOvI/
 MqSvAunCXxvsBN+JXgdzYwn/HAiUNsbO48g1vZ3IUsgPobGcfIIShz7vqbLFUuPXNlji
 4py+iz7pCIHFshZEKxzgjx3X+cdgnmEr5rDMM726w2ER+aO4xaJKtCGXJplsGwcs167E
 IlQijo2XcpxCCdWXXTZGoNx2eRhFp3avknHtAn4bP0dWN0jgUwkfaufOULsj/XAoEd+E
 Se1NO9mNmiRtJbaJ6N1t2Ec0EF2069/84qlggj1emNBPrVKSPAmEzzoBfpKKtBIFUBZq
 N8iw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrCRjv8Q2MXfyaSOKhpc/0KxclIT5tZems0GjEHbBwDFykwdmwLBDdkdu67fW4JJMT5dLf2fM7gWA==@nongnu.org
X-Gm-Message-State: AOJu0YzdixPnbPFWmNAAubVphUTPXTXIHpSUHF/ukF0ZqGZfRPMnxupk
 RxYWMU5R47qqaOqrnBUzFyX4de+q2Anq+zvZeLbompTnr/n68I58oR8JhjvFX6EF2Xtm3l39CVD
 V9jKbGks2xyxjJD5VBvk+hBJ7v7uZVmmqfXDtjh1oig==
X-Gm-Gg: AfdE7cnuyCwq2G+/7oCI5e3ckbB5JZVjsdoJ+31mm0Flg2hzRafwMsh1ABxdyAj/VTO
 Km62G7PvQzAxjhOcDf4dhst6Nkj1rPexKVafJMdbSuJhPunJFT6sXzOq8lpI4u9l3ijlJNuXqQy
 /eZNlaAYyICQO0SbBsRRxoKG8JByhVAEmZwMEz6enQPJ20fg8XJchDtXdT6GwexXsSx+0fkL1JK
 VPgDzTYl9rj7Nym4nEpk8P1KZeStKxbXM7CmXyTC76MY4HpCwXsBGQWfXv/lUVB8dSzoRHIbYFK
 iZogaTsBIWm9pxL0cqOrUCWygSYLoH0nKxgmSoOxWdRIBcby6S4YP2lhRuATM9RnG1A=
X-Received: by 2002:a05:690e:d4f:b0:65c:13be:3bb7 with SMTP id
 956f58d0204a3-66312f8841amr11960828d50.51.1782204436884; Tue, 23 Jun 2026
 01:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260623075101.17770-1-skolothumtho@nvidia.com>
 <1105dfee-f1bc-4ba0-b8b7-0382c95463c2@redhat.com>
In-Reply-To: <1105dfee-f1bc-4ba0-b8b7-0382c95463c2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2026 09:47:05 +0100
X-Gm-Features: AVVi8CfQihkXtkWJXyCoiAxgs6bIuUaINBUoOJDJIYOeQGZt2u1GMijH5lLBqeQ
Message-ID: <CAFEAcA8DcRGHDK_eA0zftVLX28Ufo4cPXWf36Nh4obOE0WDb+w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3-accel: Fix veventq read returning true on
 EAGAIN/EINTR
To: eric.auger@redhat.com
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Tue, 23 Jun 2026 at 09:32, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Shameer,
>
> On 6/23/26 9:51 AM, Shameer Kolothum wrote:
> > smmuv3_accel_event_read_validate() returns true for EAGAIN/EINTR, but
> > no data has been read into the buffer. Callers treat true as success and
> > proceed to use the uninitialized buffer. Return false instead and guard
> > warn_report_err_once() against NULL Error in both callers.
> >
> > Resolves: Coverity CID 1660057
> > Fixes: d4aea0f75b ("hw/arm/smmuv3-accel: Introduce common helper for veventq read")
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> > ---
> >  hw/arm/smmuv3-accel.c   | 6 ++++--
> >  hw/arm/tegra241-cmdqv.c | 4 +++-
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> > index 80900c2521..6d402d2ba6 100644
> > --- a/hw/arm/smmuv3-accel.c
> > +++ b/hw/arm/smmuv3-accel.c
> > @@ -451,7 +451,7 @@ bool smmuv3_accel_event_read_validate(IOMMUFDVeventq *veventq, uint32_t type,
> >      bytes = read(veventq->veventq_fd, buf, size);
> >      if (bytes <= 0) {
> >          if (errno == EAGAIN || errno == EINTR) {
> > -            return true;
> > +            return false;
> >          }
> >          error_setg(errp, "vEVENTQ(type %u id %u): read failed (%m)", type, id);
> >          return false;
> > @@ -491,7 +491,9 @@ static void smmuv3_accel_event_read(void *opaque)
> >      if (!smmuv3_accel_event_read_validate(veventq,
> >                                            IOMMU_VEVENTQ_TYPE_ARM_SMMUV3, &buf,
> >                                            sizeof(buf), &local_err)) {
> > -        warn_report_err_once(local_err);
> > +        if (local_err) {
> > +            warn_report_err_once(local_err);
> > +        }
> >          return;
> >      }
> >      smmuv3_propagate_event(s, (Evt *)&buf.vevent);
> > diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> > index 29c488e0e4..bb0b417e90 100644
> > --- a/hw/arm/tegra241-cmdqv.c
> > +++ b/hw/arm/tegra241-cmdqv.c
> > @@ -845,7 +845,9 @@ static void tegra241_cmdqv_event_read(void *opaque)
> >      if (!smmuv3_accel_event_read_validate(veventq,
> >                                            IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
> >                                            &buf, sizeof(buf), &local_err)) {
> > -        warn_report_err_once(local_err);
> > +        if (local_err) {
> This is not aligned with the general policy. If a function taking an
> error handle fails (and returns false), it should set errp.
> Don't you have a way to initialize buf in smmuv3_accel_event_read() and
> only call smmuv3_propagate_event() if the hdr of vevnt is checked valid?

I think fundamentally the function has three return states:
 - success
 - failure
 - try again later

Probably the simplest thing is to not use a 'bool' for the return
type but instead something that has 3 values. Then you can set errp
on the "failure" case, and the caller can tell which of the three
cases it is dealing with.

-- PMM

