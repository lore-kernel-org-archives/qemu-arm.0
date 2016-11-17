Received: by 10.25.150.194 with SMTP id y185csp668182lfd;
        Thu, 17 Nov 2016 04:39:05 -0800 (PST)
X-Received: by 10.55.79.86 with SMTP id d83mr2817397qkb.24.1479386345837;
        Thu, 17 Nov 2016 04:39:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u67si1907701qkb.264.2016.11.17.04.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Nov 2016 04:39:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58543 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c7Ly4-0000DF-EP
	for alex.bennee@linaro.org; Thu, 17 Nov 2016 07:39:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c7Ly1-0000D9-OC
	for qemu-arm@nongnu.org; Thu, 17 Nov 2016 07:39:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c7Lxy-0008L3-JG
	for qemu-arm@nongnu.org; Thu, 17 Nov 2016 07:39:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47528)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1c7Lxy-0008KH-CN; Thu, 17 Nov 2016 07:38:58 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6232BC037F62;
	Thu, 17 Nov 2016 12:38:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAHCcte6027754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 17 Nov 2016 07:38:56 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5EEC211386CE; Thu, 17 Nov 2016 13:38:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1479320499-29818-1-git-send-email-ehabkost@redhat.com>
Date: Thu, 17 Nov 2016 13:38:54 +0100
In-Reply-To: <1479320499-29818-1-git-send-email-ehabkost@redhat.com> (Eduardo
	Habkost's message of "Wed, 16 Nov 2016 16:21:39 -0200")
Message-ID: <87y40ijn6p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 17 Nov 2016 12:38:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.9] qmp: Report QOM type
 name on query-cpu-definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <dgibson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Denemark <jdenemar@redhat.com>, Eric Blake <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ueM//wKXKVBj

Eduardo Habkost <ehabkost@redhat.com> writes:

> The new typename attribute on query-cpu-definitions will be used
> to help management software use device-list-properties to check
> which properties can be set using -cpu or -global for the CPU
> model.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  qapi-schema.json            | 4 +++-
>  target-arm/helper.c         | 1 +
>  target-i386/cpu.c           | 1 +
>  target-ppc/translate_init.c | 1 +
>  target-s390x/cpu_models.c   | 1 +
>  5 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/qapi-schema.json b/qapi-schema.json
> index b0b4bf6..9a3bdd4 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -3216,6 +3216,8 @@
>  # @unavailable-features: #optional List of properties that prevent
>  #                        the CPU model from running in the current
>  #                        host. (since 2.8)
> +# @typename: Type name that can be used as argument to @device-list-properties,
> +#            to introspect properties configurable using -cpu or -global.
>  #
>  # @unavailable-features is a list of QOM property names that
>  # represent CPU model attributes that prevent the CPU from running.
> @@ -3237,7 +3239,7 @@
>  ##
>  { 'struct': 'CpuDefinitionInfo',
>    'data': { 'name': 'str', '*migration-safe': 'bool', 'static': 'bool',
> -            '*unavailable-features': [ 'str' ] } }
> +            '*unavailable-features': [ 'str' ], 'typename': 'str' } }
>  
>  ##
>  # @query-cpu-definitions:
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index b5b65ca..3fc01b5 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5207,6 +5207,7 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
>      info = g_malloc0(sizeof(*info));
>      info->name = g_strndup(typename,
>                             strlen(typename) - strlen("-" TYPE_ARM_CPU));
> +    info->q_typename = g_strdup(typename);
>  
>      entry = g_malloc0(sizeof(*entry));
>      entry->value = info;
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 6eec5dc..725f6cb 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -2239,6 +2239,7 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
>      info->name = x86_cpu_class_get_model_name(cc);
>      x86_cpu_class_check_missing_features(cc, &info->unavailable_features);
>      info->has_unavailable_features = true;
> +    info->q_typename = g_strdup(object_class_get_name(oc));
>  
>      entry = g_malloc0(sizeof(*entry));
>      entry->value = info;
> diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
> index 208fa1e..42b9274 100644
> --- a/target-ppc/translate_init.c
> +++ b/target-ppc/translate_init.c
> @@ -10305,6 +10305,7 @@ CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
>  
>          info = g_malloc0(sizeof(*info));
>          info->name = g_strdup(alias->alias);
> +        info->q_typename = g_strdup(object_class_get_name(oc));
>  
>          entry = g_malloc0(sizeof(*entry));
>          entry->value = info;
> diff --git a/target-s390x/cpu_models.c b/target-s390x/cpu_models.c
> index c1e729d..5b66d33 100644
> --- a/target-s390x/cpu_models.c
> +++ b/target-s390x/cpu_models.c
> @@ -290,6 +290,7 @@ static void create_cpu_model_list(ObjectClass *klass, void *opaque)
>      info->has_migration_safe = true;
>      info->migration_safe = scc->is_migration_safe;
>      info->q_static = scc->is_static;
> +    info->q_typename = g_strdup(object_class_get_name(klass));
>  
>  
>      entry = g_malloc0(sizeof(*entry));

A bit sad that the QOM type name needs to be computed in
target-dependent code.

With Eric's doc fix:
Reviewed-by: Markus Armbruster <armbru@redhat.com>
