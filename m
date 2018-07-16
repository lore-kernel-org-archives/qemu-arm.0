Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1925129wru;
        Mon, 16 Jul 2018 14:06:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfaj2SvuJ5hZ1puF4Qi6FcOx6DkL819i+KHW6PAUjQ72p3Yypljsu9CxxXhGwmEIhg5xoej
X-Received: by 2002:a0c:ac85:: with SMTP id m5-v6mr19907274qvc.197.1531775215757;
        Mon, 16 Jul 2018 14:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531775215; cv=none;
        d=google.com; s=arc-20160816;
        b=zE93S6OuUatS2qhWjoEPtgCWvWTgWE/LJh3HHa/iKk8Ty0Yh8kPXVfUsbXmav9UKOr
         bVZbV/psEo1fqrab3jZ1rSO9yZK7LG0TIOTsYnO/YHND4GNAywn+P8mbVqlHo7NKUbIa
         3HGUe6ypQkVm8sqpRU1VfCjjmPr2vaDEatMbYjRyWCIwC1P9LddXLvZk4AnpnEgKnz/u
         k1YYQ6RoiFJ3JuTNCrv5WAbuLnco1mYRLGbM1+x0S16AuM74MIa6NKCGiyw/cS3TYptw
         gfMYFDEt4Cl8Z6O7fSh9bYCmtLCvdCVvpPdshG6k721iFUGGPG4jgsBmTZ60wm4AMEyF
         882A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=l+byG8hiSHzAC6sxppE63vVnqUYOUppzp9lmuK/VS18=;
        b=agF23QDlY2ApcFygOHuhovNqZPo0mjUiNe4twFztBm0aYhLjo8B7Z5GqaCgig6goRg
         DqZy7vFoUfKoSdOKhQiYUfUob5U/LTG15+WW5n0eyBRcR56VEAvznvn+z+cUO2blpXOv
         q6vdI2Z4umxEWv8TYfaQfXPOcg18acH8G+mHeTrZjqAWNwS/LT2LlMP6kaN9rVS2HWf/
         03pwR6Aq5ZaXnpA0YoPamIZQ6H3WqkjaS6BXq6vcvKEnt/6GN2FmH4qlNmcGV7FDQtIX
         dI0qyEXsbC7u/xs7AZ9UGkTB24VtT4zFITxOO1AlE0yRRrwE22W8F36GFxBG285l8ZaA
         MYlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2-v6si965348qvk.118.2018.07.16.14.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 14:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffAhr-0002RM-3l
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 17:06:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ffAhf-0002RC-62
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:06:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ffAhc-0004xe-0x
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:06:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ffAhb-0004wb-NH; Mon, 16 Jul 2018 17:06:39 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com
	[10.5.11.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C09A446291;
	Mon, 16 Jul 2018 21:06:38 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB0373001647;
	Mon, 16 Jul 2018 21:06:37 +0000 (UTC)
Date: Mon, 16 Jul 2018 18:06:36 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180716210636.GS31657@localhost.localdomain>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-2-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531745974-17187-2-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 16 Jul 2018 21:06:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 01/17] qom/object: Add a new function
 object_initialize_child()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ka8RNnlR5LLs

On Mon, Jul 16, 2018 at 02:59:18PM +0200, Thomas Huth wrote:
> A lot of code is using the object_initialize() function followed by a call
> to object_property_add_child() to add the newly initialized object as a child
> of the current object. Both functions increase the reference counter of the
> new object, but many spots that call these two functions then forget to drop
> one of the superfluous references. So the newly created object is often not
> cleaned up correctly when the parent is destroyed. In the worst case, this
> can cause crashes, e.g. because device objects are not correctly removed from
> their parent_bus.
> 
> Since this is a common pattern between many code spots, let's introduce a
> new function that takes care of calling all three required initialization
> functions, first object_initialize(), then object_property_add_child() and
> finally object_unref(). And since the function does a similar job like
> object_new_with_props(), also allow to set additional properties via
> varargs, and use user_creatable_complete() to make sure that the functions
> can be used similarly.
> 
> And while we're at object.h, also fix some copy-n-paste errors in the
> comments there ("to store the area" --> "to store the error").
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/qom/object.h | 45 +++++++++++++++++++++++++++++++++++++++++--
>  qom/object.c         | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 97 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index f3d2308..f0b0bf3 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -749,6 +749,47 @@ int object_set_propv(Object *obj,
>  void object_initialize(void *obj, size_t size, const char *typename);
>  
>  /**
> + * object_initialize_child:
> + * @parentobj: The parent object to add a property to
> + * @propname: The name of the property
> + * @childobj: A pointer to the memory to be used for the object.
> + * @size: The maximum size available at @childobj for the object.
> + * @type: The name of the type of the object to instantiate.
> + * @errp: If an error occurs, a pointer to an area to store the error
> + * @...: list of property names and values
> + *
> + * This function will initialize an object. The memory for the object should
> + * have already been allocated. The object will then be added as child property
> + * to a parent with object_property_add_child() function. The returned object
> + * has a reference count of 1 (for the "child<...>" property from the parent),
> + * so the object will be finalized automatically when the parent gets removed.
> + *
> + * The variadic parameters are a list of pairs of (propname, propvalue)
> + * strings. The propname of %NULL indicates the end of the property list.
> + * If the object implements the user creatable interface, the object will
> + * be marked complete once all the properties have been processed.
> + */
> +void object_initialize_child(Object *parentobj, const char *propname,
> +                             void *childobj, size_t size, const char *type,
> +                             Error **errp, ...) QEMU_SENTINEL;
> +
> +/**
> + * object_initialize_childv:
> + * @parentobj: The parent object to add a property to
> + * @propname: The name of the property
> + * @childobj: A pointer to the memory to be used for the object.
> + * @size: The maximum size available at @childobj for the object.
> + * @type: The name of the type of the object to instantiate.
> + * @errp: If an error occurs, a pointer to an area to store the error
> + * @vargs: list of property names and values
> + *
> + * See object_initialize_child() for documentation.
> + */
> +void object_initialize_childv(Object *parentobj, const char *propname,
> +                              void *childobj, size_t size, const char *type,
> +                              Error **errp, va_list vargs);
> +
> +/**
>   * object_dynamic_cast:
>   * @obj: The object to cast.
>   * @typename: The @typename to cast to.
> @@ -1382,7 +1423,7 @@ Object *object_resolve_path_component(Object *parent, const gchar *part);
>   * @obj: the object to add a property to
>   * @name: the name of the property
>   * @child: the child object
> - * @errp: if an error occurs, a pointer to an area to store the area
> + * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Child properties form the composition tree.  All objects need to be a child
>   * of another object.  Objects can only be a child of one object.
> @@ -1420,7 +1461,7 @@ void object_property_allow_set_link(const Object *, const char *,
>   * @child: a pointer to where the link object reference is stored
>   * @check: callback to veto setting or NULL if the property is read-only
>   * @flags: additional options for the link
> - * @errp: if an error occurs, a pointer to an area to store the area
> + * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Links establish relationships between objects.  Links are unidirectional
>   * although two links can be combined to form a bidirectional relationship
> diff --git a/qom/object.c b/qom/object.c
> index 4609e34..75d1d48 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -392,6 +392,60 @@ void object_initialize(void *data, size_t size, const char *typename)
>      object_initialize_with_type(data, size, type);
>  }
>  
> +void object_initialize_child(Object *parentobj, const char *propname,
> +                             void *childobj, size_t size, const char *type,
> +                             Error **errp, ...)
> +{
> +    va_list vargs;
> +
> +    va_start(vargs, errp);
> +    object_initialize_childv(parentobj, propname, childobj, size, type, errp,
> +                             vargs);
> +    va_end(vargs);
> +}
> +
> +void object_initialize_childv(Object *parentobj, const char *propname,
> +                              void *childobj, size_t size, const char *type,
> +                              Error **errp, va_list vargs)
> +{
> +    Error *local_err = NULL;
> +    Object *obj;
> +
> +    object_initialize(childobj, size, type);
> +    obj = OBJECT(childobj);
> +
> +    object_set_propv(obj, &local_err, vargs);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +    object_property_add_child(parentobj, propname, obj, &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +    if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
> +        user_creatable_complete(obj, &local_err);
> +        if (local_err) {
> +            object_unparent(obj);
> +            goto out;
> +        }
> +    }

I don't like adding TYPE_USER_CREATABLE-specific hacks to QOM
core, but well, at least this is consistent with
object_new_with_propv().

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> +
> +    /*
> +     * Since object_property_add_child added a reference to the child object,
> +     * we can drop the reference added by object_initialize(), so the child
> +     * property will own the only reference to the object.
> +     */
> +    object_unref(obj);
> +
> +out:
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        object_unref(obj);
> +    }
> +}
> +
>  static inline bool object_property_is_child(ObjectProperty *prop)
>  {
>      return strstart(prop->type, "child<", NULL);
> -- 
> 1.8.3.1
> 

-- 
Eduardo
