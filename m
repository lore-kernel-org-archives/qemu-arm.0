Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp411399lfq;
        Wed, 13 Jan 2021 05:01:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8XrwzV2hqcqZQmODhl5oMRxo30K78OGhuCThuD0dYAiePkN3t6zwfmZISatYjqasEvByM
X-Received: by 2002:a25:6755:: with SMTP id b82mr1530682ybc.232.1610542904482;
        Wed, 13 Jan 2021 05:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610542904; cv=none;
        d=google.com; s=arc-20160816;
        b=e43XXIivjTZCDECuXSykP6RC/dwH2rEEf2fgOXDluKHCfAXXMQSmVtRoydKrw22nic
         /H+2aDvZxTGrZZT6DJbK9jRkruegMaFJcKog6m8ahgX4FcWNo2EwRa2BOBxhq6iVtVnh
         ZQbXSt+lAe7MduW/maodH34rzvU4OszRV1SwpSOZaEFnBu5/JGMCxd/C6g2vzEDbOVxp
         ddr0Jn3VqMXIP2nNPqsiabTC3rvAj1pS9Yao1MtWbUsWBRC155kAwAmcqFpOk1KwcXhW
         ujVO8k385Y5N3dM75+sGsBd4n+wH/7gEdOwB66C4W3TnxkBtHRraMbURqFVSHMXeJ5u9
         LQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=vhG+8z8PVXOrdsTr0N2TRncoAAfd8YjSpWqrnJxZs64=;
        b=GOc4bA8lzLMPyvTLMBsTFhGY0IQt6WN8MjqBO/QKRZG/TrqhsLM3Nizn85xgLEGM/s
         R3Sf1f9o7P2BR+VOZszQqby3BC9b69RsdRvM98l9GIvrdnH1CntLwd0uvZr+92XbVG4V
         06kIwHlHEhG65aFak7Np93jEgMjxXvxJrqsnvWiTosLGN3OtXgIXUKTZazZSHLR9Zxrm
         8ZQs/UH/stQrsAOg9e5p2aoUguCrX/za94E/pNmIns3DflggE0gKIAq+bxGZVJJGqSz7
         V9tpNZ6Q7te3yq4m3SrcpWbrGjxxHuELjhRABVSoho3NuSO+62Bn4LNe1xktJ6KtDRko
         SQqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J5tdjMy6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si2620134ybi.77.2021.01.13.05.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 05:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J5tdjMy6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzfmR-0005WR-QL
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 08:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfls-00051x-2o
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:01:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzflb-0000aI-89
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610542849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vhG+8z8PVXOrdsTr0N2TRncoAAfd8YjSpWqrnJxZs64=;
 b=J5tdjMy6c/9fi103Q6lTIEi15F2tZL6qw47zGNxf0YVbl/gBWHXIvjb9XaZae6PCUIXesi
 j3RlulKXN/u4VJZYAjo0H2gkDQVcOdv9r3roCQycOFG54cYiVx34o8aPHMasn0eYtQAVWC
 0F9WbZydjImUPSUq9DquNYRhjVlymsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-swu6iqdGMrGbFX1MZG0SPg-1; Wed, 13 Jan 2021 08:00:48 -0500
X-MC-Unique: swu6iqdGMrGbFX1MZG0SPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D60D1005D5F;
 Wed, 13 Jan 2021 13:00:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D082819CBA;
 Wed, 13 Jan 2021 13:00:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33E4C11386A7; Wed, 13 Jan 2021 14:00:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 4/7] qapi: Use QAPI_LIST_PREPEND() where possible
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-5-eblake@redhat.com>
Date: Wed, 13 Jan 2021 14:00:24 +0100
In-Reply-To: <20201223221102.390740-5-eblake@redhat.com> (Eric Blake's message
 of "Wed, 23 Dec 2020 16:10:59 -0600")
Message-ID: <87czy90z6f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>, "open
 list:S390 KVM CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 "Daniel P. =?utf-8?Q?Berr?= =?utf-8?Q?ang=C3=A9?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, "open
 list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eeHY1o7ezSxl

Eric Blake <eblake@redhat.com> writes:

> Anywhere we create a list of just one item or by prepending items
> (typically because order doesn't matter), we can use the
> QAPI_LIST_PREPEND macro.  But places where we must keep the list in
> order by appending remain open-coded until later patches.
>
> Note that as a side effect, this also performs a cleanup of two minor
> issues in qga/commands-posix.c: the old code was performing
>  new = g_malloc0(sizeof(*ret));
> which 1) is confusing because you have to verify whether 'new' and
> 'ret' are variables with the same type, and 2) would conflict with C++
> compilation (not an actual problem for this file, but makes
> copy-and-paste harder).
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

Already in master as commit 54aa3de72e, except for:

> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 87f14140a381..156223a344ed 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
[...]
> @@ -297,41 +293,31 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>  static int query_memdev(Object *obj, void *opaque)
>  {
>      MemdevList **list = opaque;
> -    MemdevList *m = NULL;
> +    Memdev *m;
>      QObject *host_nodes;
>      Visitor *v;
>
>      if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND)) {
>          m = g_malloc0(sizeof(*m));
>
> -        m->value = g_malloc0(sizeof(*m->value));
> +        m->id = g_strdup(object_get_canonical_path_component(obj));
> +        m->has_id = !!m->id;
>
> -        m->value->id = g_strdup(object_get_canonical_path_component(obj));
> -        m->value->has_id = !!m->value->id;
> -
> -        m->value->size = object_property_get_uint(obj, "size",
> -                                                  &error_abort);
> -        m->value->merge = object_property_get_bool(obj, "merge",
> -                                                   &error_abort);
> -        m->value->dump = object_property_get_bool(obj, "dump",
> -                                                  &error_abort);
> -        m->value->prealloc = object_property_get_bool(obj,
> -                                                      "prealloc",
> -                                                      &error_abort);
> -        m->value->policy = object_property_get_enum(obj,
> -                                                    "policy",
> -                                                    "HostMemPolicy",
> -                                                    &error_abort);
> +        m->size = object_property_get_uint(obj, "size", &error_abort);
> +        m->merge = object_property_get_bool(obj, "merge", &error_abort);
> +        m->dump = object_property_get_bool(obj, "dump", &error_abort);
> +        m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
> +        m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
> +                                             &error_abort);
>          host_nodes = object_property_get_qobject(obj,
>                                                   "host-nodes",
>                                                   &error_abort);
>          v = qobject_input_visitor_new(host_nodes);
> -        visit_type_uint16List(v, NULL, &m->value->host_nodes, &error_abort);
> +        visit_type_uint16List(v, NULL, &m->host_nodes, &error_abort);
>          visit_free(v);
>          qobject_unref(host_nodes);
>
> -        m->next = *list;
> -        *list = m;
> +        QAPI_LIST_PREPEND(*list, m);
>      }
>
>      return 0;
[...]

