Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3481328lfc;
        Mon, 31 Aug 2020 00:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5r1CRXalbR1+l815T/7POhu/jCpNj3ob7lKFqUbZA9f6wh2iPbxOOuHHjiKcCm2ba/1Ib
X-Received: by 2002:a25:86cf:: with SMTP id y15mr508477ybm.25.1598859843295;
        Mon, 31 Aug 2020 00:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598859843; cv=none;
        d=google.com; s=arc-20160816;
        b=safkaKrp8LWCNJ9+A/7B7tkN9PAMUsvzfhA560c7xNsUMaAKUXPVOfTo8NcQNErgHU
         gfdkSicOqlSGVL77Pmbdt/Dv8WbRrxnKqrkXmN2hdp7I+CsS1m4S9/9TnFOV/acgpMHM
         fUvzV4V+iLNxXQWY30nYpfT8PDdulHBV7Td/3oceuCk8zTbjzAmYGmxr1gkCOnYnGNPR
         hAR0on2F6/GskRSxKYDfmZ2/6OKr5+/CGA4ePIgCiH99Jzle9AvSqezgNXDaH9m5Y+2L
         +tfjq4rkEAqesM8wXIQ2pFk10DRo1uegeTjaVfRnf4t2mCEurks6jR7bStKBSkb93Yit
         kMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=OsjwWrgic/cYyyUqoALNr2FlB6bv5YBmePkEal6EkTI=;
        b=f+ZkW0GHwgEVOTco3ixGiAIfRFevxJQV9NrEw7IJNMsQpp4FT0JjTok5CYxl+xyr+1
         aDVcmrUdegHO5iyJk4iaJQhc11y5fV1m7YXbP7p4cAp6zZPnwLa5K6wJ0Ppag4cnDPD1
         9KInRfHkH5gmR8xUwHzYHq3TZZW5LCbz+oqrykdzACrdtwQJTA5ZgAfPXWTglDnEv8Ns
         Wi9I0K+VGv4so3fiV37vwH53L4KdajwBkOISVSSltRr/GV+ila4Ta43xwmdDyJ+jvHBX
         qnANdechgfK9X6EkKvp6bctQaJCb+8c4USFXhsbfw6WE27TR3l7TxGWIBiE2vLWYZBkP
         TQyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WOnN6nqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si8696435ybt.216.2020.08.31.00.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 00:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WOnN6nqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCeTy-0008M8-Nb
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 03:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kCeTn-0008Lt-30
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 03:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kCeTl-0000Ud-0u
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 03:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598859828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsjwWrgic/cYyyUqoALNr2FlB6bv5YBmePkEal6EkTI=;
 b=WOnN6nqrPBDIqBZ0IPvJCxQhEPj8qjTqInerZ1v7YisjjmLukX2plVYDUiYXAifc3pvjwt
 E2Q6e+Hh7Yb0KgpCH8jcOF5B5g91DT+bSUJfZ9f8Rq0M6XiCUmwbJA+Duv36sss6AC+J2g
 2KVEhN3fkg+YO2CRg6nB3dGJnBclH58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-codUC4dpPS-hBRxzGFz1Jw-1; Mon, 31 Aug 2020 03:43:44 -0400
X-MC-Unique: codUC4dpPS-hBRxzGFz1Jw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A61C10ABDA3;
 Mon, 31 Aug 2020 07:43:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90B415D9D5;
 Mon, 31 Aug 2020 07:43:27 +0000 (UTC)
Date: Mon, 31 Aug 2020 09:43:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 19/20] tests/acpi: add microvm test
Message-ID: <20200831094322.38b0d571@redhat.com>
In-Reply-To: <20200826105254.28496-20-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
 <20200826105254.28496-20-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:43:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IOWCphdnkev+

On Wed, 26 Aug 2020 12:52:53 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 058ba3886659..883532e531d6 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1008,6 +1008,20 @@ static void test_acpi_virt_tcg_memhp(void)
>  
>  }
>  
> +static void test_acpi_microvm_tcg(void)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = "microvm";
> +    data.required_struct_types = NULL; /* no smbios */
> +    data.required_struct_types_len = 0;
> +    data.blkdev = "virtio-blk-device";
> +    test_acpi_one(" -machine microvm,acpi=on,rtc=off",
I'm just curious, why rtc is off?


> +                  &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_virt_tcg_numamem(void)
>  {
>      test_data data = {
> @@ -1119,6 +1133,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>          qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>          qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
> +        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);

