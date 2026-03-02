Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7190E9B359
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 10:17:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx0Kt-00026d-Jm; Mon, 02 Mar 2026 05:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vx0KT-0001qV-Nt
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 05:16:52 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vx0KP-0006Tg-6v
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 05:16:43 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4806b0963a9so116745e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 02:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772446599; x=1773051399; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k7R1AQ3U1P/g1SdN2KGXE8s1gr0B1wgPvi93Wt+CB3g=;
 b=dsaT0ZpG/W2qt8nG+4b4RQF7lzMOqrjjZWm9Jeu1cXIjBWmYn9O9zroVFIzL0pt/On
 wb8SSLVcGBrIL1zGpG3X6nkMDBpMUK/PS2wfw3IsXXCoEoEEIVNotWsJEDm75gnRv8SZ
 onD2GS4M9c3i8+Bjr41lm2K5X7ExK5/jLc63Khn/jFckS3FYDu1EaWczs3yY6V4Nb8i4
 aL+YRjTCq1E2ME/usHnbeak7tnsadp8vIs78WAlLAUdOcNNdLQOajoolrGucsFs4lUlh
 7V0Ftjo/KEifqYYyCVNfl+dWvkU73Y+ufhV1yBlEUweJZJXtz1isXRCn0cMg5IAipmOW
 qDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772446599; x=1773051399;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k7R1AQ3U1P/g1SdN2KGXE8s1gr0B1wgPvi93Wt+CB3g=;
 b=xEpHkBAiwxRYgxWdLzb40lDnK7Ps+wQjA11RS4Dyv5ouJn/v3bbNZhlFUz+Vmvcb6O
 entFkk6AeAqN+kbbAwP+axb9po9h1+8fQamwkHf+gm/5I0scMakcMI3fL4WBPWNqC3Xo
 u7oDco50Ef86UCZxD45KcrKWOTDEYcFYzi8/b5Ff+5JT9MYmPCat3/k3i20IJ3qMrO6U
 BoFqdYaNZlYTEpo/Cl80IyA8tk9RKXJwk3GwkkKCloDCmehPSvb3IKyoxvcakPreuOej
 CiY5vgt1eczxz10LLP6lmDdLtMF/n23NhfmTyETpxbsUSgipm0zHSAbsWTct+pVKTQop
 iOXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX85bz85QEkNbxbc311if0zezxCDnnmCVS27lMIk8tZK/JhltBsb13PUy9YDKF0y/c2kf/DDjOsEA==@nongnu.org
X-Gm-Message-State: AOJu0YxTYXFNqhceR8m5nUSG4tTuql3wSJkYTBcnSRUZFKWa34n/f9Hi
 kWZa2k4YR8kCnw6JDmIhwTgU2JZuSnEXkix73BGBQ4/2+5F5yBDYt5dAOD1Uvz7vPQ==
X-Gm-Gg: ATEYQzwXkcKSUZDFQjEtus/adSHLIsXBNyfYSQiMLTJPYcqqPELsS7HJrApwoofwY8q
 lW7R2g3wgvb744pwVYAuqzNOcH//sY5/H7W6y2XYNYLm6bKnBz9UMT1yAbLzFirgcpOkx2Tt+TV
 9eUeXJhHo84Iex6QCITwCOR7qaLxjzI+AeVMCpgmxq8c0KfgNdC2yHP1AjknXTzz8cPG4RiSQQT
 nSTCXmWoD2jTWNpx2+u9dMz07tDobwqV1X/vsaVTdE7ofGLRXNAdsbHXanymQf+1HIV46AhfJYq
 TJF97sDraLBZm2OQUpuOgs3jJb4wCs1rK+0byqY/UM7FmjmIb2UiwfBavw9I/EHA66n8aAGK2lP
 3INm1BMZrSYomULvRZ02HuYUmiX3BkJrSpRi921IMsDSZFeatvruMPr96pQTIEbLKwWZyyi/D2q
 K3VB3auUUMeQlZPD/GNWH+tWnafysl9yMWRD8iihr8+j0gB71Kfh96EZWd6SCwb8GRB16FXH9Kp
 Kw=
X-Received: by 2002:a05:600c:3554:b0:47d:7304:d759 with SMTP id
 5b1f17b1804b1-483d0642811mr1669495e9.15.1772446599162; 
 Mon, 02 Mar 2026 02:16:39 -0800 (PST)
Received: from google.com (206.56.155.104.bc.googleusercontent.com.
 [104.155.56.206]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c60e40fsm26572926f8f.7.2026.03.02.02.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 02:16:38 -0800 (PST)
Date: Mon, 2 Mar 2026 10:16:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chao Liu <chao.liu.zevorn@gmail.com>
Subject: Re: [RFC v4 04/31] hw/arm/smmuv3: Introduce banked registers for
 SMMUv3 state
Message-ID: <aaVjg4-fqlyxU5lh@google.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221100250.2976287-5-tangtao1634@phytium.com.cn>
 <aaGsS9ldIqXZqhpk@google.com>
 <3287a12c-da1a-463f-b635-37aea5ba8c6d@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3287a12c-da1a-463f-b635-37aea5ba8c6d@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=smostafa@google.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Sun, Mar 01, 2026 at 09:44:32PM +0800, Tao Tang wrote:
> Hi Mostafa,
> 
> On 2026/2/27 PM10:38, Mostafa Saleh wrote:
> > On Sat, Feb 21, 2026 at 06:02:23PM +0800, Tao Tang wrote:
> > > Rework the SMMUv3 state management by introducing a banked register
> > > structure. This is a purely mechanical refactoring with no functional
> > > changes.
> > > 
> > > To support multiple security states, a new enum, SMMUSecSID, is
> > > introduced to identify each state, sticking to the spec terminology.
> > > 
> > > A new structure, SMMUv3RegBank, is then defined to hold the state
> > > for a single security context. The main SMMUv3State now contains an
> > > array of these banks, indexed by SMMUSecSID. This avoids the need for
> > > separate fields for non-secure and future secure registers.
> > > 
> > > All existing code, which handles only the Non-secure state, is updated
> > > to access its state via s->bank[SMMU_SEC_SID_NS]. A local bank helper
> > > pointer is used where it improves readability.
> > > 
> > > Function signatures and logic remain untouched in this commit to
> > > isolate the structural changes and simplify review. This is the
> > > foundational step for building multi-security-state support.
> > > 
> > > Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > There are a few warning from scripts/checkpatch.pl, plus some other
> > nits I mentioned, otherwise:
> > Reviewed-by: Mostafa Saleh <smostafa@google.com>
> > 
> > 
> > > ---
> > >   hw/arm/smmuv3-accel.c        |  42 +++--
> > >   hw/arm/smmuv3-internal.h     |  24 ++-
> > >   hw/arm/smmuv3.c              | 345 +++++++++++++++++++----------------
> > >   include/hw/arm/smmu-common.h |   6 +
> > >   include/hw/arm/smmuv3.h      |  30 ++-
> > >   5 files changed, 257 insertions(+), 190 deletions(-)
> > > 
> > > ------------------------------<snip>------------------------------
> > > 
> > > 
> > > 
> > > ------------------------------<snip>------------------------------
> > > @@ -687,22 +689,24 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
> > >           return;
> > >       }
> > > +    SMMUv3RegBank *bank = smmuv3_bank(s, SMMU_SEC_SID_NS);
> > Sometimes you have:
> > SMMUv3RegBank *bank = smmuv3_bank(s, SMMU_SEC_SID_NS);
> > Others
> > SMMUv3RegBank *bk = smmuv3_bank(s, SMMU_SEC_SID_NS);
> > 
> > It would be helpful if naming is consistent.
> 
> 
> Apologies for not switching to plain text only in Thunderbird in the
> previous reply email, which made the formatting look a bit strange.
> 
> 
> I'll unify this definition across all affected places in V5, and also fix
> style warnings you mentioned previously.
> 
> 
> > > ------------------------------<snip>------------------------------
> > > 
> > > 
> > > 
> > > ------------------------------<snip>------------------------------
> > > @@ -94,7 +99,14 @@ struct SMMUv3Class {
> > >   #define TYPE_ARM_SMMUV3   "arm-smmuv3"
> > >   OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
> > > -#define STAGE1_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S1P)
> > > -#define STAGE2_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S2P)
> > > +#define STAGE1_SUPPORTED(s) \
> > > +    FIELD_EX32((s)->bank[SMMU_SEC_SID_NS].idr[0], IDR0, S1P)
> > > +#define STAGE2_SUPPORTED(s) \
> > > +    FIELD_EX32((s)->bank[SMMU_SEC_SID_NS].idr[0], IDR0, S2P)
> > > +
> > > +static inline SMMUv3RegBank *smmuv3_bank(SMMUv3State *s, SMMUSecSID sec_sid)
> > > +{
> > > +    return &s->bank[sec_sid];
> > > +}
> > > 
> > If this is a macro you can use in other cases as in state structs as
> > it currently inlined in:
> > VMSTATE_UINT32(bank[SMMU_SEC_SID_NS].irq_ctrl, SMMUv3State),
> 
> 
> My understanding is that VMSTATE_* wants an offsetof() ( VMSTATE_UINT32 ->
> VMSTATE_INT32_V -> VMSTATE_SINGLE -> VMSTATE_SINGLE_TEST ->
> vmstate_offset_value ->offsetof ), so maybe we could not directly reuse the
> runtime helper there. At runtime, smmuv3_bank() needs a real `SMMUv3State
> *s` to compute the actual address of the selected bank
> (`&s->bank[sec_sid]`), which is different from a compile-time field offset.
> 
> A small compromise that works for both is to define a field-path macro and
> then take its address in smmuv3_bank():

I see, I missed that, in that case we can just keep it as is, no need to
change.

Thanks,
Mostafa

> 
> 
> ```C
> 
> /* Field-path macro (offsetof-friendly) */
> #define SMMUV3_BANK_F(_sid) bank[(_sid)]
> #define SMMUV3_NS_BANK_F    SMMUV3_BANK_F(SMMU_SEC_SID_NS)
> 
> static inline SMMUv3RegBank *smmuv3_bank(SMMUv3State *s, SMMUSecSID sec_sid)
> {
>     return &s->SMMUV3_BANK_F(sec_sid);
> }
> 
> /* VMSTATE uses the field-path macro directly */
> VMSTATE_UINT32(SMMUV3_NS_BANK_F.irq_ctrl, SMMUv3State);
> 
> ...
> 
> ```
> 
> 
> How do you think about it?
> 
> 
> > 
> > Thanks,
> > Mostafa
> > 
> 
> Thanks for your review.
> 
> Tao
> 

