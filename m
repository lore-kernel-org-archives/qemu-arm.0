Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022F2CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:42:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRszX-0004nw-TD; Tue, 26 May 2026 10:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRszX-0004nW-4T
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRszV-0007YY-3N
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779806564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a255s164HAm9o7qkW3oCTBTqj2pDeTqJeUB4WXZ70ic=;
 b=Gna8e699SGehgjuX9qAu7JF6cESfwCRFWXmnU4FQWUPjw3pxv1jh2EOEwTsoHiG/JZs4l9
 aOdfjrmf/YK10+iZPu44y16/3I0JJST5adbA3p3s0eT8x9Py1rntXx8y3DTMYXBrZ0x+T/
 TVZBZXcmcWtbFmjBWVStJf5RGJ8L7eY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-S44BZRrRMOeGa1V5MHnegg-1; Tue, 26 May 2026 10:42:40 -0400
X-MC-Unique: S44BZRrRMOeGa1V5MHnegg-1
X-Mimecast-MFC-AGG-ID: S44BZRrRMOeGa1V5MHnegg_1779806560
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-45e73a4f1dfso7669227f8f.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806559; x=1780411359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a255s164HAm9o7qkW3oCTBTqj2pDeTqJeUB4WXZ70ic=;
 b=AhuzJ6N8VsYzi/azu8npoMOjYuosnyc7mY+9B/+uq/exUG5Swa5w9cKSwmsNivAn+q
 MPzBh0xOWbuceQroupDUaA2JSlQaVdxqNARHRK0kWyI27dBb2IHcqheV4cet/Vyt3ITX
 xZ1kCZwsC8ZJGy65eOJMeW1axMSDYNEkEaBHCDeK2aHwAE/6Sb3HTfB1l0LQf83Exxif
 B0YbjwaUUkpeyn3ieSOFGKhVRYmCGYP+GHiej9/lRfuX46iKE0/51jUcu60ujNp4k2Rj
 cfAS9HEtA8Znzy3Ce1RiqToiy1zmHvcscAUm98prcCDjExOuo3OghsCQnianrzyzttIz
 RDCA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9bA4AXDkK35UMGAZp6XUCFqlQdDCQwNz2ALeNmTR1gJydbasj9/9nnCbGjlA8cdYR5zCWrmY4N7Q==@nongnu.org
X-Gm-Message-State: AOJu0YzHfveMlKy7jurrpNSoXsJo4EQpIapjeewYP+x+fCX0Yi1ZrxeK
 bLAE7bUWkIC4XXIv/AG5cBLkSOAnjWWRP4TRrBv2vlVwA+vCktbZXHmHJaja4d+FJctWusVF08P
 /EdHScnTVDs498ttXELoOlqs7QmGJkFFtV7hlxs5bjC2CMZAHJW1+TQ==
X-Gm-Gg: Acq92OHDinlIeBpGHaUDXLp7l0sf20cipWiODgDZzaD9aciP0QN8mu+FlrGZPiEEUsm
 ybmn81LH2LI++4EJjy3UbdNwLaDA4QcFvBDj7w1WFqy8LZbiWzNR4hEacuTqx61hsHSQ0nqzJro
 NH0NFzikUVxj2MXYJb2wbL5YkSXce9lSy6KEILwvbyDY+ikgHzmOLVMGLonTmx3jHguXEpC91p0
 8Q2fcsXe4KvUTSRH8AlLSxYOGF9BUU5B1hWQp6DH6bTq5EYb06adXdU8K+gewtKdcA+5S+dvll4
 GBsGGmZsF2YjjFQ7DND62xG1JX1gW548+IU47w5HdIa4WAQMD/5dbBsIVo3n25Hxs8TdmQYJ2pl
 Ozdni1Zm8LnCUNpCRDLxApaCtajNDdkvqWVMozPPtt969XDm7b6OBqvKOTbAlnGz+
X-Received: by 2002:a05:6000:430b:b0:43d:75a2:44aa with SMTP id
 ffacd0b85a97d-45eb38e4db6mr31398729f8f.43.1779806559609; 
 Tue, 26 May 2026 07:42:39 -0700 (PDT)
X-Received: by 2002:a05:6000:430b:b0:43d:75a2:44aa with SMTP id
 ffacd0b85a97d-45eb38e4db6mr31398673f8f.43.1779806559122; 
 Tue, 26 May 2026 07:42:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9f58dsm35464125f8f.5.2026.05.26.07.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 07:42:38 -0700 (PDT)
Message-ID: <06ae19c4-5f92-4d5e-8ed5-55543cccca8d@redhat.com>
Date: Tue, 26 May 2026 16:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/21] tests: acpi: arm/virt: whitelist new WDAT table
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-13-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-13-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wXKRI5tVpy6J4_w6CqjescgTJBZps81Zy7esQbRnuxM_1779806560
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
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  tests/data/acpi/aarch64/virt/WDAT.wdat      | 0
>  2 files changed, 1 insertion(+)
>  create mode 100644 tests/data/acpi/aarch64/virt/WDAT.wdat
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..135186b40b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/WDAT.wdat",
> diff --git a/tests/data/acpi/aarch64/virt/WDAT.wdat b/tests/data/acpi/aarch64/virt/WDAT.wdat
> new file mode 100644
> index 0000000000..e69de29bb2


