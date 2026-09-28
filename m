Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786F8C9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 12:50:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBAoG-0002ds-6K; Mon, 28 Sep 2026 08:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAoD-0002d9-9z
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:50:17 -0400
Received: from mail-yx2-x18.google.com ([2607:f8b0:4864:41::18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAoB-0002rJ-KB
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:50:17 -0400
Received: by mail-yx2-x18.google.com with SMTP id
 956f58d0204a3-672c2880f58so2697001d50.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 05:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790599814; cv=none;
 d=google.com; s=arc-20260327;
 b=jztpGgUCMBBuzeXavajkIKqN18Vr2U+Q5CcUgEyzAIncZwQCANYmKfoSPN+G8cUwZA
 locPBXFtZIZ1hcgMgvGfdrpYeAs23vCw9TSb52Wb9bLyt4fuTCiI5x0OXKqZtBh1pMuB
 x90fS0ckNO8fLEkh1QAxRJNOLAlenbdtLKsMSV0TiZT4H3IdaVj10cqg2KHava/Pua9f
 JvDdLqtoigu7bcx/rp9AZA5O0HXDw/XJllBOXbsxMEzzocPiKYqSyjU/P/9keOAAU5Lx
 I3s/PRiXJpdMALc0tFvcItGVlHEPq1nQ6l6NZ/P9GPpaHYTjQfRJTDOMWpoPLKww+nsp
 d1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UkSTtv1Xd+Sp+B8p7qJWcGVsmA2u6wCcg0cN2mnhEf4=;
 fh=kFRYVufcfaAbAPpz2k883t9ke67eADkeaQR7FwqHSs4=;
 b=DdSOedDCqD3djEwDEHw+JWZ4DQjz/3ilJ2H9zUSlq9lP14ytzFkjHazkWqEWnUi3YN
 Vf8Ln2b/KqudufQHzWvOUWVY9BfLaRtse8h0Ztt2rrBFMCihXbyvhXtx2F0RjywWsLps
 Rt0n0G6bqxXcVUuDCebbUDylQbPnpu0oNtv6+4y5a5pYvHGBJ4k0gIINZMJl7lxQ0QDb
 0u3O7Ugqa/9+Hwilou7J8p6AbEZr9O7FQeTpxM4tMYjQEwFIOrHb8dQGqFdzHdZTcZmA
 aMZH+64Hgv1sMY9xGf0NDCMOYGXdq04Ox1FESoUtpydF0BOvEgSBtfY9gpmQfnSaJ2KC
 yKbw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790599814; x=1791204614; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UkSTtv1Xd+Sp+B8p7qJWcGVsmA2u6wCcg0cN2mnhEf4=;
 b=tuUYhiPm1G3F5bo3SM/pm7EC3vXFctsffV5IFfzaE/aRaRjN+vsPyPO0dH2RJAO5s8
 1u2sHa97uydRwIaClN49rb0knqsCteLKhuOXxHi6sXPoNZN/2hnOavs3NLXkKAF2xnGt
 Tx7otxIykadSAHFywzHJ/6r3hgdnDAMxYKAjweuzrBx1F+4eTUpw33z3jmXzUvCdvblu
 m6ZzyABEjLjbcEXJx2wikw3jG/Pnksf7WZjg5ZnqTourKDVCYOmycynbml5CvFPO/AtU
 r5Mx0Hlpvphk5XXUNA4GwH5NWrBpD7iA1aFTO3Jzxi56G2sv9pomKU1wREBX/6sTS43a
 OsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790599814; x=1791204614;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UkSTtv1Xd+Sp+B8p7qJWcGVsmA2u6wCcg0cN2mnhEf4=;
 b=CUaJfiRTHlAANvlrQ8lBEyp4wDv/KS2nWy/YBTU/G8gCH0QfzGbCBgOzBWkApxLFFF
 LHwuXZ53xEvXjIEWFxFLyjDgi93qchoWrapqiPZKqFh3c8lSIYSYiiJB4kmsWp0s8UZb
 gQStBdx89EiZtDQ9jbnlv7Fe+vpTEKkOfxhM9dVi2NXzamCK2wZFjuUSzXvgRY801S7a
 +Z1ej//IgTrQonYtGEhdfyju5rXUtW1LvOTL7DrgY2H+z2LogpUkVqXI6NXu+mb6PSLx
 MmoE83Dx/VTn//4ym+97lllQkJa14/MVVKvuOe3m4GuxXiQnIbIN0JR8OVeZRKvx16WW
 F7lw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz4wsHERE+sWmnqYpzmjuiWglce+E+/aHEVeL+n0dRP/ezfn9Iea34P4CLV8bmP/rwKg0KTrId1gA==@nongnu.org
X-Gm-Message-State: AFuF++kIOiqHXfK+1XwYpxpEsU7V2VLk8tWb4zuKuUJViSkJF5PXkPO3
 4bWAlsOJg7/BHjQ8N9UwdtwPJzQBYIwyYWD/B68BDxDYJkO4nYr6Ffy+2toDViFGGPzsfO9Xq3z
 zD9ti59IL3vpR5McgFv93qZ29TN0431WZeCvs/eVAcw==
X-Gm-Gg: AYBFou0dX4PcF3iHubk+VwUqNhXNvfPZ9TPkaLz4npIDOvhtWfCv0r0UuBq+Bgw0gkb
 oE8IAuN2tnDWn1yKfUCOPWEc1kWu/xAxyJ7Xaom5O+0m/AvfLq4giq7kaRgeHjlZz4FuJ7ss0JF
 Y4trn8p5NiUCrDa7TOiuI4zlrBfwSFT6Hw7tNMK20UmrF6qXYzFoh3BdG/qHFeKOCrAR+MRPYzv
 FoyPRsOHfgpF5NBCSAwxzEWBdJAqfZRAcUQcGaueXbWCOoVBB48n89j9pUqFTwEkXqwRYmWazvq
 CiGzvA9oY3McLrthnD3yluS0AjE/mZf5VMFPmR3Y2IT+oPR/aS7PFKwMxXPXFpODN1M15GvivrX
 HInMSktzndFvlX0pPrzzVRa3xjHq8e6COjd0p93UFo86kmBwG22SOAZrqe98y
X-Received: by 2002:a53:4910:0:b0:671:1a43:7cbc with SMTP id
 956f58d0204a3-672ed2a29f7mr4266086d50.27.1790599814095; Mon, 28 Sep 2026
 05:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260914222554.708582-1-mochs@nvidia.com>
In-Reply-To: <20260914222554.708582-1-mochs@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 13:50:02 +0100
X-Gm-Features: AclHuK-ofzuPc0BVsA6kbRFuUKCb7XW7u-SjRbkD9wpQ9GH4DLbsclbX9-rBqkE
Message-ID: <CAFEAcA_yBV-F5fMhgxTcS5iwLzq+6qFR0fUmXibBUH6D5woGeQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/tegra241-cmdqv: Keep VINTF page0 region alive
To: "Matthew R. Ochs" <mochs@nvidia.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>, Nicolin Chen <nicolinc@nvidia.com>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::18;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x18.google.com
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

On Mon, 14 Sept 2026 at 23:26, Matthew R. Ochs <mochs@nvidia.com> wrote:
>
> With CMDQV enabled, resetting a guest after it enables VINTF invokes
> the VINTF page0 unmap path. The resulting crash is intermittent and
> has been observed on the RCU reclaim thread as:
>
>   reboot: Restarting system
>   double free or corruption (!prev)
>   ...
>   #5 address_space_dispatch_free
>   #6 flatview_destroy
>   #7 call_rcu_thread
>
> FlatViews retain raw MemoryRegion pointers and release their references
> asynchronously through RCU. The VINTF page0 unmap path removes the
> subregion and immediately unparents and frees it. An old FlatView can
> then access the freed region during teardown, resulting in a
> use-after-free and heap corruption.
>
> Embed the VINTF page0 MemoryRegion in Tegra241CMDQV and tie its lifetime
> to the VINTF page0 mmap. Initialize and add the region disabled after
> successful vIOMMU allocation, and remove and unparent it before releasing
> the mmap during allocation unwind. Guest VINTF enable and disable then
> only toggle the region with memory_region_set_enabled(). New FlatViews
> omit the disabled region, while old views continue to reference valid
> storage.
>
> Keeping the region initialized across VINTF disable and reset is safe
> because the vIOMMU association and its VINTF page0 mmap remain stable
> once the guest CMDQ has been initialized. QEMU blocks hot-unplug of the
> device that established the association, so later hot-adds reuse it
> instead of associating the initialized guest CMDQ with a different host
> SMMUv3. The CMDQV free_viommu path is therefore only invoked while
> unwinding initial allocation, when the region is still disabled and has
> never entered a FlatView.
>
> Fixes: 5965b81ce283 ("hw/arm/tegra241-cmdqv: Use mmap'd host VINTF page0 for virtual VINTF page0")
> Suggested-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Matthew R. Ochs <mochs@nvidia.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

