Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp477402ejb;
        Thu, 5 Jan 2023 09:34:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXto/gGnPd4doEoA3B48dHARGainxpagFqA44zDlQ6+mCEwYkjYxzR4OG2myk4tBuOmH/q3o
X-Received: by 2002:a05:6214:3502:b0:532:c11:c390 with SMTP id nk2-20020a056214350200b005320c11c390mr7995812qvb.14.1672940042670;
        Thu, 05 Jan 2023 09:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672940042; cv=none;
        d=google.com; s=arc-20160816;
        b=p/tCojOUwB+/H8X5gDGzY99cj4cldUY1p5yY5CouBFOVW8Q5LaqCzkRG4LmIR5axN2
         Q3Fj1SoY+qYhTnCgh5N6OrgXxznJfaBu1jjl2PaqtIdjzv+W9pAeAcT8PbOyVWZU+B2F
         pHF6eVBOgh8PHmKFcFPTixMHmM0f+ys5pUnjS7tLSCG5VGkeYxNRCiZYK5FA0AFHIkE2
         or+9rL+l4OGFmjopytOWo28hI6lUgUk7wPvcKai81fs5/uCWzn2V5NisGSWuEwIbVsjP
         th1e/EJAA6vMZJqmKQEMa+CesCDeRIjBc8N5dkmmGWlfMi8RSL6YJsLRG/8pnxmIUXE1
         7RkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=AdHSPQSczbUuoRKgIlFqzxucRe1TAenhs+NxOxWGVPk=;
        b=GavG7uO7/6A5FSKCaR2tiw1WgolTNzbsXiWSVCk/LAOPs9OMjBMdsjSmGsWozc6GAb
         +nkfjGyjj2q/zpwEwjt63Y5XM5BreX4FgNF7ZCHzA0RLrM1arOTAUT8uCD6fy5knTJGq
         RsqCXhGGG9fpOtcbf12GEOi+q1OEzcD+PxmZb5KtKxGxGZSp3iTxDqa9VnSZgCTfheNw
         gnsi+usIUyo8NTVVUbUvBn+2HqGGwNPiRmA92H4HuZPEavi4M9wc7OexHfSF1C9u3ega
         7X6CN4RgN/CxBUjUy5ONag+G8JzbZFZru3N6KJKOf7DO5kVgB9wOgT87tfH8InqKy2jA
         SrSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tlAgcucW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq11-20020ad45fcb000000b004c71e35a2f7si19493304qvb.543.2023.01.05.09.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 09:34:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tlAgcucW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDU0j-00023w-JL; Thu, 05 Jan 2023 12:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pDU0g-0001wF-HF
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 12:26:34 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pDU0e-0008Sw-OG
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 12:26:34 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk16so23608320wrb.11
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 09:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AdHSPQSczbUuoRKgIlFqzxucRe1TAenhs+NxOxWGVPk=;
 b=tlAgcucWFYGlkghijEm/ErsWSomRiZeK7SxWcc2r/2AQaOJvHYra3so3jdbvw9T8P/
 FcP3BzPmcs52it2LuXW0eUPxwg5vNzrY2Z4aKzmY7wGGdqwFw/G8CNdxl0s/Rlwr7GcW
 qUR+mBAcdyM7X55lEQSLjlTp6xcDHG1nHDMPFYPEF7ycWFaFCyEtQMO/KUIX+pg8soOU
 TxFw1eM3mD5Pbuey8hs6iGxd0sXBrPJ5AfitVVL6dSPtBSSEEbt5uEUXiEHeGr17CPcp
 7YjS9fGvA1j+jn9IC7sHGs7AZJxhPmSSPTTODgB0pqfmgwp1rFibHg8kA/Fq1gHehp+j
 VNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdHSPQSczbUuoRKgIlFqzxucRe1TAenhs+NxOxWGVPk=;
 b=GI5S/65QQpkaT8tj/95HBadCVBB+WM9stKXXsql4Phlfg5mClsVa4cy8XEJbG1U+8F
 wiKYzANv6NKg7HdSQKgybDH463PwXd1OwCf7i5hj0gBZVINMd1VwExLgI1TdSS11SKpn
 8tjbd1H3gZzgnaMak1f66vE49irJYWUL6tqqMoxkcXAgqsWgjQHlJaxHgasjGfMbxDW9
 xq1jKj3QdYx2Ze8LH3mInloXIEEpYEVFbRZl8GOHgSq9DP8h+zM3n8EvBR3XESp3tt7b
 bA1wL64Le6i0HUBKrc6gPWnZjfGqnW4E/HuTtBijeO4kVNZ/i+/A4NwQF9Ghhr+jfUQE
 A+Hg==
X-Gm-Message-State: AFqh2kq7wOHuusgK4LefrblVY7Gf7QQy66iCliEvmh5DifAjp8a0cSPx
 bWMt6JU5hXPaYOK/vE8bhnQvvA==
X-Received: by 2002:a5d:4a52:0:b0:292:8bae:586c with SMTP id
 v18-20020a5d4a52000000b002928bae586cmr147444wrs.0.1672939590756; 
 Thu, 05 Jan 2023 09:26:30 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 v3-20020a5d4a43000000b0026fc5694a60sm36531073wrs.26.2023.01.05.09.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 09:26:30 -0800 (PST)
Date: Thu, 5 Jan 2023 17:26:26 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y7cIQqc19+Phb/CV@google.com>
References: <20221219125720.1369027-1-smostafa@google.com>
 <Y7VxFpoTjwNaolTG@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7VxFpoTjwNaolTG@myrica>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=smostafa@google.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KwN3dhILVuLh

Hi Jean,

Thanks for taking the time to look into this.

On Wed, Jan 04, 2023 at 12:29:10PM +0000, Jean-Philippe Brucker wrote:
> Hi Mostafa,
> 
> On Mon, Dec 19, 2022 at 12:57:20PM +0000, Mostafa Saleh wrote:
> > GBPA register can be used to globally abort all
> > transactions.
> > 
> > Only UPDATE and ABORT bits are considered in this patch.
> 
> That's fair, although it effectively implements all bits since
> smmuv3_translate() ignores memory attributes anyway
> 
> > 
> > It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> > ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> > be zero(Do not abort incoming transactions).
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3-internal.h |  4 ++++
> >  hw/arm/smmuv3.c          | 14 ++++++++++++++
> >  include/hw/arm/smmuv3.h  |  1 +
> >  3 files changed, 19 insertions(+)
> > 
> > diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> > index bce161870f..71f70141e8 100644
> > --- a/hw/arm/smmuv3-internal.h
> > +++ b/hw/arm/smmuv3-internal.h
> > @@ -79,6 +79,10 @@ REG32(CR0ACK,              0x24)
> >  REG32(CR1,                 0x28)
> >  REG32(CR2,                 0x2c)
> >  REG32(STATUSR,             0x40)
> > +REG32(GBPA,                0x44)
> > +    FIELD(GBPA, ABORT,        20, 1)
> > +    FIELD(GBPA, UPDATE,       31, 1)
> > +
> >  REG32(IRQ_CTRL,            0x50)
> >      FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
> >      FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 955b89c8d5..2843bc3da9 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >      s->gerror = 0;
> >      s->gerrorn = 0;
> >      s->statusr = 0;
> > +    s->gbpa = 0;
> >  }
> >  
> >  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> > @@ -663,6 +664,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >          goto epilogue;
> >      }
> >  
> > +    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
> > +        status = SMMU_TRANS_ABORT;
> > +        goto epilogue;
> > +    }
> > +
> 
> GBPA is only taken into account when SMMU_CR0.SMMUEN is 0 (6.3.9.6 SMMUEN)
> 
I missed that, will update it in V2.

> >      cfg = smmuv3_get_config(sdev, &event);
> >      if (!cfg) {
> >          status = SMMU_TRANS_ERROR;
> > @@ -1170,6 +1176,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
> >      case A_GERROR_IRQ_CFG2:
> >          s->gerror_irq_cfg2 = data;
> >          return MEMTX_OK;
> > +    case A_GBPA:
> > +        /* Ignore update bit as write is synchronous. */
> 
> We could also ignore a write that has Update=0, since that's required for
> SMMUv3.2+ implementations (6.3.14.1 Update procedure)

I will add it in V2.

> > +        s->gbpa = data & ~R_GBPA_UPDATE_MASK;
> 
> Do we need to synchronize with concurrent transactions here?
> I couldn't find if QEMU already serializes MMIO writes and IOMMU
> translation.
> 
> "Transactions arriving at the SMMU after completion of a GPBA update are
> guaranteed to take the new attributes written." The guest tests completion
> by reading the Update bit:
> 
> 	vCPU (host CPU 0)		Device thread (host CPU 1)
> 
> 	(a) read GBPA.abort = 1
> 	(b) write GBPA.{update,abort} = {1,0}
> 	(c) read GBPA.update = 0
> 	(d) launch DMA			(e) execute DMA
> 					(f) translation must read GBPA.abort = 0
> 
> I guess memory barriers after (b) and before (f) would ensure that. But I
> wonder if SMMUEN also needs additional synchronization, and in that case a
> rwlock would probably be simpler.
> 

From what I see, it does with qemu_global_mutex.
smmu_write_mmio: acquired from context of io_writex
smmuv3_translate: acquired from context of os_host_main_loop_wait
So I'd assume this should be fine. (I also checked with GDB)

However, if I missed something, and we need to synchronize, I think this
would also be a bug in SMMUEN.
As it is written from smmu_write_mmio and read at smmuv3_translate the
same way as GBPA.

And as described here (6.3.9.6 SMMUEN)
Completion of an Update of SMMUEN from 0 to 1 ensures that:
-Configuration written to SMMU_(S_)CR2 has taken effect.
-All new transactions will be treated with STE configuration relevant to
their stream, and will not undergo SMMU bypass.

So it will suffer from the same problem.

Thanks,
Mostafa

> Thanks,
> Jean
> 
> > +        return MEMTX_OK;
> >      case A_STRTAB_BASE: /* 64b */
> >          s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
> >          return MEMTX_OK;
> > @@ -1318,6 +1328,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
> >      case A_STATUSR:
> >          *data = s->statusr;
> >          return MEMTX_OK;
> > +    case A_GBPA:
> > +        *data = s->gbpa;
> > +        return MEMTX_OK;
> >      case A_IRQ_CTRL:
> >      case A_IRQ_CTRL_ACK:
> >          *data = s->irq_ctrl;
> > @@ -1495,6 +1508,7 @@ static const VMStateDescription vmstate_smmuv3 = {
> >          VMSTATE_UINT32_ARRAY(cr, SMMUv3State, 3),
> >          VMSTATE_UINT32(cr0ack, SMMUv3State),
> >          VMSTATE_UINT32(statusr, SMMUv3State),
> > +        VMSTATE_UINT32(gbpa, SMMUv3State),
> >          VMSTATE_UINT32(irq_ctrl, SMMUv3State),
> >          VMSTATE_UINT32(gerror, SMMUv3State),
> >          VMSTATE_UINT32(gerrorn, SMMUv3State),
> > diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> > index f1921fdf9e..9899fa1860 100644
> > --- a/include/hw/arm/smmuv3.h
> > +++ b/include/hw/arm/smmuv3.h
> > @@ -46,6 +46,7 @@ struct SMMUv3State {
> >      uint32_t cr[3];
> >      uint32_t cr0ack;
> >      uint32_t statusr;
> > +    uint32_t gbpa;
> >      uint32_t irq_ctrl;
> >      uint32_t gerror;
> >      uint32_t gerrorn;
> > -- 
> > 2.39.0.314.g84b9a713c41-goog
> > 
> > 
