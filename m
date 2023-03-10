Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1745361ejc;
        Fri, 10 Mar 2023 02:13:45 -0800 (PST)
X-Google-Smtp-Source: AK7set9kLJaW468z1emfjsey1sRdM0t0Gy4a3hpTf7wGpYTi0n9EgRW7R2jx2b4SuohLubshTPdA
X-Received: by 2002:ac8:5d88:0:b0:3bf:cc89:9c8f with SMTP id d8-20020ac85d88000000b003bfcc899c8fmr42346808qtx.68.1678443225086;
        Fri, 10 Mar 2023 02:13:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678443225; cv=none;
        d=google.com; s=arc-20160816;
        b=yqDoR8z5xTub2v7amk2hovIVDTmF0xY7SdIBOTxqyuuMe6eOja7hp4rW76XXPJCy7f
         6yYP/3Zk7fui142K8G7txPTqgdTQaOzKfyYBSrlrOhKQL3DCz8duD5k4yAqzTg3wTOI2
         8hjs/4XhgiMsnFYWuJ9lxi69C5FzgPVKdMJ9vCHxFA6cZmbB4sG2JDfxm26GKvp2CIV7
         9CkZ2MSZAfOQVzAHhX0d5QJCLWrwuzorLTTkdM92AEWXOnXe1Sq1neoahqtndjkU8At/
         ClPc+uW+0b8uxmK7MS5cO0t221oxF0gt05SOEYzjoApIvEYr1Ibz7TPfCSVEoI4wu8+K
         iAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=c6dyfBbHrQmIFXX548DwdbrYMJG/HPnUsCZBuj1Qkiw=;
        b=PdHJOtAM/tqWRx1DGCKYM2sceZ63qQSa2Ne6kv4/GXNciLUzyLrjUli31laFH3BUe8
         vjNalfPpGw1O9DNceY/UsLZHJqWqrvcsgOjoZ84up9Le/QfbU4dPm1Kl6UbdVLVi/lE3
         L1R8+S7/WlFp3eiAB3cZ6sZ9dn38e2SgSBltQTDRAqIdPf+BJGrEY+3blC9MEZa7c/7Q
         eXx9JuT3iyDPIA9KpA1wM0/nM55//o9H2GeoVW6v83pROaguLfNAYm+8ti909Sss5lua
         /k9UzyX3p3Y+EX8jlOpqgdrMA6PSCLYuyFV7QrAbmZ7+LIG5Kk/KM1P0+vZFb2JA1vQo
         po3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnHxF3U3;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id m15-20020ac85b0f000000b003ba393221ddsi1258810qtw.362.2023.03.10.02.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:13:45 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnHxF3U3;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678443224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c6dyfBbHrQmIFXX548DwdbrYMJG/HPnUsCZBuj1Qkiw=;
	b=GnHxF3U3rzUKavQu/HtP2azHW+OBnLKRgbHVxcjngb5RWOhCYAZPlw078wcl63k/NkSsHd
	KqPK55GyqIl37UlRzWIDuLgRKL6Sr1qk6RmUZt14eh3nu+R/JV6sBj769EFqkT3eUUWuH9
	TflQ9TMdWcrerw2UeM41m7OPzxRw2VQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-RAxDuDPtOBSo6VIAETMBkQ-1; Fri, 10 Mar 2023 05:13:43 -0500
X-MC-Unique: RAxDuDPtOBSo6VIAETMBkQ-1
Received: by mail-wm1-f71.google.com with SMTP id j6-20020a05600c1c0600b003eaf882cb85so1785303wms.9
        for <alex.bennee@linaro.org>; Fri, 10 Mar 2023 02:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678443222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6dyfBbHrQmIFXX548DwdbrYMJG/HPnUsCZBuj1Qkiw=;
        b=fn3yJebvpgsUbzgwoubGZ/fDArsNs/FVhIwB92Lho0CuDlxxtE27WLoTB7Argajqkv
         qy8lFfF0CYgv2eGKzA9zBZGuaQY7/6KeJLhDxBrh2AUaiR9pghepSPmznKhrYLGeKKcV
         zAAjplGgFpr0bzJfaWi4xW5a/X/HVRdQ6Hpj5uP2F9ZVvNGfuC4IDficgsppaG+WQ0mt
         bEBGEYNfv+IOsTV5vf6SubyUrTmyiAt3/2lAIskJkBI8ytl2/AmndJr8eL5INyQo2RkK
         ep/EcfYpxLtw9zdXbksBpPCFTZ/g7sCvYesJDGFwTMA/e6s+4K9Jeu9e1r0lEM5wbFXX
         lLFg==
X-Gm-Message-State: AO0yUKV0e3vJ/jOaG0OMkZCdCpFfb6fa6VPJaNS+YKYR2mzWNWLBvHMC
	yJAUshsoE8fgErx8vTHzcA99/yqC4rQSqH1Up9IXjBtpJdDBScaHI9t7Qhf5hCUXHENTJZeFIJk
	r49mHcdLMzrQH49BM
X-Received: by 2002:a1c:4b13:0:b0:3dc:16d2:ae5e with SMTP id y19-20020a1c4b13000000b003dc16d2ae5emr2070348wma.32.1678443222480;
        Fri, 10 Mar 2023 02:13:42 -0800 (PST)
X-Received: by 2002:a1c:4b13:0:b0:3dc:16d2:ae5e with SMTP id y19-20020a1c4b13000000b003dc16d2ae5emr2070327wma.32.1678443222179;
        Fri, 10 Mar 2023 02:13:42 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.9.88])
        by smtp.gmail.com with ESMTPSA id x20-20020a1c7c14000000b003eb5ce1b734sm1683520wmc.7.2023.03.10.02.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:13:41 -0800 (PST)
Date: Fri, 10 Mar 2023 05:13:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Message-ID: <20230310050853-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
MIME-Version: 1.0
In-Reply-To: <20230309201434.10831-9-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: Dag3qqUc1h5A

On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Fix tests that crash or hang in the above scenario. Do not include any
> test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

I don't like it that it's a pass not a skip.

Also, if we are not testing acpi should we not
skip building acpi?

Also, a misconfigured qemu would previously be caught,
now it will seem to pass tests.
How about a special make check target that will just test
xen things?



> ---
> This currently affects Arm, but will also affect x86 after the xenpvh
> series gets merged. This patch fixes both scenarios.
> ---
>  tests/qtest/bios-tables-test.c | 10 ++++++++--
>  tests/qtest/boot-serial-test.c | 10 ++++++++++
>  tests/qtest/migration-test.c   |  9 ++++++++-
>  tests/qtest/pxe-test.c         |  7 ++++++-
>  tests/qtest/vmgenid-test.c     |  8 ++++++--
>  5 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index d29a4e47af..5cbad2f29f 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2109,8 +2109,7 @@ static void test_acpi_virt_oem_fields(void)
>  int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
> -    const bool has_kvm = qtest_has_accel("kvm");
> -    const bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm, has_tcg;
>      char *v_env = getenv("V");
>      int ret;
>  
> @@ -2120,6 +2119,13 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          ret = boot_sector_init(disk);
>          if (ret) {
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..406b4421cc 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -17,6 +17,9 @@
>  #include "libqtest.h"
>  #include "libqos/libqos-spapr.h"
>  
> +static bool has_tcg;
> +static bool has_kvm;
> +
>  static const uint8_t bios_avr[] = {
>      0x88, 0xe0,             /* ldi r24, 0x08   */
>      0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
> @@ -287,6 +290,13 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_tcg = qtest_has_accel("tcg");
> +    has_kvm = qtest_has_accel("kvm");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>      for (i = 0; tests[i].arch != NULL; i++) {
>          if (g_str_equal(arch, tests[i].arch) &&
>              qtest_has_machine(tests[i].machine)) {
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d4ab3934ed..7eedee7b2d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2459,7 +2459,7 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    const bool has_kvm = qtest_has_accel("kvm");
> +    bool has_kvm, has_tcg;
>      const bool has_uffd = ufd_version_check();
>      const char *arch = qtest_get_arch();
>      g_autoptr(GError) err = NULL;
> @@ -2467,6 +2467,13 @@ int main(int argc, char **argv)
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>      /*
>       * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
>       * is touchy due to race conditions on dirty bits (especially on PPC for
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 62b6eef464..935b661dac 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -131,11 +131,16 @@ int main(int argc, char *argv[])
>      int ret;
>      const char *arch = qtest_get_arch();
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
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
> index efba76e716..9eb6371ae8 100644
> --- a/tests/qtest/vmgenid-test.c
> +++ b/tests/qtest/vmgenid-test.c
> @@ -165,13 +165,17 @@ int main(int argc, char **argv)
>  {
>      int ret;
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
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
> -- 
> 2.35.3
