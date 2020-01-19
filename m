Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp953502lff;
        Sat, 18 Jan 2020 16:28:44 -0800 (PST)
X-Received: by 2002:a92:cacb:: with SMTP id m11mr5261950ilq.133.1579393723897;
        Sat, 18 Jan 2020 16:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579393723; cv=none;
        d=google.com; s=arc-20160816;
        b=GOh1qsjn7SakScggX8tPQqCKFdhUWQpkxgdkvc3XKmNnJL9WE/NW83bINFazoAg6YO
         QTnY+Cl1OtANn+somL00GW6FVGRCVsfETYH8EZWh7qSKiRf5W+iLUU0/GvLf2x/ertzA
         +Or5f8VnEZHoT1P2jSiW/UUO6ESLT+cbP3NT978fCJV1T4sAk3s6mf1Mx8QtOX1k0b9l
         NlqJIPy1kiZItV/M9mPalciXglrpqgvbSJY/GDtCSs2X2YFKao7zA5DAhk3G6r4xtyD/
         4TxAyUN3uc0E0CCipgMtXA3LB/EIYD8qW3cl260XevjnDiqW0BAch8Clk0EOsLhzCuaN
         hdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t4byTpjm4sHf6eSOBjyzkUGuebvhsAwzimOh0Kkin2g=;
        b=KtRB8IJTb6jQlcxSD8Wx0nXMh4jZQI4nuhdruB0v/BYz2g7UqyZessibtwDibWBzaK
         EUfMtCizmKOmFCpTAk7JRwPCU54JdXzQ8KTq5n0tksGxnrufYEdcQXU4gogFGrwxaWyQ
         0ujbmfXfastY8AKioJoTSw/4ntDSmJU/katNXgHHyh7Ns6DgAyqDzZI1JUnMGQM4ULeQ
         C6fiQm2+m1Fwtu5WkNwcVtuAEtdnbVWRaKy7jodQcvsETp8ol4S7ObNzjqmnoKpNd6i9
         UgGtUMWFo+wnnC7nZD5d4omQHvasMQ9Xz9rX19KV4InZBhYFTl7jPKJS6YFI4rx+cFw0
         +/HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M6HURLjJ;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c70sor20260576ilg.84.2020.01.18.16.28.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 18 Jan 2020 16:28:43 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M6HURLjJ;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t4byTpjm4sHf6eSOBjyzkUGuebvhsAwzimOh0Kkin2g=;
        b=M6HURLjJN5XwqvWYCp1cbT3HEINlfQ3JcVMRbKbx6Hcpbb1zBqbzBNkxEK7bdJ6sqx
         /j9gLgr1UHKlqivWkDokGvFK7T28Nh6XVMWDGkYBXwiJ6RjzeL/aVvoVtOgmt+C5D3Xu
         J5bFZJERFUqtQ8/sW3KOiFqp0XW3hpx+GSgJUs6+mJw1QvjrIdeo+SEzAECq1oX+MmQy
         zCC6cB0HL00GUOalC5Tgniqw90TZGPxeNxuXM5IYGRLz2kr2D0y5WgJ1v9LQWc7rAEGa
         WOpE9Hr4SIYXaNsI513EHySelZIBVbI91FbCrnW+pHSszUkTufMzeoEHpxk9X84HYBQv
         THeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t4byTpjm4sHf6eSOBjyzkUGuebvhsAwzimOh0Kkin2g=;
        b=bzRVJEDufpqayH4m1o0BwlPmeT6o843/GwShsvB/Tpq6mdext+steR0Z/Nhp9eCsQ6
         AItmLtnkeyLW+H5wiwWPVvPi2AgWlRWUn6LXZk7etVzfwhweRJ5tUV8mTHRrIFI+I2Uc
         VlxKzsytD8jBKRt/jGOX5uY13vFcAwVlOjqErpt/r09bJPVztiB1vrumXX1sML0q5KlI
         lO/or6c5vYIivsiog7TBpTiHXvFN3xx+ENa+g/U4TxqhvWzQhkt+08l5i7o9wF/cZY5Q
         ZHw18cod6PuuSB9nJwq5stEEgbQGqUlnOhWEsmuJl8DS4k1sPV57D1P7O63eFXi35pJ7
         L9UQ==
X-Gm-Message-State: APjAAAVUkSxdLGyvuYAn9T1n2uKk5Y4S8wgfTqK+DpUkKOoIFdWVw0JD
	pcaZWRbOaov8Of2lif07WUv7a3y9OMOzxgz5nrQJhXLVQRA=
X-Google-Smtp-Source: APXvYqy70krxw19VvffgEz5GndoWPxCtESgKRna6UNsYqE+J4vXjZPiuQfz8eaj9Zh8W5msI16tIb6IRjREkpG+ETyc=
X-Received: by 2002:a92:a103:: with SMTP id v3mr4971804ili.265.1579393723499;
 Sat, 18 Jan 2020 16:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20200118191623.32549-1-f4bug@amsat.org> <20200118191623.32549-5-f4bug@amsat.org>
In-Reply-To: <20200118191623.32549-5-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 19 Jan 2020 01:28:32 +0100
Message-ID: <CAPan3WpLXi+23k7JDidmGRefz-rwxwaJmh-rRXO125zh422zpw@mail.gmail.com>
Subject: Re: [PATCH 4/4] .travis.yml: Allow untrusted code and large files
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Eduardo Habkost <ehabkost@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Kamil Rytarowski <kamil@netbsd.org>
Content-Type: multipart/alternative; boundary="000000000000da63e3059c734151"
X-TUID: /kHmd8AZph3J

--000000000000da63e3059c734151
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

For some reason, I can't apply this patch with git am:

Applying: .travis.yml: Allow untrusted code and large files
error: patch failed: .travis.yml:260
error: .travis.yml: patch does not apply
Patch failed at 0001 .travis.yml: Allow untrusted code and large files
Use 'git am --show-current-patch' to see the failed patch

I didn't change the .travis.yml file. I'm using latest master from commit
7fb38daf256bd1bcbcb5ea556422283d0d55a1b1

Regards,
Niek

On Sat, Jan 18, 2020 at 8:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> As Travis CI runs our tests in a disposable environment, we don't
> care much if the binaries are trusted. The more we test the better.
>
> Also, as of this commmit, the smallest available announced [1] is
> "approx 18GB", plenty of space to run our acceptance tests.
>
> Enable the proper environment variables to allow Avocado download
> from untrusted sources, and to download large files.
>
> Note: As of this commit, all our tests "Ran for 17 min 7 sec"
> before succeeding, see [2].
>
> [1]
> https://docs.travis-ci.com/user/reference/overview/#virtualisation-enviro=
nment-vs-operating-system
> [2] https://travis-ci.org/philmd/qemu/jobs/638823612#L3817
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .travis.yml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/.travis.yml b/.travis.yml
> index 638fba4799..b8b9df65a6 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -260,6 +260,8 @@ matrix:
>
>      # Acceptance (Functional) tests
>      - env:
> +        - AVOCADO_ALLOW_LARGE_STORAGE=3D"yes"
> +        - AVOCADO_ALLOW_UNTRUSTED_CODE=3D"sure"
>          - CONFIG=3D"--python=3D/usr/bin/python3
> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-soft=
mmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-=
softmmu,sparc-softmmu"
>          - TEST_CMD=3D"make check-acceptance"
>        after_failure:
> --
> 2.21.1
>
>

--=20
Niek Linnenbank

--000000000000da63e3059c734151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,</div><div><br></div><div>For some reason=
, I can&#39;t apply this patch with git am:</div><div><br></div><div>Applyi=
ng: .travis.yml: Allow untrusted code and large files<br>error: patch faile=
d: .travis.yml:260<br>error: .travis.yml: patch does not apply<br>Patch fai=
led at 0001 .travis.yml: Allow untrusted code and large files<br>Use &#39;g=
it am --show-current-patch&#39; to see the failed patch<br></div><div><br><=
/div><div>I didn&#39;t change the .travis.yml file. I&#39;m using latest ma=
ster from commit 7fb38daf256bd1bcbcb5ea556422283d0d55a1b1</div><div><br></d=
iv><div>Regards,</div><div>Niek<br></div><div><br></div><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 18, 2020 at 8:16 =
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug=
@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">As Travis CI runs our tests in a disposable environment, we don&=
#39;t<br>
care much if the binaries are trusted. The more we test the better.<br>
<br>
Also, as of this commmit, the smallest available announced [1] is<br>
&quot;approx 18GB&quot;, plenty of space to run our acceptance tests.<br>
<br>
Enable the proper environment variables to allow Avocado download<br>
from untrusted sources, and to download large files.<br>
<br>
Note: As of this commit, all our tests &quot;Ran for 17 min 7 sec&quot;<br>
before succeeding, see [2].<br>
<br>
[1] <a href=3D"https://docs.travis-ci.com/user/reference/overview/#virtuali=
sation-environment-vs-operating-system" rel=3D"noreferrer" target=3D"_blank=
">https://docs.travis-ci.com/user/reference/overview/#virtualisation-enviro=
nment-vs-operating-system</a><br>
[2] <a href=3D"https://travis-ci.org/philmd/qemu/jobs/638823612#L3817" rel=
=3D"noreferrer" target=3D"_blank">https://travis-ci.org/philmd/qemu/jobs/63=
8823612#L3817</a><br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0.travis.yml | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/.travis.yml b/.travis.yml<br>
index 638fba4799..b8b9df65a6 100644<br>
--- a/.travis.yml<br>
+++ b/.travis.yml<br>
@@ -260,6 +260,8 @@ matrix:<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Acceptance (Functional) tests<br>
=C2=A0 =C2=A0 =C2=A0- env:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 - AVOCADO_ALLOW_LARGE_STORAGE=3D&quot;yes&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 - AVOCADO_ALLOW_UNTRUSTED_CODE=3D&quot;sure&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG=3D&quot;--python=3D/usr/bin/pyth=
on3 --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-so=
ftmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68=
k-softmmu,sparc-softmmu&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- TEST_CMD=3D&quot;make check-acceptance&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0after_failure:<br>
-- <br>
2.21.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000da63e3059c734151--
