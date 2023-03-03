Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1265679ejc;
        Fri, 3 Mar 2023 08:23:01 -0800 (PST)
X-Received: by 2002:a17:902:ce8a:b0:19c:f698:8564 with SMTP id f10-20020a170902ce8a00b0019cf6988564mr3065013plg.17.1677860581097;
        Fri, 03 Mar 2023 08:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677860581; cv=none;
        d=google.com; s=arc-20160816;
        b=D3PBIzm/CXLSfjPymHqX2MXJI/u9lWnunu8Y2evBJqlvo1pu5ocynMmd4zD6Bzeron
         2G6An1uaK+WTrVl7PYaLw2vdVaatt4sR9s4du8lO+p4oof/9ydhepsPotbC8nzGZPfhj
         Sf+f9w2gTOm7ZWw+rf0+m60itrvJzhzfae3HnYHFWiAS20ClnSQBCVhFeZz76U1QFn2U
         4D8jJa9drTUGZH26c3QPpT0xbjkXpqrO8MzkEtC1copQpYDBhBV072AjG/2+Cs81uylK
         keTstvkTEw+dayPkMVZUxc/evP6WRY9de/lMnsJcO/UzFK5Z+s3JwT0WI0Cm7gMhhv+P
         jYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R+qkRF9syQ20v+D5pFmgveVeurPXd0ylLRUaVU6Vo48=;
        b=sTLbq+isLPsxy8JQbzon3nT6SoOdvWoNNwIw1mpHFmOEn0dg9QPgEFfQIK4SadsNHz
         sMdckJbNfK7ZxqeKuN7a4FcPm78buOx8b2wX5ZAjo5QA8cQTfAQY58zQZriRwvpAeijG
         ocBYbdTzCbM9YZJ4bTuiLSUIgEadVy1gwGhHO2UKyM2TiPgzDKP3yo5mfU9WBjruauU8
         RycxQlvgzqLT3Hvdob/6xa4l0IBzcljsXxHf5dzof5fu4V9HI1C7Cvj/XjHA5SGzdpJ4
         UN9qXOxi1GKRchWdqPAZQQ5yJYtPuFhFWLkczFGuVmTl1E6ma4XcgpQtrvm6mcSF2sF0
         5xgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XnQvDTRN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id iw9-20020a170903044900b0019a9d2b345fsor1193261plb.193.2023.03.03.08.23.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Mar 2023 08:23:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XnQvDTRN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677860580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R+qkRF9syQ20v+D5pFmgveVeurPXd0ylLRUaVU6Vo48=;
        b=XnQvDTRNYsewSp/+73Kl5wLRtM9Gj02pMM1jyJvfl65e1FbXVCmNPsuiPFv+wqiZMO
         DpctuFAnPm0wuq5Lmhy5lsnXDr3k1jzu4HNq8C2d7A9wpby3WiDY0lxqmcWdD/nNyNCV
         l6w362w3N+94JhNEISawxxxcCE+WtE58gRrJpwM/M4tHy9umMYVkoKyL5YyxXCV2ONax
         47RQ68Dr8qeIwOwJyVz2quD5uUG8UrVReFVnbQGrWxsVvpfX2sCBjCS6r2JTTcjflGLA
         UgrpdJ/fRg1PYyiZeRQv+4p0CvGi7aGsHdcJG0O1U9pIBpmkCXm7k8w82wM7HqACj7AV
         f7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+qkRF9syQ20v+D5pFmgveVeurPXd0ylLRUaVU6Vo48=;
        b=PlT9elJltnbG+lGFmdWKKqo+yHwcOUmCfmu6bZoOMkfuEGb2tkVbTsrbxzYHfWxplD
         puRGr+D7XsP4z8SfNiHoPs4JjhVmjRebNOE3ErWWPSY2peHwAETuzH9U9S+0p5B0bR3u
         ag//Y8RuEeaCK75c7nsJSy8juEgbrIAZNQy/vjcY1sYkWCRwAYk/V0ajdUtc1qxBd+Zr
         NFPDsOkVwwWDNyNsneFTy3HoTrYXYW5cCbjp+UYhtFESq2wpjSSP/FppLgZTD42RwtjP
         DB/fwcnPuX/dOMRwLc7CVfHEtoqznutmhuGhsn9KffvbZRsJwoOhSKuzTJjBh9/oXn8a
         /Kpg==
X-Gm-Message-State: AO0yUKUd9zJXWTKeOjiY0Jbdtd7aU6WC838gNDlkw2sAV6KIWx5T03ST
	DODFwQkPdlogLD66gtZ2j/qbZeMb1uYbZsiq88QNHnAf
X-Google-Smtp-Source: AK7set/3XlioQDaMHjrQLvd1Umm5xd4S9xCFzDu+kRcpSaKJC+8YnaSD3k6eaTdFkgFjx4/Lm3dTJRa5pOdlA6jBpwM=
X-Received: by 2002:a17:903:258f:b0:19a:98ea:5ef1 with SMTP id
 jb15-20020a170903258f00b0019a98ea5ef1mr898960plb.13.1677860580621; Fri, 03
 Mar 2023 08:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20230228192628.26140-1-farosas@suse.de> <20230228192628.26140-6-farosas@suse.de>
In-Reply-To: <20230228192628.26140-6-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:22:49 +0000
Message-ID: <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to migration test
To: Fabiano Rosas <farosas@suse.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, 
	Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: VqawAepqXf4t

On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
>
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line.
>
> Add a separate class to each architecture so that we can specify
> 'machine' and 'cpu' options instead of relying on defaults.
>
> Add a skip decorator to keep the current behavior of only running
> migration tests when the qemu target matches the host architecture.

I still don't understand this patch. Don't we run the
migration-test on all hosts already? David ?

> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  tests/avocado/migration.py | 83 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 78 insertions(+), 5 deletions(-)
>
> diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> index 4b25680c50..8b2ec0e3c4 100644
> --- a/tests/avocado/migration.py
> +++ b/tests/avocado/migration.py
> @@ -11,6 +11,8 @@
>
>
>  import tempfile
> +import os
> +
>  from avocado_qemu import QemuSystemTest
>  from avocado import skipUnless
>
> @@ -19,7 +21,7 @@
>  from avocado.utils.path import find_command
>
>
> -class Migration(QemuSystemTest):
> +class MigrationTest(QemuSystemTest):
>      """
>      :avocado: tags=migration
>      """
> @@ -62,20 +64,91 @@ def _get_free_port(self):
>              self.cancel('Failed to find a free port')
>          return port
>
> -
> -    def test_migration_with_tcp_localhost(self):
> +    def migration_with_tcp_localhost(self):
>          dest_uri = 'tcp:localhost:%u' % self._get_free_port()
>          self.do_migrate(dest_uri)
>
> -    def test_migration_with_unix(self):
> +    def migration_with_unix(self):
>          with tempfile.TemporaryDirectory(prefix='socket_') as socket_path:
>              dest_uri = 'unix:%s/qemu-test.sock' % socket_path
>              self.do_migrate(dest_uri)
>
>      @skipUnless(find_command('nc', default=False), "'nc' command not found")
> -    def test_migration_with_exec(self):
> +    def migration_with_exec(self):
>          """The test works for both netcat-traditional and netcat-openbsd packages."""
>          free_port = self._get_free_port()
>          dest_uri = 'exec:nc -l localhost %u' % free_port
>          src_uri = 'exec:nc localhost %u' % free_port
>          self.do_migrate(dest_uri, src_uri)
> +
> +
> +@skipUnless('aarch64' in os.uname()[4], "host != target")
> +class Aarch64(MigrationTest):
> +    """
> +    :avocado: tags=arch:aarch64
> +    :avocado: tags=machine:virt
> +    :avocado: tags=cpu:max
> +    """
> +
> +    def test_migration_with_tcp_localhost(self):
> +        self.migration_with_tcp_localhost()
> +
> +    def test_migration_with_unix(self):
> +        self.migration_with_unix()
> +
> +    def test_migration_with_exec(self):
> +        self.migration_with_exec()
> +
> +
> +@skipUnless('x86_64' in os.uname()[4], "host != target")
> +class X86_64(MigrationTest):
> +    """
> +    :avocado: tags=arch:x86_64
> +    :avocado: tags=machine:pc
> +    :avocado: tags=cpu:qemu64
> +    """
> +
> +    def test_migration_with_tcp_localhost(self):
> +        self.migration_with_tcp_localhost()
> +
> +    def test_migration_with_unix(self):
> +        self.migration_with_unix()
> +
> +    def test_migration_with_exec(self):
> +        self.migration_with_exec()
> +
> +
> +@skipUnless('ppc64le' in os.uname()[4], "host != target")
> +class PPC64(MigrationTest):
> +    """
> +    :avocado: tags=arch:ppc64
> +    :avocado: tags=machine:pseries
> +    :avocado: tags=cpu:power9_v2.0
> +    """
> +
> +    def test_migration_with_tcp_localhost(self):
> +        self.migration_with_tcp_localhost()
> +
> +    def test_migration_with_unix(self):
> +        self.migration_with_unix()
> +
> +    def test_migration_with_exec(self):
> +        self.migration_with_exec()
> +
> +
> +@skipUnless('s390x' in os.uname()[4], "host != target")
> +class S390X(MigrationTest):
> +    """
> +    :avocado: tags=arch:s390x
> +    :avocado: tags=machine:s390-ccw-virtio
> +    :avocado: tags=cpu:qemu
> +    """
> +
> +    def test_migration_with_tcp_localhost(self):
> +        self.migration_with_tcp_localhost()
> +
> +    def test_migration_with_unix(self):
> +        self.migration_with_unix()
> +
> +    def test_migration_with_exec(self):
> +        self.migration_with_exec()
> --
> 2.35.3

thanks
-- PMM
