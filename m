Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1556682lfp;
        Fri, 31 Jan 2020 23:06:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMwd5kilFLTvubVXX86BUxTD9SmSxTBC5MlArhpuW50fOyz2wpUvEdFS1lajNoWSn9dYFS
X-Received: by 2002:ac8:32c6:: with SMTP id a6mr14328579qtb.11.1580540812504;
        Fri, 31 Jan 2020 23:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580540812; cv=none;
        d=google.com; s=arc-20160816;
        b=dPpqFJXh7vT9xTP1TgckLEdXzmcU3SAkZq7wfFBYT34Vv0elnVVI2r79cDFFMEpdWY
         Z2wyW7T737etVEB/DAjqaWqJjHoKjsH0SFtPaCtvHpM72vaPK7c5VL4uTSM1+tLrVHPK
         8vR90JEo5Dol7UKu24gxphb4PnB48LmYCfyrIuTZrh/cBw6c93VSGzTJbhcFgSrLZ424
         YSIlDsm7Ez5GZN0lv343WmFKVtzsrPacTngtQFiAfmyP01CWhJ9jXlkzTryo0ySKI7Sv
         fq5dxrv5dvx9vpWjk5a9xD/G7T87UxAeJVuj2WnntM4AyjXrL5F4oc2HHVW91t6r7sOO
         tHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=UmDwR1M7st9PUiUhos3zTLy2AE+KwzAALevD8KFIGVM=;
        b=sgWJSyh7kQe8sM9zdV8tpGveU15x9f9+Xp2VqC5TU0T09Dunst398saITSnQL2HnQZ
         V2UUfOIQBmgM4if4oPsbsV+L195DOmwuSvYD+G4blxDlE1vf+1n3Ootftfv4HGsR83rn
         zVzMVoF3UNCKc7DnCADGvK7CnNqqqNh0jRejT4/MikVqRN2fL4lhYSFooWp6Vm7wt+tq
         B9OOCF0vfpKrq8tb0ZloACijVBcPAb7GppzUJ1WHJb8YDxPgD/gLXsWDbOErgQhXBCeZ
         QwMwNsufkXQiOaJjvLOmgkrt5npNiHvyMda/R+QjOt8BD3frxMUREbeoTnaI5rC30Nrj
         2L1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XsGhsD55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e43si7822459qtk.168.2020.01.31.23.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 23:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XsGhsD55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixmri-0001iS-Ul
	for alex.bennee@linaro.org; Sat, 01 Feb 2020 02:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ixmrX-0001em-DT
 for qemu-arm@nongnu.org; Sat, 01 Feb 2020 02:06:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ixmrV-000663-Ds
 for qemu-arm@nongnu.org; Sat, 01 Feb 2020 02:06:38 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40132
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ixmrV-0005uO-6U
 for qemu-arm@nongnu.org; Sat, 01 Feb 2020 02:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580540795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=UmDwR1M7st9PUiUhos3zTLy2AE+KwzAALevD8KFIGVM=;
 b=XsGhsD55+ohcPtB7pqt5mdb1a3GRYbhncwVKzCHohhh2EtchQ+0UbUN1PjTOQrpljfyHKZ
 mTtsOHUCEf5RduzmmP851VfFpNVFAzd8WnT+s9WLiYBhNzPAl17LF4SD71ker6Ze3wZ41I
 j4LYNAqeQg3C+JufV3QQQp3XFvkLpb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-nvb3iEQMO-Kvt8WfbMybrw-1; Sat, 01 Feb 2020 02:06:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7132F8017DF;
 Sat,  1 Feb 2020 07:06:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D0A89E7E;
 Sat,  1 Feb 2020 07:06:17 +0000 (UTC)
Subject: Re: [PATCH 1/2] tests/acceptance: Extract boot_integratorcp() from
 test_integratorcp()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200131211102.29612-1-f4bug@amsat.org>
 <20200131211102.29612-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c13e2bf5-2373-f33e-1aea-824c46b9f3cf@redhat.com>
Date: Sat, 1 Feb 2020 08:06:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200131211102.29612-2-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nvb3iEQMO-Kvt8WfbMybrw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +amZmbtYECxv

On 31/01/2020 22.11, Philippe Mathieu-Daud=C3=A9 wrote:
> As we want to re-use this code, extract it as a new function.
> Since we are using the PL011 serial console, add a Avocado tag
> to ease filtering of tests.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/machine_arm_integratorcp.py | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/accepta=
nce/machine_arm_integratorcp.py
> index 4f9ab40f2f..748819916d 100644
> --- a/tests/acceptance/machine_arm_integratorcp.py
> +++ b/tests/acceptance/machine_arm_integratorcp.py
> @@ -19,12 +19,7 @@ class IntegratorMachine(Test):
> =20
>      timeout =3D 90
> =20
> -    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> -    def test_integratorcp(self):
> -        """
> -        :avocado: tags=3Darch:arm
> -        :avocado: tags=3Dmachine:integratorcp
> -        """
> +    def boot_integratorcp(self):
>          kernel_url =3D ('https://github.com/zayac/qemu-arm/raw/master/'
>                        'arm-test/kernel/zImage.integrator')
>          kernel_hash =3D '0d7adba893c503267c946a3cbdc63b4b54f25468'
> @@ -40,4 +35,13 @@ class IntegratorMachine(Test):
>                           '-initrd', initrd_path,
>                           '-append', 'printk.time=3D0 console=3DttyAMA0')

I wonder whether you might want to move the "console=3DttyAMA0" to the
test_integratorcp(), too, to get the text in the framebuffer in the
second test instead?

>          self.vm.launch()
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
>          wait_for_console_pattern(self, 'Log in as root')
>=20

Anyway, patch looks fine,

Reviewed-by: Thomas Huth <thuth@redhat.com>

