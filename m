Received: by 10.25.44.15 with SMTP id s15csp742988lfs;
        Wed, 12 Jul 2017 05:30:19 -0700 (PDT)
X-Received: by 10.55.163.69 with SMTP id m66mr5925419qke.139.1499862619443;
        Wed, 12 Jul 2017 05:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499862619; cv=none;
        d=google.com; s=arc-20160816;
        b=nuvALY7dTokZn9CHYbc8gJuvBNppm6M3bR/tTVkwzXjaYmsChMFVCChIZ4u47U9nYv
         uNyeDf2SB8Bkbp09prbZrl7StdDDgagSoCQyPDxbkkdx4TZN0/xjj/uouEAqDYeEaztP
         Sjj5tD+YeQTkl3KWMPwIWonvatkq4nRM3tJhQnROKRIpzvNAvycsF031HFyUTJ8COXc3
         FwfEGJssUmDyJkjCG82yEImHoYPmwvLkQOhFxf5SuqLZ7ezCrfnNVB73tB6gGcBV69tz
         W646nSGa3KD35O7vmCcbDL/OScku0DvzdqzH8Q5ERP+M9TcDceEBkuuIoFhT+oTI0+id
         D83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=voiN+J1XLydXx/gMXCPKWQYouZMaCHD6YeCfQHK8LZI=;
        b=OnslusUQXtQMQj5kNAaSQTdHuYHFShBCZAczh+TXyw13yiIKG78LeYoSkhy7UT+Ceu
         f/D+uKnKmx/zlJ6/J4Yk+0Qn5cebRSR5fdbAqMN1LOBJsHE4t8ncagrZq/4QphDZqhl7
         6cPooLHInMCbVxPECmJSFZFkWlxmoX0fF6NxgZ7DLSyaCiq+l6CPIS0bn+kwt6aaz2Uh
         jWO5wh5vDkpMqXSw3feKwNIrEBZtyXnffh0jq6mUEFFP3sC/iwAZmvRoW3FgTAt9ecbT
         +T/5KH3TvGS4JF8oldkt1LfYsxPqgj7LJTDJlEDeq3QiOqtOkuHVp7JNZV23eziQMcHm
         HYBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=RP+wxUuS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m6si2150755qkf.136.2017.07.12.05.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Jul 2017 05:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=RP+wxUuS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVGmW-0005da-F0
	for alex.bennee@linaro.org; Wed, 12 Jul 2017 08:30:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVGlO-0005BY-La
	for qemu-devel@nongnu.org; Wed, 12 Jul 2017 08:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVGlL-0002NL-Gu
	for qemu-devel@nongnu.org; Wed, 12 Jul 2017 08:29:06 -0400
Received: from mail-wr0-f175.google.com ([209.85.128.175]:34774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dVGlL-0002L6-97
	for qemu-devel@nongnu.org; Wed, 12 Jul 2017 08:29:03 -0400
Received: by mail-wr0-f175.google.com with SMTP id 77so31741242wrb.1
	for <qemu-devel@nongnu.org>; Wed, 12 Jul 2017 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=voiN+J1XLydXx/gMXCPKWQYouZMaCHD6YeCfQHK8LZI=;
	b=RP+wxUuSJ0nbN0JxjKl7O6wIIGn11BJusl/9y1GaBqmmEngpN6hW5XV7ZBKg+i8FFP
	Zcb1BBaosnB64ZaAPQUBXOOYH9MBB262ejBBiA/vyI10D4GGQlWwsgIH2/Q/7GPgJzQB
	3fuHgw6ZyPKTfrwU9i1G8owVZpOz63t/Nn8ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=voiN+J1XLydXx/gMXCPKWQYouZMaCHD6YeCfQHK8LZI=;
	b=cyVGzlGCjIT6xSGoKyy4/pGFprXIGWCLmQL1Es1Zp992jYxrV04tj1+ckBr0BtnWPS
	rTIVfyPfC8XD/XYhbbc97TlJPNDmJKNk2vb/z4pzDkf1xFO0vfRvmziykszN0qvrb2At
	3bF5+DCnrDgUZLyGpcAl0+16r1aqqV37Jr2F/PMRMy4xcNxtEPHpw2nyN3lFfeutvFgC
	9PvbouKRHyXE/dXEQYl0zSnpMa8dPBH6cYQTEGSxccN05qki/6MELu0lZUFRwdg9XDz0
	ZAlj+jSCoWSxP1UAawaXUe3bnHa2qANh65b/Y2aA3f5JdBK0ya2yK6DjXg65UUT+ia+4
	ukuw==
X-Gm-Message-State: AIVw110laC4QubRmr5getX7rJjr3ZoGchAA5oXwWvkI42hgTDA07FCbY
	D7ynRrmOewUWTpbEiAx8CI0v1Has3J4C
X-Received: by 10.28.129.203 with SMTP id c194mr2515982wmd.120.1499862480017; 
	Wed, 12 Jul 2017 05:28:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Wed, 12 Jul 2017 05:27:39 -0700 (PDT)
In-Reply-To: <87lgnt99xz.fsf@dusky.pond.sub.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
	<87lgnt99xz.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jul 2017 13:27:39 +0100
Message-ID: <CAFEAcA8JmF+8MdCGYbVr9AYx+3ybXqGbLLzZiFgoQmJPHYTsZg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.175
Subject: Re: [Qemu-devel] [PATCH 2/3] qdev: support properties which don't
 set a default value
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uTBSL3lrcpHy

On 12 July 2017 at 12:22, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> In some situations it's useful to have a qdev property which doesn't
>> automatically set its default value when qdev_property_add_static is
>> called (for instance when the default value is not constant).
>>
>> Support this by adding a flag to the Property struct indicating
>> whether to set the default value.  This replaces the existing test
>> for whether the PorpertyInfo set_default_value function pointer is
>
> PropertyInfo
>
>> NULL, and we set the .set_default field to true for all those cases
>> of struct Property which use a PropertyInfo with a non-NULL
>> set_default_value, so behaviour remains the same as before.
>>
>> We define two new macros DEFINE_PROP_SIGNED_NODEFAULT and
>> DEFINE_PROP_UNSIGNED_NODEFAULT, to cover the most plausible use cases
>> of wanting to set an integer property with no default value.
>
> Your text makes me wonder what is supposed to set the default value
> then.  Glancing ahead to PATCH 3, it looks like method instance_init()
> is.  Can you think of a scenario where something else sets it?

Yes, instance_init is the obvious place (though in fact pretty
much anything that runs before the user of the device sets
properties will do).

>>      union {
>>          int64_t i;
>>          uint64_t u;
>> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
>> index 36d040c..66816a5 100644
>> --- a/include/hw/qdev-properties.h
>> +++ b/include/hw/qdev-properties.h
>> @@ -43,15 +43,24 @@ extern PropertyInfo qdev_prop_arraylen;
>>          .info      = &(_prop),                                          \
>>          .offset    = offsetof(_state, _field)                           \
>>              + type_check(_type,typeof_field(_state, _field)),           \
>> +        .set_default = true,                                            \
>>          .defval.i  = (_type)_defval,                                    \
>>          }
>
> If you flip the sense of the flag, you don't need to mess with the
> PropertyInfo, and don't need the note referring reviewers to the
> previous patch.  However, the case "use .defval" already requires an
> initializer, so adding one for .set_default seems fair.  Okay.

Having the flag this way round was your idea :-)
Putting it the other way round might have been a smaller change
in some sense (you'd have had to retain the check on
set_default_value being NULL), but I do think it's nicer
in the end...

> Preferably with a suitable comment on member set_default and an improved
> commit message:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

thanks
-- PMM
