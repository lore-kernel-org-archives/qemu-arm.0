Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp261479ejc;
        Thu, 19 Jan 2023 03:41:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs93fjA/YBvKjmaZkElZsiJK+hiuJf7+2EGI63bnDcKeyy+2ZgkLw/Xl0THMdUx3Q4OZP9x
X-Received: by 2002:a05:6214:1395:b0:534:ec6c:ab34 with SMTP id pp21-20020a056214139500b00534ec6cab34mr16167964qvb.7.1674128510093;
        Thu, 19 Jan 2023 03:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674128510; cv=none;
        d=google.com; s=arc-20160816;
        b=nB5bgM3HVWl+bDc9aSD2QIMd0hEA3ZeQJ3B8U1eWgzbI6qSzjFPMU2ZptwuK1cSfqs
         zvQK/cFpAh4MPj+2PBaJzwd8DXdN8VU7jLsL8iGSuOYsIcDBmgRPPtTXzF4PlVR8ak07
         ijhGT8t0APjKFmSuRN1idN+w98bJ7x11qEvN/CWOx6PumdIfdsiTJVkDnke0n+s/I/QF
         6aI74vLF7IGHKPbZga9phV6ezDn3TFOIKhAgGlI5kQFNKUmVCyUvIUm9DznrVxcwdnlT
         1bPtOcnPMD+238uAS6oR3YOHSTTGhfolNmbXv9SsGapJUJ+OVPgFrAOn6hOy57LkfIbk
         Okyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=CmPsP3SGpWPOTwWlj7ijZlZ6iruaUyXHSnd1sesgPfw=;
        b=mmjdIaZ2kzuK0IWkzyciqbLHhrnSLLXxP2/JFcuEkSpyNX4ABi46DbTrn81wohcvus
         mvWItXoQ7Qdw9mFQDxAuV0YlvvP2RjCjKfSVXIms7MtlITK0ei+uJO9c8uJNug7uubus
         Vp9ShIwngCTADQUUVpoYTMWGoMjeLVB9WO/9LZCpxiUAKPm013ylZ/VzmwunE0tfQsrj
         lpaPrOqJuW+HkhOacD4AZ9qmkgfKmEI1xomzggB9BTiP8ocpCX1mzMPkaT9hjDsiowGg
         vTWuSsEdYnds1ECS17I+CePz736mJfPu0TEz7i6alWyJHgaWpgTFqVWsHEa0dubIFGa8
         +CTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PA/nMg0j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a05620a280c00b00704c5cea6e0si23390532qkp.279.2023.01.19.03.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 03:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PA/nMg0j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pITIS-0004Cf-Sw; Thu, 19 Jan 2023 06:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pITIR-0004C8-Pm
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:41:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pITIQ-0006Fv-3U
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674128488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmPsP3SGpWPOTwWlj7ijZlZ6iruaUyXHSnd1sesgPfw=;
 b=PA/nMg0j/1XM6JxR3KlXrqA1VXeFar//Vkv4WTaMMqt9bYsC9gJ+u4sGpjmH4+PZqyGESC
 TBswNU+cMAxf1h/zMtVvPgS3lC+IJUV4OJN3Gt02JptZXyubgYqetmmwQ6+wfK/mZgST2W
 S8wjtgD9ttjoWzSO9/6jQrQ1vJ7kGU4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-trcBebO8OVy3wISNSwH_cw-1; Thu, 19 Jan 2023 06:41:27 -0500
X-MC-Unique: trcBebO8OVy3wISNSwH_cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A3181C05148;
 Thu, 19 Jan 2023 11:41:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95A082026D68;
 Thu, 19 Jan 2023 11:41:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A9A221E6A28; Thu, 19 Jan 2023 12:41:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 peter.maydell@linaro.org,  alistair@alistair23.me,  jasowang@redhat.com,
 jonathan.cameron@huawei.com,  kbastian@mail.uni-paderborn.de,
 quintela@redhat.com,  dgilbert@redhat.com,  michael.roth@amd.com,
 kkostiuk@redhat.com,  tsimpson@quicinc.com,  palmer@dabbelt.com,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-17-armbru@redhat.com>
 <a25d449f-ceb5-54d8-ad07-9e6517d6e016@linaro.org>
Date: Thu, 19 Jan 2023 12:41:24 +0100
In-Reply-To: <a25d449f-ceb5-54d8-ad07-9e6517d6e016@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 19 Jan 2023 11:40:06
 +0100")
Message-ID: <873586u4yj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: ELhQeMSKd2Dm

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 07:59, Markus Armbruster wrote:
>> This commit was created with scripts/clean-includes.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]

> Up to here:
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>> diff --git a/util/async-teardown.c b/util/async-teardown.c
>> index 62bfce1b3c..62cdeb0f20 100644
>> --- a/util/async-teardown.c
>> +++ b/util/async-teardown.c
>> @@ -10,16 +10,12 @@
>>    * option) any later version.  See the COPYING file in the top-level d=
irectory.
>>    *
>>    */
>> -#include <stdlib.h>
>> -#include <stdio.h>
>> -#include <sys/types.h>
>> -#include <dirent.h>
>> -#include <sys/prctl.h>
>> -#include <signal.h>
>> -#include <sched.h>
>> -#include <unistd.h>
>>=20=20
>>  #include "qemu/osdep.h"
>> +#include <dirent.h>
>> +#include <sys/prctl.h>
>> +#include <sched.h>
>> +
>>   #include "qemu/async-teardown.h"
>
> This file has more changes.

I'm not sure I understand.

The patch does two related things:

1. It puts qemu/osdep.h first.  The diff makes it look like we leave it
   in place and move other stuff across, but that's the same.

2. It deletes inclusions of headers qemu/osdep.h already includes:

    <stdlib.h>
    <stdio.h>
    <sys/types.h>
    <signal.h>
    <unistd.h>

What would you like me to change or explain?

