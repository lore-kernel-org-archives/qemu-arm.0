Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp821014njb;
        Tue, 18 Feb 2025 08:53:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcnyccySafuoM5xbq1u0+H8LkdreE+zJGaTzH4KOO/NBm7yIIdMIyz7NcKjQjVG+Xi1p4+miT07L6zCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHCmh4qEdPTVrsTOq/PxUTqPsQx0Nyoe/YuC9deqK607WtqxgAGo6FJS+UnET8RGaoqQJWY
X-Received: by 2002:a05:620a:3914:b0:7c0:b411:710c with SMTP id af79cd13be357-7c0b4117252mr132319185a.50.1739897583322;
        Tue, 18 Feb 2025 08:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739897583; cv=none;
        d=google.com; s=arc-20240605;
        b=T+RzVgMmUn9Li5xKaXgQ58GVVmFRjF6yJgkdMiK+1GYPU8JN2S0SK5Pg1SIARXbBqh
         z0TBEvxHFDrteVL0KP7hsEN3H3TfeWyC6DkwsMRzq6uOe7ehuBSmrBb9luzFB/VZn0wL
         3bxXfRo18lzWdF3dJYrx3agZkKio6aUDB4SlZzUetKnOD+3ohREb99MDYoOYV/oz8/Ju
         Y/vpbYLN8Rq8OJGu6k7odiQh5egSDenHPEsM8sm0FGhlpNbeoCB6jO7h+C7r7lniGIZq
         dklsaRejes1U+Jea3xJq7khLnDlfjJZ1WLy4ds2xevZYcXDOxpx3EEKBQxK8fiC9SPjd
         0ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eDFKLSNOkp6CE3HVQwpWE3wlvJ0ecILXhVsBYQg3M4Q=;
        fh=RtQZvP8VLv4TG4eoU6jqpMAXClQG79PxkPh4MDFJAHE=;
        b=E31R+jXMlkG2iitoJbw77Y+i6OYn3hg3mxMJcil0IvltV2LAzrXadS52FZyVqFGzsp
         BuCmbkJwmw9cGLeRL95hXLGi5yn+XYMmvAa5pirzexWEjInzaLNeQwHKXLy8X+AyjJip
         8cbh6DQ9fX2f14PSRbN4RNqCOpkgzGmzSCE0EP4SJhhK4wB5XWcjDkHyeNrTYkyRISeK
         Dz4PAijeFohdjUjqSt6cJdWhnlOAdO1jhamE58N/CA2p7uBkFW5uenvvybqNBSbop/Xv
         nHbmd54hrcrIQt1BpZv4GPh8cuJGfKDfDW+mRoGPPj6/z6Iqwa2jy6PyOAgd+CKX+5Ew
         tDMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LA2bMfDU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0ac31e055si200019285a.131.2025.02.18.08.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 08:53:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LA2bMfDU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tkQpz-0004Kf-W3; Tue, 18 Feb 2025 11:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tkQpx-0004Ei-IZ; Tue, 18 Feb 2025 11:52:45 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tkQpv-0003uW-Ss; Tue, 18 Feb 2025 11:52:45 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ded69e6134so8622122a12.0; 
 Tue, 18 Feb 2025 08:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897562; x=1740502362; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eDFKLSNOkp6CE3HVQwpWE3wlvJ0ecILXhVsBYQg3M4Q=;
 b=LA2bMfDUCzqbDbs0/p9jJLolH2ns7p7fBQPXOiTZcL7Zd+Dy+18EZceOKxt62GgeFz
 KQ5TJfvVWO/oBJRmkupZbaZUULqmjp5ZHl7g80HoLgWSxeGnBKsno29hzwhzgjQfWwmR
 D9mCbVyaijywxUQt7fO9+w/6a3jDD01YiCUhua+D+kLXah1SA5m9srcPw5Xg9VEYdQhP
 dkuDtEk2Ke1oTYagjSUXbGV48ZB/GYxGCfHV/2x3xXETCWOM8K3VsYLUfgqJwhvsYior
 O0y+c7Td5S16h9h9E5CBF9ewS9+/9S5eCjOcOROGQD0BN92P4cIh2+pUrRh1xj+xqfAy
 IL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897562; x=1740502362;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eDFKLSNOkp6CE3HVQwpWE3wlvJ0ecILXhVsBYQg3M4Q=;
 b=NONpzt8Byiw3Gi1iXWkyW3xa6VzOddbgN5z9yKS42cA+acQlCvE8+pwuSasSugkFK7
 AWabw45O8EB6DjmurPizA4Gga70DfhgqOc3OYbHijpAvJWtLkh9b4GwMvZHAwivY7Joy
 6ivIo3sR+1YZpJyG5n8Ar72qqFvdw9xHhR1Z/Uxp+9ltErMg6GjCxb0fdETrCOf92dwo
 obTpgyy7HBkCs6Af8ZrFCx0EE9aKbDgl0KXwsRS9o642YM7IUjK39U7ebLdAS+IxNAJS
 Pn640U0PkGY+dwM6fhWRwfY449l817UnbQLqPYhIpNy0VwmvTmv5nEpDjMm7cYVQNd2K
 lSPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDGj6iAwiZgAaKSl5dAlSqnNaSFZnqn8930XmqzAQlpXpsijvQOmkPaWCGVdU1raxZ1+CI8z4R5g==@nongnu.org
X-Gm-Message-State: AOJu0YwMKI2Xp65+hkzURTc+HDGAkt/LPjYkK8+dV3dS85Mv1PyjbGIY
 olkeALCqp5dJZR07vHvFhtNnJ8BwECo+P8IoJtgjESfOZvqH7/i7wqhTMcm7PH/zqAw0BahSm/0
 OkG+OYGaeRQhuu3csUhFsnIwJu84=
X-Gm-Gg: ASbGncuPod9CXnlnrIDt1PxiPVfdiswH8W0iWt8F8N/akECtdFc/76ExJg6Kht2hT8V
 Xgp3vMcZapcl1acR7tRJqOYfGyoY6LH7vZak7UgPgmndWzGYonp8tnt6yon1ftkQycCm+iu16
X-Received: by 2002:a05:6402:5411:b0:5d0:f9f1:cd73 with SMTP id
 4fb4d7f45d1cf-5e08950d212mr116528a12.13.1739897561204; Tue, 18 Feb 2025
 08:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20250218162618.46167-1-philmd@linaro.org>
 <20250218162618.46167-3-philmd@linaro.org>
In-Reply-To: <20250218162618.46167-3-philmd@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 18 Feb 2025 10:52:28 -0600
X-Gm-Features: AWEUYZn8gQqosEO0e1gCKUbrt0HCJzA-UMZ55g9inVW7k1cA7-ctVXAivgYFFLA
Message-ID: <CAJy5ezp2pgDAyraishtSkfSMHU5aRj_myZyO=nRNpCVFXkh4jA@mail.gmail.com>
Subject: Re: [PATCH 2/8] hw/arm: Do not expose the virt machine on Xen-only
 binary
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, 
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
 Vikram Garhwal <vikram.garhwal@bytedance.com>, Thomas Huth <thuth@redhat.com>, 
 Jan Beulich <jbeulich@suse.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000014ce20062e6d78c4"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Oao547RaCrmm

--00000000000014ce20062e6d78c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
wrote:

> Since the Virt machine is useless under Xen, do not even
> try to build it there.
> A Xen-only binary now only offers the XenPVH machine:
>
>   $ qemu-system-aarch64 -M help
>   Supported machines are:
>   none                 empty machine
>   xenpvh               Xen PVH ARM machine
>
>
Makes sense to me.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 256013ca808..e5f4b1d84d3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -2,6 +2,7 @@ config ARM_VIRT
>      bool
>      default y
>      depends on ARM
> +    depends on TCG || KVM || HVF
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      imply VFIO_AMD_XGBE
> --
> 2.47.1
>
>

--00000000000014ce20062e6d78c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd=
@linaro.org</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_conta=
iner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Since the Virt mach=
ine is useless under Xen, do not even<br>
try to build it there.<br>
A Xen-only binary now only offers the XenPVH machine:<br>
<br>
=C2=A0 $ qemu-system-aarch64 -M help<br>
=C2=A0 Supported machines are:<br>
=C2=A0 none=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0em=
pty machine<br>
=C2=A0 xenpvh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xen PVH=
 ARM machine<br>
<br></blockquote><div><br></div><div>Makes sense to me.</div><div><br></div=
><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@a=
md.com">edgar.iglesias@amd.com</a>&gt;</div><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0hw/arm/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 256013ca808..e5f4b1d84d3 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -2,6 +2,7 @@ config ARM_VIRT<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0default y<br>
=C2=A0 =C2=A0 =C2=A0depends on ARM<br>
+=C2=A0 =C2=A0 depends on TCG || KVM || HVF<br>
=C2=A0 =C2=A0 =C2=A0imply PCI_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0imply TEST_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0imply VFIO_AMD_XGBE<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div></div>

--00000000000014ce20062e6d78c4--
