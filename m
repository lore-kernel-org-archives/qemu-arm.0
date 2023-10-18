Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4288237ejc;
        Tue, 17 Oct 2023 17:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhLJEjPiATjf4lTxBUnd5SdYRXroH6GdKMJyHbU71eYex6sOdYb32T1YJam9jUMq6dHLbC
X-Received: by 2002:a05:6214:f0e:b0:655:e12d:d42d with SMTP id gw14-20020a0562140f0e00b00655e12dd42dmr4645234qvb.28.1697588375472;
        Tue, 17 Oct 2023 17:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697588375; cv=none;
        d=google.com; s=arc-20160816;
        b=xn8jWuJoE0aA2kfEZ3sVs3R8YfFdM3QEoBXplbrIMQlrsn1pmbfyetzOgrvFWQHWcW
         c6h2LosPgqlGU9ODDiesqeFHh8i+TnQQfYlsENcSaiZXEE8hC0nQKyZjHq0e+2TOTc6q
         k9kbSV++R7ZxCrvp/xnCCP9n0IOwcJqtsz+w3sSWT+4vU265GZTrvoHcGK/1L3VdNRmp
         wX6aYHEkIz7preDOVbF6bAELifnkhrdE2BnQ4gct42AOAjxe2bzdBfT+x+3mJwRH3wwm
         9+QFRi8WrIDR91ZpXVjeH3h5dN5fZJn8fmTq6j00PBzEyDCHiGuiR0hHpTqh8NPV2zxY
         Nq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1qV+acNGSlag8bDzEQfnwTLCDbdDDX2SGcE9J2EIIDE=;
        fh=cqIjlAi2zhmDjIzjdtteyLS7F+9TI9/jfANOVH19gSw=;
        b=w7Clw0uYdXdnsIbGN7wbYvBQxocKAlgHc8WdYbPe51p1pB+1Ya+ekWvwdvbdLL1B+a
         MKPAdAAAKo9WZkyQ1rCTAvp2Xqcn6c9SA+hSRPsmt+7Ug5ZCCz2kSwYqJ6kwWHxI/ttT
         imiTAlCCCrFGAHz8r1n9A+j3m9MZdmC86ffOLg2zO8dhnlsKYP+0xLdpn/EUZhqA7GiM
         vlg40Bpr3qwqWE1pCQk/SJBkbzVKFCDzIINaKn2nH2fMY7STQaQpX11ONhJk9GVf0qzo
         QDQmIbySUca4LeohIHlHqLWxv/5fe92HkHPn6YcIUESWC+4VWmI1QP8Q3HxVUSSVuri2
         JIIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=35kY5733;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do16-20020a056214097000b0066d1e996109si1847236qvb.500.2023.10.17.17.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 17:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=35kY5733;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsuHC-0005fU-EB; Tue, 17 Oct 2023 20:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1qsuHA-0005ex-7C
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 20:19:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1qsuH7-0007Pw-8M
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 20:19:03 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40837124e1cso23885e9.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 17:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697588339; x=1698193139; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1qV+acNGSlag8bDzEQfnwTLCDbdDDX2SGcE9J2EIIDE=;
 b=35kY5733OAS0Z7hiKXW/T9j3BKUpduwmXcqY4pyP85yHAqNfS3f6QoFGoRLlPJBnb3
 6jLxGb0RF0AFEDoFsfG7uWN/LLTAIXIh5plzgQkfptn0hJnUR+DSDbAN/Lg6Q92un3Vt
 YGsm8Ii7bhTOVYDFb+uiiJpxyzRzPXX4EcVdzPQebJQO8pSNPFg0MArX5nwgn1Q/KGdg
 EDK0IVDNO3FpJyruLTJbqqf9ZJeU7VXpYVPokkDk5HDS5hwo4lF4gTmfdIAHgs3EM6Tu
 rWKwKMWtvjGPsUSf6dddu5NGNJh8boJFMe7+831v0W+yhGHPhtcYWPbMdKddA5FwIiF6
 NkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697588339; x=1698193139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1qV+acNGSlag8bDzEQfnwTLCDbdDDX2SGcE9J2EIIDE=;
 b=GwjB7YZA8I0gJ7fZvLZGgRTBUdKcS7Kqu2avkSaSwGtbJV4WInl0jQ9kONQL6t/hCv
 g/iQSNTnf680eaGq9Rt4vnDcReQrUteNn0UH5+/4IEZq7F/eWOZt6hlbbclE4tji5657
 V68lMZH/zNO7cBofTMPsL9A7HFQCdaX7DjaeRQ1Ttf2AJf2iRlJx+m+udkCIqJWRiEVf
 kQmmQMzmEkcRLN6U/2Or/9L6+9I2o9biNgZZfCAFBye+Tq1FNSqUPuqtRkeY1XUGzrHH
 J+kVD2oS39v1CRjYBb00nGTwJ4sBBVeN+iv8ouyjBwDNQICHyHLVM+5ebeMULE78ZC1z
 plUw==
X-Gm-Message-State: AOJu0YwDWHMpNeKfEOQTjsOab7lxSXoEkM8bWzivT7mvvbQYbSmr9byG
 Ep1tnX+l9gz+YClUoryDKbdrv0mGQXhODPDZ81KXcA==
X-Received: by 2002:a05:600c:3b20:b0:404:74f8:f47c with SMTP id
 m32-20020a05600c3b2000b0040474f8f47cmr33799wms.5.1697588339559; Tue, 17 Oct
 2023 17:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231017230342.311227-1-nabihestefan@google.com>
 <20231017230342.311227-9-nabihestefan@google.com>
In-Reply-To: <20231017230342.311227-9-nabihestefan@google.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 17 Oct 2023 17:18:47 -0700
Message-ID: <CAGcCb13RV_pd3cdYURDGZd8RKmum0i7BPwWt4FEuf8d_PHrj9g@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] hw/net: General GMAC Implementation
To: Nabih Estefan <nabihestefan@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 kfting@nuvoton.com, jasonwang@redhat.com, avi.fishman@nuvoton.com
Content-Type: multipart/alternative; boundary="000000000000f4bf590607f295f3"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=wuhaotsh@google.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UPPERCASE_50_75=0.008,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: f9llfuyzYAUa

--000000000000f4bf590607f295f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 4:04=E2=80=AFPM Nabih Estefan <nabihestefan@google.=
com>
wrote:

> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
> - General GMAC Register handling
> - GMAC IRQ Handling
> - Added traces in some methods for debugging
> - Lots of declarations for accessing information on GMAC Descriptors
> (npcm_gmac.h file)
>
> NOTE: With code on this state, the GMAC can boot-up properly and will sho=
w
> up in the ifconfig command on the BMC
>
> Google-Rebase-Count: 1
> Signed-off-by: Nabih Estefan Diaz <nabihestefan@google.com>
> Google-Bug-Id: 237557100
> Change-Id: I3a4332ee5bab31b919782031a77c5b943f45ca2f
>
Please remove the Google-specific hashes. (Only signed-off-by is needed.)

> ---
>  include/hw/net/npcm_gmac.h | 198 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 184 insertions(+), 14 deletions(-)
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
> -/* Owner: 0 =3D software, 1 =3D gmac */
> -#define RX_DESC_RDES0_OWNER_MASK BIT(31)
> +/* RDES2 and RDES3 are buffer addresses */
> +/* Owner: 0 =3D software, 1 =3D dma */
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
>
>
>  struct NPCMGMACTxDesc {
> @@ -96,9 +98,9 @@ struct NPCMGMACTxDesc {
>  };
>
>  /* NPCMGMACTxDesc.flags values */
> -/* TDES2 and TDES3 are buffer address pointers */
> +/* TDES2 and TDES3 are buffer addresses */
>  /* Owner: 0 =3D software, 1 =3D gmac */
> -#define TX_DESC_TDES0_OWNER_MASK BIT(31)
> +#define TX_DESC_TDES0_OWN BIT(31)
>  /* Tx Time Stamp Status */
>  #define TX_DESC_TDES0_TTSS_MASK BIT(17)
>  /* IP Header Error */
> @@ -122,7 +124,7 @@ struct NPCMGMACTxDesc {
>  /* VLAN Frame */
>  #define TX_DESC_TDES0_VLAN_FRM_MASK BIT(7)
>  /* Collision Count */
> -#define TX_DESC_TDES0_COLL_CNT_MASK(word) extract32(word, 3, 6)
> +#define TX_DESC_TDES0_COLL_CNT_MASK(word) extract32(word, 3, 4)
>  /* Excessive Deferral */
>  #define TX_DESC_TDES0_EXCS_DEF_MASK BIT(2)
>  /* Underflow Error */
> @@ -137,7 +139,7 @@ struct NPCMGMACTxDesc {
>  /* Last Segment */
>  #define TX_DESC_TDES1_FIRST_SEG_MASK BIT(29)
>  /* Checksum Insertion Control */
> -#define TX_DESC_TDES1_CHKSM_INS_CTRL_MASK(word) extract32(word, 27, 28)
> +#define TX_DESC_TDES1_CHKSM_INS_CTRL_MASK(word) extract32(word, 27, 2)
>  /* Disable Cyclic Redundancy Check */
>  #define TX_DESC_TDES1_DIS_CDC_MASK BIT(26)
>  /* Transmit End of Ring */
> @@ -145,9 +147,9 @@ struct NPCMGMACTxDesc {
>  /* Secondary Address Chained */
>  #define TX_DESC_TDES1_SEC_ADDR_CHND_MASK BIT(24)
>  /* Transmit Buffer 2 Size */
> -#define TX_DESC_TDES1_BFFR2_SZ_MASK(word) extract32(word, 11, 21)
> +#define TX_DESC_TDES1_BFFR2_SZ_MASK(word) extract32(word, 11, 11)
>  /* Transmit Buffer 1 Size */
> -#define TX_DESC_TDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 10)
> +#define TX_DESC_TDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 11)
>
>  typedef struct NPCMGMACState {
>      SysBusDevice parent;
> @@ -165,4 +167,172 @@ typedef struct NPCMGMACState {
>  #define TYPE_NPCM_GMAC "npcm-gmac"
>  OBJECT_DECLARE_SIMPLE_TYPE(NPCMGMACState, NPCM_GMAC)
>
> +/* Mask for RO bits in Status */
> +#define NPCM_DMA_STATUS_RO_MASK(word) (word & 0xfffe0000)
> +/* Mask for RO bits in Status */
> +#define NPCM_DMA_STATUS_W1C_MASK(word) (word & 0x1e7ff)
> +
> +/* Transmit Process State */
> +#define NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT 20
> +/* Transmit States */
> +#define NPCM_DMA_STATUS_TX_STOPPED_STATE \
> +    (0b000 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_TX_RUNNING_FETCHING_STATE \
> +    (0b001 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_TX_RUNNING_WAITING_STATE \
> +    (0b010 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_TX_RUNNING_READ_STATE \
> +    (0b011 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_TX_SUSPENDED_STATE \
> +    (0b110 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_TX_RUNNING_CLOSING_STATE \
> +    (0b111 << NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)
> +/* Transmit Process State */
> +#define NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT 17
> +/* Receive States */
> +#define NPCM_DMA_STATUS_RX_STOPPED_STATE \
> +    (0b000 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_RX_RUNNING_FETCHING_STATE \
> +    (0b001 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_RX_RUNNING_WAITING_STATE \
> +    (0b011 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_RX_SUSPENDED_STATE \
> +    (0b100 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_RX_RUNNING_CLOSING_STATE \
> +    (0b101 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
> +#define NPCM_DMA_STATUS_RX_RUNNING_TRANSFERRING_STATE \
> +    (0b111 << NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)
> +
> +
> +/* Early Receive Interrupt */
> +#define NPCM_DMA_STATUS_ERI BIT(14)
> +/* Fatal Bus Error Interrupt */
> +#define NPCM_DMA_STATUS_FBI BIT(13)
> +/* Early transmit Interrupt */
> +#define NPCM_DMA_STATUS_ETI BIT(10)
> +/* Receive Watchdog Timout */
> +#define NPCM_DMA_STATUS_RWT BIT(9)
> +/* Receive Process Stopped */
> +#define NPCM_DMA_STATUS_RPS BIT(8)
> +/* Receive Buffer Unavailable */
> +#define NPCM_DMA_STATUS_RU BIT(7)
> +/* Receive Interrupt */
> +#define NPCM_DMA_STATUS_RI BIT(6)
> +/* Transmit Underflow */
> +#define NPCM_DMA_STATUS_UNF BIT(5)
> +/* Receive Overflow */
> +#define NPCM_DMA_STATUS_OVF BIT(4)
> +/* Transmit Jabber Timeout */
> +#define NPCM_DMA_STATUS_TJT BIT(3)
> +/* Transmit Buffer Unavailable */
> +#define NPCM_DMA_STATUS_TU BIT(2)
> +/* Transmit Process Stopped */
> +#define NPCM_DMA_STATUS_TPS BIT(1)
> +/* Transmit Interrupt */
> +#define NPCM_DMA_STATUS_TI BIT(0)
> +
> +/* Normal Interrupt Summary */
> +#define NPCM_DMA_STATUS_NIS BIT(16)
> +/* Interrupts enabled by NIE */
> +#define NPCM_DMA_STATUS_NIS_BITS (NPCM_DMA_STATUS_TI | \
> +                                  NPCM_DMA_STATUS_TU | \
> +                                  NPCM_DMA_STATUS_RI | \
> +                                  NPCM_DMA_STATUS_ERI)
> +/* Abnormal Interrupt Summary */
> +#define NPCM_DMA_STATUS_AIS BIT(15)
> +/* Interrupts enabled by AIE */
> +#define NPCM_DMA_STATUS_AIS_BITS (NPCM_DMA_STATUS_TPS | \
> +                                  NPCM_DMA_STATUS_TJT | \
> +                                  NPCM_DMA_STATUS_OVF | \
> +                                  NPCM_DMA_STATUS_UNF | \
> +                                  NPCM_DMA_STATUS_RU  | \
> +                                  NPCM_DMA_STATUS_RPS | \
> +                                  NPCM_DMA_STATUS_RWT | \
> +                                  NPCM_DMA_STATUS_ETI | \
> +                                  NPCM_DMA_STATUS_FBI)
> +
> +/* Early Receive Interrupt Enable */
> +#define NPCM_DMA_INTR_ENAB_ERE BIT(14)
> +/* Fatal Bus Error Interrupt Enable */
> +#define NPCM_DMA_INTR_ENAB_FBE BIT(13)
> +/* Early transmit Interrupt Enable */
> +#define NPCM_DMA_INTR_ENAB_ETE BIT(10)
> +/* Receive Watchdog Timout Enable */
> +#define NPCM_DMA_INTR_ENAB_RWE BIT(9)
> +/* Receive Process Stopped Enable */
> +#define NPCM_DMA_INTR_ENAB_RSE BIT(8)
> +/* Receive Buffer Unavailable Enable */
> +#define NPCM_DMA_INTR_ENAB_RUE BIT(7)
> +/* Receive Interrupt Enable */
> +#define NPCM_DMA_INTR_ENAB_RIE BIT(6)
> +/* Transmit Underflow Enable */
> +#define NPCM_DMA_INTR_ENAB_UNE BIT(5)
> +/* Receive Overflow Enable */
> +#define NPCM_DMA_INTR_ENAB_OVE BIT(4)
> +/* Transmit Jabber Timeout Enable */
> +#define NPCM_DMA_INTR_ENAB_TJE BIT(3)
> +/* Transmit Buffer Unavailable Enable */
> +#define NPCM_DMA_INTR_ENAB_TUE BIT(2)
> +/* Transmit Process Stopped Enable */
> +#define NPCM_DMA_INTR_ENAB_TSE BIT(1)
> +/* Transmit Interrupt Enable */
> +#define NPCM_DMA_INTR_ENAB_TIE BIT(0)
> +
> +/* Normal Interrupt Summary Enable */
> +#define NPCM_DMA_INTR_ENAB_NIE BIT(16)
> +/* Interrupts enabled by NIE Enable */
> +#define NPCM_DMA_INTR_ENAB_NIE_BITS (NPCM_DMA_INTR_ENAB_TIE | \
> +                                     NPCM_DMA_INTR_ENAB_TUE | \
> +                                     NPCM_DMA_INTR_ENAB_RIE | \
> +                                     NPCM_DMA_INTR_ENAB_ERE)
> +/* Abnormal Interrupt Summary Enable */
> +#define NPCM_DMA_INTR_ENAB_AIE BIT(15)
> +/* Interrupts enabled by AIE Enable */
> +#define NPCM_DMA_INTR_ENAB_AIE_BITS (NPCM_DMA_INTR_ENAB_TSE | \
> +                                     NPCM_DMA_INTR_ENAB_TJE | \
> +                                     NPCM_DMA_INTR_ENAB_OVE | \
> +                                     NPCM_DMA_INTR_ENAB_UNE | \
> +                                     NPCM_DMA_INTR_ENAB_RUE | \
> +                                     NPCM_DMA_INTR_ENAB_RSE | \
> +                                     NPCM_DMA_INTR_ENAB_RWE | \
> +                                     NPCM_DMA_INTR_ENAB_ETE | \
> +                                     NPCM_DMA_INTR_ENAB_FBE)
> +
> +/* Flushing Disabled */
> +#define NPCM_DMA_CONTROL_FLUSH_MASK BIT(24)
> +/* Start/stop Transmit */
> +#define NPCM_DMA_CONTROL_START_STOP_TX BIT(13)
> +/* Next receive descriptor start address */
> +#define NPCM_DMA_HOST_RX_DESC_MASK(word) ((uint32_t) (word) & ~3u)
> +/* Next transmit descriptor start address */
> +#define NPCM_DMA_HOST_TX_DESC_MASK(word) ((uint32_t) (word) & ~3u)
> +
> +/* Receive enable */
> +#define NPCM_GMAC_MAC_CONFIG_RX_EN BIT(2)
> +/* Transmit enable */
> +#define NPCM_GMAC_MAC_CONFIG_TX_EN BIT(3)
> +
> +/* Frame Receive All */
> +#define NPCM_GMAC_FRAME_FILTER_REC_ALL_MASK BIT(31)
> +/* Frame HPF Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_HPF_MASK BIT(10)
> +/* Frame SAF Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_SAF_MASK BIT(9)
> +/* Frame SAIF Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_SAIF_MASK BIT(8)
> +/* Frame PCF Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_PCF_MASK BIT(word) extract32((word), 6, 2=
)
> +/* Frame DBF Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_DBF_MASK BIT(5)
> +/* Frame PM Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_PM_MASK BIT(4)
> +/* Frame DAIF Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_DAIF_MASK BIT(3)
> +/* Frame HMC Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_HMC_MASK BIT(2)
> +/* Frame HUC Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_HUC_MASK BIT(1)
> +/* Frame PR Filter*/
> +#define NPCM_GMAC_FRAME_FILTER_PR_MASK BIT(0)
> +
>  #endif /* NPCM_GMAC_H */
> --
> 2.42.0.655.g421f12c284-goog
>
>

--000000000000f4bf590607f295f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 17, 2023 at 4:04=E2=80=AF=
PM Nabih Estefan &lt;<a href=3D"mailto:nabihestefan@google.com">nabihestefa=
n@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Nabih Estefan Diaz &lt;<a href=3D"mailto:nabihestefan@goo=
gle.com" target=3D"_blank">nabihestefan@google.com</a>&gt;<br>
<br>
- General GMAC Register handling<br>
- GMAC IRQ Handling<br>
- Added traces in some methods for debugging<br>
- Lots of declarations for accessing information on GMAC Descriptors (npcm_=
gmac.h file)<br>
<br>
NOTE: With code on this state, the GMAC can boot-up properly and will show =
up in the ifconfig command on the BMC<br>
<br>
Google-Rebase-Count: 1<br>
Signed-off-by: Nabih Estefan Diaz &lt;<a href=3D"mailto:nabihestefan@google=
.com" target=3D"_blank">nabihestefan@google.com</a>&gt;<br>
Google-Bug-Id: 237557100<br>
Change-Id: I3a4332ee5bab31b919782031a77c5b943f45ca2f<br></blockquote><div>P=
lease remove the Google-specific hashes. (Only signed-off-by is needed.)=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/hw/net/npcm_gmac.h | 198 ++++++++++++++++++++++++++++++++++--=
-<br>
=C2=A01 file changed, 184 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/include/hw/net/npcm_gmac.h b/include/hw/net/npcm_gmac.h<br>
index e5729e83ea..c97eb6fe6e 100644<br>
--- a/include/hw/net/npcm_gmac.h<br>
+++ b/include/hw/net/npcm_gmac.h<br>
@@ -34,13 +34,15 @@ struct NPCMGMACRxDesc {<br>
=C2=A0};<br>
<br>
=C2=A0/* NPCMGMACRxDesc.flags values */<br>
-/* RDES2 and RDES3 are buffer address pointers */<br>
-/* Owner: 0 =3D software, 1 =3D gmac */<br>
-#define RX_DESC_RDES0_OWNER_MASK BIT(31)<br>
+/* RDES2 and RDES3 are buffer addresses */<br>
+/* Owner: 0 =3D software, 1 =3D dma */<br>
+#define RX_DESC_RDES0_OWN BIT(31)<br>
=C2=A0/* Destination Address Filter Fail */<br>
-#define RX_DESC_RDES0_DEST_ADDR_FILT_FAIL_MASK BIT(30)<br>
-/* Frame length*/<br>
-#define RX_DESC_RDES0_FRAME_LEN_MASK(word) extract32(word, 16, 29)<br>
+#define RX_DESC_RDES0_DEST_ADDR_FILT_FAIL BIT(30)<br>
+/* Frame length */<br>
+#define RX_DESC_RDES0_FRAME_LEN_MASK(word) extract32(word, 16, 14)<br>
+/* Frame length Shift*/<br>
+#define RX_DESC_RDES0_FRAME_LEN_SHIFT 16<br>
=C2=A0/* Error Summary */<br>
=C2=A0#define RX_DESC_RDES0_ERR_SUMM_MASK BIT(15)<br>
=C2=A0/* Descriptor Error */<br>
@@ -83,9 +85,9 @@ struct NPCMGMACRxDesc {<br>
=C2=A0/* Receive Buffer 2 Size */<br>
=C2=A0#define RX_DESC_RDES1_BFFR2_SZ_SHIFT 11<br>
=C2=A0#define RX_DESC_RDES1_BFFR2_SZ_MASK(word) extract32(word, \<br>
-=C2=A0 =C2=A0 RX_DESC_RDES1_BFFR2_SZ_SHIFT, 10 + RX_DESC_RDES1_BFFR2_SZ_SH=
IFT)<br>
+=C2=A0 =C2=A0 RX_DESC_RDES1_BFFR2_SZ_SHIFT, 11)<br>
=C2=A0/* Receive Buffer 1 Size */<br>
-#define RX_DESC_RDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 10)<br>
+#define RX_DESC_RDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 11)<br>
<br>
<br>
=C2=A0struct NPCMGMACTxDesc {<br>
@@ -96,9 +98,9 @@ struct NPCMGMACTxDesc {<br>
=C2=A0};<br>
<br>
=C2=A0/* NPCMGMACTxDesc.flags values */<br>
-/* TDES2 and TDES3 are buffer address pointers */<br>
+/* TDES2 and TDES3 are buffer addresses */<br>
=C2=A0/* Owner: 0 =3D software, 1 =3D gmac */<br>
-#define TX_DESC_TDES0_OWNER_MASK BIT(31)<br>
+#define TX_DESC_TDES0_OWN BIT(31)<br>
=C2=A0/* Tx Time Stamp Status */<br>
=C2=A0#define TX_DESC_TDES0_TTSS_MASK BIT(17)<br>
=C2=A0/* IP Header Error */<br>
@@ -122,7 +124,7 @@ struct NPCMGMACTxDesc {<br>
=C2=A0/* VLAN Frame */<br>
=C2=A0#define TX_DESC_TDES0_VLAN_FRM_MASK BIT(7)<br>
=C2=A0/* Collision Count */<br>
-#define TX_DESC_TDES0_COLL_CNT_MASK(word) extract32(word, 3, 6)<br>
+#define TX_DESC_TDES0_COLL_CNT_MASK(word) extract32(word, 3, 4)<br>
=C2=A0/* Excessive Deferral */<br>
=C2=A0#define TX_DESC_TDES0_EXCS_DEF_MASK BIT(2)<br>
=C2=A0/* Underflow Error */<br>
@@ -137,7 +139,7 @@ struct NPCMGMACTxDesc {<br>
=C2=A0/* Last Segment */<br>
=C2=A0#define TX_DESC_TDES1_FIRST_SEG_MASK BIT(29)<br>
=C2=A0/* Checksum Insertion Control */<br>
-#define TX_DESC_TDES1_CHKSM_INS_CTRL_MASK(word) extract32(word, 27, 28)<br=
>
+#define TX_DESC_TDES1_CHKSM_INS_CTRL_MASK(word) extract32(word, 27, 2)<br>
=C2=A0/* Disable Cyclic Redundancy Check */<br>
=C2=A0#define TX_DESC_TDES1_DIS_CDC_MASK BIT(26)<br>
=C2=A0/* Transmit End of Ring */<br>
@@ -145,9 +147,9 @@ struct NPCMGMACTxDesc {<br>
=C2=A0/* Secondary Address Chained */<br>
=C2=A0#define TX_DESC_TDES1_SEC_ADDR_CHND_MASK BIT(24)<br>
=C2=A0/* Transmit Buffer 2 Size */<br>
-#define TX_DESC_TDES1_BFFR2_SZ_MASK(word) extract32(word, 11, 21)<br>
+#define TX_DESC_TDES1_BFFR2_SZ_MASK(word) extract32(word, 11, 11)<br>
=C2=A0/* Transmit Buffer 1 Size */<br>
-#define TX_DESC_TDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 10)<br>
+#define TX_DESC_TDES1_BFFR1_SZ_MASK(word) extract32(word, 0, 11)<br>
<br>
=C2=A0typedef struct NPCMGMACState {<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice parent;<br>
@@ -165,4 +167,172 @@ typedef struct NPCMGMACState {<br>
=C2=A0#define TYPE_NPCM_GMAC &quot;npcm-gmac&quot;<br>
=C2=A0OBJECT_DECLARE_SIMPLE_TYPE(NPCMGMACState, NPCM_GMAC)<br>
<br>
+/* Mask for RO bits in Status */<br>
+#define NPCM_DMA_STATUS_RO_MASK(word) (word &amp; 0xfffe0000)<br>
+/* Mask for RO bits in Status */<br>
+#define NPCM_DMA_STATUS_W1C_MASK(word) (word &amp; 0x1e7ff)<br>
+<br>
+/* Transmit Process State */<br>
+#define NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT 20<br>
+/* Transmit States */<br>
+#define NPCM_DMA_STATUS_TX_STOPPED_STATE \<br>
+=C2=A0 =C2=A0 (0b000 &lt;&lt; NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_TX_RUNNING_FETCHING_STATE \<br>
+=C2=A0 =C2=A0 (0b001 &lt;&lt; NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_TX_RUNNING_WAITING_STATE \<br>
+=C2=A0 =C2=A0 (0b010 &lt;&lt; NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_TX_RUNNING_READ_STATE \<br>
+=C2=A0 =C2=A0 (0b011 &lt;&lt; NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_TX_SUSPENDED_STATE \<br>
+=C2=A0 =C2=A0 (0b110 &lt;&lt; NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_TX_RUNNING_CLOSING_STATE \<br>
+=C2=A0 =C2=A0 (0b111 &lt;&lt; NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT)<br>
+/* Transmit Process State */<br>
+#define NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT 17<br>
+/* Receive States */<br>
+#define NPCM_DMA_STATUS_RX_STOPPED_STATE \<br>
+=C2=A0 =C2=A0 (0b000 &lt;&lt; NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_RX_RUNNING_FETCHING_STATE \<br>
+=C2=A0 =C2=A0 (0b001 &lt;&lt; NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_RX_RUNNING_WAITING_STATE \<br>
+=C2=A0 =C2=A0 (0b011 &lt;&lt; NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_RX_SUSPENDED_STATE \<br>
+=C2=A0 =C2=A0 (0b100 &lt;&lt; NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_RX_RUNNING_CLOSING_STATE \<br>
+=C2=A0 =C2=A0 (0b101 &lt;&lt; NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)<br>
+#define NPCM_DMA_STATUS_RX_RUNNING_TRANSFERRING_STATE \<br>
+=C2=A0 =C2=A0 (0b111 &lt;&lt; NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT)<br>
+<br>
+<br>
+/* Early Receive Interrupt */<br>
+#define NPCM_DMA_STATUS_ERI BIT(14)<br>
+/* Fatal Bus Error Interrupt */<br>
+#define NPCM_DMA_STATUS_FBI BIT(13)<br>
+/* Early transmit Interrupt */<br>
+#define NPCM_DMA_STATUS_ETI BIT(10)<br>
+/* Receive Watchdog Timout */<br>
+#define NPCM_DMA_STATUS_RWT BIT(9)<br>
+/* Receive Process Stopped */<br>
+#define NPCM_DMA_STATUS_RPS BIT(8)<br>
+/* Receive Buffer Unavailable */<br>
+#define NPCM_DMA_STATUS_RU BIT(7)<br>
+/* Receive Interrupt */<br>
+#define NPCM_DMA_STATUS_RI BIT(6)<br>
+/* Transmit Underflow */<br>
+#define NPCM_DMA_STATUS_UNF BIT(5)<br>
+/* Receive Overflow */<br>
+#define NPCM_DMA_STATUS_OVF BIT(4)<br>
+/* Transmit Jabber Timeout */<br>
+#define NPCM_DMA_STATUS_TJT BIT(3)<br>
+/* Transmit Buffer Unavailable */<br>
+#define NPCM_DMA_STATUS_TU BIT(2)<br>
+/* Transmit Process Stopped */<br>
+#define NPCM_DMA_STATUS_TPS BIT(1)<br>
+/* Transmit Interrupt */<br>
+#define NPCM_DMA_STATUS_TI BIT(0)<br>
+<br>
+/* Normal Interrupt Summary */<br>
+#define NPCM_DMA_STATUS_NIS BIT(16)<br>
+/* Interrupts enabled by NIE */<br>
+#define NPCM_DMA_STATUS_NIS_BITS (NPCM_DMA_STATUS_TI | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_TU | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_RI | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_ERI)<br>
+/* Abnormal Interrupt Summary */<br>
+#define NPCM_DMA_STATUS_AIS BIT(15)<br>
+/* Interrupts enabled by AIE */<br>
+#define NPCM_DMA_STATUS_AIS_BITS (NPCM_DMA_STATUS_TPS | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_TJT | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_OVF | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_UNF | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_RU=C2=A0 | \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_RPS | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_RWT | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_ETI | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_DMA_STATUS_FBI)<br>
+<br>
+/* Early Receive Interrupt Enable */<br>
+#define NPCM_DMA_INTR_ENAB_ERE BIT(14)<br>
+/* Fatal Bus Error Interrupt Enable */<br>
+#define NPCM_DMA_INTR_ENAB_FBE BIT(13)<br>
+/* Early transmit Interrupt Enable */<br>
+#define NPCM_DMA_INTR_ENAB_ETE BIT(10)<br>
+/* Receive Watchdog Timout Enable */<br>
+#define NPCM_DMA_INTR_ENAB_RWE BIT(9)<br>
+/* Receive Process Stopped Enable */<br>
+#define NPCM_DMA_INTR_ENAB_RSE BIT(8)<br>
+/* Receive Buffer Unavailable Enable */<br>
+#define NPCM_DMA_INTR_ENAB_RUE BIT(7)<br>
+/* Receive Interrupt Enable */<br>
+#define NPCM_DMA_INTR_ENAB_RIE BIT(6)<br>
+/* Transmit Underflow Enable */<br>
+#define NPCM_DMA_INTR_ENAB_UNE BIT(5)<br>
+/* Receive Overflow Enable */<br>
+#define NPCM_DMA_INTR_ENAB_OVE BIT(4)<br>
+/* Transmit Jabber Timeout Enable */<br>
+#define NPCM_DMA_INTR_ENAB_TJE BIT(3)<br>
+/* Transmit Buffer Unavailable Enable */<br>
+#define NPCM_DMA_INTR_ENAB_TUE BIT(2)<br>
+/* Transmit Process Stopped Enable */<br>
+#define NPCM_DMA_INTR_ENAB_TSE BIT(1)<br>
+/* Transmit Interrupt Enable */<br>
+#define NPCM_DMA_INTR_ENAB_TIE BIT(0)<br>
+<br>
+/* Normal Interrupt Summary Enable */<br>
+#define NPCM_DMA_INTR_ENAB_NIE BIT(16)<br>
+/* Interrupts enabled by NIE Enable */<br>
+#define NPCM_DMA_INTR_ENAB_NIE_BITS (NPCM_DMA_INTR_ENAB_TIE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_TUE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_RIE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_ERE)<br>
+/* Abnormal Interrupt Summary Enable */<br>
+#define NPCM_DMA_INTR_ENAB_AIE BIT(15)<br>
+/* Interrupts enabled by AIE Enable */<br>
+#define NPCM_DMA_INTR_ENAB_AIE_BITS (NPCM_DMA_INTR_ENAB_TSE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_TJE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_OVE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_UNE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_RUE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_RSE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_RWE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_ETE | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_DMA_INTR_EN=
AB_FBE)<br>
+<br>
+/* Flushing Disabled */<br>
+#define NPCM_DMA_CONTROL_FLUSH_MASK BIT(24)<br>
+/* Start/stop Transmit */<br>
+#define NPCM_DMA_CONTROL_START_STOP_TX BIT(13)<br>
+/* Next receive descriptor start address */<br>
+#define NPCM_DMA_HOST_RX_DESC_MASK(word) ((uint32_t) (word) &amp; ~3u)<br>
+/* Next transmit descriptor start address */<br>
+#define NPCM_DMA_HOST_TX_DESC_MASK(word) ((uint32_t) (word) &amp; ~3u)<br>
+<br>
+/* Receive enable */<br>
+#define NPCM_GMAC_MAC_CONFIG_RX_EN BIT(2)<br>
+/* Transmit enable */<br>
+#define NPCM_GMAC_MAC_CONFIG_TX_EN BIT(3)<br>
+<br>
+/* Frame Receive All */<br>
+#define NPCM_GMAC_FRAME_FILTER_REC_ALL_MASK BIT(31)<br>
+/* Frame HPF Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_HPF_MASK BIT(10)<br>
+/* Frame SAF Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_SAF_MASK BIT(9)<br>
+/* Frame SAIF Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_SAIF_MASK BIT(8)<br>
+/* Frame PCF Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_PCF_MASK BIT(word) extract32((word), 6, 2)<=
br>
+/* Frame DBF Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_DBF_MASK BIT(5)<br>
+/* Frame PM Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_PM_MASK BIT(4)<br>
+/* Frame DAIF Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_DAIF_MASK BIT(3)<br>
+/* Frame HMC Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_HMC_MASK BIT(2)<br>
+/* Frame HUC Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_HUC_MASK BIT(1)<br>
+/* Frame PR Filter*/<br>
+#define NPCM_GMAC_FRAME_FILTER_PR_MASK BIT(0)<br>
+<br>
=C2=A0#endif /* NPCM_GMAC_H */<br>
-- <br>
2.42.0.655.g421f12c284-goog<br>
<br>
</blockquote></div></div>

--000000000000f4bf590607f295f3--
