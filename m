Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp604353ejm;
        Thu, 27 Apr 2023 11:41:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5PGIwnpqVWQobFLNZ7FfpVNbrTOdZfTApVgzlYqorwIFuenaGKon6O+IJEsPSF6X0dula1
X-Received: by 2002:ac8:5886:0:b0:3ef:2ce7:7f5f with SMTP id t6-20020ac85886000000b003ef2ce77f5fmr4275371qta.18.1682620878709;
        Thu, 27 Apr 2023 11:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682620878; cv=none;
        d=google.com; s=arc-20160816;
        b=faxXtE2zVxkTOKtSigpQ91VQVTTu6jD6/VLxUsfISI16b3UwVfwfe96Ol4y+pw+Q8z
         nZASaZBg57i2rgwGlkpq8vUcWX4IciYgHMX/9AzUkvnZAt95RfHhE7K0gQrcm2rZmE8r
         U8DOs+/Fq9BUc23lbgKqQUJ8aA64t+TtAHjgXiRLR0YZ/3KGtKsokmpM9wT4KFJPfdMD
         /CP7ipjwk8hzXz1H7xKSDavc7kN26ZiClxhw9vMpojeLgYCCyo3UJDC3wGYNG3wQuDUr
         yCLhWKC92naZQOxCzgJ3BdemFCYFwFbmmSYl23MnH3WLPwFlaXuIVx+hktoGALph60/F
         gRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Fd5Ug5ZILzQtJxf/iMUPyrZegtwcSGD6L/iLxtkDwYI=;
        b=scpg01PWa6M/yTPhNxJJ7vFKZvMwHF5wGKsQzUEe6b4EmIjJVa99KY1HIOxeh01kfd
         YaeApb88SV4qWp3T279FacFTtnt0ZM5hfpkWwyH4gl35ixbZ6oUr62CiV0N1MShMlQL6
         +VHRdivyOy6OqjkYlLs08equcPN1bskkNDj0l9+BqACZNA3Pxo4pd9JTjfaCu2IuXx4t
         2v4qjau8MnuP627Wj3TiWfsxaE6AIekg9xFixs96/fHzjuSY35VDLokSxnXLlUhwvBBp
         glDCr4v+b4gA/BvlhPlxfNrr39JFDP1WwRF9rE/QoS7iO1JVbfH//kN3DT9foYfDtXUw
         OxfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="X6S/OXXo";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p23-20020a05620a22f700b0074e264d466bsi12080987qki.294.2023.04.27.11.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 11:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="X6S/OXXo";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682620878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fd5Ug5ZILzQtJxf/iMUPyrZegtwcSGD6L/iLxtkDwYI=;
	b=X6S/OXXo+rqjkH1QlCkgxgBwQ3qb9BbfFIj8tLgJeDjK6Pgn+L+eivESnL6s4n6cFgVQ7x
	25uGtKiXqbq6U2rXtKjDmgTpzyIrOPQfRDaNGAswZd8KBMgZaW2zUsp8hv/HJvkteCN6BD
	uLSv5LKHiQtFYtp6yRgruh//FiifTow=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-CFp-TQO1MfK7IEeYPj6-oA-1; Thu, 27 Apr 2023 14:41:17 -0400
X-MC-Unique: CFp-TQO1MfK7IEeYPj6-oA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f195129aa4so45765815e9.2
        for <alex.bennee@linaro.org>; Thu, 27 Apr 2023 11:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682620876; x=1685212876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fd5Ug5ZILzQtJxf/iMUPyrZegtwcSGD6L/iLxtkDwYI=;
        b=JmkZdbQTgALet+Jt13zXQDixdBFvcJw7k4uSQliKuwLXSn8bROpw4b5QRh0K4ZYVsn
         JjaPbPrRUaw4UTngbJi/DFeZ0BxoCGFf/BcOgWDwAyAKRD7jyYR2TGThYiGdEemSATzB
         8lrktMYQjmEUYOs9R/9x41VyNTvU17kHBBqqFcgqTpE7VybXPyuR/6O04DkaPbqIYUH9
         0Vd2Jjox+hNOLSiIRSgQuAbUMyStZDx6dQ/weqOGaRxuefeXXlb8FywyGdbUcMZQTsAp
         jvGMYn9QTc6xeXE2c0NYnnpmt10TeCODDOwCP3PaMWHehf3dll6e4XFhew9psy0/ZINC
         POow==
X-Gm-Message-State: AC+VfDwZu5O8OkZhvpE2OWMrWpuQGS5IIoGTNkUqRuWreVKwLGRaA1a+
	3+A6NRJq3ltycfqkrJVh5VrYostbXz/SMwy7bD3uRJfMHzPxxy5yXfpoLevFO2voEgRfeAnKWxi
	hgeLM4PMXnpDSA2gw
X-Received: by 2002:adf:ce09:0:b0:2fe:c0ea:18a8 with SMTP id p9-20020adfce09000000b002fec0ea18a8mr2037738wrn.49.1682620875870;
        Thu, 27 Apr 2023 11:41:15 -0700 (PDT)
X-Received: by 2002:adf:ce09:0:b0:2fe:c0ea:18a8 with SMTP id p9-20020adfce09000000b002fec0ea18a8mr2037724wrn.49.1682620875545;
        Thu, 27 Apr 2023 11:41:15 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.19.183])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d474c000000b002f4c2ea66absm19204927wrs.85.2023.04.27.11.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 11:41:15 -0700 (PDT)
Date: Thu, 27 Apr 2023 14:41:10 -0400
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
	Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v11 08/13] tests/qtest: Fix tests when no KVM or TCG are
 present
Message-ID: <20230427144055-mutt-send-email-mst@kernel.org>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-9-farosas@suse.de>
MIME-Version: 1.0
In-Reply-To: <20230426180013.14814-9-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: QiIqDblbpx3X

On Wed, Apr 26, 2023 at 03:00:08PM -0300, Fabiano Rosas wrote:
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
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>


makes sense to me

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 11 +++++++++--
>  tests/qtest/boot-serial-test.c |  5 +++++
>  tests/qtest/migration-test.c   |  9 ++++++++-
>  tests/qtest/pxe-test.c         |  8 +++++++-
>  tests/qtest/vmgenid-test.c     |  9 +++++++--
>  5 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 464f87382e..7fd88b0e9c 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2045,8 +2045,7 @@ static void test_acpi_virt_oem_fields(void)
>  int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
> -    const bool has_kvm = qtest_has_accel("kvm");
> -    const bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm, has_tcg;
>      char *v_env = getenv("V");
>      int ret;
>  
> @@ -2056,6 +2055,14 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        g_test_skip("No KVM or TCG accelerator available");
> +        return 0;
> +    }
> +
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          ret = boot_sector_init(disk);
>          if (ret) {
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..6dd06aeaf4 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -287,6 +287,11 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available");
> +        return 0;
> +    }
> +
>      for (i = 0; tests[i].arch != NULL; i++) {
>          if (g_str_equal(arch, tests[i].arch) &&
>              qtest_has_machine(tests[i].machine)) {
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 60dd53d3ec..be73ec3c06 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2477,7 +2477,7 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    bool has_kvm;
> +    bool has_kvm, has_tcg;
>      bool has_uffd;
>      const char *arch;
>      g_autoptr(GError) err = NULL;
> @@ -2486,6 +2486,13 @@ int main(int argc, char **argv)
>      g_test_init(&argc, &argv, NULL);
>  
>      has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        g_test_skip("No KVM or TCG accelerator available");
> +        return 0;
> +    }
> +
>      has_uffd = ufd_version_check();
>      arch = qtest_get_arch();
>  
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 62b6eef464..e4b48225a5 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -131,11 +131,17 @@ int main(int argc, char *argv[])
>      int ret;
>      const char *arch = qtest_get_arch();
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available");
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
> index efba76e716..324db08c7a 100644
> --- a/tests/qtest/vmgenid-test.c
> +++ b/tests/qtest/vmgenid-test.c
> @@ -165,13 +165,18 @@ int main(int argc, char **argv)
>  {
>      int ret;
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available");
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
