Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FE1606A329
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 18:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RAXFu5AF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP2bA-00030g-5I; Thu, 05 Nov 2026 13:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xP2av-0002zl-4h
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 13:53:54 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xP2at-0002nN-DO
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 13:53:52 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b0a921ee46so22439527b3.2
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 10:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793904829; cv=none;
 d=google.com; s=arc-20260327;
 b=NFgiZkyM7CJvgZj+WqMp2FI9SfzjK51/vhN9XysWuPcGKXCOdXEsBTLhCLD9p0/VHa
 gVoPnXTgtFYcAypppBnQma5rY1fBj7qx3pXxTMmgK0z9bhvy9HepImWQZPx8ZYY+W01j
 iU6xC/4pOWfr9Vpm7AVHH7lRcIBgZi8VlZltPmT705QG12yVmQDrWXUdosO21J5mHoS2
 xxCZi5xgoXNTaFXDenflxh3LkBUt6rIPx8H8rS7Ce+zzF89JqJg55vWueeIRazqpp1Vh
 IVP05958g58zIYhzrhIAsVuHgyM03sFStL5zhLFoY8CB91VSNNq1p0QBPIf63u9ZC517
 h8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YW6xkjCNkShheMexpg6Mgbg4Mj+93DQrHPO+NjitZoU=;
 fh=kByZkEDlzD48sZoWXvAR5yxCB2nIt4kpr1Kv69TN7CU=;
 b=G9yCHOY73Wvg25G5XjkNxW/rf5DE2CDhCL73wOrwWAHKkmkacflu2EKwDmyg48/5J5
 et0IK5ux61Lnf3raUqlYiZQ2bLO8QDJYWmliFRvFoWScnvIGxrXm7+ANUJpAnpHrMPiP
 nwcbbMrQ1QFXWmLYiVCbzECbDFTAV/nd3m5uf0AUc6atIKfb/sKDU7QNjbi33UsiPNng
 M+AqfSP/ZOcjOeTG8i7V/fpmkSuck59gwThPwiA03jd5S29FdGzx+beLogXTuvcamHTx
 Eq3fTN1XdygclLdI1Nk4jF8bv8AX6U7xMQkEMtLgUPgCAo6VzhQfq32ZyVkVVwQ507AT
 JD6Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793904829; x=1794509629; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YW6xkjCNkShheMexpg6Mgbg4Mj+93DQrHPO+NjitZoU=;
 b=RAXFu5AFjgDQHNHeY+kycT7wSV2dP0Cl1gcwzZKKa0QuvZiARuVsabITVgkVcEG2dY
 C87QgdbrrjI79Pi/8HLWb1yEv4pVt+Gd8r4JNaCa3aqjokwJkR2/S0hMj0FW4HdxcPey
 nZ6obmkZnF/fPY30W43QCHDZfb/CDQUv9fhfkGojd8ayac35st/5lmC9Doc065F8UCmg
 hsljMcGzce74QUV2S3Do6257IlEjlft8FdJdvgvY4d9vRf9FrxbTabXRX+PkJpxGPe0y
 wAiwzFRiia8dAO0NTurPPR9/zDoEYxiFYza/yiytlEEARn5B4mni1Yi7gqmylCzCH44m
 DQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793904829; x=1794509629;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YW6xkjCNkShheMexpg6Mgbg4Mj+93DQrHPO+NjitZoU=;
 b=ij+4fB646IwZ2PaXc7ayWlt5s3ovpR1XhGy1jKlPNajvyoflsoR9q4BfIaWw3O3769
 i7RkWsMzZSWYIZ36OcTbtI+5DfkLKaCFizMfVKPEVcn6tioPsVhIt2IiaGnCJ4mAewUo
 /qnyfx8PQoWsiMK9+o01p/FhimlySb+B0utloc8xy5ewHwWSTVyf4xYqx7jFDJlwQqYk
 wtbjbRL05sovDYUKAMgjW0MTz3P6caSP41VvXrlTJH1XJeLXdIz+LHKSyMqAC1GFwOJ7
 8lcHQZqUoxNzmUkPvgRoRjaWLH4qIC9iv0ABsIBCLsW7KjoN3se9V332WxmHMmb83nZV
 Zq0A==
X-Forwarded-Encrypted: i=1;
 AL+hErF7JQt0IZaN+Z6RdxVdDN2s1inZRig9symtbwxpDmhnV5Y0cAgizVsk9RKDUDHdFUo2hFy9cRXhNg==@nongnu.org
X-Gm-Message-State: APuU4Z+FlXPRirnWCt+TTRey1n0UIJmN0pe7PUiDmN3TOiE3uIVQSdxs
 3g+WMo947EHjz3ieFva8zgfQ9Espw0N5eoXU61VhxLUTk5MvUhP46HoZMSdKW3iHWJy36vofBNp
 Vsp80/qQPVTVWoS2ZdUc9AUROAWooeRalP9u/bSWWAQ==
X-Gm-Gg: AYBFou0FI31tjZb1Izm4nPcm6d3Akb5xeYU13X7pJ5XwXzn91KNwzYvcZ2Ov8u18w4f
 qGNK8XNc5FIGTc8zITyQwyTO18Zy7Nmgh6btCq9HxEFIDF1roitZ6In0GjCEXLmVEOYrFwyx38b
 35pCtysBOUi1lE5P3DXSeV9f77vnU0Eo8d2/sN5iulLkQ/SmGomgBysjh7BQsxsCmPxGgwN4gua
 pXSsNpgt9XU/Z1eIAJTvHYgW5iqHItR48qZdjw190y7YVYqcdgAynmWQY6h5Q2v2RSSnKQAHQTu
 ibe3P7ej5q3/+M3OKsxYdFl6rIKu9sth8v0ui8g4JqDn6lYQzh4T/GiBkYAbKXMHn6e8gIhgxhQ
 5AwMzgY1G+AN640tc2QnajdiuK4v/QEFFD0XvZ0igW6iRhRuj1lKn9B33p9Lk4o0oZNl69pTDOT
 NOjtfiRUs7gbsQd5AXQCGs0Yo1CObkL9e23MWP+9eR6A==
X-Received: by 2002:a05:690c:6d81:b0:8b1:c7fc:2b96 with SMTP id
 00721157ae682-8b2b67c5898mr117617877b3.105.1793904828868; Thu, 05 Nov 2026
 10:53:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-armv6-xn-check-v1-1-fbeff926e692@linaro.org>
In-Reply-To: <20261105-armv6-xn-check-v1-1-fbeff926e692@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2026 18:53:36 +0000
X-Gm-Features: AclHuK_KxyVpqOLh0Yi0USJVhvzRf33-34KWKel0EqdjeRvx112nQRWKikiTpeg
Message-ID: <CAFEAcA_qmyR0E3+n8GByA6=kDwDQomCpk399DEc8pOPr=sqEaQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm/ptw: check XN for ARMv6 in get_S1prot()
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 at 09:44, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> For the ARM_FEATURE_V6 case, it seems like we retrieve AP and XN bits in
> get_phys_addr_v6() but we don't check the XN bit in get_S1prot().
>
> Change the `if (arm_feature(env, ARM_FEATURE_V7))` check in get_S1prot()
> to `if (arm_feature(env, ARM_FEATURE_V6))` since v7 implies v6.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4367
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

I think this is worth backporting, so:

Cc: qemu-stable@nongnu.org
Fixes: d8e052b3876356 ("target-arm: get_phys_addr_lpae: more xn control")

> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 2e67d02493bd463cfd2d31ecf1316272ac3f1d99..b8b22b014e0574340a85abe73f3d9611d2360219 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1595,7 +1595,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
>          if (regime_has_2_ranges(mmu_idx) && !is_user) {
>              xn = pxn || (user_rw & PAGE_WRITE);
>          }
> -    } else if (arm_feature(env, ARM_FEATURE_V7)) {
> +    } else if (arm_feature(env, ARM_FEATURE_V6)) {
>          switch (regime_el(mmu_idx)) {
>          case 1:
>          case 3:

Digging into the various versions of the Arm ARM and looking
at QEMU's code, I think that "allow this for v6" is correct,
but  I think that ARM_FEATURE_V6 will always be true here
so we don't need to explicitly check it. The two callers of
get_S1prot() are get_phys_addr_v6() and get_phys_addr_lpae().
If the CPU isn't v6 then it doesn't get those page table formats.
(get_phys_addr_v5() is simpler and just figures out its prot
bits directly rather than calling this.)

So I think we can make this a plain "else", and delete the
existing "else" clause that sets xn and wxn to 0.

(Strictly speaking it is possible to get here without V6, because
we don't enforce that a guest on a v5 CPU can't write to the
SCTLR.XP bit which should be RAZ there, and we don't ignore it in
get_phys_addr_nogpc(). But if the guest does do that then they're
in UNPREDICTABLE territory and whether we give them v6 VMSA with
XP or v6 VMSA without XP doesn't matter.)

thanks
-- PMM

