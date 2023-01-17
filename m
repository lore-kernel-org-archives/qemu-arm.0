Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2511855ejc;
        Tue, 17 Jan 2023 08:17:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTykBWXMjlcpwX3YN/BwMERcaHAv7Z+mCLjrEd6KVQvaKWkmMboDP+qgCw320NOebx48Zy
X-Received: by 2002:a17:903:248f:b0:189:6ab3:9e64 with SMTP id p15-20020a170903248f00b001896ab39e64mr4034684plw.34.1673972233960;
        Tue, 17 Jan 2023 08:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673972233; cv=none;
        d=google.com; s=arc-20160816;
        b=M3AzHE+/7M2x258ti0S83ZOBKHZPmrvZWVpCsclh4sNC7AtXWmTyV2jI7TkBI1G1x7
         DEroGs4cfU4F6LyxDvmh/bFCkUe9pxJRIW/SP4lLAWVsbG5S/F5wvfactrA/9EgV0H32
         jt8yCuyenwhWadlnnIzGGipqsCfTaHaDQAOK9j8mbmXhmq410Bf/DoWB2kBEHFWuv22G
         t7Gtz62cPo8Q0pGeC1XNWwsZV9SDKV/0aCuV4ERRLCywVFIP+3gDnMeCjB1H/5G425Fk
         wlPrG3VeOtu/pyFmMvVYR2Ry89d92gJ0HMvUCt2HNEvyWsr2ZW3l1LT0cjm02teV6Oi5
         FQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=U0S7ck160OChTYQtalHwvMVf9FHH7U/c+TVKdNXO/kI=;
        b=FJL+cCoQvzd63foZl0/Q8RIhzI24pzTkALhziqwhM74KUqHZwotxg7sU/whhwyfDAA
         TMDHI19aPknUw3SQsNEkyI2HpNmigkJdnvFVGJ/lIKsvdJ7ky21A4tnFQsaTKS1NmAxc
         czlYXAu2tcPTuuf6rA1RYbjG658tvub1QWQ/7+JfUXauOblpzZZYjQLpgy77MHRxW6IM
         fP3Rex5hJzY0ExXj9bj+K9OOBgh/pfIUAVQwgV1sJRfmMWe2iPm1GhUCbuicfOJmaDL8
         3p3PRePhDjcVPahkYaz0QwtNX5hEmdAfBfCffEPDMQoesRUdX4ZFY8SOxC3ENYqT/UCE
         hefA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IerS2pgm;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id u5-20020a170902e5c500b0019338f4a652si6977729plf.573.2023.01.17.08.17.13;
        Tue, 17 Jan 2023 08:17:13 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IerS2pgm;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjAQQRM (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Tue, 17 Jan 2023 11:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbjAQQRF (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 17 Jan 2023 11:17:05 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048D443477
        for <kvm@vger.kernel.org>; Tue, 17 Jan 2023 08:17:01 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id s67so22340358pgs.3
        for <kvm@vger.kernel.org>; Tue, 17 Jan 2023 08:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U0S7ck160OChTYQtalHwvMVf9FHH7U/c+TVKdNXO/kI=;
        b=IerS2pgmn6RtT0riu0dw9I30WCr5FmiYXwkmbdoBcNUXLOjwQ4g2vYtDQVbaN6cfqN
         Ioi4iuEXYrMpE/mb2DPsspJ2TjPSOHWxmjA1qXs+djQfAx2vVXMfh8x/pbvCvZ4WLqvL
         p6+3IKY6Qe0UWCcr+uPMDDbBnGX8K/JdhMFL6ns/6Z33jwu8Q1I/bBX5lYO4I+2zum6g
         CVbPekdNDFTEXg3AKyfm6i778D4KSj6aSeL3r1Iwk8YAJG6TaDpiNjgxgDHDchkMEa6Q
         VW7r+8uuSiNnS6aSiIiDzTU+rPlCy6GSjU82RbeHXVu778ftMPtJ4F6Y50LjIJdE8ovu
         Id5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0S7ck160OChTYQtalHwvMVf9FHH7U/c+TVKdNXO/kI=;
        b=Seexk8kLI24XDNRa9L9weE6D5ba4SgR1nltttA3ene/Wy02T3xK7yJy5sKh/VDXX32
         chUuCi34EtI0bHTlIaRSG4nUfr+yM06KN/6yLGL9fxuTfiQ5J3QoHvBRUFBgOUiz+YYY
         a4Mva2c4O7uVxJo6i8o4khyLnWGZ7dVGbK5kHGOjwWMCgTQFw8cPcxMH2Hao16vGpuJQ
         UKdeIzwyYoivtrT3B9/l8MwUOyIGfsddGC1h0AKA/IAanU60XBczdsCawOIeH8zemsnR
         FqYOnn1WVbmclqX398QEgew7UDuWXXxcLSK3vpm28TWydm1WGU8/aTVNYoJirdIZCmOe
         OlAg==
X-Gm-Message-State: AFqh2kpeXQ/yDlB7FjgVvQM/tf1FhH7jVFe4zBAoiIHgvOaSxhEofh6t
        3/q5jCI1HLQkoTliOtl2TFLG4SCRYv/tYBJuhsGL2bb9LiSXvg==
X-Received: by 2002:a63:234d:0:b0:4ce:ca5c:c472 with SMTP id
 u13-20020a63234d000000b004ceca5cc472mr256570pgm.105.1673972221176; Tue, 17
 Jan 2023 08:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20230111161317.52250-1-cohuck@redhat.com> <20230111161317.52250-2-cohuck@redhat.com>
In-Reply-To: <20230111161317.52250-2-cohuck@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 17 Jan 2023 16:16:49 +0000
Message-ID: <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 3gmcLHe5NXln

On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Introduce a new cpu feature flag to control MTE support. To preserve
> backwards compatibility for tcg, MTE will continue to be enabled as
> long as tag memory has been provided.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst |  21 +++++
>  hw/arm/virt.c                    |   2 +-
>  target/arm/cpu.c                 |  18 ++---
>  target/arm/cpu.h                 |   1 +
>  target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
>  target/arm/internals.h           |   1 +
>  target/arm/kvm64.c               |   5 ++
>  target/arm/kvm_arm.h             |  12 +++
>  target/arm/monitor.c             |   1 +
>  9 files changed, 181 insertions(+), 13 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 00c444042ff5..e278650c837e 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
>  than the maximum vector length enabled, the actual vector length will
>  be reduced.  If this property is set to ``-1`` then the default vector
>  length is set to the maximum possible length.
> +
> +MTE CPU Property
> +================
> +
> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> +presence of tag memory (which can be turned on for the ``virt`` machine via
> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> +proper migration support is implemented, enabling MTE will install a migration
> +blocker.
> +
> +If not specified explicitly via ``on`` or ``off``, MTE will be available
> +according to the following rules:
> +
> +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> +  preserves the behaviour prior to introduction of the feature.
> +
> +* When KVM is used, MTE will default to off, so that migration will not
> +  unintentionally be blocked.
> +
> +* Other accelerators currently don't support MTE.

Minor nits for the documentation:
we should expand out "if and only if" -- not everybody recognizes
"iff", especially if they're not native English speakers or not
mathematicians.

Should we write specifically that in a future QEMU version KVM
might change to defaulting to "on if available" when migration
support is implemented?

thanks
-- PMM
