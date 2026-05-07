Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE272CD3442
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 16:28:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL1Ze-0006dw-QV; Thu, 07 May 2026 12:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL1ZS-0006ce-RB
 for qemu-arm@nongnu.org; Thu, 07 May 2026 12:27:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL1ZR-00047K-4G
 for qemu-arm@nongnu.org; Thu, 07 May 2026 12:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778171248;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAOT4RgVnlpSIZduDv4pzDOkJHY71xOmGX0zOyluJ0s=;
 b=VHobeGUY+rIY/rarEaUzd+tnXHAhSq//Xjxalw27AwkIKcVk5+YmXkw2BJpL3ARQeZv9OD
 k13Jeje6/aw4MScE89psHaiR4v9ngJtLeG2DdEurHL/HQ6u5y+Ht3Nl8hRRMt9IpAuh6tK
 JAqv7y9ZLOwACQwqf8LNsfGnyUoSCw8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-bMaEptL7NOa-NlXAUIVrHQ-1; Thu, 07 May 2026 12:27:26 -0400
X-MC-Unique: bMaEptL7NOa-NlXAUIVrHQ-1
X-Mimecast-MFC-AGG-ID: bMaEptL7NOa-NlXAUIVrHQ_1778171245
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-449dcfe8005so894851f8f.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 09:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778171245; x=1778776045;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAOT4RgVnlpSIZduDv4pzDOkJHY71xOmGX0zOyluJ0s=;
 b=tDCCAf0g6QMPVfD8zbf531AgATpfFz2U+qbKZalmWtPa760d9vm7TLPvhDCCerg6AK
 I5iTsHkP/MVkf6Aqstz8rTSGqumKmkYnL9suBx3XFxMf3PzkCLMMe0apjf6dh0TIG2Do
 VFpDzmutxdTWhoImzAszNzGZouoUN3BBWenV3yswVrMdflWLibKOUdmBp7bQjuBcdRoM
 Ur2988l1OkebaoF+Tj/HMoebgj6hehhO/FFUYngPQDye+27/h0kX9FLL7NwzHpxJioZj
 031kwl7EvrPnOUGIWjIIQYLwBNA3eqYmzLkBAmk0S5YmGoSBkx+Gl5l+2mtnl2YPSl1w
 XtlQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/mvBkDEgeFnDx9CxzXE5PfUBhQ6Wax6tLFWJt/Vp2OpNPhXcXWBDp7cx0hYBAwyuZc4stGDRBgdw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/0cz7cgT5UeWEglcxlvXIBTSK0H8eH55OQdSP11fZZ201aWOm
 TeLDzrM12jg6YbttM9kXKaEDxspsO1tYVEu4g25X05vgEUltBkOKLBA4h8WJwfkr0+WN7IGI/wr
 wxpwST4tDZTVN+9xiUuKVsHbiCVbke6nF3ggy28BP5ARw5ktbxfZsxg==
X-Gm-Gg: AeBDievM2QGWv2Efgjay1RYS0edQ531qd9LNEPrJ2fCBD4wrhgN4U+KVLLnWraOize8
 ZekUc/Ks8QY3XmMiUWM79jQYwtoSlIAS6/amFsXZbrVMETROpoV0fKawsda4y+YMa/yWh3lcCTk
 2E+9dDRGyghyk7PPqy1dmdX1eeWdov1KrArlb9F8YzpZ40nDyPKww/T9t2LAAfwRC1WMRgg79uC
 KCzQQTKsP/NIHS6OFrskTt6v35f9Wvo5N7H+fUrbwfP0gwA+2YXkjESzzot6cKBImjZdMaVyicA
 PwUSj8GmZZgZt0R95F3G1gXRN0BTu5ppIu1lkmPLp1FHgowKfY5oTUjF1GAsyVhaugq1obJUy3S
 Kmp4+x1oS5A6TT5mkO0VNSXG1ag4xKWuAXl90YS8+V90xIPyNAGXxPn2VG52aiLbiZyjzzw==
X-Received: by 2002:a05:6000:4210:b0:439:b1c3:84c8 with SMTP id
 ffacd0b85a97d-4515cd27a66mr13939688f8f.21.1778171245207; 
 Thu, 07 May 2026 09:27:25 -0700 (PDT)
X-Received: by 2002:a05:6000:4210:b0:439:b1c3:84c8 with SMTP id
 ffacd0b85a97d-4515cd27a66mr13939625f8f.21.1778171244685; 
 Thu, 07 May 2026 09:27:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454131bcee3sm200357f8f.15.2026.05.07.09.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 09:27:24 -0700 (PDT)
Message-ID: <fd307b1d-d7bd-4e23-b48d-7fc4f40c988b@redhat.com>
Date: Thu, 7 May 2026 18:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest/iommu-smmuv3-test: Skip if no TCG GICv3
 device present
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20260507144831.1604398-1-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260507144831.1604398-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1ZwXTxPBVQv2zh8KkQI6Ei4PkSsSlzdy_V9h3QnxIUk_1778171245
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On 5/7/26 4:48 PM, Peter Maydell wrote:
> On a KVM-only (--disable-tcg) build, the iommu-smmuv3 qtest fails:
>
> qemu-system-aarch64: QTest does not support GICv3 emulation
> Broken pipe
> ../../tests/qtest/libqtest.c:201: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
>
> This is because the test runs the virt board with the qtest
> accelerator and gic-version=3.  In the virt board this selects the
> TCG (emulated) GICv3, but in a --disable-tcg build we don't compile
> that device, only the KVM GICv3 (which isn't usable with qtest).
>
> Add a check to the test so we skip it if the arm-gicv3 device isn't
> in the QEMU binary.
>
> Cc: qemu-stable@nongnu.org
> Fixes: d8d19c31b220142641 ("tests/qtest: Add SMMUv3 bare-metal test using iommu-testdev")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
> Looks like our CI compile-tests the --disable-tcg build but doesn't
> try to run "make check" on it.
> ---
>  tests/qtest/iommu-smmuv3-test.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/qtest/iommu-smmuv3-test.c b/tests/qtest/iommu-smmuv3-test.c
> index dae9821b92..708fae5fd3 100644
> --- a/tests/qtest/iommu-smmuv3-test.c
> +++ b/tests/qtest/iommu-smmuv3-test.c
> @@ -64,6 +64,11 @@ static void run_smmuv3_translation(const QSMMUTestConfig *cfg)
>          g_test_skip("virt machine not available");
>          return;
>      }
> +    if (!qtest_has_device("arm-gicv3")) {
> +        /* This can happen for a KVM-only build: qtest uses the TCG GICv3 */
> +        g_test_skip("gicv3 not available");
> +        return;
> +    }
>  
>      /* Initialize QEMU environment for SMMU testing */
>      qts = qtest_init("-machine virt,acpi=off,gic-version=3,iommu=smmuv3 "


