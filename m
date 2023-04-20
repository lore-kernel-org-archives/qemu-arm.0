Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp449435ejm;
        Thu, 20 Apr 2023 06:59:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350auuVjkjdKdioduzgpdac5Q3Ul7OZdZRJOpmbI0vA3hzUYGmZEpKIJrP9xZVXVV0lAy6xn5
X-Received: by 2002:a05:6214:e67:b0:5f9:a647:2ab5 with SMTP id jz7-20020a0562140e6700b005f9a6472ab5mr1792565qvb.42.1681999197246;
        Thu, 20 Apr 2023 06:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681999197; cv=none;
        d=google.com; s=arc-20160816;
        b=GLFYbOKYATHL7qgx2kN58O+nLkvpr1NjoGdGLTjmFl1kdbH/vi2H8KNmm0tb3jW8eq
         2iSFndRM6v26foBL+nd4hkGsjYklOhatPZ+6Je+aNJDyPBOpo00q9GTQDtfAs5bg2vbz
         O6+8XN3d4TdqUZwCdOMkb6XdWHcCtAbOmDFEqYlZen1Zp+ThEBcceIxVwubpuEePFomR
         qz17Iv/DU1UlKmzrHD5BB5XVZK7jLqEnwQRPSyCCzWlABfkl84Gk375c3dg5gou458f/
         1FEQIxStmSVJ2n2klto6k03T+MaPQFEN2/mJuXP9ylsMpaX2bM7bI/sWE/q5bKizPOh0
         woPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=mYBR6Uft8trUDBfxK0nZ9GzxgII6V5rGa9d1il5RRwA=;
        b=PdkrZInkQPguDAK5ZXH5sR/qUDmt12oOJnq9ixRRQqij8LG//WKsLdOIcE12ewB8cG
         E/wL3Bierr9j21dxFgJwQaNOOHQSye1thfB21dSHvgt5io8rulfhoVgC02xkBDKpBxsH
         N4dJ31p5DfogghU+CkxQ6Y5c4OtNQ0xekUuLQDrVgzJ6hqV7ztEEZecNLrNv0yyf4K2D
         /Ez02byJ0EcgQk27kCXBSNMrzH8hKlNiIivXWfvivBUApscWJ+giNpmFKa6OQXVtE3mm
         kbPy1Y+BmVXJsLpJSwF2Zq1kkl24FTXcF4jju4840oFUsZI8kcDQCUfcgSpMfeKukuUy
         oEqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y+jGJ0eM;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1-20020a0562140c2100b005ef62ae0878si1297455qvd.523.2023.04.20.06.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 06:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y+jGJ0eM;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681999196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYBR6Uft8trUDBfxK0nZ9GzxgII6V5rGa9d1il5RRwA=;
	b=Y+jGJ0eMuQZnnZausyiOMus+y5R967iGs5v6NpUhsBuqk/nuI03ufbDqkIPqT6jLi1yy+7
	qhrRNXhoJemzMFTvVwJi24A5R/HTPPTyd0O6ptCziaGaE+neu5dRbwZIy8QCr9ONc9yfVo
	keZ4cGFY5ePsdhB/DaWCTAJfbbcklsA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-oqk85Fr5N2-wuc9w82_9FA-1; Thu, 20 Apr 2023 09:59:55 -0400
X-MC-Unique: oqk85Fr5N2-wuc9w82_9FA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-5ee8e5e93d7so4088276d6.1
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 06:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681999190; x=1684591190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYBR6Uft8trUDBfxK0nZ9GzxgII6V5rGa9d1il5RRwA=;
        b=b3wJwi7lENteAnqqRluCXezUznsgtHjmbaUTDXeo6Ip75PrAgICWEtJyFgfQbWaN4R
         ayEzh5EijMSf4NIceK1fl1zLqYjPQGvSu0Yzn+hp/vrceXuAXOmyWrB8KgA7okdaYC78
         nkvsveI71+I0usleYgRYSuPBg7oiWazPttKva8BYUKWyG/tcnc3zlLMS+a3qELeT3OwO
         QOMxvKdv9ZlCB6yzsaicJA4OtERdshRATFN0p7NGgJ96pJZqAObr+JLbHRSNAeOBqWFo
         aNtqPVfXFc4XFPATvZrZmQ0OOMj05ac2pmx/00gtrQyXXROxwVS0gsy9FXff8ZWAvmy0
         0Llw==
X-Gm-Message-State: AAQBX9fAOlwA0BTrYyDQDt4VGdR0McYOVZ+gAhKUnKGNwVVN+yPFK73q
	oHLACHdr7tPOK+8dt9plCUAbP/s5ziz25FqRSbjOuj8JO7ai+08Zg5wL+rgUxYK7ErJmRWeZD3T
	Zs5pk3loEVoLuijZ1
X-Received: by 2002:ad4:5c6e:0:b0:5a7:a434:c300 with SMTP id i14-20020ad45c6e000000b005a7a434c300mr2456998qvh.15.1681999190465;
        Thu, 20 Apr 2023 06:59:50 -0700 (PDT)
X-Received: by 2002:ad4:5c6e:0:b0:5a7:a434:c300 with SMTP id i14-20020ad45c6e000000b005a7a434c300mr2456950qvh.15.1681999190126;
        Thu, 20 Apr 2023 06:59:50 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id y19-20020a0ca913000000b005ead964bfa2sm409010qva.127.2023.04.20.06.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 06:59:49 -0700 (PDT)
Date: Thu, 20 Apr 2023 15:59:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, Eduardo Habkost
 <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck
 <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v10 07/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Message-ID: <20230420155943.0c081b50@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230412121829.14452-8-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
	<20230412121829.14452-8-farosas@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: CHwMPgKRE0dG

On Wed, 12 Apr 2023 09:18:25 -0300
Fabiano Rosas <farosas@suse.de> wrote:

> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Skip tests that crash or hang in the above scenario. Do not include
> any test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 11 +++++++++--
>  tests/qtest/boot-serial-test.c |  5 +++++
>  tests/qtest/migration-test.c   |  9 ++++++++-
>  tests/qtest/pxe-test.c         |  8 +++++++-
>  tests/qtest/vmgenid-test.c     |  9 +++++++--
>  5 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 8733589437..9c3642717d 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2082,8 +2082,7 @@ static void test_acpi_virt_oem_fields(void)
>  int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
> -    const bool has_kvm = qtest_has_accel("kvm");
> -    const bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm, has_tcg;
>      char *v_env = getenv("V");
>      int ret;
>  
> @@ -2093,6 +2092,14 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        g_test_skip("No accelerator available");

perhaps 'No KVM or TCG ...' would be a bit better

> +        return 0;
> +    }
> +
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          ret = boot_sector_init(disk);
>          if (ret) {
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..28bab3d5e4 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -287,6 +287,11 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No accelerator available");
> +        return 0;
> +    }
> +
>      for (i = 0; tests[i].arch != NULL; i++) {
>          if (g_str_equal(arch, tests[i].arch) &&
>              qtest_has_machine(tests[i].machine)) {
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3b615b0da9..24deb2d432 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2462,7 +2462,7 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    bool has_kvm;
> +    bool has_kvm, has_tcg;
>      bool has_uffd;
>      const char *arch;
>      g_autoptr(GError) err = NULL;
> @@ -2471,6 +2471,13 @@ int main(int argc, char **argv)
>      g_test_init(&argc, &argv, NULL);
>  
>      has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        g_test_skip("No accelerator available");
> +        return 0;
> +    }
> +
>      has_uffd = ufd_version_check();
>      arch = qtest_get_arch();
>  
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 62b6eef464..5813adcf56 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -131,11 +131,17 @@ int main(int argc, char *argv[])
>      int ret;
>      const char *arch = qtest_get_arch();
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No accelerator available");
> +        return 0;
> +    }
> +
>      ret = boot_sector_init(disk);
>      if(ret)
>          return ret;
>  
> -    g_test_init(&argc, &argv, NULL);
>  
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          test_batch(x86_tests, false);
> diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
> index efba76e716..a597cde707 100644
> --- a/tests/qtest/vmgenid-test.c
> +++ b/tests/qtest/vmgenid-test.c
> @@ -165,13 +165,18 @@ int main(int argc, char **argv)
>  {
>      int ret;
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No accelerator available");
> +        return 0;
> +    }
> +
>      ret = boot_sector_init(disk);
>      if (ret) {
>          return ret;
>      }
>  
> -    g_test_init(&argc, &argv, NULL);
> -
>      qtest_add_func("/vmgenid/vmgenid/set-guid",
>                     vmgenid_set_guid_test);
>      qtest_add_func("/vmgenid/vmgenid/set-guid-auto",
