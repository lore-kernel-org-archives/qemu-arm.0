Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F336CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:51:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3si-0002KQ-Fv; Sat, 17 Oct 2026 08:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3sf-0002ID-HE
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:51:21 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3sd-0005Oh-RD
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:51:21 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8ab3d3c5761so5830267b3.1
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792241478; cv=none;
 d=google.com; s=arc-20260327;
 b=nr8WeKqtI9exVINP8/F195g4AYx+2P/dEgbzQ0SvywSED1k7wMP+ebvGm4MVUot28n
 UoAS4cVRfVn4m1+71Aiv+55NhnxWMO67vdGO/P6BQIV8d4/NV5fqNTYh83/8WXgNQgx8
 97PshKXxxw60mBUdset5t0AdG/q91aFHGWO3icOLrJ0kKa7lTqeli0StyfSl+BvXmxjV
 +CiyKlRUvwwsLRf5jeE7QliSq3kJyY3VED1OQ/AUceKw7br1W80BCPVhM3XgV9ZgH2CS
 0bjAs3EAck8Ebnq+DQRPhkEqp1hMAyhgOoZS35rBXHlo2KH/MKP3FJ4rhF5H5O9YjB1H
 Wkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eXJF3tbfz+IBq6aBn5AYVC3J+Uli4/6ndluaMW70gIc=;
 fh=mLl5vojYXolykJjIiqc6X+kuqoWu2TyONeXenY0DHlA=;
 b=X/q6Tu0GMeJCyWMgyk3f+7Rovn8R51GohJHK48yUnbMZsIkf2tu1dso1/Vvq/yOHt6
 rKXzmvlVDaaPsYAqY2pEnrgSRBl329LR+nkNYlfcxDYbUpavU+nyRGN2D+kj1lcD+z1e
 Wxy60Bk/zJoLaKlZe9CFVOxU5DPiCRhIgC6LkeOMY+p0eHp7ivjZgMWwKqd2UShFjqKf
 aBiPfzE92z9B9DdJfd47opN1k31HZ1sHp4U8hwxgosTaTZASsQkwNgaM6EEqwrpo5mEL
 H5CbLAnmSIK9ZIPDG4QAlhKGxqoarYRkJtp1+YXrxK9nBtDZij01QTWNUfdXs2KrFvxF
 QkIw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792241478; x=1792846278; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eXJF3tbfz+IBq6aBn5AYVC3J+Uli4/6ndluaMW70gIc=;
 b=vkJALNmY4Vd0LdDf08CkDlFaCa1/nQl2iP92Uf9XAmRCsfQ/pBqzzC9XDlmkFZ6Ke/
 AqBXB1A/ZZdpMM15AFrDb7Qq+hRRv1T/1PCChGBBJWgG2oD6SkoPdQZc5Fy0oFbtXM5J
 T3gAY9crpfpb3bFUM/QdraxCmRdxWU07+KdNTE/SdFkiAl9YO59LPhvYjMqXIX+GC2ZB
 sWkboWq5oi1GG9Lj8nBIbvnv4nUIe0KrY28BBo8dVdkmp7JPx7ToiBr0JQ5xlnWalBO1
 Qtl/3mCTI5R0LBvv2VwWGghIOGJjW/Bl6jlPE7IwEvuor1O+lRfqmQL+5QdVRXuUcmcT
 hFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792241478; x=1792846278;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eXJF3tbfz+IBq6aBn5AYVC3J+Uli4/6ndluaMW70gIc=;
 b=Au39EUeUMv48jw0ims79n4cEaLKJ+XuUc9sZ5eBOSI79TGsOzpI1ZiMVQEHMBukRng
 at+KmjkIp8bJaDfWGpH+8QQ2ddr13qtTHT8bVTYeNbIj+2Il2xBev8DARlf8nyCh44XV
 NdyBwu6UX2lr8E4uShQiMybcbrp3TzPy4Zfrfp0ruLGw4qeb8z2fC7vK+H8s5X4dH1iN
 BYnqaJggA0qprX8nHTLgcT/rkfYeuHWixISmreaIyo8dsXjgBLBiB5XC+n3sGpRHrxGE
 icw1MV1KCzle7CxiQQ8SaGahQ6TFoHWNGczJAW9Id9ZxtSxZafNN3BXbmaOoacD/0nhe
 5VNA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+5vABT0FM+isQKEvH1ssPMT6SZCjSJfRlYHmSBPWg2yZBlpQGpmiG6QLPjKsP9QqFLY1tWVf4/A==@nongnu.org
X-Gm-Message-State: AFq9FYLIbGPgkoEhIBApb5F5uj5bNaV+TlCz0XYZpp5ydnAoJNis1Ozt
 qi6FQzBWGmmlj3q9/QzW5Yird3UrfhqjaEAUsc96HsfXUNs2gH4HVfglKXzSg0dkRW7uTBsniWg
 53cDMzCfVr/cSTa2Jvg6vW8TSSGn8wr87ubrFM8YPPQ==
X-Gm-Gg: AYBFou2vHsWAt9SlHlkgMas2s+6dZqItnt8VXm8rFPM/iTrJbbmUjjxwXe/MnQ1ESJV
 qkBke7Yt8fjO3yyWE5TfeukMOmmAWAmRPsrELyH6Jur2MpF90YCy14JLnqg2Imau7VBNMNa1+N6
 W4T6SgMzwcjy1JFfFNvJxRy0YzcW7wNLizzgF7kgdLrGFWiK8AgZW+NXo86bOXoH0YqJJFejSBb
 VIY/BooOdLIkaTZpUhLMMR4UZElSGlqct/NNVy3qU30L6s7DRUKZ4vOHFWuxXgWn90972LyU407
 EAEWaJokWXBPJd6W4zIBJY77T3H0kPZ/hShoVueAc9pB8FXsT86PDPaSUxYDaICThatIlS/tb1J
 +wXtEF3tqJo0TlsWDHNXfRiPzhPnuagjUA3YnghU=
X-Received: by 2002:a05:690c:ec3:b0:8ae:dfee:cd12 with SMTP id
 00721157ae682-8b0f217b5abmr12668677b3.22.1792241477845; Sat, 17 Oct 2026
 05:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-4-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-4-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:51:06 +0100
X-Gm-Features: AclHuK_yK10GXt5RYq12rQwiAf5AKkLREftR2PO_LiVUm2RQSZCQp0sduHBFkPI
Message-ID: <CAFEAcA_Ac9NO8=kckPEVXa_J2Bj79YENVS+7zZcNDO2kCPe=zA@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] hw/arm/bcm2838: enable BCM2838 PCIe host bridge
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Wire the BCM2838 PCIe host bridge into the SoC's peripheral block:
> instantiate it, map its RC registers and MMIO window.
>
> Per Peter Maydell's review of a later follow-up series, fold in the
> remaining defect from what was originally a separate bugfix here,
> since this device isn't in upstream git yet: the PCI MMIO window was
> mapped at the ARM base address with no address translation, even
> though PCIE_MMIO_OFFSET was defined for exactly that purpose (and
> otherwise unused). The DTB declares CPU 0x600000000 as mapping to PCI
> 0xc0000000, so a guest would read PCI address 0 where it expected a
> device BAR. Map an alias at the correct PCI offset instead.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

