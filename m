Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp697144njg;
        Tue, 25 Feb 2025 21:44:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0/SRUkjY+ZlxPdk2Tm8jMHwEx61Fq2a8ZIiSFJTj0lsu5SjCV8v8lt/usKcU8LCKWgBglbq/KLtiMIA==@linaro.org
X-Google-Smtp-Source: AGHT+IFh0ZTX3bcqe/CkC4gQ6fGb1SqP2Cl0SM0NJLk9JEr9/rC3vXRDvfVGaMGtQKJa7MyflIO3
X-Received: by 2002:ad4:576c:0:b0:6e4:47b0:8b53 with SMTP id 6a1803df08f44-6e6a25a05b0mr332975616d6.9.1740548647008;
        Tue, 25 Feb 2025 21:44:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740548646; cv=none;
        d=google.com; s=arc-20240605;
        b=g58sTt6OTOHYEEyhkdhwx2VErIvr5BoXG/3Gjg3lk+l0BcJB9QcQenerTqxp9mM6mC
         qnZHKDkEE4J/DjQSnjjT/rZ/3mV+ocRb0/XwT8s8uLvuriqFw0kekw70zab23w6J8WDG
         fepxvhNYG0DeprNBLyqz15J9VR9OzVcZAQ4LAI9xI4cioZvqrgwQdDeJEpUdNbdThI3Y
         +zPGGTGMN9XeUbLupzgLt4cbdbFseJD/LiWcaaIxsIOsVZvo6K6AY++rUy7qfD/zcc8a
         TQ+RHUGEBvrBdspKqGx0W9bO2WEbLcmdjUm3VMYEBJEmLkl5lU+JQIEcB0k+Fp3pbjxW
         f+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=ob4wYugGCRyOehimsteQRIL+J92aQI1zIfpRWMpjEOA=;
        fh=EbqKIRY0NKJCmiEA6itck7rE78l+4xj0ZHpXOhM4vho=;
        b=I1vd32D+g9EEzWVvPzXtLKK2vO4qtfkMfuT/sCcFmJu89RFq4MkGd13322qVv2PICt
         tIWaFBy3nBDNJXdD68X4tEZj5b7SnKUeWN2uHQ6theVGoIH52WT2t0QgzKHJlB7c3kMk
         F7Pficy/Git1C3SlItv71B8twEv7M30cB4iY9en5I1Dx1erWANuwMBnRzHjKF5x7GR9K
         gfms3AZxxY/3zjmXFv7+ffp80XxCzUBccTQPf7oUPc7hL2zQVs1vMVJBDeepNPqnIQ6W
         3YAFz7Kr+hdnaBpI+8+hvaf8Kh0wXKlV6Cq8yILyPE4k9x8kXkOC14CgoSS210pKUO6I
         1XFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WOBd5PDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8883bdb47si6516296d6.106.2025.02.25.21.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 21:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WOBd5PDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnAD3-0003e9-VE; Wed, 26 Feb 2025 00:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tnAD1-0003dG-ID
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 00:43:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tnACx-00046v-Fw
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 00:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740548625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ob4wYugGCRyOehimsteQRIL+J92aQI1zIfpRWMpjEOA=;
 b=WOBd5PDib8cQJhI5gwdFAk8KhIJ/V83QTyMLkmfd/CWQGF+iwSRAsOGF26zDXhwG1fVJ6l
 HYqiIJlFaSZi0kEvHqoB2xZqOohzDM/ybCsl84oZQY/8fmmyEsZGRawloQ1l8zKFjKsuNj
 6yqvuSAzk1NfhgYhu6G5RDG6/ZWafog=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-d1pGkZhLP7OC0XpiIZZnpg-1; Wed,
 26 Feb 2025 00:43:39 -0500
X-MC-Unique: d1pGkZhLP7OC0XpiIZZnpg-1
X-Mimecast-MFC-AGG-ID: d1pGkZhLP7OC0XpiIZZnpg_1740548618
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BD0C319373D9; Wed, 26 Feb 2025 05:43:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.9])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8F51719560B9; Wed, 26 Feb 2025 05:43:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 081E921E675F; Wed, 26 Feb 2025 06:43:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,  qemu-arm@nongnu.org,  Ard
 Biesheuvel <ardb@kernel.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Thomas Huth <thuth@redhat.com>,  "Michael
 S. Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 graf@amazon.com,  Eric Blake <eblake@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v5 14/24] hw/uefi: add var-service-json.c + qapi for NV
 vars.
In-Reply-To: <20250225163031.1409078-15-kraxel@redhat.com> (Gerd Hoffmann's
 message of "Tue, 25 Feb 2025 17:30:18 +0100")
References: <20250225163031.1409078-1-kraxel@redhat.com>
 <20250225163031.1409078-15-kraxel@redhat.com>
Date: Wed, 26 Feb 2025 06:43:34 +0100
Message-ID: <87zfi95khl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gX8cTy7zKfb8

Gerd Hoffmann <kraxel@redhat.com> writes:

> Define qapi schema for the uefi variable store state.
>
> Use it and the generated visitor helper functions to store persistent
> (EFI_VARIABLE_NON_VOLATILE) variables in JSON format on disk.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

[...]

> diff --git a/qapi/meson.build b/qapi/meson.build
> index e7bc54e5d047..eadde4db307f 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -65,6 +65,7 @@ if have_system
>      'pci',
>      'rocker',
>      'tpm',
> +    'uefi',
>    ]
>  endif
>  if have_system or have_tools
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index b1581988e4eb..2877aff73d0c 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -81,3 +81,4 @@
>  { 'include': 'vfio.json' }
>  { 'include': 'cryptodev.json' }
>  { 'include': 'cxl.json' }
> +{ 'include': 'uefi.json' }
> diff --git a/qapi/uefi.json b/qapi/uefi.json
> new file mode 100644
> index 000000000000..c1dfa76b6eb2
> --- /dev/null
> +++ b/qapi/uefi.json
> @@ -0,0 +1,55 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +#
> +
> +##
> +# = UEFI Variable Store
> +#
> +# The qemu efi variable store implementation (hw/uefi/) uses this to
> +# store non-volatile variables on disk.
> +##
> +
> +##
> +# @UefiVariable:
> +#
> +# UEFI Variable.  Check the UEFI specifification for more detailed
> +# information on the fields.
> +#
> +# @guid: variable namespace GUID
> +#
> +# @name: variable name, in UTF-8 encoding.
> +#
> +# @attr: variable attributes.
> +#
> +# @data: variable value, encoded as hex string.

I understand this is a blob.  We commonly use base64 for that.  Why not
here?

> +#
> +# @time: variable modification time.  EFI_TIME struct, encoded as hex
> +#     string.  Used only for authenticated variables, where the
> +#     EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS attribute bit
> +#     is set.
> +#
> +# @digest: variable certificate digest.  Used to verify the signature
> +#     of updates for authenticated variables.

How to create and verify these digests will be obvious enough to users
of this interface?

> +#
> +# Since: 10.0
> +##
> +{ 'struct' : 'UefiVariable',
> +  'data' : { 'guid'  : 'str',
> +             'name'  : 'str',
> +             'attr'  : 'int',
> +             'data'  : 'str',
> +             '*time' : 'str',
> +             '*digest' : 'str'}}
> +
> +##
> +# @UefiVarStore:
> +#
> +# @version: currently allways 2

always

> +#
> +# @variables: list of UEFI variables
> +#
> +# Since: 10.0
> +##
> +{ 'struct' : 'UefiVarStore',
> +  'data' : { 'version'   : 'int',
> +             'variables' : [ 'UefiVariable' ] }}

