Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3712029wrh;
        Tue, 7 May 2019 07:43:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZhRFUkCA3KMsawbjFuBxibexc6aWT0oxNKIi0RWi/L1U0Gc0efMwgPWS+4We29hIeTxqT
X-Received: by 2002:a7b:c053:: with SMTP id u19mr20619197wmc.63.1557240199632;
        Tue, 07 May 2019 07:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557240199; cv=none;
        d=google.com; s=arc-20160816;
        b=aiEaP6BuDFd/8SYUhER7sNY3WcBKCsSD3n90Gqhxw5LdGWrvDz5ku2d4U0oPYLM9i1
         hAJzCJ0OvJqGJwAife7Pvy3UrjJrwRBQGym4JYZvD4bPwgxpnBt8Xqix+xddHjzwzy1G
         Q+r+XtUf8J4Ki1acFNPjNG4WYN4fW64EGiEDr9Ou/fDxUbthsyE+eQi+7vzZiAVrSIpb
         QrEal7+UApMXuJl4zJ5b2QI+mXFDZT1AAnZv9CnS3xOi9WR6oNkzJGoEir0OVCJ8ZtCz
         XMVIZj7Z5u2cjZFmTdmQUUvLjN6aOw5b/wecGHDaEfyJ8TShDMY0aqyLOkPfVD2ftenW
         zfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=pH3OgWCN8LqNrlSTqpqtgfvrgPQEikAQkfrYCLRyv18=;
        b=pbKaHVr3l10eMIqswCEpSc7WyhUR3bOgCZhyHyBI4l3oTTxCebl9ig5sZxI+PVkILk
         AgChfJtJ3NFnvRiSilZjsYINL4K4Eas6ihwsDfNkqfnsJWancJ98i7sTQXSI0Jzm9uY3
         AYEWAtMFwYAd2O6FKZNZqGsBY3Fnb2/3wJVWgsc6sprF4umJwNtJNQ2zsSUNWDgD/FwP
         4OvwZulr+GetDpItD2ohfbce288JdZeBmf451OpuiSNDJRNDMhy+ykyZ6edi+Ahcc7zc
         V68EzSMK7E20DuCwNUFhZR+7lJnUZ9JiJm/QNXOHR8i29DKo0Y5LlOLner8QRfbyeGXc
         w/lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si6288784wrs.417.2019.05.07.07.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 07:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO1JO-0006Vv-Mc
	for alex.bennee@linaro.org; Tue, 07 May 2019 10:43:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hO1JB-0006Ul-1F
	for qemu-arm@nongnu.org; Tue, 07 May 2019 10:43:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hO1J9-0006y4-SQ
	for qemu-arm@nongnu.org; Tue, 07 May 2019 10:43:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hO1J9-0006wu-Ms; Tue, 07 May 2019 10:43:03 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A3ABF74CD;
	Tue,  7 May 2019 14:43:03 +0000 (UTC)
Received: from [10.40.204.24] (ovpn-204-24.brq.redhat.com [10.40.204.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3394171C5;
	Tue,  7 May 2019 14:43:01 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190506173353.32206-1-richard.henderson@linaro.org>
	<20190506173353.32206-18-richard.henderson@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <ddecf71a-d446-66f0-ba21-2e239ba23314@redhat.com>
Date: Tue, 7 May 2019 16:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190506173353.32206-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 07 May 2019 14:43:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 17/24] aspeed/scu: Use
 qemu_guest_getrandom_nofail
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8K7eSETR/5x9

On 06/05/2019 19:33, Richard Henderson wrote:
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.  Use the *_nofail routine
> instead of rolling our own error handling locally.
>=20
> Cc: qemu-arm@nongnu.org
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/misc/aspeed_scu.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


