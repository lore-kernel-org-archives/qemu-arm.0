Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp325125ejb;
        Thu, 25 May 2023 03:08:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5t1G5gRSRRXnQTiAW40/4BpvPHkS0OskzupGyCrC9lKa3k/a1T5U1GYayZcHV4MTemPgtQ
X-Received: by 2002:a37:a88:0:b0:75b:23a1:477 with SMTP id 130-20020a370a88000000b0075b23a10477mr9386766qkk.61.1685009338443;
        Thu, 25 May 2023 03:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685009338; cv=none;
        d=google.com; s=arc-20160816;
        b=bUB4k4MBmy4qlq3jcfUT6tlhNeQkvTCUlii8Qk9QLmbUOG01eaJuBbo+e3ESGwtP6U
         lJvUiOn7ugY7cG5dvpwwomZ4I3ZGWErqTESJ341aB5A7zey/uysGtzDSZOvu9QiaVOV2
         tbPVmIy/4UXFJaJxLjr31sdnIGJJO/Cg25o4SdpF9UXwsc8ZIEGQp8so93QxNMDht5Rv
         GpQzIUnai6l3/xlqqIWtCAUWTKtlwT4N24IY4ZblwG6e3W/saj+FlxWZmlp9aF8WMGNf
         5DiH6vAyT7dWMRqDzDF8sDO8nMqUVeUrzXVfr5VuJfljn6LhfsWz5K8VH2AjStA511o3
         7QkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EisLXafH+ZAfhp7I9z0OiXumwDmsVY8hcBpzulyBU4Y=;
        b=uoB5iz27SYkqkqZMB54I8mwrTi4K3mg6kDXvZgbbJtZmAA+p2s3ONvNJsmDm/y8wpf
         DVrzFJa0XQmJ4A3KHsx+aJms535vNwL50+YNkKo1SK3KObEiWfrrk2Zk8C82Y7RDQct/
         PMkebLJyKEkDetP/MJO9qe6ezqwJPFyK+GDncROO0rWWlJUFPgi35+ETQ00shahnEQJl
         ahdusZkYFLM/nGKrDkpZnslr/n1xYP6F+c3uGWky6lmQw3EvNdodnmNcVxAnpOGlCYHb
         IRr7F4+9e3ClhM+ydGMDPhwm6SlCRCf43QxItw18HdzoDGJiwyftNRUyI88+kH2zdYh7
         msMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHsWoVOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a37de01000000b0075c89cc45a3si350993qkj.119.2023.05.25.03.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 03:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHsWoVOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q27to-0001Yw-Bl; Thu, 25 May 2023 06:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q27tm-0001Yc-Hr
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:08:46 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q27th-0004K6-K1
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:08:46 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-510e90d785fso3539416a12.2
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685009317; x=1687601317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EisLXafH+ZAfhp7I9z0OiXumwDmsVY8hcBpzulyBU4Y=;
 b=jHsWoVOuVsq3QmOWRhIso29bqqp0K5T1OHPVv9iDrBrDuDQdBKovZDO/kgbQR4F0uY
 Vlz2eHFb5IXDxiQIDBy2/ofM/7Ebqk87s8uAKBxiJlBm9HHBZEv3jechJCCXMdhQytnw
 Cog8b+Brpyji1/W1Q0kiF+yFZ8gGsMghb84C0vEdgSjdek7akPFWkP2jgPCOJTXGGZIj
 kEH1tx6wAHRexV+yL0U56PczALx5rdOaf2uQbYivziZcOd3uZDeHgPTFCjVB9TyyY7TM
 1TTAlskTUma0KMBcYsDlYeiLjrkiOxqlBogQAL4tqFDLfiyc3DD2wQNvUGlmKUMc0P6L
 ui5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685009317; x=1687601317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EisLXafH+ZAfhp7I9z0OiXumwDmsVY8hcBpzulyBU4Y=;
 b=FhM5GeF21F+7G6tK4D7OWBAu3QNKvIInypVzAqyZUgfT9KrGP1PhEuJBEdkzm/KepA
 0qHc4GzmJ7v4xcVllQ52tIkArW59QT0OaNLbL8LrJhKfNTA4KUsW2Ed+N1H75U192drN
 RL6YyqWo236L4cFUOsPzee3YnCRO9lx7FFprlB1zfvyuz7OQilyneQk0UJZfD5RUZJmX
 ftbumchRxBzmdMBuHGyZ6j2GyPETFm/LAT1Cjo1SN2nNVwUwmxuEtjVHKm2px8EOK6sr
 RXLeMhflP30gfnGD4FJC7/iksC40WRJjWxZhA4VExKXUlDeVNiybC+7pQPGkELVyrr/n
 J+Sg==
X-Gm-Message-State: AC+VfDwA1dBAb28udBgr1AFWJr1w3KNM7g+7Hs+IcXzzyl71uCZlm/uU
 iovYyZUL+DB2pePPv55g9EcNywHbu6OwPIVwDQLeAQ==
X-Received: by 2002:a05:6402:3451:b0:510:ee0f:1eab with SMTP id
 l17-20020a056402345100b00510ee0f1eabmr3415504edc.41.1685009317028; Thu, 25
 May 2023 03:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 11:08:25 +0100
Message-ID: <CAFEAcA8VxcdRvrRN2-pztriakGsXoGhaEcyptJ9z-0rPua0HGw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] hw/arm/sbsa-ref: platform version 0.1
To: marcin.juszkiewicz@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vE6Ka6utU94c

On Wed, 24 May 2023 at 12:33, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> About year ago support for setting platform version for sbsa-ref was
> added with "0.0" value.
>
> This patchset bumps it to "0.1" as we export basic GIC information via
> DeviceTree to the firmware. TF-A will then take it and provide to EDK2
> via Secure Monitor Call (instead of using hardcoded values).
>
> Basic documentation about platform changes added.
>
> Marcin Juszkiewicz (3):
>   hw/arm/sbsa-ref: add GIC node into DT
>   docs: sbsa: correct graphics card name
>   docs: sbsa: document platform version changes

The cover message subject says there should be 4 patches
in this series, but there are only 3 listed here and
only 3 emails arrived on list. Is there a missing patch?

thanks
-- PMM
