Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3740479wrh;
        Tue, 7 May 2019 08:09:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAu7YTUP/hZX1JZRSkUDYM83iahbPJVUfegFefmkLH4Ep9dWkDVsG+AguFH9OKpoUStzJ8
X-Received: by 2002:adf:e6cc:: with SMTP id y12mr2126933wrm.261.1557241767936;
        Tue, 07 May 2019 08:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557241767; cv=none;
        d=google.com; s=arc-20160816;
        b=JB4Ei0TOcK2+9ezCVqv8rySvf6FOa52b0RhKIONaq1o7Fwa1bx5JYmbVS60AIWZ4BT
         w3AfGmZClGIvqW/lHoXbK+0uo8RSvY/opDSflTjuoaiWE2l/tRdKjZRQxHJb6XVUHyYF
         S1L1Z3NhA4mhqOuEw2eCRItolFDXztPJq8V3fFYHf/31prvwB5gTImPQRyUoiku7MGMr
         Hc0XPlh5X1Lj1esTATtjxnhoWYcpAdrEuEKaYLtfhmE+ANKu75n1zcEvSXQY+EeMWYZf
         sdMfj/MshraY7i2Ohj44XheKYzN1VoZvNzI7HCK9F3d0BLJ5A3Ov+gW0JB2OfVE0RgZp
         IJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=bnGfm87jYh/8HZFYRu9VuRYxvyZyDEVQUJhvdwfUR0o=;
        b=P3XtDCP2iHuF3cd/eO6XkwbGlHpLsjvXT6zCtgkVtMqDb9Xx8oHpMZYJuqcH9DtQeL
         m6/eDIJA2JdPqhyBMdZxMjgiwKW+RL0EyXIS1JJYo4mGRRXaCCTAu1JWdvouo4sawtZW
         X0GZf5NWiRrO6LW1R90HKDFpSxNNfT2LswToIHKQgGbbzILEIGZKmux4dNvzKuOcah9d
         kJYn8nnbf9EQbfb1coh1N3ADw3/521kD5BckACGpgjp/mII/koOzOpqP0A719e0PF1ix
         RLtl5QTZJbUWEvfx2PF1vTxCaTvlX52NHpVa/yjqiLMnwl6thGyd0qpU6hmsvYU+SWq/
         7Ivw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si9640998wrp.239.2019.05.07.08.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 08:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO1ig-0002KK-Up
	for alex.bennee@linaro.org; Tue, 07 May 2019 11:09:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hO1iR-0002IO-Vb
	for qemu-arm@nongnu.org; Tue, 07 May 2019 11:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hO1iR-0007Cs-3F
	for qemu-arm@nongnu.org; Tue, 07 May 2019 11:09:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52706)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hO1iQ-0007Ag-Tj; Tue, 07 May 2019 11:09:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59A1B300414B;
	Tue,  7 May 2019 15:09:09 +0000 (UTC)
Received: from [10.40.204.24] (ovpn-204-24.brq.redhat.com [10.40.204.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 256B8611C3;
	Tue,  7 May 2019 15:09:07 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190506173353.32206-1-richard.henderson@linaro.org>
	<20190506173353.32206-20-richard.henderson@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <9b3d7d8f-c5f6-c320-3100-2f55a2d486d5@redhat.com>
Date: Tue, 7 May 2019 17:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190506173353.32206-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 07 May 2019 15:09:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 19/24] hw/misc/bcm2835_rng:
 Use qemu_guest_getrandom_nofail
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KvZAY7NcfuEf

On 06/05/2019 19:33, Richard Henderson wrote:
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.  Use the *_nofail routine
> instead of rolling our own error handling locally.
>=20
> Cc: qemu-arm@nongnu.org
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/misc/bcm2835_rng.c | 32 ++++++++++++++------------------
>   1 file changed, 14 insertions(+), 18 deletions(-)

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


