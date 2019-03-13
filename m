Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1491262wrs;
        Wed, 13 Mar 2019 03:44:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzifWBUo62QzvG7k8W5leVwpXFV26j7gUBtFcVNBFjqyuNXrPdGoCmLDhei9mGg4SeNRAiH
X-Received: by 2002:a81:7b56:: with SMTP id w83mr6938051ywc.455.1552473894469;
        Wed, 13 Mar 2019 03:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552473894; cv=none;
        d=google.com; s=arc-20160816;
        b=mDJHItWYeTakqB20zHIETV/dNgrwmJsYWlGj3FXTtRKuI8PsBCMv7jcLka3JdWEzjx
         WJbn8EsUgk7Kh23b2AYEdyHGy+bm2ObzEk5XIJnLyRzbQ6G1kdL9FOP5YgjSMSLAo13U
         YcWtf3tpPXU5K/EcI0RVsE3JdKgLqH9jPofcHRPkHgIBQ92qWbUAylFc5GXN/Xn/FEB+
         Un3EzAoOgyrayZUnX+w0pIZg0DxkD5CYSVY67Xmn6QlsYnbI84VBHM5COnydTomi1St0
         ggPG5i8pLbME+C9tGknsKCBuREsrWJ01F0qXJXlIiCx9Afx7BYZWHAdIFTqF5ne2FhfA
         852g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=qppujVPGmXmp+P+rDvDIyDDSe5qxVJoIsb46MWF5T5M=;
        b=g1zkXUb9XGI0ndYsHecQ5zG65iGgTvILj+QEtevC0iNgjPc6c9dKiwyLgImuzU/XJM
         y/aBHgfZ7ocl7Q7bh0MdxUEsK/8W8xAaSH9lMY8nO3GUogemM1bH7O/f2CY3WkIT6tFb
         t3rR1lav0jZ9vTNir2n+gYXs7DuWjIhoxWiQytGdAIrfRt4jvrGB6KjPs7sQlCYNW93v
         QdOWhLshgI5/LCjAyVzHKOq5IA6M2Mf2SX6BwSuJEhcucQ+2ca9feyyV3EfkZh0cjYJv
         PwSqU6hkEPlxsufYZMdkQ9oe5Quv+QTnYVg0TXx38CG/cLu0rHYAGwKLhvvZjQfMTVGE
         mRzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e73si6528537ywa.274.2019.03.13.03.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 03:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h41NW-0002lV-0g
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 06:44:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h41NL-0002kR-FT
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 06:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h41NJ-0005I1-Qu
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 06:44:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h41NJ-0005FG-AI; Wed, 13 Mar 2019 06:44:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47A2F301E142;
	Wed, 13 Mar 2019 10:44:40 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-225.rdu2.redhat.com
	[10.10.120.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8E195DD84;
	Wed, 13 Mar 2019 10:44:31 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20190312225632.29777-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d0bba5e7-b144-9050-3339-08a55bd4c108@redhat.com>
Date: Wed, 13 Mar 2019 11:44:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190312225632.29777-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 13 Mar 2019 10:44:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 0/4] fw_cfg: Add
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PZQU92Xdo/y7

On 03/12/19 23:56, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> This series consists of:
> - add fw_cfg_add_file_from_host()
> - add edk2_add_host_crypto_policy() and the Edk2Crypto object
>=20
> The Edk2Crypto object is used to hold configuration values specific
> to EDK2.
>=20
> The edk2_add_host_crypto_policy() function loads crypto policies
> from the host, and register them as fw_cfg named file items.
>=20
> So far only the 'https' policy is supported.
>=20
> A usercase example is the 'HTTPS Boof' feature of OVMF [*].
>=20
> Usage example:
>=20
> $ qemu-system-x86_64 \
>     --object edk2_crypto,id=3Dhttps,\
>         ciphers=3D/etc/crypto-policies/back-ends/openssl.config,\
>         cacerts=3D/etc/pki/ca-trust/extracted/edk2/cacerts.bin
>=20
> (On Fedora these files are provided by the ca-certificates and
> crypto-policies packages).
>=20
> [*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
>=20
> Since v3:
> - Addressed Markus' comments (do not care about heap)
> Since v2:
> - Split of
> Since v1:
> - Addressed Michael and Laszlo comments.
>=20
> Please review,

sorry about seeing this just now. My email load has been extreme, and
the only way I can deal with it is a *strict* FIFO approach. It gives me
unparalleled throughput [*] and acceptable latency, but it does cause me
to respond to out-of-date emails on occasion.

[*] "unparalleled" not by other people, but by other workflows I could
choose

Nevertheless I think my comments under v3 apply just the same here.

Thanks
Laszlo
