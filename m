Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp543964lfm;
        Wed, 15 Apr 2020 06:07:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKr68HikpKn2wcbjUSsM2WVJ1qsHrV+iLB8xokDl3N0Thj01HOD+ZiDqnwPtJa4/xV6tx1+
X-Received: by 2002:a37:a4c5:: with SMTP id n188mr11795779qke.337.1586956040926;
        Wed, 15 Apr 2020 06:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586956040; cv=none;
        d=google.com; s=arc-20160816;
        b=drfletyGYrz+utbpYrn6iMmJwPrSGaad4+qwD6JsZetIHyTtHgBCRxKfxHFeahPTGK
         NB439tvCGBowui2LL5IEytUkGyRgyqfVQeOa5DjVf8BVfu1bEr7rZaTIMEOIuIfJnxBe
         vHyYjr4Fus/ojG9Ei8HdSqu/i5W4i/fSNP90Ye+gJns6GjRYF9bk3kwmI8rsEF6XiY2f
         1GsGq/B/CvzxFKi8kgBUVbzNB6SuMM/XTWKpjmfmy91wTUTT+0DxFGINyCiNugiZxxo1
         4pIDZdoag2zlNRiaLkOUgUX2QdCJL0d2jIduxMpd1qVgI8Ljb31PY52x75f1US6hotXQ
         UFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=R2/IeDdFmJc6/F3cXH9TXRsEb8NAHB/R2l6umN4Htf4=;
        b=PZ5AlsWmg+CJbuEo1OZcGonr5JQMo+ZxRqGFuwXHigqSm6oTVpHDlJ7fC6ooYWeTU4
         N/ThrkVep8VvTSKHiLFyNRh9QiKl02frkonpdJzx6ip5eId2l3n9FbeZ1EPhz1J8mzlB
         Sm/gOCsGGQQMIk6zQpRqjpJQ4kD009yVWRShMmL/mvOYXtWzrQIzopbD83Ij0C/kDhRr
         Q9rY1ENWvGeyRfE5rJvFPJjyPovDTXwJx88xVGvqeh8Hw+ECTjzjlNhj3buQtvY/9cpf
         t3GnEJbEim+u8vGq5i73gdz3RtvKpbk9UrAZaHmJUoXhthVQQm3jncuL9vXKPn+rNe92
         daTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UEfj+rda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si2112311qtw.208.2020.04.15.06.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 06:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UEfj+rda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOhlA-0004yZ-6W
	for alex.bennee@linaro.org; Wed, 15 Apr 2020 09:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33606)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOhgR-00075Z-3g
 for qemu-arm@nongnu.org; Wed, 15 Apr 2020 09:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOhgP-0004DK-8b
 for qemu-arm@nongnu.org; Wed, 15 Apr 2020 09:02:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47188
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOhgP-0004Bt-3S
 for qemu-arm@nongnu.org; Wed, 15 Apr 2020 09:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586955744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2/IeDdFmJc6/F3cXH9TXRsEb8NAHB/R2l6umN4Htf4=;
 b=UEfj+rdaBg/xyKMcBZV4HFUprNXcnU0E6k8j39uh0UP7vEReFPedzDckx7NiqGrXK09+2L
 veiYIBTtNj8S5b/S29jckmxjjCDzMl9OpIrg4xhbDTVqUacoqKPTjkgcqvbW0Vfyn7m0ME
 KMlXryBV5EHjwKL2cC4DzZiTXSP70Ws=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-5uDV7ppaPIqJGD1-_GjUjg-1; Wed, 15 Apr 2020 09:02:22 -0400
X-MC-Unique: 5uDV7ppaPIqJGD1-_GjUjg-1
Received: by mail-ed1-f69.google.com with SMTP id p6so2823455edy.22
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2020 06:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N/stI+OgzyVWpDCEa+m9tLFhp5Do6KDfXyWxQraDlwY=;
 b=bVEcuRpBJvC5bujTVAqVR7ZaTHcv4g0IXqLMn/DjXrFUUdZFazsZHC4XHkKLYf04Zw
 qoCuOeQ7ui8Ykj8CSqNSpYHUGVYBgE7GGGcmVr+7nNi2/815sNyGPfz6UwZtALGjvtcr
 vvptx2wRAxzrXfDev8UgjcuhX6QNfn+XqcfkBZoy2WMivo8uYXIqhb3jTqyI3AWKhDn+
 hvktmO6NsckhJBHAKxArOAgHsS5V7ep0gPfImLny8/cYJ5ODHhdnEnKDXJKz8lvOol7X
 qt3EaTS5j6jn3eeV1OQrnhtEE7GByg4B/f0Or02i3caPHWm1vhO/LF6avCAGeK70oGmI
 C71Q==
X-Gm-Message-State: AGi0PuZjoGlQAl7F2aenaD0UuKCGy/mxmd4KzShgaYgoPF3bW+F0Fc2t
 qiTFHkWGeK12aw0Df+yH3kwlVP3ceRv2uy1qodcGRtQhYMr99JhwyImFKiGOoOqStzLozQh/B5v
 zZk4jVoDO10i9
X-Received: by 2002:a17:906:af59:: with SMTP id
 ly25mr4858884ejb.65.1586955741431; 
 Wed, 15 Apr 2020 06:02:21 -0700 (PDT)
X-Received: by 2002:a17:906:af59:: with SMTP id
 ly25mr4858844ejb.65.1586955741110; 
 Wed, 15 Apr 2020 06:02:21 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id l16sm2132781edv.71.2020.04.15.06.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 06:02:20 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 04/12] qga: Restrict guest-file-read count to 48
 MB to avoid crashes
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
 <20200414133052.13712-5-philmd@redhat.com>
 <20200415123405.GD1344391@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3cd57dd9-0552-8064-c9d8-43913ed73e2e@redhat.com>
Date: Wed, 15 Apr 2020 15:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200415123405.GD1344391@redhat.com>
Content-Language: en-US
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JK8L3/XRfZNT

On 4/15/20 2:34 PM, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Apr 14, 2020 at 03:30:44PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On [*] Daniel Berrang=C3=A9 commented:
>>
>>    The QEMU guest agent protocol is not sensible way to access huge
>>    files inside the guest. It requires the inefficient process of
>>    reading the entire data into memory than duplicating it again in
>>    base64 format, and then copying it again in the JSON serializer /
>>    monitor code.
>>
>>    For arbitrary general purpose file access, especially for large
>>    files, use a real file transfer program or use a network block
>>    device, not the QEMU guest agent.
>>
>> To avoid bug reports as BZ#1594054 (CVE-2018-12617), follow his
>> suggestion to put a low, hard limit on "count" in the guest agent
>> QAPI schema, and don't allow count to be larger than 48 MB.
>>
>> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg693176.html
>>
>> Fixes: CVE-2018-12617
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1594054
>> Reported-by: Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>
>> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   qga/qapi-schema.json | 6 ++++--
>>   qga/commands.c       | 9 ++++++++-
>>   2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
>> index f6fcb59f34..7758d9daf8 100644
>> --- a/qga/qapi-schema.json
>> +++ b/qga/qapi-schema.json
>> @@ -266,11 +266,13 @@
>>   ##
>>   # @guest-file-read:
>>   #
>> -# Read from an open file in the guest. Data will be base64-encoded
>> +# Read from an open file in the guest. Data will be base64-encoded.
>> +# As this command is just for limited, ad-hoc debugging, such as log
>> +# file access, the number of bytes to read is limited to 10 MB.
>=20
> s/10/48/
>=20
>>   #
>>   # @handle: filehandle returned by guest-file-open
>>   #
>> -# @count: maximum number of bytes to read (default is 4KB)
>> +# @count: maximum number of bytes to read (default is 4KB, maximum is 1=
0MB)
>=20
> s/10/48/

Oops I totally missed those, thanks!

>=20
>>   #
>>   # Returns: @GuestFileRead on success.
>>   #
>> diff --git a/qga/commands.c b/qga/commands.c
>> index 5611117372..efc8b90281 100644
>> --- a/qga/commands.c
>> +++ b/qga/commands.c
>> @@ -11,6 +11,7 @@
>>    */
>>  =20
>>   #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>   #include "guest-agent-core.h"
>>   #include "qga-qapi-commands.h"
>>   #include "qapi/error.h"
>> @@ -24,6 +25,12 @@
>>   #define GUEST_EXEC_MAX_OUTPUT (16*1024*1024)
>>   /* Allocation and I/O buffer for reading guest-exec out_data/err_data =
- 4KB */
>>   #define GUEST_EXEC_IO_SIZE (4*1024)
>> +/*
>> + * Maximum file size to read - 48MB
>> + *
>> + * (48MB + Base64 3:4 overhead =3D JSON parser 64 MB limit)
>> + */
>> +#define GUEST_FILE_READ_COUNT_MAX (48 * MiB)
>>  =20
>>   /* Note: in some situations, like with the fsfreeze, logging may be
>>    * temporarilly disabled. if it is necessary that a command be able
>> @@ -560,7 +567,7 @@ GuestFileRead *qmp_guest_file_read(int64_t handle, b=
ool has_count,
>>       }
>>       if (!has_count) {
>>           count =3D QGA_READ_COUNT_DEFAULT;
>> -    } else if (count < 0 || count >=3D UINT32_MAX) {
>> +    } else if (count < 0 || count > GUEST_FILE_READ_COUNT_MAX) {
>>           error_setg(errp, "value '%" PRId64 "' is invalid for argument =
count",
>>                      count);
>>           return NULL;
>=20
> With the docs typos fixed:
>=20
>    Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
>=20
> Regards,
> Daniel
>=20

