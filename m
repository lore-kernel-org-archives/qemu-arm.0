Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B891CAC5B1
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 16:43:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1p3C-000125-IL; Thu, 25 Sep 2025 12:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1p33-0000yV-PF
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 12:42:31 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1p2z-0006gP-Pu
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 12:42:25 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-635283199a9so582971d50.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758818532; x=1759423332; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0BsKxJ8F8BEQVgPe0W0T+jLPmwKYlnkZfHox+8F8rik=;
 b=EvBRHEj0b4ac5TVRWblwVDvL9PM4lawi7pcgtQm/1BxRECkgbg3oP+/WracSMgXdeK
 ZmGm/+7OGcFSCi1g/znkBdHeBGfsHgZfKp9w6Nm/LjNLeHiGi3pmr3mLu6RGGOlwfI3b
 seko+oL2kA7skdT1qpzfbLq7u/CIuM9n6coqcKS+b2vXNDU3nO0ZBSDeBE9OxYAtv+y5
 g2anUugPtRpBC86v6Aed06iPVDmyS8YgmQk1jsboBGfmAj+cxyR6WTRqbKPd2/20TRGj
 ZIHrg/pW1TE0y3UVSPM/7GBfoQRJWktnuulXIDA07Dti9pnjPCIA6gxdrHmLe4YrczxR
 f+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758818532; x=1759423332;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BsKxJ8F8BEQVgPe0W0T+jLPmwKYlnkZfHox+8F8rik=;
 b=oQZyvSKVWqKKi1hLO6DIdexNcBuvp67tE+v++3thkocIydAFHVmLAEZphUdk1XBgDV
 qKFv6xC64L2LEq056kSzhoZuxdXJHm3HGj21rKEwXAbbwLnzSfmfvogFWRBYsHMpfXxX
 PcophxEwyyDbtFfezE1cl1euu8rOVz3yvnzPn23rWwAZphnHcpTowddAjrHngfultILZ
 /jF4qLIVPgb2zeYcQ0HgfVY2eJusNJHjWnYHnwFC73itq8lj/NF3lUcWzsF0w6F23KbH
 ya3C0aIqD4SbSu89eQenyQNu+c+2yK+1IzaU8N5BnU4q3PK4o1Grc6O7Ek+hXA8gLeug
 79Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJAR4k9Uvp+H0VQm8uuZkA5EROVGSWxPcvubvXNncw5ZUQ5Hzr9IGq0o1hN1qaLxUez9TUYfTCng==@nongnu.org
X-Gm-Message-State: AOJu0YztLYWJQSt7g3qZp4/vwGVlmT+cR16RvL1/RqbFgIcl/wPH21G7
 gESmQZxFuWk6zPoyKZS6EuvROcvJJH7iENVorpcDi9WT902nv9MNBl8Nx1dVWkv2DYsIX2lGuL/
 KBg5yV34wCXcn1BE4paF/e/NLyeH4kYB1ftkSM+FJD4Ntm5DFTlxp
X-Gm-Gg: ASbGncskpYFHB2cX2NsRCyysqL6or3WmIFkeEap+TeUOFfTwfEuZBhP62qCe2ZNDfVF
 21GEHl3BtPq+0MmcQ3IinF/6DHxxFRj94jOvpk5Lsf+kzrYBcqPVMTDp5856q4/pbPYXsCO4pak
 /Ponm8sjB9KdpKvou43oDxGrDoXjD/gjw3EJbTXrPojNv0x8X/hJWZ+USfV8f7cuZUFDrLzlm2Y
 ZAESGkH
X-Google-Smtp-Source: AGHT+IHSpPoZj4id4c5WN52KR2UB/7TwaYDCn7M1Sw2NOgQp4YFmAzQVHuXKbbaDcB5ZBpJmhEczRhtpOiaMwiweBKw=
X-Received: by 2002:a05:6902:2089:b0:eae:987a:1e32 with SMTP id
 3f1490d57ef6-eb37fbfc092mr4063365276.16.1758818531908; Thu, 25 Sep 2025
 09:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pcie-root-upstream-v1-0-d85883b2688d@google.com>
 <20250909-pcie-root-upstream-v1-4-d85883b2688d@google.com>
In-Reply-To: <20250909-pcie-root-upstream-v1-4-d85883b2688d@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 17:42:00 +0100
X-Gm-Features: AS18NWBYFPfPWb46_T2as1obl6NS_c4V5RVGA0ExkzXdSqEA871l4qMU8qeRW-o
Message-ID: <CAFEAcA-cKA1uNAVjETGRjDTLzp5psY5k9nRNjS5Cr2gZ7KY7fQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] hw/pci-host: add Nuvoton PCIe root port
To: Yubin Zou <yubinz@google.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Tue, 9 Sept 2025 at 23:11, Yubin Zou <yubinz@google.com> wrote:
>
> From: Titus Rwantare <titusr@google.com>
>
> Signed-off-by: Titus Rwantare <titusr@google.com>

> --- a/hw/pci-host/npcm_pcierc.c
> +++ b/hw/pci-host/npcm_pcierc.c
> @@ -203,6 +203,7 @@ static void npcm_pcierc_write_window(NPCMPCIERCState *s, hwaddr addr,
>      npcm_pcie_update_window_maps(s);
>  }
>
> +/* read root complex configuration registers */
>  static uint64_t npcm_pcierc_cfg_read(void *opaque, hwaddr addr, unsigned size)
>  {
>      NPCMPCIERCState *s = NPCM_PCIERC(opaque);
> @@ -248,6 +249,7 @@ static uint64_t npcm_pcierc_cfg_read(void *opaque, hwaddr addr, unsigned size)
>      return ret;
>  }
>
> +/* write root complex configuration registers */
>  static void npcm_pcierc_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>                                    unsigned size)
>  {

These comments look like they should have been in
a previous patch where the functions were added.

thanks
-- PMM

