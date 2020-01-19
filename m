Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp951713lff;
        Sat, 18 Jan 2020 16:26:14 -0800 (PST)
X-Received: by 2002:a5e:9243:: with SMTP id z3mr37354484iop.259.1579393574696;
        Sat, 18 Jan 2020 16:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579393574; cv=none;
        d=google.com; s=arc-20160816;
        b=z64Dc9sqYvafMeCw6C6qpTsCRdKMcrRcbrnl71HKsUr8i0ytxCAMtLd6A1MwRfqfBd
         cJWWQEoQxrdt+KGRM3Gh7evvi6lMdIcJXlnazpxD/LHqzuo3Gf6CgdRh+qC9BWu6WTF5
         KRlaTA+lXBtiNrqKsk+sIE839lSAzZ+b+k4by4VWejbe7GUQcbmXRORwt4zrcWVAyqn9
         ucVZn/6DdCmdkgT0wzkneIN+NBblg1i0YhkRE0baAr2MLg7DfTkr8GfsiSGB7UIyKF83
         ZaSHPkXjRIVT53cUfnYgtfDa+njbVXbv4BF1meGymPob6NuoxYhIVzwVV2kzMTdPvtnp
         TjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qDV4Wi5Ca+D+V+mozqNEyUEFxt41+syqpRtjs+GEEMk=;
        b=TIByJC7Fro2d+SjVf1BIbl6AmQpuAGBJ20fI7jkqHjGlwShNSGWEuyWSCvJCdXn/7z
         q/G7BHlCz8/g5fbtIO5W/5XOgGnl4sCV7CaA1yl3bsdWtP3NOeHydjSL+ZNUs/43cN+t
         UcDkqFERgTlTiy6T48Ns0JgGtVGN7skHpz7H+djJCvQeW4xYJ/9e5IdmZ347Qn6TecTu
         dBXCHE3mTaANNe4D6DmLlt9rR2CPjvTADmvD+Immlp9h8r6pAOvsZJfm+fLZRulryN5r
         i6qGIWQ4b2VIHYO306jclbIlYSLzuBG/p71yho++auxwq0Wz47m74cKnsMUu7Agnf+f0
         Do4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=djnIq15a;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s70sor19851679ilk.62.2020.01.18.16.26.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 18 Jan 2020 16:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=djnIq15a;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qDV4Wi5Ca+D+V+mozqNEyUEFxt41+syqpRtjs+GEEMk=;
        b=djnIq15ayRaYwu66sOh4tk7Ozlnulmbd+Ih4e9Hy4oAhzEUQyiO+rcszBUt+oEVL9Q
         IV0tgkLG8+N7LlGUAD7xKY4OaYTa7kd9wyoXME4iEN3A0J5LCFNh6ylI8NxBncwUK9/X
         3NdPgUUHaRFsg6y0xf/aJcmxdwt6YVXJdxBia5Ifp3Msa5Qa2/qpeVFRnoJCQBcSpem6
         ukCdnX6WBH6SmHaWKMjwGlzM/p5PVN1wY6ZWH1ZNCS7kGPVG2EOtGrFN/Iw+l6GlO426
         IplMq9R6edxrwDeFxmpZLPx7ibaYgNzc7mFSqbn9vDKWo1gzf4V7RKZr7O2jgT/bZr/3
         TfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qDV4Wi5Ca+D+V+mozqNEyUEFxt41+syqpRtjs+GEEMk=;
        b=kj2/zXnWvCwMS/XSnCj+dDjI4TOQkpCoZNf5sJbfRYnZXZN+1cKtZQTF63xSv9RIII
         b/BqD9uj9Jx6GdbQDqDxWKIOMivTBgib0vXd/pAKWFxv9R6DYnpzTewp8HV9pcGOmV71
         f1hjHNA+RnZgxn/HwauQYHRF3i7LU0pjgscFsdJNapaJojCtaobmjIf4DAbel23RtvKD
         hYx2hKfXJB3MxMkRZwTl4eZU3/64bMc1MQ3t1BB8Obq9pb8QruuK9RiFGZ9jWiLOXdhJ
         uR3RhPEtbMnAX3SFlTgTl7dplMRcpo1+MzsiqUIWgFDaNwSyGOvNxXONBEM/AhdJbplI
         FpPw==
X-Gm-Message-State: APjAAAU6DoQgviUqO9KcaXQVVdMOVY+9H7ilWGvlsEXFW1wMS8XKqFuU
	7bLobg4ziTtwA552OutwfnWf56TzuqykgC31vdg=
X-Google-Smtp-Source: APXvYqy13B4OouWIplBMz7f9mS70IKUoQB82jqsyzIwtieFZX8RxqHdg+C7+4axfT1Me0K6HybR+enXWLn3gyST6gjo=
X-Received: by 2002:a92:af08:: with SMTP id n8mr4713173ili.217.1579393574185;
 Sat, 18 Jan 2020 16:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20200118191623.32549-1-f4bug@amsat.org> <20200118191623.32549-2-f4bug@amsat.org>
In-Reply-To: <20200118191623.32549-2-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 19 Jan 2020 01:26:02 +0100
Message-ID: <CAPan3WqEd10j4SJ_HE3zN+STGVHnM7j8MWh72G7vL8E99FJCLg@mail.gmail.com>
Subject: Re: [PATCH 1/4] Acceptance tests: Extract _console_interaction()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Eduardo Habkost <ehabkost@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Kamil Rytarowski <kamil@netbsd.org>
Content-Type: multipart/alternative; boundary="000000000000f43205059c733837"
X-TUID: CJbVU4r2Jx16

--000000000000f43205059c733837
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2020 at 8:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Since we are going to re-use the code shared between
> wait_for_console_pattern() and exec_command_and_wait_for_pattern(),
> extract the common part into a local function.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

> ---
>  tests/acceptance/avocado_qemu/__init__.py | 31 +++++++++++++----------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py
> b/tests/acceptance/avocado_qemu/__init__.py
> index 6618ea67c1..0a50fcf2be 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -55,19 +55,14 @@ def pick_default_qemu_bin(arch=3DNone):
>          return qemu_bin_from_src_dir_path
>
>
> -def wait_for_console_pattern(test, success_message, failure_message=3DNo=
ne):
> -    """
> -    Waits for messages to appear on the console, while logging the conte=
nt
> -
> -    :param test: an Avocado test containing a VM that will have its
> console
> -                 read and probed for a success or failure message
> -    :type test: :class:`avocado_qemu.Test`
> -    :param success_message: if this message appears, test succeeds
> -    :param failure_message: if this message appears, test fails
> -    """
> +def _console_interaction(test, success_message, failure_message,
> +                         send_string):
>      console =3D test.vm.console_socket.makefile()
>      console_logger =3D logging.getLogger('console')
>      while True:
> +        if send_string:
> +            test.vm.console_socket.sendall(send_string.encode())
> +            send_string =3D None # send only once
>          msg =3D console.readline().strip()
>          if not msg:
>              continue
> @@ -79,6 +74,17 @@ def wait_for_console_pattern(test, success_message,
> failure_message=3DNone):
>              fail =3D 'Failure message found in console: %s' %
> failure_message
>              test.fail(fail)
>
> +def wait_for_console_pattern(test, success_message, failure_message=3DNo=
ne):
> +    """
> +    Waits for messages to appear on the console, while logging the conte=
nt
> +
> +    :param test: an Avocado test containing a VM that will have its
> console
> +                 read and probed for a success or failure message
> +    :type test: :class:`avocado_qemu.Test`
> +    :param success_message: if this message appears, test succeeds
> +    :param failure_message: if this message appears, test fails
> +    """
> +    _console_interaction(test, success_message, failure_message, None)
>
>  def exec_command_and_wait_for_pattern(test, command,
>                                        success_message,
> failure_message=3DNone):
> @@ -94,10 +100,7 @@ def exec_command_and_wait_for_pattern(test, command,
>      :param success_message: if this message appears, test succeeds
>      :param failure_message: if this message appears, test fails
>      """
> -    command +=3D '\r'
> -    test.vm.console_socket.sendall(command.encode())
> -    wait_for_console_pattern(test, success_message, failure_message)
> -
> +    _console_interaction(test, success_message, failure_message, command
> + '\r')
>
>  class Test(avocado.Test):
>      def _get_unique_tag_val(self, tag_name):
> --
> 2.21.1
>
>

--=20
Niek Linnenbank

--000000000000f43205059c733837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 18, 2020 at 8:16 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Since we are going to re-use the code shared between<br>
wait_for_console_pattern() and exec_command_and_wait_for_pattern(),<br>
extract the common part into a local function.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div>Teste=
d-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">niekl=
innenbank@gmail.com</a>&gt; <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0tests/acceptance/avocado_qemu/__init__.py | 31 +++++++++++++---------=
-<br>
=C2=A01 file changed, 17 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py<br>
index 6618ea67c1..0a50fcf2be 100644<br>
--- a/tests/acceptance/avocado_qemu/__init__.py<br>
+++ b/tests/acceptance/avocado_qemu/__init__.py<br>
@@ -55,19 +55,14 @@ def pick_default_qemu_bin(arch=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return qemu_bin_from_src_dir_path<br>
<br>
<br>
-def wait_for_console_pattern(test, success_message, failure_message=3DNone=
):<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Waits for messages to appear on the console, while logging t=
he content<br>
-<br>
-=C2=A0 =C2=A0 :param test: an Avocado test containing a VM that will have =
its console<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read and pro=
bed for a success or failure message<br>
-=C2=A0 =C2=A0 :type test: :class:`avocado_qemu.Test`<br>
-=C2=A0 =C2=A0 :param success_message: if this message appears, test succee=
ds<br>
-=C2=A0 =C2=A0 :param failure_message: if this message appears, test fails<=
br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+def _console_interaction(test, success_message, failure_message,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0send_string):<br>
=C2=A0 =C2=A0 =C2=A0console =3D test.vm.console_socket.makefile()<br>
=C2=A0 =C2=A0 =C2=A0console_logger =3D logging.getLogger(&#39;console&#39;)=
<br>
=C2=A0 =C2=A0 =C2=A0while True:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if send_string:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test.vm.console_socket.sendall(s=
end_string.encode())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_string =3D None # send only=
 once<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D console.readline().strip()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not msg:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
@@ -79,6 +74,17 @@ def wait_for_console_pattern(test, success_message, fail=
ure_message=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail =3D &#39;Failure messa=
ge found in console: %s&#39; % failure_message<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test.fail(fail)<br>
<br>
+def wait_for_console_pattern(test, success_message, failure_message=3DNone=
):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Waits for messages to appear on the console, while logging t=
he content<br>
+<br>
+=C2=A0 =C2=A0 :param test: an Avocado test containing a VM that will have =
its console<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read and pro=
bed for a success or failure message<br>
+=C2=A0 =C2=A0 :type test: :class:`avocado_qemu.Test`<br>
+=C2=A0 =C2=A0 :param success_message: if this message appears, test succee=
ds<br>
+=C2=A0 =C2=A0 :param failure_message: if this message appears, test fails<=
br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 _console_interaction(test, success_message, failure_message,=
 None)<br>
<br>
=C2=A0def exec_command_and_wait_for_pattern(test, command,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0success_m=
essage, failure_message=3DNone):<br>
@@ -94,10 +100,7 @@ def exec_command_and_wait_for_pattern(test, command,<br=
>
=C2=A0 =C2=A0 =C2=A0:param success_message: if this message appears, test s=
ucceeds<br>
=C2=A0 =C2=A0 =C2=A0:param failure_message: if this message appears, test f=
ails<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 command +=3D &#39;\r&#39;<br>
-=C2=A0 =C2=A0 test.vm.console_socket.sendall(command.encode())<br>
-=C2=A0 =C2=A0 wait_for_console_pattern(test, success_message, failure_mess=
age)<br>
-<br>
+=C2=A0 =C2=A0 _console_interaction(test, success_message, failure_message,=
 command + &#39;\r&#39;)<br>
<br>
=C2=A0class Test(avocado.Test):<br>
=C2=A0 =C2=A0 =C2=A0def _get_unique_tag_val(self, tag_name):<br>
-- <br>
2.21.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000f43205059c733837--
