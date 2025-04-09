Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7526439njd;
        Tue, 8 Apr 2025 23:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRKUEJAbV4bVDmW+If97OYsMnBMhFPl+LrIaUN1bKFfrkwLZs+EvCxOyMI9+2jqdzMewKlRuZv0na7tw==@linaro.org
X-Google-Smtp-Source: AGHT+IFo3w8UyBHPpRcUei2UU3NqMk/up0TR8ZCwmoh3c2aghXozfyx7rcXAXHaAWt0G1Dv4B9Pw
X-Received: by 2002:a05:620a:2545:b0:7c5:54c9:3b8a with SMTP id af79cd13be357-7c79cbe07b9mr267077985a.26.1744181027033;
        Tue, 08 Apr 2025 23:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744181027; cv=none;
        d=google.com; s=arc-20240605;
        b=CeFOpRc32dthbPzKjvCOVVHu/envykRonJDf4wqvgKK0gnSE/DrdKi5l+ik5UD+deW
         EgaECENNmulLLzcqp9ymCSTGqY6r52AhTzBn1rJQhmcLFF3EMJshOAMlGZcoOAqtVerb
         4E21aL7O3+O+tO0XI0rvaxOE4SKAtGxjhEM/o6u6snBeR0LydlbVCVjJ051xCtdx7ns/
         FzBjRIuN2sd1YV7pcj39pAQZgDenBHGI+stEhRR6cFUsvaH6LbKXKZ/5etTTumNs/ov6
         H6xDudCK2+bjUPOcETf0v40Ru8cQOZsTGFESIr13Lcpc5CxVE0ClFPVVSFwZ8EqX6kR9
         hJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=ReSjXhTMyXs68TOAKRohePS4DFiaZ4opUsV4HIHmny8=;
        fh=Cp428lGRWpSy1FcYgOVTU0uUMVutpHx5Ex0BR529Ry0=;
        b=VKYTcQIKphAOu8U6CA/MXA7RtCFHOdFrDAU5bEgrHtP/8BJXnCWZNdpIotWEDsEZW3
         eBDQJKiHF0JXxm7iDp71bgp9qcq1b3fODXwxEUsSsK74lSRh/OYXGx3i+dfpwjAlppY3
         /MMUauscfL6CoXttdN1iIWe0PbteR4fAOAANRNMVAybp6oekYtGXqqSWaQsFDglvLzOj
         tQdLWf9txwVr/XrxOKD4grpailncwbpMXW9BUn562zKS4Wx/dxpIqwNa+68CHvhLminj
         rQz2qJSE7uK/7z58s5mkpzWP8CZcIB1PfDWA/QS+l0nSgIJ6WtOW2K8J/Smib/dGlff4
         mKCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I2JnMNH2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a144ea0esi42067985a.404.2025.04.08.23.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Apr 2025 23:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I2JnMNH2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2P9W-0005ne-7a; Wed, 09 Apr 2025 02:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1u2P9J-0005mf-Rb
 for qemu-arm@nongnu.org; Wed, 09 Apr 2025 02:43:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1u2P9E-0001tR-Qd
 for qemu-arm@nongnu.org; Wed, 09 Apr 2025 02:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744180969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReSjXhTMyXs68TOAKRohePS4DFiaZ4opUsV4HIHmny8=;
 b=I2JnMNH2N4xvodsSesPNsTURRZDF62GtSuH8WMMA4y+GOgBdLaQ5IuVp9SXOdfSAUGvY+N
 BhPpw19cmg2aidFNbZg5EvRJMvNdZEA9k2+SQDGz43mU/UQPsHdXayqHAAZ6hFkd9jkSEy
 p+T3/ghNegBX/j4B7Mrb/pHbpI1Vg/k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-249-dIYiwDFSO5e-QYXd9yM_Tg-1; Wed,
 09 Apr 2025 02:42:48 -0400
X-MC-Unique: dIYiwDFSO5e-QYXd9yM_Tg-1
X-Mimecast-MFC-AGG-ID: dIYiwDFSO5e-QYXd9yM_Tg_1744180966
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4C2C61801A07; Wed,  9 Apr 2025 06:42:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.7])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 638251801747; Wed,  9 Apr 2025 06:42:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 017CD21E6773; Wed, 09 Apr 2025 08:42:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: n.shubin@yadro.com,  qemu-devel@nongnu.org,  Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>,  "Enrico
 Weigelt, metux IT consult" <info@metux.net>,  Viresh Kumar
 <vireshk@kernel.org>,  Eric Blake <eblake@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le
 Goater <clg@kaod.org>,  Peter Maydell <peter.maydell@linaro.org>,  Steven
 Lee <steven_lee@aspeedtech.com>,  Troy Lee <leetroy@gmail.com>,  Jamin Lin
 <jamin_lin@aspeedtech.com>,  Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,  qemu-arm@nongnu.org,  Nikita Shubin
 <nikita.shubin@maquefel.me>,  Nikita Shubin <nshubin@yadro.com>
Subject: Re: [PATCH PoC 1/7] QAPI: gpio JSON
In-Reply-To: <Z9qpeF9-LNLk_nON@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 19 Mar 2025 11:24:40 +0000")
References: <20250319-gpiodev-v1-0-76da4e5800a1@yadro.com>
 <20250319-gpiodev-v1-1-76da4e5800a1@yadro.com>
 <Z9qpeF9-LNLk_nON@redhat.com>
Date: Wed, 09 Apr 2025 08:42:30 +0200
Message-ID: <87h62xg7jd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.845,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9HBKF0xMRDU2

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Mar 19, 2025 at 10:57:51AM +0300, Nikita Shubin via B4 Relay wrot=
e:
>> From: Nikita Shubin <nshubin@yadro.com>
>>=20
>> Signed-off-by: Nikita Shubin <nshubin@yadro.com>

The commit message should briefly explain the purpose of the change.

>> ---
>>  qapi/gpio.json        | 68 ++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  qapi/meson.build      |  1 +
>>  qapi/qapi-schema.json |  1 +
>>  3 files changed, 70 insertions(+)
>>=20
>> diff --git a/qapi/gpio.json b/qapi/gpio.json
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..1c2b7af36813ff52cbb3a44e=
64a2e5a5d8658d62
>> --- /dev/null
>> +++ b/qapi/gpio.json
>> @@ -0,0 +1,68 @@
>> +# -*- Mode: Python -*-
>> +# vim: filetype=3Dpython
>> +#
>> +
>> +##
>> +# =3D Gpio devices

Spell it GPIO in doc text, because it's an acronym.

>> +##
>> +
>> +##
>> +# @GpiodevInfo:
>> +#
>> +# Information about a gpio device.
>> +#
>> +# @label: the label of the gpio device
>> +#
>> +# Since: 9.2

Make that 10.1 everywhere.

>> +##
>> +{ 'struct': 'GpiodevInfo',
>> +  'data': { 'label': 'str' } }
>> +
>> +##
>> +# @GpiodevBackendKind:
>> +#
>> +# @chardev: chardevs
>> +#
>> +# Since: 9.2
>> +##
>> +{ 'enum': 'GpiodevBackendKind',
>> +  'data': [ 'chardev' ] }
>> +
>> +##
>> +# @GpiodevChardev:
>> +#
>> +# Configuration info for chardev gpiodevs.
>> +#
>> +# @chardev: chardev id
>> +#
>> +# @size: buffer size, default is 65536

What buffer is being sized here?

>> +#
>> +# Since: 9.2
>> +##
>> +  { 'struct': 'GpiodevChardev',
>> +    'data': { 'chardev': 'str',
>> +              '*size': 'int' } }

Use 'size' instead of 'int' for byte counts, please.

>> +
>> +##
>> +# @GpiodevChardevWrapper:
>> +#
>> +# @data: Configuration info for chardev gpiodevs
>> +#
>> +# Since: 9.2
>> +##
>> +{ 'struct': 'GpiodevChardevWrapper',
>> +  'data': { 'data': 'GpiodevChardev' } }
>> +
>> +##
>> +# @GpiodevBackend:
>> +#
>> +# Configuration info for the new chardev backend.
>> +#
>> +# @type: backend type
>> +#
>> +# Since: 9.2
>> +##
>> +{ 'union': 'GpiodevBackend',
>> +  'base': { 'type': 'GpiodevBackendKind' },
>> +  'discriminator': 'type',
>> +  'data': { 'chardev': 'GpiodevChardevWrapper' } }

Why GpiodevChardevWrapper?  Consistency with similar existing things?

The wrapper types are remnants of "simple" unions.  New code should
avoid them, unless avoiding them would make things hard to use.  For
instance, when adding a new branch to a union where the existing
branches are of such wrapper types, use a wrapper for the new one to
keep things consistent.

What other backend types do you have in mind?

> While historically we've just wired things up to chardevs in QEMU,
> in most cases this is just a hack to get the ability too configure
> a socket, with the other chardev backends being never used. The
> downside of this is that chardev APIs internally are not very nice
> to work with, especally if you want/need to be aware of client
> connection establishment/closure.
>
> These days we've got common socket APIs and QAPI schema available
> and can bypass the chardevs (which have a pretty unpleasant
> internal API) if all we need is a socket backend connecting to
> an external server. This would let code directly work with the
> QIOChannelSocket object, instead of that object being hidden
> behind the chardev APIs.

Good point.  Nikita, do you see a use for chardevs other than sockets?

[...]

