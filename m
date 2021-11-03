Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4585058lfv;
        Wed, 3 Nov 2021 03:05:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQMniqp2CXc36iQKQxfAAYzkQpy9lOlh/iVcO0+xlkIiF0cfdEw7BcQdH3WWCVvE3oLcYC
X-Received: by 2002:a05:6830:923:: with SMTP id v35mr15422387ott.116.1635933957402;
        Wed, 03 Nov 2021 03:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635933957; cv=none;
        d=google.com; s=arc-20160816;
        b=bqGgU11D/VBkvPiA5D0xjuVyfsNlJB3D+lJm5asCCiw0flgSFppwJYe2BLOyl5nGqu
         ZeR7fzVHc6JALaTIwCO8/debTcspywyavZukq2Qs7pOpgqprLZWTz/QoOTerVzWOQxWn
         YYYsCFxpEBA/+HdEwtatShaKLjCMmo5uuLuQAN4fOElqKv4bK61NvygOral4u2Nq4UST
         V2puEeP1JgtIqnXjohgOKTfEGptBhiFXSWMJWL8saLpFgI+Oz99+Y/KXjVuDvSDuuaQL
         cSush8pM4TWWh2oLnAJFi/9T1O42/xJ7ZsERgFNAhsy0055S7d/NmRmLxe4ADrKp6G2E
         4r+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=X3SUb7Fjdwor15ZACjqiHIn3lB4/XFopZGF4O6nL4Po=;
        b=MWb6DScRjy2LNu0yfXdOinygytHEwVPGd4OnO5d/S7vdbONRaufq2Kt1uS0rDmgeIr
         D7qYByw2R5QjBILjfzK0nM2YZwHy7GCQ0OHiQRif+8etdl+20mqplmFNwsPPOyK3C6Ig
         WJbbi9grJ+lL6JCGLCn3MuZqcWEf84Z3iKNl+8LY7/NBbN1B7FzpATlVKk6sYOlRRdHs
         VNcqG/fazr5UUAw1jOlI37sFVt6UF2UK4hglp6OEyVJTL0gFkZ+dtCSEVwy7OEeMg2mB
         bHiStKGUtURtJnwd3RCGsZ4F3shqp6AeKldSwY/bltXsgua+HGYUpBShEuD3eYoeyq+t
         FKLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fguIjCBe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si1861077oia.92.2021.11.03.03.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 03:05:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fguIjCBe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miD9Y-0005gS-MT
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 06:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miD7t-0003TI-4c
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miD7r-0006Ri-G0
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635933850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3SUb7Fjdwor15ZACjqiHIn3lB4/XFopZGF4O6nL4Po=;
 b=fguIjCBeB3w17gTVQFKpIsJyHUIImhKVrfCtsNjmJ9dcMRCo4r8sylAiW56EOQY0lUF9hS
 GGce6imbnaH9KJOm3eYOkw+Y++nwnW3+cj6sGo+ihZvaV7LnOrEbWiY2kFuT2Po+uIz+4i
 g4nsmT13vp8MBQ90uF+QHIL8VK5ysp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-4fC5r-JOMW6gQF1cuY-MaA-1; Wed, 03 Nov 2021 06:04:07 -0400
X-MC-Unique: 4fC5r-JOMW6gQF1cuY-MaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F7AC100CCC0;
 Wed,  3 Nov 2021 10:04:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D118D7086C;
 Wed,  3 Nov 2021 10:03:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D8CF11380A7; Wed,  3 Nov 2021 11:03:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 2/3] hw/smbios: Use qapi for SmbiosEntryPointType
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-3-ehabkost@redhat.com>
Date: Wed, 03 Nov 2021 11:03:51 +0100
In-Reply-To: <20211026151100.1691925-3-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Tue, 26 Oct 2021 11:10:59 -0400")
Message-ID: <87y265imig.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel
 P. Berrange" <berrange@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathi?= =?utf-8?Q?eu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M8HtIHVnldzU

Eduardo Habkost <ehabkost@redhat.com> writes:

> This prepares for exposing the SMBIOS entry point type as a
> machine property on x86.
>
> Based on a patch from Daniel P. Berrang=C3=A9.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---

[...]

> diff --git a/qapi/machine.json b/qapi/machine.json
> index 5db54df298f..0a13579275f 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1411,3 +1411,15 @@
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
> +
> +##
> +# @SmbiosEntryPointType:
> +#
> +# @32: SMBIOS version 2.1 (32-bit) Entry Point
> +#
> +# @64: SMBIOS version 3.0 (64-bit) Entry Point
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'SmbiosEntryPointType',
> +  'data': [ '32', '64' ] }

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

