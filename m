Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2124270lfe;
        Sat, 21 Mar 2020 06:09:24 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuSi7tw9ljgDGrhGIKNsHlnEHNjo8AqTFtRiD0r4H1ZsTLI3Bm+0Nncb0i/Hsb1XfpHb6P4
X-Received: by 2002:a37:715:: with SMTP id 21mr13238355qkh.435.1584796164725;
        Sat, 21 Mar 2020 06:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584796164; cv=none;
        d=google.com; s=arc-20160816;
        b=n3u1PhbcM2eOeaQjh5Og6aq7U2DhvP+FZng3Fh9dW4yqf3IpO4ROJ25WFH64mtr6gu
         N4Ypte4RHa+MdPakr2nf9u8KptQ6m03+NFHlcvTqF53fO8Huinu1VCSc3gyPFxZdWTfL
         Gm4+LWKv5qn5+7OvQewB2mHl3dW5bPhWjQGRXQ3CyByY0cU5PpQwrc5RqPLUs08Cj7uS
         ujx7e3AYPaVTSvxHWkR88EzCq7rUwwudaDeURXxFPlilv3ecmgQNJCXkxp2iYVf6uBBk
         0eyfUIOYON/kC9Ouzv+Gmhd2q5w6C91hy7UBukiXKMzHmK0auwgdX4kiNXaYZ17UgNX7
         tZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=mLpk1L/99JViTkEUYYE0DZVtIlVgitHx82b+fab8/6w=;
        b=rok4z/Mo6eZisdFKjAjnKvASAGNzD15roJx+VsXi6OFQt9oU+5RyOfaqisZ+yDUCch
         bqiKBC7nvWX0wRTolRxkwTLiyFb1cz2S5Pnd1XaBKgdnfnBHJeI9Tre8oafkyZI6z6yV
         U2WlqjQl1TkAXZIwezhsnp2VEKvfxrMOyMrw5ZHBGBT8VjPUmtgSGJGrL+/67wlIs9x5
         uosEBWLXMT4TAYJa/QEUG8rB/pVfA/zanO3or0b8BtUIvWO3pLmxUU4RLlQOw22kHA2g
         /0jnrcP3fUUtpDspwJQC9fWZDyoZ0rB6A/hrkOxS8qycFHuOW9XghiXEqNLUt2uKhLJR
         l2Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ar0CHWmp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si5544346qth.45.2020.03.21.06.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 06:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ar0CHWmp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFdsS-0000E2-4M
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 09:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46641)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jFds6-0008Nf-El
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 09:09:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jFds5-0002y8-DH
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 09:09:02 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:50031)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jFds5-0002wA-9X
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 09:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584796140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLpk1L/99JViTkEUYYE0DZVtIlVgitHx82b+fab8/6w=;
 b=Ar0CHWmpDIy+ijnXYPA6d+u0+lwEt8iFGYMxVfOJHxdVTlMIc8Q+wY8eBWTfP3LuHiD5v2
 fddbmdC6LdxsEARVz/GO+N2Y2iKDAKd9cnDJIkobU/kaYkPcnmnbyVuTMu/HfWKMa+P8qZ
 q+KL7v8sO1za/lohVbOQC5WegxBE044=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-bHF7MhVMNraFWACXUQrg8A-1; Sat, 21 Mar 2020 09:08:57 -0400
X-MC-Unique: bHF7MhVMNraFWACXUQrg8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34F1A800D4E;
 Sat, 21 Mar 2020 13:08:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA946EFB9;
 Sat, 21 Mar 2020 13:08:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 379F212E76B2; Sat, 21 Mar 2020 14:08:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH-for-5.0 01/11] block: Remove dead assignment
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-2-philmd@redhat.com>
 <d58a82c0-7f6c-531e-bd95-9cb6fd830f17@vivier.eu>
Date: Sat, 21 Mar 2020 14:08:40 +0100
In-Reply-To: <d58a82c0-7f6c-531e-bd95-9cb6fd830f17@vivier.eu> (Laurent
 Vivier's message of "Sat, 21 Mar 2020 12:58:23 +0100")
Message-ID: <877dzd97on.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VOlzpM9596gB

Laurent Vivier <laurent@vivier.eu> writes:

> Le 21/03/2020 =C3=A0 12:46, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>> Fix warning reported by Clang static code analyzer:
>>=20
>>   block.c:3167:5: warning: Value stored to 'ret' is never read
>>       ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
>>       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>=20
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  block.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/block.c b/block.c
>> index a2542c977b..908c109a8c 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -3164,7 +3164,7 @@ static BlockDriverState *bdrv_open_inherit(const c=
har *filename,
>>                                      parent->open_flags, parent->options=
);
>>      }
>> =20
>> -    ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
>> +    bdrv_fill_options(&options, filename, &flags, &local_err);
>>      if (local_err) {
>>          goto fail;
>>      }
>>=20
>
> I would be sruprised if coverity doesn't warn about an unused return valu=
e.

Coverity recognizes the fact that some return values can be safely
ignored, and reports only ignored return values it sees commonly checked
elsewhere.

This function is used called nowhere else.  Coverity won't complain.

However, I'd prefer

        ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
   -    if (local_err) {
   +    if (ret < 0) {
            goto fail;
        }

