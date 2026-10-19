Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88047CCF2D6
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 09:26:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIjdM-0003Jn-JI; Mon, 19 Oct 2026 05:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIjdH-00038X-CG
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 05:26:15 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIjdF-0003Ai-Tk
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 05:26:15 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8ac525c1f05so12587347b3.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 02:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792401972; cv=none;
 d=google.com; s=arc-20260327;
 b=bEd0Zoscn4CisO7MxwV73eVWbU1rHJ6D5pudhdNIltmZInndV23J80LSG/7bkFoWw7
 /u6383WX69ksFxdxX91Eh7ASPgXL4qW5xiz6nYCqT+pzZrEI4KoEFoI8UDUPTezc/dT2
 TWj8ULWicRs6ze2xLZ8VJb6BzOMGSXQCxL+Mf8P5kfLv272zDLXXRH0HgsVmBebCvSlx
 i6alydrYMXv/P9QCVn057kc1z8rYP/w3m+6GuwwVVO3KtMuEwFzta8hqDtAgFylQwLhc
 X1XpEbs+u2zra25iVe2CTaB8qX+GeINDa7WPQAokINdOwmsicEaaly6tpat1OMEKo6XC
 WQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=K+sUOHqMJuWYC1Gv3HZka1+w61ATk4ITWajchGwQUUM=;
 fh=qCPFtfdTwSZnaTPI+Q6weJRB8WTmG5ycB76eKsGS568=;
 b=PCGHWs16xD40FzAP9b4/9DYm+MnDuXMfD2nn7iCFwnkh/xhh/0STsU1kCtxwPTZjkM
 fkOQhWydxyQSBIbqK9DogaMTxMezZiFv8NiWM4s182BUWixC/rdwXssuC0AU3m4LXe/f
 XahCDPnfq+nhtTp6+t0CBgNrPJ4klS5APBTWCpCHu1bhKCwC1qja4OMOYuHJ8NLVAmVn
 KABeG2czZ8LwEt1LFHavG1m+DOc1XPuuvIlwFDvfq+YgV3mqWuWLRomfwnZZse0lvE9w
 C4a2jwp3lpUelYaOFBiM9ke94qVU2vlBH/dM39/kv1obswcleqsV4fOUIsJjuPLL12qS
 ukRw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792401972; x=1793006772; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=K+sUOHqMJuWYC1Gv3HZka1+w61ATk4ITWajchGwQUUM=;
 b=WmCy4zz2sCTftSbAX0Mg7ezF6i4IpEEbaDXvg7+2Ugzrwd8y24oAY2U634UrTo4nUM
 APy5hBK3d8wWqnuRfLxYe8h3jygFs/jF2sFs925yXPTvsm2Qo5glrOxdAxsk0e7Pi74w
 ttUes1JM/NsFCGQbZ/oiUU2Zp1YobShnwRjkhlbPNZ8J2Ysn1Z2Ph/4TIYBOzOC3D6z5
 kxHJAX2qnNNukgPMYQUs1PEh3GznYYMrT563uWcdR5PlJ8P2qXBjXxOOh+SsS0JgvciW
 zbYgWYmUmB2rFf1/5BRBsMqDuQW7jVkYXqlBmVPTokfSA9SeV+fKU0LqhKr8XHAn8Mkf
 02DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792401972; x=1793006772;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=K+sUOHqMJuWYC1Gv3HZka1+w61ATk4ITWajchGwQUUM=;
 b=r7PS5y49iq3XF7rTlaeYOmo4b4pt6urjNgTM/qUqiqAHc7A+Vas8o+NF5rDdpaaoG1
 LizRUw+wGHaKv/M5mHwG356OzanzF47Hg30WURnnwhsTF3MC0AsGwGWtQQ/DOiCVpemX
 jzz3Gnz70GT3HnPyNn+YR6gcaC/y38/eG64iADKPaHEgzXUtqpqFVvrHrypon7ixz9kE
 cZNTVX7zK2yTRfa9RyoiWwmuvbzPwtkT9j2VgkQQZ/IwsvnoDBzWJh1Ot0VCPGcNvJXX
 D9SEOZ1TlgqkvKgy2OYoqIN1dT2faaguvcsyMwxOTeh1CpqmbnZFX0fDWXlszB1l8T7D
 XMRQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByq6jAoNohBp1PMueh6fvCHxAf3dvRpXGbFH2zgvGTa6eUOIdyOEBvjXcLEQKwYn/SCGIfB802I/Q==@nongnu.org
X-Gm-Message-State: AFq9FYKX6dGXWY8k14zm82FqO5//qH1mA6t3qIbNmK2yyOFWQA0Sdjao
 P3l5/LWPbPh1YTkqtLcojjJc2Q8ufibC0bJYREjj5nXsJ1q9LGqdx9OnsSdh9QHWFOL0MHoagui
 hUzY9xuWtUgSKgOvorKS4Y/atD1Os+YLKMqmtyBthlQ==
X-Gm-Gg: AYBFou0N0zv6VeFilMKBwlCwb0u0EFW02EoMdzXG8+aJ1F8/K6XpN0kNscqdXjw8un2
 CAHQuD9Ec0jeOdH5Ycrog+w4sS3RrOdmea5rx7HQGc2pOdH5rrcI6C80p/aPOHM8MybUxIxrfxy
 gwTZWgDYmC2O+fCIoq9acB/Ta8tOYWE+N4pHySub2dBtKAXfMqP0pQxk4y6eB9Dur/lKuZMfYCy
 4FyHKSfkr/2ATsq4kopGoUatI0qNwzgexl9Hf4x6dnJzoXJJD2qljgkujMC0EKv/stLz+Wyy5ki
 Vcg1WJus2/6GBH6eueem9z/yxReILVrVgge1zIU1CjlOZ4vtOcnJidi4zLiCRaRXMD+U1r/mySX
 s37E8OmfEHxICge7QSEvzneugaAILIuF/txvnebLEukccnNkrzw==
X-Received: by 2002:a05:690c:c507:b0:8b0:ad62:19ca with SMTP id
 00721157ae682-8b0f2142987mr23530427b3.15.1792401972098; Mon, 19 Oct 2026
 02:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261019024441.3554329-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20261019024441.3554329-1-jamin_lin@aspeedtech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 10:25:58 +0100
X-Gm-Features: AclHuK_cQ1YYp4Z2U_eo2-jzA9kk8--xLfqa3f7PuAFhRmf9jupm1MaOgm2SnJ0
Message-ID: <CAFEAcA8fpUjzHCW=36_P_t=P7RLa7XN1xKJwJgaTdPywcK3rtw@mail.gmail.com>
Subject: Re: [PATCH v1] hw/pci-host/aspeed_pcie: Fix global MSI setting during
 class initialization
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: "marcelomanzo@gmail.com" <marcelomanzo@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Mon, 19 Oct 2026 at 03:44, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> Setting msi_nonbroken in class_init() affects all machine types,
> even when the ASPEED PCIe controller is not used.
>
> Move msi_nonbroken to realize() to ensure it is only set when
> the ASPEED PCIe controller is realized.
>
> Reported-by: Marcelo Manzo <marcelomanzo@gmail.com>
> Fixes: f002aa35f3205d55bbe4a68670ba19a6dcf1d6a8 ("hw/pci-host/aspeed: Add AST2600 PCIe config space and host bridge")
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

This should also be

Cc: qemu-stable@nongnu.org

> ---
>  hw/pci-host/aspeed_pcie.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci-host/aspeed_pcie.c b/hw/pci-host/aspeed_pcie.c
> index b46eb74234..ceb010f213 100644
> --- a/hw/pci-host/aspeed_pcie.c
> +++ b/hw/pci-host/aspeed_pcie.c
> @@ -181,6 +181,8 @@ static void aspeed_pcie_rc_realize(DeviceState *dev, Error **errp)
>      g_autofree char *dram_alias_name = NULL;
>      g_autofree char *root_bus_name = NULL;
>
> +    msi_nonbroken = true;
> +
>      /* PCI configuration space */
>      pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
>      sysbus_init_mmio(sbd, &pex->mmio);
> @@ -294,8 +296,6 @@ static void aspeed_pcie_rc_class_init(ObjectClass *klass, const void *data)
>
>      hc->root_bus_path = aspeed_pcie_rc_root_bus_path;
>      device_class_set_props(dc, aspeed_pcie_rc_props);
> -
> -    msi_nonbroken = true;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

