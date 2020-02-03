Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3984127lfp;
        Mon, 3 Feb 2020 06:01:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwaZMqfZvdKrrUUn2jdkQaOhi4BXzNK0DsSAuHM1UYMM1xAK7hYRm5EHWFDOoKKu/m3xX/b
X-Received: by 2002:a37:7bc7:: with SMTP id w190mr23679406qkc.193.1580738478488;
        Mon, 03 Feb 2020 06:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580738478; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/XxcWIOXuXBFb8bA4YKcWpkPQnc0jOFbrHimbX0IixjYZIIkg0jOYefpwwyK+uCr+
         i2bVwol7mFYCvEVpn26qETqBJh3JoX4IZCrQhQHJeQt/GIOf9sD2/1o0CpQ0lpIqwy77
         aTcv1/gf3JpqJGdvspGm9W5S5Kzg5k3mojuPAM/3GI4vGwFhEyVfB+eZNlhFCL4+bvUu
         fds0pmJnxvD93ax+Xm9ruHJgOL9kU76lA/B5QO9JeTq/STGIqYmBuBVSnSO2c/ErxxUW
         XwkgmLKdEqRKzb9G4Ye3SHTEIgn0n5tdiTfWJlZ7C7vPv1nkFWc91mcuquhKrD09Apeh
         LoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=T2K7P3shSIytlWN24FuWBQryMjmxMWHPxy/O94Jb/Qk=;
        b=P10tRzGSAOJTsIdulvXw8ZdVKf2HLl9XIahRSqV+GT4JKiCe1Bnk7leOJUyPhckyxS
         xGU1DfaN6+40NUekJEYcBzY/o57Jr4sant3/P+ZQruI/XoEryUN9b40KnaiKoU46RLMj
         tQl7/ZYme/wHfvINy7DJ7lHr6LUf/KyvxkxR0v6ZL2PGAa97LAgTswSST8dzwf5kug4b
         5pLi/klAQ9Iu+abBGsFMlaUQDBmTBi9lrJnVRUrHhEDuMMPspALFU0jzif7XcigHtgRD
         DU9c6WpKB8NlgisDZU7BZRI3Rhw3Sj9vGZIWRTALTlUnT+3NrrcfzYn+L9p8VHR/5xKJ
         KMgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OaKpAK4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si13066637qtl.44.2020.02.03.06.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 06:01:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OaKpAK4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iycHt-00012S-UP
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 09:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57587)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iycHj-00010f-L5
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 09:01:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iycHi-0004dJ-Aq
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 09:01:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33717
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iycHi-0004a8-7K
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 09:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580738464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2K7P3shSIytlWN24FuWBQryMjmxMWHPxy/O94Jb/Qk=;
 b=OaKpAK4FbZwHmOw1kcmQVNWFSY5iUHV5YTVoslB/uAZ8MTYqZ6ziXzx+ucz3P7wDpDPCLi
 c2LkUD/zZ5xaVd6m9rv1bI4i/w0sNHcZPZV0ibucYFJhO0OcfZDc+Rj0N7s7HBoXHXkBpI
 NqKOP6nA9Ry3VoGjqkjebYd19zSj6SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-gXpCWI0rND6kduz-dujNbg-1; Mon, 03 Feb 2020 09:00:46 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47A4A90FF18;
 Mon,  3 Feb 2020 14:00:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-90.gru2.redhat.com
 [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C02E909FB;
 Mon,  3 Feb 2020 14:00:38 +0000 (UTC)
Subject: Re: [PATCH 1/2] tests/acceptance: Extract boot_integratorcp() from
 test_integratorcp()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200131211102.29612-1-f4bug@amsat.org>
 <20200131211102.29612-2-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <aa879b11-9c20-a867-e11a-02e4430fdd79@redhat.com>
Date: Mon, 3 Feb 2020 12:00:37 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200131211102.29612-2-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: gXpCWI0rND6kduz-dujNbg-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WdCEWnVDLMb4


On 1/31/20 7:11 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> As we want to re-use this code, extract it as a new function.
> Since we are using the PL011 serial console, add a Avocado tag
> to ease filtering of tests.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   tests/acceptance/machine_arm_integratorcp.py | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/accepta=
nce/machine_arm_integratorcp.py
> index 4f9ab40f2f..748819916d 100644
> --- a/tests/acceptance/machine_arm_integratorcp.py
> +++ b/tests/acceptance/machine_arm_integratorcp.py
> @@ -19,12 +19,7 @@ class IntegratorMachine(Test):
>  =20
>       timeout =3D 90
>  =20
> -    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> -    def test_integratorcp(self):
> -        """
> -        :avocado: tags=3Darch:arm
> -        :avocado: tags=3Dmachine:integratorcp
> -        """
> +    def boot_integratorcp(self):
>           kernel_url =3D ('https://github.com/zayac/qemu-arm/raw/master/'
>                         'arm-test/kernel/zImage.integrator')
>           kernel_hash =3D '0d7adba893c503267c946a3cbdc63b4b54f25468'
> @@ -40,4 +35,13 @@ class IntegratorMachine(Test):
>                            '-initrd', initrd_path,
>                            '-append', 'printk.time=3D0 console=3DttyAMA0'=
)
>           self.vm.launch()
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> +    def test_integratorcp(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:integratorcp
> +        :avocado: tags=3Ddevice:pl011
> +        """
> +        self.boot_integratorcp()
>           wait_for_console_pattern(self, 'Log in as root')

