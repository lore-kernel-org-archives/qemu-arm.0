Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03844CD6E79
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 17:11:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWdVh-0005PH-73; Mon, 08 Jun 2026 13:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wWdVe-0005O4-88
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 13:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wWdVc-0005GG-0s
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 13:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780938690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQI+XNi+8PQA7/vciu2dpfojFl+k1DC10d2RhqaZ1FU=;
 b=LPUVFKkoUtGXI5+FlktOR8MP1uddh52jYQKs3G23FdCRIwGYXbNofMOSJbzheZYHkE9fxf
 xy2y2D5iE8OCgSAxRBBIAwLi31p7Z9+HlQL+oqOYVvD2QHfq+jSNkNK/OMNAgh6y1YWM89
 w+QfC/NsIkwZAtVpdJfe45wdrbO66Xw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-14o_eaKlOduHLRldJUfjfA-1; Mon, 08 Jun 2026 13:11:26 -0400
X-MC-Unique: 14o_eaKlOduHLRldJUfjfA-1
X-Mimecast-MFC-AGG-ID: 14o_eaKlOduHLRldJUfjfA_1780938685
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4600c8cb13aso2765483f8f.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 10:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780938685; x=1781543485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RQI+XNi+8PQA7/vciu2dpfojFl+k1DC10d2RhqaZ1FU=;
 b=eT0EJqG2P3vcqWfux62yEjqgQNIKqmI8ie9uLrUQOJFdCt2CQ1NFE1lmXHLr+mD0UM
 IioSx2mW9b+RVK/7lscvG+DZ5dCIzOmlqKfykTsK3cH84dU+tglheGNAirPQeweHJto6
 xXLVAIEvqjGzDW95ti900aPFcJTQS4tsDhb3CPqjmrofBNosIlGiQX0wXcejQe4xbqAZ
 3e3xJa0DQpwyV2OCViH3U6sDbK8jT80cd74veOIV8K0jHLmZylytJw0ZJjDN128087IZ
 +zlhdmnlsETmLUK+qWyy+mujZwPQcU22ogDltWQcRJRtMKLfttGdF84VdEqED3U6gDk+
 lgEQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+M48/7PoMHuntJH1wQY9bR+jiNN6pBx9ndA2XE/pMgTCJAQ1sb03BPVRJgtVF6YoKnTOcX4+RgNg==@nongnu.org
X-Gm-Message-State: AOJu0Yym6d6K5LwhTBiqRlsfMgMXHfh4UdJJWe25Z5qgbMymj0aDm1uc
 ti/SmD3K7vL5LqDIIVvf/7mUVGmMLfP0UXX8htLcX0lzC5pQ0PTTGbbi8ixfbXw4+0MFacq4MKQ
 HRSvOVfewUWhBeI3Oj/ajDFBSw+fawNMzpY2GwPbheXnUcebkt5zuPA==
X-Gm-Gg: Acq92OHNOVlAqnKTY1VpXvopjRl49S/KrDrYMj9JVgOA9BxwXoLY0vrwbag3A2eNvn6
 UqBk7uDpXb/NP6xoT07FJFtrVc8ngJUfo0ET8JjvsdOVmx45ZimrUtzKYh3vPDNG5fAZMdOuS+9
 oM7On0AiGjaIfN3Z9X2sNfptqFC0r1yhQqGoSgTImmVNhkkWK0+MF6cPVisc7mfPpRqVt16pHK0
 Qfu3Uo/9YzcsuHGsi8iGQK0VXxI793J8mpcA9vbJV/dKlMeBCUEXdd585tzu8c45RiSzqnsXMrV
 OjWBQyXqSqT3nKviqv524BKBbD4GoQRGQy8KubyudvrHU26Iw52TO3+JjS8dz96y9T3bN6fill/
 HQbpi0O715feMsP25bUhDJKK8cI6PCNUCmqAd4gNvE7q3ZQbhLssKUYi0Fh235zFt8KuYluDy9b
 w=
X-Received: by 2002:a05:600c:529b:b0:48f:e230:1d12 with SMTP id
 5b1f17b1804b1-490c2625f9bmr247580065e9.31.1780938685411; 
 Mon, 08 Jun 2026 10:11:25 -0700 (PDT)
X-Received: by 2002:a05:600c:529b:b0:48f:e230:1d12 with SMTP id
 5b1f17b1804b1-490c2625f9bmr247579565e9.31.1780938685034; 
 Mon, 08 Jun 2026 10:11:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bda4fd52sm394739295e9.0.2026.06.08.10.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 10:11:24 -0700 (PDT)
Message-ID: <0c05cb81-c3b7-44cb-8a5e-70b7eef1853d@redhat.com>
Date: Mon, 8 Jun 2026 19:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] tests: acpi: arm/virt: update expected GTDT blob
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-18-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-18-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5QUUxk53jggx564SnWbWnZwmVPe5Ui8gNnZC6dxV_C0_1780938685
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 3/3/26 10:25 AM, Igor Mammedov wrote:
> Expected diff from base GTDT is an addition of watchdog
> timer block:
> 
>    [000h 0000 004h]                   Signature : "GTDT"    [Generic Timer Description Table]
>   -[004h 0004 004h]                Table Length : 00000068
>   +[004h 0004 004h]                Table Length : 00000084
>    [008h 0008 001h]                    Revision : 03
>   -[009h 0009 001h]                    Checksum : 93
>   +[009h 0009 001h]                    Checksum : 39
>    [00Ah 0010 006h]                      Oem ID : "BOCHS "
>    [010h 0016 008h]                Oem Table ID : "BXPC    "
>    [018h 0024 004h]                Oem Revision : 00000001
>   @@ -48,17 +48,30 @@
>                                       Always On : 0
>    [050h 0080 008h]  Counter Read Block Address : FFFFFFFFFFFFFFFF
> 
>   -[058h 0088 004h]        Platform Timer Count : 00000000
>   -[05Ch 0092 004h]       Platform Timer Offset : 00000000
>   +[058h 0088 004h]        Platform Timer Count : 00000001
>   +[05Ch 0092 004h]       Platform Timer Offset : 00000068
>    [060h 0096 004h]      Virtual EL2 Timer GSIV : 00000000
>    [064h 0100 004h]     Virtual EL2 Timer Flags : 00000000
> 
>   -Raw Table Data: Length 104 (0x68)
>   +[068h 0104 001h]               Subtable Type : 01 [Generic Watchdog Timer]
>   +[069h 0105 002h]                      Length : 001C
>   +[06Bh 0107 001h]                    Reserved : 00
>   +[06Ch 0108 008h]       Refresh Frame Address : 000000000C000000
>   +[074h 0116 008h]       Control Frame Address : 000000000C001000
>   +[07Ch 0124 004h]             Timer Interrupt : 00000090
>   +[080h 0128 004h] Timer Flags (decoded below) : 00000000
>   +                                Trigger Mode : 0
>   +                                    Polarity : 0
>   +                                    Security : 0
>   +
>   +Raw Table Data: Length 132 (0x84)
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  tests/data/acpi/aarch64/virt/GTDT.gwdt      | Bin 0 -> 132 bytes
>  2 files changed, 1 deletion(-)
>  create mode 100644 tests/data/acpi/aarch64/virt/GTDT.gwdt
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 3e9be28cc4..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/aarch64/virt/GTDT",
> diff --git a/tests/data/acpi/aarch64/virt/GTDT.gwdt b/tests/data/acpi/aarch64/virt/GTDT.gwdt
> new file mode 100644
> index 0000000000000000000000000000000000000000..e0c2151fa7d3432740bb997d7d33669e30f133aa
> GIT binary patch
> literal 132
> zcmZ<{aS3T*U|?Xjbn<uh2v%^42yj+VP*7lGU|;~TLG*tpU|?WikOdJ83=DD%3=Av`
> i3=Gmxz7&*(sRilFfQo?tqYRkh0h0m{dIFfkzyJV@>lgt5
> 
> literal 0
> HcmV?d00001
> 


