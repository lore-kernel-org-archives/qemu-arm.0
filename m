Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp158092njc;
        Wed, 19 Mar 2025 04:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/V162cq6iUPvFoq94xtPfftz8+122xXesxgv6bFqujbbMJHxP3CzWj8wB+R4pX5BxKFt23c1h15eHKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEtChpVwrwPceuSvKVYT21qEsGAlQ5yVPHSl9LxlpVB5dH+RIfZYrMxZ4l+eOzrwjvrFOjT
X-Received: by 2002:a05:622a:5793:b0:474:fa6b:c402 with SMTP id d75a77b69052e-476fcecd39dmr102010771cf.18.1742383543598;
        Wed, 19 Mar 2025 04:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742383543; cv=none;
        d=google.com; s=arc-20240605;
        b=knIJD236sbi2QghUNdCsiiHyNQ4qVMznztIdOyiSef1NRPOFFZ1K1en+YzVyOl3UAt
         n/b3Am+ybY7PxiR+p2SUM7yXc03NfbNsUADDFgW6yVploUV1VRn0Slkb2sb+moMDfxDw
         wGbYa6euxCaCGFSunOiUfb7r9WeuvFLkMIYNG0enXnNsbgaSsplloUPwRYH2f6ATXT55
         +vHR7nSHEnoe11f6NkpLnUHRLDE6LaTzun6WA8tx3OuD9WWNFNXbH7BIMW5b2+58HAnG
         Ljrb/AkLoPLdPqXbxBr+2b0AETRn7HgBlcfyl951zSN4vPsA60vAng9i27nNpSW4Lbs2
         SMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=C1w8kgAFq/a4lRFCTW6J283Rau1D7/rkcE+jQX8KfME=;
        fh=2Y5Yj3di3V3DscdWBw1KC24bV6YDN8L45ZWmxzhAkMY=;
        b=U7FsAv/FvZesRHOjkXOSTe7tXE+KCs3MiiQIYze70mPeHnGu01cvd/HK27PtgBry9T
         crR41yM6/Asq9WL4jB1unve8yM14AQ/lSH6wXhSFj1nEE63iZRDxbaM06nz0NfAbujah
         2chHkQhLRSyUjXPsGPOguPovEBDU9/dGfj/pqyKcbpjv1fPtkn/4opuSqB2btECCYrw/
         dEooGghL4PPuobtxMr+9BUgV59XjhbLFttO12pgB4Nt1vtJGr8I8SYwfRfD3wcbZ9JrC
         lrEjrfY6L2rO7IFS7nJ0abE51hDc2nmXvBSJzOS/d1ylAVabAsBK25g8lPRL2U35wCpL
         UGsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZTJRdiVW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb85d7fasi139248811cf.598.2025.03.19.04.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 04:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZTJRdiVW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1turY2-00022J-QC; Wed, 19 Mar 2025 07:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1turXz-0001z8-HF
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 07:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1turXv-0004SM-H7
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 07:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742383514;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=C1w8kgAFq/a4lRFCTW6J283Rau1D7/rkcE+jQX8KfME=;
 b=ZTJRdiVWx9da4MKdfm/g5rvLK3hWxXK01PqYhbAhuF0E5WTfOYwreWXFT4yuXbkH9/meWH
 FAePKt2xKO1zUdTTm3hK026HtIft2lPtnmrhLD5y5P0n1/EMa7RhAHy7DZItToHqbHBXZk
 SNOAkdg8Gfa5HqGRUnVoUeedWlILEvk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-GY9be_JqP72Fprzkb37gfA-1; Wed,
 19 Mar 2025 07:25:08 -0400
X-MC-Unique: GY9be_JqP72Fprzkb37gfA-1
X-Mimecast-MFC-AGG-ID: GY9be_JqP72Fprzkb37gfA_1742383506
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 87EB319560B7; Wed, 19 Mar 2025 11:25:03 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.112])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4B36B3001D0E; Wed, 19 Mar 2025 11:24:46 +0000 (UTC)
Date: Wed, 19 Mar 2025 11:24:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: n.shubin@yadro.com
Cc: qemu-devel@nongnu.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Viresh Kumar <vireshk@kernel.org>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 Nikita Shubin <nshubin@yadro.com>
Subject: Re: [PATCH PoC 1/7] QAPI: gpio JSON
Message-ID: <Z9qpeF9-LNLk_nON@redhat.com>
References: <20250319-gpiodev-v1-0-76da4e5800a1@yadro.com>
 <20250319-gpiodev-v1-1-76da4e5800a1@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250319-gpiodev-v1-1-76da4e5800a1@yadro.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jvzM0CNmJx0W

On Wed, Mar 19, 2025 at 10:57:51AM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nshubin@yadro.com>
> 
> Signed-off-by: Nikita Shubin <nshubin@yadro.com>
> ---
>  qapi/gpio.json        | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/meson.build      |  1 +
>  qapi/qapi-schema.json |  1 +
>  3 files changed, 70 insertions(+)
> 
> diff --git a/qapi/gpio.json b/qapi/gpio.json
> new file mode 100644
> index 0000000000000000000000000000000000000000..1c2b7af36813ff52cbb3a44e64a2e5a5d8658d62
> --- /dev/null
> +++ b/qapi/gpio.json
> @@ -0,0 +1,68 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +#
> +
> +##
> +# = Gpio devices
> +##
> +
> +##
> +# @GpiodevInfo:
> +#
> +# Information about a gpio device.
> +#
> +# @label: the label of the gpio device
> +#
> +# Since: 9.2
> +##
> +{ 'struct': 'GpiodevInfo',
> +  'data': { 'label': 'str' } }
> +
> +##
> +# @GpiodevBackendKind:
> +#
> +# @chardev: chardevs
> +#
> +# Since: 9.2
> +##
> +{ 'enum': 'GpiodevBackendKind',
> +  'data': [ 'chardev' ] }
> +
> +##
> +# @GpiodevChardev:
> +#
> +# Configuration info for chardev gpiodevs.
> +#
> +# @chardev: chardev id
> +#
> +# @size: buffer size, default is 65536
> +#
> +# Since: 9.2
> +##
> +  { 'struct': 'GpiodevChardev',
> +    'data': { 'chardev': 'str',
> +              '*size': 'int' } }
> +
> +##
> +# @GpiodevChardevWrapper:
> +#
> +# @data: Configuration info for chardev gpiodevs
> +#
> +# Since: 9.2
> +##
> +{ 'struct': 'GpiodevChardevWrapper',
> +  'data': { 'data': 'GpiodevChardev' } }
> +
> +##
> +# @GpiodevBackend:
> +#
> +# Configuration info for the new chardev backend.
> +#
> +# @type: backend type
> +#
> +# Since: 9.2
> +##
> +{ 'union': 'GpiodevBackend',
> +  'base': { 'type': 'GpiodevBackendKind' },
> +  'discriminator': 'type',
> +  'data': { 'chardev': 'GpiodevChardevWrapper' } }

While historically we've just wired things up to chardevs in QEMU,
in most cases this is just a hack to get the ability too configure
a socket, with the other chardev backends being never used. The
downside of this is that chardev APIs internally are not very nice
to work with, especally if you want/need to be aware of client
connection establishment/closure.

These days we've got common socket APIs and QAPI schema available
and can bypass the chardevs (which have a pretty unpleasant
internal API) if all we need is a socket backend connecting to
an external server. This would let code directly work with the
QIOChannelSocket object, instead of that object being hidden
behind the chardev APIs.

 { 'enum': 'GpiodevBackendKind',
   'data': [ 'socket' ] }

 { 'struct': 'GpiodevSocket',
   'data': { 'addr': 'SocketAddress',
             '*size': 'int'} }

 { 'struct': 'GpiodevSocketWrapper',
   'data': { 'data': 'GpiodevSocket' } }


 { 'union': 'GpiodevBackend',
   'base': { 'type': 'GpiodevBackendKind' },
   'discriminator': 'type',
   'data': { 'socket': 'GpiodevSocketWrapper' } }

if you need to switch between client/server mode some further
additions would be needed.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

