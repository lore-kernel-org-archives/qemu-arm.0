Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE1F1090223
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 13:23:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3DKg-00088d-55; Thu, 19 Mar 2026 09:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3DKb-000884-N0
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 09:22:33 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3DKW-0006WM-Ml
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 09:22:32 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64ad9fabd08so568082d50.2
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 06:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773926546; cv=none;
 d=google.com; s=arc-20240605;
 b=HQtt1OM4nsJ7MdbQMFolYDVOP3pjNw5hfMTOGOEwpy/iT0Jr4xLO/ztUJSlx4rIglv
 1gzEslV8yfEild3pHYIZjHpkBVUZevL278teL7phyAhwAJJCDqsU+zFX2Mo1Ylv6e0Gv
 y16LzwjjVqFrdF82OCIZABQ314gv3EJ3F8KB3S8l8+wgYS8/kHB5/scOY6fp6piROMWW
 OK51MXSg/xpo2J1ZYMIeQFMXGFXHmjrKDsynQlDGWuOaw29iztulKgnPG/1UZJrPyvGj
 k3uRLR28tq/sK0+TDWcFZBx+3AHJenFWIeW8MeaR1/RXIPmgp+VhJlebqI5ZRLtdVtMm
 qF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OCoZnCa/QBkJw5AMvENPcliP3ZgTbJfa4Y89s2YRD1k=;
 fh=tLP/gRpi7Iczn5ziGL7f2zBG1RdOSHMz6mExSpHcScY=;
 b=YhNPLJJLD24qg4TvgqxAf32VTq+UwKpslA3EPvlN9raVyjqsyQMTlqN5PqLZSdVM4H
 G5QySUtd5Kc5JDy8SkEHn+BsWmJ61YfSyuGFhVksaGqiof+AVjnScC+hBNpiw1S9aupv
 ioCautkr6NR3J+5tTGkcuL9jup1OcFds9WdAbVDY/muWOcDwCN9wGmeTuWdgUpNPi4XB
 PesgE1CLj6V7l+lIUr1LpVzFkXeb7phBOBh66SnyQEkezRtVIwe3Yq8bcniZ0afqTTN3
 XTdtKkXybxd9aOrT+K9gkO5qJq4B08DtvPAbjLSe7KuhG0O6fJhnPZUwBCB82B+kXQC1
 y20w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773926546; x=1774531346; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OCoZnCa/QBkJw5AMvENPcliP3ZgTbJfa4Y89s2YRD1k=;
 b=I5UeeZuG3ZFb6/+6V/biaO5RY0h6e983EzMP26a/92d3T9IEBXEhNz9zTLpAGWhJu/
 oV4WhfBENiqEgf7AiVrllF646rTwCZQvvv21E+eEK054s4ocd/GTQZVRmwvm3VBOb9rC
 WPr0bS/8xuQ59m/UZWwNO8OLlotrGoWAHmnoatnOzUWLWqJzWQEqkVYvF5vo35cmEZhi
 74uneC2c1OIz7hc3gnpxeGEjJPEVpM5qdPyMcLhp5UxVkZj/VyaPTp/+8gnX/iEztect
 xCrZeCYEISmlEAYY46106xZpvvauhuVXo6czOJ9BCCuPsWk/a72UFjRb9AVu0LtbYL9a
 nYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773926546; x=1774531346;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCoZnCa/QBkJw5AMvENPcliP3ZgTbJfa4Y89s2YRD1k=;
 b=nX68Ct8QtIprpNz3mswhzKwe5Ze6eUEbfS+TTnneMfslBSxua/YTx7aDnGOFwDtFSz
 5ffPIeRJhuCrzZebmMwOmUrZ4mSqTiUiqvKyIYP45uaz0um70nVNb9u6BxpDHffBBQyI
 qzC2YZtlA67t2tgciQ1Iu4fSadjf0OU+Cmyt2Jk5tLLJvdBEN4TAPcx+YV7OqV2UMLIZ
 UN1H9c4yEgdwZ42PCv78BM1ULvdBQoihmrLuNRreiA3DcoDpefi5UVOXSx59hJB38hOE
 0hQPu1ibdYliCDUnasMSe1uZxdhMDlN86BTBjJZUEk2td4zdDaJ0CezMCdRsKzLdx1yO
 r6mw==
X-Gm-Message-State: AOJu0YyvKl8hVZb5PLuRPf+eO07M901iouBzJSO1FPAwTU71gy8Qssy4
 McJBBMVG9YAc+qZDfxP+ryUh8E8il+Ti/66S0l0Cbx98e3oeKpathuYecTmZVCc1umiTsonlPY0
 HP81s3q8JNiOMkgTDZ+qBmCgBtMTJ1scLUWABa6tH0g==
X-Gm-Gg: ATEYQzyXTaf1Eu6c2Z/cYOjEuZTADGnC6DtmXadqoh/aSgu7F+Rd+hJoO0DEdeEiVbq
 JWmj0bsYJNltyktyA/z6JeRPK2T2XUVuzQxjaaW24yPG9j8UYTKMKm3t3K8EgoFffSBevNziC1b
 4NOMyhScUhpuP0juy3w7Tq4HOh2sY++ZsKv88ljlBtF4r/vP5AS/h38eWaQwV7f3OgNJCd8Q8lI
 jIxCRLiBh4lPu/pd7Tm7CrF/MX3BRGIyB+VASH5O2X8WbHhMOJe8f5IiIgHHR4BLlN+kJVPzfkl
 W9DKVGHfg4M3heLh8vKn65tHDR2o57RmCpjGjxwNTW6MPAUmin3moeF2gZTmfMjrgic=
X-Received: by 2002:a05:690e:8:b0:649:d3ee:bdab with SMTP id
 956f58d0204a3-64e9136c8f4mr5315043d50.34.1773926545837; Thu, 19 Mar 2026
 06:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-10-peter.maydell@linaro.org>
 <20260306161617.00000f71@huawei.com>
In-Reply-To: <20260306161617.00000f71@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Mar 2026 13:22:14 +0000
X-Gm-Features: AaiRm52-wDBY08rIaQcaDkA2S9--qNNwg1P79MWAxe0IRcNsepRRrxdQMBa1ngs
Message-ID: <CAFEAcA8PJ6n60nqXEEg75uxnOp3ybBPNX6HE5CRjBA8y2YpOdw@mail.gmail.com>
Subject: Re: [PATCH 09/65] hw/intc/arm_gicv5: Implement IRS ID regs
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
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

On Fri, 6 Mar 2026 at 16:16, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Feb 2026 17:01:16 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > Implement the IRS frame ID registers IRS_IDR[0-7], IRS_IIDR and
> > IRS_AIDR.  These are all 32-bit registers.
> >
> > We make these fields in the GIC state struct rather than just
> > hardcoding them in the register read function so that we can later
> > code "do this only if X is implemented" as a test on the ID register
> > value.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/intc/arm_gicv5.c                | 112 +++++++++++++++++++++++++++++
> >  include/hw/intc/arm_gicv5_common.h |  39 ++++++++++
> >  2 files changed, 151 insertions(+)
> >
> > diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
> > index db754e7681..f34bb81966 100644
> > --- a/hw/intc/arm_gicv5.c
> > +++ b/hw/intc/arm_gicv5.c
> > @@ -268,6 +268,62 @@ REG64(IRS_SWERR_SYNDROMER1, 0x3d0)
> >  static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
> >                           uint64_t *data, MemTxAttrs attrs)
> >  {
> > +    GICv5Common *cs = ARM_GICV5_COMMON(s);
> > +    uint32_t v = 0;
> > +
> > +    switch (offset) {
> > +    case A_IRS_IDR0:
> > +        v = cs->irs_idr0;
> > +        /* INT_DOM reports the domain this register is for */
> > +        v = FIELD_DP32(v, IRS_IDR0, INT_DOM, domain);
> > +        if (domain != GICV5_ID_REALM) {
> > +            /* MEC field RES0 except for the Realm domain */
> > +            v &= ~R_IRS_IDR0_MEC_MASK;
> > +        }
> > +        if (domain == GICV5_ID_EL3) {
> > +            /* VIRT is RES0 for EL3 domain */
> > +            v &= ~R_IRS_IDR0_VIRT_MASK;
> > +        }
>
> There are some more complex RES0 conditions that kind of build
> off these, like VIRT_ONE_N is RES0 if VIRT is 0, including
> I think if VIRT is RES0 as a result of the above.  That particular
> condition is perhaps worth encoding in here as you can see we may
> have it implemented for everything other than EL3.

As it happens, I have no intention of implementing 1ofN support.
But yes, for consistency we should mask it out to follow a rule
of "mask stuff that will appear differently in the view of this
register in the different register frames".

> This is similar to what you do for the whole of IDR3.
>
> > +        return true;
> > +
> > +    case A_IRS_IDR1:
> > +        *data = cs->irs_idr1;
> > +        return true;
> > +
> > +    case A_IRS_IDR2:
> > +        *data = cs->irs_idr2;
> > +        return true;
> > +
> > +    case A_IRS_IDR3:
> > +        /* In EL3 IDR0.VIRT is 0 so this is RES0 */
> > +        *data = domain == GICV5_ID_EL3 ? 0 : cs->irs_idr3;
>
> The spec has that condition on a field by field bases. I wonder
> if it would be clearer to mask out each field rather than set
> whole thing to 0.

I think that the whole IDR3 register is clearly deliberately
"things related to virtualization" and it's clearer to zero
it all at once rather than have multiple lines and leave the
reader wondering if any fields don't get zeroed.

> > +        return true;
> > +
> > +    case A_IRS_IDR4:
> > +        /* In EL3 IDR0.VIRT is 0 so this is RES0 */
> > +        *data = domain == GICV5_ID_EL3 ? 0 : cs->irs_idr4;
> Similar for this one.  Most of register is currently res0 and
> we don't know if those bits will be used later for stuff that
> isn't dependent on IRS_IDR0.VIRT being 1.

There's a lot of spare space in the register offset map
after IDR7 and before the next register, so I imagine the
intention is to add more ID registers if there's a future
need for more ID information that's not related to the existing
fields in any ID register.

thanks
-- PMM

