Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC7FCD98C7
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 18:47:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXNx8-0007tp-0z; Wed, 10 Jun 2026 14:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXNx5-0007sb-BI
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXNx1-0007kQ-Pu
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781117214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4sycvDnjXZCal6+QgBRKRenAqYyProEsIldQ62GmvQ=;
 b=XtBxt7ooLruCMW3AzI1R/qZ95uz4nJpgvWSd4N51EIN/z0RcqNheh5ePUsW2tC7xK0hZG1
 0rtS86k6UMoon6f/xXyFkJi9gCk69BbiPY1BoznSqn0+p2eqsi4JzjFMljLuD66xOX4bET
 uvYRh7lRE07oLS5yTez1yUBDLVk4RsE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-qrPne0exOO-Sd5DQNYWqwg-1; Wed, 10 Jun 2026 14:46:53 -0400
X-MC-Unique: qrPne0exOO-Sd5DQNYWqwg-1
X-Mimecast-MFC-AGG-ID: qrPne0exOO-Sd5DQNYWqwg_1781117213
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9157f1be083so171450585a.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781117213; x=1781722013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x4sycvDnjXZCal6+QgBRKRenAqYyProEsIldQ62GmvQ=;
 b=q4B1KSBWNLx1s+KPjjuDZbA7thI+/h7dd0B3+WjoASEnwrPYF6C8GK1jjfiNHEJKBP
 UBTh3ggINEnxBA7BO5rhJ6kJUabqJQ99XD09eh8yjJ3ubhq7hE2nRWEtmUn8DjMBth30
 bkXhuAs37DAYl5+g09YYrWO1Dg7wCb82Qt/brdWDvqd0zmVb4htBwMaksf13SBZr0oeo
 8h+dH/Zg/ZTNr3pf5bMybzpw+xE7wb1M5KCwyqi6g8sZIHutiHL8ZbXn0DlDqxVPOCDu
 xqnXzXvfe8GpLJfoamGZdiEk/ixxzfMbji0ybFFFztrHtoBjk9u6h7KrJQicFBRmBvs7
 SADQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9/KceYd11oiy/kS/oNBwGwxrIsTtvWlyznu8e8ryZozuMGiLosZMAmRK3Itz/6q9uAsm4NjzsfjA==@nongnu.org
X-Gm-Message-State: AOJu0YyJiEzu63DqTus4QIaBhCz85LxCN4yZronoSb7YHUFhgLNrn7Wb
 yNcZLhX4k2Jn8d8PDQ8y1rvNFrweumiHxELr+/4aWIDscnSuLMLs+JQDSNYdvrJFnQq4+NCBCoQ
 gp5WatSZOvdg6ML2DsoxyYVVXsRJR9Z7+aWYbGbER08kVlduNtkg+7w==
X-Gm-Gg: Acq92OEpfC0HitP0lCL4XOl+SmsRMVIipnG3iVkyh3D3tmcFrAkpPpllfc7RFEak0SZ
 gC2wsDqPalEAcud/De53no68Xdw+pjhkCSjDSWvQGsgJQuaAuWPWJ5HEKzOLminmf68+Q9BpamH
 eo1hqnWSBGv43N0zM45bF01mY3mo8Iml/B0oKmoPGhDHM4aRSOxgYBPFhn5IlA14FKuoFzIsvE4
 iOOkos1E4XffBSEdJlwsYGg93I9kVRUCEMHaYNcRr0yiJR8QG+JO8hv38wt98xJ5HOa2COqjla9
 /UM5g54XshKnA9FMRNPBzHuZ+eXa4EN/lRXSEi/N5/VFijVR7NH7kxkLrTjtcQXRTmUd+VSLsdh
 7whSVJRK8voHLUEtI+BA3yfevKg==
X-Received: by 2002:a05:620a:4048:b0:915:c4de:7ada with SMTP id
 af79cd13be357-915e82e7feemr1473599985a.27.1781117212596; 
 Wed, 10 Jun 2026 11:46:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4048:b0:915:c4de:7ada with SMTP id
 af79cd13be357-915e82e7feemr1473590285a.27.1781117211879; 
 Wed, 10 Jun 2026 11:46:51 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9158a3d3a0esm2544893785a.40.2026.06.10.11.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 11:46:51 -0700 (PDT)
Date: Wed, 10 Jun 2026 14:46:46 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Fabiano Rosas <farosas@suse.de>,
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
Subject: Re: [PATCH v2 10/10] migration: Switch to TYPE_OBJECT with object
 properties
Message-ID: <aimxFsY_B0-slXjC@x1.local>
References: <20260609172514.2037645-1-peterx@redhat.com>
 <20260609172514.2037645-11-peterx@redhat.com>
 <aimNOxqrmmXPQTfS@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aimNOxqrmmXPQTfS@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jRiq111tVpPjC8VJbCVBtWVy5iXQlLWhGQ7RzlOYKHM_1781117213
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 10, 2026 at 05:13:47PM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 09, 2026 at 01:25:14PM -0400, Peter Xu wrote:
> > The migration object used to depend on TYPE_DEVICE due to:
> > 
> > - Usage of qdev properties
> > - Apply compat properties and global properties
> > 
> > This patch re-based the object to TYPE_OBJECT with the changes:
> > 
> > - Switch to object properties API
> > - Manually apply both compat and global properties in post_init()
> > 
> > Note that to avoid too many property getter/setter helpers, this patch used
> > the object_property_add_*_ptr_def() APIs so that an pointer is passed to
> > bind to the property.  Such API is used for most of the conversions.
> > 
> > After patch, the migration object initializes instance properties within
> > its instance_init() callback, in migrate_params_init().
> > 
> > One side effect of this change is, since we switched to a loop to add all
> > capabilities, the name of the properties representing a migration
> > capability may chance from previously hard-coded ones (many with x-).  It's
> > fine since it's only used in -global so it's only for debugging.
> > 
> > Similarly, I removed "x-" from other properites that used to start with
> > "x-" but actually are not experimental.
> 
> Mixing such a change into a refactoring commit is bad practice,
> can you keep property changes separated.

Sure.

> 
> > After the whole conversion, we don't need migration_properties or the count
> > anymore, hence can be removed.  While at it, we can also remove two
> > DEFINE_PROP*() API that only migration uses (DEFINE_PROP_STR_OR_NULL, and
> > DEFINE_PROP_MIG_CAP).
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/options.h   |   8 +-
> >  migration/migration.c |  35 ++-
> >  migration/options.c   | 526 ++++++++++++++++++++++++++----------------
> >  3 files changed, 351 insertions(+), 218 deletions(-)
> 
> 
> > diff --git a/migration/options.c b/migration/options.c
> > index 5cbfd29099..1cc99382d3 100644
> > --- a/migration/options.c
> > +++ b/migration/options.c
> > @@ -54,7 +54,7 @@
> 
> 
> > +static void migration_object_init_props_bool(MigrationState *s)
> >  {
> > -    const Property *prop = opaque;
> > -    StrOrNull **ptr = object_field_prop_ptr(obj, prop);
> > -    StrOrNull *str_or_null = *ptr;
> > +    Object *obj = OBJECT(s);
> > +    int i;
> >  
> > -    /*
> > -     * The property should never be NULL because it's part of
> > -     * s->parameters and a default value is always set by qdev. It
> > -     * should also never be QNULL as the setter doesn't allow it.
> > -     */
> > -    assert(str_or_null && str_or_null->type != QTYPE_QNULL);
> > -    visit_type_str(v, name, &str_or_null->u.s, errp);
> > +    struct MigPropBool {
> > +        const char *name;
> > +        void *ptr;
> > +        bool defvar;
> > +    } bool_list[] = {
> > +        {
> > +            "store-global-state",
> > +            &s->store_global_state,
> > +            true,
> > +        },
> > +        {
> > +            "send-configuration",
> > +            &s->send_configuration,
> > +            true,
> > +        },
> > +        {
> > +            "send-section-footer",
> > +            &s->send_section_footer,
> > +            true,
> > +        },
> > +        {
> > +            "send-switchover-start",
> > +            &s->send_switchover_start,
> > +            true,
> > +        },
> > +        {
> > +            "x-preempt-pre-7-2",
> > +            &s->preempt_pre_7_2,
> > +            false,
> > +        },
> > +        {
> > +            "x-cpu-throttle-tailslow",
> > +            &s->parameters.cpu_throttle_tailslow,
> > +            false,
> > +        },
> > +        {
> > +            "multifd-clean-tls-termination",
> > +            &s->multifd_clean_tls_termination,
> > +            true,
> > +        },
> > +        {
> > +            "multifd-flush-after-each-section",
> > +            &s->multifd_flush_after_each_section,
> > +            false,
> > +        },
> > +    };
> > +    struct MigPropBool *prop;
> 
> This approach to declaring properties is pretty unpleasant
> to follow IMHO. Being a custom different approach from every
> other object impl is not a good thing.

[I asked this question elsewhere, I'll keep the discussion there]

> 
> > +
> > +    for (i = 0; i < ARRAY_SIZE(bool_list); i++) {
> > +        prop = &bool_list[i];
> > +        object_property_add_bool_ptr_def(obj, prop->name,
> > +                                         prop->ptr, prop->defvar);
> > +    }
> 
> Using instance level properties is the old way to do things,
> it is preferred to use class level properties instead.
> 
> This means you can't use the "ptr" concept to directly reference
> the instance fields and have to provide setters / getters explicitly
> instead, but as you've shown with the TLS properties,  a macro can
> make it simple to define the repetitive getters/setters.

If pointer is unwanted, I can switch to some more macro magic.  But since
this series got rewrote the 3rd time..  I'll make sure it's extremely
required before doing it..

> > +static void migration_object_init_props_enum(MigrationState *s)
> > +{
> > +    Object *obj = OBJECT(s);
> > +    ObjectProperty *prop;
> > +
> > +    prop = object_property_add_enum(obj, "multifd-compression",
> > +                                    "MultiFDCompression",
> > +                                    &MultiFDCompression_lookup,
> > +                                    mig_prop_multifd_compression_get,
> > +                                    mig_prop_multifd_compression_set);
> > +    object_property_set_default_str(prop, DEFAULT_MIGRATE_MULTIFD_COMPRESSION);
> > +
> > +    prop = object_property_add_enum(obj, "mode", "MigMode", &MigMode_lookup,
> > +                                    mig_prop_mode_get, mig_prop_mode_set);
> > +    object_property_set_default_str(prop, "normal");
> > +
> > +    prop = object_property_add_enum(obj, "zero-page-detection",
> > +                                    "ZeroPageDetection",
> > +                                    &ZeroPageDetection_lookup,
> > +                                    mig_prop_zero_page_detection_get,
> > +                                    mig_prop_zero_page_detection_set);
> > +    object_property_set_default_str(prop, "multifd");
> > +}
> 
> Perhaps I'm missing something, but I'm not seeing the point in
> using the set_default methods - in fact I'm not really sure why
> they exist in QOM at all.
> 
> I'd expect all defaults to be set in the instance _init method.
> ie why isn't this done as:
> 
>    void migrate_params_init(MigrationState *s)
>    {
>       s->parameters.mode = MIG_MODE_NORMAL;
>       s->parameters.zero_page_detection = ZERO_PAGE_DETECTION_MULTIFD;
>       .... all other defaults...
>    }

Yes frankly I asked myself the same question when looking at this.

I still saw quite some defvar references, type_print_class_properties() can
be one example where we dump help message with default values but without
the need to apply.  I didn't check the rest.  If the concept exists and if
we will be using qobj props, IMHO sticking with it is defintely safer so
that all qom future defvar changes will apply and it'll just work there.

> 
> 
> > +
> > +static void migration_object_init_properties(MigrationState *s)
> > +{
> > +    migration_object_init_props_bool(s);
> > +    migration_object_init_props_uint8(s);
> > +    migration_object_init_props_uint32(s);
> > +    migration_object_init_props_uint64(s);
> > +    migration_object_init_props_size(s);
> > +    migration_object_init_props_caps(s);
> > +    migration_object_init_props_tls(s);
> > +    migration_object_init_props_enum(s);
> > +}
> 
> ...and class properties be registered in migrate_params_class_init()
> and the grouping per type isn't helpful IMHO, just put all the
> object_class_property_add calls inline in one place.

I still want to avoid long functions, one way or another.

Hopefully it makes sense when I have those arrays to init different type of
props it makes sense to split with this, but I'm open to other way to
split.  I still want to not make it a extremely long function.

Thanks,

> 
> >  
> >  bool migrate_auto_converge(void)
> >  {
> > @@ -1107,9 +1246,10 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
> >      return params;
> >  }
> >  
> > -void migrate_params_init(MigrationParameters *params)
> > +void migrate_params_init(MigrationState *s)
> >  {
> > -    migrate_mark_all_params_present(params);
> > +    migration_object_init_properties(s);
> > +    migrate_mark_all_params_present(&s->parameters);
> >  }
> >  
> >  static void migrate_post_update_params(MigrationParameters *new, Error **errp)
> > -- 
> > 2.53.0
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
> 

-- 
Peter Xu


