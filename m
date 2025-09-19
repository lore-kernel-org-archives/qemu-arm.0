Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDAFCAC5A5
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Sep 2025 08:07:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzW8C-00059q-UY; Fri, 19 Sep 2025 04:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uzW8B-00058M-F7
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 04:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uzW87-0006zb-Cg
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 04:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758269166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YKz20iASh/D67u7j+nz5UUJq2bajc8DmVciDI/JvwOk=;
 b=g9K33qcLDH5eFLmuncFYnbIA1KGiAp2YDhbdCxywdSzTSJqszasievhzD6Gcu02S+UxDtB
 nHtTvFnZTMrCAHXqH9ajARTaf0EP73jHNegSNV/qZYK4FuB/KCYZPZ4h5xP2lFjOvC1GEZ
 kT2kIKkpYb5tQBaBydMhcUpFZFRl/mw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-ZsdeHTtgOoa31RXKqroqUA-1; Fri, 19 Sep 2025 04:06:03 -0400
X-MC-Unique: ZsdeHTtgOoa31RXKqroqUA-1
X-Mimecast-MFC-AGG-ID: ZsdeHTtgOoa31RXKqroqUA_1758269163
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3df07c967e9so955635f8f.2
 for <qemu-arm@nongnu.org>; Fri, 19 Sep 2025 01:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758269162; x=1758873962;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKz20iASh/D67u7j+nz5UUJq2bajc8DmVciDI/JvwOk=;
 b=qsKNDvxmhdZF5kCjeE7dfC+oU/AdVF8/bXGDA8/RyfIn/IOZkekEgQCCyYGJy22+nY
 eb+3NOlwom5+P7VAWVKSo+CFK3TXfxjr91GgAK7fvWo7nTtkCl/KA14VjMq0/vuAvcQm
 wWLzmVdvAFHRRce/1oqPeizve5lVEyDYEcTFEbVthGlOgn15KbUdo3WtwHgAlMVqE7nz
 3Oe05YRF5bZHVX/qpsu8WYCfImcO3VzPh4msdoRKi5hybj5zYWqMTq2pGcpOMeXDJP29
 Rrpe8IEleAmXMTSTq4XepWyyXQtq4nHQgWZk0mfB+uqsObidQsMp9jE+/XAgM5BlxgDM
 dS4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlBU543g03jsxBt9vhBfDsv7lTu332dCKWLHiKIBbJ+42iHPWFk4LfkWGyWVFjmLFTfb+XdS1SBw==@nongnu.org
X-Gm-Message-State: AOJu0YzJK8GawRGbd2RP7ZNgAxmPffPQz6deaENlT/0Pc8Pz4cdzWHIV
 m1tEYAqNJCMS46JPRaOSmaAojV/XlF6+idOlZe2UxvaQVt0sRV3YIFjEdFX6daSHBbVIiEnVReR
 8LKqA0gsVQrR4TLxqfMlmi9t35yiumHoCmCT2DtBCpWh9jfLmwTU1dQ==
X-Gm-Gg: ASbGncv/o+tIBjTFssd2Rxd+2+eg6RbJGeCNiz7qaHyE/JTiLy5Vsp/14SzzJETTGLw
 h7fchS24thoFytMCK5/CKwAcQTHdpWoZOsWYTgi7bdaLHkikKQVFnCI3DvtB0hwBc9CCn/H/QFr
 ZjrSq1o/C9J3N01msrmm3dTK/GIic+LeVO7kJHmMevfN+q3QDaTy5vOFmpxGe0UiDypYBwcRtx/
 I951xvXd0aAIRX74ytC4UWoCkaSmHK1/yc5wfleMJVMZjjyDpCmDhy0CpRkwOSf0bUwuWugz6/T
 y6EoTetmr87lhugG3VbsMhnRyVuKp5rfUe9MPXNXwSVR1LMqBb89eQpzD1BhAtBgm94DqJ7E+3q
 Hz3A=
X-Received: by 2002:a05:6000:2891:b0:3ea:b91f:8f4e with SMTP id
 ffacd0b85a97d-3ee7e10617amr1784117f8f.21.1758269162438; 
 Fri, 19 Sep 2025 01:06:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3/JHcMV9Xmoj0vXYpV4orcUJAn9AYZrdS7EdBRHcoLc+jBOY/aPYLgEhj5/BGmTs4bwOWTw==
X-Received: by 2002:a05:6000:2891:b0:3ea:b91f:8f4e with SMTP id
 ffacd0b85a97d-3ee7e10617amr1784072f8f.21.1758269161907; 
 Fri, 19 Sep 2025 01:06:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbc7284sm6790274f8f.33.2025.09.19.01.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:06:01 -0700 (PDT)
Message-ID: <88839f9a-073d-40bd-a6f6-a9cefa64595a@redhat.com>
Date: Fri, 19 Sep 2025 10:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v4 09/14] hw/pci-host/aspeed: Add AST2700 PCIe PHY
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com, wuhaotsh@google.com,
 titusr@google.com
References: <20250919032431.3316764-1-jamin_lin@aspeedtech.com>
 <20250919032431.3316764-10-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250919032431.3316764-10-jamin_lin@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 87tlZGwqyUp1z03TvycqFEjatnnKvtA97aws6nYdLoM_1758269163
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/19/25 05:24, Jamin Lin wrote:
> Introduce a PCIe Host Controller PHY model for AST2700. This adds an
> AST2700 specific PHY type (TYPE_ASPEED_2700_PCIE_PHY) with a 0x800 byte
> register space and link-status bits compatible with the firmware’s
> expectations.
> 
> AST2700 provides three PCIe RCs; PCIe0 and PCIe1 are GEN4, PCIe2 is
> GEN2. The PHY exposes:
> PEHR_2700_LINK_GEN2 at 0x344, bit 18 indicates GEN2 link up
> PEHR_2700_LINK_GEN4 at 0x358, bit 8 indicates GEN4 link up
> 
> In real hardware these GEN2/GEN4 link bits are mutually exclusive.
> QEMU does not model GEN2 vs GEN4 signaling differences, so the reset
> handler sets both bits to 1. This keeps the model simple and lets
> firmware see the link as up; firmware will read the appropriate
> register per RC port to infer the intended mode.
> 
> The header gains TYPE_ASPEED_2700_PCIE_PHY; the new class derives from
> TYPE_ASPEED_PCIE_PHY, sets nr_regs to 0x800 >> 2, and installs an
> AST2700 reset routine that programs the class code (0x06040011) and the
> GEN2/GEN4 status bits.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/pci-host/aspeed_pcie.h |  1 +
>   hw/pci-host/aspeed_pcie.c         | 39 +++++++++++++++++++++++++++++++
>   2 files changed, 40 insertions(+)
> 
> diff --git a/include/hw/pci-host/aspeed_pcie.h b/include/hw/pci-host/aspeed_pcie.h
> index 5e60cba07b..5806505f30 100644
> --- a/include/hw/pci-host/aspeed_pcie.h
> +++ b/include/hw/pci-host/aspeed_pcie.h
> @@ -114,6 +114,7 @@ struct AspeedPCIECfgClass {
>   };
>   
>   #define TYPE_ASPEED_PCIE_PHY "aspeed.pcie-phy"
> +#define TYPE_ASPEED_2700_PCIE_PHY TYPE_ASPEED_PCIE_PHY "-ast2700"
>   OBJECT_DECLARE_TYPE(AspeedPCIEPhyState, AspeedPCIEPhyClass, ASPEED_PCIE_PHY);
>   
>   struct AspeedPCIEPhyState {
> diff --git a/hw/pci-host/aspeed_pcie.c b/hw/pci-host/aspeed_pcie.c
> index 8be55b962f..788160d532 100644
> --- a/hw/pci-host/aspeed_pcie.c
> +++ b/hw/pci-host/aspeed_pcie.c
> @@ -696,6 +696,12 @@ REG32(PEHR_PROTECT,     0x7C)
>   REG32(PEHR_LINK,        0xC0)
>       FIELD(PEHR_LINK, STS, 5, 1)
>   
> +/* AST2700 */
> +REG32(PEHR_2700_LINK_GEN2,  0x344)
> +    FIELD(PEHR_2700_LINK_GEN2, STS, 18, 1)
> +REG32(PEHR_2700_LINK_GEN4,  0x358)
> +    FIELD(PEHR_2700_LINK_GEN4, STS, 8, 1)
> +
>   #define ASPEED_PCIE_PHY_UNLOCK  0xA8
>   
>   static uint64_t aspeed_pcie_phy_read(void *opaque, hwaddr addr,
> @@ -803,6 +809,38 @@ static const TypeInfo aspeed_pcie_phy_info = {
>       .class_size = sizeof(AspeedPCIEPhyClass),
>   };
>   
> +static void aspeed_2700_pcie_phy_reset(DeviceState *dev)
> +{
> +    AspeedPCIEPhyState *s = ASPEED_PCIE_PHY(dev);
> +    AspeedPCIEPhyClass *apc = ASPEED_PCIE_PHY_GET_CLASS(s);
> +
> +    memset(s->regs, 0, apc->nr_regs << 2);
> +
> +    s->regs[R_PEHR_ID] =
> +        (0x1150 << R_PEHR_ID_DEV_SHIFT) | PCI_VENDOR_ID_ASPEED;
> +    s->regs[R_PEHR_CLASS_CODE] = 0x06040011;
> +    s->regs[R_PEHR_2700_LINK_GEN2] = R_PEHR_2700_LINK_GEN2_STS_MASK;
> +    s->regs[R_PEHR_2700_LINK_GEN4] = R_PEHR_2700_LINK_GEN4_STS_MASK;
> +}
> +
> +static void aspeed_2700_pcie_phy_class_init(ObjectClass *klass,
> +                                            const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedPCIEPhyClass *apc = ASPEED_PCIE_PHY_CLASS(klass);
> +
> +    dc->desc = "ASPEED AST2700 PCIe Phy";
> +    device_class_set_legacy_reset(dc, aspeed_2700_pcie_phy_reset);
> +
> +    apc->nr_regs = 0x800 >> 2;
> +}
> +
> +static const TypeInfo aspeed_2700_pcie_phy_info = {
> +    .name       = TYPE_ASPEED_2700_PCIE_PHY,
> +    .parent     = TYPE_ASPEED_PCIE_PHY,
> +    .class_init = aspeed_2700_pcie_phy_class_init,
> +};
> +
>   static void aspeed_pcie_register_types(void)
>   {
>       type_register_static(&aspeed_pcie_rc_info);
> @@ -810,6 +848,7 @@ static void aspeed_pcie_register_types(void)
>       type_register_static(&aspeed_pcie_root_port_info);
>       type_register_static(&aspeed_pcie_cfg_info);
>       type_register_static(&aspeed_pcie_phy_info);
> +    type_register_static(&aspeed_2700_pcie_phy_info);
>   }
>   
>   type_init(aspeed_pcie_register_types);


