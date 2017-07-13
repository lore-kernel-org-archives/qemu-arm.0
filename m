Received: by 10.25.44.15 with SMTP id s15csp2216671lfs;
        Thu, 13 Jul 2017 07:12:38 -0700 (PDT)
X-Received: by 10.55.215.26 with SMTP id m26mr4891055qki.95.1499955158600;
        Thu, 13 Jul 2017 07:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499955158; cv=none;
        d=google.com; s=arc-20160816;
        b=IPYVVj2IPsIfHersoBzVAU7aEgglhnArAyw+H94vcFxN8jNis13klxCK55Kkt46DA3
         MiLkOMv0UiOTMOu8azKrpLHy79J3P8DSX0b5BVCGY+X43UXO3UQO+WGy4jD8+B++dook
         uOt5ETILOP8otwzBVFDO9tmF/iMvfTMa0Y+T9p8mwmxaMsC0pOnQiw2yET43mmBbc6EF
         FB0RhCHk0/OH+1rn8uotK7MhW5yJ0q7fozbiq0bqDM2PyNn9iAslrck3+2FA3XoQ2lhi
         jJY5BBIGumNhe4LPE5/7XN8t9C/qNZA0P5EVMN7WYbkbY1GNsinKerZ0JwzvAP+2l+Or
         tL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=NngYmiTvzM5Wk8wX4Qiipd0L6Z6AThopMrXPUEvzXL0=;
        b=tIsBEQs/zC1FpyEyMLvAlcyI+Kqe2PM8noc3UqFAdNyxThByMp8Niw6w0RNuhToA8B
         QvwAw0VKDdBl0+f8sAbk6Au73koz79CDrPN/nCeBIURLkgFvXNBAffilnHMNbfUTa12C
         PqVnHfzsIxiLxMjAXEE7g/ThW15xUC3alZdi7xnC3AwcztaJ2ZS1+I/DM6rPVAHpFXEA
         PG9gIbRb64fZMeQ32qjEtQnMYDFAiNv8BAzaLzkTVulFz4Y6URPn7yW8VtZ1u46vs4yX
         ncReg9LyKLUJkPkHurp7YE2LGpsB3J+4RbcprWH4ujOi9V6514LndCHBZGl2vzK6f8XB
         Ma5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b18si5302317qtb.339.2017.07.13.07.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 07:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVeqj-0001YV-Nk
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 10:12:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVeqg-0001YP-Ek
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 10:12:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVeqb-000271-Lg
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 10:12:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39436)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dVeqb-00026g-F5; Thu, 13 Jul 2017 10:12:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6335267C5;
	Thu, 13 Jul 2017 14:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C6335267C5
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C6335267C5
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C9D470467;
	Thu, 13 Jul 2017 14:12:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EFFDA1138645; Thu, 13 Jul 2017 16:11:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-2-git-send-email-peter.maydell@linaro.org>
Date: Thu, 13 Jul 2017 16:11:59 +0200
In-Reply-To: <1499788408-10096-2-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Tue, 11 Jul 2017 16:53:26 +0100")
Message-ID: <87lgns2zps.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 13 Jul 2017 14:12:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] qdev-properties.h:
 Explicitly set the default value for arraylen properties
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
Cc: =?utf-8?Q?Marc-Andr?= =?utf-8?Q?=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fKYi4ufK7ipE

Peter Maydell <peter.maydell@linaro.org> writes:

> In DEFINE_PROP_ARRAY, because we use a PropertyInfo (qdev_prop_arraylen)
> which has a .set_default_value member we will set the field to a default
> value. That default value will be zero, by the C rule that struct
> initialization sets unmentioned members to zero if at least one member
> is initialized. However it's clearer to state it explicitly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> If my eyeball of the sources is correct, this is the only case we
> have of a Property struct that uses a PropertyInfo with a non-NULL
> .set_default_value but which doesn't explicitly set .defval.u.
> ---
>  include/hw/qdev-properties.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 0604c33..36d040c 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -110,6 +110,7 @@ extern PropertyInfo qdev_prop_arraylen;
>                            _arrayfield, _arrayprop, _arraytype) {        \
>          .name = (PROP_ARRAY_LEN_PREFIX _name),                          \
>          .info = &(qdev_prop_arraylen),                                  \
> +        .defval.u = 0,                                                  \
>          .offset = offsetof(_state, _field)                              \
>              + type_check(uint32_t, typeof_field(_state, _field)),       \
>          .arrayinfo = &(_arrayprop),                                     \

Hmm.

.info and .defval apply to the array *length*.
.info.set_default_value() is set_default_uint(), which uses .defval.u.
Setting it here is correct.

The array *elements* are described by .arrayinfo.  There is no
.arraydefval, but that's okay, because .arrayinfo.set_default_value()
doesn't get called.  Correct?
