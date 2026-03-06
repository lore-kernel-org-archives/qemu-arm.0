Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E71FCC050
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 18:28:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyZtZ-0004Uz-TO; Fri, 06 Mar 2026 13:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyZtO-0004Tx-Gy
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 13:27:19 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyZtL-0004PW-D5
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 13:27:18 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64c97997b0fso6837415d50.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 10:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772821634; cv=none;
 d=google.com; s=arc-20240605;
 b=XPro96smFaGL2lgJ+mN+G/A50rMDLsQUJ3nUrWZi5X60mO563FIP8TUUfKYzTvAoFm
 6RPXKQcHoKLn1e2Xw2J48jxg+mT+BhQpZ+/nye9EkZ+HB3kGgaFbTqE+OI9D2/WGCNGE
 F8YA+GZQrMZZpBiHMqVejSLZw6NMiGstRW4Dgvev5l3Hpj/dMB15GkkWqvoAKMWSKRJy
 sYJqLO6WLMmaN6Sl3DokUL4akhlPtY0LCy4bmroG3qShmQ7LhvNm9QrfM2MbcVjjrjRW
 FGxwjHshELq7HYdEDGqUOE9hkMPQtZeYPG4LmoW2S/k/yECqGyhz0gHam2eEc5/zNepq
 75YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vKznKg8kbE6VKmXiw/aLTPKUGyAueb2MWAi7kWLEtQw=;
 fh=tLP/gRpi7Iczn5ziGL7f2zBG1RdOSHMz6mExSpHcScY=;
 b=JOZ/VIMl2TqBEmCBRWttQTNDUPHhvXf9MDgf3OQIAnUgYDJmpBWt5tCvgbGHaPTRYY
 XOPFykdRghxf+8uzjgvNIoRDT/zHF6VXJBr6E/WlSU8lr1DIcn+Lpqy8l2FTkcBKKg9N
 3iaFHZZ8vVrM2fpXZRXXnSoDWO82AEWgb315Ns/YZFz8ZLCjGDKPyMTrq5liTulRp5Xk
 fIqjNIatD7OlvU5JJ7IfLir0aua4m0uMftpDTyOdu3FcQmmuOK1dthmkzqQzbkVg2XqV
 h/wFjAmtVrCVt7QbbPVbNXh/jkU8HsstfHiEh4a3RsVEXDKaS6W1FXV4X64dDfC77tfB
 Z1Yw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772821634; x=1773426434; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vKznKg8kbE6VKmXiw/aLTPKUGyAueb2MWAi7kWLEtQw=;
 b=XQZfkTQcRwhT3UKzS95CHpG6ghdHnkp7AHq4XsHHo6z112HzpJyigHTX9Rt7AiNTyo
 jl+2mcbZ7I+2mSziNnnyafYlMxDJNfPCk4nUiSQ48dhD+RQdSk1BrU3L0oRak5GxgHmt
 KBYBUmLJLmNJaJGrz4QbAi9I+inZYWiA+i2LiyGfgKo14zFnnZUVUvgGZSFrA4E65Tas
 6o61c+dvD41IbLJV2hayPe1WcGFGxANSQWAhSpMxeO5qqY0+29KuzDBizoZeLcAK80Po
 i6YcAe544hCNWS1ojU54JyBNz/nfULP2orlV9pA6hAx9SC+jl0ivpyC27BNDlOkBhtpF
 LPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772821634; x=1773426434;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKznKg8kbE6VKmXiw/aLTPKUGyAueb2MWAi7kWLEtQw=;
 b=n6KGxZlDlnIEPZoW4kOcrotTGe3sE0+uk4NX9KUUZ1q2zSSrlfEHXKT0JFs0pFV9il
 5FJP6F5r8okieVFCs5+/w6y9+14aXCD7+tAdGmns8T7zcsNTzkHi6OziK9wnMGaXVfwj
 ZVDvg6oxPyUQLdnIlcHBAtDZOR7htnPsPmn7LEGjcD1MdMR/Onm6dqbSUmO/WvVbPngx
 W399NdWKsyQaePu7PrX/D6p34KSZwd+FKzK5oxd5+0YRQ25fPvauNMduBuCvQRigwMt8
 wP+z0DFRN1JO5g+pln8vkVhX5CzLriPZ6uYTWg+44rLnMezqgsYu86h4hIQRPjDNHwGT
 C6CA==
X-Gm-Message-State: AOJu0Yy7V0ZDXHKGKHsInaGyK1kE7ihuhdWEH8im6yoU4807Yg2fGlrO
 0KuvcSucwJI+L4k4US01XFENng60xT4oQSnEmSzDcBrz9ziocFmSFuCjtQIUOPF/q4WjBH1RIKz
 6xY8KKwxYgNO0BTt8X1nZZiiYl9mei9Vbi+wXR7OS7QW6k2ezp4mT5Yc=
X-Gm-Gg: ATEYQzxjVHmWtGW/2TDMHfy9Gk6xwDdJxgSdqHv6Bgm72inZKiHAZ86uEjQWC5UDdFG
 rSVg/U4IjoL6AubkQ55bRzkY3WzEjvrfiIp+NjO5SObkm0vmI2do6Td3zNO+dR3dBTULo7Bm9/X
 qBaoM6KIaL1ZWZRwe0rMyCPAi5fjzm5oyEoy547S/9TomrbS+piuAoymEZFa/aj8e7yQjPR3sv8
 83CL/NOSggtFkdM2VC/KwcRITfJKyfQSdDjyPZqRqB4SLQ7TB88hLelJAfq0AcepT0gf4k9tBad
 C7OL4DslOpUsxOreRV4HqtFM66UMD8nT5JxBz3EEMNcr7LXKw62ygWeF4gQqaN9AUHvuHmbUo2q
 IVQ==
X-Received: by 2002:a53:ee65:0:b0:64c:a63f:87a with SMTP id
 956f58d0204a3-64d14380ef5mr2295233d50.79.1772821633731; Fri, 06 Mar 2026
 10:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-16-peter.maydell@linaro.org>
 <20260306173942.000008c8@huawei.com>
In-Reply-To: <20260306173942.000008c8@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 18:27:00 +0000
X-Gm-Features: AaiRm50fSEjeYjydGvMhaK5ACqlNoJO-h-h7DcbhZusj1LaYdFa1mVg7uB2dufI
Message-ID: <CAFEAcA_zOCDyHrZV6+JmU4pw_T5TTv9W5sZTL+aO10Mzf2cFvQ@mail.gmail.com>
Subject: Re: [PATCH 15/65] hw/intc/arm_gicv5: Implement IRS_IST_{BASER,
 STATUSR, CFGR}
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
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

On Fri, 6 Mar 2026 at 17:39, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Feb 2026 17:01:22 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > Implement the three registers that handle configuration of the
> > interrupt status table for physical LPIs:
> >
> >  * IRS_IST_BASER holds the base address of the table, and
> >    has the VALID bit that tells the IRS to start using the config
> >  * IRS_IST_CFGR has all the other config data for the table
> >  * IRS_IST_STATUSR has the IDLE bit that tells software when
> >    updates to IRS_IST_BASER have taken effect
> >
> > Implement these registers.  Note that neither BASER nor CFGR can be
> > written when VALID == 1, except to clear the VALID bit.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> One query inline but it'll probably become obvious later, so
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> > diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
> > index 7db2c87ddc..2a49d58679 100644
> > --- a/include/hw/intc/arm_gicv5_common.h
> > +++ b/include/hw/intc/arm_gicv5_common.h
> > @@ -62,6 +62,9 @@ struct GICv5Common {
> >
> >      MemoryRegion iomem[NUM_GICV5_DOMAINS];
> >
> > +    uint64_t irs_ist_baser[NUM_GICV5_DOMAINS];
> > +    uint32_t irs_ist_cfgr[NUM_GICV5_DOMAINS];
>
> Feels like you are going to have a lot of these, why not an array of
> structures?

Six of them in total, at least in this series:

    uint64_t irs_ist_baser[NUM_GICV5_DOMAINS];
    uint32_t irs_ist_cfgr[NUM_GICV5_DOMAINS];
    uint32_t irs_spi_selr[NUM_GICV5_DOMAINS];
    uint32_t irs_cr0[NUM_GICV5_DOMAINS];
    uint32_t irs_cr1[NUM_GICV5_DOMAINS];
    uint32_t irs_pe_selr[NUM_GICV5_DOMAINS];

I tend to implement banked registers as separate arrays
because it's what I'm used to from how we've done the
target/arm/cpu.h banked registers, and because
 cs->irs_ist_baser[domain]
is a bit shorter and more straightforward
 cs->regs[domain].irs_ist_baser
and because you generally don't want "the struct with all
the regs for this domain" as a thing itself.

-- PMM

