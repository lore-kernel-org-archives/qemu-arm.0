Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C19C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:34:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woist-0005Jo-IR; Tue, 28 Jul 2026 10:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1woisr-0005J7-Gn
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1woisp-0008M3-NS
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785249255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qArjsjIQU1lq2Ykf7SAMUFMtBbSfJkNEpAzhQotRVLg=;
 b=ebWzZzWjP/c61Q+Pk0KP+36idoBBBjxcizPGGC7TvJi9Ggooh8T8KTQTIsFVZdZOpa4BaO
 A32wmEHgC4Y12dhLI3dpDHHYxuM8j7rr21ONaMyGmh3m8CDuSc9qlA98YyVaWH86Wc+4ed
 OTiG6pvyw8mzgIwwiYtATuMaHdNOFqo=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-peG3P9i9MjKJbC1w2YF1hg-1; Tue, 28 Jul 2026 10:34:13 -0400
X-MC-Unique: peG3P9i9MjKJbC1w2YF1hg-1
X-Mimecast-MFC-AGG-ID: peG3P9i9MjKJbC1w2YF1hg_1785249252
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-96910ded42cso175316241.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785249252; x=1785854052;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=qArjsjIQU1lq2Ykf7SAMUFMtBbSfJkNEpAzhQotRVLg=;
 b=lPQQq9oKu/g5MuNVgWKYFXY8iTFgfNz1Q3UScP5KjQ21/KnyCOA1AvrjccECv4vZsq
 P97XKnFozaW9p+tIiyqCIqGq+Zp8CU6pdkCpsShvavrg6qXFUywi5Vc/K/zTVfvRHlV+
 El4n6S/y+5vSG+pyLy2AIS44vG43tx50MH0gzm4mTyYFTLLriL286ocRjBPPZZDqsmht
 2ap+x5LHpy+pNpIdVZEoLtG153QVNR7W9UkwLyUplU73nGKT6Mit9NQmJy+3uxTYoCfS
 peMc5/QZt/i067W3PEtdWPvd/gpstLblIpnlZRcuwGx6xa5eto/2vfG6+Wi8hRhiTOF6
 QIxw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqsDK2YhgFTYCQ0OuV0Q3uo3i29uRTuYc49HTTKoq6hG00FQ63N2T/RqcAAGeXQpThGQCS1KFGCBg==@nongnu.org
X-Gm-Message-State: AOJu0YwhzgkRsTD/38t5zXuFVmhdOrR9N2FNBFFa1Oen+box9fwWIWIG
 uecA6IqOVyErHWaWmHQRXNxEFk3MXbMMiyivlGOWRM+SPhc34VjSMJklTF9ZZ7kFoaoGxrIftwF
 fxGQRD3QFTitjborMPZ3WTEL5pQqQsVC6EeVqICsn0j6j9oNlKP5RHA==
X-Gm-Gg: AR+sD13G2p9L8C94fnGVXuG8EecW5zE9IvZyYX17mRr7zCuC4JFkmBoL/E6XXH6ongX
 bgCBWAbIZRRinWxCIeYTz4Fxz6QBpgHz9ICFMbnZrGTUXmrbjnqB5czgW4AGU14KstKZuzA9kiQ
 11JfZZzGZa3rSWU3lO4iP/XvjNcNK7I833eOO0Ka5VYwQfyIgI9jEMUcB+L1Z6lIQKJN8i97NiX
 AIvljDsYRpwhp/vXh7ejaTQIJzmKhdtP3Vwg0wmwK/tbzOTtkkacI2HJDVy0/OSJd986HWWRPsn
 a2juYw7Zy0Co2Y6kaN5dw8zuzCVuZ2TT79EbGDOhxoiG0iJFHpc9I6oR99lwGWYSFk5ai2U5c3I
 7kO4KtdyKs+RBRtJS7mXdzEOW2bm6JJ7HDhvrI7RK8euWz6heAC2fPCuFogI=
X-Received: by 2002:a05:6102:a50:b0:738:d6c:7104 with SMTP id
 ada2fe7eead31-7549c7802dbmr1285354137.0.1785249252259; 
 Tue, 28 Jul 2026 07:34:12 -0700 (PDT)
X-Received: by 2002:a05:6102:a50:b0:738:d6c:7104 with SMTP id
 ada2fe7eead31-7549c7802dbmr1285326137.0.1785249251641; 
 Tue, 28 Jul 2026 07:34:11 -0700 (PDT)
Received: from x1.local
 (bras-vprn-aurron9134w-lp130-03-174-91-117-74.dsl.bell.ca. [174.91.117.74])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-97774c8f725sm7526928241.5.2026.07.28.07.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 07:34:10 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:34:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 richard.henderson@linaro.org, alex@shazbot.org, berrange@redhat.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v4 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
Message-ID: <ami94CmeBNRKy_es@x1.local>
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-3-gshan@redhat.com>
 <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
 <0a384d67-fc56-4a21-9d0e-25f218a45228@redhat.com>
 <CAFEAcA9HbTSj9cJfv8o=jYSuPhScr-RVKWCos4kpUJ+T1S6g5Q@mail.gmail.com>
 <13333e56-3725-4550-849c-9035f6925213@oss.qualcomm.com>
 <CAFEAcA9X7SNUvQpwXA2_xReUERB-eBETty3g32-PD=MVk536sg@mail.gmail.com>
 <2322668a-20a3-4a6b-8d7f-c04ddfef84f1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2322668a-20a3-4a6b-8d7f-c04ddfef84f1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 47TBbE8JNvWRLj1eIhFNPYbtOqKb5t7ut0Q14M1gCFc_1785249252
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jul 28, 2026 at 08:23:48PM +1000, Gavin Shan wrote:
> On 7/28/26 7:35 PM, Peter Maydell wrote:
> > On Tue, 28 Jul 2026 at 10:22, Philippe Mathieu-Daudé
> > <philmd@oss.qualcomm.com> wrote:
> > > 
> > > On 28/7/26 11:01, Peter Maydell wrote:
> > > > On Tue, 28 Jul 2026 at 04:01, Gavin Shan <gshan@redhat.com> wrote:
> > > > > 
> > > > > On 7/27/26 10:51 PM, Peter Maydell wrote:
> > 
> > 
> > > > > > > +    test = (uintptr_t)src | (uintptr_t)dst | n;
> > > > > > > +    len = test & -test;
> > > > > > 
> > > > > > What is this doing? I am not a fan of clever bit twiddling
> > > > > > that isn't commented to explain itself. Readers of the code
> > > > > > shouldn't have to go off and search for an explanation of what
> > > > > > is going on.
> > > > > > 
> > > > > 
> > > > > The following comments will be added for (v5).
> > > > > 
> > > > >        /*
> > > > >         * Maximal length of aligned access that are determined by @src,
> > > > >         * @dst and @n
> > > > >         */
> > > > 
> > > > What I mean is more that it ought to say why "x & -x"
> > > > achieves that goal.
> > > 
> > > Hmm isn't "x & -x" restricted to power of 2? Here we have no garanty
> > > @test is, because we have no garanty @n is. Ah, this is catched by
> > > the 'len != n' check and returns after calling memmove(). Indeed not
> > > very clear notation. Again:
> > > 
> > >     ...
> > > 
> > >     /* Overlapping buffers, unaligned or oversized access */
> > >     if (!QEMU_IS_ALIGNED((uintptr_t)src | (uintptr_t)dst, n)) {
> > >         memmove(dst, src, n);
> > >         return;
> > >     }
> > > 
> > >     switch (n) {
> > >     ...
> > 
> > I'm not inherently against the bit twiddling (QEMU_IS_ALIGNED
> > on a variable length will do a division, maybe we care?);
> > I just want that if we do use a bit-twiddling trick that we
> > explain why it does the thing we want it to do.

I think the bit ops should be more efficient. I plan to queue v5 with a
fixup, v5 here:

https://lore.kernel.org/qemu-devel/20260728031731.286666-1-gshan@redhat.com/

Fixup:

diff --git a/system/physmem.c b/system/physmem.c
index fbe7df2391..2f37cbeb07 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3162,13 +3162,18 @@ void qemu_ram_move(void *dst, const void *src, size_t n)
 {
     uintptr_t test, len;

-    if (src == dst || n == 0) {
+    if (n == 0) {
         return;
     }

     /*
-     * Maximal length of aligned access that are determined by @src,
-     * @dst and @n
+     * Calculate "the lowest set bit" over @src, @dst and @n, result put
+     * into @len (which guarantees a power-of-two).  With that and the
+     * later check (len!=n), it makes sure that we will only do the atomic
+     * ops when:
+     *
+     * (1) @n is a power-of-two
+     * (2) @src and @dst addresses are both aligned to @n
      */
     test = (uintptr_t)src | (uintptr_t)dst | n;
     len = test & -test;

Does it look ok to all of you?

Thanks,

-- 
Peter Xu


