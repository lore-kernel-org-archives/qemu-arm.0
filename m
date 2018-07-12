Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1552734wrq;
        Thu, 12 Jul 2018 09:17:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcVwrvufwNuFAPilerUqjDY9uUFQ+9WWKqZO96l4zoPUXEg4ForLYA1eoxCB1YKV+srHMcM
X-Received: by 2002:a0c:f611:: with SMTP id r17-v6mr3135367qvm.103.1531412226734;
        Thu, 12 Jul 2018 09:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531412226; cv=none;
        d=google.com; s=arc-20160816;
        b=apyyBbvN0VufUdDIIoVnnBOlMzWfdUEDOltFFRqK9bea7xCe/Q5XTJdNfSf7rwm9Q3
         Q2Iea72LrXafr/5sdchOMy7BayYTMR7GK5UxxEjrnI86Im39BdGJguwBKOXFoWpyOvm+
         BwgUj9e25CU+FBS8TUopmeMYHpoqJ38CSAUO4jymjkAn0CteM34uUpwirM4C4AmPAKfF
         98uxx2TIqC+4p/HQzjzkRDx/S72qcGLPj9VuY6+D4+rvEF1+9iz2WXqW3Ze2H2EJrU4n
         AJYzwfm6Gblj73/hXo6743PPBwsrtTWoQoMzUi9FiomH/IlDZbpE8qLRuuNIbM7M6ssh
         1srQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=LHccKoNWfds0FlagWn3Ac/5nuRv0L9ewqUEkTAQobHE=;
        b=qthoyAKLsKYjt37n7GeSvL21+I5D9z8wYLY5NrSc3MmB7NNhfqBHxUz3V30eax7KIJ
         vHp5oRalIqMIs2tPDVReycIZ6Qc+UzLMKVNLBjx6v/XoPDAWx5S3PELmuavwNONBGSn+
         uebFww5XeacXhUNiznFTdu5m+IeJ1nOWqwYFPz5dvueo4MgSkcl0wsrrnX86SF+aPiez
         0A8OmnoqJ+U3P987xlaZNB7NZTKAJ12NkF/MrQBxQRtZaao/Wbe8bo1wei4scb/J7OvM
         zxyLa4kPOE+mEqoatLaaRltf2CUY8pUWcrUsAcpD06sqs3vZvM9SKvN9ptUeY7vY3sGY
         ugXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132-v6si10540715qke.202.2018.07.12.09.17.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 09:17:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdeHC-0004et-97
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 12:17:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fdeGz-0004dp-1g
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fdeGv-0002Af-3c
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:16:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54038 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fdeGu-00026n-Uy; Thu, 12 Jul 2018 12:16:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6894B72632;
	Thu, 12 Jul 2018 16:16:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-125.ams2.redhat.com
	[10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 299FC111AF0E;
	Thu, 12 Jul 2018 16:16:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DE63311385D6; Thu, 12 Jul 2018 18:16:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
	<20180711161216.GV7451@localhost.localdomain>
	<CAFEAcA-3aBQPwiwDfZSjspiwv4L-U0LXBKaOQ2m+=OzhqRq3OQ@mail.gmail.com>
	<87y3egmzem.fsf@dusky.pond.sub.org>
	<6cc1c007-4bdf-2b8c-b0b0-d32979a56ecd@redhat.com>
Date: Thu, 12 Jul 2018 18:16:40 +0200
In-Reply-To: <6cc1c007-4bdf-2b8c-b0b0-d32979a56ecd@redhat.com> (Thomas Huth's
	message of "Thu, 12 Jul 2018 17:25:20 +0200")
Message-ID: <87muuwo2dz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 12 Jul 2018 16:16:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 12 Jul 2018 16:16:42 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/bcm283x: Fix crash with
 device_add bcm2837 on unsupported machines
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mRTVodJbVIUd

Thomas Huth <thuth@redhat.com> writes:

> On 12.07.2018 14:06, Markus Armbruster wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> 
>>> On 11 July 2018 at 17:12, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>> On Wed, Jul 11, 2018 at 09:21:48AM +0200, Thomas Huth wrote:
>>>>> Hm, ok, so how to continue here now? Shall we at least mark the
>>>>> bcm2836/7 devices with user_creatable=false, so that users can not crash
>>>>> their QEMU so easily with device_add? The problem with introspection via
>>>>> device-list-properties would still continue to exist, but I think that's
>>>>> less likely used in practice... otherwise we could still move the
>>>>> qdev_set_parent_bus() calls to the realize() function instead, and just
>>>>> add a big fat FIXME comment in front of the code block, so that we
>>>>> remember to clean that up one day...
>>>>
>>>> Crashing device-list-properties should be a blocker bug, IMO.
>> 
>> Seconded.
>
> Well, maybe I should then not suggest to add a hmp("info qtree") below
> the hmp("info qom-tree") in test_one_device() of
> tests/device-introspect-test.c ... otherwise we'll be quite busy in the
> next weeks...

If we can't fix these bugs in time, we can bring back
cannot_destroy_with_object_finalize_yet, as Eduardo mentioned upthread.
Would be sad, but sad beats crash.
