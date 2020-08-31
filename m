Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3756518lfc;
        Mon, 31 Aug 2020 08:01:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdBzI+icRZrCqS43PpBkL8aly+g72FhVLizMbUCxy06zfedldq9bPelSshGbll+lx76KRS
X-Received: by 2002:a25:80d3:: with SMTP id c19mr2776953ybm.13.1598886113588;
        Mon, 31 Aug 2020 08:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598886113; cv=none;
        d=google.com; s=arc-20160816;
        b=i7DKSwc6zt5b8ibx2ZqX6EGHxmgY5iq7dxDYlnrEEeYlnnd/v4jKQjuyQ1DoJ/2lhB
         TElxj89nlhkV2b+k97W5UMPdC1qJl/e7odchH4OlJFYYo7FVvw0U/6Zih+OdJnV0c++C
         IANuuizRfaiB5NFdzww4TpNVpvjLmTGFfchmv+PwgSW7XAFnG1x5S95it+LYbH4snwK8
         uHce5tivpJiipOpG634fIN3GyVDev0E0iOGX6OgL1/BTQrNrrpP7cReyisuMs5GMno0g
         9VKIlEYul3mgjWVEm9ITATU6P482FO4yui3cx1qGEdJeWqmk1F2nqfOg3DJJ/YyaPnD2
         4JFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=FIBqkeSMyjy7HGrXD1kYgtXiDH4R/EO970hVn/Ox7As=;
        b=PPH/RTagEUpELA3KMV9sY8rs2nuwl8tN405tgPtcZn1qUr2+Tt5GbvGluTe6767fsE
         FHPPcU2WZbC315BS0AH8UgbAcj/JCffTd7HXR53o3cb0OPYMCwnagy5YS+SFxYKxFzyD
         f/79vB9K9/ELt5S4i3E15etCjZ5B+YJe/O6V6amdSJIQDKQqmdmMyRkrcDVaZDQd2LJe
         2RTgqvSXSVsIMCTRLtXUFJYSAEJOYZxG+UhVvU55PqxB9wzuu7hv7ZCJRzowfBOWV6lH
         2W1OKQAuC8iYfjPC19+IkUF1I+gd3y4XTW6MwIndUqUwHDIpsyI3zkbKqK1C913QdZhe
         y1RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H4vgLxqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si9436923ybr.120.2020.08.31.08.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 08:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H4vgLxqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kClJg-00063O-OY
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 11:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kClJF-000634-S2
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 11:01:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35127
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kClJ5-0004Q0-OC
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 11:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598886074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIBqkeSMyjy7HGrXD1kYgtXiDH4R/EO970hVn/Ox7As=;
 b=H4vgLxqCaXRRbYTyegIqj7LAE3G3elPg+3qWquABEEKBwfeTR7DW7+zIMLyeB5F0EDrJUa
 +0JmjyCnYBi/7gJsAAeC9jUMBX+zAVCM0Y5qy8SLLjhxwp9i6UG3l+/dLNONocLMGZE4yn
 oW3WbkYEpcyyQDgd/KfqJ/8kfC/pFtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-g2LmPW0AMWeoIx0qyhD0Pg-1; Mon, 31 Aug 2020 11:01:12 -0400
X-MC-Unique: g2LmPW0AMWeoIx0qyhD0Pg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E745618BA286;
 Mon, 31 Aug 2020 15:01:10 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F1BB5D9D3;
 Mon, 31 Aug 2020 15:00:50 +0000 (UTC)
Date: Mon, 31 Aug 2020 17:00:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 19/20] tests/acpi: add microvm test
Message-ID: <20200831170049.27d1ce5e@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 11:01:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VC0PBme+VLgo

On Wed, 26 Aug 2020 12:52:53 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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

