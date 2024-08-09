Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp807818njc;
        Fri, 9 Aug 2024 02:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZilWwYitTP3QK1XGCmzlFwtuEp2k0L4TbwcinPIIabT6R8RbJTEjNOBxIX0CpHEzqMEdhu94OHj5y/TCIr9PfJhixJDk/
X-Google-Smtp-Source: AGHT+IFWQ/ViwHFm4Rq2QJ6HXz3PiDzVG4pYH7VNaZAyFIl1dwwzCnzClI/If6pbzhrGOk3c4f+M
X-Received: by 2002:a05:620a:1a0e:b0:79f:1869:11fe with SMTP id af79cd13be357-7a4c181db66mr114735685a.52.1723196573952;
        Fri, 09 Aug 2024 02:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723196573; cv=none;
        d=google.com; s=arc-20160816;
        b=I/W8Q0mEfNYBjff8AsyMSao8c/YTuAowC04G0qiXr/SRM4QOkUDOENpzmkWpqIcrrO
         jRKDzb9RGNX33bAs3lcsPQJV/6udNKSglwWlOcFJwaEX+sunIIOYDNHM+yapuSLbcocx
         6HfdSxkRG7Y0e4tNQcmYd6C9/dnt9BQELmnr6aa0uz7SDNTMR5bOCZxrlxkLa3mxXLU5
         BycHynsfrmSUBTVJjHZ81WBUgdRJCiKF/yVf+sJT8aYum0xBziyxoo/Zi7Sb05IkuVgo
         j21toxJSF8/YJ0sNlX1F6yT9aH6Xekg9DpW4tVijUa7NNhcWViEMKWArTyz80jdrHfPC
         g9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7toFUW0d7oD6ChtLu69bkrvZQEmYJ5me+ufe81DvD8=;
        fh=dOefkla4L665zBStvI0e8nZuc+kBeMIpQD5B2QMq9Mw=;
        b=NhTMlrjUdrI2nAoCJSzZ1bOOgSoU2MtwgpponkXFQiCpbr6Q+oyMvWnquBCyYib+8S
         G0DZ8OM0vumvGZeUinady0cxUpp2R3OhFiNUoAYUTenWghIQlfkpmv7MFhqfunJNUUqk
         NPo7V/h7ZLPWt0nOCPxnKU2kGzX9k1PnFqEUgKRdNbOIr84Lb3cNiPBjsmgVdovY4yl2
         By6ebqIJubYWVZBYOmf05gr6d5Hnx+xyNf9evE9nj45/05T8dNe0FqUMTIkYgh6E4HaX
         oivRz6lTYC9hPCtq1XKtkAW46ZdYLmXPqWAn4ueb5tuFj+b/KPX4GV7g5fV0084TIvgL
         L9cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IVMVIapA;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a3785fb58asi647168785a.90.2024.08.09.02.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 02:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IVMVIapA;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723196573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7toFUW0d7oD6ChtLu69bkrvZQEmYJ5me+ufe81DvD8=;
	b=IVMVIapAdatbh2ZZK6i14tAcblfmec3nxH8Ya0dazVDptPubJPE/4nxpHB//qlcXH/F+lD
	ezsBeqotJpNKdbV9mNxiWgT4Gckn/VLwNxZysthB4dHJh2OImz9VPsAA/wFubrpiEzltg1
	Pn00llKau2GLwV/6cayl9Ka55a2mQdQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-I6DgbYWKOu-g0m4aK6MzIw-1; Fri, 09 Aug 2024 05:42:52 -0400
X-MC-Unique: I6DgbYWKOu-g0m4aK6MzIw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3687e6d7a3aso951763f8f.2
        for <alex.bennee@linaro.org>; Fri, 09 Aug 2024 02:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723196571; x=1723801371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7toFUW0d7oD6ChtLu69bkrvZQEmYJ5me+ufe81DvD8=;
        b=GE+qSnx4XJKtsOR5De2KF3AA0LZJN5sd4+rvFF1qvKuZKcEkhBcJyP2+g270fuaQSR
         LEstQ4pu5z3/Dz+OgMpebDAISxvKToqKk7BKHDZA9uvwIuNmsCYaadpukcjgFRZqUd49
         k/ulTm2YFNJgr3Kgm50pdfr/ylcpnMwe/piFs60CUbZG9YTbeMlZucYVY6P7t/iJIWk0
         aLewPRaCduqpZQYJswsj9K5AuDDnMttK/C72HHakNC/WKY1DmXdTiVDoO74ifgOudndm
         thFuXZKb8mLLNuKk/nSdQN8lZI67N2FD4cHIERLlDu+zdMu+el5WhHsr6O871C+kxMAM
         Xs5g==
X-Forwarded-Encrypted: i=1; AJvYcCU6TUigpwvhwmZ2b6cFdoQwpNIjl0PGCSKyGwYCTPe89ehjFqMb8WGSAOQz4VRkfFQ7esUaFfBp2X6dGH8tGM0+WEK931Tu
X-Gm-Message-State: AOJu0YyB2EMP031Up2RAzKaElWmGeZXjZUGSyKHsjQUWKgnHfp6S0G3q
	JuIfBuj55ysYdfVa3ieIFabn0Tq8HiJt4vuN1swLJu+x9Yq6k8fpLZ2iPE1uc50GbmTOdAtWhYx
	w3SEQLQ6ztpaaE59Nm5QlJwY3KswpI8vElYrVZNBEB6R7zNiwm1xmQ0ULwSmsqAi3uW/pFpjW9U
	8Jk+99pnKIICeEpvatJOq8kurf9Win
X-Received: by 2002:adf:fe8b:0:b0:367:8383:62e2 with SMTP id ffacd0b85a97d-36d5fb92ebemr570330f8f.29.1723196571081;
        Fri, 09 Aug 2024 02:42:51 -0700 (PDT)
X-Received: by 2002:adf:fe8b:0:b0:367:8383:62e2 with SMTP id
 ffacd0b85a97d-36d5fb92ebemr570314f8f.29.1723196570614; Fri, 09 Aug 2024
 02:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-4-tavip@google.com>
 <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
 <CAGWr4cQL_LMWmEUdoPprRSp2k=CkQ0UJp5Q45qbAtUvvE6fDHg@mail.gmail.com> <9080f7e5-a40d-4cbd-a734-74578dd27894@linaro.org>
In-Reply-To: <9080f7e5-a40d-4cbd-a734-74578dd27894@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 9 Aug 2024 11:42:38 +0200
Message-ID: <CABgObfY1hGKhBjwjDeKSSd5uxbe8Lc5=hVL6psB0NLbnX1bJ0g@mail.gmail.com>
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Octavian Purdila <tavip@google.com>, John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, stefanst@google.com, alex.bennee@linaro.org, 
	thuth@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
	alistair@alistair23.me, berrange@redhat.com, crosa@redhat.com, 
	bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6bxCYe6dbGNa

On Fri, Aug 9, 2024 at 11:30=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 9/8/24 00:30, Octavian Purdila wrote:
> > On Thu, Aug 8, 2024 at 2:56=E2=80=AFPM John Snow <jsnow@redhat.com> wro=
te:
>
>
> >>> diff --git a/configure b/configure
> >>> index 5ad1674ca5..811bfa5d54 100755
> >>> --- a/configure
> >>> +++ b/configure
> >>> @@ -956,7 +956,7 @@ mkvenv=3D"$python ${source_path}/python/scripts/m=
kvenv.py"
> >>>   # Finish preparing the virtual environment using vendored .whl file=
s
> >>>
> >>>   $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
> >>> -     ${source_path}/pythondeps.toml meson || exit 1
> >>> +     ${source_path}/pythondeps.toml meson svd-gen-header || exit 1
> >>
> >
> > Hi John,
> >
> > Thanks for reviewing!
> >
> >>
> >> I haven't read the rest of this series; I'm chiming in solely from the=
 build/python maintainer angle. Do we *always* need pysvd, no matter how QE=
MU was configured? Adding it to the meson line here is a very big hammer.
> >>
> >
> > I think the minimum we can do is to install it only if CONFIG_ARM is
> > enabled. That might change in the future if the models we create with
> > pysvd are enabled for other architectures.
>
> Similarly on how we manage libfdt, you can have meson defines
> SVDGEN as:
>
>    config_host_data.set('CONFIG_SVDGEN', svd_gen_header.found())
>
> Then declare SVDGEN in Kconfig.host, and finally use in the Kconfigs:

That would force people to install pysvd on the host, which is a pity
for such a small and little-known library.  We have used submodules
in the past for much larger and common dependencies, for example
capstone.

Paolo
