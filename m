Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp367843ejb;
        Wed, 22 May 2024 05:44:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRnH9mSC+Tx/j0Nv1ydIfwAcT/6R6oH/3GsDIC+x5+II4yQ613H5z6b6OvRxD9vVU+GjALSj7gnlx4+hZdvCF7+OFgu/N0
X-Received: by 2002:a05:600c:5353:b0:41a:c92:d323 with SMTP id 5b1f17b1804b1-420fd312f35mr15497415e9.10.1716381873214;
        Wed, 22 May 2024 05:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716381873; cv=none;
        d=google.com; s=arc-20160816;
        b=DhM/I4usE//cK36EyLaCS+Cmbpnr054ICbdrgTfkux20wIjoQoXDZ2EEugyQB6z8DU
         j9IWjNhRNYz86oyY4vCKbibABuA8Mtk6WoaOU21+sK+okOtcE/cu36LUA/ijin5PyZ2y
         Un8DB8tCeltAwzN3pXlz+NGcve/R8CAJgqn0xrBw42Cx9JUc/VPsQ//hMSUzYyvGntcv
         Br4E7v3D4/dof24brxScR6AeV0J+Ig9x5HeC+me/41rJlWGOuvNRhLFIOElLTOHsS7Ec
         XjcZDq7zge1kGI1oNiDgjXDNMkffRBoVRbeYwQkGnFFG4Vu4E4kVpxDWrxP7/lmSeBOS
         QMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=PpiplhRB+RoSsm1f61Y9eFGL8oBS0tcS+U7t9xmTrQI=;
        fh=WSTufrHzbPGD2FZ1grT4xiGRpK7l+5/x9tLFoulSXbM=;
        b=qlVcmCzktlUJxpmuFelGi4dRpT72qG1Vku2jnYOCPKCah5C+eWiZNIkjESz5IWKdu6
         DWm8s4VZVL9ONCN6aceMQKXyixGMjiuQhCydvdmRjwY4u+q5MTr9JzNgJdj9NHVU7+EW
         sCDVNclKTjXMRzPPHuM/6UaxwWTRTH08fMaElZFccCavLppTTKpZTUgsotY81RZ8JzmQ
         cQTFCHv+SpnRZB2Av14YrMNBs8iUP1SU1YIi1FNv8jpyN1D4mCZ+2k9tX8Uky72zYepG
         HnjodD2gH4j1HmPLvyntVLq3ie8rCH1PHkLFZZ/cJDNP6v/KP+M3rV0V0lWJ43UIimzC
         Xuzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=I4qzWGnz;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-420fd32966esor564265e9.11.2024.05.22.05.44.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 May 2024 05:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=I4qzWGnz;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716381873; x=1716986673; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PpiplhRB+RoSsm1f61Y9eFGL8oBS0tcS+U7t9xmTrQI=;
        b=I4qzWGnzWgfO4W9HkcXtLy0YJLNEQOkDBZsu/EdQJrf6wMdG/zQJ6jYWZYLUsBf/+y
         rERQwaS6GSDLxvJkrGgU/hZsCV/DBvbA8Gl5fUxaJkbbWDFc55Bcvm5ST2U8bwAKcLgZ
         Tl0Mt7slR+4NrQMZ8CRfHAjB6zOVcE6qIsbUL6DtT+gHV9XxGzzaJBGFGY5UOh63X8B4
         MjkN7Q5PSFqV+h5LtMt7sFaUMAL1/72A9k2hZh5j1sTpum4gHJSnkAgb6fE/ETyuf+1l
         CKj5SE1NBXqTBZZ1Af/XL2b/j978Wtikpa0YZoLEfTBIwX4rPsypmfe0FrBdBmHWcDIZ
         jT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716381873; x=1716986673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpiplhRB+RoSsm1f61Y9eFGL8oBS0tcS+U7t9xmTrQI=;
        b=PwI6C+Hv4XSnwvVv/iqOXfeJk9YWbM+ZKq+31vmWtmn7Wf7QZ/LwfCwwpUt0/Do5mx
         3wFY/qf1mv9fevpzjn3123AWIh6gRDQyGR/colRPSiG+j11LHhRlrfSJ/7QZSb2KN776
         fScT0qW/0w8WhEYxd7IKeP2Aq7PoLN5ghqIMj5pmp+XZi9d9E+Eud5jX6wdQKRy6Wfnp
         XduP7+rl4MyhQ2K2/06CrMhVEh3qHg4/JuiJu69WDocqF2XyQ0cZT5GDlATqJ4oLnA6U
         JGHxBb2tnkV/hMfVzPwV6ihmSvRLYZCI3NimdHygzsIjmVpnIMztFiDVNmMeoBQTSeQv
         KEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCURsVeMgtrmTeLuvschCVSeAQTgm9OwGMpZC+rBMPnvMIFONJCYvsgQt72JKZtLKxdvHn6/hBflrBChd7EIFFqobA04dNa6
X-Gm-Message-State: AOJu0Yx56/CAFbTQmwzxGAv/o8ZWJpYcy0q8S90ddWgSYBv/TkO1T8yg
	iGagDnRVaDe88E/YAlOTD6CcFYitG9NcHsvBtiUuonYlbC0amwTzGKkOf/JGUw==
X-Google-Smtp-Source: AGHT+IHpR7OM8N8/VixvqAnkgygA7K6KUDGazOXYn/bLFCO6iMTaSjZAUIuhLmRWQ7hNWXYS0XHNLg==
X-Received: by 2002:a05:600c:3d05:b0:41b:8715:1158 with SMTP id 5b1f17b1804b1-420fc8142admr1802815e9.6.1716381872531;
        Wed, 22 May 2024 05:44:32 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacf7esm34667910f8f.77.2024.05.22.05.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 05:44:32 -0700 (PDT)
Date: Wed, 22 May 2024 12:44:28 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 08/18] hw/arm/smmu-common: Add support for nested
 TLB
Message-ID: <Zk3orJgIIqC4wThC@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-9-smostafa@google.com>
 <dc8d52ac-68af-4426-9a60-07ad909c86b0@redhat.com>
 <ZkYkTgDztEyX6GT_@google.com>
 <6b41c718-7e02-4a3d-adf8-a56306ab68d9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b41c718-7e02-4a3d-adf8-a56306ab68d9@redhat.com>
X-TUID: k1om8+cyZs2t

Hi Eric,

On Mon, May 20, 2024 at 10:20:43AM +0200, Eric Auger wrote:
> Hi Mostafa,
> On 5/16/24 17:20, Mostafa Saleh wrote:
> > Hi Eric,
> >
> > On Wed, May 15, 2024 at 03:48:05PM +0200, Eric Auger wrote:
> >> Hi Mostafa,
> >>
> >> On 4/29/24 05:23, Mostafa Saleh wrote:
> >>> This patch adds support for nested(combined) TLB entries.
> >> space between nested and (.
> > Will do.
> >>> The main function combine_tlb() is not used here but in the next
> >>> patches, but to simplify the patches it is introduced first.
> >>>
> >>> Main changes:
> >>> 1) New entry added in the TLB, parent_perm, for nested TLB, holds the
> >> s/entry/field, s/TLB/SMMUTLBEntry struct
> > Will do.
> >>>    stage-2 permission, this can be used to know the origin of a
> >>>    permission fault from a cached entry as caching the “and” of the
> >>>    permissions loses this information.
> >>>
> >>>    SMMUPTWEventInfo is used to hold information about PTW faults so
> >>>    the event can be populated, the value of stage (which maps to S2
> >>>    in the event) used to be set based on the current stage for TLB
> >> I don't understand "(which maps to S2 in the event)". What do you mean?
> >> This could be S1 or S2 depending on the active stage, no?
> > Not really, if the IPA size is larger than S2 input size, this is
> > considered stage-1 fault.
> >
> > For TLB permission fault, yes, that is how it is decided.
> > However, with nesting, a permission fault from a cached entry can be
> > from a stage-1 or stage-2, that’s why we now cache both and not just
> > the combined permission, and the logic to set fault stage is modified
> > accordingly.
> I meant in smmu_translate() we initially had for permission fault
> info->stage = cfg->stage whcih can be S1 or S2. Hence the fact I do not
> understand the sentence
> 
> the value of stage (which maps to S2 in the event)
> 
> I understand that with nested this computation needs to change because the permission can be linked to either the S1 or S2 stage.
> Maybe that's just a matter or rephrasing?
> 

I see, that’s already how it is used now, I will rephrase it in case
it is confusing.

> 
> >>>    permission faults, however with the parent_perm, it is now set
> >>>    based on which perm has the missing permission
> >>>
> >>>    When nesting is not enabled it has the same value as perm which
> >>>    doesn't change the logic.
> >>>
> >>> 2) As combined TLB implementation is used, the combination logic
> >>>    chooses:
> >>>    - tg and level from the entry which has the smallest addr_mask.
> >> tbh I am scared bout swapping s1/s2 tg and level. In smmu_iotlb_lookup()
> >> I see tt->granule_sz being used which is s1 data. I mean it is not
> >> obvious to me this is correct. Could you maybe give more explanations
> >> detailing why/how this is guaranted to work.
> > As you mentioned the next patch reworks the lookup logic, I can reorder
> > the 2 patches if that is better, please let me know what you think?
> Yes if you manage to reorder that may be more logical because otherwise
> it looks incorrect.

Will do.
> >
> >> Can you give additional details about what s1+s2 combinations were tested?
> > I tested with S1 and S2 4K pages
> > S1 level = 3 and S2 level = 3
> > S1 level = 2 and S2 level = 3
> > S1 level = 3 and S2 level = 2
> > S1 level = 1 and S2 level = 2
> >
> > And also tested with with S1 64K granule and S2 4K.
> OK, I would suggest you mention that in the coverletter because it is
> reassuring and the combination is not totally obvious - at least to me ;-) -

Will do.

Thanks,
Mostafa
> 
> Eric
> >
> >>>    - Based on that the iova that would be cached is recalculated.
> >>>    - Translated_addr is chosen from stage-2.
> >>>
> >>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> >>> ---
> >>>  hw/arm/smmu-common.c         | 32 ++++++++++++++++++++++++++++----
> >>>  include/hw/arm/smmu-common.h |  1 +
> >>>  2 files changed, 29 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> >>> index 21982621c0..0d6945fa54 100644
> >>> --- a/hw/arm/smmu-common.c
> >>> +++ b/hw/arm/smmu-common.c
> >>> @@ -394,7 +394,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> >>>          tlbe->entry.translated_addr = gpa;
> >>>          tlbe->entry.iova = iova & ~mask;
> >>>          tlbe->entry.addr_mask = mask;
> >>> -        tlbe->entry.perm = PTE_AP_TO_PERM(ap);
> >>> +        tlbe->parent_perm = tlbe->entry.perm = PTE_AP_TO_PERM(ap);
> >> nit: I would prefer on separate lines.
> > Will do.
> >
> >>>          tlbe->level = level;
> >>>          tlbe->granule = granule_sz;
> >>>          return 0;
> >>> @@ -515,7 +515,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> >>>          tlbe->entry.translated_addr = gpa;
> >>>          tlbe->entry.iova = ipa & ~mask;
> >>>          tlbe->entry.addr_mask = mask;
> >>> -        tlbe->entry.perm = s2ap;
> >>> +        tlbe->parent_perm = tlbe->entry.perm = s2ap;
> >>>          tlbe->level = level;
> >>>          tlbe->granule = granule_sz;
> >>>          return 0;
> >>> @@ -530,6 +530,27 @@ error:
> >>>      return -EINVAL;
> >>>  }
> >>>  
> >>> +/* combine 2 TLB entries and return in tlbe in nested config. */
> >> suggestion: combine S1 and S2 TLB entries into a single entry. As a
> >> result the S1 entry is overriden with combined data.
> > Will do.
> >
> >>> +static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> >>> +                                                SMMUTLBEntry *tlbe_s2,
> >>> +                                                dma_addr_t iova,
> >>> +                                                SMMUTransCfg *cfg)
> >>> +{
> >>> +    if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
> >>> +        tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
> >>> +        tlbe->granule = tlbe_s2->granule;
> >>> +        tlbe->level = tlbe_s2->level;
> >>> +    }
> >>> +
> >>> +    tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
> >>> +                                    tlbe->entry.translated_addr);
> >>> +
> >>> +    tlbe->entry.iova = iova & ~tlbe->entry.addr_mask;
> >>> +    /* parent_perm has s2 perm while perm has s1 perm. */
> >>  suggestion: while perm keeps s1 perm.
> >>
> > Will do.
> >
> > Thanks,
> > Mostafa
> >>> +    tlbe->parent_perm = tlbe_s2->entry.perm;
> >>> +    return;
> >>> +}
> >>> +
> >>>  /**
> >>>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
> >>>   *
> >>> @@ -607,9 +628,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> >>>  
> >>>      cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
> >>>      if (cached_entry) {
> >>> -        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
> >>> +        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
> >>> +            cached_entry->parent_perm & IOMMU_WO)) {
> >>>              info->type = SMMU_PTW_ERR_PERMISSION;
> >>> -            info->stage = cfg->stage;
> >>> +            info->stage = !(cached_entry->entry.perm & IOMMU_WO) ?
> >>> +                          SMMU_STAGE_1 :
> >>> +                          SMMU_STAGE_2;
> >>>              return NULL;
> >>>          }
> >>>          return cached_entry;
> >>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> >>> index 09d3b9e734..1db566d451 100644
> >>> --- a/include/hw/arm/smmu-common.h
> >>> +++ b/include/hw/arm/smmu-common.h
> >>> @@ -77,6 +77,7 @@ typedef struct SMMUTLBEntry {
> >>>      IOMMUTLBEntry entry;
> >>>      uint8_t level;
> >>>      uint8_t granule;
> >>> +    IOMMUAccessFlags parent_perm;
> >>>  } SMMUTLBEntry;
> >>>  
> >>>  /* Stage-2 configuration. */
> >> Thanks
> >>
> >> Eric
> >>
> 
