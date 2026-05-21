Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0CDCD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:45:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4eR-0004YW-C5; Thu, 21 May 2026 10:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4eE-000477-UK
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:45:19 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4e9-0003Xc-4o
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:45:15 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-65c21049dafso5566635d50.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374712; cv=none;
 d=google.com; s=arc-20240605;
 b=Pk93w+aL+83nBk63kVYAf3RhoGIPx39Ob+aveKGakhnddO70g2JxXpGkjHyEfiA01E
 Z9eL7742AynCnm6k1ek9ax8b3AjKMFm31hHmont4EclGfaQn65T4KpAyThcjd6Qli2pI
 3IcMNCLonFoHM1vBUMDi73YCF+lnuxIPIOG4G1Ycc2SeycmrC4jL09k/+gARqWpIVLgX
 68BD6ESmF3UOwIWUHbTzKaQ775oT8ibjkO62KC5FW26l5msygDeo3jmrXo4aO4KYkrzi
 TCbAoUm8HquAp6JSkIDuvAr2jdiCbjnbjc+BfqwKN6rsmGu8OxCAXL1PJ3E11CYyJ1KJ
 AcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=v2ExbkSicBtuqdhUXIVrle7UIPWK29wVusskBwUtfyw=;
 fh=/fOhGTsoIZGCeNpqY5foMggO2s8+uhHBVqoOLzbKwPs=;
 b=NHxhKFN7Ckqwah9mFWIg4Upbh6PNL0GTpWUZJ3iSt2wG7vatNgzheCKCVpTDY7rkFp
 QyyBbr4HpiE9NodQvBl9Rk/2xCLlUDuGSxmgMHQjvjcVpYfOZbRhKvcjdNmY5v2jBp+0
 F+Sc4xO5xBVeRxRWc2HO1+H5QFyZJgJnpebK+dhtH9My2P6sIO6RSkH0epM/f8SiA6r2
 ijsFkvZgY2dxtP6MMtRpGG5mNSHcdQQmfUffjVP8IgHYvMY9Jk7dOYFmwHIvnRqSOg9O
 VK/1jSi+NKiTTPU56PiSYtFhfilQHlgu+734G2FiekfoUE259UAOMlI2AplUjfcfKisE
 T1Nw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779374712; x=1779979512; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v2ExbkSicBtuqdhUXIVrle7UIPWK29wVusskBwUtfyw=;
 b=l4XMn9oYGUvdEqh1BSMXnOIxRwMT78T+XJp6GgITgIGhRS444w338kWu5Et3z/DOL5
 83eu8+2esI9PcFX/gcJtClnvnBp/9BusUw4HQ2kchLBlOhVjzQ+Vb+8Pyj7Qhrw9qcXF
 NOin7P4wVNxsnR4tIxg65goHgkYlcIfopO0D3eKsxAGUV4F+GbceIRdnDRr26om23fOs
 dGwaKdk9EWp92qFRzet41Vszm6/qade3G11R5y0ZKTuDjDNf3sNp+OzqoVNhdt9unTfi
 JcdVRQ9+Y/kW6tjd3WSBj+8iuF7RTzB6XXcQnt6UPEjVZL7OgZyUvLZjEc6Y+sisi5Lv
 Lw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779374712; x=1779979512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2ExbkSicBtuqdhUXIVrle7UIPWK29wVusskBwUtfyw=;
 b=AcKwKmBZh58AQwsiyAsZ2q1YG8djFsSmvvAGX6MeRPTb5tBr/JJ3qh+dB1liOUfKWb
 Bh4E/Af1VG1HCrODrzROVyOTRm3uzWQhNlKmTOC8rvMMErd6yR87nZe70MON4/VdgbBE
 88JU4ZY657m8yXswwo/B/M385oGLELSCx5aj3sXej5WiqbOb53RChvQRu+TIKjgucODP
 Oz8AvaiRpS/aK2NTD7nfvNPVw9EQRtJySE5Sf2DngOJcJScJ6LCK3iy0Dn8AzdvDiMrG
 YfJ66Flu7SxGUIYgEDOQr+RhlfsVBUPFFwPZS4TNXIK3aGDUYEeCAPUcQHu1cwwn1LOK
 74hA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+TgeUOyW6D0fcQZV888ZBKYymxt8Xz+V4zCpoplItI8fnsUPKoMTISSJWEGvufh/dJUg/fvgJQxg==@nongnu.org
X-Gm-Message-State: AOJu0Yxm8Cw6+TzblZIzZnfrbA/IpDvL/xPvAmcSqU49KdG4782gQlbp
 HFP10IjmqeXBomGnxqsfY+Op7x5Flwdq5KkPXZJu+bGRVpUlzpggUbJStKhPCoQ+xmc2e+WUixt
 semL03lsNZrPIefbWPtPwqboPTDsRfGpsTgoWOK6R7w==
X-Gm-Gg: Acq92OG5dyTXEJl6+yNZocUc5SsWnwkQHpEsapG/12zV6Rky3awy5SZM4SFf++FPJt9
 mDW7P3XAFCPNZseOm0LoXsw+Ks+qhYE20gfTWFaUKHJVKuEjwS0GL1wSC8VwwIvlj5lUTeqKOpc
 xSN79ReN+MQEH4CXH6UFGDZr7N59ARj/y93vAa9yOoCRh0lKD9YfpQqvmNVO7p5bYqAFT/I8Nf2
 TGpA1haWNzstwMvTThF61Y8/adYM7TmcF6ZWLCiOK9KMDcGG8zaUnUGshQV6NRw5eLgsDwXrDha
 C9p1FCZC4bH88Bd/VB8nCIGT1JVoBUZgrv5hGdm/8IvSVHmz79EtpfFMBse/FhLNEzjY/v2eX+d
 fjg==
X-Received: by 2002:a05:690e:438b:b0:65d:6eed:4a4e with SMTP id
 956f58d0204a3-65eadfb3316mr2039260d50.24.1779374711957; Thu, 21 May 2026
 07:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-19-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:44:59 +0100
X-Gm-Features: AVHnY4Ily2boV1VfbNDsL753poka48T1W1TMtqui3P_uWmu-5_tPQ2ufQKQ__b0
Message-ID: <CAFEAcA9bWxsbAUg1M3q4UC86Ar49DMAhnv_TJcXAt9f6oP5vJA@mail.gmail.com>
Subject: Re: [PATCH v6 18/64] target/arm: Add isar_feature_aa64_f8cvt
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 at 19:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

