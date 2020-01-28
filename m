Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp916315lfp;
        Tue, 28 Jan 2020 12:23:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxR4GIk7FYSd9Fbov2utLYPV1TEQuziOR/yGz94/yhjvn/3Ymqa9BvsgblpNvJSsTn8qt11
X-Received: by 2002:ac8:9b:: with SMTP id c27mr17700342qtg.348.1580243030895;
        Tue, 28 Jan 2020 12:23:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580243030; cv=none;
        d=google.com; s=arc-20160816;
        b=rFFgeWecve6G2Y+aOkreqE36fADdMyf4MZdQcljWL2uszMtXnX7HrEWKXKA6CUZcIE
         rdGauIx1fFQI1Nj+5yEZktA78cXIRh5FmFn9SC6K4lApjEKLMBZnu95TQ5vi1Q/wpYpl
         p+1m8qd2nKeYOVH3bj4sQZVVThUXfsRfeLUWE2TiPaUcTzn7mx6iisIcyCWwMj28lqS6
         spePWDZmfJAjrhlBAXcsY3Pyt30Nvf4hoYgFZXLM+IPuG9N6K3IsD1Rj5H3uEbLhXbD9
         zJSRmtKhH2bEPInZYM+6Rsv6pkiRNPWfau7yEn6bQLOhCpznhv65oeRZFC2sXo/uW3gr
         +d6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qgVxJ0FiX0XFhW50/G5ckJdu9IU+U+OKfSKSSF8FeBM=;
        b=v5h+xA4ETi5k1xtkTvTYdgTCG6VZu5M40yMV+IsLI2hcXQg+2tjtZV9B83xP6Mzgnt
         zyc8nJ6VHtfSNbY+5dRmxFRs737brLBsb2AZ5Fx1FEFvyouVNaBCF7lVnzbQCW9SsMve
         x7+g/d651/3wuc9GDi71XQqJuIChbfrQ2I0eLDXdKEsiFyDJTOqJekmayGkakJ0XNn1a
         HGKfBeEzgVjqNO5lfNVcNUfebDoTfbtLr5CyHwX/n3oZgZumNfPUqe25/laU3PTqnBqZ
         g1yIX7oHz04+tIYl9tYWFTSmq5Fn2SHRj8dTVoQp1R1WC5Ay1hhkIpQne/lQloF7/14m
         EHQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YE0Cr+9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si13305909qkj.177.2020.01.28.12.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 12:23:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YE0Cr+9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwXOo-00041O-Ah
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 15:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iwXOg-00041B-F5
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 15:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iwXOe-0002fg-RD
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 15:23:42 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59366
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iwXOe-0002d3-N9
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 15:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580243020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgVxJ0FiX0XFhW50/G5ckJdu9IU+U+OKfSKSSF8FeBM=;
 b=YE0Cr+9iMFO5nKWhauMV4ty5+qby211/IpIgXWMY2jG/Ru3EfSQUWQapuZYQZz17MkGIFK
 NrTP3vjRd+8dl+KvSXzdvo7xlsviiyy9sxX6sKkMvV/P0mf7F7RBm/cKn9PDfH4G+y/N8X
 E4FnwhMMZ0t20He4eLBMcaGKTRf95SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-Lv8HEl7HNcWztAszEFqaUQ-1; Tue, 28 Jan 2020 15:23:34 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6228800D41;
 Tue, 28 Jan 2020 20:23:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-65.gru2.redhat.com
 [10.97.116.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CFB45C219;
 Tue, 28 Jan 2020 20:23:20 +0000 (UTC)
Subject: Re: [PATCH v4 7/7] tests/boot_linux_console: Tag Emcraft Smartfusion2
 as running 'u-boot'
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-8-f4bug@amsat.org>
 <addb50ef-b6cd-fec1-2266-f062cae65090@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <0debd0ec-16e4-2d96-c634-26bdb6db6215@redhat.com>
Date: Tue, 28 Jan 2020 18:23:18 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <addb50ef-b6cd-fec1-2266-f062cae65090@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Lv8HEl7HNcWztAszEFqaUQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bQpAWIXf7dhh


On 1/27/20 2:05 PM, Thomas Huth wrote:
> On 21/01/2020 00.51, Philippe Mathieu-Daud=C3=A9 wrote:
>> Avocado tags are handy to automatically select tests matching
>> the tags. Since this test also runs U-Boot, tag it.
>>
>> We can run all the tests using U-Boot as once with:
>>
>>    $ avocado --show=3Dapp run -t u-boot tests/acceptance/
>>    JOB LOG    : avocado/job-results/job-2020-01-21T00.16-ee9344e/job.log
>>     (1/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_a=
rm_emcraft_sf2: PASS (16.59 s)
>>     (2/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_a=
rm_raspi2_uboot: PASS (0.47 s)
>>     (3/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_a=
arch64_raspi3_uboot: PASS (2.43 s)
>>    RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT =
0 | CANCEL 0
>>    JOB TIME   : 19.78 s
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   tests/acceptance/boot_linux_console.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/b=
oot_linux_console.py
>> index 22b360118d..4a4cf9d0ea 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>> @@ -305,6 +305,7 @@ class BootLinuxConsole(Test):
>>           :avocado: tags=3Darch:arm
>>           :avocado: tags=3Dmachine:emcraft-sf2
>>           :avocado: tags=3Dendian:little
>> +        :avocado: tags=3Du-boot
>>           """
>>           uboot_url =3D ('https://raw.githubusercontent.com/'
>>                        'Subbaraya-Sundeep/qemu-test-binaries/'
>>
> We should maybe move that test to another file, too, since it is not
> using Linux. Or should we maybe rename boot_linux_console.py to simply
> boot_console.py ?

Thinking aloud: maybe create a directory 'boot' (or 'boot_tests') and=20
group tests in files according to the 'arch' tag.

Example:

[wainersm@localhost boot]$ tree
.
=E2=94=94=E2=94=80=E2=94=80 arm.py

0 directories, 1 file
[wainersm@localhost boot]$ cat arm.py
from avocado_qemu import Test

class BootArmTest(Test):
 =C2=A0=C2=A0=C2=A0 """
 =C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:arm
 =C2=A0=C2=A0=C2=A0 """
 =C2=A0=C2=A0=C2=A0 def test_linux_virt()
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:virt
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dlinux-boot
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Test here
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass

 =C2=A0=C2=A0=C2=A0 def test_uboot_emcraft_sf2()
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:emcraf=
t-sf2
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dendian:little
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Du-boot
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Test here
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass
--------------


Back to this patch...

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
>   Thomas
>
>

