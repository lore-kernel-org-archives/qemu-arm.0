Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1589921wrq;
        Thu, 12 Jul 2018 09:55:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfFg5hiwz5NIkMZQUzTCFlUH/IC8ST42WKyVEA7Q3+Xs3+1MTXkHwQFB0f0Nr9U0altGp/4
X-Received: by 2002:a37:1154:: with SMTP id b81-v6mr2429878qkh.404.1531414536301;
        Thu, 12 Jul 2018 09:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531414536; cv=none;
        d=google.com; s=arc-20160816;
        b=VDOarwKoUXw9yIxU14HfIRMETbyZQnLSVSYiRovfXTf6skJdUsxNS5rUFQ9hf/96as
         8AQwNRXeBW7Hb0LpscltijcJR+eKdjW7Bnggg2eGG9Z910jsggbOpucZb7Fo4y1PUMGP
         1CMaU/kc+McDVrtIFMEpSPQ/quducY2dMHFj70lkdEVjy/vonG/XnyTDbzXytCxuWEmX
         WgLRDutPjZAVubkfJaL2TMfhZuwFY5abhsafpfozrEQ69vm/eufBbNubW2arCWrCi0BJ
         CFG/d0MYqPVPL/KSW36rMw2BK8+GS+j2o/yFd4Z44KxqhTBCgvLrbVicAsN4FcUczN/u
         64WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=qyLIogXohGIG5MwqM1whjaWvVcAles2LkAUjcbZWQao=;
        b=Rf1qFWrcs8AMbb6M3s34Dw24WSlFcaPD+5+Gj+EwtGaTDoGYW4HpDHPtNboIQ+NhUM
         bANIz1n+VkUvlf0AXLp/Rx9u9YenZZs3V0JHr+rjh1gQqoi1VLso81rsdoacoY3F+QD0
         8eGtS32WWBteSUMMA60NUAgnzs5qCIJzR+sEf5EwYYQq5Xp+8x9shSyUROzA6dkGb7Ve
         xoF8u8PvQmKrooO68+yYMF9kNk8Plv0ac7No9ZzZGSWa9riXtmW3XRAKBzRHcHGjDvWe
         jwEXkkiFt1XNsdAJMkzyIhJM3qAVqdOzbDepAeqgZ5Cs1wZEBuC3DDezfwcPCGBh0ATL
         +lgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z21-v6si22681106qki.188.2018.07.12.09.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 09:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdesR-00012Z-Sy
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 12:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdesL-0000zm-8U
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdesG-0004JK-4l
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:55:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41472 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdesF-0004IC-Tl; Thu, 12 Jul 2018 12:55:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 330A7C12A5;
	Thu, 12 Jul 2018 16:55:23 +0000 (UTC)
Received: from [10.36.116.19] (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBCC42156700;
	Thu, 12 Jul 2018 16:55:21 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
	<1531409463-3843-2-git-send-email-thuth@redhat.com>
	<20180712165224.GD31657@localhost.localdomain>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <224a0bbb-9dbb-87eb-9e9b-1c82923010b5@redhat.com>
Date: Thu, 12 Jul 2018 18:55:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180712165224.GD31657@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 12 Jul 2018 16:55:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 12 Jul 2018 16:55:23 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 1/5] qom/object: Add a new function
 object_initialize_as_child()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jQ0pzDKKjPea

On 12.07.2018 18:52, Eduardo Habkost wrote:
> On Thu, Jul 12, 2018 at 05:30:59PM +0200, Thomas Huth wrote:
>> A lot of code is using the object_initialize() function followed by a call to
>> object_property_add_child() to add the newly initialized object as a child of
>> the current object. Both functions increase the reference counter of the new
>> object, but many spots that call these two functions then forget to drop one
>> of the superfluous references. So the newly created object is often not cleaned
>> up correctly when the parent is destroyed. In the worst case, this can cause
>> crashes, e.g. because device objects are not correctly removed from their
>> parent_bus.
>> Since this is a common pattern between many code spots, let's introdcue a
>> new function that takes care of calling all three required initialization
>> functions, first object_initialize(), then object_property_add_child() and
>> finally object_unref().
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  include/qom/object.h | 19 +++++++++++++++++++
>>  qom/object.c         | 14 ++++++++++++++
>>  2 files changed, 33 insertions(+)
>>
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index f3d2308..c1b254c 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -749,6 +749,25 @@ int object_set_propv(Object *obj,
>>  void object_initialize(void *obj, size_t size, const char *typename);
>>  
>>  /**
>> + * object_initialize_as_child:
>> + * @parentobj: The parent object to add a property to
>> + * @propname: The name of the property
>> + * @childobj: A pointer to the memory to be used for the object.
>> + * @size: The maximum size available at @obj for the object.
>> + * @type: The name of the type of the object to instantiate.
>> + * @errp: If an error occurs, a pointer to an area to store the area
>> + *
>> + * This function will initialize an object. The memory for the object should
>> + * have already been allocated. The object will then be added as child property
>> + * to a parent with object_property_add_child() function. The returned object
>> + * has a reference count of 1, and will be finalized when the last reference is
>> + * dropped.
>> + */
>> +void object_initialize_as_child(Object *parentobj, const char *propname,
>> +                                void *childobj, size_t size, const char *type,
>> +                                Error **errp);
> 
> Why did you use void* instead of Object*?

That's the same what object_initialize() is doing (see above). Otherwise
all the callers have to cast their pointers with OBJECT() first.

 Thomas


