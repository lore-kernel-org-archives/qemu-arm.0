Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4058322lfp;
        Mon, 10 Feb 2020 09:00:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2AJLsPiU8J9aBgoD6edro+u5MV8Drl94JXvDheVi7aO686xb7eHYNDxDSgSx05pEDkvvm
X-Received: by 2002:aa7:cccf:: with SMTP id y15mr2053609edt.108.1581354005962;
        Mon, 10 Feb 2020 09:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581354005; cv=none;
        d=google.com; s=arc-20160816;
        b=uqc/adfYB+JDPVMDiGw+BkAA6hxzHxE7YZUwuLBxEeBxeX+EecyOpDJZO6DjdoMe/f
         FwwAMazU7v+lbw1IIAyDEEhSLU79ZB+K85DxdVJRjtk1p8x+X46IlE9lNREXQ1xUb7a3
         InqMKd/nKP6NaazJ0OH2cuMC6HBM4sQpZ1nvkHBNrNlRsVhwOt7/sSgfy0nCK7L8VXxX
         QIMZCI6JnBA6aiIWeDaBMJ7qW6raWWf+aZRpTdszbwBZrLqeGZGBo4KZ9qyR3qSVyjKa
         hjstZ2fzn3Fo3E9Ih6ENWXJUWTBYajVzHmj8Q8pbT+tTIidO0/rXWdPaaIn8so/5bELK
         ilBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:cc:to:from:subject
         :dkim-signature;
        bh=s6JBxGllA5vxyJ1DROXunLofJ9+EPWLrYz6J/SfQH1E=;
        b=QxKcMGAXzyxSmFY8Nd4BmS1kjt7thqRsh77BlRk6HNigoKXhk5lzQ4o+c6lUeRsPKV
         /3zYk04a5SXG+ON8x14PS1j/PSNTZEkY5JYADAnsUQ7F3F0FSfkRlupq3sZN4hUFhoyH
         ztEfcGz+tchlO1ZBvYc4YWbekTNRDWS778n9hyLG16n3kiKAxbaI7+SL4MFfTjGC1JnG
         wpi4BfzV+ZA7z5y1ZvRjwfLMJJmQkrm1JzINCl3ZMLHxQtdtFXjN4Ju540KirVFl239p
         urb7kSy6S4b9WpDKY4IJnkhaaXVoCpE9fPK8hCkjmsTSMgRxMqo/mxkwzcdqf2ZXZoIM
         CQmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q0FlcJPF;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id a15si392381edy.166.2020.02.10.09.00.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Feb 2020 09:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q0FlcJPF;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581354004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=s6JBxGllA5vxyJ1DROXunLofJ9+EPWLrYz6J/SfQH1E=;
	b=Q0FlcJPF3YUQgxPsJnOz1MYD2t7AbQcdQa5sDvxWbKgH4+gJEbdxvsWJkbXOLjh8Qzx578
	3qOf7dZYYPjhqLkEzP0lw8fmAfPk4IM8CUkZXzIj8rAeSuu7FsIHuHpsC4fPByfFyLt3P2
	4r3X6BSMlQdJPFKOTI+xKWuEraxkags=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-YR-RwlLxPzmdV8gFRaoa6A-1; Mon, 10 Feb 2020 12:00:00 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ED61800D4E;
	Mon, 10 Feb 2020 16:59:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-219.ams2.redhat.com [10.36.116.219])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 934415C1D6;
	Mon, 10 Feb 2020 16:59:54 +0000 (UTC)
Subject: Re: [PATCH v2] tests/acceptance: Add a test for the canon-a1100
 machine
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200129090420.13954-1-thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a967c93c-58b2-9a8d-02fe-e7fc9e833827@redhat.com>
Date: Mon, 10 Feb 2020 17:59:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200129090420.13954-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: YR-RwlLxPzmdV8gFRaoa6A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: n4XhZUmA0BMq

On 29/01/2020 10.04, Thomas Huth wrote:
> The canon-a1100 machine can be used with the Barebox firmware. The
> QEMU Advent Calendar 2018 features a pre-compiled image which we
> can use for testing.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2:
>  - Rename file and add class docstring to please pylint
>  - Add entry to MAINTAINERS
>  - Add :avocado: tags=3Ddevice:pflash_cfi02
>=20
>  MAINTAINERS                                |  1 +
>  tests/acceptance/machine_arm_canona1100.py | 35 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 tests/acceptance/machine_arm_canona1100.py
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efd3f3875f..ddf6fe0794 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -561,6 +561,7 @@ S: Odd Fixes
>  F: include/hw/arm/digic.h
>  F: hw/*/digic*
>  F: include/hw/*/digic*
> +F: tests/acceptance/machine_arm_canona1100.py
[...]

 Hi Peter,

could you maybe take this patch through your ARM tree?

 Thanks,
  Thomas
