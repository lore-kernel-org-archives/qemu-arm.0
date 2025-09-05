Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B62ACA1013
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 14:33:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuXUv-0004RH-3r; Fri, 05 Sep 2025 10:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uuXUu-0004Pf-Gv
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 10:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uuXUb-0003I4-NF
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 10:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757082761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AJYsQ0k41dYEtEm+qEtpIcG16VDv3rXSXQjY6KH6CC8=;
 b=SbN27ZXSN7kWZgZQiH6Q3umAKvh6BoA+ctWFRc0qZh5DP6Pc0MXMvbGH1LMgH8EhFx4QhZ
 O7tDgeb7ZzuD8/yCL+/ZNj5GRgHgiBMVvQF2oHTzBA8ukCRZYRi+v5OsoFCQuNY5vTNAhW
 oJvHIgVItRUwgEOtHOdfh7jBSnvS37U=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-0-_ulbBdPUqM4JufHNyv2Q-1; Fri, 05 Sep 2025 10:32:40 -0400
X-MC-Unique: 0-_ulbBdPUqM4JufHNyv2Q-1
X-Mimecast-MFC-AGG-ID: 0-_ulbBdPUqM4JufHNyv2Q_1757082760
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b302991816so44627591cf.0
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 07:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757082760; x=1757687560;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJYsQ0k41dYEtEm+qEtpIcG16VDv3rXSXQjY6KH6CC8=;
 b=ea6rPBlPKFmgHy7RIw0Ms6tiE4qiUPiydAinuF2yJimDJUafdmhDl1LhHPHwZtakK5
 wi0WgIStiNeMo0VdoUAM3JdcJ6sYJrApHiaJeHS+AyIWfp0+ZRMDeurAPrtCoFj3OXr1
 v/3ZkUB8usueKaZLU+d9RSYi5Q/kRLh9JfQAINd0TRb2PUuWG8XdLk1R27StIeKSGFnP
 8TYCJsSQzYuxmBCFxbhJ1nK1/xFVR4OIX73qOphYZ04IIXp2CYsuyHOKMzQfuOoHiHIf
 h+tvlw1Iz3Q3uDP+T9jIBGElqaKe31h3cjTM5s9iW61RUH5yO16y/g5URqaDkxpbQZka
 aU4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXusMt8Vzt2Rj8fjKdu9HgHqL136OBe5Y3YulTkkz1Yu/DFeHF1f3LFR1MA3Uy/ilEHvAAtK5iCfA==@nongnu.org
X-Gm-Message-State: AOJu0YyTQlZfDynHTyB4cu8zUv/xdhV2m6QssxI8Aed779NaNpV70x4W
 Ryn+HijFq3HfHDVrYglSC1SXBO6b4JqtHxqmq8eYX6qNbvT4L3dh3x6Ea5CrRq5yr5pySZYFpt4
 kJ1Pf0InvOxFKwkNFCoLsCl3jAtj9TfQpdKaeMNWjU9Y0tYI3rDWzvw==
X-Gm-Gg: ASbGncuJN/CuM3ToFyLZ6aEQh1egOR/ctrO3Wge2eb9x5U1RJCF0P7j9V6YFmmpvorr
 apS9nK664xnQ3dvi8QRe8oMwhUBwwX7WzAIBZu46drsCN/TKh1v5paELUCnrc18Uo1C7IX+u0Hj
 91uG40VaiAK3dgSOKUtKbDmHFxKwPnyYBqQxB9TaC8ZYNH7eJYucK4Jk9iIRbka+N4npxkTkWiE
 K5+NtmwEurRtTmvhCtTFg60rNvWGQRFljc9wR8hehVM7PqeSh4IUXkPCXVbMGVYC1QVEC/6x/hZ
 Ar43cazk1AQBz/S/JxilICT5pOiM02Wt
X-Received: by 2002:a05:622a:10c:b0:4b0:69d6:85a2 with SMTP id
 d75a77b69052e-4b31d86175amr301290631cf.31.1757082759491; 
 Fri, 05 Sep 2025 07:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGW45Sakcic0/au626zXwdL13HxP0OyaIYT2HgE/EM8+kHYAiCyErP6T4Qce2avfFhoAv8oA==
X-Received: by 2002:a05:622a:10c:b0:4b0:69d6:85a2 with SMTP id
 d75a77b69052e-4b31d86175amr301289721cf.31.1757082758538; 
 Fri, 05 Sep 2025 07:32:38 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b48f673fecsm45984731cf.21.2025.09.05.07.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 07:32:37 -0700 (PDT)
Date: Fri, 5 Sep 2025 10:32:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: chen CJ <cjchen@igel.co.jp>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jesper Devantier <foss@defmacro.it>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>
Subject: Re: [Withdrawn] [RFC PATCH v2 0/9] support unaligned access to xHCI
 Capability
Message-ID: <aLr0eTjUe8FXkQmV@x1.local>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <CAAMq-Y86UY7LNe-p2P_d8mw7FgTqLm=HQdqbMvV8xxTdsZmx1A@mail.gmail.com>
 <CAFEAcA_EZxgnSHOEwdF5QayAxsncYnGGe4RDPP-vwYTqwU+dNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EZxgnSHOEwdF5QayAxsncYnGGe4RDPP-vwYTqwU+dNA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: laf4zxjcrgdktzN3jPggw68OYGiSTLWoeQ4-XR7Sz1M_1757082760
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Wed, Sep 03, 2025 at 10:47:17AM +0100, Peter Maydell wrote:
> On Wed, 3 Sept 2025 at 06:03, chen CJ <cjchen@igel.co.jp> wrote:
> >
> > I would like to withdraw this patch series.
> >
> > Sorry for the inconvenience, and thank you for your understanding.
> 
> That's unfortunate; I think it's an issue we really do need to fix,
> but I entirely understand if you don't have the time to work
> on it further.
> 
> I might pick it up if I have the time to do so.

I worked on this problem a bit more in the past few days while almost
everyone will be at the forum.  It's almost because I saw similar issues
that I have commented before on old versions, but they still existed in the
core patch 5.  Then I found more issues.  Keep commenting on that might be
awkward because there will be quite a few dependency changes.  One example
is, I kept thinking we should not worry about MMIO out-of-bound over
mr->size when reaching as deep as access_with_adjusted_size().  There are
still quite a few places in patch 5 of this series that does the
calculation and it's not obvious what happens if mr->size violated.

Peter, if you want to pick it up, please consider reading the replies I
left in this series, alone with this version below as comparison reading
material.  The hope is the reworked patchset below _might_ be easier to
read (at least I did add rich comments, because the unaligned changes are
tricky and not easy to follow):

https://gitlab.com/peterx/qemu/-/commits/mem-unaligned-fix-v0.1?ref_type=tags

Especially this patch:

https://gitlab.com/peterx/qemu/-/commit/8a8f0f5728a7adc6ecb2cf4358366d2d663a5ed9

However that won't pass the test cases.  I still doubt the test case is
wrong but I didn't go further modifying the test cases yet (or any better
way to test this as you suggested in the other reply).  I think that can be
the 1st thing we figure out, not the best way to test, but the correctness
of the current test case, because IIUC it shouldn't be relevant to impl of
unaligned access.  To me, if we can reach a consensus on what is the
correct (test) behavior on all kinds of unaligned access emulations, fixing
the impl should be relatively easy.

Thanks,

-- 
Peter Xu


