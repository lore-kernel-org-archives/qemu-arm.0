Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1198521lfp;
        Mon, 18 Jul 2022 02:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJgdCdCHIICy8mIuiynB9nKpMtsRuWa/56gqiDuejjp+z7dWIu0vxMyg8YiQEbQqKMq9HV
X-Received: by 2002:a05:620a:2710:b0:6b5:bf24:10e9 with SMTP id b16-20020a05620a271000b006b5bf2410e9mr14345253qkp.28.1658137095742;
        Mon, 18 Jul 2022 02:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658137095; cv=none;
        d=google.com; s=arc-20160816;
        b=QjFQyAtIj7msUfnQATV17iMS9d/oyXEor7Zkyd+wGCMaSomtaTS4yg5l0T7ILziUb3
         EEZ8LazFiQPhwvkl8OP9Sexzlabp+PdQYMnFzZvnWZs++YUMJz8Ihc6D0mcjGjsQ1s1p
         P9n1DA+C59MQDM1/Z0bB/61XXwspZBy5A+jCsWe2Z0KP4aR+/9rXAMnDsKU2aumh1zTp
         K9y5bzFHRg/gsa2L5V949jwfxCNbey9GlCSqIvtNoqjURRfl844rvhRMilzetxdfRw9M
         9CNtZ/KKYo2DzGmd5pM4QvUDhL1L6ngIb3gj21UY6KuVLVtJYCEodI0oLLe4fPI79NK6
         D4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=H3v2e8Jp7vx8byr7yaGVn6uh217rPVjazrIKd6pdhk8=;
        b=EQlMnXLVdVsP1pc1h/h4HQPHS09tJBe9rBJSJljXrLz/Lrs44AX8aX/VtDaa/1hpLc
         01oZSdO4gSzk4e5M9OHDrKrT62m3qxW6JOWjj3Au/fVfWhwySp0yBN5l8kVo3CJfdV8n
         lKBvMvSCaQUJ4aed7Uev/Se4qnUib4RfO06/sEImAh/YaiRWbbvvUk8mnfoToiOkIpo+
         dgnR0RmaCb6tfZZW/eGx2EOO7l11lu70W3YhOGyCTnig8luBiLUzZZpaQUhrkgTZSp1J
         EFR1xltOGeBhxNoM9ChjrT2K8VsIm16eppLLBv9xW78szccs3mggJEmcCMsM1mJ6Enzn
         zHiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P7YSE8I5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh3-20020a05621429c300b004738378abaasi5551413qvb.74.2022.07.18.02.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 02:38:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P7YSE8I5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNCh-0001uZ-9t
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 05:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oDNCN-0001tb-BO
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oDNCK-0001AR-G3
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658137071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3v2e8Jp7vx8byr7yaGVn6uh217rPVjazrIKd6pdhk8=;
 b=P7YSE8I5xm1kG0BXXoeZPZmy7NDtfTGZlKy/BykodVrbHu5u9UsiwWTt1MhAMW5SA2B2z5
 YBQf5hPb7LuFHUQNA29fluqrzfTYQuyNjgfg22vyckPplmRziIgBqHYGzmwdTJ//2sjkUN
 +9fUxfSCdhXJLZ/kX4ayPfLAb5GVXQg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-Z9hdHf9DNnmlvuUEMXzJUQ-1; Mon, 18 Jul 2022 05:37:39 -0400
X-MC-Unique: Z9hdHf9DNnmlvuUEMXzJUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E7FF8032E3;
 Mon, 18 Jul 2022 09:37:39 +0000 (UTC)
Received: from localhost (unknown [10.39.193.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92CF82166B26;
 Mon, 18 Jul 2022 09:37:38 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, David Hildenbrand
 <david@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] target: RFC: display deprecation note for '-cpu help'
In-Reply-To: <30e66f70-a004-6789-d66a-351becaa48e2@redhat.com>
Organization: Red Hat GmbH
References: <20220714150735.1835166-1-berrange@redhat.com>
 <30e66f70-a004-6789-d66a-351becaa48e2@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 18 Jul 2022 11:37:35 +0200
Message-ID: <87wncapxr4.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UHiiqt6itKTZ

On Mon, Jul 18 2022, Thomas Huth <thuth@redhat.com> wrote:

> On 14/07/2022 17.07, Daniel P. Berrang=C3=A9 wrote:
>> $ qemu-system-x86_64 -cpu help:
>> Available CPUs:
>> x86 486                   (alias configured by machine type) (deprecated=
: use at least 'Nehalem' / 'Opteron_G4', or 'host' / 'max')
>>=20
>> I wonder if this is too verbose, and we should just do a
>> concise flag like approach, similar to QMP:
>>=20
>> $ qemu-system-x86_64 -cpu help:
>> Available CPUs:
>> x86 486                   (alias configured by machine type) (deprecated)
>>=20
>> leaving the full message to be displayed at runtime ? I'm slightly
>> inclined to the simpler more concise output.
>
> I'd prefer to keep it short here and just write "deprecated" without the=
=20
> reason. Otherwise this will overflow the lines and break the readability =
of=20
> the output. And it's also what we're also doing for "-machine", e.g.:
>
> $ ./qemu-system-ppc64 -M help | grep deprecate
> taihu                taihu (deprecated)
> $ ./qemu-system-ppc64 -M taihu
> qemu-system-ppc64: warning: Machine type 'taihu' is deprecated: incomplet=
e,=20
> use 'ref405ep' instead

Ok, following what -machine does is certainly a good point.

Is it easy enough the figure out the deprecation note? I think you
either have to actually start something with the deprecated entity, or
use qmp (which is not that straightforward)?

