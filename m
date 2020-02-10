Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4044511lfp;
        Mon, 10 Feb 2020 08:45:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyb7cQrMj8Npwyd/GVpASq2ok2xCiLsTN9YniQu2Tc0ipN1q2kiI8T9Kmyhz8CVhNJ0/+Vp
X-Received: by 2002:a05:620a:ce5:: with SMTP id c5mr2150566qkj.49.1581353109923;
        Mon, 10 Feb 2020 08:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581353109; cv=none;
        d=google.com; s=arc-20160816;
        b=xjiLQCNFy4S8CN3cK5TbnIThyxfe3Rxsg7G5bqRSW+Gy7KfxqBWgjY3xA/UklFi1aJ
         tnx0Owv0yEllU3n379rychuYw7FM7iLvvFh7qKihaXdnUHvkn7VCrJRZwSN1NFnbFe7A
         JM3kOYqEdHAZjJLmJGyPj5FvCnt11j5uJdjTqdQ+kqfls4nfwaDR3fQqgO9GIxCiBBvG
         MoN/ucA9bdHiRUW2zgigsmrb9b/QjFLDfs+KFu3HckW5NS/DLmwf54J6qfS0KltQlZOx
         wCZ15sAKjqowl1DslShED3XtaQbyAYwlzsJJe4GmCixIZKiJFvL8m0Kgoqcvf+AOQOwJ
         xHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=vV4eGTWFc+JudZUEnauQlSTCA8p35uJtX0Dklx+ttrk=;
        b=fh30qgwBxlSIg+DxZ1bM8pbQNGdTbVTHSqL0sI4lRJuoq0ygwbYO/5AGpWQQxY2o0z
         CjEyYB+JPeROn3xzbUfJ0AoSI50G2oU4Tnlrlpr5CDZvOOQSqyyqszuZiZK41JMGAnQ8
         YeroV3tl8Fgz/nLpANmboHeH7X8XXOuzX99ImU+i4j7mse127xTmVCtIVZ1OvkDaVga2
         7wDm3NNjwcrF0J9Q61HJIQ7PQnpfhItJaGmewiCQ0cL5lW1ZdtKZHFiyiWGRNgnj8AB/
         Q0LBOgL2yMRBW0exLeFJrQl8L6a1v8tIu8DQ0e71FZJXgh0CRhBu9yQSSE32OWLS1fHj
         MSRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O7HGYSmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w136si391689qka.165.2020.02.10.08.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 08:45:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O7HGYSmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1CBJ-0005eU-CS
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 11:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j1CB5-0005cO-Kc
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:44:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j1CB4-0000NS-J8
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:44:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41601
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j1CB4-0000Mq-Fk
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581353094;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vV4eGTWFc+JudZUEnauQlSTCA8p35uJtX0Dklx+ttrk=;
 b=O7HGYSmmprHl91yQBX0L/OB41C3HbKsRcCyj6rnbNnZvNlJVi7J7zmAzvidPc7SghrEhxO
 doZB2W0o88yx41cEXC05mUL2gfKNpDDbxa1JbGljPx+l/gCcgdIE2gxEBIceobQ7F2L/2x
 WG66ZACAr3IXsJZoMpTeWRmhJYQ0Ang=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-TPZjxvRtNGCfDg9wDmtWZA-1; Mon, 10 Feb 2020 11:44:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92567107ACCD;
 Mon, 10 Feb 2020 16:44:50 +0000 (UTC)
Received: from redhat.com (ovpn-117-6.ams2.redhat.com [10.36.117.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4959B60BF3;
 Mon, 10 Feb 2020 16:44:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v12 12/13] virtio-iommu: Support migration
In-Reply-To: <6a276f9d-18a3-300b-c55f-00665d30b34f@redhat.com> (Auger Eric's
 message of "Mon, 10 Feb 2020 14:36:56 +0100")
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-13-eric.auger@redhat.com>
 <87eev27hby.fsf@secure.laptop>
 <c8df42d0-c913-94e3-39a0-1e09fa459622@redhat.com>
 <6a276f9d-18a3-300b-c55f-00665d30b34f@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 10 Feb 2020 17:44:40 +0100
Message-ID: <8736bi75on.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TPZjxvRtNGCfDg9wDmtWZA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 mst@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, dgilbert@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUU4sWOv1Mwu

Auger Eric <eric.auger@redhat.com> wrote:
> Hi Juan,
>
> On 2/10/20 2:09 PM, Auger Eric wrote:
>> Hi Juan,
>>=20
>> On 2/10/20 1:33 PM, Juan Quintela wrote:
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>> Add Migration support. We rely on recently added gtree and qlist
>>>> migration. We only migrate the domain gtree. The endpoint gtree
>>>> is re-constructed in a post-load operation.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>
>>> And yes, this is as confusing as it can be:
>>>  a tree of mappings (i.e. key,value)
>>>  a list of endpoints
>>>
>>> I will propose this as most complex structure migrated ever.
>> :-) Thank you Juan, Dave, and Peter for your support
>
> I did not notice this at the first glimpse but could you send the R-b on
> the v15. I have been running like a hamster on my wheel during last week.
>
> Code has not changed though :-).

Sure.

Later, Juan.

