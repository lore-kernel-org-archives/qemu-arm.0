Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2077099ejb;
        Tue, 23 May 2023 11:41:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4iLXs1nNvTSFhkyfZF2uBN6LMoPjsL3SusnRlvEGaYeI2HSpBYv9zBIn20l/qYNnRPPv2F
X-Received: by 2002:a05:622a:11c8:b0:3f6:b285:a37f with SMTP id n8-20020a05622a11c800b003f6b285a37fmr8525206qtk.41.1684867317027;
        Tue, 23 May 2023 11:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684867317; cv=none;
        d=google.com; s=arc-20160816;
        b=W6VwfXT6ZvenfcDg8oQuW6oNPQJ8xoTSsdjwo1oO4PWuQnivpuRwdTxf7/374ed3jG
         wHFYpsrP6bPnOe1vpUKpNEkvTqAziqc2vOZepj7LnyVYxUQ97Rka98f+CmbvauXt/N2N
         iHX1nXIOXiS0expMSO2uwANQV2p16nRNZseFH7s3GTtiucxzSYn8OfafQ7NqRJ18k37Y
         s0znM+EU4zdRemrudBhgwdxPoiePbV006cSt22mFBdgRuFg5AcUXDtXcy837oeIIK2wr
         vlKypxPvgzjHpyU4eigQGmA6zID4Xe1JscWpylwjoI3MtDJ4QtvFhhsuFJ8U92wzXnXl
         5Tvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9XaOSRmRG4UWXvpzQWNqCUYDwzqHlmfd4KiTEhK843A=;
        b=hINKWfTMlFDA6rt85j+O9nZ7vc3jGi+J93N5JreSwx4TyI7G6i/xpm7CpfrbAO2R7B
         l6V3KJNOxAeLl6zbU1RLw5lejMXHsT2u+QCGB9d5X6EBFyU8rn7ihEpUD0GliUKfJ9q9
         6h+vFw2ClWojMu+VdZU7VOLuehaTsM5PVQvA4P1W6fsd6Q7WnE0PPHQ/qh20r61nZxxL
         lw2ScbXKt/4MDQNFtQefkDPh8z+X6A3cxNF1V9JBLm7ZX9AesTU6ZRegSR87Xtt0gueY
         k+4/u6/3F3OL3hEQLt9vprpvsYvB5Z7nolMsJ+VZMxy+f39WzdmOioA/Ta57W0+UB9lW
         Ne7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJdMmxSA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020ac85795000000b003f0afcf5dd2si5472000qta.310.2023.05.23.11.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJdMmxSA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1WxE-0003SC-Cj; Tue, 23 May 2023 14:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1WxD-0003S4-TS
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1WxC-000770-Ds
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684867309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XaOSRmRG4UWXvpzQWNqCUYDwzqHlmfd4KiTEhK843A=;
 b=ZJdMmxSA5ED2LHwqTEQbSUjWYvQ3IY5D9pCvQMaUl6ckCjHaz/X/kvok/9TSLz0Z86HsSM
 D4LCGaWz9iueUV3p3OFwcQ7j/0IzN7KWGnpR84+3oxkQoqJbhxsQ75CkK3AO81vzOLCNyH
 9fHxK0xv91DDPK9w1yheBnvfZeVTETA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-IOxeQe2EN3OiDGmmBusNRQ-1; Tue, 23 May 2023 14:41:48 -0400
X-MC-Unique: IOxeQe2EN3OiDGmmBusNRQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30953bcb997so1838840f8f.2
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 11:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684867307; x=1687459307;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9XaOSRmRG4UWXvpzQWNqCUYDwzqHlmfd4KiTEhK843A=;
 b=Cjv0wLwnpfRwvCSrV3C+ITGxGIwz7FKxk591x8QtSwG2mDVCiNPkSjrBUPrOJo+keG
 BrzOaxpFIUu6TE8wHRKALfP7c9pP4iFROfslKas6kIKw5ZN/7fTB1jFyXd23OJncbbNz
 aNJHGbdnOvlypQICcA/Tz2rbjqsekwIBGgTt9kOUHk3byTjUf84w68x5iu9flGGpAOEt
 yByPvuavBeo11LcO7WZ2ToIaNh3RkZBEz+UVKWVMkDueG8MT+Gf7aRHMrzpb4+KzshUj
 pmYZZr4Yq32hdEwX0EvIvam7u6w9KHpGwP6oVsGlpu3B93SIanUdk06d4UhuX/J0q794
 S3Sg==
X-Gm-Message-State: AC+VfDwM2GZysgUyuGffb0bikXdKzfSpDOay3GNFIl/PMSCPkSq/jvDb
 MzIHSDFekalntBzaOfrxzB+HqVnWF1FNDCcLWStMwq6NMDAET5yq5z1S4+C41HdGdxjilA2MlkM
 EhkCeTxG0M/OF
X-Received: by 2002:adf:e8ce:0:b0:309:50e7:7d0 with SMTP id
 k14-20020adfe8ce000000b0030950e707d0mr10241180wrn.31.1684867307336; 
 Tue, 23 May 2023 11:41:47 -0700 (PDT)
X-Received: by 2002:adf:e8ce:0:b0:309:50e7:7d0 with SMTP id
 k14-20020adfe8ce000000b0030950e707d0mr10241170wrn.31.1684867307066; 
 Tue, 23 May 2023 11:41:47 -0700 (PDT)
Received: from [192.168.8.105] (tmo-117-143.customers.d1-online.com.
 [80.187.117.143]) by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4ccb000000b0030631dcbea6sm11843839wrt.77.2023.05.23.11.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 11:41:46 -0700 (PDT)
Message-ID: <49fa8502-70f9-cdc4-1058-9d4202400db6@redhat.com>
Date: Tue, 23 May 2023 20:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
 <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
 <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <4101dedc-91d7-1735-4655-81082931b79d@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs: sbsa: correct graphics card name
In-Reply-To: <4101dedc-91d7-1735-4655-81082931b79d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: yEXzvY2x4RDn

On 23/05/2023 19.30, Marcin Juszkiewicz wrote:
...
>> (is there a reason why it can't be disabled with "-vga none" or 
>> "-nodefaults"?)
> 
> That's something I need to check how it should be done.

Other boards set mc->default_display in their ...class_init
function and then use pci_vga_init() (or vga_interface_type)
to instantiate their default display adapter ... however, that
does not seem to support the bochs adapter yet (see
vga_interfaces[] in softmmu/vl.c).

Not sure whether it's worth the effort to extend vga_interfaces[]
in vl.c, but you could at least check whether vga_interface_type
is VGA_NONE and skip the creation of the bochs adapter in that
case?

> Should it also drop default_nic?

Seems like sbsa-ref already uses nd_table[], so "-net none" should
already work. For "configure --without-default-devices" builds, we
still need a patch like this on top, though:

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -596,6 +596,7 @@ static void create_pcie(SBSAMachineState *sms)
      hwaddr size_mmio_high = sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].size;
      hwaddr base_pio = sbsa_ref_memmap[SBSA_PCIE_PIO].base;
      int irq = sbsa_ref_irqmap[SBSA_PCIE];
+    MachineClass *mc = MACHINE_GET_CLASS(sms);
      MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
      MemoryRegion *ecam_alias, *ecam_reg;
      DeviceState *dev;
@@ -641,7 +642,7 @@ static void create_pcie(SBSAMachineState *sms)
              NICInfo *nd = &nd_table[i];
  
              if (!nd->model) {
-                nd->model = g_strdup("e1000e");
+                nd->model = g_strdup(mc->default_nic);
              }
  
              pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
@@ -858,6 +859,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
      mc->minimum_page_bits = 12;
      mc->block_default_type = IF_IDE;
      mc->no_cdrom = 1;
+    mc->default_nic = "e1000e";
      mc->default_ram_size = 1 * GiB;
      mc->default_ram_id = "sbsa-ref.ram";
      mc->default_cpus = 4;

(I'm doing that default_nic change for a lot of other boards
currently, so I can send a proper patch for this later)

  Thomas

