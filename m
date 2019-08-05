Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4063580wrv;
        Mon, 5 Aug 2019 07:39:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhpGmuiuDPtKbbgrOntc9ot9tCqQznZjtD5F/5TIrhlaNYLyDdV1205wLeX8K3+SC5RzK/
X-Received: by 2002:ac8:3449:: with SMTP id v9mr108802397qtb.163.1565015959483;
        Mon, 05 Aug 2019 07:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565015959; cv=none;
        d=google.com; s=arc-20160816;
        b=kCj1E9MlwQoKjTpo9cb7qOwO4hR3GhLAqDeoNqO0YBJ0/KknAusXD4IzTRZW3yhXpZ
         HGnnaWr3YqUM50EOXL8F7BcticCx2jBD9OtHUvk+1cf1hfpellgZLtHs/MGjmuuADxk5
         9OllSFqU4zLA3dj7pNhO86aUdBP0BYl+zOuov1V9L521gH/9apDWJHXV3dKZoWO6wP1J
         KqsKYs9zwxQXWl4h6dVkBfSLGoO5apoF0gy92wGBeSNpswT9xdW2/dtARuzFtVItqqUD
         KmL3QHunZ5hFRtO4e0gvNC7LDIBLBgDmklf7uz43jZNIO0Ek315XKxYtliANYjx3W7se
         SXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YzbjEHeA4M4mezodUhb4QRSd2I0FmgU9srKk2gg6Vo0=;
        b=vGopUg97hMNr4DxQ1wsNIYKMPGFakH2UTVL0j6vbUGdWdV1LQ2CXK307G+IfduhFk2
         HQAmBZUjGSOeq1nCyNIbPmAh5mTwo/OHL6lgfOcO7jXgoqufXpIvWQjMtyFKUvVLcNQk
         UBPAnbhsFuChwhiDbL+ME4voZ8h7vW2cmYJTvSO+RW6spAbNTIWbJ0DcXiLg871Vi1RD
         KLufmPFEa0CGNWf1JFwfMpzA8wFSaUKuu+aWl28QxRaDRBGo+i0jQWW8Stkv4HDZkSEz
         C6INRf4MIFDkoZ2fNXPwKzpZtUkB9nODAaNhgFbZMZAR5OxG+ZW5jMc21Qew53o7Xutz
         5Jnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RWMspbzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si34170298qta.147.2019.08.05.07.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 07:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RWMspbzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hue8t-0003tc-30
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 10:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39045)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hue8o-0003tQ-2v
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hue8n-0001Cp-2p
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:39:14 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hue8m-0001CE-Sw
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:39:13 -0400
Received: by mail-oi1-x244.google.com with SMTP id c15so6790800oic.3
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YzbjEHeA4M4mezodUhb4QRSd2I0FmgU9srKk2gg6Vo0=;
 b=RWMspbzTzY8NK68dHzwoXneTOmV0Ug6jOi00qd1xko2NktNyuWsbx6rzMT0DnAcF2i
 Ap7PghLWtW45ASHLvCZq3bAF+NtvFD70R8YPJ4XEGsovmhJ3APZpQvWUjWvBLttL2aov
 VhGTjcPanWUw2vTXXcV6NtHMEogaUjqEGP6q18pt/neFZ6IwkCjrQx1ZJ1+4GlSeLqNq
 tHL3I+6tE/9TgI6XkYpckKeuwNwjaz40to3gWRgcVwB+0anC4EN9av9e2AVtq0aT5h21
 ExOnsFKFbJ9Dvz2491vu8lDDQvpIRRzqQpZJcVQtH4e0fjQ1nGUFRsstc75XER+eWyr3
 Viag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YzbjEHeA4M4mezodUhb4QRSd2I0FmgU9srKk2gg6Vo0=;
 b=bXKOSsiDy6D+dSkzs6VuWFvMJccmmQeaDQ9aTTsYERYvglodTOPqjsq4JWbHSrof/g
 Dnxo1kKhqnPuyKZTX+GZ6kqima2MWgkr/9SOORDErOHc9bhkFdMMVefzofR4tivQAnbi
 bd15VaUjiPKjdtyoSKoPala+GdsMUzUgRA7XAmz6ICPPO0CYUTrWQgHEEDIpgvZMXfLP
 Glpn+Ys8wRPmVanmaLG56PcgjkL6fAms33yt81e1oRBjRLFfls72Ntk11A0B0kFZSixI
 QenTHwbZ51HmjoX92dMcj5b6rK+2Y92WH6y+7TmgtMCGfI34W74kBIq1J8VTbAvdRzx5
 CvfQ==
X-Gm-Message-State: APjAAAUoWSQZOPiP+JMw8h8LZjSxOppJyBDTCludoOLJaoFmQUBim60A
 zMcZf8d3TRpHuDq5sJmtCF2EthrBGUM+TLg9M5SrWA==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr11031304oie.48.1565015951817; 
 Mon, 05 Aug 2019 07:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190711061857.13086-1-eric.auger@redhat.com>
 <20190711061857.13086-6-eric.auger@redhat.com>
In-Reply-To: <20190711061857.13086-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 15:39:01 +0100
Message-ID: <CAFEAcA_N=7w6XHU4H3uJhLFZuiFgpQhN--=ixUV7z6bvzkwqfQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v3 5/5] hw/arm/smmuv3: Remove
 spurious error messages on IOVA invalidations
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Owk3k6YZvjxq

On Thu, 11 Jul 2019 at 07:19, Eric Auger <eric.auger@redhat.com> wrote:
>
> An IOVA/ASID invalidation is notified to all IOMMU Memory Regions
> through smmuv3_inv_notifiers_iova/smmuv3_notify_iova.
>
> When the notification occurs it is possible that some of the
> PCIe devices associated to the notified regions do not have a
> valid stream table entry. In that case we output a LOG_GUEST_ERROR
> message, for example:
>
> invalid sid=<SID> (L1STD span=0)
> "smmuv3_notify_iova error decoding the configuration for iommu mr=<MR>
>
> This is unfortunate as the user gets the impression that there
> are some translation decoding errors whereas there are not.
>
> This patch adds a new field in SMMUEventInfo that tells whether
> the detection of an invalid STE must lead to an error report.
> invalid_ste_allowed is set before doing the invalidations and
> kept unset on actual translation.
>
> The other configuration decoding error messages are kept since if the
> STE is valid then the rest of the config must be correct.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3-internal.h |  1 +
>  hw/arm/smmuv3.c          | 15 ++++++++-------
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index b160289cd1..d190181ef1 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -381,6 +381,7 @@ typedef struct SMMUEventInfo {
>      uint32_t sid;
>      bool recorded;
>      bool record_trans_faults;
> +    bool inval_ste_allowed;
>      union {
>          struct {
>              uint32_t ssid;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2e270a0f07..517755aed5 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -320,7 +320,9 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>      uint32_t config;
>
>      if (!STE_VALID(ste)) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "invalid STE\n");
> +        if (!event->inval_ste_allowed) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "invalid STE\n");
> +        }

Here the new flag check just suppresses the error log...

>          goto bad_ste;
>      }
>
> @@ -405,7 +407,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>
>          span = L1STD_SPAN(&l1std);
>
> -        if (!span) {
> +        if (!span && !event->inval_ste_allowed) {
>              /* l2ptr is not valid */
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "invalid sid=%d (L1STD span=0)\n", sid);

...but here it suppresses both the error logging and also
the setting of event->type and returning -EINVAL. Instead
we'll fall through to the following code. Is that really OK?

thanks
-- PMM
