Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1741513ejc;
        Fri, 10 Mar 2023 02:08:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+Iol+iislW+VINfUIy1oFdoxs9KbMKBC9Le7bEnW0iZ1wbecMu2FJDg30H+mSWkza0H+w/
X-Received: by 2002:ac8:5803:0:b0:3bf:cf23:7e21 with SMTP id g3-20020ac85803000000b003bfcf237e21mr42391328qtg.48.1678442926762;
        Fri, 10 Mar 2023 02:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678442926; cv=none;
        d=google.com; s=arc-20160816;
        b=W5txQHneQWhNtLsZU328FuacsthIRpFBREvcp/hooqvTU7A+Wz5GZF4XEiepF0k+k/
         HjYllzTLgcXKmzzrtopKdQuiTyeyWgMnRloUMfoGRmqDoa+8MvKBj1Nn/IK4yVxjEULr
         mksb9xVije9ixGzPHri1E8BaYGJzq6wL+8ESR+rXQp1D1M+356FIixg/deJEudJsJCaV
         4ftgRTvir4pA4IUqgLMHvjeeie+l3nqcrKaf4UHuT34HmSO0phixPZgbXG74OT4HwMG+
         J3aIOZtqTtKuupFO54aFfA1VLO+gfyfgtiqv4QGTqFQgClvbOG2T+YXqw9j4aAV0TboN
         uwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RUpaRZtvDE6dumiX9MCrj7jilPejIULl9NYGQmI8ieI=;
        b=oT9XsKpLZVRMm0rWqgQnWJa3CvHmnouZB+x8YqCKjS6pwox4lu4HwnegIfx1iEnnsI
         3QvC0j1xw/I9Xq+Tx5tcor95lqEQ2s7Es9VQXHORSFXKE7WzhJCzXwxnlNFTSpWgE8ny
         YW/BcFptnNWVj14wgBBQKEgSjR9EocZeCC9aQr1jTE3vG12c9rPrOOpULu7UoOJffm5c
         CQWErpttGeKtpcnoVpVY9kZC6TrwP+9QlCXAStPpOkuxdHdEzJOgjF5TpNvlAtr5uFPf
         g58/cs6JSum6+glxi6YVfqvIP6NXFBotVjqxvM9mslCfPgSkXa9nemO92BpPJKHbKa6G
         7w9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D31w49ks;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g12-20020ac87d0c000000b003bfc2921bdcsi1280322qtb.123.2023.03.10.02.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D31w49ks;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678442926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RUpaRZtvDE6dumiX9MCrj7jilPejIULl9NYGQmI8ieI=;
	b=D31w49kstUENrdtgowT44c41GdS/Fe8IVrmHax8X/tvo9oMdIq8m72lV6eQsFXR2A87IDT
	ed5nY6jVE6xDDMtP7460JqPjC9Dd9j4vDf10EmgW5bM08BiThh62qjZZhyUFZV5Ma9Cx48
	1bmAAO7YiWqtNMTa98fX8RlOLbUUgyQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-PZlGf7HyNsCXu_dLKauamA-1; Fri, 10 Mar 2023 05:08:45 -0500
X-MC-Unique: PZlGf7HyNsCXu_dLKauamA-1
Received: by mail-wr1-f72.google.com with SMTP id r14-20020a0560001b8e00b002cdb76f7e80so961292wru.19
        for <alex.bennee@linaro.org>; Fri, 10 Mar 2023 02:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUpaRZtvDE6dumiX9MCrj7jilPejIULl9NYGQmI8ieI=;
        b=3xbiwnpQIAmy2YaMRpcF/XiD9Xm23Te2EALkcLKa69uqGToQROEvMDFML9jRS6IY3F
         eUnTiJJnh6H2lXp2PKAoV0NkoNMEHE9r02qc/YjWH3CjXzXdzx6ltGyD8ffMgUWHbVwD
         WzVyhpK/WWLZ3xhlc/0J5GKGYtk/WgdsPoKU7+i1FENHnsixRso4BvI44wASC8/OFwtw
         2Kn092XBD8wrKAurEHmOg0irvuIoTPxp8sbbuHrSXD0ghnpLDSlte10UaqbC7wIOG+zA
         f15DOSv1oAbsqVqA2/A5pjNLlu1Cxy37GyWqmHUuRa+qRyftaCFKirWIlaYhjcMAdjM/
         zd9Q==
X-Gm-Message-State: AO0yUKV3QSv+GxdgJs+Uy4UgF4WLwwnhCvNfhq6rFjI9WH42oFtvKbVx
	H8LW3H1dHmWnZmpu7Vh6QxPbehDBf6SukobtEwCwPADdg25voEoywRb+tvYG4+x2NpTFhXLJPzO
	l0JGrWrMsobYFgZrNxdlfMUfj
X-Received: by 2002:a05:600c:4f08:b0:3ea:e554:7815 with SMTP id l8-20020a05600c4f0800b003eae5547815mr2083791wmq.9.1678442923394;
        Fri, 10 Mar 2023 02:08:43 -0800 (PST)
X-Received: by 2002:a05:600c:4f08:b0:3ea:e554:7815 with SMTP id l8-20020a05600c4f0800b003eae5547815mr2083767wmq.9.1678442923057;
        Fri, 10 Mar 2023 02:08:43 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.9.88])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c2ccb00b003e0015c8618sm2789642wmc.6.2023.03.10.02.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:08:42 -0800 (PST)
Date: Fri, 10 Mar 2023 05:08:37 -0500
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
Message-ID: <20230310050550-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
MIME-Version: 1.0
In-Reply-To: <20230309201434.10831-9-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: X1cjdCrLzOJz

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

I don't like it that we are hard-coding the list of accelerators
like this. Make a wrapper?

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

why are you moving these? init at declaration time is
generally cleaner.

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

and here why do we need them global?

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

same. why the move?

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
