Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF41BC61DD6
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 15:45:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1n9o-0005LQ-JK; Wed, 02 Sep 2026 11:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x1n9n-0005L8-BE
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 11:45:47 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x1n9k-00057p-Jb
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 11:45:47 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2d032846c95so15422675ad.1
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788363942; x=1788968742; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TPysDsGnpI9b+EwUBvoDR+Wcd16jrG2t2FBfRR3MC1c=;
 b=URvndoNUVO2h5AwJAKAYmwu3/wlxgsrOYqz+bGfzBSy18QQir30KiQ4HaC2wao7STv
 mmwGDn6Q/a/cJTgBH3RiuSOHKfWeSk2Wjs+16K7fKjxuT5Ckx5jvhWdaTURtYolbsbxU
 R2OrQUpUCIVhQk7SXvCYQC1s0D6sWbucMcBZiyEtXXZaVytvJUaMhdVtvybI4ofL66XY
 xpVj2cmv0G0Ax8NpzksaLA7O+uniilwVSoFxLhpPuRmhJrV4B/yyx4cO8XcWMjCroH9t
 7RdfoMwwqPJf9LvLMpPKFEaGYaLIYEBAzrcJd20SpCA5QILPHIZ1dSw8y5Ggti+jUG+F
 vTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788363942; x=1788968742;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TPysDsGnpI9b+EwUBvoDR+Wcd16jrG2t2FBfRR3MC1c=;
 b=p7nBhCf6fNuGZaHpmVmjhib9MKvh5O/4d7JlDizIa3KBItaDslCPXXvUpwRwJ7y7J8
 lNpjy4YsTWHGuvpd9LbOnVJ7U0GNdatMXq/Io7CbbMGdBvdXxUZAlWX4gA8OhDP51kZS
 Ut46Lx8kgfetelNkwd5f8FVuARv3ersX/zCx85Rwr2xDneESdnsvArOxajIZ2uIMwNgy
 r9V+k4d13uFvAkyh/o6qf7b2EavV6yFN+/hjfvjFheLDoNPPkn7PP+1teMLLsL1MFzgw
 PSeb8+Xq5Zh6UiefPpws4REnbLxeZ4kMgjCsCOC6R6xq4h/Erx9lNQRRvj58IZPplaSZ
 SSIA==
X-Forwarded-Encrypted: i=1;
 AKwUvByiRm9KqhvKtFKeFwR6iK+6ejPZP9jyia7j0tGJw55wBmKT0tByEMb9ePQRJ2xnewIVfNBvjSQPvw==@nongnu.org
X-Gm-Message-State: AFuF++nm/DjQOJaLPcjufGk1Q8V2/W7vaF4poD87dTOwKQZxz/Pk4v8c
 sAoMT165Iv2Bi5Vf1scYj/73JtezV0Zi0dQns9xl64FpVLbbaB2yn/6Ff1qYInYvCKE=
X-Gm-Gg: AYBFou1L/j7xXGiO6RPJAa0JuGRJmjXEm5JEiZookTp/BX8Hr9RPp9tpE47RjZHJtQa
 0OkgKMm92k9lYK5tJW046UMy3rnm1uMoC7Paoa8hy/YGNo8QcYmP1OBlIOFB4+q/Ds0PdMooLk3
 ZN6WKS1qTtPhmOxNqy7bBrRkJp+TUornbbnrUhCf9pJCOMigBbwwjKQP59R+afDY1RpgiAuqNBt
 x0R+8s2EmCblZZAUod9JVUZR38RZp8zOPU2xctjMmOa4UlYvDAdpSqHJiH/v/N989Rb9iXwBE8N
 MMb3iXcRGc015/0ZRB5xe3DRCQJWfS3HY3QNGTssF5XL3TICSaYJsyDwKGgCATJy+NMFaKXfiZP
 7DPBXITU0sBhBWPeVNa6L9TgWTO/ZvRcNbmOeEp7Ju86ShUEIeo352rsZD1ZRwsGSyHMkBDT3hb
 6V79vq1uWlkQmXxNBHkl1sLEStzPAuE1QSdpWEl7tLZq6qYZQk3M2PSAU45GTbsHX18ytvKF4u7
 70=
X-Received: by 2002:a17:902:d4ce:b0:2d8:d2bd:a111 with SMTP id
 d9443c01a7336-2daec626dbdmr76719805ad.6.1788363942059; 
 Wed, 02 Sep 2026 08:45:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fff4:86c5:8d86:9e93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dadd48898fsm15694765ad.39.2026.09.02.08.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 08:45:41 -0700 (PDT)
Date: Wed, 2 Sep 2026 09:45:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [RFC v3 00/24] Add Realm support to QEMU-VMM
Message-ID: <aphEopEnM1pEDLV4@p14s>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
 <87wlt55cs2.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlt55cs2.fsf@pond.sub.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Sep 01, 2026 at 03:20:13PM +0200, Markus Armbruster wrote:
> Mathieu Poirier <mathieu.poirier@linaro.org> writes:
> 
> > This patchset provides minimal functionality to start a Realm VM
> > from an Arm RME capable host using the following command line:
> >
> > qemu-system-aarch64 \
> >  -M confidential-guest-support=rme0,memory-backend=ram0 \
> >  -object rme-guest,id=rme0,convert-in-place=on \
> >  -object memory-backend-guest-memfd,id=ram0,size=1G,share=on \
> >  -cpu host -M virt -enable-kvm -M gic-version=3,its=on -nodefaults ..
> >
> > It is a refactoring of Jean-Philippe Brucker's initial work dating from a while
> > back.  It is compatible with Steven Price's v16 revision [1] of his work adding
> > CCA support to KVM.
> >
> > This revision is based on Michael Roth's work on guest memfd in-place memory
> > conversion [2] and as such, the QEMU baseline is different from 'master'.  Other
> 
> Use
> 
>     Based-on: <20260528000416.8161-1-michael.roth@amd.com>
> 
> to document your base.  This stands out to humans, and is readable by
> machines.  Next time :)
> 
> > than modifications to use in-place memory conversion from Lorenzo Pieralisi that
> > were integrated to patches 04, 08-11, it is identical to V2.   
> >
> > It was tested on the QEMU SBSA machine.  For convenience, a repository is hosted
> > here [3],
> 
> Michael's series doesn't apply on master anymore, so I fetched this
> branch.  It's based on master as of *May*.  This won't do.  Please rebase.

This was clearly explained above.  The goal was to provide a patchset that can
be used for testing. I can attempt a rebase but can't guarantee a timeline or
success.

> 
> >           along with the TF-A [4] and RMM [5] for the SBSA machine (compatible
> > with Steven's v16 patchset).  The Repository for the kernel [6] is available
> > from Arm.
> >
> > Instructions to compile and run the entire stack can be found here [7].
> >
> > Device Assignment is not included.
> >
> > Thanks,
> > Mathieu
> >
> > [1]. https://lore.kernel.org/kvm/20260803134403.80630-1-steven.price@arm.com/
> > [2]. https://lore.kernel.org/kvm/20260528000416.8161-1-michael.roth@amd.com/
> > [3]. https://gitlab.com/Linaro/cca-public/qemu/-/tree/upstream-v3?ref_type=heads
> > [4]. https://gitlab.com/Linaro/cca-public/tf-a/trusted-firmware-a/-/tree/cca/v13?ref_type=heads
> > [5]. https://gitlab.com/Linaro/cca-public/rmm/-/tree/cca/v16?ref_type=heads
> > [6]. https://gitlab.arm.com/linux-arm/linux-cca/-/tree/cca-host/v16?ref_type=heads
> > [7]. https://gitlab.com/Linaro/cca-public/build-instructions
> >
> > RFC v2: https://lore.kernel.org/kvm/20260728192630.240375-1-mathieu.poirier@linaro.org/
> > RFC v1: https://lists.gnu.org/archive/html/qemu-devel/2026-07/msg02307.html
> 
> 

