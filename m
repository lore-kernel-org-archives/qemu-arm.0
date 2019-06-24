Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3886251wrg;
        Mon, 24 Jun 2019 08:14:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlXJJMNsFbfPqjT8SDJ/KtrBZXpRWolHcliGsOmbLnozpy2WYUQqhV/o9xTGifz4wXaUcV
X-Received: by 2002:a17:906:4950:: with SMTP id f16mr45664293ejt.259.1561389299732;
        Mon, 24 Jun 2019 08:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561389299; cv=none;
        d=google.com; s=arc-20160816;
        b=bHNxT27wa1o+Jn5Np/hz0VL+ZVLl8pPKpTn6CWU3alWvICVBy1UOVt3F69ixtvdDtL
         HcE2KckB8psZ7swe3uauLTwlOSMkwQ6LzUImUiBsiNScq0NtUlrlVpxvU0RXzRnn2Li+
         jcTrTNQlqD8irH+tmjLZPc3NE0/Z6youviNJ8joi17rJiwxPhSOlL/EDIAN9DtsqHn0t
         O/np5vmHCaoXiWlIOcxTaFJnXEnrU0vJOSlRaIrAB059PzZJdjDtNzxCgSQQCeQmFXdo
         F/rXzslw5iI6ksvcKvd7I9FJ8bZtKchR+MWwFElLX1xizyEI4uC8OwlvPHS5orY8ws6j
         ojEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=Hc7t6tghAZaqKrwDH0CbOjwpc5lpNsfrLDfnXmbZ9BE=;
        b=uYEvjVAeul8KYBm3Si6kTK71zkmkvfQrtNN8sZdcYikeTNi6K1dPsSMcswNMlc4Pfo
         0uI5C6F2hbcrhGmEjErEkkaQVp9n5S4GpqX+N+ODIv/x1X2gPBR6z5tMMzq8WBTs1gYc
         DTX1GjOd1LR3TdTgUDL83QCyIig9h30GvItcbERlbnM+Wse5KNGo6wDYnnM/9eLofu8N
         lRACfA/ZZwIKKXw7wAdWYABn6hRRakfoNCtPtDDqqAuDOXyqiPAyCxtprdqEoxMhUYPD
         dPX1pFerSkbo+q4wGdGJaxaX+prm/v48PkZA8pPNsteepSBjWl25CcuTSCPmNfuB/1ek
         EA1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20si9463883edd.286.2019.06.24.08.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 08:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfQgM-0001n9-Ri
	for alex.bennee@linaro.org; Mon, 24 Jun 2019 11:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40117)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lersek@redhat.com>) id 1hfQg5-0001mj-Tf
 for qemu-arm@nongnu.org; Mon, 24 Jun 2019 11:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1hfQfz-0006hp-3U
 for qemu-arm@nongnu.org; Mon, 24 Jun 2019 11:14:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50880)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>)
 id 1hfQfv-0006GM-9a; Mon, 24 Jun 2019 11:14:33 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3FC8730872EE;
 Mon, 24 Jun 2019 15:14:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-226.ams2.redhat.com
 [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04EAE19C6A;
 Mon, 24 Jun 2019 15:14:23 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190620122132.10075-1-philmd@redhat.com>
 <20190620122132.10075-2-philmd@redhat.com>
 <6a0086e7-79ea-fc5e-6359-c1d4d256bf6e@redhat.com>
Message-ID: <ebe04ce2-0e0a-c764-e235-3aabd420439e@redhat.com>
Date: Mon, 24 Jun 2019 17:14:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6a0086e7-79ea-fc5e-6359-c1d4d256bf6e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 24 Jun 2019 15:14:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/3] hw/firmware: Add
 Edk2Crypto and edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MA8IruUEa58K

On 06/24/19 16:53, Laszlo Ersek wrote:
> (+Daniel)
>=20
> On 06/20/19 14:21, Philippe Mathieu-Daud=C3=A9 wrote:

>>   $ qemu-system-x86_64 \
>>       --object edk2_crypto,id=3Dhttps,\
>>               ciphers=3D/etc/crypto-policies/back-ends/openssl.config,=
\
>>               cacerts=3D/etc/pki/ca-trust/extracted/edk2/cacerts.bin

(12) Regarding the command line. It just occurs to me that Daniel
suggested [*] that libvirt should not be taught about this feature
specifically.

Thus, I think we need properties that are "smarter" than plain
user-specified strings:

- they should have default values (the ones your example includes above)

- for each of the properties: if the default pathname fails to identify
a file, then treat it as a normal situation (leave the corresponding
fields NULL)

- if the user overrides the default, and the pathname resolution fails,
then that should generate an error

- the user should be permitted to override the default such that the
corresponding setting is disabled (i.e. no error, but also no loading)


It's too bad that I'm not sure about the right way to implement this. It
reminds me of On/Off/Auto, but only vaguely.

In fact, if we never want to teach libvirt about this feature, then we
essentially expect QEMU to auto-load these files, whenever they exist --
even if the guest ends up booting something other than edk2 firmware!

[*] https://bugzilla.redhat.com/show_bug.cgi?id=3D1536624#c11 --
unfortunately, this is a private RHBZ :(

Thanks
Laszlo
