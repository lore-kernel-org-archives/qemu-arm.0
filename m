Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C47C88E70
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 12:10:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x65Vt-0008T5-Qv; Mon, 14 Sep 2026 08:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x65Vn-0008SA-Ue
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 08:10:17 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x65Vh-0000MX-Dk
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 08:10:13 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66de7e0bc85so2478793d50.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789387808; cv=none;
 d=google.com; s=arc-20260327;
 b=IvUJIbByuX9qdU2z27Fc1bZtcDCEeWOsIzEjYV+tQTraPVmXF5ihDPoAGMSS5P2VWM
 e6+HyLiJK9LAn1TCZjCJEnYZQerRiJ6rPpYTaZpBlbYW81z9pMrQ0N8pFNF3pEPI6vYH
 aSM0VQTyFHRCBcVXK1mNgp8A+GKzpC95OmyoG4BrEg9OJ+5ujgkg3TfQoghBAdvslBTE
 hkTteiErrIQhMCFERSgzf0yrB2pwuHNVmSK30fvhPLnq2h+Zxbdd3I/CvaG+3yBJpWW7
 WKCM9i6Lfi9XV1V2x89pXbm9h2Nw+qKzG+gqRz5UYMmhwHqBSHxWRRYJUGWoI1eQBge3
 3BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xqTkDfmaB7hre0Cg3OHV6CiwKrtiYY1ZRxnL5ridHyE=;
 fh=hnOPFxdgkF1Y+Q4C9eRxMdI5b6GspRUyB10KLtbrNUw=;
 b=cjM8dBy8+ol1zbrQZnlXT65XJhaL6J69U+ZbQMVgXuNilpEfIFmJ5Tep6PCJsEn/wc
 Nk+p2nvL5zcCtCCJlHEUOquOxBy7AVLxyFnkE0LA7R6mj9xWKNicTCZzB7bbriExqBDi
 spEjL/vvk9BsRGMoL+8UQjRDX7rEmrdHqOmaKTsO5xd1MwuYM1kwsRJLisKYbgVCOIPp
 nalrZDApd8ntTy0mlXXJNkWunNYQurBadAL8AHydXPBhufckWeDqWv9crm9y1g78Ltiy
 7WClZFcque3DiAI4zBpqlwkYFXiF9HTaU2RKa7Ziru0iH4hqmSRuo7Ztln+RwMH7nWJQ
 I8ng==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789387808; x=1789992608; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xqTkDfmaB7hre0Cg3OHV6CiwKrtiYY1ZRxnL5ridHyE=;
 b=mllRJN43Szkfg+HojFhPsaU5n3UeK4EGsVkyqrR/283lkuJ+VlkGHafdoy9o49UiS7
 Tn3LgfevQ+Wpn7WPfgB8k2PgY8e0afBDGYX32MCW1IR3EckBRR/wDkAMPxKaxx13F9ui
 1Dh6Urs5odRhDhNBFaMqmoX/AJeu7AHk6+dr93ZQsqb5aXypuZ2z6n0PtSW2CVv7vQQn
 aqLwu5V0uXSF/3Z1TmcvoJFTbebF913FzonN3WurQHlTUwKhao512z5+AXKz8aLrOU7l
 7UW+s/FLFu6ueekHCwcfY79XBqXo3holmNx4hSpWHSuF7O6ggg7MAPeisUsNj9sPy1sR
 R3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789387808; x=1789992608;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xqTkDfmaB7hre0Cg3OHV6CiwKrtiYY1ZRxnL5ridHyE=;
 b=FdhEknlzsLo9o89NohlLk74vtrjmHBbBGpxreOkSFS8mHrxvNX9qxbomgGUJiB1SNo
 f9bGppWjlawGt+CL1QLWL4wboO+oWhIxpNtoVt4y5T0UcExapVu96krqmVYDfn8J3w69
 4lJrxytl/umEPtZ/GoEIaYVFg5/ylU0sxeCa+ayclhbKwVuPfNqWhkr8ZaaomwY+xZAL
 rZV6X3CEM3/sWauG3wPssHKVhr4+QU/9sxmwcIk0IbLnJ2ZJTobaBJYUcfhOuXmZcYBB
 lQg3FO0XHI5pzpo8/z3x+39sYxMl470bRYtnsGFNJp9/l0N22hHcEErsCrcFeVZD3JHP
 IKzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzTALmuilLYbMz7UlQmSKEPrmkx9T2jjh0BID4OrioL4ppB/k93y8rRLZV2HqRtMVDuZ7WiFuAUAQ==@nongnu.org
X-Gm-Message-State: AFuF++kYPPyiywUTdv9fPv4BsFZYSb67hp4r2oMbEPBAGAUj9P8lq6ko
 EHDRzDsIsVaDqAInTcRH3uXvW/8t6E4BkHgQmvWhBnwgDMWsCPe+9erlwZLpSFBN3uOFBQEWxT5
 JH29QtS3fTKD40KY5Ip2xyaAtt8OmDD5FCS1pnUCQHw==
X-Gm-Gg: AYBFou13PIu+V8AbNcu0RO6duUByceZ80oF+3Upnpxc87Tp7EFG6oi7zfZhvj4n9zRI
 pP3TmtaZ54sHFaVHtm6z3gYwKIGbTufsZzr0PqEK/fy/Y98YjPQxnVZgPnvyUYb59QubO45+bqh
 bBuZEfN8qwzh1rCKc8pZcXTTNFW5HXaYS/eIaZrS33IUapXNLbe0WAAz8Uc+HSaHQLjjgErqjvs
 B97wOGQVEKMGKtjci2NVlrDIymBXc3BSiBytNhhUCTgKznMpVQEJ8deWMe1QeUEDwUisUUPy/Rk
 5Q+NWz3xffbeCZ6eYVj4G25sw2tsCzmkqDK6+P01ERQaYqPz1zj9Sxx+N98MfL27tKqtDf1PtRP
 xJyA9X2M7BVmQK9IzyaRMJuM9owpcQwEdy3wrlMbXL0R6FfjQZA==
X-Received: by 2002:a05:690e:1658:b0:671:1d59:2998 with SMTP id
 956f58d0204a3-6714e00d4d5mr318707d50.33.1789387803286; Mon, 14 Sep 2026
 05:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260909144151.26803-1-sebott@redhat.com>
 <20260909144151.26803-3-sebott@redhat.com>
In-Reply-To: <20260909144151.26803-3-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 13:09:50 +0100
X-Gm-Features: AcwNN1WoHt6vQuYGBoZKVhohe2eUesrERibYwrEiE5R47Fa1bXekzUMHLN7KTFg
Message-ID: <CAFEAcA8v70ZPUvC6fbJiA7uxz40gRGzqKGHArDyXGEB11N2=OQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm: handle CCSIDR_EL1 as a demuxed register
To: Sebastian Ott <sebott@redhat.com>
Cc: Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 khushit.shah@nutanix.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Wed, 9 Sept 2026 at 15:42, Sebastian Ott <sebott@redhat.com> wrote:
>
> From: Cornelia Huck <cohuck@redhat.com>
>
> Move handling of CCSIDR_EL1 over to the new *_IDREG_DEMUX
> infrastructure.
>
> Note: the existing size of 16 is kept and might be extended
> at a later time.
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>  target/arm/cpu.h             |  6 ----
>  target/arm/cpu-sysregs.h.inc |  1 +
>  hw/arm/virt.c                | 19 ++++------
>  hw/intc/armv7m_nvic.c        |  2 +-
>  target/arm/cpu-max.c         |  6 ++--
>  target/arm/cpu64.c           |  6 ++--
>  target/arm/helper.c          |  2 +-
>  target/arm/tcg/cpu32.c       | 26 +++++++-------
>  target/arm/tcg/cpu64.c       | 68 ++++++++++++++++++------------------
>  9 files changed, 63 insertions(+), 73 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9652f8b0bf..f832cdd7e1 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1121,10 +1121,6 @@ struct ArchCPU {
>      uint64_t pmceid0;
>      uint64_t pmceid1;
>      uint64_t mp_affinity; /* MP ID without feature bits */
> -    /* The elements of this array are the CCSIDR values for each cache,
> -     * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
> -     */
> -    uint64_t ccsidr[16];

Something somewhere should be providing the equivalent of this
documentation comment. That should also mention that currently
we only support 16 indexes into CCSIDR because we don't implement
separate MTE Allocation Tag caches.

>      uint64_t reset_cbar;
>      uint32_t reset_auxcr;
>      bool reset_hivecs;
> @@ -2138,8 +2134,6 @@ FIELD(MFAR, FPA, 12, 40)
>  FIELD(MFAR, NSE, 62, 1)
>  FIELD(MFAR, NS, 63, 1)
>
> -QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
> -

This change has lost this compile-time assertion that is checking
that when we read from the CCSIDR we aren't using an out-of-bounds
index.

-- PMM

