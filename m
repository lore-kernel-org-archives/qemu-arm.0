Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1340346ejb;
        Fri, 3 Feb 2023 04:34:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+whmpuBG7GY513dSYS+le+vmqod9rlynfLOCeSm7M1pWMfjCq3kqumQdurING5lCMffsiq
X-Received: by 2002:ac8:590b:0:b0:3b9:b6c8:6d7a with SMTP id 11-20020ac8590b000000b003b9b6c86d7amr18317729qty.29.1675427662963;
        Fri, 03 Feb 2023 04:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675427662; cv=none;
        d=google.com; s=arc-20160816;
        b=Nqr6HBWeEsRCk8l1uCo0EWMXIDSf2jiZI+HOf4+6R31hlJnxCqPrbC7hz3/cmucJcC
         mC1vpfQJzgptjq8gz1qE4pnvmVVbW/LrUbAv5ej1uUAf/tyUY0jfEc4NMGx20JeTgB2k
         amsXnJkhEN3N6b+3YAMiEgOKOVHPp1R5UMMwEN5gMwfFpJsg5zzFh/g5uqYJ7YAF2vVj
         MKMDKl4HgDrs8o3gxTGn8JuiwuUnt+8YpBDjYLNcph6K7MX/52stYPq7Ydqqf3pGBeZr
         JXF6sZpBBXideYE9YaC31TcbfUgEtctm51d4gESE+Zo1cz1mRdtOPAlrgjSmK+eSjpoC
         f5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=up0ne8COrAE42tEysraXT2ttxJdIz31866hjTGa8KpA=;
        b=e+48ixThXBql5cPl6fWEFhn1bZAfrosMthBqUldPL3jJ7HeBGb8v1uUkHJup9fSmgE
         U4SJPD9608fYZVpGs4z7DqjAxOEV0tVS+4piKSKyAlN3dvi79Vr3fv9M/xxs5/BtFI7j
         R2fb6C6ZaV7Frqjm/e1/U6zLkG0nXhiqljDM6S2gnJ2R0MZpR+E1nCdf9v57DvCb2uwH
         Qg1FRDThsf6C4RC6lSgEE8UBKMG4/UDUOrxVVggw0yHFU+j7u8YlIZJxlmH42c3Gk/Am
         KV+JkR2julIvkav4idjCyVMf+Gw5i8saGfRyRntvhxzMK6a9wjpod66aPLC+g5yC/VJ1
         +E1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OIMLUuEd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144-20020a370a96000000b007210a2509c3si1877155qkk.4.2023.02.03.04.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 04:34:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OIMLUuEd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNvGI-0001Zu-7i; Fri, 03 Feb 2023 07:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNvGB-0001Tj-Jq
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 07:33:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNvG9-0001xP-U2
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 07:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675427620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=up0ne8COrAE42tEysraXT2ttxJdIz31866hjTGa8KpA=;
 b=OIMLUuEdBmLnViEzrlh8CMT5SW+dscV4dzcHaWBnvr2UC0hcpn5uje9RnNgAA+49+4Veze
 qzZypf7zRJK+Ve5wIkYozStDm13bIGiRmakhdwYPyxow10o2LQZo0/mIJeSEDeKeHadZUV
 9zdo4Y6c9IhnRuCzPAJ3jU3A2ABJPX8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-Z5LFGru4PEiFb_qzw0U4OA-1; Fri, 03 Feb 2023 07:33:35 -0500
X-MC-Unique: Z5LFGru4PEiFb_qzw0U4OA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AD09101A521;
 Fri,  3 Feb 2023 12:33:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A9018EC5;
 Fri,  3 Feb 2023 12:33:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79A1B21E6A1F; Fri,  3 Feb 2023 13:33:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 5/9] hw/usb/hcd-ohci: Include missing 'sysbus.h' header
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-6-philmd@linaro.org>
Date: Fri, 03 Feb 2023 13:33:33 +0100
In-Reply-To: <20230203113650.78146-6-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 12:36:46
 +0100")
Message-ID: <87edr7c4iq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5gLHF9zVi7s/

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Avoid when including "hw/usb/hcd-ohci.h":
>
>   hw/usb/hcd-ohci.h:100:5: error: unknown type name 'SysBusDevice'
>       SysBusDevice parent_obj;
>       ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/usb/hcd-ohci.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
> index 11ac57058d..e5e6b434fd 100644
> --- a/hw/usb/hcd-ohci.h
> +++ b/hw/usb/hcd-ohci.h
> @@ -21,6 +21,7 @@
>  #ifndef HCD_OHCI_H
>  #define HCD_OHCI_H
>=20=20
> +#include "hw/sysbus.h"
>  #include "sysemu/dma.h"
>  #include "hw/usb.h"
>  #include "qom/object.h"

Reviewed-by: Markus Armbruster <armbru@redhat.com>

