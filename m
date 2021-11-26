Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp928567lfk;
        Fri, 26 Nov 2021 08:55:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytUEBpbJYKdx4Up7o3SzwdIXvAwNhf/bbdzrLzMyvEfYrxU7tvKI5VkSjGuJcNB00qNSJL
X-Received: by 2002:ab0:164d:: with SMTP id l13mr34672285uae.34.1637945717347;
        Fri, 26 Nov 2021 08:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637945717; cv=none;
        d=google.com; s=arc-20160816;
        b=dqmjyKIwlRi4bUMvsf+UzKy6f8qe2/c15fuWQsNkF1hJMprOElnNln7yqZAX6RACVL
         aO5lkWYa1tzm54N2hEyAC1plfdGgnKh7LeFekaITY1GbQH1a7L6PwELJWhoKq1K3f7sh
         uuHw2uO7o3qKsPoGUJGNJPHzDup3d4Fsdwccur2yJA8UfvDSbvP7AQzMzTUke1/m9pvl
         6VO6VuoD96SbDiVoXAXYo3DzfJUXlMsUIHtrtwV4rxx0tvhbmWUn3uIryuOSvcMZHfJ2
         Jc4Lgqss+j2UamBBvRf084euHTfxArqOy2f1cO/jPX35xPUZaWfFUYnJwV25ke/MqN3b
         7ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GMdirr5DOzumIV9LVk4HRmSZnV6fmeYKr179wY1h48o=;
        b=F8BJbGfgAke6JSgj6EbpaiM0dZdaoGh/D/GpQApn/bAvMsSPfeMbBEs9hPflj7T2tx
         XIeHaWNMCetUCY8LIoAmc51otz2uIlAJBm0BYutcaiL39wIHDjLWb3EEtszwMRALwLkn
         uuzLsYX4vCDof53U5x00EDK39NzDv+ip3hU091HtI0CzA16PxVNKGOt0m+MbusLStTXq
         PAeUmqukp0I8qxO06TMk57iTJzMUkVkgBAiKgfPMLpL9qxNudASaaJAjqs46TjNnEGic
         m5Wj5qfpT29kQsB8K4NExqg3mHZ7TBOEqBct4rmpfaglKuq9gOH1NcZl7rF/Z7M4zbU9
         7TRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vMsMG1zA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si728763uav.248.2021.11.26.08.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Nov 2021 08:55:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vMsMG1zA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mqeVH-0008Am-Vl
	for alex.bennee@linaro.org; Fri, 26 Nov 2021 11:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeUz-00088w-IN
 for qemu-arm@nongnu.org; Fri, 26 Nov 2021 11:54:57 -0500
Received: from [2a00:1450:4864:20::42f] (port=44562
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeUy-000675-1t
 for qemu-arm@nongnu.org; Fri, 26 Nov 2021 11:54:57 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l16so19924000wrp.11
 for <qemu-arm@nongnu.org>; Fri, 26 Nov 2021 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GMdirr5DOzumIV9LVk4HRmSZnV6fmeYKr179wY1h48o=;
 b=vMsMG1zAtNKTIFraA3M3tWFlu1pE8sFoOceJMCoSzvbxpW8PWlBmaDDgwkEDwsRNa1
 RLXdYXtjpJ98pynWpIHGLpqZClexZfAwkUgnYKmzBrXDoWx1pIMbXVjhPv+pOIiR4DXn
 LC+lp+VJXwDXPEGztgRqrrtgyc2pEa0Bk7rG8i2iR4aUq4R4tbqKKn1sbLm3H7hJpspg
 Z+vvx2V6FpWMMzSBjBBSEsMlIre/sOxxgdUthtqZo0HhmSLF1glGUpgky5vDuFj/67P5
 Gd5xJPb1T2+Nwiwjhhv1GZGCR3QxUSjX1Cc59/l7i/eclayFZvqENIEGKfCx9TNF/Hzx
 QG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GMdirr5DOzumIV9LVk4HRmSZnV6fmeYKr179wY1h48o=;
 b=yUchGVpHMTrFMOZlfDPAOs9XdgyG0p5MgLsipkTGAZ8X63/oZ2+6QO5s58A6wOOyx2
 /AIeGLLJfSueg6ArEC9Wj7MWMwBtAfIoQFrQpBp9OMkC9JlcYINz7PFs4JnUpkkCHpz3
 Xhjz1GlQKYUV+l7NUg9SRD162GQrx9+zghNDDJ7fQdUM0xLgDx23s3uUMQ9//pAMTYMM
 4mNbDEosVLoeJGjw40yZ3fp0Tt0CqBwKnXB1PzrnjcaaXtse/mHzF/hUpYuKfQql8ic9
 zetzVFStTTklbpM/+dQa9nTJAvIZJLkojHkVQA8Jiwsd5x7Mxak9Ch2ELAVHn63//wYf
 JJMA==
X-Gm-Message-State: AOAM532BU6CnHiMx3+YLSfQUIqG62quKGTwZJxUt5BWcd7+CqaqLWihw
 /SXL8fNWkTVTYj14oBrq9b7rsJN63MOoN9L31JkzvQ==
X-Received: by 2002:adf:ef42:: with SMTP id c2mr14814790wrp.528.1637945694797; 
 Fri, 26 Nov 2021 08:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20211124182246.67691-1-shashi.mallela@linaro.org>
 <CAFEAcA-spJc2Dg=D=9=XgPYxdzi_d4sJh27BRDW_DD9y_+O0JQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-spJc2Dg=D=9=XgPYxdzi_d4sJh27BRDW_DD9y_+O0JQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Nov 2021 16:54:43 +0000
Message-ID: <CAFEAcA-xOJL52QqyTVx3UOu5-LdV251GbNgb9+saDC4Tdr8S_w@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: leif@nuviainc.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JuE/+B7ZwHkq

On Thu, 25 Nov 2021 at 15:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 24 Nov 2021 at 18:22, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> >
> > When Enabled bit is cleared in GITS_CTLR,ITS feature continues
> > to be enabled.This patch fixes the issue.
> >
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 84bcbb5f56..c929a9cb5c 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -896,13 +896,14 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
> >
> >      switch (offset) {
> >      case GITS_CTLR:
> > -        s->ctlr |= (value & ~(s->ctlr));
> > -
> > -        if (s->ctlr & ITS_CTLR_ENABLED) {
> > +        if (value & R_GITS_CTLR_ENABLED_MASK) {
> > +            s->ctlr |= ITS_CTLR_ENABLED;
> >              extract_table_params(s);
> >              extract_cmdq_params(s);
> >              s->creadr = 0;
> >              process_cmdq(s);
> > +        } else {
> > +            s->ctlr &= ~ITS_CTLR_ENABLED;
> >          }
> >          break;
> >      case GITS_CBASER:
>
> The code looks fine, so in that sense
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> It seems odd that we have two different #defines for the
> same bit, though (ITS_CTLR_ENABLED and R_GITS_CTLR_ENABLED_MASK).
> We should probably standardize on the latter and drop the
> former.

Applied this version to target-arm.next for 6.2, anyway.

-- PMM
