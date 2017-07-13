Received: by 10.25.44.15 with SMTP id s15csp2435509lfs;
        Thu, 13 Jul 2017 10:10:21 -0700 (PDT)
X-Received: by 10.55.17.77 with SMTP id b74mr6240544qkh.257.1499965821120;
        Thu, 13 Jul 2017 10:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499965821; cv=none;
        d=google.com; s=arc-20160816;
        b=Ma9b00isx8GyNIt4a45aSrYDE9AZ4q25viDRUxuuWRgrpezUeNFaieIxbShGtG865L
         hNjFr7dO5RdOS64yghaPR71UwWFDg+QzpW+93qlaBLSpp+WyLQBrskppFPgFRvEahRkD
         ovDdk8hWoHm7A9RskFeyKyIs69xYWRHXa7qGKVLfX9UYCd/epD2simnWWyIR2GTaR/Xe
         exsYrONPUNZKvacxPSCqSFNSEv/nfBALi1IroURtkc8+bAUFrltoelLEsOwBAHdGXPC8
         RlUkYG9FsxZ1ePhlUC+lZlenH3MzQwSgSlGMnBen2ufL7GjAU8Y1pj+dghVtAXtc8bGe
         bvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=0BtCMA/QF5mpXFxQcB8H0G1WUtXHdyTwvmlG4Ekva8c=;
        b=fBOhMkyyJDTDD7kt/xcSe2pO9Ly7siQZW4zdOgGGfW/Ip2OKgv1nC33PSfIau4iZQS
         DCIPaOroRQ01Rw12t3gI4VJCIRwVJyTaIiXH9mM+c4/tPgjZRVA/6SKjl/Uaz+JJSIVZ
         dmRdNCk2w24RzfbZwPjcowYZMl88fIgABBce9YSzJZoyvQ5N8+53Rn9gmfhu9D/Qdvm7
         wv1/mPqT8PFq7s8e0VuHlI1j7cB9x+G2YxYRIZzhdhL/HuwHBgqSbfY3agoT2f6r/xJ3
         7Mgq+kK+Lp1Jv55WmYTGYadhPNo6kkuwNY1ewgjt47t5ZovWrtdAKxm97px7vWiyyZUd
         ZEfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q49si5619532qte.104.2017.07.13.10.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 10:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVhd4-000473-Ax
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 13:10:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVhd1-00046m-Ah
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:10:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVhcy-0001vJ-4b
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:10:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dVhcx-0001v7-SG; Thu, 13 Jul 2017 13:10:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7AE88F264;
	Thu, 13 Jul 2017 17:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C7AE88F264
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C7AE88F264
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A03918ECB;
	Thu, 13 Jul 2017 17:10:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 039DB1138645; Thu, 13 Jul 2017 19:10:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
	<87lgnt99xz.fsf@dusky.pond.sub.org>
	<CAFEAcA-oEZZgPDOayLpZ1_aC0hEeOcYBL3+XejtJXnt4wDyqow@mail.gmail.com>
Date: Thu, 13 Jul 2017 19:10:06 +0200
In-Reply-To: <CAFEAcA-oEZZgPDOayLpZ1_aC0hEeOcYBL3+XejtJXnt4wDyqow@mail.gmail.com>
	(Peter Maydell's message of "Thu, 13 Jul 2017 16:38:20 +0100")
Message-ID: <87d194xnyp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 13 Jul 2017 17:10:10 +0000 (UTC)
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
X-TUID: +xzZGFqC4gjR

Peter Maydell <peter.maydell@linaro.org> writes:

> On 12 July 2017 at 12:22, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> In some situations it's useful to have a qdev property which doesn't
>>> automatically set its default value when qdev_property_add_static is
>>> called (for instance when the default value is not constant).
>>>
>>> Support this by adding a flag to the Property struct indicating
>>> whether to set the default value.  This replaces the existing test
>>> for whether the PorpertyInfo set_default_value function pointer is
>>
>> PropertyInfo
>>
>>> NULL, and we set the .set_default field to true for all those cases
>>> of struct Property which use a PropertyInfo with a non-NULL
>>> set_default_value, so behaviour remains the same as before.
>>>
>>> We define two new macros DEFINE_PROP_SIGNED_NODEFAULT and
>>> DEFINE_PROP_UNSIGNED_NODEFAULT, to cover the most plausible use cases
>>> of wanting to set an integer property with no default value.
>>
>> Your text makes me wonder what is supposed to set the default value
>> then.  Glancing ahead to PATCH 3, it looks like method instance_init()
>> is.  Can you think of a scenario where something else sets it?
>
> OK, proposed extra paragraph for commit message:
>
> This gives us the semantics of:
>  * if .set_default is true and .info->set_default_value is not NULL,
>    then .defval is used as the the default value of the property

If I read your patch correctly, then this should be "if .set_default is
true, then .info->set_default_value() must not be null, and .defval is
used ..."

>  * otherwise, the property system does not set any default, and
>    the field will retain whatever initial value it was given by
>    the device's .instance_init method
>
> (to go just before the "We define two new macros..." para.)
>
>>> --- a/include/hw/qdev-core.h
>>> +++ b/include/hw/qdev-core.h
>>> @@ -226,6 +226,7 @@ struct Property {
>>>      PropertyInfo *info;
>>>      ptrdiff_t    offset;
>>>      uint8_t      bitnr;
>>> +    bool         set_default;
>>
>> Your chance to add the very first comment to struct Property (its
>> existing undocumentedness is an embarrassment, but not this patch's
>> problem).  Let's write down that this flag governs where (integer)
>> default values come from, either from member devfal or from method
>> instance_init() or whatever.
>
> OK, how about
> /**
>  * Property:
>  * @set_default: true if the default value should be set from @defval
>  *    (if false then no default value is set by the property system
>  *     and the field retains whatever value it was given by instance_init).
>  * @defval: default value for the property. This is used only if @set_default
>  *     is true and @info->set_default_value is not NULL.
>  */

Again, I believe ->set_default_value() must not be null when
->set_default is true.

>
> ?
>
> thanks
> -- PMM
