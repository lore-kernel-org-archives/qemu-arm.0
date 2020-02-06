Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2012312lfp;
        Thu, 6 Feb 2020 14:51:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3iWQ/ruGZljNJWd7lOu/rOwgivBCiZ7Uz8bDnsY0XIh2AV0H4QDeP9xHYQth/tDk27A9G
X-Received: by 2002:a37:a915:: with SMTP id s21mr4668048qke.112.1581029488279;
        Thu, 06 Feb 2020 14:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581029488; cv=none;
        d=google.com; s=arc-20160816;
        b=ZN3zFZjV8eWs0fDH0pmzZIplL/isVlfjBVmxxMnrMoyk8LcvTC59yqlMJRW1XsEFQK
         wvDRARylrHrXRc37gj6a1LZBF9CN/+57SdGz5pVf323eLysQ6zc68/Qt7q96lqndWycm
         oTfxAsEEBJiH/fsV6JrylZXwtcyFakCzBrPjMPf+pdTkSVB/f3FWhse+lXVASnFpAxLD
         94PDL8GnczFi4PpQfTAjrlzv5R7BJcEKEQ51KbadQ5TVwewHrFtFJk9byd1rttraTunv
         399z3XKyva7LODJZk+PdifKtcvLmRkAPCVWmtRLBbtX8ZYkCDjzs2HV3Xm22XmY2IBGF
         Ht+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=icv33eBiR2I+mYSDzaq6QSN263N2WB1MBrPZaycniYY=;
        b=QUHB83U5b5yZuNd8crjbWxcgTF/noB7L1+5RtjeEcexhKxC1m9b0etB4T49BS1GvSH
         CCFvGa/2vgdop866RNsS0fbfv5NblVA46574WNtXH9rJykPEGPOESEoe83NHk6OIY819
         FAGrCdec/S+frnKhSeWVNIE15yyQSEBEtNURRKeFh/NxndSNlcm5wMt//gi6wvHPSdej
         1zP5psong1ZTYwslSjWi/bevHcuH6lpLyarimNBCXHDA8IgYbEve9lLv9UbFSmP1YcmT
         jN5qUIk0DF3ZzhPEuGwPc0dz2KEEGA7m98W3A4TpDpjc2Af07Eby/pWVl3fCmP3v4xIq
         JuWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oo075gQm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si474037qtq.67.2020.02.06.14.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 14:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oo075gQm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izpzb-0003Oi-N0
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 17:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izpzG-0003O2-Vu
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 17:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izpzF-0003AL-RG
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 17:51:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29865
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izpzF-00039m-Np
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 17:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581029465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icv33eBiR2I+mYSDzaq6QSN263N2WB1MBrPZaycniYY=;
 b=Oo075gQm+YUdeZ6G0CPu81UiyisbwQdZk0WC5Lqjk/7Pu07QRVVcp9Sckr2SdXbMWlOenH
 sZYed3yXy6pysILhbykpY3UV+GzMCUlb+QeotySlNpZ6vsyOksEZ/wfTSPXoeAryjVdP4h
 EFMQYg+ag+IFRaLNcC7eYNKBwAmK22Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-DM6-gJWhNuOnswim0ZdQmA-1; Thu, 06 Feb 2020 17:51:01 -0500
Received: by mail-wr1-f69.google.com with SMTP id x15so195489wrl.15
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2020 14:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6zonQwthUIyO3uDNOl9B69G6xjJlqM2rgpgfOa2CcHw=;
 b=amav5sFK/6hDRBPUkgBCzT6vaod9XyXtpiOgTcTZN2izhL9YQvgQPJGXAgnRIysHt4
 NtaqUPbXqYOLjCR2QezwCRWaHKwN8jou8BBCaSce66lYsI+uPIApiXqL3eVmG/WJY+Ss
 vrNZZ3gKnTHkpbSJYQNy+LWWW80Ae88FSQkRngYxlYDvCFysQlxxGbKqcp1d/Kk7IwVR
 pFCUD/KQHuLAffDzkWuesJukTGYCsDZcY6SEofr+VEK8t6qDmhLaGes9QUDZ9hGA/Ip9
 a6WZEHzDAxDYCJ5kHufiVd/qv5loXDO5hEMEKQZvxfecitYSwHGYxwTYl2XX3wdtUJbC
 EWxw==
X-Gm-Message-State: APjAAAVtQ/r2W9ZePtjsKTkZV6drRtSWqeslwlt6CUbzd1ZjkGwK+lKk
 mK6aUXaQWKS+vk+3Nxz9OvL1gSbOP6MTjdqI2MKHez0NItiwlOLi74EqtFFJGm++RCiEqIiEMME
 /BHWQK+YOmR1o
X-Received: by 2002:a1c:8055:: with SMTP id b82mr65068wmd.127.1581029460388;
 Thu, 06 Feb 2020 14:51:00 -0800 (PST)
X-Received: by 2002:a1c:8055:: with SMTP id b82mr65051wmd.127.1581029460189;
 Thu, 06 Feb 2020 14:51:00 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id l29sm853996wrb.64.2020.02.06.14.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 14:50:59 -0800 (PST)
Subject: Re: [PATCH] docs/arm-cpu-features: Make kvm-no-adjvtime comment
 clearer
To: qemu-devel@nongnu.org, Andrew Jones <drjones@redhat.com>
References: <20200206224858.23184-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f8ed42e-15be-1f80-107b-fa4d4254da2b@redhat.com>
Date: Thu, 6 Feb 2020 23:50:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206224858.23184-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: DM6-gJWhNuOnswim0ZdQmA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b0u4CUPH/K2s

On 2/6/20 11:48 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The bold text sounds like 'knock knock'. Only bolding the
> second 'not' makes it easier to read.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   docs/arm-cpu-features.rst | 2 +-
>   target/arm/kvm.c          | 5 +----
>   2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> index dbf3b7cf42..fc1623aeca 100644
> --- a/docs/arm-cpu-features.rst
> +++ b/docs/arm-cpu-features.rst
> @@ -185,7 +185,7 @@ the list of KVM VCPU features and their descriptions.
>  =20
>     kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  Thi=
s
>                              means that by default the virtual time
> -                           adjustment is enabled (vtime is *not not*
> +                           adjustment is enabled (vtime is not *not*
>                              adjusted).
>  =20
>                              When virtual time adjustment is enabled each
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 85860e6f95..bcca8c8029 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -194,10 +194,7 @@ static void kvm_no_adjvtime_set(Object *obj, bool va=
lue, Error **errp)
>   /* KVM VCPU properties should be prefixed with "kvm-". */
>   void kvm_arm_add_vcpu_properties(Object *obj)
>   {
> -    if (!kvm_enabled()) {
> -        return;
> -    }
> -
> +    assert(kvm_enabled());

Oops, this was not supposed to be committed.

>       ARM_CPU(obj)->kvm_adjvtime =3D true;
>       object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_ge=
t,
>                                kvm_no_adjvtime_set, &error_abort);
>=20

