Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp662180ejb;
        Thu, 16 Feb 2023 08:32:51 -0800 (PST)
X-Received: by 2002:a05:6a20:8e28:b0:ac:82ff:9f9e with SMTP id y40-20020a056a208e2800b000ac82ff9f9emr7233682pzj.22.1676565171491;
        Thu, 16 Feb 2023 08:32:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676565171; cv=none;
        d=google.com; s=arc-20160816;
        b=eDhxrkgOlz4RPdCOpoaw2It8R4mpOcG+v9s+VOplG9AdeMc5LC9XI0jjNP6bieLMod
         s+ZilGamqDUjT8N5iH0TohOyMnBsoED7xD+IsYe81ERGVOQDLYYPgoge2LlwIke/vc7v
         jtOwJHOEB4S625LB8ep56rd/ha37c2Kae3gMTiW0LBSPy0luzK58yxyFgWL0Jb3EpyE1
         xbW5lV49a6I0cn98Jr+SgH9WZJCGHT2cpJL+rbBqy2v7ggZKvZXb0Cz0f8t6mE4KoTbA
         ad1/04F9OegrPQgQugZ0rgvMQDt3v+B1XWL3DCRbZGCdCqZw1ccCywH1cYbtTQhEkrVK
         OVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/i1UovRLqcCkRr++ZAhGKLpndFwUNCMyBEn75c/NSUQ=;
        b=rndhub+10tHMfNQM5TebzYzDPPL0e92phDiB2zNrXx4XkD0IaBPgAVKj2EU0GqPtiu
         csuyIMHI/E7Eeavs40bSnjq9Y4sl7bcF9LtR+3auEoRDWw9veRhHUUWmByeNjbkhGER7
         uepkkslLD7sCT0B+TzeVM41BMJyrpJJlhhA+z5qTSjcvD9vHG5T2deXlP7lRjnjDgO/9
         H4OkZGh+pD2aH94WGQj4hz/zynDLZiaxoRVfoLN09kWG1EczlDTmeioGSh5rL4LXHTvm
         SahIiTsQm7o7SzNDZ3B2pmlh3+gjy2HwSq4fECuKyf2bTl42oEyz6jxI2aK6EKh+K1aK
         tD6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSo8u+FY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h69-20020a638348000000b004e370fc122dsor931189pge.22.2023.02.16.08.32.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 08:32:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSo8u+FY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i1UovRLqcCkRr++ZAhGKLpndFwUNCMyBEn75c/NSUQ=;
        b=rSo8u+FYSnAuG63ykZ0LIQhDp4uqOzgDw4n/pLuwD8lGJe8H7rKT/cDcU0lIptbSfz
         1xgqJKknXD4i3wXC3E3KkVM1RQ82I4mpYmjZvFGVk69xMWo0pBW+IhmKYs9UFdlOFldg
         VvZs18wFi5Lmaj29MYfm8L54cypq7zCAfDGQnypbp8QuVDS5zPSJ3k3tnAthXhqiTre3
         yuTYzeSqthjXBrJ1+diAfPy7atbMep/hqcC/b6fN052k1FQqmGKyid5xEkk6aXZBxzvj
         jp5s4zeqh2kJs2fePMXd5EvXdvY5zzBjrk9LAuWzRUri2XBUlfDP3wT0jUKJ5r+SCdPm
         lzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/i1UovRLqcCkRr++ZAhGKLpndFwUNCMyBEn75c/NSUQ=;
        b=SjnZmxi7gfL3J4TojnFzBCguuRgkQwir0J+cTWziqx4BBoIP9rzAJmtdP5wBb3ftTr
         2TnwHU8KshnY3CMj1Zor7sb+w/yoIqQN9F8a+lIxULDVL+0mHsn0Jkf+gsa3xNlKt7Uf
         nzpNDxrjlhqvGd4lguP1ATCbXu5l3DX6xJQ6HqEZGhzpxSTp+VGkSAgBJ3eqUawLYgUO
         n3JE7Eohu3r20QankDU+SNGL6SiywoiSuJo8U9m9Psx71jnc5HFWWDAHWIjx7yCCR7oP
         3eYII20mQ2xG6UYXa44+O591mlVjCLM4Gt1TYwscCd59l925G0hX47ESOthQOn0VZ3tv
         IJVg==
X-Gm-Message-State: AO0yUKWERUST4KAazPeVnGgqXx2unltD0wjSmoniV4ZTSJ+XmV5/+NQu
	YxfCAz/dNjQGq+cWljS5+PW6rGWtZPhTyHr+7JxImIzH
X-Google-Smtp-Source: AK7set/DcxxHfSadQwC9zOLGVbY8SwuTKaL67kn4967mHmm+4U06EIOQnJe6cHMp5lslqexPOoacdbwEM49XopQ5JI4=
X-Received: by 2002:a63:360c:0:b0:4f9:cd40:f59a with SMTP id
 d12-20020a63360c000000b004f9cd40f59amr788752pga.21.1676565170979; Thu, 16 Feb
 2023 08:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de> <20230213202927.28992-26-farosas@suse.de>
In-Reply-To: <20230213202927.28992-26-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:32:39 +0000
Message-ID: <CAFEAcA-sSjjhrSkwD+b8RX_YyXcbmnob7caTot5Ym=v5TntELw@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 25/28] target/avocado: Pass parameters to
 migration test on aarch64
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, 
	Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vvmpy7SDfSnb

On Mon, 13 Feb 2023 at 20:33, Fabiano Rosas <farosas@suse.de> wrote:
>
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line. Most other architectures define a default value in QEMU for
> these options, but arm does not.
>
> Add these options to the test class in case the test is being executed
> in an aarch64 host.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/avocado/migration.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> index 4b25680c50..ffd3db0f35 100644
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
> @@ -26,6 +28,14 @@ class Migration(QemuSystemTest):
>
>      timeout =3D 10
>
> +    def setUp(self):
> +        super().setUp()
> +
> +        arch =3D os.uname()[4]
> +        if arch =3D=3D 'aarch64':
> +            self.machine =3D 'virt'
> +            self.cpu =3D 'max'
> +
>      @staticmethod
>      def migration_finished(vm):
>          return vm.command('query-migrate')['status'] in ('completed', 'f=
ailed')
> --

This looks odd. Don't we run this test in our CI currently?
I'm not sure that specialcasing aarch64 here is the right
approach -- David, any opinions?

thanks
-- PMM
