Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D088C1075298
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 10:12:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3AM0-0001aA-Vv; Thu, 19 Mar 2026 06:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3ALx-0001ZL-O8
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 06:11:45 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3ALv-0007aL-Mt
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 06:11:45 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ad79dfb6eso1182233d50.0
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 03:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773915102; cv=none;
 d=google.com; s=arc-20240605;
 b=RYhBdvLc/QkskLPdCXwpqciQ3f3MGOo69wcVLYoGYYfCuX3epLsipqSUsi9T7pGnvb
 V1Nro5QWmlhVkiWsOI1ZSsIv5q5pL6GMV8kiKHy3PI82d7MOmTFX36C98Lmor1h4wwLV
 M3ZdIEYjOoQcVKonw6wzCIyqWM+vIOZrfL5iWemkhFC/sbn2HTQWIU0d8Uv+RBDUhx7s
 pSTCoZMdPr6biSdWNsiDzz+Tf9hUUtcX0h6GZdOtSfUeXFwwl2Y/3dHV1xYKvXccLrv4
 poHBpL4JkXECNjLJRzGxFfVeYbNFKhoM1iRV1+qmHtEy9njyhShfBx/F4RiW4llgdXGK
 eKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5lb4pBsSvciDuj1e8aFT7FBogLFyiMAr6c+7FqjVJXQ=;
 fh=tLP/gRpi7Iczn5ziGL7f2zBG1RdOSHMz6mExSpHcScY=;
 b=kcCbmzcIbsBFDrKeR1rhQhnSSCrxcxVMXJCpHr7ePnsrAoPgLMTenfZz8KRxKley33
 shzM4SNsPAhh/7R+VZmz4PEOrFKf8Ii8FNd0rVtqQdZqmpVa0c12MCsC4ftoc7PztSYf
 15Cn8mHkFm3mcTHdmMXDSAa2uvFtpSnjnWKGiqFeAC1xNa6llizURt2bKeuQcs0Y9aNd
 j2vrf2su17aBP3mXub87o5kKcvI7gvsR7tnPF2XV7M0iQTwjiPy+6YMPi42hCuB9RyXD
 O1pT15CTFdTsYuHIVMa+87NRATd7DYFTAqJb/tcJ+1sQrSSt9lVJ8aoeZUkXSxkIw5QL
 LJlA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773915102; x=1774519902; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5lb4pBsSvciDuj1e8aFT7FBogLFyiMAr6c+7FqjVJXQ=;
 b=Mg7hsjZ/Fs+DLeSteedngyTjJmTlCUXgJt0bML4y+vstixXfm/0eR7gIbyK/LN7CTr
 doO2CZxu44CYWXNieYTqJ8ungX5al7idQ+QZmYMvA3mBmB1wPtDYVSIJTdi//6e0nFsF
 Dt0WE66zuYxYoZoyOVzFSSahaPYHW1yZKFLvULI++BQe3bthedwTlnheH+51cwZg7uRQ
 MP53lDcSYwacDNFKO0G69llHiwIcGMmBOfaL0t86+OVSG9DKl+ezdbRkCOmsQtd09gEh
 V0a6NG4F08KR74GEwmjhdPYfHH5iVamVVs3gvcUTSE2Npr6rQ8kZ2e4zONx/sSAQ34Xg
 uDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773915102; x=1774519902;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5lb4pBsSvciDuj1e8aFT7FBogLFyiMAr6c+7FqjVJXQ=;
 b=MB76/JS9JZedPKUMfyuv14/xyJRM0s5IjxeAo4esN04ht2324Q6JbVohHrX8mF0tGP
 kjX8F0RSPVqCDeppUQCXRqRDMfRLkzdsw8ZzoNzlG3qcNh7lTZF2GLDB8lztJfWCwfw3
 xzKJQWO4KsiFTym/iK8wLeNf59bvxlq15Jb00rOUtWHaWL1SrdgsIIOHdxYk5ZspydEp
 m7CPtM/WfCW5Ck1yt1eL/WLGrD4Fffg+zwOthQMFlkpLtFkxeL1tvJ+GQNxq8Jw6kn30
 ti+24PfYxS+vjYEpLUuPCPLyNEGN5h6BNJao02oqaPVvlnEeewCWZrKBxP1qvBpWZ6lv
 ToVQ==
X-Gm-Message-State: AOJu0YzQ0GQoW07ik4zn7pyJ3OlsRmVTaSy1fzcDwJqp00GEdJ/zMI+p
 y88yFqJDSeHn4MjnYw5wtyiPBAHhig5ITmDJJW/h29wO/hCTMiCzMUAMWMY0aTno8umvKds5Efo
 GJiXO6FdtNndmIVsji5Ty+rVzTdOgrFD2VI80QRaV0A==
X-Gm-Gg: ATEYQzxK6Vqi3dUo/z/JwTP/774DKJYNq9UW8cSO/2L1dGCjSkpJ+/sdLmbaW7Yyz5M
 4gpfj2oQ3/QWawEe96rydKIcaH0E6Gi+uObVhc1qhB/LIw9EvkA/3biB/uNfXzrxlISn/15UMQu
 wXCXm+NiSNNbmrIB5LsmU7jfAWFeI/XvFGk1vXDGzgfd2udK4p2PL4nKLfUHUQsGzbb10IF/W9p
 3nzrUsoY1wFFwVVjRgbBiTAb2eiJOovCzYmKW0EENt6OtFR8FaFKoQ6qC82k4n0p9fo0CivRog/
 Wt6j+TYZY03DUKT/l9B+hhZ4bCrugXNKsQ2SPRaGM3INr6weERbyKLjMa3v793ZuY1k=
X-Received: by 2002:a53:ccc9:0:b0:64c:c616:c356 with SMTP id
 956f58d0204a3-64e91354a60mr4695776d50.35.1773915102057; Thu, 19 Mar 2026
 03:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-33-peter.maydell@linaro.org>
 <20260311154622.00007541@huawei.com>
In-Reply-To: <20260311154622.00007541@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Mar 2026 10:11:30 +0000
X-Gm-Features: AaiRm50AJqHAtOb_fh3xIWO0_UEQVIFQNg2TFls-d30zpyN8FqnUloI10YKxBRE
Message-ID: <CAFEAcA_1SZNq0q1AFXCF=bBZ4gof=sbP4atyTGnUYgK5M6q0Nw@mail.gmail.com>
Subject: Re: [PATCH 32/65] hw/intc/arm_gicv5: Cache pending LPIs in a hash
 table
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 11 Mar 2026 at 15:46, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Feb 2026 17:01:39 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > The GICv5 stores information about LPIs in a guest-memory data
> > structure.  Iterating through this to identify the highest priority
> > pending interrupt would be expensive; to avoid this we will use a
> > hash table which contains an entry for each pending LPI and which
> > caches the L2 ISTE.  Typically only a few LPIs will be pending at any
> > one time, so iterating through the hash table should be fast.
> >
> > We can access an L2 ISTE whenever it is valid, and can freely cache
> > the data for as long as the IST is valid.  We only need to ensure
> > that we have written back the data at the point where
> > IRS_IST_BASER.VALID is written to 0.
> >
> > We add an LPI to the cache when the pending bit is written to 1, and
> > remove it when it is written to 0.  Handling of checking the cache,
> > and of adding and removing entries, is handled within get_l2_iste()
> > and put_l2_iste(), which all the operations that read and write ISTE
> > words use.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> LGTM
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> > ---
> >  hw/intc/arm_gicv5.c         | 110 +++++++++++++++++++++++++++++++++++-
> >  include/hw/intc/arm_gicv5.h |   2 +
> >  2 files changed, 111 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
> > index fa7692ca0e..30368998d3 100644
> > --- a/hw/intc/arm_gicv5.c
> > +++ b/hw/intc/arm_gicv5.c
> > @@ -474,10 +474,21 @@ static bool write_l2_iste_mem(GICv5Common *cs, const GICv5ISTConfig *cfg,
> >   * reads and writes to update the L2 ISTE. In a future commit we
> >   * will add support for a cache of some of the ISTE data in a
> >   * local hashtable; the APIs are designed with that in mind.
> > + * Not all these fields are always valid; they are private to
> > + * the implementation of get_l2_iste() and put_l2_iste().
>
> Completely trivial but wrap seems to be getting shorter as this comment gains
> lines!

I also forgot to remove "In a future commit ..." part now we have
got to this future commit and added the hashtable :-) Fixed to:

 /*
  * This is returned by get_l2_iste() and has everything we
  * need to do the writeback of the L2 ISTE word in put_l2_iste().
- * Currently the get/put functions always directly do guest memory
- * reads and writes to update the L2 ISTE. In a future commit we
- * will add support for a cache of some of the ISTE data in a
- * local hashtable; the APIs are designed with that in mind.
+ * Not all these fields are always valid; they are private to the
+ * implementation of get_l2_iste() and put_l2_iste().
  */


thanks
-- PMM

