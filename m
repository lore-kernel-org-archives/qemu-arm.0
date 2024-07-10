Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp626030njb;
        Wed, 10 Jul 2024 15:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXK0OznDs0EESufW0oZQedEUe7dbsMVnTcp5eCAVwUH4c+8KtFLFTUUF9Rz7qyJbLKTvdWTl/+NbO1YWImMUsAuibTj+mO6
X-Google-Smtp-Source: AGHT+IGue9MEQvMF1NYLnGlkEFzv1fX2/SGrmdgt9hBajgrTocQuc23H3hB4Vfjo3ya+BTRedrey
X-Received: by 2002:a05:620a:1990:b0:795:e9cd:f5b8 with SMTP id af79cd13be357-7a1469cf44fmr196016085a.23.1720649232994;
        Wed, 10 Jul 2024 15:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720649232; cv=none;
        d=google.com; s=arc-20160816;
        b=J4MIeveVcNxJOFAJzYVBcR/pz8AdwfpSrhl/6NC3psnuipozm2i//vlepjbb1YQIdy
         60FPlzAG417Km6jabrys+AVXHaPee4zVMyjkxW0i71x/b00qtf0PAR1hOhRIUCEYv6jn
         s0r5+aJ214ovEuMTEBPvlnUYwmU55gRvWWBBvSONtx72pfYDUzOuUuHSaAcdeF0vPmVe
         jYzNUUJgY7nkgJCD26reagUdgp+mQEnZH/yCqCv9aDMchXy/urScROWh2/cBMXCu9POu
         aS6hgcr3iveurlCy/7XNhoXWgN+OwA2pPk4d/VgXzvX7/vCjAkC2m3D6g4Ge6D4V0yJr
         iA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gesSK2pD2ZFqA0jvWamwdOkabkjkA1+DeZvD13zKcyk=;
        fh=ZiLxoeMXSWI9PlPEzJMj8ybBNKyXlqu6pU7biLKDSDs=;
        b=V2SVbjIO9lCpBAXN+mMzGc0MAb2swh/a2BB821gZVhN4INcvGCGyPIMWGzQ7PCJnMb
         nIOzyjjog0GvCVwd8ePhjDiwONkaVtgp1l9vngGKrL9ow6gf7WJ3IiYGrmLV1FI9uoIS
         XIsGY1mTTmy7vXn20KRlVDC/7CaS6bWyGIdDV3ptStNdvr/Vphh9PYKdlBvmJJ379Ejx
         Gc5ADXR+0yXJaP8SuDt24MsRkxfX28jo9lOy1FWrtkG/POrCMPyCwJo2qady9EIRNUUE
         bwwU5+f2GLqDlmNVGOSrTO2y8AW2o80pbf5a/H2oUwIoWdXRsjqPhG0H8qjfGvSM0/Cd
         M2gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X1YSdY0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190b6cb1si549733385a.512.2024.07.10.15.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 15:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X1YSdY0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRfSS-0008C7-Ap; Wed, 10 Jul 2024 18:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRfSQ-000889-Nb
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 18:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRfSO-0004yO-J9
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 18:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720649195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gesSK2pD2ZFqA0jvWamwdOkabkjkA1+DeZvD13zKcyk=;
 b=X1YSdY0k67kmx91cs9WlRs8P/0hhBsJLtNsV0G/WHugEvl7wGFXov8YA6b8hHwVL7N3Fwq
 +Z/Bp5gh/Nz5N6Zauc5fk0B82pRVp5H0s8UdZ7pvhfMY7cwSqOVPg0wzDvKDVHE+KtQvmm
 LVukztdbZhSHou5mHr62Hrf6m44CZms=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-frsloIsHMyiwleXizA_oww-1; Wed, 10 Jul 2024 18:06:29 -0400
X-MC-Unique: frsloIsHMyiwleXizA_oww-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-25df8a91b58so63685fac.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 15:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720649189; x=1721253989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gesSK2pD2ZFqA0jvWamwdOkabkjkA1+DeZvD13zKcyk=;
 b=McnpnmJ3YfeRlTBGbyXPRZ3Ik6ZpFKsyDRSXp0GV7evySJ0CTQ8Rf90yS7kwcUKSLg
 iOuyImbdtzDqn9PDWoFPz7EL0GYlfB6Arnu4lInVSWYddzGqBcQ8XL6UmLNy61ExSlPV
 Kq2jW7TjD/sf/JwXE6fcr1PJw43QmG/afOh9AfVDtVx36znPnmNudJ2kjAMY4xsgkphj
 8OiAUnj715wRIQkGfOJ2EV4+jOOIRuYm2/8qpz4QlBMbcZ0qWgOhJvlPLA3Q8h7r+fcp
 NULObIAPFqbxl9zQFYXgJuVBT9+p+G0ys+6fspQuZGy4r4+57JgKz2mrha+vD+lqbBs8
 w3ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdErEcKsC+Ou+/I0isSzXHeWxLll/OOfpv7jtncZ2SmOU8rO4WEhPkQSkYnykl2pAYNV0jwcNErQtR+wvcx3jmYoNh
X-Gm-Message-State: AOJu0YwZBMDpdrwZzH7nDE/DKdLGjlFCELDW28SHTa+kjXcHiMwBTghp
 DTXrc7n3SNSNLPS6SZGfM9/aOtRglbb3jhAtNIWqcD0sv27LJCkKci6E5ZcTUX5rvHb7XQcGXF8
 6pYjYcOT+LLNIQDHdIwuTMCf+98mF6z1nJCDSeuVxF2oZKRhnsA==
X-Received: by 2002:a05:6808:2395:b0:3d5:6338:49de with SMTP id
 5614622812f47-3d93c1c52ddmr7259914b6e.5.1720649188783; 
 Wed, 10 Jul 2024 15:06:28 -0700 (PDT)
X-Received: by 2002:a05:6808:2395:b0:3d5:6338:49de with SMTP id
 5614622812f47-3d93c1c52ddmr7259901b6e.5.1720649188406; 
 Wed, 10 Jul 2024 15:06:28 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f1902b82fsm231258585a.70.2024.07.10.15.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 15:06:27 -0700 (PDT)
Date: Wed, 10 Jul 2024 18:06:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Bin Meng <bmeng.cn@gmail.com>,
 Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, devel@lists.libvirt.org,
 Luc Michel <luc.michel@amd.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on block
 drive (CMD56)
Message-ID: <Zo8F4Gq4f7SawaDc@x1n>
References: <20240627162232.80428-7-philmd@linaro.org> <87cynmfggx.fsf@suse.de>
 <Zo2lLLAwcZ8bBvO2@x1n> <87a5ipfigb.fsf@suse.de>
 <Zo6iZjc8YpI1_9dW@x1n> <874j8xfc9s.fsf@suse.de>
 <Zo7dcF8OKfH92RlR@x1n> <871q41f2pk.fsf@suse.de>
 <Zo7rCXtap2lWd4IB@x1n> <87ttgxdj1p.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87ttgxdj1p.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sWXsM60NOgdL

On Wed, Jul 10, 2024 at 06:38:26PM -0300, Fabiano Rosas wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Wed, Jul 10, 2024 at 04:48:23PM -0300, Fabiano Rosas wrote:
> >> Peter Xu <peterx@redhat.com> writes:
> >> 
> >> > On Wed, Jul 10, 2024 at 01:21:51PM -0300, Fabiano Rosas wrote:
> >> >> It's not about trust, we simply don't support migrations other than
> >> >> n->n+1 and (maybe) n->n-1. So QEMU from 2016 is certainly not included.
> >> >
> >> > Where does it come from?  I thought we suppport that..
> >> 
> >> I'm taking that from:
> >> 
> >> docs/devel/migration/main.rst:
> >>   "In general QEMU tries to maintain forward migration compatibility
> >>   (i.e. migrating from QEMU n->n+1) and there are users who benefit from
> >>   backward compatibility as well."
> >> 
> >> But of course it doesn't say whether that comes with a transitive rule
> >> allowing n->n+2 migrations.
> >
> > I'd say that "i.e." implies n->n+1 is not the only forward migration we
> > would support.
> >
> > I _think_ we should support all forward migration as long as the machine
> > type matches.
> >
> >> 
> >> >
> >> > The same question would be: are we requesting an OpenStack cluster to
> >> > always upgrade QEMU with +1 versions, otherwise migration will fail?
> >> 
> >> Will an OpenStack cluster be using upstream QEMU? If not, then that's a
> >
> > It's an example to show what I meant! :) Nothing else. Definitely not
> > saying that everyone should use an upstream released QEMU (but in reality,
> > it's not a problem, I think, and I do feel like people use them, perhaps
> > more with the stable releases).
> >
> >> question for the distro. In a very practical sense, we're not requesting
> >> anything. We barely test n->n+1/n->n-1, even if we had a strong support
> >> statement I wouldn't be confident saying migration from QEMU 2.7 -> QEMU
> >> 9.1 should succeed.
> >
> > No matter what we test in CI, I don't think we should break that for >1
> > versions..  I hope 2.7->9.1 keeps working, otherwise I think it's legal to
> > file a bug by anyone.
> >
> > For example, I randomly fetched a bug report:
> >
> > https://gitlab.com/qemu-project/qemu/-/issues/1937
> >
> > QEMU version:                6.2 and 7.2.5
> >
> > And I believe that's the common case even for upstream.  If we don't do
> > that right for upstream, it can be impossible tasks for downstream and for
> > all of us to maintain.
> 
> But do we do that right currently? I have no idea. Have we ever done
> it? And we're here discussing a hypothetical 2.7->9.1 ...
> 
> So we cannot reuse the UNUSED field because QEMU from 2016 might send
> their data and QEMU from 2024 would interpret it wrong.
> 
> How do we proceed? Add a subsection. And make the code survive when
> receiving 0.
> 
> @Peter is that it? What about backwards-compat? We'll need a property as
> well it seems.

Compat property is definitely one way to go, but I think it's you who more
or less persuaded me that reusing it seems possible! At least I can't yet
think of anything bad if it's ancient unused buffers.

And that's why I was asking about a sane way to describe the "magic
year".. And I was very serious when I said "6 years" to follow the
deprecation of machine types, because it'll be something we can follow to
say when an unused buffer can be obsolete and it could make some sense: if
we will start to deprecate machine types, then it may not make sense to
keep any UNUSED compatible forever, after all.

And we need that ruler to be as accurate as "always 6 years to follow
machine type deprecation procedure", in case someone else tomorrow asks us
something that was only UNUSED since 2018.  We need a rule of thumb if we
want to reuse it, and if all of you agree we can start with this one,
perhaps with a comment above the field (before we think all through and
make it a rule on deprecating UNUSED)?

-- 
Peter Xu

