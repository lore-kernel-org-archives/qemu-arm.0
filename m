Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1663131lfk;
        Mon, 5 Jul 2021 17:47:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDVv9afQmx77uHye6qVuDfLwIZ9ibooAjzcdIZqF9GIYfOSvOLSRcYhbMP+EdaUs3zVEhV
X-Received: by 2002:a67:f549:: with SMTP id z9mr2493704vsn.57.1625532450898;
        Mon, 05 Jul 2021 17:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625532450; cv=none;
        d=google.com; s=arc-20160816;
        b=f3Uxw9PEVTdIALVHYRmA86/lg6zw+aV7fr4HjkxgqoPb2OSKwk+dCUafq7hx7IZGF8
         2onQd67rA+b8QtdAOkBegX4uIl2D1pYxOWdAJB+MfsxxbJEcibyJ0RDf1mHHIMYcdN1X
         +tWVflaOjaeUlAmYIu3+Q29zY+QS1W/ktiLxqXSlc5O37mxw7ZfytZzep5DiJCCi7+6b
         yk8RFtvqb+FXkFdbFj0PvcWF/CW0Si/oig0xhawbB2H+/VqYlveJs8jfkBm1ANxBqwcE
         FhU2Qaa8bbmm+rN7P/wDqRTL6tRvoYTzw0bBK78oqIKQHa3yJGBr1RZK/sLuSyHsAReg
         x3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=zSVHVE0iNygwA13AU9IWrU6Dol37u1/agFPxn4eqpbo=;
        b=c6PQdW3Oqjbw7l/eyj9uNoaNEzlR6r17PgDKXrvponmNYYVA7lmhpABNQQ391VFcbR
         xf2Tt/ohFHxRLBqlPEKy5/gU3Ax6FzNQsCwQr8j8LKhF1XOjny/6A3Un6yhBL7xrhasF
         L5wfKXK8Xdm4CdRdzHnaKsN6lzN03Y8KR3lbDp4fVDym08xLGToYVBamh4ntj1SLiu8U
         H62+oU1a7FhvvFzmBXuRKZoMUJ4SEmlgeqbj8niLaNI2kCa4svB9NTMPFwEFESg0cmL1
         JR8YBYVW075HR4tPKrzq5hqWDyHGecAailAVXXHE5h721Ycu5ebJK5JtKOnfMlU3caHF
         JKFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zvbXOmYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 74si8889254uao.258.2021.07.05.17.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 17:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zvbXOmYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0ZFK-0002y6-52
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 20:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0ZFB-0002v1-1n
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 20:47:21 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:47038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0ZF7-0000Iy-H5
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 20:47:20 -0400
Received: by mail-qk1-x72a.google.com with SMTP id 19so18528237qky.13
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 17:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSVHVE0iNygwA13AU9IWrU6Dol37u1/agFPxn4eqpbo=;
 b=zvbXOmYSH77buake+2hJZcr8c6mP1lFUzWAr7Hz4yByFuvYZ5bELOwqqLH37f5mLxF
 OFlZjIIWtC6QRH6COBI85zZnY3NnF0W+p5L9nmbxjM1D1LHfYeI3kU1322AYvJsYkBe1
 RnPAuonQgioioyMtLYpokSe0i12O6gFrdM8ofZxd/SM/A5Eb4ZMqLVdh14dsXSk3wiyk
 lq5zcpJikzgwksYcJfD3IKDaFIt/+cRcXL/4evyLs7mP5Qe5FNPqFkxp8WFUER37rLxi
 Iy0KmvtYonb7tRZFQtNLjwpQJQAWJDpFBVdyspjht9ASaSB2LnQFwI250QBZ1Mlv3xgY
 mvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zSVHVE0iNygwA13AU9IWrU6Dol37u1/agFPxn4eqpbo=;
 b=rDWEcGBcazW7QaLvVAhQOOW9stfHjqoArrzgT91xq6kjk9iInwS4xiSglb7bMzbeYU
 TK8Iv8Tfs16n0QYhniS+RjAz0WCMFhCWTZuf+oi477wkC4SdzsVgD7PdZDa2ohTFGAmp
 luEsWb3JTe3sfKeBR4agcQ5S5np8yfMSvhHZ3D6BMU1m4b2z7Md7g3MmgLuyxwhpOuq5
 iZ4a2aRaEL+p1KhpiiJpVLylRrU9dhLimjZyAnsmF8SHLwuOZ8qsnaPBftQ2NDO9mlln
 GJEHzG2dxhXEVj0fv8HHT2bNYwUsnTaaEfKQ9hfosM+Y+QAYpVdcbIcqdEziN5APR2r6
 R2Bg==
X-Gm-Message-State: AOAM532NmgZfxt18QA1N+Li25+k0cnTM0tmtUYngks99iaJL5jBb3oxa
 X1yB+EY20qAW/NbxHrlCUpDC4A==
X-Received: by 2002:a37:351:: with SMTP id 78mr880855qkd.172.1625532436497;
 Mon, 05 Jul 2021 17:47:16 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id w2sm6049097qkf.88.2021.07.05.17.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 17:47:16 -0700 (PDT)
Message-ID: <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 05 Jul 2021 20:47:14 -0400
In-Reply-To: <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b4dtp6wq+WVd

On Mon, 2021-07-05 at 15:54 +0100, Peter Maydell wrote:
> On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Added ITS command queue handling for MAPTI,MAPI commands,handled
> > ITS
> > translation which triggers an LPI via INT command as well as write
> > to GITS_TRANSLATER register,defined enum to differentiate between
> > ITS
> > command interrupt trigger and GITS_TRANSLATER based interrupt
> > trigger.
> > Each of these commands make use of other functionalities
> > implemented to
> > get device table entry,collection table entry or interrupt
> > translation
> > table entry required for their processing.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> > +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
> > +                                 uint32_t offset, bool
> > ignore_pInt)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint32_t devid, eventid;
> > +    uint32_t pIntid = 0;
> > +    uint32_t max_eventid, max_Intid;
> > +    bool dte_valid;
> > +    MemTxResult res = MEMTX_OK;
> > +    uint16_t icid = 0;
> > +    uint64_t dte = 0;
> > +    IteEntry ite;
> > +    uint32_t int_spurious = INTID_SPURIOUS;
> > +    uint64_t idbits;
> > +
> > +    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
> > +    offset += NUM_BYTES_IN_DW;
> > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    eventid = (value & EVENTID_MASK);
> > +
> > +    if (!ignore_pInt) {
> > +        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
> > +    }
> > +
> > +    offset += NUM_BYTES_IN_DW;
> > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    icid = value & ICID_MASK;
> > +
> > +    dte = get_dte(s, devid, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
> > +
> > +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> > +
> > +    if (!ignore_pInt) {
> > +        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser,
> > GICR_PROPBASER,
> > +                                IDBITS), GICD_TYPER_IDBITS);
> 
> I missed this the first time around, but I don't think this is right.
> Different CPUs could have different GICR_PROPBASER values, so
> checking
> against just one of them is wrong. The pseudocode only tests
> LPIOutOfRange()
> which is documented as testing "larger than GICD_TYPER.IDbits or not
> in
> the LPI range and not 1023". So I don't think we should be looking
> at the GICR_PROPBASER field here.
> 
> More generally, "s->gicv3->cpu->something" is usually going to be
> wrong, because it is implicitly looking at CPU 0; often either there
> should be something else telling is which CPU to use (as in
> &s->gicv3->cpu[rdbase] where the CTE told us which redistributor),
> or we might need to operate on all CPUs/redistributors. The only
> exception is where we can guarantee that all the CPUs are the same
> (eg when looking at GICR_TYPER.PLPIS.)
In that case,the validation of IDBITS(in case of ITS enabled) could be
done during the write of gicr_propbaser register value itself(in
arm_gicv3_redist.c) and the its command processing code here can just
extract the idbits for its use.
> 
> thanks
> -- PMM

