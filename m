Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30DACCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 13:11:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI4BZ-0005P8-C0; Sat, 17 Oct 2026 09:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI4B8-0005Mk-0F
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:10:29 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI4B6-0006rK-Cm
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:10:25 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8b0c5a64de8so15728937b3.0
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 06:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792242622; cv=none;
 d=google.com; s=arc-20260327;
 b=AFgnvUm291mxvNqdNoIbFxEAwbotkMwef+qrefcLPCH+Krrl/6JSE/L1NeSBjxkqmD
 MzJyVNLUBLG76fZTnRBMSxUs+eksy5gLlIHEu5oiTZB86JWov9lyRLpAhsT2tsEG/KAg
 NqRAJUqwDQJsYm9TMdodVY2eEM94fCbT8i1IrT/pfaiMdIDZv7OCdx2Ls/Azlry9sUJ8
 1jqYsVxo2seq5y0feGrhblDBtSz7aTS2Mrdr7i5To026OiZQGEahkYDaikixgKWZ9iI8
 fXwVrM0HAKl6UOZws+EO5nVYcHNyaxVQaj2PTROaDqJTg5QwkvV4zp95NJnfAiCqqeDU
 mChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4YEOEaIg+6YWob5GLr0qy49JuPDedZ0wQXlgzSvjW5M=;
 fh=86NSkXZRA0SX79nppPMlvsGl2Y11OymiFv8cQ7Je6gQ=;
 b=A1jw7GzrsCm5Nj2ZmEDuwXhsyITw2xLkdU4J3DlCjYR94d5sH8kaDo5/pNWmZh+88I
 1Mz98h0M8v0h5KJzlBclU1Y2SczcYPaE2ZxctDEuGa1tAYRyZFTGvUBJTB8Sd63ZdxWS
 F0q3a17z+FSg+Bw/YPYxRDGqRHhIMTASWuePYe4MUgyHLHZWUyAvRd2s5fLnoQHMaeps
 IeMmyeeRE2779h9oazq4qnR8mpg/yOEEhNFTP/tAm/G2Eswyek0PY3FeZPpEEW28szgU
 ZITObgVu0EwCiI8/YVEW459uMRcgldAp5UfueHR5aPjfCX0WxdXfeD0B2NyVeTVylgVg
 J+FA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792242622; x=1792847422; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4YEOEaIg+6YWob5GLr0qy49JuPDedZ0wQXlgzSvjW5M=;
 b=qMl1CXBUgtyhRCDLieZ32leQkOMO4BW9ec1noIHybVyU+Qj6L8BmsliJQZf7kxXeik
 8DDy3kCE/s8K99z7p+g/myL8sWhrPWWIWtYJCl9zxNI/wYY32Eqg4tqFa0uh/DDOPOLl
 SW0PiPN5FRMk8UMliHnsxfXQbck3JALOUuKiyfhnxkIaEtJJX8Uaeul3eWpqoucggqNy
 NfZ74SlKqESBH/iR+gOJaGDfjSgIS6oD8xXHVbtrWJ60N+9gu8aFRJ/Em/RBXdf+Ej8D
 UAEBixoUTDwftVzH8w6mSlPiqt//RDMc6m9y/ITeRDPCpNCuD2bXhBcUga3UvzZ4hwza
 rcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792242622; x=1792847422;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4YEOEaIg+6YWob5GLr0qy49JuPDedZ0wQXlgzSvjW5M=;
 b=ywAPO9yAEli7qyTUNlB5aWZcbFgjpkJlC9DAYFgKLA/kr0JWW5zWk60xHiPUjNpN8e
 xiYiNW88iBKvKmx1+iwIS7d1jEJ5guTyo9voxqPTUMQyJ04anIlhYSZFMuH9RdeAT1Mo
 vWNbpcUKAmdwPY+bqixdwgJHsiTcGpWG1TjvUuIop3XBqp3UGcfKGyWy1FfxC/mWhVzq
 o744gdvy3rRNSguy2oBQ0WI3jdYmVEnesTL4V6+7PHSN55b4lxYTMjTYOWiREg5RLv/j
 KjH+7II59i/4UFZAkJ/Zh6J6Pl2oYjh+ZXkyDUyBo/VmwDycd0bMCWWub1HRmN7zFCWg
 FLkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwVeuxR/vJ9eb01ppMaP2ta5p0lf3RCSY0+NsaNquM5piNQtb6WX/vXUnW4beBW6ap3ZJ+fqvcTrg==@nongnu.org
X-Gm-Message-State: AFq9FYLaqxSUuD9UdfgdmAMUvJuX44eokI+DnfJ+VodvohHOxU9d6IR1
 FSO1lZNMReWuADeZks2gYrVLVdmzPKLzWjCk5Olrff1sgmNN1rc8pZ7yRQNVmqLW/H02yWkZqU6
 NI21LvLVapnvaGrdcbahWslUyNRf9zDhek75619jF/dEOWtaTYXhyK1w=
X-Gm-Gg: AYBFou1e7z7lEgP2OmYV8UrlTIeWCDMv504A9KkKiZ7xwrPSRKpX75fybXOcb7+QOFn
 lLoHUNeTG2oEgTDCEUh8dvhumjIzPt+iiaZ3KEUWFGwegTFlBjJ8qSovUgC43u+dD1iEH7yrT4x
 P5eTAjApls5B+03mFTxxEgzGYXowUcQ+3aYvTv2UpYfTsxlBtf9Qu7Qa4QgOn3iM6BZI5DLRTPz
 vryZ4mMxPdoU49JBbfVe5BLcDThSBb/rQGmCWn4kPubigdLQ9kUgIxQCigstDSJKfMY6jkBgfBB
 a2HuhtCHt7tL02BXiiRkEFnhTPeW2q5wOBNPktoHnA3QqFzqScbyNJ9Xr7mjv7+Kn3xGVbqgIXB
 iWLjU6bV3kve86cz1ViiVHmcdyGKRGt7KP6bvtZs=
X-Received: by 2002:a05:690c:6c04:b0:80e:dc2:873b with SMTP id
 00721157ae682-8b0f2133876mr9195377b3.16.1792242622332; Sat, 17 Oct 2026
 06:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-16-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-16-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 14:10:10 +0100
X-Gm-Features: AclHuK9X7BXBy4vJ-DPzeeOcZT7eN_PHvOGYdnbRlKLbFyfZMyq1n9-1uOgdPtM
Message-ID: <CAFEAcA8qQ-ORtpoD4xsytbqFBOi0+cqE5Bkbv3m6mi+ZXwxm5Q@mail.gmail.com>
Subject: Re: [PATCH v3 15/16] docs/system/arm/raspi: move PCIe/GENET from
 missing to implemented
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> raspi4b now has a working PCIe Root Complex and GENET Ethernet
> controller (added in the preceding patches); move them out of the
> "Missing devices" list and into "Implemented devices".
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---
>  docs/system/arm/raspi.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
> index 44eec3f1c3..a8fc37e920 100644
> --- a/docs/system/arm/raspi.rst
> +++ b/docs/system/arm/raspi.rst
> @@ -36,10 +36,12 @@ Implemented devices
>   * VideoCore firmware (property)
>   * Peripheral SPI controller (SPI)
>   * Broadcom Serial Controller (I2C)
> + * PCIe Root Complex (raspi4b)
> + * GENET Ethernet Controller (raspi4b)
>
>  Missing devices
>  ---------------
>
>   * Pulse Width Modulation (PWM)
> - * PCIE Root Port (raspi4b)
> - * GENET Ethernet Controller (raspi4b)
> + * PCIe MSI/MSI-X interrupt delivery (raspi4b) -- INTx works; a PCIe
> +   device that only signals via MSI/MSI-X needs ``msi=off,msix=off``

Do you know what's missing for the MSI support to work?

thanks
-- PMM

