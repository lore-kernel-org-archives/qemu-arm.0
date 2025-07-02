Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3854944dye;
        Wed, 2 Jul 2025 07:33:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2K1Q2aA2wIkLTqp3ypdGRA/tRuvo6PS7pGXCdYXIDX/y3m1QHMv5vTzX0KtKYgchSTKf1wXsTcZVTAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHuTdlNPAdy1uvTeBc7ZEJsKIDjjdrTg++LdZiNO+r7jqfE5un2AoKKA7RuWnG8Vv0NiZ35
X-Received: by 2002:a05:6102:3053:b0:4ec:c548:f953 with SMTP id ada2fe7eead31-4f161278d53mr1549842137.17.1751466811849;
        Wed, 02 Jul 2025 07:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751466811; cv=none;
        d=google.com; s=arc-20240605;
        b=XQuMkL/z5hJZK+jb+HnsHP/7WpoSPSYBrp9tnuMzhwDjo9eX61PfqkOnTV07HHikbk
         7QvZpE4S8SVw2OrcCE5icqQaH6OWdES0crLjnDa/KEYlHr7is6qkU731sUqzdoYlQiul
         i7JvxV38hVYOGIsaUGnsTkl7eRkVA2QVPUeS47uGJxvVyxI4muGfDTOrdHeWcSXREH7W
         OWzgqZ4kdmRx7r5ZW/f0FPwUqpWbXrL/bo6lw/SgVkRrHo+6YNMTaasVkoTk9zqxGCBB
         0iUVr+3gVU58F+FISGg22cAR18SRMiEeQ/0LsfPpzQ2QgTk9sSkFwrWOK8Ptu7evtKAh
         YkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BsBKy9jl+N02u6EXjdGsJxToxb/LGdsXv5iKgtPBjjY=;
        fh=L30d3habTl3J6moarJSiwpCEHmUvoG5CLLdkIVpxjLg=;
        b=Da0DGPf7SzCDb8MZsNUA34poHRAIthZtMKMDzg1DMgra0luzgX3eY/JfM9ex0acoEp
         8icRaZuCAY3h6sbxA4nA2XLGAUHuVFt5ZUXehA6TCh0hG66kp3FZe5KL1lifY6uyTb/l
         ds5o4tZxSx64lu8bwLZ9wuL7T733HUlUheP7kqbO+otrXeW4QdzO6UWesa/myuNq9fvB
         8Q6sjtgIU50LWjykDQcdsnZeseD8+7o2JgxjSxcDvp97ufvPXVE53sazbzb+k35Byp5P
         RLRedtzStGca/w18fMd52HjDV74Jpr7F9Hsa4/sq4Iv5xZ5VpNJITwu4iZv6l++8Crh9
         llPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WeGDS3VO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ef00209bb0si2295359137.283.2025.07.02.07.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WeGDS3VO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWyWb-0002Ux-Dp; Wed, 02 Jul 2025 10:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1uWyW5-0002QM-0n; Wed, 02 Jul 2025 10:32:54 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1uWyW2-0002jD-2O; Wed, 02 Jul 2025 10:32:52 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso7249252a12.0; 
 Wed, 02 Jul 2025 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751466765; x=1752071565; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsBKy9jl+N02u6EXjdGsJxToxb/LGdsXv5iKgtPBjjY=;
 b=WeGDS3VOVeq6QN04WoLhzhbn1JIomGocYUK5mNQU5eLfGAqMDCjiZzd1LsDQWY0mqr
 Pz858TXfCkZTw4ADx17s1v9gvs5JEgV1HO5Yp654ndxrUFuio89mNYCNRBqLqAu0ND8u
 C1SqaGfiq6GhqoZKhUEVrJ7vCde9tVuP4KZZoysa8Qb1bOTrIyYnf6FrE0Dizs5KxAcz
 U1S5Yw4Yw3kJnC+Klx9JsHDxfLnnlF/Fz0pjr8aeeSE6TmdzKrPtsxpeXE+sNrK6y/Jp
 s8VjPeiE0nVQUQrcFhudV2IIMAwDHcM+jLNXYSiin+9mNmyRptUJPDC32uZjjUqvgqsP
 a5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751466765; x=1752071565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsBKy9jl+N02u6EXjdGsJxToxb/LGdsXv5iKgtPBjjY=;
 b=Wl/5TNmAMJw8TG+UMKj7OMwFHXTc7MnGQjwr4cgyMhDYUe9pDWC0u3dFAZIvlNLij2
 8d55uJmxIoq3Wl7vEGOfev/MtZ7WNNYUR0AtCLpT4DTPdHRGBUQF9fyzAV88LUfVQCyC
 hSQ+MQwRR+feqgLaNwWDvsA2Sc21fIVIoS07k4855WsKv7iAWbtO1CFTYjysC22+7086
 PP3iPPwrGqaz2bQ3nGLMhVAYdKIlP9PXh1sEmDpjN6mu2OfC98REN9eUdNN3wD2S6et4
 OUWaCBUgIFJOyYe6iNQnzkFRg+um60EDWVm8KfKr3LqZSbpkgSMRfBpsY+JwJ4+0j7Aw
 GtVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtiSh6W9pygipMYPAgiBUK56mZaKS4Qx6fda510uhUOfp5q5zDmoNlXXQXBEIe1fPrYFez4Iz9WQ==@nongnu.org
X-Gm-Message-State: AOJu0YwDgu5NS/vWuxn/18eeMdgWPfeRySY0eqO9ltrbSXZQtdJ8XHaN
 jNs7sVfhghJ7AaBvD3FR4J/j5zFbIm4/E3SKwJmXynFy6tY2n1ud8g3KBM2m7MiYpRL9dFowBg+
 Fk61sTwnAN5h6ZEd62u1u122dCMFqEEo=
X-Gm-Gg: ASbGncsomLinbOqNctBxYkyzR4KnF4iZxcsbOiLHknXmL6Mx1VMwbPB8BHpYfEAnHMF
 cDPphqGBqiW8qAWcDJmU9KsG2m8iGODBPx7kS4y6Zy+1KLaoyBD3NNcTkC1Sx/dLzant3rLddAE
 k8vTuf0YbSzBSfxnffq25FOVb3g6dGXagzL1GX4tzNnQ==
X-Received: by 2002:a17:906:491:b0:adb:2a21:28b3 with SMTP id
 a640c23a62f3a-ae3c2c7d137mr271824866b.54.1751466764413; Wed, 02 Jul 2025
 07:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250701105809.366180-1-thuth@redhat.com>
In-Reply-To: <20250701105809.366180-1-thuth@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 2 Jul 2025 10:32:31 -0400
X-Gm-Features: Ac12FXwnYvWz-wZ4o5IVqEQBlIcY2dh1eSARpNr6DCEDjMM9sBh1YDa8TgnRqh0
Message-ID: <CAJSP0QWjoW3ZFC6dAXS-hsTBsdUVNOrMi5mwy_N6aEQtebaBHQ@mail.gmail.com>
Subject: Re: [PATCH] tests/functional/test_aarch64_sbsaref_freebsd: Fix the
 URL of the ISO image
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gjyRE3fmv+Me

On Tue, Jul 1, 2025 at 6:58=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrote=
:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The original image has been removed from the server, so the test
> currently fails if it has to fetch the asset, but we can still
> download the ISO from the archive server. While we're at it, prefer
> the XZ compressed image, it's much smaller and thus the download
> should be faster.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/functional/test_aarch64_sbsaref_freebsd.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

>
> diff --git a/tests/functional/test_aarch64_sbsaref_freebsd.py b/tests/fun=
ctional/test_aarch64_sbsaref_freebsd.py
> index 26dfc5878bb..92ebc69c9b1 100755
> --- a/tests/functional/test_aarch64_sbsaref_freebsd.py
> +++ b/tests/functional/test_aarch64_sbsaref_freebsd.py
> @@ -18,9 +18,9 @@
>  class Aarch64SbsarefFreeBSD(QemuSystemTest):
>
>      ASSET_FREEBSD_ISO =3D Asset(
> -        ('https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES=
/'
> -         '14.1/FreeBSD-14.1-RELEASE-arm64-aarch64-bootonly.iso'),
> -        '44cdbae275ef1bb6dab1d5fbb59473d4f741e1c8ea8a80fd9e906b531d6ad46=
1')
> +        ('http://ftp-archive.freebsd.org/pub/FreeBSD-Archive/old-release=
s/arm64'
> +         '/aarch64/ISO-IMAGES/14.1/FreeBSD-14.1-RELEASE-arm64-aarch64-bo=
otonly.iso.xz'),
> +        '7313a4495ffd71ab77b49b1e83f571521c32756e1d75bf48bd890e0ab0f7582=
7')
>
>      # This tests the whole boot chain from EFI to Userspace
>      # We only boot a whole OS for the current top level CPU and GIC
> @@ -28,7 +28,7 @@ class Aarch64SbsarefFreeBSD(QemuSystemTest):
>      def boot_freebsd14(self, cpu=3DNone):
>          fetch_firmware(self)
>
> -        img_path =3D self.ASSET_FREEBSD_ISO.fetch()
> +        img_path =3D self.uncompress(self.ASSET_FREEBSD_ISO)
>
>          self.vm.set_console()
>          self.vm.add_args(
> --
> 2.50.0
>
