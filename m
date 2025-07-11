Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F508C8303C
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 12:02:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaCRt-0006WF-IF; Fri, 11 Jul 2025 08:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uaCQb-0004fl-D2
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 08:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uaCQW-0007Bp-FI
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 08:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752235222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsfQbPAGizSu+f3WzVMQ6BzNeUSikFmDQ7COYP4hWWQ=;
 b=BBJMtNsXMDdKaaceuLFKYeo3oxzyazGkdn3PuS76p3vtZD4RAuVM0wfSqufl/J7uSFHP00
 CFsqESPciSLWh4+kYJ13MVzcbcpFfji/dU0pCaiuuQaBdCUpESrzif30myIzGZHR7A8XfZ
 7bnB5U7Vw9k0TPke1OxhqxyUGtXD5DI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-Z3OSay5NNhCAtZmzEx436w-1; Fri, 11 Jul 2025 08:00:21 -0400
X-MC-Unique: Z3OSay5NNhCAtZmzEx436w-1
X-Mimecast-MFC-AGG-ID: Z3OSay5NNhCAtZmzEx436w_1752235220
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a58939191eso1055224f8f.0
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 05:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235220; x=1752840020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VsfQbPAGizSu+f3WzVMQ6BzNeUSikFmDQ7COYP4hWWQ=;
 b=HZFZUtBTKYMCCykNY+82S+4LJxeyx7V7XfvvH383NDYG+kV8Me+hD1JsW4nRWVw/B+
 Xjgb1qtMKxnXR8uHcJwH8aDTHDa+gfiGM47ojuZsNVsQWd758gh4Zy9hHLd/qQbnsQQs
 7/KmWe3QvUQplkyUleuxGBFmUweDabsXEP1xQn/WjDE/1S6NcJ91YTatIw/sWjndGRBa
 VMouyQtsnVwewfpcf0cVix9sc36Pt6dz65FsBKDE6cDbdJMeHrnTb0RG21rdHbXM9O5i
 tgRbShRT9ZB4aogkT7F/j5M1N7U2nZ00ac01ypbhJ/2muBAek8aYBGPI4NeU5U3SmrV7
 GD+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqhPS4O8Q/gf9UxYLuLiLPhF/O3rchPfBF6uyx3La2edghT5ALwWIrnTkbPcl/Q6LF/PcYM0281A==@nongnu.org
X-Gm-Message-State: AOJu0YzdEZu9dF7rvgdrEQv0GBLbQP/MTQRWIrl48i5yt1leT83HIu15
 HVCjr97ia136JOiBXI+NVTheIY8iszgALip3VZt9j0YjGgspvKbLZyH+VnZKRv1ulBgAFlnVxoW
 i4Z9N0Od69W6uu3La7Hwp7Ww4b1don1Hkp1n+eisegrCzj4P/bZTkRw==
X-Gm-Gg: ASbGncsaiKbAan/LW2BjqO+SlkZO7VOy8lj68Crvrz+C0YRhdp/UZk+t1xRoXve7MOF
 MRlL59PUGniloZ1mGNZkbRs3FHP+/msGnAwAmmoXBfGVELtlzv5tZIaG+9MVDfWkGnOZ8yHxuJB
 WRa0TE9aDriLr9c2GYGSF1tmdX12sYIAaopY27OCL8rUs4uAYyxSpH8o155eJf9a8d5tAThElbX
 p41PkouNLlOJDs+DDNKY8Np1dSFNcTBbb79L6KW1A8WNbON9upZcayeg8awsplMORr7tv/mGpxZ
 2vIk+RveRRtFmAp1iLEyf5HQNoWEwA==
X-Received: by 2002:a05:6000:2a89:b0:3b3:9c56:b834 with SMTP id
 ffacd0b85a97d-3b5f187ec4bmr2727864f8f.1.1752235219781; 
 Fri, 11 Jul 2025 05:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJJK0ie71UYI5qToJl8lYWXHiuIjgju37kVlpvrhjiuE8A31z6BPQBTkzi48xoH0dhmFXwcg==
X-Received: by 2002:a05:6000:2a89:b0:3b3:9c56:b834 with SMTP id
 ffacd0b85a97d-3b5f187ec4bmr2727831f8f.1.1752235219348; 
 Fri, 11 Jul 2025 05:00:19 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d727sm4323185f8f.51.2025.07.11.05.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:00:18 -0700 (PDT)
Date: Fri, 11 Jul 2025 14:00:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, Jonathan.Cameron@huawei.com,
 gustavo.romero@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH v6 18/36] qtest/bios-tables-test: Add a variant to the
 aarch64 viot test
Message-ID: <20250711140014.0d79c004@fedora>
In-Reply-To: <20250708142437.1344644-19-eric.auger@redhat.com>
References: <20250708142437.1344644-1-eric.auger@redhat.com>
 <20250708142437.1344644-19-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: huML0DObz-Uk9Lu-TCKytJUlb5wp2PXb34g5k6CoOI8_1752235220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue,  8 Jul 2025 16:23:00 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

I'd merge this with previous patch


> ---
>  tests/qtest/bios-tables-test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4dbc07ec5e..357bcefd37 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2237,6 +2237,7 @@ static void test_acpi_aarch64_virt_viot(void)
>      test_data data = {
>          .machine = "virt",
>          .arch = "aarch64",
> +        .variant = ".viot",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",


