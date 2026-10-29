Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D19606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LncdmgiH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMPsz-0005Un-TD; Thu, 29 Oct 2026 09:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMPsx-0005UF-14
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 09:09:39 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMPsv-0005il-Km
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 09:09:38 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8ab43af5e97so8442227b3.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 06:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793279376; cv=none;
 d=google.com; s=arc-20260327;
 b=TtrqyPOFJERfCEWOxsPaALbELAYoSr39egxmn53JTy3/4ANG9uU7SwYKrUb9IdDi1/
 VArFecKjjXPV6yGOHGhxr686y+Qq+YO1gAd/uqeTdMUAM18QlWTJGmTRHQGcrteRu2E7
 gC1tXJgseb+d3xeBYTcsXEU7NXOj8C59AuJmgSiFsxc3wYvbi4mabRVXZuTwdxHPsU1y
 u0VeNl1K4poPAHRPTC6B9Ly0v6I+uydKmVDRKERt9Cg/dae3FvoVAe6ZBHssLcgJjNg2
 NzT3tjkgoaE1Gt0FURh/VpBYsKYw3HdHWPggfGoPY1GdAe5Q7MEOJjrKC8L5QQN5P+/q
 YE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=w7U7K32xtNZSnxwuBq+DRX3+WNFFwlJ/yJBNs+t+zRw=;
 fh=DYYdWy0ucSIgRX7S/fWvCy4+iL1+M3/drirWV8wXP5w=;
 b=KGEQEBqjwn2liJpfhlnagyuMIO+qNKR80sGgS0IvRNcqINEO/guk1jbyTG5/cZE+Nd
 msm5s/F6pP2amG4kTSs3SchvZxIHahZMaJTISgXmFjieHv1XZ1nwONnI9HNNXy6lRdbW
 DXLvNi1VhK8/K2+WXhe+4j3BTsKASJh4Xzu5JOXzhMcxVJjnqDSC6JTh/C3yaAghziVV
 U9aPHGLpsneJZbBNXkx86TCanRoMjfcN7NAIAkbeXbiiFjMGx7iPrfaeJzpSROMWqHFq
 7Cvn06mqishk7/bmnR9x5H1vlaDdCXTF7v3/78mH43hBv5KMfqk9VSaN87cvKkUhiCj9
 +bKw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793279376; x=1793884176; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=w7U7K32xtNZSnxwuBq+DRX3+WNFFwlJ/yJBNs+t+zRw=;
 b=LncdmgiHyzSF3FdMT0urmb6MYzPigW9MBm/6lwdEU5yPoxO0EXtnXVnYVNbf9qV4I3
 fo5/8uuI6ocVmSnRvJ5mzvzZONnAyQDLZUdD0POTUL34BmFiycUsL+7VA11NT3STI48m
 BrVg7QZQF/yf06hbhiGFijWaHUWdeq8smBWquTFEKskywQVPGjTj6E/SdAsh3pp2NgCe
 50NAxoYCSjcW2tdE138ypyKMuqaIEvxoIA/ASuOTkGIvWc+wQW0LferK+oMNbrU7B7h1
 iSNjl9VrtapLQa2AH6wAN3WNU2cww/YAA7mfWKUHT1En7XxfkpH0vHM4H7ixFq++hnTm
 n7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793279376; x=1793884176;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=w7U7K32xtNZSnxwuBq+DRX3+WNFFwlJ/yJBNs+t+zRw=;
 b=THeC4eXww4gVle9ptUB2vNrJ5BbNWZmMDxbLvxNY1nRW58ejdzEET4fs5pYoucv8cA
 XDJNjmT/csQw7AM2UAu6Lh8c2qB5n6S7Q/u0ra1GpY6D0fnkfbRAmlQj+CGP1YY4R98D
 6lO6jGl8Tjf5qclNb1I/qV0w85A/Y1Zo5mqyihoi2QE2QaGKt3dyFoycAtEZ29Xzk6Cq
 YqKRL9Kmm31TAUZu4JISna6m7Fo1o5uZle5u6VBoAqxinsdRMUYMlXeDuuvMurb5IrTS
 DOJwT5kVvOY3/dm+PbP6/aa/mP78xmWdXlywALRNd2MavEnSUEOkcAcAoNaAirfzMuD9
 Sn0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbRTGCr11PWF6Y3zeT2b1fCUmY92KcLOU+TNGy+ngF96sKlOA7CJp6XF1xosTgCwKk3jOmSyZeDA==@nongnu.org
X-Gm-Message-State: AFq9FYKH8BDCV21mZfX2IWWlkdmiq+vppRmG0bHUy0M6odwiolKQaU2H
 8Lxc4ubdcj1slkW455YzPqu0ShZXsbX7rfxwhq5iG4xiWChpJLBc2n7QmFA4DJElZB53XBtGtO5
 3puJ15LPUu3ZZNmyWL5RkRj5w0tlseLOEABkRIpsYJg==
X-Gm-Gg: AYBFou3exBKHPdcrJUjWWsfJhONrAxItV2Ayf/Yl5g6OtQb8T/fX+jUdWEMX6oeoICn
 A4/7JJvGnjwhv5mdYO5eX7+5GvYh9WjDXj+V8tbONRqvKsatqi3C5oP7mKmyDVpIxtBYyjCGSMw
 kKQrL271WUgpB7c0Cl1M3MFtRaDiHigcd27cPOmL50AhlNrNaYfqzpcBEHHfbdVfGZjL99F04K6
 IZ5Re2on67YqS74Rjw7wDaSk4tXzJOiFi0LaAezdWSiYZwUXpQiRCfbaACnXXXbSq8Zgmj48Dod
 AvJG4CCFenAp9ALkgz/HKPE0Tmb6ULH2nNEZlwh8u8D98FtQvYGAAke0HSLnMV4XUGittnwDjjx
 YRN053AwIiSiUqxsivC9rSFlsbkN70V47s3bjrNpugesXC3e5e+TqKSCCUzimU4JhJ9XG2ReDkG
 bIGkdAeIszol+VTo+o06ibDjFWPohiNnV5zhZx7M8e/g==
X-Received: by 2002:a05:690c:85:b0:8a8:8945:c41a with SMTP id
 00721157ae682-8b1c656a434mr21708377b3.3.1793279375911; Thu, 29 Oct 2026
 06:09:35 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027143036.44973-1-marcelomanzo@gmail.com>
In-Reply-To: <20261027143036.44973-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 13:09:24 +0000
X-Gm-Features: AclHuK__jkVtgNAMuh3PRt-5Flalu8UGsOdFKx4T9vSHT-MEcw7Wx2JYZlaPAMg
Message-ID: <CAFEAcA-Z-6F=PSEYt4p-RP1LcOCiPMQVLvqCXTRfgn_R48VQJg@mail.gmail.com>
Subject: Re: [PATCH v6 00/17] hw/arm/raspi4b: working PCIe and GENET (real
 networking)
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 14:30, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> This series gets raspi4b's PCIe root complex and GENET Ethernet
> controller working end to end: the PCIe link comes up and devices on
> it enumerate, and GENET passes real network traffic (DHCP, SSH, bulk
> downloads) under both older (Debian 11, 5.15) and newer (Debian 13,
> 6.18) guest kernels. Most of the GENET code is Sergey Kambalin's
> 2024 series (patchwork series 829638), carried forward with his
> authorship and Signed-off-by kept.
>



Applied to target-arm.next, thanks.

-- PMM

