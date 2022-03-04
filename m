Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1812313lfo;
        Fri, 4 Mar 2022 10:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTI9sccVi6OT9spPMdVDv/srmJGr8fKdlacGKhJCw45TWnlzq9XMqHPxX4PREVqcP10yXp
X-Received: by 2002:a25:abf0:0:b0:628:b9d4:4e17 with SMTP id v103-20020a25abf0000000b00628b9d44e17mr11496259ybi.504.1646419883157;
        Fri, 04 Mar 2022 10:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646419883; cv=none;
        d=google.com; s=arc-20160816;
        b=wOF7WTekor95nUYY9DHt7oFD3chfrCLz84NnDC43FqHmrDPI/u1muKyUqUs5CGJ2QY
         M/tHdN9v3e6oAWfPKEmVr0KgPoS5baTNbk0uXbDxLeoAMpm0iM/LHWKlRamThtWJMFoc
         2USYchlY8JsWIlqAZuNZ9OyUpzp7Np7ZCBki7XaoN1r+BAm5K8N9D6X8wssp1efynDKv
         ilQ3UjdffBwvWKzLfE+ev6KJaC59x08IEQAJd0oL5+Hix/elYBNeIfrjGABukKJjhiAB
         lOKF7MswKNbCtYU7LI1hEYRNuaYWOSDBBjtWA9ORtHZHkbDks2ZpU+giWYrJC85h73LJ
         5bjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gaDu5fZePzBVNfAVpXpEa0n5sdOjwhrJsI3Cis42Yvg=;
        b=iiJmjn1Xs2alKbmvVRL3bYM4egoMerqTtUxusTj9vS31/PYJFsi6m6HppRFhq5ifAz
         kWuElj3/vDlkNe0ODTXlMfDJRP9wFoRGEIkO7p7Lsq7loC+cn7fspIQ+iNlxruBc6lou
         1Mkrr4rJorWjioxqGZLtux0IAhxbDfO2q7fBO2wdxPz9eLKYm8VFkfbZ8Q1p8Sdimi1n
         x02V3z95ACetFlOgEc04jW7pfSi5R1MNbo0qK6TL7GXo/hNwYDmp7SgQUlXe6NULnSGg
         JZgarRqRPDYbZ+kE7wNHsGn60YQQ/SFtB1DsqO7mpn2vK9GEM4JPwUSeRLXeCKm6Oe7P
         BWzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LdDLfapb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a0dd204000000b002d6c94fde45si4609707ywd.239.2022.03.04.10.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 10:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LdDLfapb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQD1O-0007iv-Hw
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 13:51:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQCn9-0007g0-GK
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 13:36:43 -0500
Received: from [2607:f8b0:4864:20::112f] (port=41937
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQCn5-00082F-KY
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 13:36:37 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2dc242a79beso90844237b3.8
 for <qemu-arm@nongnu.org>; Fri, 04 Mar 2022 10:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gaDu5fZePzBVNfAVpXpEa0n5sdOjwhrJsI3Cis42Yvg=;
 b=LdDLfapbrcYaq5qj6BObrTT+vlGB1XzD3+C4+Ug+FpmVenAVB0mIdZyoTTCdn/rkPT
 L7OMPRJcKkZEF3eJqiMDopEERjEN9oaKSVwjAwIcgIEW+tY7Xt3+DSoi1YBjsTG0bpz2
 IGpPY0IXJlYVjiiLE7BcQFOMkniFx8aIP4A+CONXooguFaiI9CLvWUXkvGCHDfEEe0YL
 8R8XZCV1FAdaNXR1oH1KQJXOFqk3r9ZCgTsAqTb9G5Qxdn05oVmXfcKXltIKSCw/exRM
 PmjREfr0xVw2oW3s/S370zXmz6tKMApMlDtHx5ecklAo5suqA64NV6PuWW2zDwIoyGgy
 8ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gaDu5fZePzBVNfAVpXpEa0n5sdOjwhrJsI3Cis42Yvg=;
 b=2KKXhcbIMGaiqW33onVEGVomuphnD22J81tHH75QtY8X1t9APySwDETEip+tWQC7eT
 qt7BBChKKgSQ+TdcnYISbLchQMsZxz0iSIxfRhY2laoamshe4uZaW1MxiSKD9zmm74PX
 PHIxS0hF3MQBuOyoXgKJp4cS3v7Gx4221k7TtBvCSUc7U2nCH+YJlHiylV7LN9NXxdYO
 TlDVHQu+CdVBGL2lFAzRUWc9/q/ks453cjh2aqKV2dYwZkpCM5s7wa1Dj4qYY7hvV2hY
 rWR8GW5+UllawDDIodCOJUzlRMZBcclV7sUlrv3FNJlyg798wWFWeMmVaWEfOOK+aJlu
 ZMLw==
X-Gm-Message-State: AOAM532wUdpuM4+OSM+ayPA7El4fQx2KqWSjRltoNsEmGoq41NgcKSN+
 eohUlh5Io4BhwGsYouC5nbeQdDd7T+3mHCfFbaKjQw==
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr4095695yws.347.1646418994639; Fri, 04
 Mar 2022 10:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20220304174559.55645-1-eric.auger@redhat.com>
In-Reply-To: <20220304174559.55645-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 18:36:23 +0000
Message-ID: <CAFEAcA9_Kiu4mhaS6Sji4-aqcMAOQ3U3AYWm5mdSthBhFxK=ew@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GIC_TCG is unset
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, drjones@redhat.com, qemu-arm@nongnu.org,
 f4bug@amsat.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sXlEDU6qO/QD

On Fri, 4 Mar 2022 at 17:46, Eric Auger <eric.auger@redhat.com> wrote:
>
> In TCG mode, if gic-version=max we always select GICv3 even if
> CONFIG_ARM_GIC_TCG is unset. We shall rather select GICv2.
> This also brings the benefit of fixing qos tests errors for tests
> using gic-version=max with CONFIG_ARM_GIC_TCG unset.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
>
> ---
>
> v1 -> v2:
> - added Drew's R-b
> - dropped PATCH 2/2 for the time being (requires more discussions)
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46bf7ceddf..f29779c951 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1852,7 +1852,11 @@ static void finalize_gic_version(VirtMachineState *vms)
>          vms->gic_version = VIRT_GIC_VERSION_2;
>          break;
>      case VIRT_GIC_VERSION_MAX:
> +#ifdef CONFIG_ARM_GIC_TCG
>          vms->gic_version = VIRT_GIC_VERSION_3;
> +#else
> +        vms->gic_version = VIRT_GIC_VERSION_2;
> +#endif
>          break;
>      case VIRT_GIC_VERSION_HOST:
>          error_report("gic-version=host requires KVM");

This doesn't look right, because the correct condition for
"should 'max' be 2 or 3" is "do we have a GICv2 or a GICv3
compiled in", which is nothing to do with "is the GIC a TCG
GIC or the KVM GIC". Indeed at this point in the code we
know we're dealing with TCG, so the right response to
"we don't have a TCG GIC" is "give up entirely".

I think fundamentally CONFIG_ARM_GIC_TCG is either misnamed
or selecting the wrong files to compile.

thanks
-- PMM
