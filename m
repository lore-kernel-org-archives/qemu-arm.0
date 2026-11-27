Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0377606A6AF
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDLxzlav
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWwxV-0006q5-VK; Fri, 27 Nov 2026 09:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWwxQ-0006mc-BK
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 09:29:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWwxO-0003F7-0f
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 09:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795789783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gZPicw7HdZkH0WN/ma2qQpEsW2N6dyb0vU7qVy3xQF4=;
 b=EDLxzlaviZq8EeftyaSPmeWrSkd8ksECUc53TIZZmQsWFcw4F9fMtifmYIYg6uV6YJE6Ji
 5pDNtrxMYKPJA+E4tLJ3+LDJCMyCD5YkQtz2ji/6YLFXIH+MSRYEZ1jVDcxPgFimxf6FUS
 /d4znzmLercDtKbdpKSbq1wwi/ymcFY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-Je4ZdiJhNvyB_xPt_9DsXg-1; Fri, 27 Nov 2026 14:29:41 +0000
X-MC-Unique: Je4ZdiJhNvyB_xPt_9DsXg-1
X-Mimecast-MFC-AGG-ID: Je4ZdiJhNvyB_xPt_9DsXg_1795789781
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-949b0d322fcso1340548485a.2
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 06:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795789781; x=1796394581;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gZPicw7HdZkH0WN/ma2qQpEsW2N6dyb0vU7qVy3xQF4=;
 b=pQvqgc8QoNa+0WKjQ8DLTzXuPQCRvt8ADxn++bMZ7gd7N8NX6BVF2L+LmX6uOO9jjX
 DEQvx4sH7D8F3nd6O5TMxb/YLuEJ2L5FDO+rqhGcUbXZ7+CMQEFabTV/+JtK6cpeC06R
 AnxXGo/ytcrG4Q7sssLe1b2w1jzNmxVzzl+Sz8ullQgOq61RkQfblrUY6OI9pT8uycI+
 lipXsAUSHGQBn7+37QkI68tWSmKzfaBNKV9589Ply8oDaYX58JzM3LHSrbQ/1ypUTBYY
 CwX5GRv+FRbc5ZAcFU33EVjskBuCQDNjYcYDlFF7jp32tkzgdQLPM2We11Ge5w7z16zn
 7weA==
X-Forwarded-Encrypted: i=1;
 AL+hErGtOiN3K2QXxiD6xAIBV9zz38gk2IhB/FQpyLXQB7necNd/i7WDdZxGSWUHVnLIJ8w8+24L1S10yA==@nongnu.org
X-Gm-Message-State: APuU4Z94y8wsg1XBCi8uVTbzt+TukPZxd9s0Upr6KPTXa4TNey0UVj4h
 2jlgSsrCYmgNTUcTRf0+QWRWZA49umyc3/Oc627G71OQsxcRKfTCm5hXpOPWjx5nZOPYN7z+ogj
 5JWhXcua3HKxQDHxU80SbNZcJwJ6hftHlXhO922agQ53qO+vj48Ngxg==
X-Gm-Gg: AZFdTZe8A1JMyynz1OKRIHRtBegiKmv00AXfRD5dCwLWpj3DlVHmFM9REmGlIHdRwCc
 g3gbzVlBSOaEMq5Hw/ECiJvQt6SQ6MS7Ixfyg5Ebzj1p+AwKRlTcQiKwO2S2Kv+QjpmJi64wN8d
 JyZLUAZMSkE15j0+B0Og3uYjd6qSkWp8c5ukOgZaO1177dHf+ZNRTAucTQmOEybJDmfsxDZExsD
 RwcphS4aecCjU2+xKaYOPZMK1DOs7PbBUBDYfAfZRZoCTPL7yDsfArj0WM7Y89k2sO82qpbTuNw
 q7wzS/mO9qlWNPJOX9SAc0FMz4e9wpNvrVveFj4JPOmF55jAKBDwLcAl9prtzLsjrwAFSU9jv/7
 Ac1GFgeGS38v4d26nbPpFMY6odeNmZnn6iz8UfiQgvOvHAQ==
X-Received: by 2002:a05:620a:701c:b0:949:a254:706a with SMTP id
 af79cd13be357-949ba96eae0mr4267650085a.14.1795789780534; 
 Fri, 27 Nov 2026 06:29:40 -0800 (PST)
X-Received: by 2002:a05:620a:701c:b0:949:a254:706a with SMTP id
 af79cd13be357-949ba96eae0mr4267645585a.14.1795789779869; 
 Fri, 27 Nov 2026 06:29:39 -0800 (PST)
Received: from localhost ([2605:8d80:6cc7:75f8:8c4a:4476:f571:f0d6])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb41c105sm1863582585a.39.2026.11.27.06.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 06:29:38 -0800 (PST)
Date: Fri, 27 Nov 2026 09:29:36 -0500
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Juraj Marcin <jmarcin@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-12.0 v2 8/9] arm/machine: Move all VMSTATE_VALIDATE()
 usages into post_load
Message-ID: <awmT0J9l7OvAmXfh@zhexu-thinkpadt14gen5.rmtcaon.csb>
References: <20261126231631.3392756-1-peterx@redhat.com>
 <20261126231631.3392756-9-peterx@redhat.com>
 <87pkvqqtlm.fsf@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87pkvqqtlm.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dCXvW3KOvukcB4LiGS3dQxFVh2k4h0rM9fd1wEB072M_1795789781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 10:41:57AM -0300, Fabiano Rosas wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > To pave way removing VMSTATE_VALIDATE(), move all four such uses into a
> > post_load hook instead.
> >
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: qemu-arm@nongnu.org
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  target/arm/machine.c | 90 ++++++++++++++++++--------------------------
> >  1 file changed, 37 insertions(+), 53 deletions(-)
> >
> > diff --git a/target/arm/machine.c b/target/arm/machine.c
> > index e86fa85a9b..b401593496 100644
> > --- a/target/arm/machine.c
> > +++ b/target/arm/machine.c
> > @@ -407,14 +407,6 @@ static const VMStateDescription vmstate_m_faultmask_primask = {
> >   * just non-secure, we transfer both banks here rather than putting
> >   * the secure banked version in the m-security subsection.
> >   */
> > -static bool csselr_vmstate_validate(void *opaque, int version_id)
> > -{
> > -    ARMCPU *cpu = opaque;
> > -
> > -    return cpu->env.v7m.csselr[M_REG_NS] <= R_V7M_CSSELR_INDEX_MASK
> > -        && cpu->env.v7m.csselr[M_REG_S] <= R_V7M_CSSELR_INDEX_MASK;
> > -}
> > -
> >  static bool m_csselr_needed(void *opaque)
> >  {
> >      ARMCPU *cpu = opaque;
> > @@ -429,7 +421,6 @@ static const VMStateDescription vmstate_m_csselr = {
> >      .needed = m_csselr_needed,
> >      .fields = (const VMStateField[]) {
> >          VMSTATE_UINT32_ARRAY(env.v7m.csselr, ARMCPU, M_REG_NUM_BANKS),
> > -        VMSTATE_VALIDATE("CSSELR is valid", csselr_vmstate_validate),
> >          VMSTATE_END_OF_LIST()
> >      }
> >  };
> > @@ -590,18 +581,6 @@ static bool pmsav7_needed(void *opaque)
> >             !arm_feature(env, ARM_FEATURE_V8);
> >  }
> >  
> > -static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_id)
> > -{
> > -    ARMCPU *cpu = opaque;
> > -
> > -    /*
> > -     * Check MPU_RNR in-bounds. If no MPU, we still migrate this field
> > -     * but number of regions == 0 and MPU_RNR is RAZ/WI so also 0
> > -     */
> > -    return cpu->env.pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion ||
> > -        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_NS] == 0);
> > -}
> > -
> >  static const VMStateDescription vmstate_pmsav7 = {
> >      .name = "cpu/pmsav7",
> >      .version_id = 1,
> > @@ -614,7 +593,6 @@ static const VMStateDescription vmstate_pmsav7 = {
> >                                vmstate_info_uint32, uint32_t),
> >          VMSTATE_VARRAY_UINT32(env.pmsav7.dracr, ARMCPU, pmsav7_dregion, 0,
> >                                vmstate_info_uint32, uint32_t),
> > -        VMSTATE_VALIDATE("rgnr is valid", pmsav7_rgnr_vmstate_validate),
> >          VMSTATE_END_OF_LIST()
> >      }
> >  };
> > @@ -695,31 +673,6 @@ static const VMStateDescription vmstate_pmsav8 = {
> >      }
> >  };
> >  
> > -static bool s_rnr_vmstate_validate(void *opaque, int version_id)
> > -{
> > -    ARMCPU *cpu = opaque;
> > -
> > -    /*
> > -     * Check MPU_RNR in-bounds. If no MPU, we still migrate this field
> > -     * but number of regions == 0 and MPU_RNR is RAZ/WI so also 0
> > -     */
> > -    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
> > -        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_S] == 0);
> > -}
> > -
> > -static bool sau_rnr_vmstate_validate(void *opaque, int version_id)
> > -{
> > -    ARMCPU *cpu = opaque;
> > -
> > -    /*
> > -     * Check SAU_RNR in-bounds. If no SAU regions are implemented,
> > -     * we still migrate this field, but number of regions == 0 and
> > -     * SAU_RNR is RAZ/WI so also 0
> > -     */
> > -    return cpu->env.sau.rnr < cpu->sau_sregion ||
> > -        (cpu->sau_sregion == 0 && cpu->env.sau.rnr == 0);
> > -}
> > -
> >  static bool m_security_needed(void *opaque)
> >  {
> >      ARMCPU *cpu = opaque;
> > @@ -749,7 +702,6 @@ static const VMStateDescription vmstate_m_security = {
> >          VMSTATE_VARRAY_UINT32(env.pmsav8.rlar[M_REG_S], ARMCPU, pmsav7_dregion,
> >                                0, vmstate_info_uint32, uint32_t),
> >          VMSTATE_UINT32(env.pmsav7.rnr[M_REG_S], ARMCPU),
> > -        VMSTATE_VALIDATE("secure MPU_RNR is valid", s_rnr_vmstate_validate),
> >          VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_S], ARMCPU),
> >          VMSTATE_UINT32(env.v7m.ccr[M_REG_S], ARMCPU),
> >          VMSTATE_UINT32(env.v7m.mmfar[M_REG_S], ARMCPU),
> > @@ -761,7 +713,6 @@ static const VMStateDescription vmstate_m_security = {
> >          VMSTATE_VARRAY_UINT32(env.sau.rlar, ARMCPU, sau_sregion, 0,
> >                                vmstate_info_uint32, uint32_t),
> >          VMSTATE_UINT32(env.sau.rnr, ARMCPU),
> > -        VMSTATE_VALIDATE("SAU_RNR is valid", sau_rnr_vmstate_validate),
> >          VMSTATE_UINT32(env.sau.ctrl, ARMCPU),
> >          VMSTATE_UINT32(env.v7m.scr[M_REG_S], ARMCPU),
> >          /* AIRCR is not secure-only, but our implementation is R/O if the
> > @@ -1177,11 +1128,48 @@ static bool cpu_post_load(void *opaque, int version_id, Error **errp)
> >      ARMCPU *cpu = opaque;
> >      CPUARMState *env = &cpu->env;
> >      bool ignore_s_regs;
> > +    bool valid;
> >      int i, v;
> >  
> >      trace_cpu_post_load(cpu->cpreg_vmstate_array_len,
> >                          cpu->cpreg_array_len);
> >  
> > +    if (env->v7m.csselr[M_REG_NS] > R_V7M_CSSELR_INDEX_MASK ||
> > +        env->v7m.csselr[M_REG_S] > R_V7M_CSSELR_INDEX_MASK) {
> > +        error_setg(errp, "CSSELR is invalid");
> > +        return false;
> > +    }

[1]

> > +
> > +    /*
> > +     * Check MPU_RNR in-bounds. If no MPU, we still migrate these fields
> > +     * but number of regions == 0 and MPU_RNR is RAZ/WI so also 0
> > +     */
> > +    valid = env->pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion ||
> > +        (cpu->pmsav7_dregion == 0 && env->pmsav7.rnr[M_REG_NS] == 0);
> > +    if (!valid) {
> > +        error_setg(errp, "rgnr is invalid");
> > +        return false;
> > +    }
> > +
> > +    valid = env->pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
> > +        (cpu->pmsav7_dregion == 0 && env->pmsav7.rnr[M_REG_S] == 0);
> > +    if (!valid) {
> > +        error_setg(errp, "secure MPU_RNR is invalid");
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * Check SAU_RNR in-bounds. If no SAU regions are implemented,
> > +     * we still migrate this field, but number of regions == 0 and
> > +     * SAU_RNR is RAZ/WI so also 0
> > +     */
> > +    valid = env->sau.rnr < cpu->sau_sregion ||
> > +        (cpu->sau_sregion == 0 && env->sau.rnr == 0);
> > +    if (!valid) {
> > +        error_setg(errp, "SAU_RNR is invalid");
> > +        return false;
> > +    }
> 
> Shouldn't you guard these blocks with the result of what .needed would
> have returned on the source? Otherwise we may not migrate a value but
> still try to validate it here? I haven't checked if the unmigrated field
> may end up with a value that will cause these checks to pass.

Yep, thanks for spotting this.

My understanding is we're all prepared, see the comments above "... we
still migrate this field, but number of regions == 0 ...".

The 1st one isn't [1], but it seems also fine assuming
csselr[M_REG_NUM_BANKS] will be all zero initialized if not used.

Let's wait again for PeterM to help double check; the hope is they're all
benign.

-- 
Peter Xu


