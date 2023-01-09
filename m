Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2199696ejc;
        Mon, 9 Jan 2023 04:13:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtm2tcw1vlXxaRscIu2fLNF846l3KpFUtFot1u5ennd4beOITrwaHrrI8W5SQsM3IobsY+4
X-Received: by 2002:a05:6102:50aa:b0:3d0:af13:3ae with SMTP id bl42-20020a05610250aa00b003d0af1303aemr613730vsb.17.1673266379989;
        Mon, 09 Jan 2023 04:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673266379; cv=none;
        d=google.com; s=arc-20160816;
        b=uIgeRdOwF29b32+xTmg2RYEHWYyZP8ZXTwLJ0GmnlcMaHN+vJmDeMTtqzN41bwwYP5
         XjEjw6av+6xF9nh7z1Zoq+dM5WEkYYRiIXEyQtpDN3J3J2NokmjObAkA3viu6r5p8Mu/
         PZmy2WkyPnPJKZTpCMQXFQ5SXz0FgGstwyfuGZ8z+r2iBbP0AOpkejZcE+kPzDJPf85h
         2eHqnhyvc8xY2yAN2BFmJ6c1YLKOk5ZQNr34ad3b1Jiwv9+vYGiKjiLVCw9uVJ/hguIt
         kirjx4xIsy+VBF0F4o7iqJizIkfcn0fzK1GvkGlTj5zSncImca833hCk2XehslwdQPmb
         QGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=TclbkyhSX21Sa2KCTCzGt6PcChwfW7SrUYi93nNWHac=;
        b=tqi/kH4z+OYR5H9kh2325Jnpujt+SOl3/txaO/uFgey4PMQnHkHFfKnuhAftNk+6sk
         hOftZesqmuis/gU2dxV+EJ8a9Q2rZpu0MVZlHvbpQC1+Xhl1snbQzxZvMSrkQBXvY2lQ
         yRryldxakLlvGkBt3E2Rm7wb+xvsZUohh1rI92Je8SqB52uDh2BQmznBn0qFbsDFkFAO
         z1UxxKngqC5fcL4yPwiUli8OljP1u8afMRFnXyIed3ZrosyMglizEuzz1SX+cweR18aa
         u0gFVc4ixSnHK4tlqhxp1b/mNj/zSKhBCmOxr2PObAV4vnIR9WmYpzkfAf+duPYW7ifn
         kklA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VFX3oE1S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16-20020a37f910000000b006fbb4b98a17si4292457qkj.222.2023.01.09.04.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:12:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VFX3oE1S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqqV-0005bn-ID; Mon, 09 Jan 2023 07:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pEqqS-0005a9-Ec
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 07:01:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pEqqP-0001nR-Fs
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 07:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673265696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TclbkyhSX21Sa2KCTCzGt6PcChwfW7SrUYi93nNWHac=;
 b=VFX3oE1SVhK9Ensqi85YmgFlEZURWub+aJkCH/Dd6J1w3AczINGbYEfRgnZO8BrAwVSl0O
 9gZLf+WdqHhr5K86ycgwprAE99xi9YzMST4WvVghh0h3b5L+KFFpX/A6gp5PWMnwysD6iR
 Chs6sc2kT6pg9PRpG8YOz1leSg/XjcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-qs0PPn3tPlS0juzuVCqIkg-1; Mon, 09 Jan 2023 07:01:32 -0500
X-MC-Unique: qs0PPn3tPlS0juzuVCqIkg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E6411869B72;
 Mon,  9 Jan 2023 12:01:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7CE492B01;
 Mon,  9 Jan 2023 12:01:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79D7021E5DCF; Mon,  9 Jan 2023 13:01:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,  mst@redhat.com,  imammedo@redhat.com,
 ani@anisinha.ca,  peter.maydell@linaro.org,  laurent@vivier.eu,
 edgar.iglesias@gmail.com,  Alistair.Francis@wdc.com,
 bin.meng@windriver.com,  palmer@dabbelt.com,  marcel.apfelbaum@gmail.com,
 yangxiaojuan@loongson.cn,  gaosong@loongson.cn,
 richard.henderson@linaro.org,  deller@gmx.de,  jasowang@redhat.com,
 vikram.garhwal@amd.com,  francisco.iglesias@amd.com,  clg@kaod.org,
 kraxel@redhat.com,  marcandre.lureau@redhat.com,  riku.voipio@iki.fi,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,  qemu-ppc@nongnu.org,
 crwulff@gmail.com,  marex@denx.de
Subject: Re: [PATCH v2 4/4] docs/devel: Rules on #include in headers
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-5-armbru@redhat.com>
 <3400786A-51BD-43D6-A6E4-4EE0A91D1C4E@gmail.com>
Date: Mon, 09 Jan 2023 13:01:27 +0100
In-Reply-To: <3400786A-51BD-43D6-A6E4-4EE0A91D1C4E@gmail.com> (Bernhard
 Beschow's message of "Fri, 23 Dec 2022 10:47:39 +0000")
Message-ID: <87ilhfq5m0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
X-TUID: wWjnPX0YP3GA

Bernhard Beschow <shentey@gmail.com> writes:

> Am 22. Dezember 2022 12:08:13 UTC schrieb Markus Armbruster <armbru@redhat.com>:
>>Rules for headers were proposed a long time ago, and generally liked:
>>
>>    Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>>    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
>>
>>Wortk them into docs/devel/style.rst.
>>
>>Suggested-by: Bernhard Beschow <shentey@gmail.com>
>>Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>---
>> docs/devel/style.rst | 7 +++++++
>> 1 file changed, 7 insertions(+)
>>
>>diff --git a/docs/devel/style.rst b/docs/devel/style.rst
>>index 7ddd42b6c2..68aa776930 100644
>>--- a/docs/devel/style.rst
>>+++ b/docs/devel/style.rst
>>@@ -293,6 +293,13 @@ that QEMU depends on.
>> Do not include "qemu/osdep.h" from header files since the .c file will have
>> already included it.
>> 
>>+Headers should normally include everything they need beyond osdep.h.
>>+If exceptions are needed for some reason, they must be documented in
>>+the header.  If all that's needed from a header is typedefs, consider
>>+putting those into qemu/typedefs.h instead of including the header.
>>+
>>+Cyclic inclusion is forbidden.
>>+
>
> Nice!
>
> I wonder if these should be bullet points like in your mail from 2016. I found them crystal clear since they looked like a todo list for review.

I tried to blend my change in with the existing text.

> Feel free to respin. Either way:
>
> Reviewed-by: Bernhard Beschow <shentey@gmail.com>

Thanks!

