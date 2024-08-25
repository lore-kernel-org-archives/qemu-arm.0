Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp662359njb;
        Sat, 24 Aug 2024 20:29:57 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUyQ0wgBmMvka0IYOUhUQDAUNKuJW4tssXhgM20pURXsD3eRjb3NFLap+yV9wcT1tGq7JBuETemyyPFoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGoE001e+eGhDE/QI1jzmAxAoPXLyG3WuMcelxO1zPmnNl9VfVHQ+uy9cygMqjZrAKKikic
X-Received: by 2002:a05:6000:1374:b0:366:eade:bfbb with SMTP id ffacd0b85a97d-373118c7bf7mr4088076f8f.46.1724556597407;
        Sat, 24 Aug 2024 20:29:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724556597; cv=pass;
        d=google.com; s=arc-20160816;
        b=OPq25AXDyNdBvOV+UNZjF40WKxLrmQPZ1n1pA1QBzuzT67AfTs+NZnFTEPb8D+V42O
         9Es0Cn2gW1/VR7hPRd+uScmRtz94gPjiITsECFXtE9nOXTTFBL7ecdLEaFUHpm4y3eip
         9h9p2HcQrTc0yp0auK5mukUqm90Nx11AT02F0dDWbH7yomVcX7kCcDzY/v0RY57ScH5D
         Hwh0PzqdBPg4vm1oU8/XHYEXA1WVV4hTpNPImD+ZWjzHneHVQHM/MNCdAwpTiVSVk16N
         GJuSvbOdd4mInKKABoODaywY80hvmFZQOTJbCJ06T7ttKZAeXf/MqLOK2ro2/PeV/gFe
         JrKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ih9lp8HxwvMk0XbD4DrVBt/iPsQox91OyflJI+0gzAs=;
        fh=AJ8hn4ioKJA5lsG3NCMNx8yhntdFUmRi9f6dN5eYbeg=;
        b=xI1/gtiG6u0m3uGC/A3JgrleRiyZ04dIKka6KsxzEvgJXpq8i6tdZmueVPRM8V1E98
         Ag+NmM5syUFkDhvMpbci3O53oRXmxtzk4QM7iOTVZqoMXl16/2vh0sDWoGhiQtG8UJj7
         zXUH1cxILDpMz0TJoBedWNVCNM042w4da+9hU7ZkEJ9OxoeOhRsYIEGoy/8X19vTwEJ6
         56+rtx39z2a2G8UUX00db3grC+n50srWwWRCSOCc177qyj+DkKfTLCHNtaqoPntDtz+9
         uQb7oZzgpA8prTlLdZl8z3z7NOKm+7Ro41duryhpayXzzQKI6RvaZy9dSY31SZNI+zHj
         Asgw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tard5wd2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-300226-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-300226-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-300226-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a868f220b0csi524580966b.1.2024.08.24.20.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 20:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-300226-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tard5wd2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-300226-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-300226-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F206C1F219D8
	for <alex.bennee@linaro.org>; Sun, 25 Aug 2024 03:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E340BE49;
	Sun, 25 Aug 2024 03:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tard5wd2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348AEB647
	for <linux-kernel@vger.kernel.org>; Sun, 25 Aug 2024 03:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724556592; cv=none; b=jQt0hErxCQu6gc0qNasdPQ7d8sp7S6GtPbwN7yDA9qUjlhZ3WrSexl+BSERv1XQ0epPtRBzq4IDQWByNdg7rm09MPlKCvwo0lldh/xw2t/WGJIfKK0W28w3JWeT/7f6BMoDXyuHfbwUWBh+de3u+utYVZ9obPwS+C10yJUvhmX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724556592; c=relaxed/simple;
	bh=4xLQFMqugB1RpTJGmvAdJwsDVt72hgC3qjvoz1pST8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fdjj1tZYF79+kPaG32p0NvTfFToEikCtztUUM0oIuu7DGTvgEmW3Z07bDwfjFvidStm18pjLJWuaQ6ketdQd4IzlzHthmTKkBgx1aJyRcLDkc628PxSDZoIgcKa9Fz0JsQTnlnN2uv/GIXnP+femPSddD6G0nxZlfAdeA5BykQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tard5wd2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F77C32782;
	Sun, 25 Aug 2024 03:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724556591;
	bh=4xLQFMqugB1RpTJGmvAdJwsDVt72hgC3qjvoz1pST8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tard5wd2nGNJTdz6lR0jQA+aqKJVfCUuPemaF8G+jaWP5kycYAtSDz3xlOFGAVREw
	 f6w/sxlVfuH9soTJhFbqTYAMa4i8byEwEkTj8/huE7jdiJ8WcnzsLsAAqa4UVyZNK8
	 3bgl/SlMchVy92OoTcnOkgTQDzUNrxby60X1mGl4hhNea+si7CKHcfp81clnCBro/Z
	 TYvoEY2nkB04WzwSc/jYUEtGLHGomAoyfcijFTmAIOO74l3QqVTJlsgsD9NvVbPYpH
	 AwYXW2dir8qzampyVBw8UVWUUymfDdhLcirAClIgS0fpTJ6q0IfORkAyhvb6KkLVCW
	 EK+zNfyNJOadw==
Date: Sun, 25 Aug 2024 05:29:23 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v8 06/13] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240825052923.715f88bc@sal.lan>
In-Reply-To: <20240819145136.0452ff2b@imammedo.users.ipa.redhat.com>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
	<2c8970b5d54d17b601dc65d778cc8b5fb288984b.1723793768.git.mchehab+huawei@kernel.org>
	<20240819145136.0452ff2b@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: YbfnPWJe9xsL

Em Mon, 19 Aug 2024 14:51:36 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> > +        read_ack =3D 1;
> > +        cpu_physical_memory_write(read_ack_start_addr,
> > +                                  &read_ack, (uint64_t)); =20
> we don't do this for SEV so, why are you setting it to 1 here?

According with:
https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#generic-h=
ardware-error-source-version-2-ghesv2-type-10

   "These are the steps the OS must take once detecting an error from a par=
ticular GHESv2 error source:

    OSPM detects error (via interrupt/exception or polling the block status)

    OSPM copies the error status block

    OSPM clears the block status field of the error status block

    OSPM acknowledges the error via Read Ack register. For example:

        OSPM reads the Read Ack register =E2=80=93> X

        OSPM writes =E2=80=93> (( X & ReadAckPreserve) | ReadAckWrite)"


So, basically the guest OS takes some time to detect that an error
is raised. When it detects, it needs to mark that the error was
handled.

IMO, this is needed, independently of the notification mechanism.

Regards,
Mauro
