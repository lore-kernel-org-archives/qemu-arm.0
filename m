Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp425131njc;
        Thu, 8 Aug 2024 01:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVxUQbDgXiINAoDPsgf0zc+vP43XbkQnl3abzFIXLUh5jWyGlsoEFN7h9x6BJoG31xjwwLFYkS5x9Pr6X4R01COuw8k86W2
X-Google-Smtp-Source: AGHT+IGo0xne9MU9tydmSFvuIoDm6b2avtqalmUqqNsyv/zq1oauHBXxe0on1hpHlr+paiPwogIt
X-Received: by 2002:a17:907:724f:b0:a7d:a0d0:f5c1 with SMTP id a640c23a62f3a-a8090efbeecmr78540266b.65.1723107049818;
        Thu, 08 Aug 2024 01:50:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723107049; cv=pass;
        d=google.com; s=arc-20160816;
        b=Cu3XO56VMgx6NKdwF85NkUQI8Ms8HhMizZEoYZ0xu1ta3sw0vK9v7QuADgJqiAe9R9
         wMGVaOqCakKYmIf/PG0JFyBr4ypVUU5R7LPxewcfEqvQ3Dym2Ij+ST/mw/XFTnu9G53G
         V/VTW1/beykMMI304X5L0dGFYFJ0wLntAGwS2WcHgzbY7a1vobjF2n+dhAfDr28WkrSL
         F5l2e9DzpKSmeyK3eo6KFu3ii2ggTSpfMzL4ZGT19syyFfpaUVL1FqRxQrNhDD+B/eAW
         smLaAQ7Tx3DNaOEX/6V49u9Ghe6rxc+4hX/0UZ+htivKygPcCON5oA9Z+0ViifmhzmMR
         bIbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=+P945oXoh8Dg1hOM4d9au0nq9mZ8s5CjyWl9HOYb1UU=;
        fh=OUqmBig6VzsEN5C8sADN5kVx3iZh5BlPpVA4ByD8Vn0=;
        b=SlU8DTUSLmj++Gg9+b1doM0JSCnLrDSww+pmi26ed1vLX0nc2nr5O461IkAQWkbYgd
         m6Xe+9g98n/z454nKr5LuwnZDwx+38Ax6NLaXxtfMCjKUF5mlUim+CXZxhoEM/NNaEHV
         qNp/NPXqFO9vw00QK39SavmZwYA6K6phLC2pRrPyc5+nXn4ooZphr5bHxSyLXQeuM5wm
         LhwFvelT9LBXoTDzhFl1+vUYBUNMdvoqxjlwkgqi3BFgIBUfdRD96dQDlEewgQlV1U0o
         7gZvLchMKpeDx6GEyziWMTJ7SDcDys/VTG7lwv1bgiMlLF4CZazDLEMSbuoezS0pLz8U
         Zv+A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IKjjd/0C";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-279125-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-279125-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-279125-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7dc9bd287bsi735069066b.67.2024.08.08.01.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 01:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-279125-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IKjjd/0C";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-279125-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-279125-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4495F1F21AE4
	for <alex.bennee@linaro.org>; Thu,  8 Aug 2024 08:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CE3189B84;
	Thu,  8 Aug 2024 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IKjjd/0C"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D5B25634
	for <linux-kernel@vger.kernel.org>; Thu,  8 Aug 2024 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723107045; cv=none; b=TC2bPRITxZ5/9pcsI33HfJJoK0Zw9TmTOEyJ7O4EwMQ9xi6lGhyk97u3XCFnsoC/j3IJe10GJDVxhPQagg7G6bnXliOON6nJcsAv3c9r0lbaLtu6vVd1MTMr2uSnnmpGmZBP0H03wUnaze74cNDRAdSrxaV+4SNmvdvdh0WWeG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723107045; c=relaxed/simple;
	bh=wwZICW0t5V3Pd8bNX1iK1ZZCUo6uil1UKFCK4o0f7WQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MoccWygTVGTefqpsloRScqeNPe6yWkLRfgnvFnoYhAXrZj3UOgjsooh6iVjSQXY9LQIc8QYaWhIkXtcPSzGSjfMt5qo8G1ank590+aI2oKqIbPNh39IkwYVEXxLF/SZ9FkG45tU98i1is49Uou4f3GstSk5ky080Jmyn2zPwyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IKjjd/0C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723107041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+P945oXoh8Dg1hOM4d9au0nq9mZ8s5CjyWl9HOYb1UU=;
	b=IKjjd/0C16e/tiPQ6N6cLluw9yN3VVZ4gZ3xuC/ABmPmsYBWLw9TsiwTGiUy6/Z0bOr8R7
	6caO7tvroIwFOLyuK+atdlxon/EVNPkljwQ9C34G80nBNdBhZTUqU+SHafMc4RMgD1Ivwh
	yh0IOd2fhfIQ2jCFAdgDd9ukBPDNo4c=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-dA68Y6d5O2CCl_orbzP6HQ-1; Thu,
 08 Aug 2024 04:50:38 -0400
X-MC-Unique: dA68Y6d5O2CCl_orbzP6HQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99DAF1944B2F;
	Thu,  8 Aug 2024 08:50:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EFF11956056;
	Thu,  8 Aug 2024 08:50:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 12BAF21E6692; Thu,  8 Aug 2024 10:50:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,  Shiju Jose
 <shiju.jose@huawei.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Ani
 Sinha <anisinha@redhat.com>,  Dongjiu Geng <gengdongjiu1@gmail.com>,  Eric
 Blake <eblake@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  linux-kernel@vger.kernel.org,
  qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic
 CPER error injection
In-Reply-To: <51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
	(Mauro Carvalho Chehab's message of "Fri, 2 Aug 2024 23:44:00 +0200")
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
Date: Thu, 08 Aug 2024 10:50:33 +0200
Message-ID: <87v80b1jqe.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: SpPnuW0b+cyv

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Creates a QMP command to be used for generic ACPI APEI hardware error
> injection (HEST) via GHESv2.
>
> The actual GHES code will be added at the followup patch.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS              |  7 +++++
>  hw/acpi/Kconfig          |  5 ++++
>  hw/acpi/ghes_cper.c      | 45 ++++++++++++++++++++++++++++++++
>  hw/acpi/ghes_cper_stub.c | 18 +++++++++++++
>  hw/acpi/meson.build      |  2 ++
>  hw/arm/Kconfig           |  5 ++++
>  include/hw/acpi/ghes.h   |  7 +++++
>  qapi/ghes-cper.json      | 55 ++++++++++++++++++++++++++++++++++++++++
>  qapi/meson.build         |  1 +
>  qapi/qapi-schema.json    |  1 +
>  10 files changed, 146 insertions(+)
>  create mode 100644 hw/acpi/ghes_cper.c
>  create mode 100644 hw/acpi/ghes_cper_stub.c
>  create mode 100644 qapi/ghes-cper.json
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98eddf7ae155..655edcb6688c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2075,6 +2075,13 @@ F: hw/acpi/ghes.c
>  F: include/hw/acpi/ghes.h
>  F: docs/specs/acpi_hest_ghes.rst
>  
> +ACPI/HEST/GHES/ARM processor CPER
> +R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +S: Maintained
> +F: hw/arm/ghes_cper.c
> +F: hw/acpi/ghes_cper_stub.c
> +F: qapi/ghes-cper.json
> +

Here's the reason for creating a new QAPI module instead of adding to
existing module acpi.json: different maintainers.

Hypothetical question: if we didn't care for that, would this go into
qapi/acpi.json?

If yes, then should we call it acpi-ghes-cper.json or acpi-ghes.json
instead?

>  ppc4xx
>  L: qemu-ppc@nongnu.org
>  S: Orphan

[...]

> diff --git a/qapi/ghes-cper.json b/qapi/ghes-cper.json
> new file mode 100644
> index 000000000000..3cc4f9f2aaa9
> --- /dev/null
> +++ b/qapi/ghes-cper.json
> @@ -0,0 +1,55 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +
> +##
> +# = GHESv2 CPER Error Injection
> +#
> +# These are defined at
> +# ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
> +# (GHESv2 - Type 10)
> +##

Feels a bit terse.  These what?

The reference could be clearer: "defined in the ACPI Specification 6.2,
section 18.3.2.8 Generic Hardware Error Source version 2".  A link would
be nice, if it's stable.

> +
> +##
> +# @CommonPlatformErrorRecord:
> +#
> +# Common Platform Error Record - CPER - as defined at the UEFI
> +# specification.  See
> +# https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#record-header
> +# for more details.
> +#
> +# @notification-type: pre-assigned GUID string indicating the record
> +#   association with an error event notification type, as defined
> +#   at https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#record-header

Please indent four spaces for consistency, like this:

   # @notification-type: pre-assigned GUID string indicating the record
   #     association with an error event notification type, as defined at
   #     https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#record-header

> +#
> +# @raw-data: Contains a base64 encoded string with the payload of
> +#   the CPER.

Suggest

  # @raw-data: payload of the CPER encoded in base64

Have you considered naming this @payload instead?

> +#
> +# Since: 9.2
> +##
> +{ 'struct': 'CommonPlatformErrorRecord',
> +  'data': {
> +      'notification-type': 'str',
> +      'raw-data': 'str'
> +  }
> +}
> +
> +##
> +# @ghes-cper:
> +#
> +# Inject ARM Processor error with data to be filled according with
> +# ACPI 6.2 GHESv2 spec.

according to

(Beware, I'm not a native speaker)

> +#
> +# @cper: a single CPER record to be sent to the guest OS.
> +#
> +# Features:
> +#
> +# @unstable: This command is experimental.
> +#
> +# Since: 9.2
> +##
> +{ 'command': 'ghes-cper',
> +  'data': {
> +    'cper': 'CommonPlatformErrorRecord'
> +  },
> +  'features': [ 'unstable' ]
> +}
> diff --git a/qapi/meson.build b/qapi/meson.build
> index e7bc54e5d047..bd13cd7d40c9 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -35,6 +35,7 @@ qapi_all_modules = [
>    'dump',
>    'ebpf',
>    'error',
> +  'ghes-cper',
>    'introspect',
>    'job',
>    'machine-common',
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index b1581988e4eb..c1a267399fe5 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -75,6 +75,7 @@
>  { 'include': 'misc-target.json' }
>  { 'include': 'audio.json' }
>  { 'include': 'acpi.json' }
> +{ 'include': 'ghes-cper.json' }
>  { 'include': 'pci.json' }
>  { 'include': 'stats.json' }
>  { 'include': 'virtio.json' }

