Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6556957lfg;
        Thu, 4 Mar 2021 12:28:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyftomTRy+AyQhDOBakINHRc+xJUa86P48Sk/8i7AbeN2utu0fFxPVeZxBDrKBVuMMCHuDn
X-Received: by 2002:a5e:dd0c:: with SMTP id t12mr4948191iop.50.1614889686147;
        Thu, 04 Mar 2021 12:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614889686; cv=none;
        d=google.com; s=arc-20160816;
        b=pKjjNrUBHrPNO4VysQAIZcmGdcMuMNjQ/KFyrXZwx+V82Lsif5ETdbO9pXvL2aih9A
         mWcUW7ToNiwgcbdtlFrs1nWaitxNswo5LAHy+hr1tBbm+AIY8u4L6IeNgdMHdRZX9FeX
         6gaHoXh3RC8J6Pg3Ac5v+AbXtnJQ8Xh+NuhywmBxrQhppavu2hhcgND0nPDj2/fhFQkN
         8nvHE/J+lESNGh8ZdD9eN1FnRjCEAp3GnCx4FPjditydlXxssV3EkNdKxg30/c8pR/OG
         SWV2IPN0Fed9u0xbbx2k7Mz2hmD5GTeALmg/RuFs1madkychnzLRlYlx9+NTXd1lkcyv
         nuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject:dkim-signature;
        bh=ctHBaiWmVMXY2dhpMNylgQi+2H3HFa+ZzDgg2Gv9ZB4=;
        b=sOpas3t1ql+aivm3a3s9ss8w60f4KPuh86USlMxTcKN8P2dlsh2TgokoxkIRJ54V4D
         SXBvWA+y2QDe8L3vYb41K2/utYnjl1VJDBNXDypyEewQwuPmi7jsFCVADBNbBdsZSb2U
         6Lc5NjxsRGnhanJ7aIlmLlDW0HEPJbZBFmkt4gVaCF1NGG3EgsvCzCBbDqvbQT4+nyaj
         27vfDcvCKXc1ihJYukUPM0l2rZCXEQ3SwbLmRUTJJCmVkZeXNp/eKtA19u8HUScF0wDA
         G/+5EDi/JWPdrpMB6YQ4Xj/yEiLY3FGiP1kK234TFOwBpk7i1QshTurP4EnRWLdr8T1w
         UwIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OuqmIQOu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si245630ioh.77.2021.03.04.12.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:28:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OuqmIQOu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuZp-00031D-FJ
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lHuUu-0006GZ-PO
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lHuUs-00084h-K3
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614889377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctHBaiWmVMXY2dhpMNylgQi+2H3HFa+ZzDgg2Gv9ZB4=;
 b=OuqmIQOuaS6/XHMveMZGGhwf3q80ILpkZdoqueDy5aBBQpvwmHC1/LncODJ5qyj7Ap1qhI
 OUQl0ANE7RkH814yA3HvjBx9p7yheZPoSx5FhiTPoVOR2t2OrZdVkuCkBIBW8DJCMOPx2f
 obSm9RQd2dZfhPkJDCws+vvrFrjsxEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-8t23iNwUMvq2cZaRNSO7Wg-1; Thu, 04 Mar 2021 15:22:54 -0500
X-MC-Unique: 8t23iNwUMvq2cZaRNSO7Wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0BCB1018F64;
 Thu,  4 Mar 2021 20:22:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-76.ams2.redhat.com
 [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D11260C0F;
 Thu,  4 Mar 2021 20:22:43 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] acpi: Set proper maximum size for
 "etc/table-loader" blob
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210304105554.121674-1-david@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <978fd3a9-88cd-f132-4234-084667e83bcf@redhat.com>
Date: Thu, 4 Mar 2021 21:22:41 +0100
MIME-Version: 1.0
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BplhHZyj6lv7

On 03/04/21 11:55, David Hildenbrand wrote:
> Fix and cleanup initializing the maximum size of mutable ACPI blobs.
> 
> v1/v2 -> v3:
> - 'acpi: Set proper maximum size for "etc/table-loader" blob'
> -- Move "etc/table-loader" change to separate patch
> -- Extend description
> -- Fixup maximum size (now really use 64k)
> - Add some patches to cleanup/refactor the code. I avoided using a new
>   enum for the different tables for now, using the table names should be
>   good enough and is simple.
> 
> David Hildenbrand (4):
>   acpi: Set proper maximum size for "etc/table-loader" blob
>   microvm: Don't open-code "etc/table-loader"
>   acpi: Move maximum size logic into acpi_add_rom_blob()
>   acpi: Set proper maximum size for "etc/acpi/rsdp" blob
> 
>  hw/acpi/utils.c             | 17 +++++++++++++++--
>  hw/arm/virt-acpi-build.c    | 12 ++++++------
>  hw/i386/acpi-build.c        |  7 +++----
>  hw/i386/acpi-microvm.c      | 16 ++++++----------
>  include/hw/acpi/aml-build.h |  3 ---
>  include/hw/acpi/utils.h     |  3 +--
>  6 files changed, 31 insertions(+), 27 deletions(-)
> 

series
Reviewed-by: Laszlo Ersek <lersek@redhat.com>

