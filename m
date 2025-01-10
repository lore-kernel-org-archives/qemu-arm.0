Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp277031njn;
        Fri, 10 Jan 2025 08:34:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+NL6C97VCOR/ve4gpz+EFlYC1OXJGtiyjSV0dE4CpaWp5/VXPN4B3SCUetn8PXoOBWTU1v97bY+X9sA==@linaro.org
X-Google-Smtp-Source: AGHT+IFsjvpaZB0W3l0bxpnByvwuHeYitUPQY6H9GIdEbHed5vGJmjwbZThiuI3tFAVs4J9EdyQP
X-Received: by 2002:a05:622a:311:b0:466:82b7:8bc2 with SMTP id d75a77b69052e-46c7b072509mr124359401cf.25.1736526851494;
        Fri, 10 Jan 2025 08:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736526851; cv=none;
        d=google.com; s=arc-20240605;
        b=UjB8/q9D5eDE+2ZB/vnU2a1zUReBA7IMSrj/PFHk4HXAVc9EvAmJYmzXF7T0hDJIbB
         tVhrsS6ErXLnmj2VH0U5CBxYQpyFSqqoJTmGD2QaWzsJBMX1GmOJl3uEZ3xPzLpmm572
         Oecjt7V7eyrChX6HczsDtZox4sg3BCzaJVPj8vB142ILKUBta9SA5KP8Z0FfT8JCRlG7
         DjNb/7lmHd29jmOpl3VS5ITdx/ZgelMfEeK/VON7/JgEsigLpdGW4wgB7qNCVYIcHSAa
         xC7TWdQBN4jFKAvhsQla486YGMt9OYzaqcNAe5p524RGg0rMiilRIIosWDMpxRlisVPp
         7tRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9QkFzvLXENhdg677ICuQLwSEYKTcmCSdb4mz1Xb7oPI=;
        fh=K1fVguJ5/Z0l0+rxmxj+Yl1aTicCJxMUzLQPNnW4N8s=;
        b=F1Q+nutQKEJCkmDaS8VHNAbJTDGUtrQFcOKpoS6n7DTpwks4rEBMv1v6dTcsyC/20A
         LxO/QSVaYFE9gr/EfhjA0qDRilrj5T3XUcEmznnLDz7uyk/TpahZtt9Vm9mlL1mQ4zP6
         iQKqwVRPMtAjj/u/dNJVVDU0XaK2r1Al6e0jC4uuIwb2puLjP1yhjvFhSygGyu+cskv3
         qkunGSsN69HtBZvhr+zq9Rkaefe1UZoz4E1uip/6gHQHOAgkxLrhjM/sUnlZjwwa8gax
         QS3/34TqNaOMjq5KqeUwFMT5YpLYKv9l/8jqKhBgK6CoHyzxoPxXjxXkLE+i+Ucu8SUU
         ux0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiYqfc8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c874255a0si24934331cf.622.2025.01.10.08.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:34:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiYqfc8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHxS-0001BC-OE; Fri, 10 Jan 2025 11:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tWHxR-0001B3-1q
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:34:01 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tWHxO-0000Hw-Ea
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:34:00 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e3fd6cd9ef7so5656156276.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736526837; x=1737131637; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9QkFzvLXENhdg677ICuQLwSEYKTcmCSdb4mz1Xb7oPI=;
 b=WiYqfc8WLqsdhnMzJ79kRiUfxxYQ558pLqAM6jYx5wXQkmtYq6t8P9HXmzXUw3fiRl
 JO8MtEnwnMoR48AWS0vtusU8cAQ6SHOJzonNZZp/D7HQSO3I8/RRWsAvveEoAPzRk/Av
 j7r+gg50s1qtvdCRAFZ+XQ7oaMZWKP/6/qhmyM/2rLmzYAYY3dmpQG4/b13tUr5if3DB
 goXJn5OcnymwLS9fbGOmXO/KvFqhKp3aB/7kT4ovqIiJ79CLVGc0gFoMHYdOZR/IS2Ab
 dA6hMmo9H2wOQmzpgy6KUol6XgcdHEip7FxToxRB3f/klWVQNfplzZiWaZnDUCzwdZUc
 PaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736526837; x=1737131637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9QkFzvLXENhdg677ICuQLwSEYKTcmCSdb4mz1Xb7oPI=;
 b=J+qwivO9QO5EI+Y5cGU04W0MnYh6CfzcWY+3Q9M/fRy3E0Nzf/xtFH7wCWwsBh1J6U
 fyxmZhCGcOofesfBMWoo3U8K8aXXKT0stZwl+yRgO3TiTOoh2CA3hYu0y5XhRSSonCDS
 2xDZFdvH8/SWZw4LDSzlfkOW3cjpvHB4FIChHQU2LJIECpkPmIcQAuSVo5UX1wK+Y/6/
 y0d6Uz8M6X7oYaLcEDcqp3U3WW+BajiSx8tgZzMj+I9In1aYkkT7aBg/3HNyoiI5qYCD
 /76DjZIFsbnMxqU92JOBxUVJ2wGd72e6D3L08PXRYABxEOEpQaMHiMVwqdIkWoH/oafM
 ac5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHYGdBFRz5JtxjbUhBpjwsaetGgefLPb8qUHDejsIW9zySLmAywaF1darFBR0N6uH+3jpx1Bdcyg==@nongnu.org
X-Gm-Message-State: AOJu0YyVyL0H8bvsKsqgYf8DkZ70WcjJGylfdDw2afM4USVJzKuUX+N1
 cRNId1QJZtuFHifxxHyhbSFUaqhg/Xme0H10OuWOxfDMfSNtqkkWWxC9LmjdcWUa9u2IaX27l4C
 3/bH3Zr63ReD46isK4k7H1k6/UJkU03igWg1saQ==
X-Gm-Gg: ASbGncujkHagianQBRDDI2rvOrFKGQx6Z74gplATbcoz22ot7u6FAAacwnSAWLpLZmr
 DiAM3epqGnZCvRZz7p/iocfDyVRWth8UAQblJ1ec=
X-Received: by 2002:a05:690c:d07:b0:6ef:f05a:ba6c with SMTP id
 00721157ae682-6f543f2a7camr63286187b3.13.1736526837266; Fri, 10 Jan 2025
 08:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20241223093051.45648-1-j@getutm.app>
 <20241223093051.45648-4-j@getutm.app>
In-Reply-To: <20241223093051.45648-4-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 16:33:46 +0000
X-Gm-Features: AbW1kvbXoLybWB2N2sdhWyKt04OyjhCuDkoxwVt_wV532vQHi4LUOZFtLhV9Dvg
Message-ID: <CAFEAcA_HX+AGjO2ZaBsjQKi2d=5AO4V3p33fDG4NzsZ3J-D4QQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/arm/virt: handle hvf with unknown max IPA size
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org, "open list:Virt" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IHiruuG0CQA4

On Mon, 23 Dec 2024 at 09:30, Joelle van Dyne <j@getutm.app> wrote:
>
> When it is not possible to determine the max IPA bit size, the helper
> function will return 0. We do not try to set up the memmap in this case
> and instead fall back to the default in machvirt_init().
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f9b3380815..8c431e24b3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3053,6 +3053,11 @@ static int virt_hvf_get_physical_address_range(MachineState *ms)
>      int default_ipa_size = hvf_arm_get_default_ipa_bit_size();
>      int max_ipa_size = hvf_arm_get_max_ipa_bit_size();
>
> +    /* Unknown max ipa size, we'll let the caller figure it out */
> +    if (max_ipa_size == 0) {
> +        return 0;
> +    }

When can this happen? There are other places where we call
hvf_arm_get_max_ipa_bit_size() and assume it's valid.
The implementation calls assert_hvf_ok(ret), so if it
returns at all then we ought to have got a valid IPA size
from macos...

thanks
-- PMM
