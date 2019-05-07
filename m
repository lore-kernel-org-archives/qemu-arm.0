Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3743745wrh;
        Tue, 7 May 2019 08:12:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxy/K/gVCN2O2sWwojXeUQcQPC14TCprwh7AiCXNjU6GAzfoxhchRD38lWQtE3yPbpAJuAP
X-Received: by 2002:a1c:4d04:: with SMTP id o4mr11652664wmh.126.1557241932475;
        Tue, 07 May 2019 08:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557241932; cv=none;
        d=google.com; s=arc-20160816;
        b=ti6mtoh8KvpkQJJ/VrfI+NlOaH87FWTW9m/K9rknKPnPI+BlfvODqlzleYRjH2B5kn
         AZPJTRfH1gZMp+/FSIxTEU0sXDgDDxk5foREdzP5JbdUebCd+L+5Nm4Ie/Wx/VbCYqPU
         pbp2hMpCEgvg7Xa1dC99rfKFOpnDaGPfr0gCjqHpr3p0YtWpVR5dFc9tc40bwGv7ffwi
         FhO6xtsfUg/Sv2QY4pV5hyo71ItPvYqKayZPW5I9qRMeNmWZ5sFSFT8ISC8kVyQdRlw+
         LiSEEFu3TPUx9MisHGzR9hvtTzDLHeFiUddIBqTIhoV8Yo++u8hqPtKGtGFOSFD28LnN
         R2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ERUc4lfaRUMaI2vR7im1db9H0mEeqoyLpH0DbzMV6J0=;
        b=DBy0+3D0rhKBuI+6/OmTPwlB3PXwIa/gIVfqZ0SNdWf1L3/J1J294PUpvIG9Ju+PYv
         YMPnn8fuL3xwQrG5SJFJlIG1BY18BEBJuG/InzuE57FwxZU8dnuaZYGMMvPii76ZrvRi
         W83rmGb1kyE6UbMaDXf4IlNS7xCw9wQ80ifwjSA3WNaRa4aOesdLhea547P0cPdluLaQ
         Bceh0zHM55ZLSy7rlyua4OB/0rqts5hskTAw8jYrvuSTB40KKu0Krvxr/IamYv3JMIKt
         ZzQWSFtX+3TJt3ELEB8kCfmcDcaTN/jkqsUIDQr2mfjcvRheCqUM8WbnuZcBbAh8LUNM
         gNFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t63si9315552wmb.139.2019.05.07.08.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 08:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO1lL-0004Ea-IM
	for alex.bennee@linaro.org; Tue, 07 May 2019 11:12:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hO1jz-0003Vj-UT
	for qemu-devel@nongnu.org; Tue, 07 May 2019 11:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hO1jz-0008K8-5c
	for qemu-devel@nongnu.org; Tue, 07 May 2019 11:10:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hO1jx-0008JQ-6G; Tue, 07 May 2019 11:10:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8264AA77F;
	Tue,  7 May 2019 15:10:44 +0000 (UTC)
Received: from [10.40.204.24] (ovpn-204-24.brq.redhat.com [10.40.204.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6CB60C4E;
	Tue,  7 May 2019 15:10:43 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190506173353.32206-1-richard.henderson@linaro.org>
	<20190506173353.32206-21-richard.henderson@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <728e27fd-ec5b-b875-893e-913007dcc263@redhat.com>
Date: Tue, 7 May 2019 17:10:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190506173353.32206-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 07 May 2019 15:10:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 20/24] hw/misc/exynos4210_rng: Use
 qemu_guest_getrandom
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Obt0QpejPyqd

On 06/05/2019 19:33, Richard Henderson wrote:
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.
>=20
> Cc: qemu-arm@nongnu.org
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/misc/exynos4210_rng.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>=20

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


