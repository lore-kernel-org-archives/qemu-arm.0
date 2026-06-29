Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B3C43327
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 12:16:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weAuV-0005Vt-99; Mon, 29 Jun 2026 08:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weAuQ-0005VE-I5
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 08:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weAuO-0006ht-Cq
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 08:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782735375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vF1n9jI7Ss0PvjereA62Q4UNq6mjKPEXnD1SCg3WI8A=;
 b=F3t02e+RlCKzmD/jvYCCLx+RnLqSdOIA1ftHur/4iM2HX1aCg/gjI0fPOq9n7vDCuLefmU
 MncroBt2+Sp3tPlWUYzpEBCTeIF3b+NzakUZ9dFcgiTSC2YR9PIMTcoIbmULtv4m4K34yN
 tr8R97dzhB+wsj1kWfLHN19P8a2TM98=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-whGlPOVVPMKzFfzhfTqaZw-1; Mon, 29 Jun 2026 08:16:13 -0400
X-MC-Unique: whGlPOVVPMKzFfzhfTqaZw-1
X-Mimecast-MFC-AGG-ID: whGlPOVVPMKzFfzhfTqaZw_1782735373
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-493a6135742so16247905e9.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 05:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782735372; x=1783340172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vF1n9jI7Ss0PvjereA62Q4UNq6mjKPEXnD1SCg3WI8A=;
 b=FNPaIvwiTjVjPdIzt8s1EFmfYnzLzNL7RIoL1F1FX39DnYrnVQ19fCfBSepITvCBv1
 HAdPZ4zbbmlarMskkE6+b9Z+F36tdkvlYuHF+aM7sidw1ZTd0hXl14nWyTFO+UtbSFAM
 NaA0pa52rUH+tlmE8nEerB4Py30qy84tWkkphd/fTfx2BR0AFnMOsIaEWNpGzdlenh1v
 UC9a03UCoOACe54ar1OD3pjAjTw7YK3IIsVAWlTC9JZG+0egxEM9CYvSoxTPiKdh7xQD
 vKcMpESGCCZLrawyTqy6vX81vHI0pVWT678GQP2za0uAR++jx+AKZmCEFmIb/nFHZVH4
 LIUg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+EWvrQMQbgwZ9cc8zRrDCAU71zfHNheBHuRY02rErajVR3sIR0slICVPZzWi0ANea1M6CPCNntwQ==@nongnu.org
X-Gm-Message-State: AOJu0YwJJQaHeDZfQTmLa8/inZ1/pWSaXvEmDEWCPraBQnD4JrmAJiHa
 5MEitxx+W/Xtyra0HcTlFJtS7NnI9kSS3i4DPtUuhERWj9L4TwbdniLZJxQKy6wM9AygWnuH4Ls
 tNw8QnF0VSmCGkI8WL53TpKh4ucGnz5yh4SzEeZc+XTRMLY4vD/1oMg==
X-Gm-Gg: AfdE7ck2IX6svLpuY2c/Thw5uLNvGNTX+Texqz9h2fwqqotcnarMealeb8Yn4Do5ylC
 joRk9knaucGqPS8KV+HXjkkSox1xhdiRe9ieu42P+MffPCkYrSNJU2IZIVUlsQrIXlljBxqrHDR
 juBVFMLiUlnmafPvrtirU/fI1wtnqKOm2jWeuQHt0jFlXn+ESO38rQNplFQ4ZY7TtLD9fas2Uyh
 ENlDLwp5W05UORV1TALI1YeSmPoJAF9vzTEaHhz1EKCYhx7lJndyquJzWSmNTZT2MLBQ4P1L1DZ
 2utiL/9Dzq3aGlDpSXfm42eUuccUcY6C/Lyz/jWr+uwLSbBPu5xI5DyaonGpaZ83YwaFUmzrKPV
 y/Q77qfkE9F+pofpzG5zfoS3feEFJliskXNlN9FkHT8IVGLuUtfy9VA==
X-Received: by 2002:a05:600c:c3c1:20b0:492:4335:4d4c with SMTP id
 5b1f17b1804b1-492668833c0mr195120735e9.30.1782735372564; 
 Mon, 29 Jun 2026 05:16:12 -0700 (PDT)
X-Received: by 2002:a05:600c:c3c1:20b0:492:4335:4d4c with SMTP id
 5b1f17b1804b1-492668833c0mr195120205e9.30.1782735372116; 
 Mon, 29 Jun 2026 05:16:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49392c991aesm131405775e9.0.2026.06.29.05.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 05:16:10 -0700 (PDT)
Message-ID: <79a38231-6ae5-437f-ae43-74707c928224@redhat.com>
Date: Mon, 29 Jun 2026 14:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/17] tests: acpi: arm/virt: update expected WDAT blob
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 rad@semihalf.com, leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-11-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260624102830.1355552-11-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N5QEHKKj1hZg_1gS6xVbLvSJ4jb0M4nDDMZNF8grmBo_1782735373
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 6/24/26 12:28 PM, Igor Mammedov wrote:
> replace blank table with a new one:
> 
>   [000h 0000 004h]                   Signature : "WDAT"    [Watchdog Action Table]
>   [004h 0004 004h]                Table Length : 00000104
>   [008h 0008 001h]                    Revision : 01
>   [009h 0009 001h]                    Checksum : 3B
>   [00Ah 0010 006h]                      Oem ID : "BOCHS "
>   [010h 0016 008h]                Oem Table ID : "BXPC    "
>   [018h 0024 004h]                Oem Revision : 00000001
>   [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>   [020h 0032 004h]       Asl Compiler Revision : 00000001
> 
>   [024h 0036 004h]               Header Length : 00000020
>   [028h 0040 002h]                 PCI Segment : 00FF
>   [02Ah 0042 001h]                     PCI Bus : FF
>   [02Bh 0043 001h]                  PCI Device : FF
>   [02Ch 0044 001h]                PCI Function : FF
>   [02Dh 0045 003h]                    Reserved : 000000
>   [030h 0048 004h]                Timer Period : 00000001
>   [034h 0052 004h]                   Max Count : 000927C0
>   [038h 0056 004h]                   Min Count : 00001388
>   [03Ch 0060 001h]       Flags (decoded below) : 81
>                                        Enabled : 1
>                            Stopped When Asleep : 1
>   [03Dh 0061 003h]                    Reserved : 000000
>   [040h 0064 004h]        Watchdog Entry Count : 00000008
> 
>   [044h 0068 001h]             Watchdog Action : 08
>   [045h 0069 001h]                 Instruction : 00
>   [046h 0070 002h]                    Reserved : 0000
> 
>   [048h 0072 00Ch]             Register Region : [Generic Address Structure]
>   [048h 0072 001h]                    Space ID : 00 [SystemMemory]
>   [049h 0073 001h]                   Bit Width : 20
>   [04Ah 0074 001h]                  Bit Offset : 00
>   [04Bh 0075 001h]        Encoded Access Width : 03 [DWord Access:32]
>   [04Ch 0076 008h]                     Address : 000000000C001000
> 
>   [054h 0084 004h]                       Value : 00000001
>   [058h 0088 004h]               Register Mask : 00000001
> 
>   [05Ch 0092 001h]             Watchdog Action : 01
>   [05Dh 0093 001h]                 Instruction : 02
>   [05Eh 0094 002h]                    Reserved : 0000
> 
>   [060h 0096 00Ch]             Register Region : [Generic Address Structure]
>   [060h 0096 001h]                    Space ID : 00 [SystemMemory]
>   [061h 0097 001h]                   Bit Width : 20
>   [062h 0098 001h]                  Bit Offset : 00
>   [063h 0099 001h]        Encoded Access Width : 03 [DWord Access:32]
>   [064h 0100 008h]                     Address : 000000000C000000
> 
>   [06Ch 0108 004h]                       Value : 00000001
>   [070h 0112 004h]               Register Mask : 00000007
> 
>   [074h 0116 001h]             Watchdog Action : 06
>   [075h 0117 001h]                 Instruction : 03
>   [076h 0118 002h]                    Reserved : 0000
> 
>   [078h 0120 00Ch]             Register Region : [Generic Address Structure]
>   [078h 0120 001h]                    Space ID : 00 [SystemMemory]
>   [079h 0121 001h]                   Bit Width : 20
>   [07Ah 0122 001h]                  Bit Offset : 00
>   [07Bh 0123 001h]        Encoded Access Width : 03 [DWord Access:32]
>   [07Ch 0124 008h]                     Address : 000000000C001008
> 
>   [084h 0132 004h]                       Value : 00000000
>   [088h 0136 004h]               Register Mask : FFFFFFFF
> 
>   [08Ch 0140 001h]             Watchdog Action : 09
>   [08Dh 0141 001h]                 Instruction : 82
>   [08Eh 0142 002h]                    Reserved : 0000
> 
>   [090h 0144 00Ch]             Register Region : [Generic Address Structure]
>   [090h 0144 001h]                    Space ID : 00 [SystemMemory]
>   [091h 0145 001h]                   Bit Width : 20
>   [092h 0146 001h]                  Bit Offset : 00
>   [093h 0147 001h]        Encoded Access Width : 03 [DWord Access:32]
>   [094h 0148 008h]                     Address : 000000000C001000
> 
>   [09Ch 0156 004h]                       Value : 00000001
>   [0A0h 0160 004h]               Register Mask : 00000001
> 
>   [0A4h 0164 001h]             Watchdog Action : 0A
>   [0A5h 0165 001h]                 Instruction : 00
>   [0A6h 0166 002h]                    Reserved : 0000
> 
>   [0A8h 0168 00Ch]             Register Region : [Generic Address Structure]
>   [0A8h 0168 001h]                    Space ID : 00 [SystemMemory]
>   [0A9h 0169 001h]                   Bit Width : 20
>   [0AAh 0170 001h]                  Bit Offset : 00
>   [0ABh 0171 001h]        Encoded Access Width : 03 [DWord Access:32]
>   [0ACh 0172 008h]                     Address : 000000000C001000
> 
>   [0B4h 0180 004h]                       Value : 00000000
>   [0B8h 0184 004h]               Register Mask : 00000001
> 
>   [0BCh 0188 001h]             Watchdog Action : 0B
>   [0BDh 0189 001h]                 Instruction : 82
>   [0BEh 0190 002h]                    Reserved : 0000
> 
>   [0C0h 0192 00Ch]             Register Region : [Generic Address Structure]
>   [0C0h 0192 001h]                    Space ID : 00 [SystemMemory]
>   [0C1h 0193 001h]                   Bit Width : 20
>   [0C2h 0194 001h]                  Bit Offset : 00
>   [0C3h 0195 001h]        Encoded Access Width : 03 [DWord Access:32]
>   [0C4h 0196 008h]                     Address : 000000000C001000
> 
>   [0CCh 0204 004h]                       Value : 00000000
>   [0D0h 0208 004h]               Register Mask : 00000001
> 
>   [0D4h 0212 001h]             Watchdog Action : 20
>   [0D5h 0213 001h]                 Instruction : 00
>   [0D6h 0214 002h]                    Reserved : 0000
> 
>   [0D8h 0216 00Ch]             Register Region : [Generic Address Structure]
>   [0D8h 0216 001h]                    Space ID : 00 [SystemMemory]
>   [0D9h 0217 001h]                   Bit Width : 20
>   [0DAh 0218 001h]                  Bit Offset : 00
>   [0DBh 0219 001h]        Encoded Access Width : 03 [DWord Access:32]
>   [0DCh 0220 008h]                     Address : 000000000C001000
> 
>   [0E4h 0228 004h]                       Value : 00000004
>   [0E8h 0232 004h]               Register Mask : 00000004
> 
>   [0ECh 0236 001h]             Watchdog Action : 21
>   [0EDh 0237 001h]                 Instruction : 82
>   [0EEh 0238 002h]                    Reserved : 0000
> 
>   [0F0h 0240 00Ch]             Register Region : [Generic Address Structure]
>   [0F0h 0240 001h]                    Space ID : 00 [SystemMemory]
>   [0F1h 0241 001h]                   Bit Width : 20
>   [0F2h 0242 001h]                  Bit Offset : 00
>   [0F3h 0243 001h]        Encoded Access Width : 03 [DWord Access:32]
>   [0F4h 0244 008h]                     Address : 000000000C000000
> 
>   [0FCh 0252 004h]                       Value : 00000004
>   [100h 0256 004h]               Register Mask : 00000004
> 
> Raw Table Data: Length 260 (0x104)
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  tests/data/acpi/aarch64/virt/WDAT.wdat      | Bin 0 -> 260 bytes
>  2 files changed, 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 135186b40b..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/aarch64/virt/WDAT.wdat",
> diff --git a/tests/data/acpi/aarch64/virt/WDAT.wdat b/tests/data/acpi/aarch64/virt/WDAT.wdat
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..d5adacf9114637d8803d08906ff1e29ac61f5fe0 100644
> GIT binary patch
> literal 260
> zcmZXOK@NgI3`O4vF`x@byg*$Mjv=^kCkZBU9awQJZ&p(1B&bcAwm<K;ecx}dG(f1E
> zXZz@-8M;<PBmmZ16+lr{z~)btGhbi?GEanrk^*Op%cs@+r=JYk@zHbs;iGQ%_k0R#
> Y9+OSa{H}$nYB)I0_dnOT-}Sg>0T&h&0RR91
> 
> literal 0
> HcmV?d00001
> 

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


