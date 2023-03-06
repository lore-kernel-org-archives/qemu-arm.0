Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4633599ejc;
        Mon, 6 Mar 2023 05:14:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/lw17w6FI5OPWE87uvd7O8V++8CbQI3YHrZ/F9gp5EcB5j190Ucp/hQ+7MjX+GsEIyu0xl
X-Received: by 2002:a05:622a:514:b0:3b9:bc8c:c213 with SMTP id l20-20020a05622a051400b003b9bc8cc213mr23957767qtx.30.1678108482380;
        Mon, 06 Mar 2023 05:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678108482; cv=none;
        d=google.com; s=arc-20160816;
        b=oWnp8mRVb5iq7JZFWX70aU4jobNxXirfkrYrpsXCo/c9YjZ3QGEyW8quV81dA/xUq3
         DgH33UaFmc/p18Vc71mhiSScBM8GnBsxQxv+ey4+qHAcCIF7YUxGg6kvt2j2piXSggZv
         nlm7LrZ6qfMcQYTgEdR5a00S6J7ZENN3gichIOeX+4pgeAJPl8yGkbu1w7TRE4xAMIv/
         3jVDkXoCYjaS4z0ngKP72KLTsNpDs3kT7vcGMpPBf+Qu47Ujnez1G3l6V8A27ctfSOFI
         JahuPuq9zeK69EhzSqr8CLLARRLb/nGcrMk385sxEcmoy5DayvLCPVhQFnGutziJXVC4
         s7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=0VcfJMVrhowpkRCecwnoDzhkzDqyfgfCZsybfrTDURs=;
        b=DV5tvioYmlujBhX2on48gnAdEDDPtHgxAZDY3xk+XJgk3I7lt3FwtQ/DlHkH6XI1Z9
         i15c9Laj4xWH2qktVQzRT7kNehnHvkj+QKF/YlMUeQRAeDlXgxET8L1Vw5IFwhTduAJf
         4rDLZ04d9VQ/wwFYey/2uSohFZHxfjUk8Oim6UZ79b4MmSrHbTZrSRmYivJiNzT5ilY8
         Y7CpDY+EAvfw0mAqJhkdD76KA+SY29MXQ3jfgdaShuE7IJB06aTm0bnAwdxIfT2tQAyY
         f9TIABSJGz1KGeXiL+1gNjOIKULFSg7SmUzrA45MF/zxGzwqdgeVeroK/KEiHpZvcrc8
         0GHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YajZ02Gq;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <dgilbert@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n203-20020a3740d4000000b0073ba673d03fsi6628575qka.243.2023.03.06.05.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of dgilbert@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YajZ02Gq;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678108482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0VcfJMVrhowpkRCecwnoDzhkzDqyfgfCZsybfrTDURs=;
	b=YajZ02GqUFjKcGdnaMtodbFNOWoOzrUDQcI1SPl2GL9RwIjtMch5XKPT0eOqBrDbotrgan
	Loa1uZUflmbU8/gpk135f+R1azYy6ppjMXttf+BQP55l1tFfrHPC8H3fOls3rygAc2E4Vj
	lCTU/tVFdVE5eQVYlfuQvi6GbKDQ3XA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-WOmdh2EnOpaePNC-78Ponw-1; Mon, 06 Mar 2023 08:14:40 -0500
X-MC-Unique: WOmdh2EnOpaePNC-78Ponw-1
Received: by mail-wm1-f71.google.com with SMTP id x18-20020a1c7c12000000b003e1e7d3cf9fso6735400wmc.3
        for <alex.bennee@linaro.org>; Mon, 06 Mar 2023 05:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678108480;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VcfJMVrhowpkRCecwnoDzhkzDqyfgfCZsybfrTDURs=;
        b=B0i4TonTO3QRtTF+2uu0QT4y7nNT/X6cWGFRsHw8VVY7c0RR5gNDqMYguHAd7YNk0N
         yJpjLLASs/8zoEiFg4SJu3zqebveHFcRT7QDcJXW3eGDCwzX82HRgBpBnhD7LxEfqur5
         U/mtINg+6Y5jdpXAImR8XHlrEFDwZbP5F2fumNZ58Ag+ycL51Hxc8xf+NkHJk2fPtgBW
         HKwQAAIfVEcPD1M7aUaRRskoxB3CYVdJKVzWxe6F+VSZBIvZJnRbW6C8qk5DtvtWVEOy
         I75ahz/F6v6TIdMqtKUYJuT8u0+k7OibLeGYf1irwbdudYbuq44MxsDu53SOHo3iXdLU
         U/qw==
X-Gm-Message-State: AO0yUKVJm2r79+QO5xj4WvLWKmQ8Fjal/hcJrAKCoYhYQhIj9i4HRwSI
	WrnkZXZHHctNwcYoaWdExCYpsy5gXSXFVePdMpnQqB8tsMD8jrR/Haw+enMVPSXKJN1sBvkkCX7
	U1hpW2x5lbINWkIZp
X-Received: by 2002:a7b:cb01:0:b0:3ea:d611:f8 with SMTP id u1-20020a7bcb01000000b003ead61100f8mr9765272wmj.38.1678108479764;
        Mon, 06 Mar 2023 05:14:39 -0800 (PST)
X-Received: by 2002:a7b:cb01:0:b0:3ea:d611:f8 with SMTP id u1-20020a7bcb01000000b003ead61100f8mr9765245wmj.38.1678108479490;
        Mon, 06 Mar 2023 05:14:39 -0800 (PST)
Return-Path: <dgilbert@redhat.com>
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id v2-20020adfe282000000b002c7066a6f77sm9772983wri.31.2023.03.06.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:14:39 -0800 (PST)
Date: Mon, 6 Mar 2023 13:14:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to
 migration test
Message-ID: <ZAXnPIfuY2Gyt6nt@work-vm>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-6-farosas@suse.de>
 <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: 3HMFy5whdi2m

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
> >
> > The migration tests are currently broken for an aarch64 host because
> > the tests pass no 'machine' and 'cpu' options on the QEMU command
> > line.
> >
> > Add a separate class to each architecture so that we can specify
> > 'machine' and 'cpu' options instead of relying on defaults.
> >
> > Add a skip decorator to keep the current behavior of only running
> > migration tests when the qemu target matches the host architecture.
> 
> I still don't understand this patch. Don't we run the
> migration-test on all hosts already? David ?

I don't run the avocado tests.

Dave

> > Signed-off-by: Fabiano Rosas <farosas@suse.de>
> > ---
> >  tests/avocado/migration.py | 83 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 78 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> > index 4b25680c50..8b2ec0e3c4 100644
> > --- a/tests/avocado/migration.py
> > +++ b/tests/avocado/migration.py
> > @@ -11,6 +11,8 @@
> >
> >
> >  import tempfile
> > +import os
> > +
> >  from avocado_qemu import QemuSystemTest
> >  from avocado import skipUnless
> >
> > @@ -19,7 +21,7 @@
> >  from avocado.utils.path import find_command
> >
> >
> > -class Migration(QemuSystemTest):
> > +class MigrationTest(QemuSystemTest):
> >      """
> >      :avocado: tags=migration
> >      """
> > @@ -62,20 +64,91 @@ def _get_free_port(self):
> >              self.cancel('Failed to find a free port')
> >          return port
> >
> > -
> > -    def test_migration_with_tcp_localhost(self):
> > +    def migration_with_tcp_localhost(self):
> >          dest_uri = 'tcp:localhost:%u' % self._get_free_port()
> >          self.do_migrate(dest_uri)
> >
> > -    def test_migration_with_unix(self):
> > +    def migration_with_unix(self):
> >          with tempfile.TemporaryDirectory(prefix='socket_') as socket_path:
> >              dest_uri = 'unix:%s/qemu-test.sock' % socket_path
> >              self.do_migrate(dest_uri)
> >
> >      @skipUnless(find_command('nc', default=False), "'nc' command not found")
> > -    def test_migration_with_exec(self):
> > +    def migration_with_exec(self):
> >          """The test works for both netcat-traditional and netcat-openbsd packages."""
> >          free_port = self._get_free_port()
> >          dest_uri = 'exec:nc -l localhost %u' % free_port
> >          src_uri = 'exec:nc localhost %u' % free_port
> >          self.do_migrate(dest_uri, src_uri)
> > +
> > +
> > +@skipUnless('aarch64' in os.uname()[4], "host != target")
> > +class Aarch64(MigrationTest):
> > +    """
> > +    :avocado: tags=arch:aarch64
> > +    :avocado: tags=machine:virt
> > +    :avocado: tags=cpu:max
> > +    """
> > +
> > +    def test_migration_with_tcp_localhost(self):
> > +        self.migration_with_tcp_localhost()
> > +
> > +    def test_migration_with_unix(self):
> > +        self.migration_with_unix()
> > +
> > +    def test_migration_with_exec(self):
> > +        self.migration_with_exec()
> > +
> > +
> > +@skipUnless('x86_64' in os.uname()[4], "host != target")
> > +class X86_64(MigrationTest):
> > +    """
> > +    :avocado: tags=arch:x86_64
> > +    :avocado: tags=machine:pc
> > +    :avocado: tags=cpu:qemu64
> > +    """
> > +
> > +    def test_migration_with_tcp_localhost(self):
> > +        self.migration_with_tcp_localhost()
> > +
> > +    def test_migration_with_unix(self):
> > +        self.migration_with_unix()
> > +
> > +    def test_migration_with_exec(self):
> > +        self.migration_with_exec()
> > +
> > +
> > +@skipUnless('ppc64le' in os.uname()[4], "host != target")
> > +class PPC64(MigrationTest):
> > +    """
> > +    :avocado: tags=arch:ppc64
> > +    :avocado: tags=machine:pseries
> > +    :avocado: tags=cpu:power9_v2.0
> > +    """
> > +
> > +    def test_migration_with_tcp_localhost(self):
> > +        self.migration_with_tcp_localhost()
> > +
> > +    def test_migration_with_unix(self):
> > +        self.migration_with_unix()
> > +
> > +    def test_migration_with_exec(self):
> > +        self.migration_with_exec()
> > +
> > +
> > +@skipUnless('s390x' in os.uname()[4], "host != target")
> > +class S390X(MigrationTest):
> > +    """
> > +    :avocado: tags=arch:s390x
> > +    :avocado: tags=machine:s390-ccw-virtio
> > +    :avocado: tags=cpu:qemu
> > +    """
> > +
> > +    def test_migration_with_tcp_localhost(self):
> > +        self.migration_with_tcp_localhost()
> > +
> > +    def test_migration_with_unix(self):
> > +        self.migration_with_unix()
> > +
> > +    def test_migration_with_exec(self):
> > +        self.migration_with_exec()
> > --
> > 2.35.3
> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
