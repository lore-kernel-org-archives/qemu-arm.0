Received: by 10.25.44.15 with SMTP id s15csp671727lfs;
        Wed, 12 Jul 2017 04:22:39 -0700 (PDT)
X-Received: by 10.237.61.153 with SMTP id i25mr5891067qtf.239.1499858559466;
        Wed, 12 Jul 2017 04:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499858559; cv=none;
        d=google.com; s=arc-20160816;
        b=PXZTl+QeyAIovUP4/QSuriOo0ie8SizthCkPTUexIu+kiuwh0bnpPh5LY6N3h0rsqq
         5+hm8clO59e0o7yVc8rODN+/7nloF9r08nZrMnPLa0HQPEPzSVpnykZavM0UY/DOV7hc
         hgPJmQ6/pHAoPGKBgfL3RXEXKIx5/2OFxRKDmYhrhdLMphVYQwe/m7qTeOqvqjL+N3cE
         5zBg0aLIlQyBJ576Xgl1MRzr4jRZwp9EG56kPJiy/9rsQrGNIClbYtQefRtdasA19RZx
         BiSTMiZCxUhy84VXQD1tIrjy4SRAhGwWbWK4Z7KfRSpM3+F71+eC9mzJVCD2sMn7DnLD
         /pTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=8cXo1fL7klTxIVZNLOWtfsfELWwonlouLPQPcZWP+hI=;
        b=k9Sq7y8OaIkSdOiMvCb4yEN/HtxpDtVwymY1XLp5GbUzrpRhSpksEwojTx3p63m+Bh
         aAghRPLgUaqoVP1bIEIZI1AlGZqt9RbLpsyBKaJ37jsjLqWDvyNiyJr23pSHL3+ZxrM+
         IS+o+0QOBCJgilUJVHDyvPxid+aOtbNuEacO+Uk7QGhn/9mx5XBYa3CTfFc0JgVwNfq+
         Bx/pw3JJcRkAXEhO/gRmlCqADjFvwDq/cop4TmBaKXwPBPCokL5wtdDnvSsbc9XIobzN
         1Kej7aUqBDxH17Rwc2oFvkiOprYjo39OFmpraYfM1/mbmQFttteQb/1/SUgWSFzfnlMr
         89Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p47si2035383qtg.65.2017.07.12.04.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Jul 2017 04:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVFj2-00073S-Ls
	for alex.bennee@linaro.org; Wed, 12 Jul 2017 07:22:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVFiu-00073E-5e
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 07:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVFip-0006OC-Bt
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 07:22:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dVFip-0006Nf-2l; Wed, 12 Jul 2017 07:22:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB19A61D19;
	Wed, 12 Jul 2017 11:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AB19A61D19
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com AB19A61D19
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E03260A9B;
	Wed, 12 Jul 2017 11:22:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E04A61138645; Wed, 12 Jul 2017 13:22:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
Date: Wed, 12 Jul 2017 13:22:16 +0200
In-Reply-To: <1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Tue, 11 Jul 2017 16:53:27 +0100")
Message-ID: <87lgnt99xz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 12 Jul 2017 11:22:21 +0000 (UTC)
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
Cc: =?utf-8?Q?Marc-Andr?= =?utf-8?Q?=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VkqnixtOM9qj

Peter Maydell <peter.maydell@linaro.org> writes:

> In some situations it's useful to have a qdev property which doesn't
> automatically set its default value when qdev_property_add_static is
> called (for instance when the default value is not constant).
>
> Support this by adding a flag to the Property struct indicating
> whether to set the default value.  This replaces the existing test
> for whether the PorpertyInfo set_default_value function pointer is

PropertyInfo

> NULL, and we set the .set_default field to true for all those cases
> of struct Property which use a PropertyInfo with a non-NULL
> set_default_value, so behaviour remains the same as before.
>
> We define two new macros DEFINE_PROP_SIGNED_NODEFAULT and
> DEFINE_PROP_UNSIGNED_NODEFAULT, to cover the most plausible use cases
> of wanting to set an integer property with no default value.

Your text makes me wonder what is supposed to set the default value
then.  Glancing ahead to PATCH 3, it looks like method instance_init()
is.  Can you think of a scenario where something else sets it?

> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Since the previous patch fixed the only case that was
> using a default value but not explicitly setting .defval.[ui],
> this patch is a bit easier to review: .set_default = true
> is added in exactly the places that initialize .defval.[ui].
> ---
>  include/hw/qdev-core.h       |  1 +
>  include/hw/qdev-properties.h | 20 ++++++++++++++++++++
>  hw/core/qdev.c               |  2 +-
>  3 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 9d7c1c0..d110163 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -226,6 +226,7 @@ struct Property {
>      PropertyInfo *info;
>      ptrdiff_t    offset;
>      uint8_t      bitnr;
> +    bool         set_default;

Your chance to add the very first comment to struct Property (its
existing undocumentedness is an embarrassment, but not this patch's
problem).  Let's write down that this flag governs where (integer)
default values come from, either from member devfal or from method
instance_init() or whatever.

>      union {
>          int64_t i;
>          uint64_t u;
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 36d040c..66816a5 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -43,15 +43,24 @@ extern PropertyInfo qdev_prop_arraylen;
>          .info      = &(_prop),                                          \
>          .offset    = offsetof(_state, _field)                           \
>              + type_check(_type,typeof_field(_state, _field)),           \
> +        .set_default = true,                                            \
>          .defval.i  = (_type)_defval,                                    \
>          }

If you flip the sense of the flag, you don't need to mess with the
PropertyInfo, and don't need the note referring reviewers to the
previous patch.  However, the case "use .defval" already requires an
initializer, so adding one for .set_default seems fair.  Okay.

>  
> +#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type) { \
> +        .name      = (_name),                                           \
> +        .info      = &(_prop),                                          \
> +        .offset    = offsetof(_state, _field)                           \
> +            + type_check(_type, typeof_field(_state, _field)),          \
> +        }
> +
>  #define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval) {  \
>          .name      = (_name),                                    \
>          .info      = &(qdev_prop_bit),                           \
>          .bitnr    = (_bit),                                      \
>          .offset    = offsetof(_state, _field)                    \
>              + type_check(uint32_t,typeof_field(_state, _field)), \
> +        .set_default = true,                                     \
>          .defval.u  = (bool)_defval,                              \
>          }
>  
> @@ -60,15 +69,24 @@ extern PropertyInfo qdev_prop_arraylen;
>          .info      = &(_prop),                                          \
>          .offset    = offsetof(_state, _field)                           \
>              + type_check(_type, typeof_field(_state, _field)),          \
> +        .set_default = true,                                            \
>          .defval.u  = (_type)_defval,                                    \
>          }
>  
> +#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) { \
> +        .name      = (_name),                                           \
> +        .info      = &(_prop),                                          \
> +        .offset    = offsetof(_state, _field)                           \
> +            + type_check(_type, typeof_field(_state, _field)),          \
> +        }
> +
>  #define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval) {       \
>          .name      = (_name),                                           \
>          .info      = &(qdev_prop_bit64),                                \
>          .bitnr    = (_bit),                                             \
>          .offset    = offsetof(_state, _field)                           \
>              + type_check(uint64_t, typeof_field(_state, _field)),       \
> +        .set_default = true,                                            \
>          .defval.u  = (bool)_defval,                                     \
>          }
>  
> @@ -77,6 +95,7 @@ extern PropertyInfo qdev_prop_arraylen;
>          .info      = &(qdev_prop_bool),                          \
>          .offset    = offsetof(_state, _field)                    \
>              + type_check(bool, typeof_field(_state, _field)),    \
> +        .set_default = true,                                     \
>          .defval.u    = (bool)_defval,                            \
>          }
>  
> @@ -110,6 +129,7 @@ extern PropertyInfo qdev_prop_arraylen;
>                            _arrayfield, _arrayprop, _arraytype) {        \
>          .name = (PROP_ARRAY_LEN_PREFIX _name),                          \
>          .info = &(qdev_prop_arraylen),                                  \
> +        .set_default = true,                                            \
>          .defval.u = 0,                                                  \
>          .offset = offsetof(_state, _field)                              \
>              + type_check(uint32_t, typeof_field(_state, _field)),       \
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 849952a..96965a7 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -793,7 +793,7 @@ void qdev_property_add_static(DeviceState *dev, Property *prop,
>                                      prop->info->description,
>                                      &error_abort);
>  
> -    if (prop->info->set_default_value) {
> +    if (prop->set_default) {
>          prop->info->set_default_value(obj, prop);
>      }
>  }

Preferably with a suitable comment on member set_default and an improved
commit message:
Reviewed-by: Markus Armbruster <armbru@redhat.com>
