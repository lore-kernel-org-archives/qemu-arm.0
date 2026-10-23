Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B65606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Qn6/17gA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKCDw-0007N4-7H; Fri, 23 Oct 2026 06:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCDs-0007HX-21
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:10:04 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCDo-0002j7-UU
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:10:02 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8b0db268bd8so4731117b3.1
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 03:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792750199; cv=none;
 d=google.com; s=arc-20260327;
 b=PpFebpHgKtEjzjFKUW2TWQKK94KPkm5FFVoV91hNl+j1RbheSXfwgNLwzWQkGuE5As
 tdDaTtcloCaahOwbAfxs0usVl7/ZFMAE8n6/G0X3z8QNP8DBgZWA5Es8Wzzb/3/7qZcv
 ClrXvEnnOlWXcwoTF8ke+gyXJtE9HQyQf7hd8BX7hrmK6P4CMqBvoxm59Ft2vhAx1NPm
 kLEs/+NJsvDDfwoTRJgVXnABgiCwvUuGQf1HtcOfqNI81ndYBlYiU12dgHIVEXzfigAW
 S6T+rRs3ktg6VRoz3RUd97e+Ok9sAHppP+BUe2iVUSxWcb5gg2BSQjsDlxwXYqNCWLD7
 xBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7bdZpNHoTuv1cxrtME0r7Z9VIjTt5QEHDedoD+g/PIk=;
 fh=9febr1WUvVc9JHlcQxnyV5/uRnVpNw4vOeVeBfcMAgY=;
 b=Ih2mlVrXk8pipcCjRTR7PYjKG5iUTa+Cm9PxupD4ZGEpRR0zQEDec0momg7m+clQmT
 HfPuP1T3ERRQoNa1HPr+dJ/lL8fGHrGgZ7eLVKuMC/S7N5YSMW0MCr6eOKj/qaZ3x+CD
 XXpqTeQ2v7rVMkyuwBMKT1jUMDb74Z1YlX/Q9Sa5tf+cFlBeLpOZ/CMk31igfRUpO+Ju
 L+IRJxvj9CWc3rRp1LEPF42nB00G4FFT+hpSzmK93MPbx49HvcmHWYfbx8Zt1ljuIwHF
 6cwxQAMzU0pL23dCp8cJ/QHn5RyE7GY0rkPrBFTpmv+5045W7HqmVuHwippENAKr94sC
 5AeA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792750199; x=1793354999; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7bdZpNHoTuv1cxrtME0r7Z9VIjTt5QEHDedoD+g/PIk=;
 b=Qn6/17gAK9/22FtpSRnKGb8+MljLULSYq7q1vX1RcvjiknnteWg1Fb7Nd4I3IOmwrg
 xUkTAX4/Y85dR/UuiuDxBFahuVqJzCrs0QqAdlmZGabaHBQgD/1pap78DQq5fsAOENb5
 AlMA/M5Cek+V8LisyWwqu6+gDXYaTTQfpKdyN0O+tPlqFZ9MIvOwgxyfUKBv7936OwAf
 mSfFS9pWhiVgsd7yy29Al3BqcVVbifBvW8eD4zMJePBvLEUBhe0vxed0rRmmjw8NBWMd
 jmME77P0cPmsiad341HoqWr+jSPYdMM4cBuN05hCfn4zba4KtfpCZcuFvej7mffXAHAe
 n/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792750199; x=1793354999;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7bdZpNHoTuv1cxrtME0r7Z9VIjTt5QEHDedoD+g/PIk=;
 b=I2wInjmzGAzWU59DMBZ4UVE72UIyfc6F2NQocbyFK4glNHYP/oR/qDstGDFIPmUhaw
 8WU07DepaHSQeZUuFsIMFEYt9ARlofxUtI78omvQPAvnXRmaBIJaMshbH96EtztGtfOD
 xP1KCimVImg+fqgCBHppJxu/9JK1wJaKXVe90bA29jUidJ4kSgzOPwcDnQ/rcMXLvjPw
 +46l9iMcUV8/vMDSD8oJuazo/aI6HE/ufpBsblNs2/w2kx9QodD+U08ln5sP5Tu0q5I7
 R7dOrU70GQpxGdjFgLSLxOZPIhuL2V96YEzDqXpPbU/gB8K3tGK1SeV9iq0UmJenLfyu
 ITiQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByBvu3TbjG3WmBZF19ghhpYlL9sqkKA56AFlphRmnQhYj4uNYsbZTKvySRHgcHa5kE01v/xK3xALg==@nongnu.org
X-Gm-Message-State: AFq9FYKlpYC6noeONymsuvd+62RbznfRMdyCcdzeAzW8Ipz/D4ZsuGuF
 7Cnqjjt3qOwtxGDavDifuK81D29zCbjhAMCUjPLIDlI/IVNINy/KQz6Nae8+QFPYButoMBJhc/k
 Bykbi5aMo4gq0xreRZJkheVry8vVG65jl35DAxXpP2w==
X-Gm-Gg: AYBFou29SozhDLTTlnCH8zdZhOm6kmhOQ1K0Dey6KIVRH3uXbglK97/0q66eq6sePee
 AYgn5KghoqcoPpbTypkGEDJjK1DB3qkJv9LltoI3JRUObOjSDXeW5F0vzsVWxbrnSl1/RfYtJ4E
 ruhKTNohtSn91/MGBZsIu+LGiIPlRJrehOlA7SrjbLKVtmXF5O5WQYYWCrk6KiYi4WSgTZa08qh
 V4hVZ1iAes1xCvAhrBACBYvEQLSkZIyG/ukKC71J4n6CiYE7D7l4XJsx1bPMwmSSwp3Zmx0w0VR
 kCWHckVz4tnlGXOPakEDvWe6l4iz0nqOG4kWRyoljQ9el5iTHq6olD8bCiSOOZL23KH660+OyjA
 hv91urCl0cNlyaYjVj5uNUHY+9Gjgc4DOat5fNbL9dMkyB07ZTV/VeiXqeIql6zAR0oC1jnZ3LN
 O7/n01BWgBl57O1JRyOrD0
X-Received: by 2002:a05:690c:c6c4:b0:882:31:3af9 with SMTP id
 00721157ae682-8b157c8f608mr10629497b3.9.1792750199291; Fri, 23 Oct 2026
 03:09:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
 <20261018133603.64323-12-marcelomanzo@gmail.com>
In-Reply-To: <20261018133603.64323-12-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 11:09:47 +0100
X-Gm-Features: AclHuK-sB-K9XTNyZlKeCsKCGmkxZZAKx4U0GG11jjpljJyrF5rkowfIsdXmyNU
Message-ID: <CAFEAcA-BoFGKpd8vcSGp7SNxq5xmKHx4RGg1eOT3rNwjB1A6jg@mail.gmail.com>
Subject: Re: [PATCH v4 11/17] hw/net/bcm2838_genet: implement GENET MDIO
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 at 14:36, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Implement the MDIO command register handling used to read/write the
> BCM54213PE PHY's standard MII registers (BMCR, BMSR, LPA, ...) plus
> its vendor "shadow" register blocks reached through the AUX_CTL/
> EXP_SHD indirection scheme, and a simple link-state model (PHY
> starts down, comes up once BMCR is programmed and autonegotiation
> is (re)started).
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> While carrying this forward, fix the autonegotiation-restart handling
> in bcm2838_genet_mdio_cmd(): the guest PHY driver sets BMCR.ANRESTART
> and polls BMCR until it reads back as cleared, but the result of
> FIELD_DP16() (which returns a new value rather than modifying its
> argument) was discarded, so the bit never cleared and the guest
> spun forever at boot.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

