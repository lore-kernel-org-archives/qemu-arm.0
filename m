Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970E606A33B
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Nov 2026 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R+pF4Y3j
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOIe2-000610-4X; Tue, 03 Nov 2026 12:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIdz-000605-GN
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:49:59 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIdx-0008KK-T8
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:49:59 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8aea7b7ca0cso39526637b3.2
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 09:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728196; cv=none;
 d=google.com; s=arc-20260327;
 b=UAMqp2RnvNuQunZMtsBz5r9hyy9r65aFcVYw5npeS5xRRSp8P5tKhRCbc4U1LjI/Ld
 e21kaYvdnzoIlIpS2xltRYgCVs83A6DG7zg4ytMZ8G93SIVz+J2lFdSqrAScqQrwoJjt
 lgHcNHaHvkKoXsglHzR7MaApegBSyRMkfFAd30sgAhSCfjjOmGX0WNu+V/qRQtFd7mSg
 D3WbW1VessRaCIuy/i2gVjO4Ka2iGF1bVP8KhOln+UKwAjk/SKtJISR8/v1rOcXnklTQ
 eevog9N/xFJDAeHzDz49AtfNIG5QUUrT37DQZDAcb6YmdModfKPBOHcPQV7TCMTMyQ6L
 S3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=KHD63WxroFQlHpiGxelkPA8Wve5eDaujYnpu/A8vIO0=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=m3S9YHTg/BSHJ10Ck/RWiTFeQwWviKhsHSJpwALM7+gGF2SZFlSbHAT5IF0qL0Fcf2
 Pp+olWaOfqzmjLU/w9+JzGTLjfHl2zjFxPwaVMImBaZj1td1vXfomn1uUJCGmV2L0Yy5
 vm2Y4YHOz7fY8HYDybP4nnX4m/zlWRBe2Y2OnWI0tFo97lcTsSftX/QH5v5nQVpA2Ecu
 lSzBY2voh4Hq1gyX5Bk/WY9UOWJsCiU7w/48lqcnOaE3FggNdOG/QR8ySnZic280cS4C
 h5BF12l5LtwwaSTCWs0QP1jpYshJ6Qa07wEgDkiEnLWJMAPw2SAgoJQTZ5pG50IT49L8
 NwYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793728196; x=1794332996; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KHD63WxroFQlHpiGxelkPA8Wve5eDaujYnpu/A8vIO0=;
 b=R+pF4Y3jIAhiRBvXK3gKbb4f/6eXko7Y4NlMSfj1bHqo5p7H6M6EvyPDismjC95X89
 c198cI3zZl2eTylLA+4KA1XfZKs1nXSUA8E84nbDm9Wot5P3HmD8sbUorv+mCKiJKuxA
 BJ1OIqjAM6P34wkeR8P4sMvO2xjTYAzU+eg/Qkv2DII/5jgXO8RgPVvQjRgwCL9ipzGc
 N5enBYXofp1C3WdU44DmjHZvW3wZEw2riagZtcdGGRhvlcOeABGSnEmClkNaLTyTbrfc
 2C0CIui49sNQsDjd1XHusGbO5gy1+BcTRaa+WrVmFGNhcJUVwGGjbIVesbyrUs64o3Ta
 kqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793728196; x=1794332996;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KHD63WxroFQlHpiGxelkPA8Wve5eDaujYnpu/A8vIO0=;
 b=VOVrfTkkEa9zNrhP3K+80y0vkrbAjsvUBnuWuZ4LV2fMCq2ooVyUI/Tmk6QVFKmhLk
 6J913VlQYlnuKFwzuWQVZjF0JomEYpZwy3b4Np/NRvu7eKZBnSQtZLEwVPyjix6LXiwd
 KgOIki83Lf6Z4dclbMiSp/3K2Bmn82YQ+AvhnFCOROAduL9h6lSUJyqlDWdOIZj/vkrl
 Pqn6SPCfI8aJ0O7/We5dsGf0WGiey7wQOJtzYgNoA3FfrdoNISSYZ0MkcDw/Pvt0V/AZ
 Pb075u9lcE2QSvDtWy3MB341Je5kqMDzgLhFXRlvH40z8qLK+qfTd6EzjPHGlFmVppSQ
 rcoA==
X-Gm-Message-State: APuU4Z8vQh2bsSAKF0pMviCxkmp18LqNaMj878cRL1F47xWYl6KCAt3z
 J5pskoa++WwrsDCwLUejPKB/Z8odhrf07h/5bdo5x4DQbqrFybQzOSSe23Y07GrMlFdz3phOIYh
 TjCXVa193MnydP+ncJDP9lIzc5ZNEBdYJP1OH2NmYgrsvpsEsHeKbI5U=
X-Gm-Gg: AYBFou1qQ49LpguUpcIblhYk+La4p9lHQSkDwamNruC886nkMuNzfX7/tzWVpfF6TPR
 rATEK6gDS11RhoXTX/k+DqUswZQFa6B11VbFgz4KGA3bJVIFLo3V2chtpzDZS0umcjfMa5Fuee2
 xU+40YmyCbT6fWgWQC8akD61LYEsaYB7rxbmmgO3yT1pjtMzUuFq9Wyad4oTvSCyvg0YAL8umON
 e5sKl85G8++mbrksYyIOwDfAfaG3ZdHQ4ZIoaVf8gO2MSpZlGwM/cRlR6YGYlmKlTTqrZb7x7Oh
 k/eNz0/f11bRM+mgsK+4skV9bcGdeacZMvUSz09a9J7ZUK3z5MePxa1nNdL29I1OTV9hviUTbkE
 jttIN48m4+Bf1kbANXxAL8fJAaWaiC8zNlZ0K4TGVhxMyaoMIyKlq4fY8zz9pXq3nygWW/7Dot1
 SbpBDOcTp3jOWwD8K9/TKu
X-Received: by 2002:a05:690c:9510:b0:8ae:9448:14e6 with SMTP id
 00721157ae682-8b2b67738eemr72264867b3.54.1793728196272; Tue, 03 Nov 2026
 09:49:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
 <20261103172616.2400758-5-peter.maydell@linaro.org>
In-Reply-To: <20261103172616.2400758-5-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2026 17:49:44 +0000
X-Gm-Features: AclHuK9r9ZwgyO4vbg3YGCrPW4tA0H-36SOAC0OnSf9gUzh8V9hvKFyjwfOtaSU
Message-ID: <CAFEAcA8X1ARhpncsz=kE2JxFjALGej4ycw3hus=m5kfcVSJXYw@mail.gmail.com>
Subject: Re: [PATCH for-11.2 4/4] hw/intc/arm_gicv5: Use correct type for
 value in lpi_cache_get_hppi()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 at 17:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> lpi_cache_get_hppi() is a function we pass to g_hash_table_foreach()
> to iterate over the LPI cache hashtable.  This hash table has keys
> which are GINT_TO_POINTER(intid) and values which hold the L2 ISTE
> value, allocated as "hashvalue = g_new(uint32_t, 1)".
>
> The function is passed the key and value as type 'gpointer' and has
> to cast them to the real types itself, but it incorrectly casts the
> value pointer to a uint64_t*.  This works on little-endian hosts
> (since we only read specific fields of the L2 ISTE using bitmasking),
> but won't work on big-endian, and trips the clang sanitizer.
>
> Fix the pointer type.
>
> Cc: qemu-stable@nongnu.org
> Fixes: a0562ada75e ("hw/intc/arm_gicv5: Calculate HPPI in the IRS")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
> index fd6456cd8aa..a362349e5ed 100644
> --- a/hw/intc/arm_gicv5.c
> +++ b/hw/intc/arm_gicv5.c
> @@ -390,7 +390,7 @@ typedef struct GetHPPIUserData {
>  static void lpi_cache_get_hppi(gpointer key, gpointer value, gpointer user_data)
>  {
>      uint64_t id = GPOINTER_TO_INT(key);
> -    uint64_t l2_iste = *(uint64_t *)value;
> +    uint64_t l2_iste = *(uint32_t *)value;
>      uint32_t prio, iaffid;
>      GetHPPIUserData *ud = user_data;

Looking at this again we could also make the local variable
be uint32_t; but getting the type wrong on that doesn't matter.

-- PMM

