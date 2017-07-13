Received: by 10.25.44.15 with SMTP id s15csp2325631lfs;
        Thu, 13 Jul 2017 08:41:05 -0700 (PDT)
X-Received: by 10.200.47.114 with SMTP id k47mr6001041qta.18.1499960465773;
        Thu, 13 Jul 2017 08:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499960465; cv=none;
        d=google.com; s=arc-20160816;
        b=GhelySadUf8C8OeFJanZ8YqSdtR6BrQcl1O2xgPXlQpxqDX2aLpL6PhGJxUNZBnzhq
         Ik1uexKcEj1FLAAzmwEjL8RxPXxYU+Spmf752PDFtpWh0c4AYoojIf/cQ8yQbJN4T//W
         R/b0uU/DL7/ju8QUxX42APJ9EZFFQ1c+rS8ikcY7xsTkhMD5VSOaTaECDpWi24mG1hJD
         7NReG/hz1qU+NaW5GMysuvGcHLWSEkVHnAXwcw1m7pC0bWF5i/iMgdd42U5R5b9eIG9u
         PorTgrPdRuxAjTQC4fpxmdJwdWW5iZoMLwVrGaD4Bw8f++UJb9/L1mti6MjuZTsQlB2w
         h/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BZbokWU4VsV+RDdKwTRBx47n1XlfciYCiklzkpBEoPA=;
        b=AfQEjclGvf5+qprgVZjCXqfXTqRK4Y4CUY5lYf5gLb91q+Wjv2OJelgRVgwVBxzU/V
         l/lcw7TSVGTKKNQq5L8trmk0xeBxehvQU1B8+1+srfvqtzJT7cqaQXnS8Xh8taCXZFzE
         wcfBmxBBbXk1Y8dZ5k9PQAImyUbPz1DiyX9VapPvZ7ypq6HiI3RT/1kwzFK4eEDuDyOh
         10TMf4H/JhtYI6ObNUTBnifGJDwiLFQ6wcjbNKTF+YruQW4IGTZA6ySa/C6UleJN1cAm
         RYMEmjpGXSAKnLeXFQeTOMzgiTKnJLmRVBBKe9Stz5ulMALwCtNEbIG1UxW3TNbMQ1Pc
         dZJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=DohnkHkM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l184si5471962qke.77.2017.07.13.08.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 08:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=DohnkHkM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVgEh-0002KY-63
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 11:41:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVgDR-0001M9-IF
	for qemu-devel@nongnu.org; Thu, 13 Jul 2017 11:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVgDO-0001Ys-9J
	for qemu-devel@nongnu.org; Thu, 13 Jul 2017 11:39:45 -0400
Received: from mail-wm0-f42.google.com ([74.125.82.42]:38614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dVgDO-0001YS-1J
	for qemu-devel@nongnu.org; Thu, 13 Jul 2017 11:39:42 -0400
Received: by mail-wm0-f42.google.com with SMTP id f67so30245052wmh.1
	for <qemu-devel@nongnu.org>; Thu, 13 Jul 2017 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BZbokWU4VsV+RDdKwTRBx47n1XlfciYCiklzkpBEoPA=;
	b=DohnkHkMOZyV1kkkbK5IxqEc0ExG3DX/IcdWagBVn0RfpCycUNOYn2dKk7DKD9aL0I
	WisFx0Tn/DWX+06TYmsJkfjOO2ePlwh6lvYLxAKW4y86ypSN3XkRpSAMX+Yvbj6xEFSI
	YRFOULdVdIYJ9mgrY71Dx6mC7MNQv5NxPtrqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BZbokWU4VsV+RDdKwTRBx47n1XlfciYCiklzkpBEoPA=;
	b=flnSnFoTe81d7+oPQ/QKVEqW9IapOtDbzrORTc7K9uL+OJS7bzilqA7/IBw8t/FXe5
	xkFlGm9nQ09EvtdRtFr/l8aXg657qRYAPJJXYVGoPQNTifZWL05GD7m7dWH3GatXnHGh
	aN1lWrlzxYZlJoheuQeUVYnrPnRzB7JL5cPCZh3o0TRMOlAD8KP0oXbveXaedG9BJLQF
	dxIbJQFyK/va2npjl3mzFAkLLgwoflR+wmt25fcniwB0pjPGqhFWtp46F8uUz740FQKr
	38EcVyoO2D9jbu5MLdbfDxQ8xPDNnO9CxMatkItdIoQgOI+RXWGqFU8b2v8gXsL3+FeO
	NfLw==
X-Gm-Message-State: AIVw113WSshWssXf570nmbzviSmLarNdc6MbUDxoIh+FPdAyV4cf63k7
	e5uRt36c4MCjd2UwgYMHL0Tu8OiMUCpo
X-Received: by 10.28.129.203 with SMTP id c194mr2736297wmd.120.1499960320849; 
	Thu, 13 Jul 2017 08:38:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 13 Jul 2017 08:38:20 -0700 (PDT)
In-Reply-To: <87lgnt99xz.fsf@dusky.pond.sub.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
	<87lgnt99xz.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jul 2017 16:38:20 +0100
Message-ID: <CAFEAcA-oEZZgPDOayLpZ1_aC0hEeOcYBL3+XejtJXnt4wDyqow@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.42
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
X-TUID: 1LETrBdU7mSU

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

OK, proposed extra paragraph for commit message:

This gives us the semantics of:
 * if .set_default is true and .info->set_default_value is not NULL,
   then .defval is used as the the default value of the property
 * otherwise, the property system does not set any default, and
   the field will retain whatever initial value it was given by
   the device's .instance_init method

(to go just before the "We define two new macros..." para.)

>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -226,6 +226,7 @@ struct Property {
>>      PropertyInfo *info;
>>      ptrdiff_t    offset;
>>      uint8_t      bitnr;
>> +    bool         set_default;
>
> Your chance to add the very first comment to struct Property (its
> existing undocumentedness is an embarrassment, but not this patch's
> problem).  Let's write down that this flag governs where (integer)
> default values come from, either from member devfal or from method
> instance_init() or whatever.

OK, how about
/**
 * Property:
 * @set_default: true if the default value should be set from @defval
 *    (if false then no default value is set by the property system
 *     and the field retains whatever value it was given by instance_init).
 * @defval: default value for the property. This is used only if @set_default
 *     is true and @info->set_default_value is not NULL.
 */

?

thanks
-- PMM
