Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7E1CD98CE
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 18:31:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXNhp-0008FN-BX; Wed, 10 Jun 2026 14:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXNhn-000884-30
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXNhk-0000ME-4B
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781116264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=08yRJLGeOutE7WIQdWEGFM7bIAmFYFUntuqs8+y11oM=;
 b=PYSA9pG4FRtCZKrNLio/2wy1QezPo3jOFM+mDNqzZv+Y7jjvoJfPJY8M8YqhZPx/T1V7AG
 iVVr2taMpKpf13+wKWs/BQAx68W7jgQ+qkmW56BQp9ohMeC/SOA1F1PWKEF0ovARhy8evY
 iht9aAV62l1TbcJm+/u2gToeC2Qlbxc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-WCLCkcRtNuaKD0vyRVtyAA-1; Wed, 10 Jun 2026 14:31:02 -0400
X-MC-Unique: WCLCkcRtNuaKD0vyRVtyAA-1
X-Mimecast-MFC-AGG-ID: WCLCkcRtNuaKD0vyRVtyAA_1781116262
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7e6daf5d8f3so3214491a34.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781116262; x=1781721062;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=08yRJLGeOutE7WIQdWEGFM7bIAmFYFUntuqs8+y11oM=;
 b=dms+ye4WodGwnBZqIeTIzVK9/yeYyZdgH+1HKhSuMXWn77rQjz9hyPF95HFVBAI1j/
 1iD1Wuv5CXM/dfndSHYdlHa01lSLnn+C0oN4Yjj4ujZrD5JlVSkExmFMSXqhE8ThxTiD
 YGC5miQk4N8pT43Wx4RxO0ZUNeG4mMae3YC+aJZTBjD8QzW40s4tU0tmefK1rDM+o7iI
 7ceHinI5oOlAwiO4iCoV50WWiYm50+hbweNI9lRqfV4YL9qnxPVSXMAoZZC4Dki4x3uw
 LszGf937KCJYCna1gDs7++sUbR5Gd9S9E/Xc2DoDdzJOa8FAKcC6JB1h1FZOjI+SrfTg
 lV0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8dzFVKsSlbfmI4xLKYqgqVkccs329qNWEBq0rzvPPg4D+X3udqPhR6JOfh8ABQLowVq1Ec0dL4gg==@nongnu.org
X-Gm-Message-State: AOJu0Yx3hCh5hpmJ0X56EukcArAXM08rt4P4SGfz6BOL+cU4BLU4bx53
 yExlKWtYMONMtRPunA1F3BHKAku3pBkUOtq1dRniCjOCTDvJoWM/nv3TY/Yx0yIIDS4sAjT2caa
 y2w2BVJOq6bMzShL5d1nzpAQsEVFCakMFRWPd3Xu3Co41e0O0GX66uQ==
X-Gm-Gg: Acq92OFUtcfjVbwvFjLQIoyR99+R99Tvwed5LId2czWmRNwOEZY+zJAfroubrMwKr5h
 9cg35dH1bWIwQrgeH5wQgzhYx703t5jpM1A7cczlmwSlZZjH3vYTH6iQv434mWZsptVddTWZgLE
 xLVqoIwxkiRCpm2ZdDy3zTN3NEj2owUifq8XUFOlU8O2FcWPmjIZdZr6BqDJOGYaW7FiJW5MEUO
 p3fc30GjagMywMmVddyl5GQ+corgkehp/vZRAfhNNbD3TklGBsEo/FVt2dAuYGlv1BeudJpcRv+
 DBLPLS0iXp0MYIlcSTqJMa6T/qkR4NITi8ssYxNqzF7C0FzuGVA5wYFE5CyodvSXsj5UczN+jwx
 ID6WTyFZdkVnuZeNn6e297ljqNQ==
X-Received: by 2002:a05:6830:4424:b0:7dc:dd19:7f69 with SMTP id
 46e09a7af769-7e7707be2femr131735a34.17.1781116261587; 
 Wed, 10 Jun 2026 11:31:01 -0700 (PDT)
X-Received: by 2002:a05:6830:4424:b0:7dc:dd19:7f69 with SMTP id
 46e09a7af769-7e7707be2femr131704a34.17.1781116261015; 
 Wed, 10 Jun 2026 11:31:01 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6e78de8bdsm16737947a34.16.2026.06.10.11.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 11:31:00 -0700 (PDT)
Date: Wed, 10 Jun 2026 14:30:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v2 00/10] migration/qom: Remove TYPE_DEVICE dependency on
 migration object
Message-ID: <aimtYbka4GB9Qyk6@x1.local>
References: <20260609172514.2037645-1-peterx@redhat.com>
 <87jys75npb.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87jys75npb.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 73_giy2EYq4WNz-ze3-nv7WHLfXbymzp8Vg0fD32dKA_1781116262
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Jun 09, 2026 at 07:54:56PM -0300, Fabiano Rosas wrote:
> Hi,
> 
> After we discussed your v1 I started playing with this in parallel and
> stumbled into pretty much all of the issues this series resolves. Nice
> work!

Good to know at least it looks reasonable for someone.. thanks. :)

Looks like Dan still has concern that I use the ptrs in obj props but I'll
discuss it later separately.

> 
> I applied a patch [0] on top of this series to allow using the
> command-line to create the migration object. It can set all (most)
> options with -object migration,id=mig1,key=val,...
> 
>  $ ~/qemu-system-x86_64 -nodefaults -nographic -S \
>  -object migration,id=mig1,announce-initial=99,downtime-limit=99,multifd-channels=99,multifd-compression=zlib,multifd=on
>  ...
>  (qemu) info migrate_parameters
>  (qemu) info migrate_capabilities
>  ...
>  announce-initial: 99 ms
>  downtime-limit: 99 ms
>  multifd-channels: 99
>  multifd-compression: zlib
>  multifd: on
> 
> I'm not saying we should do that now. I just want to check with you to
> make sure we're not closing the door for future improvements:

IIUC it works, maybe indeed it's a better way than "-incoming config:" at
least in that we stick with the current APIs.

Said that, it does bypass the singleton work I did previously:

https://lore.kernel.org/r/20241029211607.2114845-1-peterx@redhat.com

Which was also unfortunately got rejected..

So, I suppose this is still fine that all the tricks resides in migration/
so far, maybe this is acceptable.

But then, we'll need to make sure the rest QEMU object code doesn't have
assumption that all objects can be created more than one.. and making sure
nothing crash elsewhere: when it crashes or works inproperly, we may face
again that singleton problem one way or another.  That's so far the only
concern I have.

> 
> 1) It seems the "help" option is tied to the class. Setting options
> work, but the help says otherwise:
> 
>  $ ~/qemu-system-x86_64 -nographic -object migration,id=mig1,help                                                                            
>  There are no options for migration.

This one is easy, something like this should work:

 bool type_print_class_properties(const char *type)
 {
+    g_autoptr(Object) obj = NULL;                                                                                                       
     ObjectClass *klass;
     ObjectPropertyIterator iter;
     ObjectProperty *prop;
@@ -134,7 +135,12 @@ bool type_print_class_properties(const char *type)
     }
 
     array = g_ptr_array_new();
-    object_class_property_iter_init(&iter, klass);                                                                                      
+    if (object_class_is_abstract(klass)) {                                                                                              
+        object_class_property_iter_init(&iter, klass);                                                                                  
+    } else {                                                                                                                            
+        obj = object_new_with_class(klass);                                                                                             
+        object_property_iter_init(&iter, obj);                                                                                          
+    }                                                                                                                                   
     while ((prop = object_property_iter_next(&iter))) {
         if (!prop->set) {
             continue;

> 
> 2) user_creatable_add_qapi
> 
>  The command line parsing goes through user_creatable_add_qapi() and
>  instantiates an object. Since migrate_params_init runs from inside
>  .instance_init, it cannot see any parameters that are set this way.
> 
>  Moreover, the migration_object_init() call from vl.c will init a
>  second migration object.
> 
>  In the patch below I have hacked the current_migration assignment to
>  first check if the object has already been created and use that
>  instead of creating a new one.

Yeah that trick should work at least for now, except the concern I raised
above.

Since the tap work is unblocked (by temporarily introducing the tap flag),
I plan to put aside the "-incoming config:*" work a bit.  We'll need to
pick it up at least when there's yet another similiar use case like tap or
"mode" of CPR, but then lower priority. But let me know if you or anyone
still think we should have it land earlier, I can re-prioritize that.

> 
>  How does this work for normal objects? I suppose most of them have the
>  TYPE_DEVICE as a parent, so they're not hanging in the "objects"
>  container.

I may not get the real question behind, but.. iiuc normal objects shouldn't
be sub-class of TYPE_DEVICE, and they should work fine with -object *help,
and they should be able to be created with multiple instances in most
cases.

> 
> 3) TLS (of course)
> 
>  With the patch below, setting TLS options from the cmdline asserts:
>  visit_start_alternate: Assertion `!(v->type & VISITOR_INPUT)' failed.
>  (just mentioning in case it can affect the design of this series)

Oh, I didn't really notice we'll have issue with it.. I did the string prop
solution for tls* by pure accident, because we already assumed it's always
strings anyway and it's trivial to use the object prop str helpers.  I
didn't expect it an issue when used with string inputs.  So I assume for
those we need to rely on JSON formats?

  -object '{"qom-type": "migration", "id": "mig1", "tls-creds": "SOMETHING"}'

> 
> [0]
> -->8--
> From 8c6c0743f1659d9df45e80334e8dc5f068ff984e Mon Sep 17 00:00:00 2001
> From: Fabiano Rosas <farosas@suse.de>
> Date: Tue, 9 Jun 2026 16:00:21 -0300
> Subject: [PATCH] wip
> 
> ---
>  migration/migration.c | 11 ++++++++++-
>  migration/options.c   |  1 +
>  qapi/qom.json         | 29 +++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index ae0c373549..22c8ced766 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -297,7 +297,16 @@ void migration_object_init(void)
>  {
>      /* This can only be called once. */
>      assert(!current_migration);
> -    current_migration = MIGRATION(object_new(TYPE_MIGRATION));
> +
> +    Object *root = object_get_objects_root();
> +    ObjectProperty *prop = g_hash_table_lookup(root->properties, "mig1");
> +
> +    if (prop->opaque) {
> +        current_migration = prop->opaque;
> +        object_ref(current_migration);
> +    } else {
> +        current_migration = MIGRATION(object_new(TYPE_MIGRATION));
> +    }

A quick comment for this one; maybe better with:

     Object *mig_obj = object_resolve_path_component(object_get_objects_root(),                                                          
                                                     "mig1");                                                                            

Or even better:

static int find_migration_object(Object *obj, void *opaque)
{
    if (object_dynamic_cast(obj, TYPE_MIGRATION)) {
        *(Object **)opaque = obj;
        return 1;
    }
    return 0;
}

Then:

     object_child_foreach(object_get_objects_root(),
                          find_migration_object, &existing);

>  
>      /*
>       * Init the migrate incoming object as well no matter whether
> diff --git a/migration/options.c b/migration/options.c
> index 1cc99382d3..88f02c45a1 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -21,6 +21,7 @@
>  #include "qapi/qapi-visit-migration.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qobject/qnull.h"
> +#include "qom/object_interfaces.h"
>  #include "system/runstate.h"
>  #include "migration/colo.h"
>  #include "migration/cpr.h"
> diff --git a/qapi/qom.json b/qapi/qom.json
> index dd45ac1087..fe7dd4673c 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -8,6 +8,11 @@
>  { 'include': 'block-core.json' }
>  { 'include': 'common.json' }
>  { 'include': 'crypto.json' }
> +# FIXME: this requires --disable-tools due to:
> +# /usr/bin/ld.bfd: libqemuutil.a.p/meson-generated_.._qapi_qapi-commands-migration.c.o:
> +# in function `qmp_marshal_query_migr: qemu/build/qapi/qapi-commands-migration.c:48:(.text+0x181c):
> +# undefined reference to `qmp_query_migrate'
> +{ 'include': 'migration.json' }
>  
>  ##
>  # ***********************
> @@ -1187,6 +1192,28 @@
>    'data': { '*cpu-affinity': ['uint16'],
>              '*node-affinity': ['uint16'] } }
>  
> +
> +##
> +# @MigProperties:
> +#
> +# Properties for migration objects.
> +#
> +# @multifd: this is a capability and therefore is not part of
> +#     MigrationParameters yet (WIP).  (default: 0)
> +#
> +# @store-global-state: this is a compat property and therefore is not
> +#     part of MigrationParameters.  It's probably best to keep it like
> +#     this so we don't have to deal with previously impossible
> +#     scenarios if the user tries to set it via set-migrate  (default:
> +#     0)
> +#
> +# Since: 11.1
> +##
> +{ 'struct': 'MigProperties',
> +  'base': 'MigrationParameters',
> +  'data': { '*multifd': 'bool',
> +            '*store-global-state': 'bool' } }
> +
>  ##
>  # @ObjectType:
>  #
> @@ -1237,6 +1264,7 @@
>      'memory-backend-ram',
>      { 'name': 'memory-backend-shm',
>        'if': 'CONFIG_POSIX' },
> +    'migration',
>      'pef-guest',
>      { 'name': 'pr-manager-helper',
>        'if': 'CONFIG_LINUX' },
> @@ -1315,6 +1343,7 @@
>        'memory-backend-ram':         'MemoryBackendProperties',
>        'memory-backend-shm':         { 'type': 'MemoryBackendShmProperties',
>                                        'if': 'CONFIG_POSIX' },
> +      'migration':                    'MigProperties',
>        'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'qtest':                      'QtestProperties',
> -- 
> 2.53.0
> 
> 

-- 
Peter Xu


