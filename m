Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3069332lfm;
        Mon, 29 Jun 2020 08:06:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm7dQplIh9ECSgkctrErSjVIugiRf/dciUAM4M/dXrp3sju8rcgUiONrG+sYD2FIGeO5kE
X-Received: by 2002:a25:d2c4:: with SMTP id j187mr29829426ybg.33.1593443196002;
        Mon, 29 Jun 2020 08:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593443195; cv=none;
        d=google.com; s=arc-20160816;
        b=et4ATDDclpZSxPV2ZtUEPSAOil9PKhwiPOHQtDNSuoNQUSQ87FGBZqPQj3sXr4Zm25
         gx1SdwDOadO36XvtblJBNpzd8qNQcVvh7xXHhtrdDE5BsQHzUEE7VBFoqh9Ev/0wohHm
         XCipwMmBB9OtYJcWXcFtWDoxN6UHRR4czKNZsoE+gGW8/BuiqkNrqfzPhlreH9LtZnjC
         Mk3MV8R5D++vAdVcO5oVG/rHdN2I0oTlwcDgIRmEkS+ZM84uxkT/jZExSkpVKkCc+ENG
         iwgZWe5kOWmmrgamcuGkG33qXcxYzZYgCwZyGrl5DQ9Oi8nJ4yDkalz5+2f2idcUezNQ
         AXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=P71wirPiCaM59Ua8QEoG2At1u81AQQAwkL/F+klRUVo=;
        b=oDxDP5ZiwyprLW5tSV/A0nKL9aiceW+tRQ0Luejpk/VsTx9A3cCsyLVxFD4AWUlwgz
         C6KCMJ/RCye7E84oSx1UemXBKRxhjgMos5IWY/yn+Edc7KS3QhI6wNQMAgf5av+8ZnFp
         NQ14mx2rJVtZU7fpSTGAqcA3vf6QEj222vtdFHvxGYcfB07bZpl3Saq1nkkmJefyZPH6
         onrjC1uux988nRyKDhURcJn/Ka7RLj4VKUjBaSad4p436nO5Ac/yrd2OZIUQodoaSwZz
         eWJ9GSOV/Elg4lcdxB5KIGoYS6Nuhmvy12tIxoFlqDB77z8npl/qaa2oxTOapnY5Fvin
         UJ+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DfoGEm+8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r30si13057646ybd.146.2020.06.29.08.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 08:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DfoGEm+8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpvMh-0002FE-7v
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 11:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jpvMY-0002Em-5z
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 11:06:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57031
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jpvMW-0006CO-3X
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 11:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593443183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P71wirPiCaM59Ua8QEoG2At1u81AQQAwkL/F+klRUVo=;
 b=DfoGEm+8kLjWz8NdP/rG4tzzPs7H3uXBFyptfOFRMwIO3QjbTx9xyWjDuxBTjc1gwk3nNi
 krpGfskN9v1GmmOETE4XucVE9CKqpXTwFrs5t/vUjaIGFR91d14FhHQvdBAM4ioHB6cNuP
 ZXNAYjyR5XeOikIC+GFwAphzRkfFOzU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-VJHHsXUTPcuDg2R_IUjiqA-1; Mon, 29 Jun 2020 11:06:21 -0400
X-MC-Unique: VJHHsXUTPcuDg2R_IUjiqA-1
Received: by mail-wr1-f70.google.com with SMTP id h28so16578222wrc.18
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2020 08:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P71wirPiCaM59Ua8QEoG2At1u81AQQAwkL/F+klRUVo=;
 b=A2unp1Fq2irXop1TjbhWd5ACs8m5mfaUQDP6Z5dno830NuIGyyW4WxE+rSQRhe9les
 DA8phnECslKcxPgTTJeI1wbbrsMzP58dKDt8O2LASykzlRXK0Sekr46tEm4pWJ7UAROO
 EHtAfbxLOmhGHPh5let77UBQWkRkQ6zgYghgWi0w1srMnMICdUy9NKmjJH60LMBdKzOy
 ADR7zN40nlQb/w78IRL6QcCUXHnpbWM+tSOljLUKwB7joZSiQFQomuF+nKaKmJW/BskH
 /ttNII+rUdnGAIy/S/dz14C9mC7iQ57goHGZOmtRPubKkjigxgvexAE0aj/qOPUf7kc4
 19Vw==
X-Gm-Message-State: AOAM533hEaZkTHXs64RrobqwdlcckxqjHEQbm1yKtWLLO3XzMFThbzqb
 gZnu/w3LJCtj3L53NxyX9kvILJu2tXTwU+L17oKDTyq5OhqK0RBEHY3g4vHUO3Vf8YiMQ5U2qrM
 kbvOxQWCJ8TFw
X-Received: by 2002:a5d:4202:: with SMTP id n2mr16899205wrq.171.1593443179914; 
 Mon, 29 Jun 2020 08:06:19 -0700 (PDT)
X-Received: by 2002:a5d:4202:: with SMTP id n2mr16899184wrq.171.1593443179717; 
 Mon, 29 Jun 2020 08:06:19 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 z25sm65472wmk.28.2020.06.29.08.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 08:06:19 -0700 (PDT)
Date: Mon, 29 Jun 2020 11:06:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 1/4] tests/acpi: remove stale allowed tables
Message-ID: <20200629110443-mutt-send-email-mst@kernel.org>
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-2-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200629140938.17566-2-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:10:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ard.biesheuvel@arm.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uRz04Z1I+j20

On Mon, Jun 29, 2020 at 04:09:35PM +0200, Andrew Jones wrote:
> Fixes: 93dd625f8bf7 ("tests/acpi: update expected data files")
> Signed-off-by: Andrew Jones <drjones@redhat.com>


Ah yes. Thanks for fixing this! I will add something to the pull request
script to catch this in the future.

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 8992f1f12b77..dfb8523c8bf4 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,19 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/pc/DSDT",
> -"tests/data/acpi/pc/DSDT.acpihmat",
> -"tests/data/acpi/pc/DSDT.bridge",
> -"tests/data/acpi/pc/DSDT.cphp",
> -"tests/data/acpi/pc/DSDT.dimmpxm",
> -"tests/data/acpi/pc/DSDT.ipmikcs",
> -"tests/data/acpi/pc/DSDT.memhp",
> -"tests/data/acpi/pc/DSDT.numamem",
> -"tests/data/acpi/q35/DSDT",
> -"tests/data/acpi/q35/DSDT.acpihmat",
> -"tests/data/acpi/q35/DSDT.bridge",
> -"tests/data/acpi/q35/DSDT.cphp",
> -"tests/data/acpi/q35/DSDT.dimmpxm",
> -"tests/data/acpi/q35/DSDT.ipmibt",
> -"tests/data/acpi/q35/DSDT.memhp",
> -"tests/data/acpi/q35/DSDT.mmio64",
> -"tests/data/acpi/q35/DSDT.numamem",
> -"tests/data/acpi/q35/DSDT.tis",
> -- 
> 2.25.4

