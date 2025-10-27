Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82DACCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 13:59:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDNkr-0007VO-Iv; Mon, 27 Oct 2025 09:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDNkp-0007Ul-Ar
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 09:59:23 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDNke-000163-MB
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 09:59:22 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-71d71bcab69so46024527b3.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761573548; x=1762178348; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gib3Q92U+jR2r1WmjCDRtAJ/QprA+Vxy8H70HqEt8tw=;
 b=jyW+AnaY2t3DLvyNbvCpl6sF7VzFMoUVbvEkS+MBniIAVm6LJ0n7gR/n0gljaD18wl
 SDeXX1LmaKYglSFxXtWgJG7m5ih0Imfgw0rSkut/DqvNGVSFdQkKAdGQm3GyQnjn6muZ
 Ku2s6+OLKiVUU8/uZAHMkwQz9BGqMH1Iuhn7t4euqwUQYLmN2OzUPpCo6NwjD2P4hvHW
 7Mqma1xlWKHU+ZPkLTvBIAeY8zAGv1chUdGU40BajMy9nxZ3C+P/a+M+U8sbaA9GUry+
 8v2/vX937pnKS2/Kl1Uh++oRBNzL1Ie4RP1fKraQvTs/d8hLi+XvPMe6NT4By4R4BN5q
 sRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761573548; x=1762178348;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gib3Q92U+jR2r1WmjCDRtAJ/QprA+Vxy8H70HqEt8tw=;
 b=nfNYfn07mIwzw1MKAHnCvKLJJwlSQD0hvLKN+RkmPJRjJ39zZva9crUkzgACbtJ2mX
 K9g3bRx38nKqjyYpk2ItxPSRiR1N5gaiHwS0ldDl8gWUUh2i8Vgdyl6kq749MlcfjGza
 cb3bRoZvHc0ZsCzxP0bTCuNCwHc2bWI1K88n3FAHDiVup9TUTXISlOKzKLi4HFHNb4Q7
 hxgjfF+GYuItiM/TGTGyWTO+mSu4lEiW/jtxuW+aYM0Btd1BryrbKmrdaBNXc4PM1oVG
 7QB5PGKOnXuod+sffIgOxI3nLOV+0r6ly8Y9GXSGqGaUdoG/gY1vdO0m37SZi69yWfPI
 jjPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQYt4HDnZwIefZ9C9BnQRh7xmPKW3Fdxoj2pmxgydGYIAQj/4ZYt1KjV1SW3H1H4BWdVmE8Y7Xqg==@nongnu.org
X-Gm-Message-State: AOJu0YxadQkMvSZYrPsoir1yIZRxbAoRzaMCfSMtnM7fntitZMUQxgKU
 +40v2bjC2GQwUXMP8aigHHepkgi3I6desgF8d1u3/5w2PN40dYDun16/rr62ggMLhE7ZNdtBpBv
 P2yp1INb+Uo/RnR/b1Rsc/vRqcxWfKOedC4zzK0Fe7Q==
X-Gm-Gg: ASbGncsihNK/kEw+h0RcFLdj6LxIGqqYbYth+haTaoU1J71WL2TK1VEbwaDdkxfTwRT
 nNKuXJ4WqH+Cb8BbyqVNcn9eZuAbYD5Od53Xe65zdQMaqhW0uIJZOh703ckeBgroC+dkryvreb1
 zCghqsx/5PuE3iBQOs4HNL2v/hFrHPA7wXugtaJ2QfDydu+dgh+LJIvdF/6PfS6Dqrb/p9er9Ob
 v83IZlbbV23Kp0LzSCZ7oTicG2m7xNlV6qApb02E+7Sq3Tow7OxaHy/ZwYER9+PRTSihuZK
X-Google-Smtp-Source: AGHT+IEjKxj4VLcBisprjZ0EhzxGLR/Pd4lIOCNN6YSuh00RoMwdvK01PzfH9kL+pz6NH2Y8fYSbOEOnlM/c2a0lVvQ=
X-Received: by 2002:a05:690c:e4d5:b0:784:a44e:405b with SMTP id
 00721157ae682-784a44e4c1dmr211274977b3.8.1761573547818; Mon, 27 Oct 2025
 06:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250930165340.42788-1-tangtao1634@phytium.com.cn>
In-Reply-To: <20250930165340.42788-1-tangtao1634@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Oct 2025 13:58:55 +0000
X-Gm-Features: AWmQ_bmK2Y6vb3bkPw_S1yfceDjD_WXRBHyC_m9SeNS3O6bShXR7y7KNA36IYK8
Message-ID: <CAFEAcA92dTDn+Zf-GZVv9zQ3_mwJHZY5hrkdgrRyE7XUio4Sjw@mail.gmail.com>
Subject: Re: [RFC v2 0/2] hw/misc: Introduce a new SMMUv3 test framework
To: tangtao1634 <tangtao1634@phytium.com.cn>
Cc: pbonzini@redhat.com, farosas@suse.de, lvivier@redhat.com, 
 Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 30 Sept 2025 at 17:53, tangtao1634 <tangtao1634@phytium.com.cn> wrote:
> The smmu-testdev is intentionally not a conformant, general-purpose PCIe
> or platform device. It is a purpose-built, highly simplified "DMA engine."
> I've designed it to be analogous to a minimal PCIe Root Complex that
> bypasses the full, realistic topology (Host Bridges, Switches, Endpoints)
> to provide a direct, programmable path for a DMA request to reach the SMMU.
> Its sole purpose is to trigger a DMA transaction when its registers are
> written to, making it perfectly suited for direct control from a test
> environment like qtest.

This makes sense to me. But looking at the code it looks like the
device itself has a lot of code for setting up IOMMU page tables in
guest memory when the test code writes to its registers. That
surprised me, as I was expecting the test device to essentially
be "do DMA on command". Is there a reason why we can't have the
test code do the setting up of the IOMMU page tables itself
using the qtest functions for writing guest memory? (Obviously
you'd abstract this out into functions for the purpose in
libqos/ somewhere.)

If we did it that way, we could use the same test device as
part of non-SMMUv3 iommu emulation tests too -- the qtest
test case code would just set up the different IOMMU in
the way that IOMMU expects before triggering DMA.

thanks
-- PMM

