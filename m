Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp618676ejb;
        Wed, 1 Feb 2023 06:54:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+N+SWKE7cPiCg5FtYDlLUOJmAT06Mr3iDDldO3UbrO7XlEhsIFCb8XAy9+qoUwlgXizsGh
X-Received: by 2002:ac8:7fcc:0:b0:3b9:bc8c:c216 with SMTP id b12-20020ac87fcc000000b003b9bc8cc216mr1336971qtk.33.1675263267505;
        Wed, 01 Feb 2023 06:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675263267; cv=none;
        d=google.com; s=arc-20160816;
        b=mS1ChA+kOh1wa6ZW/FvI5epdT2nAlO4b23aAQnXenaqseWDZO/h4AH3RDMWw4oKNtf
         Xt0kotEQMdUgg2C33Hjcc7U6kn8ie3VojXttKDv2d+sFlbHxG7mVt6krNlm6opfCsF4I
         cqF2ThRGdxDypgOnk/ZnXWbOFk7a1mBzy2sQdwyf3x03MLO1ZCOI/NcfRhW0YC7plyXb
         3VozFFaqgE3ItgP2FmaFA3m/7+p933vglucrZZ56yUgSckMzkBj4beW/sYYbUKjWqy5C
         M6QXH9kAoG58nx+j48ejqJASmSNEz3qD+veq4GZ02G6ibwh3LRooqG3TDjo5F8k4upvq
         Sv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=rli+7QqLtkD0IltQemu/9idMcsAx9s7XKPRZlDuPyks=;
        b=iqGIa+ZLAgRuzjxR+/XKqYE1NDBWvSegrAB9LPI0rUZeXDvg8IcNKbyC0CTusRD4bk
         72kqRgoRLowOlbV2zOyNohfYSlkPiERtxGBuDgxJxATSHcRKz/DI7Ee5z9Po/ts00HqQ
         4+EiJP6ai8B14vPxq/ZwyfpTeAxE/IkYGNWYUyak495jnTbJzR02TRw4dWuIeducAVmd
         GhInlZvPf/yPw+ijVODbh2uCEx5uf1+TurSLqUtsbUZLu65dQm+kpe1wfnHgf5BlqRBI
         q3mJgvPsn7KfOFQJsPD0eER4FLvhRMi+BTb4yiAtkjiEc72NTb/fQZDVes/zNFtaobk8
         B2xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZbJO0skl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13-20020ae9f44d000000b006feddfc8c14si3078516qkl.484.2023.02.01.06.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Feb 2023 06:54:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZbJO0skl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNEVB-0005ID-IM; Wed, 01 Feb 2023 09:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEV7-0004yS-4j
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 09:54:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEV4-0007mV-Cy
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 09:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675263253;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rli+7QqLtkD0IltQemu/9idMcsAx9s7XKPRZlDuPyks=;
 b=ZbJO0skl50KFbF+J3vZ0aDEQKTxwTdQaVy0VSCla9c81cIObjDXDqkmkTM4KQo0njaw3w1
 e4hDgIsfxTi8jiZ7CrWR+4uE+ubWvvnX/axla17j6BxM+maHHdpo690Hluz4uYnDDsv/gS
 7rbnu+QsEKC7OwbEy/7TdxQM1WY4R6g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-OGMXMw8PPNCh79zXIZzdRA-1; Wed, 01 Feb 2023 09:54:12 -0500
X-MC-Unique: OGMXMw8PPNCh79zXIZzdRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg32-20020a05600c3ca000b003dc0df8c77dso1103432wmb.6
 for <qemu-arm@nongnu.org>; Wed, 01 Feb 2023 06:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rli+7QqLtkD0IltQemu/9idMcsAx9s7XKPRZlDuPyks=;
 b=sAu4uFviFDYswaEEz7ZGOhMN5P5lCBiPonS4xenokSW50tNvfJ6tdTVHoJ+b7TCBkF
 x+XcjtK+Y4/2xGSF0CnQOF7C6ZjENJ2aFm3u+c9rq1p5RiBaFXx9I9vPzc9SSmCqcKG8
 x2QH4gCnrYa5jANHqszDbUtUWzOkzsk6RGMx/bc4UDL5sg8N7Rp1dvuTUzV6KfXGJh+x
 XVXrR04KHYxf56FPuo6irSWjlPtMsl6CxH12BXYddKXTWYmjixYmh+7T2Sx3evMulRTe
 gttjp2ByCV9uaxaENFer+VCR9IWAMjcNBWQuZXjgJNbx7R2430JcA/nSdaHeJqsvDcyb
 B9Ow==
X-Gm-Message-State: AO0yUKUGzJQrlpQzq44PK5canCQKAmGFSujxZ8bk9p2vix42F6hVCcfp
 KyFjGBAIenxZqv3rvpBh27GyRaGoI5Np3/PloBAyWVIXVNucR6tWTfd1ISLWV83YsEOc45p3989
 9p60A3pXJ31du
X-Received: by 2002:a5d:6f08:0:b0:2be:110d:5d59 with SMTP id
 ay8-20020a5d6f08000000b002be110d5d59mr2846012wrb.51.1675263250839; 
 Wed, 01 Feb 2023 06:54:10 -0800 (PST)
X-Received: by 2002:a5d:6f08:0:b0:2be:110d:5d59 with SMTP id
 ay8-20020a5d6f08000000b002be110d5d59mr2845979wrb.51.1675263250584; 
 Wed, 01 Feb 2023 06:54:10 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k4-20020a5d66c4000000b002bdc19f8e8asm17616608wrw.79.2023.02.01.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 06:54:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 04/20] scripts/clean-includes: Improve --git commit
 message
In-Reply-To: <87cz6twldq.fsf@pond.sub.org> (Markus Armbruster's message of
 "Wed, 01 Feb 2023 14:44:33 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
 <87bkmdfrys.fsf@secure.mitica> <87cz6twldq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 15:54:09 +0100
Message-ID: <877cx11lny.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SHth3ZKLnAos

Markus Armbruster <armbru@redhat.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> Markus Armbruster <armbru@redhat.com> wrote:
>>> Juan Quintela <quintela@redhat.com> writes:
>>>
>>>> Markus Armbruster <armbru@redhat.com> wrote:
>>>>> The script drops #include "qemu/osdep.h" from headers.  Mention it in
>>>>> the commit message it uses for --git.
>>>>>
>>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>>> ---
>>>>>  scripts/clean-includes | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/scripts/clean-includes b/scripts/clean-includes
>>>>> index f0466a6262..f9722c3aec 100755
>>>>> --- a/scripts/clean-includes
>>>>> +++ b/scripts/clean-includes
>>>>> @@ -193,8 +193,8 @@ if [ "$GIT" = "yes" ]; then
>>>>>      git commit --signoff -F - <<EOF
>>>>>  $GITSUBJ: Clean up includes
>>>>>  
>>>>> -Clean up includes so that osdep.h is included first and headers
>>>>> -which it implies are not included manually.
>>>>> +Clean up includes so that qemu/osdep.h is included first in .c, and
>>>>> +not in .h, and headers which it implies are not included manually.
>>>>
>>>> I give a tree.
>>>>
>>>> Clean up includes so qemu/osdep.h is never used in .h files.  It makes
>>>> sure that qemu/osdep.h is only used in .c files.  Once there, it assures
>>>> that .h files already included in qemu/osdep.h are not included a second
>>>> time on the .c file.
>>>>
>>>> What do you think?
>>>
>>> Neglects to mention qemu/osdep.h goes first in .c.
>>
>> /me tries again
>>
>> What about:
>>
>> The file qemu/osdep.h should only be included in .c files.  And it has
>> to be the first included file.
>
> Suggest "has to be included first."

Ok to this change.

>
>> This script does several things:
>> - Remove qemu/osdep.h from .h files.
>
> Correct.  Could say "inclusion of qemu/osdep.h"

I try to minimize whatever word that "includes" "includ*" (pun intended).

>> - If qemu/osdep.h is included in a .c file it is moved to the first
>>   included position if it is anywhere else.
>
> Not quite.  The script ensures all the .c include it, and include it
> first.

Oh, then it is easier.

- It ensures that qemu/osdep.h is the first included file in all .c files.

>> - Remove from .h files all include files that are already present in
>>   qemu/osdep.h.
>
> They're removed from .h, too.

Ah, didn't know this bit.

> Sure you want to continue wordsmithing?  ;)

Yeap, I *hate* error messages that I can't parse (or have to read it ten
times before I understand them).

So, we end with:

The file qemu/osdep.h should only be included in .c files.  And it has
to be included first.

This script does three things:
- Remove qemu/osdep.h from .h files.
- It ensures that qemu/osdep.h is the first included file in all .c files.
- Include files contained in qemu/osdep.h are removed form all .c and .h
  files.

Is this better?

Later, Juan.

