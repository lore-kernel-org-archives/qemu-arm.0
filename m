MIME-Version: 1.0
Date: Tue, 15 Mar 2022 12:19:09 +0000
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
	<20220315121251.2280317-9-alex.bennee@linaro.org>
In-Reply-To: <20220315121251.2280317-9-alex.bennee@linaro.org>
Message-ID: <CAHDbmO31PZVCaUE5Y00zECXtUEEji49v79XPY73PU4iO9vFvQA@mail.gmail.com>
Subject: Re: [PATCH  v1 8/8] gitlab: include new aarch32 job in custom-runners
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net, 
	pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com, 
	qemu-arm@nongnu.org, richard.henderson@linaro.org, sw@weilnetz.de, 
	Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e5a69a05da40cd70"
X-TUID: I8++1kraHVWn

--000000000000e5a69a05da40cd70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And of course after sending I immediately see the aarch32 job is misnamed.
Will send a v2 follow-up individually

On Tue, 15 Mar 2022 at 12:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

> Without linking it in it won't be presented on the UI.
>
> Fixes: cc44a16002 ("gitlab: add a new aarch32 custom runner definition")
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/custom-runners.yml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitlab-ci.d/custom-runners.yml
> b/.gitlab-ci.d/custom-runners.yml
> index 3e76a2034a..15aaccc481 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -16,4 +16,5 @@ variables:
>  include:
>    - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
>    - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
> +  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml'
>    - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
> --
> 2.30.2
>
>

--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

--000000000000e5a69a05da40cd70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And of course after sending I immediately see the aarch32 =
job is misnamed. Will send a v2 follow-up individually<br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 15 Mar 20=
22 at 12:12, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
>alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Without linking it in it won&#39;t be presented on t=
he UI.<br>
<br>
Fixes: cc44a16002 (&quot;gitlab: add a new aarch32 custom runner definition=
&quot;)<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0.gitlab-ci.d/custom-runners.yml | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.=
yml<br>
index 3e76a2034a..15aaccc481 100644<br>
--- a/.gitlab-ci.d/custom-runners.yml<br>
+++ b/.gitlab-ci.d/custom-runners.yml<br>
@@ -16,4 +16,5 @@ variables:<br>
=C2=A0include:<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.=
yml&#39;<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch6=
4.yml&#39;<br>
+=C2=A0 - local: &#39;/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml=
&#39;<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/custom-runners/centos-stream-8-x86=
_64.yml&#39;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Alex Benn=C3=A9e<br>KVM/QEMU Hacker for Linaro</div>

--000000000000e5a69a05da40cd70--
