Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6011075lfp;
        Tue, 11 Feb 2020 22:48:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7VapCP07QSHEwoxGjQW6pncAkvIwjPnJ8VLtJ0ArikQZSinh5KeKNbHrxIqStNrPGXXdX
X-Received: by 2002:a05:620a:2119:: with SMTP id l25mr9843570qkl.248.1581490110473;
        Tue, 11 Feb 2020 22:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581490110; cv=none;
        d=google.com; s=arc-20160816;
        b=txTh7VEe7aqktecW5B8R3oKHx51cQVgarh7JSEEjYmdhMC2ja8r99mz4DFwNVvqRxf
         QB4w4ew/wjbEOCsg4BrJfmvilE/Mo2/hk32xQjleo9sHA/L6NYukS2x22h2S6MugPPrL
         R5UQqiBpJfsahhadxGxKq8M09TTA4oYjy2BysvUzDRSCsvo+me1wzNmrGiOtP/AsUMAG
         A6xIOtwukR+1pAOr41iO+H2lI1bUpwqyxddTsQOtg/qd5s6oOwoK5ZSAzoMQ/z2nyqPl
         yUsRuUr0kJbu2CW9FoEFnB5/AUXY0lSc+N64ZSKwO93TxyJYT588VlDsJOdZQnrKHJ96
         Y9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=huYDHhyeDQkau/0GrQyIPkvWCuh3+ZoNaVxRoDa5Hbg=;
        b=PUlEUkjtbbpMO6kwyeS6jmC51/uZKK08hJmiTqLEsTivwhDL09e6AuR2su2JC23Xgy
         BMngtrngXMfvzNE+39xnuhShDzRZCSG8ty4p0bINp6yDCa52Tj1yQwU+peCmkq3dy4Jl
         xmLPrJVrtXpLdjv4xLq1hr9NH5WpBSmL5ssGY+sx4+LUb9O4aIVT9Hsf6gu2z+Ny+wNh
         eckGhzppEmvnNxXS7+ILnAomd+wpYk3tiy8eRYtXAf9IR6vWb4hB7+vl2nUDhwhfa/67
         kIFBmUKsQuLbqPqXd4DMLTYRx1FkeR4cAF7/WZ1ZiU1YU84HeCnlaKMrZ5mvDnKBPVXW
         dljA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZzbdR5sB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y27si3211977qta.299.2020.02.11.22.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 22:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZzbdR5sB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1loz-0003TP-RY
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 01:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1loo-0003RR-DA
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:48:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1lon-00020m-1D
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:48:18 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29096
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1lom-00020M-U6
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581490096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=huYDHhyeDQkau/0GrQyIPkvWCuh3+ZoNaVxRoDa5Hbg=;
 b=ZzbdR5sBg3W+YuTtI69NclxTtC5yeaC+nPzl9e6+yX6Or8JouZ/syUztFnXs3IigvZQ56U
 MrN9ZwL+bU94LKiYVJWGiDEyOK8P5SIsayRtqMU2bVh69rULtGv+eRXsnrql8RMyGFTOEH
 tVb2wVGm3NXQwXFrnWlJh+6knMnFLcA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-l_h1V1RKPsysORbA8R1njg-1; Wed, 12 Feb 2020 01:48:14 -0500
Received: by mail-wm1-f71.google.com with SMTP id b8so170935wmj.0
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 22:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TPrEEVkHmInFwFG1pvqFvaaK50sAKXWUESfUO3Qg1+8=;
 b=M+PaFpAt/Ktjn+TzZ2DDz3fzY81c9bLANhNjwOV4+mwahiUzWUFGq+LcN1LjVvAUW3
 N5OVDK++mLomR+YSb+zpqsHK8ne0jJyeKdRuX/z0uT374NViD44aio4F3dvfS2pcUWGs
 kLXKqbe80fGPWDeCEqtpuEssiVCqoNNOh8KLC3nnanAiCdPEPI9bzimta+NFxHhegEFf
 /FBhFZrNJEmOmZfW7ANONdNY5YY4bfzJxoPeeR9U5Yf0NQ7beKccvqMx3juaA39mWied
 /Y43D7P2pvh43nhj3ihndvHPMLlU6GGESyBdqBvyCvK1upwOAY8gFIBpklVziaYwnmn3
 eRwA==
X-Gm-Message-State: APjAAAW0ylevATI8pL6G5FCoUPGJSjp5Knu4yG27MSG2DeCaa7dhsfQT
 SwcsF5Xt+UjN9GFFh3ypXflYt5UoQGuGoe56rKZ5+xHQuBSzsQmt9ch9dGqfeWqr5Ep4fl8jMzA
 lji4g2T9sazy6
X-Received: by 2002:a1c:5441:: with SMTP id p1mr11317029wmi.161.1581490093293; 
 Tue, 11 Feb 2020 22:48:13 -0800 (PST)
X-Received: by 2002:a1c:5441:: with SMTP id p1mr11317002wmi.161.1581490093011; 
 Tue, 11 Feb 2020 22:48:13 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id d22sm6904813wmd.39.2020.02.11.22.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:48:12 -0800 (PST)
Subject: Re: [PATCH 06/13] target/arm: Use FIELD macros for clearing ID_DFR0
 PERFMON field
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e35821e6-f92b-ee14-6738-c2a29a006b29@redhat.com>
Date: Wed, 12 Feb 2020 07:48:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-7-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: l_h1V1RKPsysORbA8R1njg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TCMcu3+2M3pO

On 2/11/20 6:37 PM, Peter Maydell wrote:
> We already define FIELD macros for ID_DFR0, so use them in the
> one place where we're doing direct bit value manipulation.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We have lots of this non-FIELD style in the code, of course;
> I change this one purely because it otherwise looks a bit odd
> sat next to the ID_AA64DFR0 line that was changed in the previous
> patch...
> ---
>   target/arm/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index dc582da8fa4..e7858b073b5 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1603,7 +1603,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>   #endif
>       } else {
>           cpu->id_aa64dfr0 =3D FIELD_DP32(cpu->id_aa64dfr0, ID_AA64DFR0, =
PMUVER, 0);

While this one should be FIELD_DP64(),

> -        cpu->id_dfr0 &=3D ~(0xf << 24);
> +        cpu->id_dfr0 =3D FIELD_DP32(cpu->id_dfr0, ID_DFR0, PERFMON, 0);

this one is correct.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>           cpu->pmceid0 =3D 0;
>           cpu->pmceid1 =3D 0;
>       }
>=20

