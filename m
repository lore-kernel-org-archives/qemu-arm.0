Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2492526wrs;
        Thu, 29 Aug 2019 10:53:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsDEXV7xXTi8ZdEGCFbTLV7LNdnQiyu8fbvJVi5FKFi5nO+GpXpYe/Uk6I9N/9mLzsQKv+
X-Received: by 2002:ac8:138a:: with SMTP id h10mr6346333qtj.263.1567101230935;
        Thu, 29 Aug 2019 10:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567101230; cv=none;
        d=google.com; s=arc-20160816;
        b=EgoZRh/3ozRnSyORUXK4o7rv8raVn1G0F9xZet/+i+SL8MQxzJ4O4u8BdsDJw+GmaN
         tcbUGLQPzZgu8NsOcnDJsTEgwggcmUUrKegMtBHRHDYsdz15RIJzZ1y3UauGnNPZAb4Z
         YG5Mn5sn08ZE3peD2ErjF28UDAZ2vqTKwjDcgwjL86dTtaK8LEnKEzfTONe8BNum1LFC
         UPW5Bt1WwUA7XcOMbU95W92EGfRdVQSHTd3DOy2hTRxjN+8NqHhd+5JIwhoU9wDmiXTN
         Rn5ltmq5nTbIQcRxlYLCKmL4JYqqh6429AQHWlygKwXF4NhwhASWj6p8l8v0t6IXLiV3
         tekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=9pUKeFdH4pPufE+Bu4nvuzcJwxUAuwa2I0hI2l+QLUo=;
        b=fmy0A4FCxd5kjzM7FoB0+pSKpcdAASzgH0vq4eczNCSOVHLVlqerFOqT3VniNwbZ/S
         K8t4msUEs/XYHBurTml7Ru10+Y9ynizPFP33L96fmyMe0cNbJmNtx8Yx5lw8lIGR9GFK
         ypceQRx5DvO7TS+j6ztjXmLlSuUixlJMVhDhU7IEWR2iggNBokY9jw0nZDdoggTLpj+F
         7KeqS5OLtSELRq4j96h873DQw6NX63nj328y8TnPnHRpdhtikRgNtfiw06/D1c+npKN+
         PjiyqixN6wHnwlfQ4G7yFSXAMsugLA3+OBSqWoBBoMf8QwLanpVW86IwxVGND6fl3WgH
         zaKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si2383947qvc.41.2019.08.29.10.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 10:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3OcH-0003Jd-VM
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 13:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3Oc1-0003Ho-Ul
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 13:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3Oc0-0006YD-OM
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 13:53:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i3Oc0-0006XY-Hy
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 13:53:32 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AC0D2C050DFF
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 17:53:30 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id c6so621427wmc.1
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 10:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OqMTtERx0hfympLsc9/vXNzhGmht04yyCyEBJNDtZKE=;
 b=kURoohh86wZBAgNTOW3NXxHuezhL9GfdTAtvPD0zrn5T8cg0VOB/c28WJNgBcfyilj
 3yCvZQqJePSe3DU2e/KN4OsKrBsSv9uqSPO/xQ3UrICTni9Wm9cspro0Ej7J2ICBKkHw
 m1DAehBOeucSOO3U5ujtyVHbo8a76OPLgbmfQamizGIXftCmUYqRhwUHtMGcLMr2PumR
 37lrxRuqzaVtLx6VWuKQcoFBnI8bGEBbtbA8sROk6Z6fJHPCy9XVStVJqOXO4Eo2KuZM
 fFB6wIucHBFiiGVV/lPYTFtzrqEQB8RgwPeZGtE3zWxWcsu4NxH6qfVAawUh43xSDjSu
 eh/A==
X-Gm-Message-State: APjAAAXcak2MUqUFM/zSzuURS3hj5vp04vrLfONVStQLIhtSTF1FFXzt
 nKFj2kIDuwK0ApUNtKMsrg0MM0c6tWAffZ/vGB6Ba4x7QOo4oE8e2OMSMctFlhxnmmcQHJJzKL3
 p4IZzPJXbypOq
X-Received: by 2002:adf:de8a:: with SMTP id w10mr2513392wrl.276.1567101209528; 
 Thu, 29 Aug 2019 10:53:29 -0700 (PDT)
X-Received: by 2002:adf:de8a:: with SMTP id w10mr2513380wrl.276.1567101209382; 
 Thu, 29 Aug 2019 10:53:29 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id g6sm1134506wrs.95.2019.08.29.10.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 10:53:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190827121931.26836-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <008c33ee-0fcc-7166-630d-cdeda75dc40d@redhat.com>
Date: Thu, 29 Aug 2019 19:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190827121931.26836-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Free TCG temps in
 trans_VMOV_64_sp()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ykNOo5DNDXm3

On 8/27/19 2:19 PM, Peter Maydell wrote:
> The function neon_store_reg32() doesn't free the TCG temp that it
> is passed, so the caller must do that. We got this right in most
> places but forgot to free the TCG temps in trans_VMOV_64_sp().
>=20
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.=
inc.c
> index 3e8ea80493b..9ae980bef63 100644
> --- a/target/arm/translate-vfp.inc.c
> +++ b/target/arm/translate-vfp.inc.c
> @@ -880,8 +880,10 @@ static bool trans_VMOV_64_sp(DisasContext *s, arg_=
VMOV_64_sp *a)
>          /* gpreg to fpreg */
>          tmp =3D load_reg(s, a->rt);
>          neon_store_reg32(tmp, a->vm);
> +        tcg_temp_free_i32(tmp);
>          tmp =3D load_reg(s, a->rt2);
>          neon_store_reg32(tmp, a->vm + 1);
> +        tcg_temp_free_i32(tmp);
>      }
> =20
>      return true;

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
