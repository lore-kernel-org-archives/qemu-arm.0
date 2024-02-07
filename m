Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp659502eji;
        Wed, 7 Feb 2024 13:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+fBY8OyUtLS+sj6Mbm8m2zFiCYKkRCu+QfI6graVbW3aECPEemALbyEfBrra4PUDMeRHg
X-Received: by 2002:a05:6808:e84:b0:3bf:c8ae:b361 with SMTP id k4-20020a0568080e8400b003bfc8aeb361mr7488714oil.4.1707340036382;
        Wed, 07 Feb 2024 13:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707340036; cv=none;
        d=google.com; s=arc-20160816;
        b=Gw1o0HyxKbuif/yakflwC7sm07UqI3hnZLSN/Rwim3d0TX4zyYg4eLYhS07T5Puzu7
         6ltZWLRy/DFeDkBTpLCKSbtvmcYl1bsTI7caQL8Cy3vfd9KP1XPiqXUvm83Rl+bOy1KR
         8uVlI/CHjW5gtWXiKF2ihXpioTYv4eTcucT4HAkHIKkO3hfx87ShbRxQO9/Bpda0pvf/
         n54gdo992GSQMD9qE7TQXek5XLzRuL/Gjz9zVVHYZxExWyaOok6KmCSR/HCiO5Kk57To
         IHfUblTJg0uJNxAKHXrTSSjh/u9PwHHi+rGG+KWyOr3/eAyjTS7IrdJb9V+lP+O9VEXO
         lFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gh5NF6YhaHOWiRc2S6jbyUGr9y31fomAyBbbtNeJX3c=;
        fh=zJ0XP96f88c482sgxD6dYXOVuvVqxCrR+qOFjFPJ7UM=;
        b=jxo7ma8SGL3wF0f9lXij9R6P54POjaEJjl+ZzY29C5Uyr3sBUzCkOAT8qY2iTlud3K
         cVpnR46j7o/3PYVtO2QK29poSXIH7+JVCyQnbinH+6CC7fxsBX2rYbMuR5tOrKa+kYz5
         0bod4G8dF70qpKXzbJYPDkwBtox34eNMN4yxwGEjWsGsyw6EIH3gs9VJjEzNv1z/Am1+
         EYPGXM+my/nutGXSeUVY0E8AIrBxrsN0/Ewvlb/qwV8SjUNs9zAuVAdMbLK/WX2O99ma
         NUcOXWpJAFzJ1tbzhcYetDprY6tWH9npkgrmLREW4gQlRkv7iLZFWutavi1PlKiH1XGD
         VXFQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=LDOhY6AZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=1; AJvYcCW3M+MfrGDppK75UWB341XlYXvTDGfJdG5Cjx+j5rnzBLUdpZWfr4YvUnsP9NQqYYGLkzPKgwR1F33xsvd0qRbmD7mIhEQ5
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020ac85bd6000000b0042c3843c3d7si1980572qtb.188.2024.02.07.13.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Feb 2024 13:07:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=LDOhY6AZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXp84-0004VC-Co; Wed, 07 Feb 2024 16:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rXp81-0004TU-0K
 for qemu-arm@nongnu.org; Wed, 07 Feb 2024 16:06:46 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rXp7u-0007hV-FG
 for qemu-arm@nongnu.org; Wed, 07 Feb 2024 16:06:43 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5601eb97b29so486332a12.0
 for <qemu-arm@nongnu.org>; Wed, 07 Feb 2024 13:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1707339996; x=1707944796;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gh5NF6YhaHOWiRc2S6jbyUGr9y31fomAyBbbtNeJX3c=;
 b=LDOhY6AZF+xmxMyeSgoxT4VKkYU/+8XX8J6Pnj6UntlC4wnxwFWZdFfLvDWPniJr9O
 UWDfo9E2YpBmNY5JhMsJbF+zK8LnXyY+epslDUHXPSS3f4D3jfnubri5qlgUqmG8Jyey
 GXNMFAgYWxO6toHb7E1/pOVVQiPADXo8KdOWYPQcXVyE7i7Ddb80hVpWopgksY8FXpbj
 tk95S3KxB9ON2ftTRL+EHuJPszkzpL8HBthCnD2/cI1mZDK4+BsyGj3qR6QFmwE13opX
 zhb/YxJgGD4jXJ+ykKGQbdzagGNyXdLdYHaZPz1idhutVrTaRt818/YlG2Q7CTmZt6Ei
 fRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707339996; x=1707944796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gh5NF6YhaHOWiRc2S6jbyUGr9y31fomAyBbbtNeJX3c=;
 b=IiiaO7osgMp+Q+CB197ueOP30yZT+7UzpNZiN9ix3421/Kmr00yZfy5RCmI/nkvmWO
 8tngdMhRT1XU6xXRec8bKml0T8+SVLBIBY56GiorFMTh/QCnGj+LzBi4x4msc44fA8lN
 TNQ5IEjeBH79ZxQoonhoZnDPQwsPLuSp3EfFFrC9vjz1ObpQVSALrI6NYC3CXjdbFICd
 mDPWdt7j7qmcOgD06hI+hGls/Sx7wEk+ciFi12UfyV5E0lUsbvKgwN8XLm+WYslhCk4e
 t3vCqTlvxk1BSuDI2iidzY06UriRIQfgaqLoiHO8+o04rB6yTI/3CMHKwfWPMyfT4HqI
 wJPQ==
X-Gm-Message-State: AOJu0YzuS1LsGSdSStsS/6KC3L+bwp2zNssyph6ItDfFWk7nXBAGSUFM
 Re9D9Hu5pDCv9zYEUje4XFLpyWBAIfD1eAvq7vZbZa/pbqgJk7SV8QSKUWGbUn0s5GjamwU3MK+
 iCBy3Enk3g6grEv/QbB9XxKnfJeItJYc92vf9aA==
X-Received: by 2002:a05:6402:180a:b0:560:24d8:d2d1 with SMTP id
 g10-20020a056402180a00b0056024d8d2d1mr636398edy.11.1707339996233; Wed, 07 Feb
 2024 13:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-30-philmd@linaro.org>
In-Reply-To: <20240129164514.73104-30-philmd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 7 Feb 2024 14:06:25 -0700
Message-ID: <CANCZdfoEAbV9cTg3R4RMD8PV6s0NAMvg1xhgspp-cX310uaF2Q@mail.gmail.com>
Subject: Re: [PATCH v3 29/29] user: Prefer fast cpu_env() over slower CPU QOM
 cast macro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-ppc@nongnu.org, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000fc97cb0610d111a8"
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KRr3sQ7sQqoj

--000000000000fc97cb0610d111a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[[ I dont know if it's too late ]]

On Mon, Jan 29, 2024 at 9:48=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  bsd-user/signal.c   | 3 +--
>  linux-user/signal.c | 6 ++----
>  2 files changed, 3 insertions(+), 6 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index ca31470772..c6f0b1be38 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -463,14 +463,13 @@ static int fatal_signal(int sig)
>  void force_sig_fault(int sig, int code, abi_ulong addr)
>  {
>      CPUState *cpu =3D thread_cpu;
> -    CPUArchState *env =3D cpu_env(cpu);
>      target_siginfo_t info =3D {};
>
>      info.si_signo =3D sig;
>      info.si_errno =3D 0;
>      info.si_code =3D code;
>      info.si_addr =3D addr;
> -    queue_signal(env, sig, QEMU_SI_FAULT, &info);
> +    queue_signal(cpu_env(cpu), sig, QEMU_SI_FAULT, &info);
>  }
>
>  static void host_signal_handler(int host_sig, siginfo_t *info, void *puc=
)
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index c9527adfa3..f78f7fc476 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -623,7 +623,6 @@ void signal_init(void)
>  void force_sig(int sig)
>  {
>      CPUState *cpu =3D thread_cpu;
> -    CPUArchState *env =3D cpu_env(cpu);
>      target_siginfo_t info =3D {};
>
>      info.si_signo =3D sig;
> @@ -631,7 +630,7 @@ void force_sig(int sig)
>      info.si_code =3D TARGET_SI_KERNEL;
>      info._sifields._kill._pid =3D 0;
>      info._sifields._kill._uid =3D 0;
> -    queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
> +    queue_signal(cpu_env(cpu), info.si_signo, QEMU_SI_KILL, &info);
>  }
>
>  /*
> @@ -641,14 +640,13 @@ void force_sig(int sig)
>  void force_sig_fault(int sig, int code, abi_ulong addr)
>  {
>      CPUState *cpu =3D thread_cpu;
> -    CPUArchState *env =3D cpu_env(cpu);
>      target_siginfo_t info =3D {};
>
>      info.si_signo =3D sig;
>      info.si_errno =3D 0;
>      info.si_code =3D code;
>      info._sifields._sigfault._addr =3D addr;
> -    queue_signal(env, sig, QEMU_SI_FAULT, &info);
> +    queue_signal(cpu_env(cpu), sig, QEMU_SI_FAULT, &info);
>  }
>
>  /* Force a SIGSEGV if we couldn't write to memory trying to set
> --
> 2.41.0
>
>

--000000000000fc97cb0610d111a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">[[ I dont=C2=A0know if it&#39;s too late =
]]</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Jan 29, 2024 at 9:48=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 &lt;<=
a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Mechanical patch produ=
ced running the command documented<br>
in scripts/coccinelle/cpu_env.cocci_template header.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0bsd-user/signal.c=C2=A0 =C2=A0| 3 +--<br>
=C2=A0linux-user/signal.c | 6 ++----<br>
=C2=A02 files changed, 3 insertions(+), 6 deletions(-)<br></blockquote><div=
><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
index ca31470772..c6f0b1be38 100644<br>
--- a/bsd-user/signal.c<br>
+++ b/bsd-user/signal.c<br>
@@ -463,14 +463,13 @@ static int fatal_signal(int sig)<br>
=C2=A0void force_sig_fault(int sig, int code, abi_ulong addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D thread_cpu;<br>
-=C2=A0 =C2=A0 CPUArchState *env =3D cpu_env(cpu);<br>
=C2=A0 =C2=A0 =C2=A0target_siginfo_t info =3D {};<br>
<br>
=C2=A0 =C2=A0 =C2=A0info.si_signo =3D sig;<br>
=C2=A0 =C2=A0 =C2=A0info.si_errno =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0info.si_code =3D code;<br>
=C2=A0 =C2=A0 =C2=A0info.si_addr =3D addr;<br>
-=C2=A0 =C2=A0 queue_signal(env, sig, QEMU_SI_FAULT, &amp;info);<br>
+=C2=A0 =C2=A0 queue_signal(cpu_env(cpu), sig, QEMU_SI_FAULT, &amp;info);<b=
r>
=C2=A0}<br>
<br>
=C2=A0static void host_signal_handler(int host_sig, siginfo_t *info, void *=
puc)<br>
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index c9527adfa3..f78f7fc476 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -623,7 +623,6 @@ void signal_init(void)<br>
=C2=A0void force_sig(int sig)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D thread_cpu;<br>
-=C2=A0 =C2=A0 CPUArchState *env =3D cpu_env(cpu);<br>
=C2=A0 =C2=A0 =C2=A0target_siginfo_t info =3D {};<br>
<br>
=C2=A0 =C2=A0 =C2=A0info.si_signo =3D sig;<br>
@@ -631,7 +630,7 @@ void force_sig(int sig)<br>
=C2=A0 =C2=A0 =C2=A0info.si_code =3D TARGET_SI_KERNEL;<br>
=C2=A0 =C2=A0 =C2=A0info._sifields._kill._pid =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0info._sifields._kill._uid =3D 0;<br>
-=C2=A0 =C2=A0 queue_signal(env, info.si_signo, QEMU_SI_KILL, &amp;info);<b=
r>
+=C2=A0 =C2=A0 queue_signal(cpu_env(cpu), info.si_signo, QEMU_SI_KILL, &amp=
;info);<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -641,14 +640,13 @@ void force_sig(int sig)<br>
=C2=A0void force_sig_fault(int sig, int code, abi_ulong addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D thread_cpu;<br>
-=C2=A0 =C2=A0 CPUArchState *env =3D cpu_env(cpu);<br>
=C2=A0 =C2=A0 =C2=A0target_siginfo_t info =3D {};<br>
<br>
=C2=A0 =C2=A0 =C2=A0info.si_signo =3D sig;<br>
=C2=A0 =C2=A0 =C2=A0info.si_errno =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0info.si_code =3D code;<br>
=C2=A0 =C2=A0 =C2=A0info._sifields._sigfault._addr =3D addr;<br>
-=C2=A0 =C2=A0 queue_signal(env, sig, QEMU_SI_FAULT, &amp;info);<br>
+=C2=A0 =C2=A0 queue_signal(cpu_env(cpu), sig, QEMU_SI_FAULT, &amp;info);<b=
r>
=C2=A0}<br>
<br>
=C2=A0/* Force a SIGSEGV if we couldn&#39;t write to memory trying to set<b=
r>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--000000000000fc97cb0610d111a8--
