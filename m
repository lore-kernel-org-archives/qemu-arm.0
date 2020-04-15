Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1029509qvm;
        Wed, 15 Apr 2020 08:24:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypJzB+hXBGsAMPy6CW0YUCJmUtxWmP/nJm0IfHxZFIf0TS9Cn0Fa0V/R9ed0zvRLA2U6o0QM
X-Received: by 2002:a37:888:: with SMTP id 130mr15004055qki.261.1586964259113;
        Wed, 15 Apr 2020 08:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586964259; cv=none;
        d=google.com; s=arc-20160816;
        b=jyNMmsr+ns/jHqo+wNzoHS6kzBCVkEE0xcsx1aDSAwtG0HIQqqoIZ9RZOSD1ebLDD0
         eE+f1nD4ZUWdThC1xclaI8E2Pib6JTETiH4XJb4/jan4/qS8UMnmTLa1GMqccYDTsmAO
         mxtdyfEx1clDl9qIvd5hrCbedI56Zlj54UfAfZMZOiFdBh+uN1TaWrwDWH/f8SFhc2Q9
         KQTuM1A6etPAO4egCi9ob/red2GJuuoW+Pp1Doe+mglFDb+hbF2B8PMa8cb7WI63JLQs
         drZJhKhnWZk8n2M/RWaQsta35MVmj+v9qAzGMGUxZGynQDJI1pPYlQ+vwyhI10wWfHtz
         Q79g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:subject:user-agent
         :message-id:references:in-reply-to:from:to:content-transfer-encoding
         :mime-version:dkim-signature;
        bh=z9c3BC7dWsrCkABIzRvwVOeIfYSxdUw3GfSyrHsO+KQ=;
        b=Tko4xy/b+Gegu0ydWaPcki6X74Jmfs9OK/HOp/y7ihw1nZ7uH2TgEQEyVCTZUf9UGx
         WNr0SyDZGSABnpbwKvDQ0HX7E+u6Evw+ZFeE/e6Il14uy8kBHAhbbo6+ET2rwuXeYdbX
         QosPyLKOm9Ogtlk3T88jBQJVYOM2bC/i2x2uG9hi6ElhMBkhHA+n+KvtVoHKhDKz2k2b
         jn91OPh3IMgymUsOUu91o87S1xlHbR0DSpd/miDbQbTUOzuJUfR6N8Dr/C25iRC6EgOV
         xcGIZbLpP/o5PRhvM/ljlB3vnfkBCbX8NdGuJ4Kq64aZq4jkp8S1ofRPW0ot4nk24Y8N
         eI0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rIjIQsTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si2399605qtw.208.2020.04.15.08.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 08:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rIjIQsTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOjti-000614-IS
	for alex.bennee@linaro.org; Wed, 15 Apr 2020 11:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1jOjsp-0004V2-TM
 for qemu-arm@nongnu.org; Wed, 15 Apr 2020 11:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <flukshun@gmail.com>) id 1jOjso-0002NZ-EP
 for qemu-arm@nongnu.org; Wed, 15 Apr 2020 11:23:23 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39528)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <flukshun@gmail.com>)
 id 1jOjsi-0002ML-EE; Wed, 15 Apr 2020 11:23:16 -0400
Received: by mail-ot1-x341.google.com with SMTP id m13so259835otf.6;
 Wed, 15 Apr 2020 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
 :cc:references:message-id:user-agent:subject:date;
 bh=z9c3BC7dWsrCkABIzRvwVOeIfYSxdUw3GfSyrHsO+KQ=;
 b=rIjIQsTc7P1HX0CZwxJ/v17EIE8XXXB+AeQVLhjgvWt1ZRqvZQtaIMhQ5AyzbuSMzX
 u2toZG449q3H/y735OjuDXNX3DO56H58qlJzuJtjDurGz+LDyyYEigjd+DKjTSREbqum
 5bTCcJK1D0BNLwrpAIkH4TONDE/HcTBh+l+LLaA9gTvJLn6I9/ph5Ym2Y/WB1h2dvXds
 apYShiuQPeDZHDGCXPDZQx4hekMcE0kR2S89cSeqkOZEosbC+OkRMj7w/6Sjr3Qm+O/K
 zF9yowJbFrKmls/ECeWZGupdCOSTjMZdx8OeMPrBjenxuIPKHFjI0CzyePBHCw7s9P0G
 lXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
 :from:in-reply-to:cc:references:message-id:user-agent:subject:date;
 bh=z9c3BC7dWsrCkABIzRvwVOeIfYSxdUw3GfSyrHsO+KQ=;
 b=B4McLDGQRl1IG7CrFs5wCifwELD4lmJ5rbV+ECj/b+Paq5TxDx34aqIBaVT56qlNdm
 +MsGifWvejwnnHvvMGnwzwaTLbrP9cD4mLl/NKaPPmwuux1RBg5k5/OOdtknVR/Sje1n
 yw6FEsQrVrxGL8w4XuzMpZx8ocu3i0xYPVf0fD6e+/AlGBsiJGHEumzP2o1kIk5U2Ipm
 o1K+dy/uLfLjLzOA7+DHpZi9mZZtj89D2FStIhuSzH8CiXPpFxLiGmAwKWZHuImAjWrN
 oOOCWVeNHu07xKEU0mjIfj9g99Bpmf2w0WBDYVB4SrPPTlrKvF0oatItLv7ymo4JkvGr
 k8LA==
X-Gm-Message-State: AGi0Puboej8pgbyIOOBBb4WWngPFQ+PPmuJohTVTGYnITlnZ4y/UTNYL
 yYof4o2u+Lk6Fq5ySuFjuhk=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr1843590otc.221.1586964194865; 
 Wed, 15 Apr 2020 08:23:14 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id h18sm342794otm.10.2020.04.15.08.23.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Apr 2020 08:23:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <3cd57dd9-0552-8064-c9d8-43913ed73e2e@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
 <20200414133052.13712-5-philmd@redhat.com>
 <20200415123405.GD1344391@redhat.com>
 <3cd57dd9-0552-8064-c9d8-43913ed73e2e@redhat.com>
Message-ID: <158696418716.14409.1221138720205363596@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH-for-5.0 04/12] qga: Restrict guest-file-read count to 48
 MB to avoid crashes
Date: Wed, 15 Apr 2020 10:23:07 -0500
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qPf87bA7l7jb

Quoting Philippe Mathieu-Daud=C3=A9 (2020-04-15 08:02:18)
> On 4/15/20 2:34 PM, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Apr 14, 2020 at 03:30:44PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> On [*] Daniel Berrang=C3=A9 commented:
> >>
> >>    The QEMU guest agent protocol is not sensible way to access huge
> >>    files inside the guest. It requires the inefficient process of
> >>    reading the entire data into memory than duplicating it again in
> >>    base64 format, and then copying it again in the JSON serializer /
> >>    monitor code.
> >>
> >>    For arbitrary general purpose file access, especially for large
> >>    files, use a real file transfer program or use a network block
> >>    device, not the QEMU guest agent.
> >>
> >> To avoid bug reports as BZ#1594054 (CVE-2018-12617), follow his
> >> suggestion to put a low, hard limit on "count" in the guest agent
> >> QAPI schema, and don't allow count to be larger than 48 MB.
> >>
> >> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg693176.html
> >>
> >> Fixes: CVE-2018-12617
> >> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1594054
> >> Reported-by: Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>
> >> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>   qga/qapi-schema.json | 6 ++++--
> >>   qga/commands.c       | 9 ++++++++-
> >>   2 files changed, 12 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> >> index f6fcb59f34..7758d9daf8 100644
> >> --- a/qga/qapi-schema.json
> >> +++ b/qga/qapi-schema.json
> >> @@ -266,11 +266,13 @@
> >>   ##
> >>   # @guest-file-read:
> >>   #
> >> -# Read from an open file in the guest. Data will be base64-encoded
> >> +# Read from an open file in the guest. Data will be base64-encoded.
> >> +# As this command is just for limited, ad-hoc debugging, such as log
> >> +# file access, the number of bytes to read is limited to 10 MB.
> > =

> > s/10/48/
> > =

> >>   #
> >>   # @handle: filehandle returned by guest-file-open
> >>   #
> >> -# @count: maximum number of bytes to read (default is 4KB)
> >> +# @count: maximum number of bytes to read (default is 4KB, maximum is=
 10MB)
> > =

> > s/10/48/
> =

> Oops I totally missed those, thanks!

I've rolled in the doc fix-ups and sent a pull request for patches 1-4

> =

> > =

> >>   #
> >>   # Returns: @GuestFileRead on success.
> >>   #
> >> diff --git a/qga/commands.c b/qga/commands.c
> >> index 5611117372..efc8b90281 100644
> >> --- a/qga/commands.c
> >> +++ b/qga/commands.c
> >> @@ -11,6 +11,7 @@
> >>    */
> >>   =

> >>   #include "qemu/osdep.h"
> >> +#include "qemu/units.h"
> >>   #include "guest-agent-core.h"
> >>   #include "qga-qapi-commands.h"
> >>   #include "qapi/error.h"
> >> @@ -24,6 +25,12 @@
> >>   #define GUEST_EXEC_MAX_OUTPUT (16*1024*1024)
> >>   /* Allocation and I/O buffer for reading guest-exec out_data/err_dat=
a - 4KB */
> >>   #define GUEST_EXEC_IO_SIZE (4*1024)
> >> +/*
> >> + * Maximum file size to read - 48MB
> >> + *
> >> + * (48MB + Base64 3:4 overhead =3D JSON parser 64 MB limit)
> >> + */
> >> +#define GUEST_FILE_READ_COUNT_MAX (48 * MiB)
> >>   =

> >>   /* Note: in some situations, like with the fsfreeze, logging may be
> >>    * temporarilly disabled. if it is necessary that a command be able
> >> @@ -560,7 +567,7 @@ GuestFileRead *qmp_guest_file_read(int64_t handle,=
 bool has_count,
> >>       }
> >>       if (!has_count) {
> >>           count =3D QGA_READ_COUNT_DEFAULT;
> >> -    } else if (count < 0 || count >=3D UINT32_MAX) {
> >> +    } else if (count < 0 || count > GUEST_FILE_READ_COUNT_MAX) {
> >>           error_setg(errp, "value '%" PRId64 "' is invalid for argumen=
t count",
> >>                      count);
> >>           return NULL;
> > =

> > With the docs typos fixed:
> > =

> >    Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > =

> > =

> > Regards,
> > Daniel
> > =

>=20
