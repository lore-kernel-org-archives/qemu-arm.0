Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp277096ejb;
        Mon, 17 Jun 2024 07:56:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKbE0wSyrtHPiE+fDScdE2y7VDEAcGlH3CoA7wS/XswNE07yIziE7pouC7e+/+zGSKOyPaoEfjjfW98S1XZmc5JJNYi6IE
X-Received: by 2002:a25:c501:0:b0:df4:ba84:6ad3 with SMTP id 3f1490d57ef6-dff154e0dcdmr8250780276.61.1718636201286;
        Mon, 17 Jun 2024 07:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718636201; cv=none;
        d=google.com; s=arc-20160816;
        b=s1xksSP2ZDC1SeniDmiY82SIwoD+dR9iZoeav1DWTguoS4CxNwPuoMi04LJxYDjwnv
         NC08JJZoxuvPKzKrUjxMRNzI2ls65+I1vCOfIRtuEI0ZIyOuJcr0c/MJhHiD+0kfyzbn
         SBdfmi6VGvdtjfXU1Gas2RaMbFWHZs4mZL3TJnbqhx0wYwhGUWhQIlt7hBm6BQ+JrwNF
         NrbbfANykD/V4aNsflxcsOKrM2Fdk3f+mUEpzrmudHUvV2QfjWKTbVkxBcmuROoNNuxF
         cqs3TVf+KoN/xLICKX3k/pzY46wMLkO3+ylYfzw8mzSCCrLvzheotQFDIqL2Dag8rJHS
         locA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H+f8hBa4wF7qcreKZ11f9UgUyOmm99JnVMRpah20gKc=;
        fh=QnODElvNS8pNJTIbUbFzwMgfzImWwboUW98iy8hiDic=;
        b=SWlLcszFSaxX9uHSdaxfK6tU5y55xa68ZztVP3tUEDjdscTjqaNqbQ36ipedqRA+Og
         31ektRsjqBlmT5hjheiCtfzNkEZo+ryyt+C8+Rj6k1DclqNL6F0TzbvOz/UAVnETC7PI
         M8YAUn6iScbhlao7IZK3+NMWZVjIfKMxZEs0vGr7+berUX2bi8Qvf/HKO4vwK0S9wqi3
         O/AVb/Jsdp8ufaRoOoMAB3IOspfx6Ko4jgJvtcHVde5USsYJF9uBUeSzM2OCgEk54flp
         z60ihxH0mmFzdaOn5gY0KdZEuuFQthQBPnZLKJEuoHENCiOld4dOADYn0+/dDi1iSg27
         pYJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gSUKeK2S;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d75a77b69052e-441526ea9a8sor31854251cf.11.2024.06.17.07.56.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2024 07:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gSUKeK2S;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718636201; x=1719241001; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+f8hBa4wF7qcreKZ11f9UgUyOmm99JnVMRpah20gKc=;
        b=gSUKeK2S1PxVeCCjsOSxZ0D+kfNXueOwRZy6cdmG0mIJa7CRwtIZgcuvP+kCoLAsmd
         AwzDWeDrjF1sWu5QyXzKu5jv4235n01acb0yS2EpHLuVs8LlXUOxxSA46SEsvS8X+w7J
         AJiIv+cRirtBfesFA9EUDpxnc39lH5HOUsOFF8DXk8DAle52xA6YD3OafeH2rok/F6f/
         afHUcAPW9Rh+JeBYC7VzolIOzmMko4MR2RsJuHleRXwrJVpy4DCIDCIfMnj0vBIihyhW
         CrIR1cvO2OHnSk6e8p37Uv1tHpZoFqgC6xOGuAdr9aOr+O9KiGhLX5KRthkEYNFlnzJq
         VNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636201; x=1719241001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+f8hBa4wF7qcreKZ11f9UgUyOmm99JnVMRpah20gKc=;
        b=lv50ozKEBg+L3Q/DStBliMQhCntQANq5icTerkZyePGaf7OHnLonj/X/OXX1c0uAud
         X/19sRWzxJ3cfvx9w/ksWZ5vUW7qcX37SdPlk7RmwVbcN7S6V1sTCQk18r0unUFW0+56
         a0mWEwBlyhRID+yRYAUshydyX5xvYGYe7mUxxFUrrUSy66oXgvgQRVZzCCU7Q/4pZ1/M
         nzNc61mI2aNv8pnDNM7D88+aj9ucJz40opxJX27cQKht1Zko/CwVDv1KSzD9gNELq33h
         z4IAHCT7iTTmVYQN1QHD5pkPtay4AM8VNQlK5G4Q6WKHiXywGqSuk08SY8WOHnkKasVI
         rxPg==
X-Forwarded-Encrypted: i=1; AJvYcCWWtHoUkzV9vgv92MtvNINFgD689dNFUzfcUtv2DBBweqG4l9FtltMiPUzgMa3ZWoR2HepeLGIT0+KQ+yQHabhkhnnYAf09
X-Gm-Message-State: AOJu0Yz/wIWidmW9Z0j7Ljr7ed01+yhv+4mzv5xc+ybV8TTSVdMFHOf8
	b0/lwngX/Aiw/ObqFGNfLlhYO+DLZ6EfCAZEc5dEHT5/D56WfnezqpkUiay6+LMpcHlbuf+/50q
	OodbrLEWGwI7INr5c3cV6nyyDc/bLC9NCw8vI
X-Google-Smtp-Source: AGHT+IHHpnkEZha0kBO2Q/zIpPOdOGRlf2Wl+lmukb2WyzbgA6uSQMudGvC0dASSRCnr7SIcd7S8a2CHmotf1cScfYE=
X-Received: by 2002:ac8:570f:0:b0:442:8548:d7f9 with SMTP id
 d75a77b69052e-4434f55b397mr5807741cf.8.1718636200460; Mon, 17 Jun 2024
 07:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com> <20240429032403.74910-9-smostafa@google.com>
 <dc8d52ac-68af-4426-9a60-07ad909c86b0@redhat.com> <ZkYkTgDztEyX6GT_@google.com>
 <6b41c718-7e02-4a3d-adf8-a56306ab68d9@redhat.com> <Zk3orJgIIqC4wThC@google.com>
In-Reply-To: <Zk3orJgIIqC4wThC@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 17 Jun 2024 15:56:28 +0100
Message-ID: <CAFgf54qUgYFPrN9gwEG1VNZoKRH5quvUvwOQ6_ELsZX=Z_SStA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/18] hw/arm/smmu-common: Add support for nested TLB
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: fIFtuS+zLIU0

On Wed, May 22, 2024 at 1:44=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> Hi Eric,
>
> On Mon, May 20, 2024 at 10:20:43AM +0200, Eric Auger wrote:
> > Hi Mostafa,
> > On 5/16/24 17:20, Mostafa Saleh wrote:
> > > Hi Eric,
> > >
> > > On Wed, May 15, 2024 at 03:48:05PM +0200, Eric Auger wrote:
> > >> Hi Mostafa,
> > >>
> > >> On 4/29/24 05:23, Mostafa Saleh wrote:
> > >>> This patch adds support for nested(combined) TLB entries.
> > >> space between nested and (.
> > > Will do.
> > >>> The main function combine_tlb() is not used here but in the next
> > >>> patches, but to simplify the patches it is introduced first.
> > >>>
> > >>> Main changes:
> > >>> 1) New entry added in the TLB, parent_perm, for nested TLB, holds t=
he
> > >> s/entry/field, s/TLB/SMMUTLBEntry struct
> > > Will do.
> > >>>    stage-2 permission, this can be used to know the origin of a
> > >>>    permission fault from a cached entry as caching the =E2=80=9Cand=
=E2=80=9D of the
> > >>>    permissions loses this information.
> > >>>
> > >>>    SMMUPTWEventInfo is used to hold information about PTW faults so
> > >>>    the event can be populated, the value of stage (which maps to S2
> > >>>    in the event) used to be set based on the current stage for TLB
> > >> I don't understand "(which maps to S2 in the event)". What do you me=
an?
> > >> This could be S1 or S2 depending on the active stage, no?
> > > Not really, if the IPA size is larger than S2 input size, this is
> > > considered stage-1 fault.
> > >
> > > For TLB permission fault, yes, that is how it is decided.
> > > However, with nesting, a permission fault from a cached entry can be
> > > from a stage-1 or stage-2, that=E2=80=99s why we now cache both and n=
ot just
> > > the combined permission, and the logic to set fault stage is modified
> > > accordingly.
> > I meant in smmu_translate() we initially had for permission fault
> > info->stage =3D cfg->stage whcih can be S1 or S2. Hence the fact I do n=
ot
> > understand the sentence
> >
> > the value of stage (which maps to S2 in the event)
> >
> > I understand that with nested this computation needs to change because =
the permission can be linked to either the S1 or S2 stage.
> > Maybe that's just a matter or rephrasing?
> >
>
> I see, that=E2=80=99s already how it is used now, I will rephrase it in c=
ase
> it is confusing.
>

After reading the mail again I think I get the confusion here, the bit
that indicates if the event is stage-1 or stage-2 is called =E2=80=9CS2=E2=
=80=9D in
the spec :)
and that=E2=80=99s what the commit is referring to, but I will remove this
sentence as it doesn=E2=80=99t add much in this context.

> >
> > >>>    permission faults, however with the parent_perm, it is now set
> > >>>    based on which perm has the missing permission
> > >>>
> > >>>    When nesting is not enabled it has the same value as perm which
> > >>>    doesn't change the logic.
> > >>>
> > >>> 2) As combined TLB implementation is used, the combination logic
> > >>>    chooses:
> > >>>    - tg and level from the entry which has the smallest addr_mask.
> > >> tbh I am scared bout swapping s1/s2 tg and level. In smmu_iotlb_look=
up()
> > >> I see tt->granule_sz being used which is s1 data. I mean it is not
> > >> obvious to me this is correct. Could you maybe give more explanation=
s
> > >> detailing why/how this is guaranted to work.
> > > As you mentioned the next patch reworks the lookup logic, I can reord=
er
> > > the 2 patches if that is better, please let me know what you think?
> > Yes if you manage to reorder that may be more logical because otherwise
> > it looks incorrect.
>
> Will do.
> > >
> > >> Can you give additional details about what s1+s2 combinations were t=
ested?
> > > I tested with S1 and S2 4K pages
> > > S1 level =3D 3 and S2 level =3D 3
> > > S1 level =3D 2 and S2 level =3D 3
> > > S1 level =3D 3 and S2 level =3D 2
> > > S1 level =3D 1 and S2 level =3D 2
> > >
> > > And also tested with with S1 64K granule and S2 4K.
> > OK, I would suggest you mention that in the coverletter because it is
> > reassuring and the combination is not totally obvious - at least to me =
;-) -
>
> Will do.
>
> Thanks,
> Mostafa
> >
> > Eric
> > >
> > >>>    - Based on that the iova that would be cached is recalculated.
> > >>>    - Translated_addr is chosen from stage-2.
> > >>>
> > >>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > >>> ---
> > >>>  hw/arm/smmu-common.c         | 32 ++++++++++++++++++++++++++++----
> > >>>  include/hw/arm/smmu-common.h |  1 +
> > >>>  2 files changed, 29 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > >>> index 21982621c0..0d6945fa54 100644
> > >>> --- a/hw/arm/smmu-common.c
> > >>> +++ b/hw/arm/smmu-common.c
> > >>> @@ -394,7 +394,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> > >>>          tlbe->entry.translated_addr =3D gpa;
> > >>>          tlbe->entry.iova =3D iova & ~mask;
> > >>>          tlbe->entry.addr_mask =3D mask;
> > >>> -        tlbe->entry.perm =3D PTE_AP_TO_PERM(ap);
> > >>> +        tlbe->parent_perm =3D tlbe->entry.perm =3D PTE_AP_TO_PERM(=
ap);
> > >> nit: I would prefer on separate lines.
> > > Will do.
> > >
> > >>>          tlbe->level =3D level;
> > >>>          tlbe->granule =3D granule_sz;
> > >>>          return 0;
> > >>> @@ -515,7 +515,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> > >>>          tlbe->entry.translated_addr =3D gpa;
> > >>>          tlbe->entry.iova =3D ipa & ~mask;
> > >>>          tlbe->entry.addr_mask =3D mask;
> > >>> -        tlbe->entry.perm =3D s2ap;
> > >>> +        tlbe->parent_perm =3D tlbe->entry.perm =3D s2ap;
> > >>>          tlbe->level =3D level;
> > >>>          tlbe->granule =3D granule_sz;
> > >>>          return 0;
> > >>> @@ -530,6 +530,27 @@ error:
> > >>>      return -EINVAL;
> > >>>  }
> > >>>
> > >>> +/* combine 2 TLB entries and return in tlbe in nested config. */
> > >> suggestion: combine S1 and S2 TLB entries into a single entry. As a
> > >> result the S1 entry is overriden with combined data.
> > > Will do.
> > >
> > >>> +static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe=
,
> > >>> +                                                SMMUTLBEntry *tlbe=
_s2,
> > >>> +                                                dma_addr_t iova,
> > >>> +                                                SMMUTransCfg *cfg)
> > >>> +{
> > >>> +    if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
> > >>> +        tlbe->entry.addr_mask =3D tlbe_s2->entry.addr_mask;
> > >>> +        tlbe->granule =3D tlbe_s2->granule;
> > >>> +        tlbe->level =3D tlbe_s2->level;
> > >>> +    }
> > >>> +
> > >>> +    tlbe->entry.translated_addr =3D CACHED_ENTRY_TO_ADDR(tlbe_s2,
> > >>> +                                    tlbe->entry.translated_addr);
> > >>> +
> > >>> +    tlbe->entry.iova =3D iova & ~tlbe->entry.addr_mask;
> > >>> +    /* parent_perm has s2 perm while perm has s1 perm. */
> > >>  suggestion: while perm keeps s1 perm.
> > >>
> > > Will do.
> > >
> > > Thanks,
> > > Mostafa
> > >>> +    tlbe->parent_perm =3D tlbe_s2->entry.perm;
> > >>> +    return;
> > >>> +}
> > >>> +
> > >>>  /**
> > >>>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
> > >>>   *
> > >>> @@ -607,9 +628,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SM=
MUTransCfg *cfg, dma_addr_t addr,
> > >>>
> > >>>      cached_entry =3D smmu_iotlb_lookup(bs, cfg, &tt_combined, alig=
ned_addr);
> > >>>      if (cached_entry) {
> > >>> -        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMM=
U_WO)) {
> > >>> +        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
> > >>> +            cached_entry->parent_perm & IOMMU_WO)) {
> > >>>              info->type =3D SMMU_PTW_ERR_PERMISSION;
> > >>> -            info->stage =3D cfg->stage;
> > >>> +            info->stage =3D !(cached_entry->entry.perm & IOMMU_WO)=
 ?
> > >>> +                          SMMU_STAGE_1 :
> > >>> +                          SMMU_STAGE_2;
> > >>>              return NULL;
> > >>>          }
> > >>>          return cached_entry;
> > >>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-com=
mon.h
> > >>> index 09d3b9e734..1db566d451 100644
> > >>> --- a/include/hw/arm/smmu-common.h
> > >>> +++ b/include/hw/arm/smmu-common.h
> > >>> @@ -77,6 +77,7 @@ typedef struct SMMUTLBEntry {
> > >>>      IOMMUTLBEntry entry;
> > >>>      uint8_t level;
> > >>>      uint8_t granule;
> > >>> +    IOMMUAccessFlags parent_perm;
> > >>>  } SMMUTLBEntry;
> > >>>
> > >>>  /* Stage-2 configuration. */
> > >> Thanks
> > >>
> > >> Eric
> > >>
> >
