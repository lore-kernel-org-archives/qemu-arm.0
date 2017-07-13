Received: by 10.25.44.15 with SMTP id s15csp2515227lfs;
        Thu, 13 Jul 2017 11:25:35 -0700 (PDT)
X-Received: by 10.55.99.85 with SMTP id x82mr6785386qkb.62.1499970335374;
        Thu, 13 Jul 2017 11:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499970335; cv=none;
        d=google.com; s=arc-20160816;
        b=Hdk2AabAot4CwmO9xUvfuXUbubo2UXwCbUL3PP+FaMA3RbgUz1++XA0iLqoCbMev0h
         dFklfsQMoBHs3NjCBdk1IEACZ8pasiQ24iY7KYuyy5SefpnJVekDAcfnRfwEgATePPbv
         DZLnzEedszv5jCYhxv9s6ptUC8ZCsgJvyddsaBhyPa3wWWDE5G8q8/ATWic/0HCLMEBB
         VvigjUWWTPvSDSqtwgjlBB+ff7R/edFbuQqMQkSHhLbL/eUzbKKk7OoCJlrKL+5Eu1Wz
         FIvLONlF0H8SFXaqtwVUqWmTa95RCyQux2TZoFJzQxvGq65tU/IobMfhP+LHEs3RpKeh
         /nHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=evXFvOqm1uNyvotsKp8m9aZ9hedDG2Dr5Jkx5Mnj+eM=;
        b=q098ejFMPFtGolMZ0boOKylG0K1Sgq/UmhHwrgxXxz0/rTq4b9/9p47ZKc08e0b+zl
         01mGi9QZp8Bc9uRrUKdhu2GVvYr/MQl3tTTwL+PsdZ4r4unOL8WwIZ5U+WT0mgMN/y9m
         6q8tl2GHUbztjDjsxNKRAM2rvtkWeBh2KUgGU+sZNPVEpqEdkYLN6ISEXhphL3xhreKq
         2gLfrweazR/bCs5TZWJ8EK68ZTvNYfND2+AhucZSKIP3i8orO6oPTjZysS1eubKzvZ5/
         mc9aeqVqRII+BFBHUk2azU34841ak2qcNYIET7vOrPRIh7KDpPv9SJ0P/MGiwPaPhzY+
         L9kA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83si6088039qkh.270.2017.07.13.11.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 11:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVins-0003kN-OA
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 14:25:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVinf-0003Yd-Vi
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 14:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVinb-0005oh-7L
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 14:25:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59880)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dVina-0005nu-Mq; Thu, 13 Jul 2017 14:25:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7721A7EBD7;
	Thu, 13 Jul 2017 18:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7721A7EBD7
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7721A7EBD7
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5B1817AE6;
	Thu, 13 Jul 2017 18:25:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0FBFE1138645; Thu, 13 Jul 2017 20:25:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
	<87lgnt99xz.fsf@dusky.pond.sub.org>
	<CAFEAcA-oEZZgPDOayLpZ1_aC0hEeOcYBL3+XejtJXnt4wDyqow@mail.gmail.com>
	<87d194xnyp.fsf@dusky.pond.sub.org>
	<CAFEAcA-XrYnnzH58LkyObyJH-eGuEHK-BuQkRjwFbZmMr1oeXQ@mail.gmail.com>
Date: Thu, 13 Jul 2017 20:25:10 +0200
In-Reply-To: <CAFEAcA-XrYnnzH58LkyObyJH-eGuEHK-BuQkRjwFbZmMr1oeXQ@mail.gmail.com>
	(Peter Maydell's message of "Thu, 13 Jul 2017 18:18:06 +0100")
Message-ID: <87bmootcs9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 13 Jul 2017 18:25:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] qdev: support properties
 which don't set a default value
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NPfev7+Q/b13

Peter Maydell <peter.maydell@linaro.org> writes:

> On 13 July 2017 at 18:10, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On 12 July 2017 at 12:22, Markus Armbruster <armbru@redhat.com> wrote:
>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>
>>>>> In some situations it's useful to have a qdev property which doesn't
>>>>> automatically set its default value when qdev_property_add_static is
>>>>> called (for instance when the default value is not constant).
>>>>>
>>>>> Support this by adding a flag to the Property struct indicating
>>>>> whether to set the default value.  This replaces the existing test
>>>>> for whether the PorpertyInfo set_default_value function pointer is
>>>>
>>>> PropertyInfo
>>>>
>>>>> NULL, and we set the .set_default field to true for all those cases
>>>>> of struct Property which use a PropertyInfo with a non-NULL
>>>>> set_default_value, so behaviour remains the same as before.
>>>>>
>>>>> We define two new macros DEFINE_PROP_SIGNED_NODEFAULT and
>>>>> DEFINE_PROP_UNSIGNED_NODEFAULT, to cover the most plausible use cases
>>>>> of wanting to set an integer property with no default value.
>>>>
>>>> Your text makes me wonder what is supposed to set the default value
>>>> then.  Glancing ahead to PATCH 3, it looks like method instance_init()
>>>> is.  Can you think of a scenario where something else sets it?
>>>
>>> OK, proposed extra paragraph for commit message:
>>>
>>> This gives us the semantics of:
>>>  * if .set_default is true and .info->set_default_value is not NULL,
>>>    then .defval is used as the the default value of the property
>>
>> If I read your patch correctly, then this should be "if .set_default is
>> true, then .info->set_default_value() must not be null, and .defval is
>> used ..."
>
> Yes.

Update your comment and commit message accordingly, and you may add
Reviewed-by: Markus Armbruster <armbru@redhat.com>
