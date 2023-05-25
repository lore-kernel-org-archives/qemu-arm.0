Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp329574ejb;
        Thu, 25 May 2023 03:17:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5CXPuii3WR+g2KYWXyO72DRuQ8nqnNSK+V8e79a2NxF6dvrxHIwdW0ZwKpqNN+k0gSJ3h6
X-Received: by 2002:a05:6214:242d:b0:625:aa49:ea02 with SMTP id gy13-20020a056214242d00b00625aa49ea02mr720566qvb.31.1685009865689;
        Thu, 25 May 2023 03:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685009865; cv=none;
        d=google.com; s=arc-20160816;
        b=BSwX4mlRpADvrUAd5y0o4Vy+BRyGNU98b9WlJnDA+DMcPEXZmeu51b60zmbPp6Itev
         mbp8buQ8ljhNXBkiyndArH3X/aB59pm8fSi4t+lTzhNs3aAtqJnZ63iSOpl4Hf+bpigZ
         u7+YPe6m6Aop2zwMnE4kOhwkSMdmZT8OwaheiSbbgW51PIUo+xz4x4p2YjDsxsHbpUYO
         vdCzXugW9n1T1KWBTf0b8JhxPK19hOSRqxmeWgICPSTcl2fV4Hbv3sXG1lG+TytaF52M
         oir3PvYj2NX7Ku3gqNMk8WDPwA6uXfAsZHjxAblp5dn8pVRgN7ABARtYgdywQQeNg2X2
         5OhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/PuZf9HDcnxXAdRIqM2oTJUVEk2qTt+8Pet41yqkOSA=;
        b=eBNz3Avb6rUh+ReZ1Vikq+7/Mx473xTjQFjEN1pyFAKWXzXmtS7UvDrmJYxlTZFOlc
         HG699rP609kjpqG+5vqOXi+6EYQUsz3QYSrms3PVK0qxJKuTD8g7DiHgGDIcLdoloabR
         DWWRQnWzIllXqrmlbrYDUHRK4kFsr38k0UzclQYKdfc64qHty/udIbgFq9vp1vcVu2u/
         DTl2ihgUX8vcBzO0RwSNByt9tI1dc0sjs3Cr0Lwqo6Ec5YsfTBTXWsQCwqaHHpx5+/Mm
         /sbhTVbjL7TL+CO5QAcdV5nNHyk6L59pBAQx8PwkNqC2XxIE7khDJ6RXdSlTA5YoQMcm
         72kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLwBlSJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020ad45ae3000000b0062387d101f0si353568qvh.92.2023.05.25.03.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 03:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLwBlSJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q282J-0004O0-6h; Thu, 25 May 2023 06:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q282H-0004Lg-0q
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:17:33 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q282F-0005s5-Br
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:17:32 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-510eb980ce2so3347155a12.2
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685009850; x=1687601850;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/PuZf9HDcnxXAdRIqM2oTJUVEk2qTt+8Pet41yqkOSA=;
 b=DLwBlSJsqV62fX+zA/LAA6JHGEvm3Lx/LC9uV7pdID0krkg2S7YFdKedl8QbgEg6nx
 4m2zIhQ6y95RrdpmHdGtRzTR7O66PKAUOW3DRlF5/gADuydT20NpSufFLqraTJoXei1i
 Z9q1GaG5mgpdvwM9NVE/ZDX/Swx5lQl1kTBU0ChTSBvb0V4+gMMg8MKcYnwYqYOGECW5
 yvvPq0OzrMSm2tCywlW5gvWx/Wp1r/RcBzAn5GaT2ByctveRnosbOOHLzJnHw8ctKVDH
 9MU7Zy16698yPvND80q65WXfCd1CmF+5a0sVOigYH8sVcFLEXrTQMg8MyEfcx4f8hkni
 bu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685009850; x=1687601850;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/PuZf9HDcnxXAdRIqM2oTJUVEk2qTt+8Pet41yqkOSA=;
 b=J3RpJGo1Uf4F80Vqpt+MlTAPeCUHCKfYPmdd4/gTN8qn16cphACU/Tvi+w/iTLBiEA
 51RWC6yFNxpjntwpmF5WcIg9VmJU7v6ucacEn68m+gfkc5F7xSZJ+ySHvMMCHuodZZF7
 OKojGfEnkK7A01Pf4FkAV+YcBZsuKV8QkrqEAxcemBqKbLLcmCwpjlfmo9FiWzNewjZF
 oFhIvKw/7Zn1FH40nGBVyHTyfRB2E7C3MdYfpiP84ogtwcMY26ITBhq5MJmYp68Dsfuo
 EAQokbCvcDkUcLaCOMIgyyyAqbANSzObXFdTLOQnoiLpZ1X8AR2VL3TS32KEmiKUArma
 62rA==
X-Gm-Message-State: AC+VfDx0SbPBEZTwW6Wxebvr2Ty5S5sH80o3BrR8Otn6AJI/BCPWw717
 gUCqOkP1KAIpiFkLRQIjQudM1nQwaQq0I4VPT81lIeU1fuLz7mw5
X-Received: by 2002:aa7:c2d8:0:b0:50b:cc52:3fd3 with SMTP id
 m24-20020aa7c2d8000000b0050bcc523fd3mr3512143edp.41.1685009849687; Thu, 25
 May 2023 03:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230524143714.565792-1-chigot@adacore.com>
In-Reply-To: <20230524143714.565792-1-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 11:17:18 +0100
Message-ID: <CAFEAcA8K_6LKnm9O0EhVMeusWO9z1bjunYiKcXT=hVmROehFDA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xlnx-zynqmp: fix unsigned error when checking the
 RPUs number
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xw5GosjsQzDX

On Wed, 24 May 2023 at 15:37, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> When passing --smp with a number lower than XLNX_ZYNQMP_NUM_APU_CPUS,
> the expression (ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS) will result
> in a positive number as ms->smp.cpus is a unsigned int.
> This will raise the following error afterwards, as Qemu will try to
> instantiate some additional RPUs.
>   | $ qemu-system-aarch64 --smp 1 -M xlnx-zcu102
>   | **
>   | ERROR:../src/tcg/tcg.c:777:tcg_register_thread:
>   |   assertion failed: (n < tcg_max_ctxs)
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> ---
>  hw/arm/xlnx-zynqmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 335cfc417d..5905a33015 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -213,7 +213,7 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, =
XlnxZynqMPState *s,
>                                     const char *boot_cpu, Error **errp)
>  {
>      int i;
> -    int num_rpus =3D MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
> +    int num_rpus =3D MIN((int)(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS),
>                         XLNX_ZYNQMP_NUM_RPU_CPUS);

Applied to target-arm.next, thanks.

-- PMM
