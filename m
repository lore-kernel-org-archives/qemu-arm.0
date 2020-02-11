Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4913691lfp;
        Tue, 11 Feb 2020 02:09:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyT9+A8SvJ7gip3U+bagGd9e7aXxP3x/c/5cKmxVnAGTq7wsGDak/IE+Dlu4BUke/SoxGAV
X-Received: by 2002:a0c:f9c7:: with SMTP id j7mr2168697qvo.222.1581415743852;
        Tue, 11 Feb 2020 02:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581415743; cv=none;
        d=google.com; s=arc-20160816;
        b=LIG40A9+hRFkkL3OGgMnWl6s+9nOwe2FCNfwyPfMzyVJar+MR8cjOix9TFu+aWRDw2
         2gotIDq2Hvp74SguYg2JZdMBjC9fbxjM5s1x3qFpEM2bpgvli4x5Yd0GsnjzdqAfeLD2
         oNEayQdDKPQat9QUG2eb6B/QYf5ZfpDk8aNeA4EPjHD77kMVR6NajwRCsRCDt+QFnktP
         N6lbs8O9iiuo9ZCsRuREXEgmNH5dQjeQkvObPkbdCrL8Aw69j/GuM2HvERRNHVZ2zXE2
         5ZW3h8GpiPMZk/U9hw8bRim0H9DU69FtCgZRiHb8YDuBSfQT8QOWtk9GB3ACnFNrrg2Y
         pzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xK0zrMEkoSCleotxh27l/Mhp7k/XGqfNZX5CTg6/XPQ=;
        b=QuTd1OqVmJrpJqj6PeD9aDcChLLy/C0biA3uMX/rFdI3N4rfyAA93zlsfps+nuwXLI
         EOFMdrn4v00OwBhXW76RgPDN9OaKngySAngy4qaHRaFVceNpJCLDW63ZHDpDOf05TCEY
         VFEaG9BZqhQmFiqIDCFn6WP/LX/Jmdl5tHVRxODCZqiWxhw1Mz2CK4neOJtpv51UT5ou
         uGddXABflgLYWk2Bs5U+4bNGBfC5yVld0PEys8LeIo+M056JDXvZDokeYT5U3X4l98UW
         solWS/z++L0tbvcBMLRa1W0UrQ8ZYIHdkhJErHi9/5H+tYou97cZd8y6CrDvB+st4v+A
         LG5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MVMgUFxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si1760922qkb.191.2020.02.11.02.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 02:09:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MVMgUFxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1STX-0004YL-9e
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 05:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1STP-0004Xt-Oi
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:08:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1STO-0003Bl-1J
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:08:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31265
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1STN-0003BW-Uh
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581415733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xK0zrMEkoSCleotxh27l/Mhp7k/XGqfNZX5CTg6/XPQ=;
 b=MVMgUFxvsjPM91VgWYJUbeArIyFRpaCSqeeB62Wap0HcBKsb7eRNdES+S6mBW5cCl4QiqJ
 eSm1XIDBXdS08Lz+ooY8kbeyjh1rXNNplXNppQKgvbLh8vaT8DhiaQOzxNbsZ9UU2lp4bq
 suxomkKgh6EH64DZMhk9x94P14IEcH0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-aG5oKLZfNkSZ7Yq0dQ-lPQ-1; Tue, 11 Feb 2020 05:08:47 -0500
Received: by mail-wm1-f69.google.com with SMTP id p2so1112949wmi.8
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 02:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s213ryhI7rtPbGqQei6G9oTTZJ6HNcM1cOEDhlbYEVI=;
 b=GaXNTYCOXJNj79zSUTaHCkKZ0s1NLou4l0WSuxhSw2nc4OQohiYAWrT+8F6PnfjyMs
 uvKYh8nESsBX03IlVxTrCfjc2lM372ONH4I2fj1cEis+wByzvLjDsJj0969Hbgh9UA49
 jcUatFyQx1Ps8Q+5QhaTvKhDBqjkA5HdUdlryG82dw/WlWVDUuoskeUCUlLOtQrQ8OUz
 bb502pXdlKzUVTw+v/HUofv9Vm8c9OgzahaVtIXBnod6Za4RUwBLlb9bZ6hG7QN8eUpV
 tAIu5QoJfgm/o8Mc1PfGapldnU3cV80FXJ9o7ryuaRMF9grW0rO7YoZ248TSF+Bi/9jD
 o7dA==
X-Gm-Message-State: APjAAAXgv+KAozFHzTnI3ptV7xsa/m7Nk1tR2DbOpaay+O5CUAko8osZ
 xFMRTsibW9ZKWR2TMAxCvf12qq8DXyVQlmzdy6Pnp8AXf4IUc+v/sOyusDdny3WXrcGiiqzH0hB
 b3kOE+Qt6RzBe
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr8038174wrp.2.1581415726338;
 Tue, 11 Feb 2020 02:08:46 -0800 (PST)
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr8038152wrp.2.1581415726103;
 Tue, 11 Feb 2020 02:08:46 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm4748939wrv.78.2020.02.11.02.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 02:08:45 -0800 (PST)
Subject: Re: [PATCH 1/2] tests/acceptance: Extract boot_integratorcp() from
 test_integratorcp()
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200131211102.29612-1-f4bug@amsat.org>
 <20200131211102.29612-2-f4bug@amsat.org>
 <c13e2bf5-2373-f33e-1aea-824c46b9f3cf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c058ed6e-1296-ef9e-4844-97bf12bef1bd@redhat.com>
Date: Tue, 11 Feb 2020 11:08:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c13e2bf5-2373-f33e-1aea-824c46b9f3cf@redhat.com>
Content-Language: en-US
X-MC-Unique: aG5oKLZfNkSZ7Yq0dQ-lPQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wva239lc1KxI

On 2/1/20 8:06 AM, Thomas Huth wrote:
> On 31/01/2020 22.11, Philippe Mathieu-Daud=C3=A9 wrote:
>> As we want to re-use this code, extract it as a new function.
>> Since we are using the PL011 serial console, add a Avocado tag
>> to ease filtering of tests.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   tests/acceptance/machine_arm_integratorcp.py | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/accept=
ance/machine_arm_integratorcp.py
>> index 4f9ab40f2f..748819916d 100644
>> --- a/tests/acceptance/machine_arm_integratorcp.py
>> +++ b/tests/acceptance/machine_arm_integratorcp.py
>> @@ -19,12 +19,7 @@ class IntegratorMachine(Test):
>>  =20
>>       timeout =3D 90
>>  =20
>> -    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted c=
ode')
>> -    def test_integratorcp(self):
>> -        """
>> -        :avocado: tags=3Darch:arm
>> -        :avocado: tags=3Dmachine:integratorcp
>> -        """
>> +    def boot_integratorcp(self):
>>           kernel_url =3D ('https://github.com/zayac/qemu-arm/raw/master/=
'
>>                         'arm-test/kernel/zImage.integrator')
>>           kernel_hash =3D '0d7adba893c503267c946a3cbdc63b4b54f25468'
>> @@ -40,4 +35,13 @@ class IntegratorMachine(Test):
>>                            '-initrd', initrd_path,
>>                            '-append', 'printk.time=3D0 console=3DttyAMA0=
')
>=20
> I wonder whether you might want to move the "console=3DttyAMA0" to the
> test_integratorcp(), too, to get the text in the framebuffer in the
> second test instead?

This is not a test, but a common method used by both tests, so both use it.

>=20
>>           self.vm.launch()
>> +
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted c=
ode')
>> +    def test_integratorcp(self):
>> +        """
>> +        :avocado: tags=3Darch:arm
>> +        :avocado: tags=3Dmachine:integratorcp
>> +        :avocado: tags=3Ddevice:pl011
>> +        """
>> +        self.boot_integratorcp()
>>           wait_for_console_pattern(self, 'Log in as root')
>>
>=20
> Anyway, patch looks fine,
>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!

Peter, Thomas previous patch and these series are reviewed. Can you=20
queue them in your target-arm.next tree?

