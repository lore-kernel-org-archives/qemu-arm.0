Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40B9C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 12:17:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh4jr-0004WO-4K; Tue, 07 Jul 2026 08:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wh4jq-0004U0-6j
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 08:17:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wh4jn-0004al-UU
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 08:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783426639;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=topAd8gfigeNm5ATkLuSoGde/QjWG1RNSihruxpvfXg=;
 b=DYKdrIVMpTlTKcyk+VnT/yGBhebf0nC6gITUeN5Kjfwfpgt7/UAVgiTB1TipFaZ42FakTG
 JTEkvqEikKKGfkJ93tkRBo2pM5gU9a7Kd5WnXrQm2WaphtkVnBpb7oRSOmU0Y8dGREIhUI
 c0Mp2311sX7dwpscxAYYrguJTGxicx4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-UmyLUrZCNdGnkYdtkppcAw-1; Tue,
 07 Jul 2026 08:17:16 -0400
X-MC-Unique: UmyLUrZCNdGnkYdtkppcAw-1
X-Mimecast-MFC-AGG-ID: UmyLUrZCNdGnkYdtkppcAw_1783426635
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B470419540C3; Tue,  7 Jul 2026 12:17:14 +0000 (UTC)
Received: from redhat.com (unknown [10.44.33.142])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A25CC1955F7B; Tue,  7 Jul 2026 12:17:10 +0000 (UTC)
Date: Tue, 7 Jul 2026 13:17:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@mailo.com, aurelien@aurel32.net, peter.maydell@linaro.org,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 02/12] qom/object.c: add
 object_class_property_add_uint8_ptr()
Message-ID: <akzuQ-YiaSmToNsg@redhat.com>
References: <20260703135512.3213964-1-mark.caveayland@nutanix.com>
 <20260703135512.3213964-3-mark.caveayland@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20260703135512.3213964-3-mark.caveayland@nutanix.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: ngIc9iy4X1hqo354c0X_s2UQS-YswEg18x3vuYKUA0k_1783426635
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Jul 03, 2026 at 02:53:04PM +0100, Mark Cave-Ayland wrote:
> This adds a class property that references a uint8_t within the object instance
> and is intended to be a replacement for object_property_add_uint8_ptr().
> 
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/qom/object.h |  5 +++++
>  qom/object.c         | 52 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 89c23d45ab..a55f9d0e97 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1956,6 +1956,11 @@ ObjectProperty *object_property_add_uint8_ptr(Object *obj, const char *name,
>                                                const uint8_t *v,
>                                                ObjectPropertyFlags flags);
>  
> +ObjectProperty *object_class_property_add_uint8_ptr(ObjectClass *klass,
> +                                                    const char *name,
> +                                                    ptrdiff_t v,
> +                                                    ObjectPropertyFlags flags);
> +
>  ObjectProperty *object_class_static_property_add_uint8_ptr(ObjectClass *klass,
>                                           const char *name,
>                                           const uint8_t *v,
> diff --git a/qom/object.c b/qom/object.c
> index d10bf848c0..263c313cd2 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -2741,6 +2741,38 @@ static void property_set_uint64_ptr(Object *obj, Visitor *v, const char *name,
>      *field = value;
>  }
>  
> +static void *object_class_prop_ptr(Object *obj, ptrdiff_t offset)
> +{
> +    void *ptr = obj;
> +    ptr += offset;
> +
> +    return ptr;
> +}

Perhaps just

 #define FIELD(obj, offset) ((void *)obj+(ptrdiff_t)offset)

> +
> +static void property_class_get_uint8_ptr(Object *obj, Visitor *v,
> +                                         const char *name,
> +                                         void *opaque, Error **errp)
> +{
> +    uint8_t value = *(uint8_t *)object_class_prop_ptr(obj,
> +                                                      (ptrdiff_t)opaque);

Do we need this intermediate instead of now

> +    visit_type_uint8(v, name, &value, errp);

  visit_type_uint8(v, name, FIELD(obj, opaque), errp);


> +}
> +
> +static void property_class_set_uint8_ptr(Object *obj, Visitor *v,
> +                                         const char *name,
> +                                         void *opaque, Error **errp)
> +{
> +    uint8_t *field = (uint8_t *)object_class_prop_ptr(obj,
> +                                                      (ptrdiff_t)opaque);
> +    uint8_t value;
> +
> +    if (!visit_type_uint8(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    *field = value;

Instead of all this is it sufficient to do:

   visit_type_uint8(v, name, FIELD(obj, opaque), errp);


Also, since we'll be using this pattern for int8, int16, int32,
and many more, perhaps we could define a macro that can expand
to the getter/setter impl for any scalar type. so we can do

  DEFINE_SCALAR_PROP_CALLBACKS(uint8);
  DEFINE_SCALAR_PROP_CALLBACKS(uint16);
  DEFINE_SCALAR_PROP_CALLBACKS(uint32);
  DEFINE_SCALAR_PROP_CALLBACKS(uint64);
  DEFINE_SCALAR_PROP_CALLBACKS(bool);
  ..etc..

> +}
> +
>  ObjectProperty *
>  object_property_add_uint8_ptr(Object *obj, const char *name,
>                                const uint8_t *v,

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


