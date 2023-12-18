Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp836489eji;
        Mon, 18 Dec 2023 06:38:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtteoVb3RS0+Mc+sfmLPQZX8MdQuHzbnn2t6TzO7OP4h4u4v/YLYa7Bhk/12Jop/HBUV3l
X-Received: by 2002:a05:6870:7e0b:b0:203:b60d:8536 with SMTP id wx11-20020a0568707e0b00b00203b60d8536mr1582645oab.88.1702910335684;
        Mon, 18 Dec 2023 06:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702910335; cv=none;
        d=google.com; s=arc-20160816;
        b=PSu0/BvY9kOXAEhkLe/vj5obhR0fahJB85G9wTcntUOigCecoA3EiDi/VNfbE4RpO+
         yeJmBb3A2ERNB9mRAuphNnhPC6pj0IpLrS+Y4+C7vuV0KKOuk4lXbHVSuaj5D3bRRVpU
         wVRASr/KlocSpBQOutRTv662gzSfklUcK1U/e+vEsdkGDtUWF2afFyIRZZUUDWMYo3db
         Pq3KIPNIih5JnHWx9tkwDOO016/3U2LW7I0V/1DvT9Lvv1grRDPxXhu2eG381EddPTB6
         MrNt6PjgcpULSGbV3RWTWVQZrZsKqgBZwjw4JSuoWvP4nFfkWaf0PvTMZlpqA/cbQc72
         q75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bgj0sVrI7U95CLv7d0BYIHP/xkmJZivXlbPSx3e/iDk=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=ZR7Xf7tp3xDA5biDJetibhYxoMzt9mE6V1i4opUj049vK8Ur82ccRCwliQIu3pSWZB
         arXideubcC/TTvmalFoJ6x0tfdd8fMCGTw8Wsj7dSX4S2/zORPNSPfWU3HGSQS+G8rMZ
         Muj6LaleW6yXuxmtpyY5xWMxqapSENah1BDTZv8dfQ8bjHeqM4EKRkdoTOa5/pEGNjPG
         xYhS1LpPl2STJTnXD7gRxtJGpGpjYaOKzT3zW5+vZ2E3gzX+GRaXduSvrK40lLMh9Qqq
         JHIbtTcGBEHKANGsVv7OKFuWe8uYhRVdaXCAma7tKzRsVgfI8gzUhBDfg/mCKX0korKw
         oHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jYTJb+Gr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1-20020a05622a004100b004261855f715si6801543qtw.247.2023.12.18.06.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 06:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jYTJb+Gr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFElf-0000OP-6g; Mon, 18 Dec 2023 09:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFElW-0000Kl-88
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 09:38:42 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFElU-0002iz-C7
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 09:38:41 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54ba86ae133so2793886a12.2
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702910319; x=1703515119; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bgj0sVrI7U95CLv7d0BYIHP/xkmJZivXlbPSx3e/iDk=;
 b=jYTJb+Grf5p7psAsq5bto4SOed9imocfKMrytciikuOgjxfvnP9FChOt/9kaVar3Qj
 9ZTxSfxpYaS3lYiTdnnj9ckWVDQpH6goXwKafMxE1gpbjNBUsBAnheZGxutQO73W8RwF
 jWz0fb44dZxtJI64YxZNwz/a0CPE/ApIALZes1+NEWBEJ+fEVcNEjd3UkFYvN/7ixEOE
 4LuJim2xI9z8GWE0GodMEFVUDctpEK0V0yF+2R4NyZIq7EQwCZJJj5MzRGSzm55R4SVB
 oTeeP9Gwq3LnuixXc2+G2c8XoQAMurye+LYu5Nq7ZEM8tePyaFYX+n2IACfLSUkw0pQg
 LkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702910319; x=1703515119;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bgj0sVrI7U95CLv7d0BYIHP/xkmJZivXlbPSx3e/iDk=;
 b=jZQtKQ/dDucicYv4qv7gScKCO2LgmEyGyahbsTyvSjoJ15Z5svZIq/g4JHmJ5YpHlW
 jd+CgRm5FPznfAED7Bl4K3E0G/dPwAP+vyQhS/H+0Ur/sXMhetS1QoyTIohy452cl/+i
 Pi4sTdS8PNlRo4L7tDOd6YdgMdYz2UvXUHa6nBfaesLtv1UD8CY1zN22iasOg4/xDoCJ
 BAsImmxHE3zPcbAiQ/P2gm9IjgBkprZ9MI+c7FCaLUYZfbFeqJgm7cricCr4R0VCIaBn
 O2hVHjSubmyiKlV7JC6ERfymNKI4jiwFKFTbtJPrxLdcX/Nh9ICsfQ+J9TxVeTATdzQj
 VpKA==
X-Gm-Message-State: AOJu0YwkseMje1UlKoJCNvjtTnWGtVhTRJpHjHF9C+Ga+RwJZ50sIwCB
 RC5LRRBCbEqA+Ag87scu2bxBhqyDxReJStR8yFz6Gg==
X-Received: by 2002:a50:baa2:0:b0:553:42bd:f0ee with SMTP id
 x31-20020a50baa2000000b0055342bdf0eemr1602405ede.53.1702910318770; Mon, 18
 Dec 2023 06:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20231214211527.1946302-1-nabihestefan@google.com>
 <20231214211527.1946302-9-nabihestefan@google.com>
In-Reply-To: <20231214211527.1946302-9-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 14:38:27 +0000
Message-ID: <CAFEAcA9e8Pe38ei=L16w-JrQDLmH9wHoKDjktJLFNMoFCpHZCg@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] hw/net: General GMAC Implementation
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: YXH2DD1+nJ0G

On Thu, 14 Dec 2023 at 21:15, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
> - General GMAC Register handling
> - GMAC IRQ Handling
> - Added traces in some methods for debugging
> - Lots of declarations for accessing information on GMAC Descriptors (npcm_gmac.h file)
>
> NOTE: With code on this state, the GMAC can boot-up properly and will show up in the ifconfig command on the BMC

This commit message does not match the contents of the patch.

> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  hw/net/npcm_gmac.c         |  26 -----
>  include/hw/net/npcm_gmac.h | 198 ++++++++++++++++++++++++++++++++++---
>  2 files changed, 184 insertions(+), 40 deletions(-)
>
> diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
> index be3f076200..09f048383b 100644
> --- a/hw/net/npcm_gmac.c
> +++ b/hw/net/npcm_gmac.c
> @@ -305,22 +305,6 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
>          break;
>
>      case A_NPCM_GMAC_MAC_CONFIG:
> -        prev = gmac->regs[offset / sizeof(uint32_t)];
> -        gmac->regs[offset / sizeof(uint32_t)] = v;
> -
> -        /* If transmit is being enabled for first time, update desc addr */
> -        if (~(prev & NPCM_GMAC_MAC_CONFIG_TX_EN) &
> -             (v & NPCM_GMAC_MAC_CONFIG_TX_EN)) {
> -            gmac->regs[R_NPCM_DMA_HOST_TX_DESC] =
> -                gmac->regs[R_NPCM_DMA_TX_BASE_ADDR];
> -        }
> -
> -        /* If receive is being enabled for first time, update desc addr */
> -        if (~(prev & NPCM_GMAC_MAC_CONFIG_RX_EN) &
> -             (v & NPCM_GMAC_MAC_CONFIG_RX_EN)) {
> -            gmac->regs[R_NPCM_DMA_HOST_RX_DESC] =
> -                gmac->regs[R_NPCM_DMA_RX_BASE_ADDR];
> -        }
>          break;
>
>      case A_NPCM_GMAC_MII_ADDR:
> @@ -371,16 +355,6 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
>                            "%s: Write of read-only bits of reg: offset: 0x%04"
>                             HWADDR_PRIx ", value: 0x%04" PRIx64 "\n",
>                             DEVICE(gmac)->canonical_path, offset, v);
> -        } else {
> -            /* for W1c bits, implement W1C */
> -            gmac->regs[offset / sizeof(uint32_t)] &=
> -                ~NPCM_DMA_STATUS_W1C_MASK(v);
> -            if (v & NPCM_DMA_STATUS_NIS_BITS) {
> -                gmac->regs[offset / sizeof(uint32_t)] &= ~NPCM_DMA_STATUS_NIS;
> -            }
> -            if (v & NPCM_DMA_STATUS_AIS_BITS) {
> -                gmac->regs[offset / sizeof(uint32_t)] &= ~NPCM_DMA_STATUS_AIS;
> -            }
>          }
>          break;

Why has this code been deleted in this patch ?

>
> diff --git a/include/hw/net/npcm_gmac.h b/include/hw/net/npcm_gmac.h
> index e5729e83ea..c97eb6fe6e 100644
> --- a/include/hw/net/npcm_gmac.h
> +++ b/include/hw/net/npcm_gmac.h
> @@ -34,13 +34,15 @@ struct NPCMGMACRxDesc {
>  };
>
>  /* NPCMGMACRxDesc.flags values */
> -/* RDES2 and RDES3 are buffer address pointers */
> -/* Owner: 0 = software, 1 = gmac */
> -#define RX_DESC_RDES0_OWNER_MASK BIT(31)
> +/* RDES2 and RDES3 are buffer addresses */
> +/* Owner: 0 = software, 1 = dma */
> +#define RX_DESC_RDES0_OWN BIT(31)
>  /* Destination Address Filter Fail */
> -#define RX_DESC_RDES0_DEST_ADDR_FILT_FAIL_MASK BIT(30)
> -/* Frame length*/
> -#define RX_DESC_RDES0_FRAME_LEN_MASK(word) extract32(word, 16, 29)
> +#define RX_DESC_RDES0_DEST_ADDR_FILT_FAIL BIT(30)
> +/* Frame length */
> +#define RX_DESC_RDES0_FRAME_LEN_MASK(word) extract32(word, 16, 14)
> +/* Frame length Shift*/
> +#define RX_DESC_RDES0_FRAME_LEN_SHIFT 16
>  /* Error Summary */
>  #define RX_DESC_RDES0_ERR_SUMM_MASK BIT(15)
>  /* Descriptor Error */
> @@ -83,9 +85,9 @@ struct NPCMGMACRxDesc {
>  /* Receive Buffer 2 Size */
>  #define RX_DESC_RDES1_BFFR2_SZ_SHIFT 11
>  #define RX_DESC_RDES1_BFFR2_SZ_MASK(word) extract32(word, \
> -    RX_DESC_RDES1_BFFR2_SZ_SHIFT, 10 + RX_DESC_RDES1_BFFR2_SZ_SHIFT)
> +    RX_DESC_RDES1_BFFR2_SZ_SHIFT, 11)
>  /* Receive Buffer 1 Size */
> -#define RX_DESC_RDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 10)
> +#define RX_DESC_RDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 11)

More churn here. Please go through your whole patchset reading
each patch and making sure that you don't have anything where
an earlier patch adds in some code and then a later patch
changes the way it's written unnecessarily.

thanks
-- PMM
