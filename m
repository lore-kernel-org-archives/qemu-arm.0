Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1019829lfm;
        Fri, 10 Jul 2020 12:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybuObzazH2fU7OIgDMfgvgImWu28cF3/Tf8BmxtLbjC85EJ4mzUSAYAh05L2d9SkkQUjhD
X-Received: by 2002:a25:2315:: with SMTP id j21mr74378001ybj.251.1594410631770;
        Fri, 10 Jul 2020 12:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594410631; cv=none;
        d=google.com; s=arc-20160816;
        b=g6VO1/R0z4TKwDAgVUjKHLNsXKQZF/V7knpMYgv4hwoQRyXATTpyNwRo0MoL0IB9M7
         2DIHbVt7tow5ExnMHYjrC9kPiLjzbw8KGNwReiftqsQnWQMY+nxtyh8SMzSuHdzqCdUp
         b23hGNPrHMky2DCtMb4CfavQxiqXpdY3IFGY/+q4x4dLY8kdCOTInHSkNQEnitRNQ9nx
         k+B3i64UtJV0BBGXfBub0qcIrVEcHXIUvGE/gWrnveklflqJaw4YsESFU0OAMktZOTc8
         vyiquRQuyfoKJgcuRIqsR5HjkE8raSlS8U331io6jfvJt+mwhcsOPt2QC5cwJNux0HcA
         cn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=bu762bAt6ancOo0D8yW2M5mylzUvStKHJZxz0iX1nX0=;
        b=mCxdQujPZgeCpRHM7yjmsQ+cAVnuI7KJ2240yCh3c2dOPNNxMFjTNVzigW7V+qG/2w
         PLwXi6nmd9Jwv8Nia1wTBOgmvCSaaHG6kBrjXs7Cddo4/WoB2XxNiTfgVUwG35IBojd3
         fW4f9UDxT788K/rOrjgrg299spqqj+PrlRMst9KmZUs2nFvhmzlp6ovAOF/n3v7IRQuk
         G2z4cBblXffWHj5aVrlVf7HscUPxpPf9GJ2DLb3bWB7w94aJQz650jEXrXnQRolvBaEJ
         s3ThqRw+6b1P/lqizs6wfDeNxQMdkkcMPPgHO/CWL/oIVQo1X+vz+mezCPx9ONdP/Vdp
         E27Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BJbkpxcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c64si6579212yba.83.2020.07.10.12.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 12:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BJbkpxcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtz2V-0002M9-4l
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 15:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtz2O-0002Lg-PI
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:50:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41472
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtz2K-0007qc-Mc
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594410619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bu762bAt6ancOo0D8yW2M5mylzUvStKHJZxz0iX1nX0=;
 b=BJbkpxczseZvK7csbgAaOZ/8Az/+k0Y5WGCFZvpVPDsAbVqvhxqt8WCE40Vj4Q15DoLSzI
 v5RrxemUisf1D51C59e4oSn+d7lp5FX7eBYGmCLg5CoVfyq4my70kVg+um3AoK4U8lBVeh
 obkyA4VJ6b59KXUSqufMwNfyvZPvUYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-Dohp9c58PruyWu9q0AX2HQ-1; Fri, 10 Jul 2020 15:50:18 -0400
X-MC-Unique: Dohp9c58PruyWu9q0AX2HQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAF6C8027EB;
 Fri, 10 Jul 2020 19:50:16 +0000 (UTC)
Received: from localhost (unknown [10.40.208.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF71278A5A;
 Fri, 10 Jul 2020 19:50:00 +0000 (UTC)
Date: Fri, 10 Jul 2020 21:49:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 19/20] tests/acpi: add microvm test
Message-ID: <20200710214958.36978f12@redhat.com>
In-Reply-To: <20200707125356.32450-20-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-20-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 15:08:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9zSF30eFir/B

On Tue,  7 Jul 2020 14:53:55 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 24b715dce780..b5b98d5c0742 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1007,6 +1007,20 @@ static void test_acpi_virt_tcg_memhp(void)
>  
>  }
>  
> +static void test_acpi_microvm_tcg(void)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = "microvm";

> +    data.required_struct_types = base_required_struct_types;
> +    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
I vaguely recall this belongs to smbios tables, does actually microvm provide them?

> +    data.blkdev = "virtio-blk-device";
> +    test_acpi_one(" -machine microvm,acpi=on,rtc=off",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_virt_tcg_numamem(void)
>  {
>      test_data data = {
> @@ -1118,6 +1132,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>          qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>          qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
> +        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);

