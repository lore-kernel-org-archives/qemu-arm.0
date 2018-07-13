Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp562532wrq;
        Fri, 13 Jul 2018 04:15:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc2YHJPzSslOWb3i8HCFv/SvGIYwgknnob9lvehRz8C348A4WUrgYbNQvKNo1qx4Swt4Dfv
X-Received: by 2002:aed:237a:: with SMTP id i55-v6mr5338246qtc.263.1531480520974;
        Fri, 13 Jul 2018 04:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531480520; cv=none;
        d=google.com; s=arc-20160816;
        b=Vsr2KBbpnP8YOCF93yQ+xznVtByjd7On+N+Q4cVriMMntAAU4Le8aetg5sqK0Qaw7Q
         8ZgN0oLraL9G8zkTh6kflxOvu/muntmUDWVHAmtIg3DyFfJkm5jZtgYOaYuUaFQYN5ox
         Cxw9fooGj/UgKir64G/dM4DrxluQejyOvXiW16d7+o+Nr6ZsAc/CGJoJrKnAAh+C5mkC
         p1ORTBPa5TOO8liSGLDFIQqrTu1YQaCWYwgEmmXntCSkWPGW3tHp95DuFEzBrNROun2E
         vsq+FTItM19K+TPCzbdSIzGoaXc3L5v+h9C37f1yxUrmVbCGS3X1xp18btaUPiOoaOc1
         f9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=P6+sOpmdiOydUjQ5+7CMQz09lP6DqUADDg38Uh0LnI8=;
        b=dp+HXXuBku9zApp+lST97kCiwSVgbleKL8oc7kMFl0VqA6FA/LHvxcaEyi38wcM9mu
         dFpc3k+aTiUqsTsWOeeCNm8Bbj/iMuiOPi/vjggLDEXvNqDd5gPRznCgFDxiOA1FBSv+
         YSlGx8C+xm6irUupDlw7C6Mf7yiAszgRQcwBlQPBcoUHzvMJAKJgoJzW3+klR3dpbiWH
         18oCdxKqG5hRWpf4WCJSMd6tISMvKqRcIEhRUEN3Yu8vQzadz+R4+leYRqNEg5ejpDIA
         SqolnX5pFu96x7N+/7YTn8fuXUawfK5RFlNMt9XBvCJNryoXI/UFvQBOTGTcGu3Fk8R+
         SFuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67-v6si10477205qkd.319.2018.07.13.04.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 04:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdw2i-0005yJ-Au
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 07:15:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdw27-0005tJ-5R
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 07:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdw22-0002ge-4H
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 07:14:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33022 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fdw1y-0002dZ-Lc; Fri, 13 Jul 2018 07:14:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D96C401B3A7;
	Fri, 13 Jul 2018 11:14:34 +0000 (UTC)
Received: from [10.36.117.240] (ovpn-117-240.ams2.redhat.com [10.36.117.240])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F482156700;
	Fri, 13 Jul 2018 11:14:31 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-2-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <31f1708a-d4cc-fdee-c47b-3b64ea514978@redhat.com>
Date: Fri, 13 Jul 2018 13:14:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1531470464-21522-2-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 11:14:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 11:14:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v2 01/16] qom/object: Add a new function
 object_initialize_child()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d2gb5WSitzDs

On 13/07/2018 10:27, Thomas Huth wrote:
> A lot of code is using the object_initialize() function followed by a call
> to object_property_add_child() to add the newly initialized object as a child
> of the current object. Both functions increase the reference counter of the
> new object, but many spots that call these two functions then forget to drop
> one of the superfluous references. So the newly created object is often not
> cleaned up correctly when the parent is destroyed. In the worst case, this
> can cause crashes, e.g. because device objects are not correctly removed from
> their parent_bus.
> 
> Since this is a common pattern between many code spots, let's introdcue a
> new function that takes care of calling all three required initialization
> functions, first object_initialize(), then object_property_add_child() and
> finally object_unref().
> 
> And while we're at object.h, also fix some copy-n-paste errors in the
> comments there ("to store the area" --> "to store the error").

Even though I'd prefer the full cleanup, I can live with this. :)

Series

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

except for patch 6 for which I've sent a replacement.

Paolo

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/qom/object.h | 23 +++++++++++++++++++++--
>  qom/object.c         | 15 +++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index f3d2308..3362db0 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -749,6 +749,25 @@ int object_set_propv(Object *obj,
>  void object_initialize(void *obj, size_t size, const char *typename);
>  
>  /**
> + * object_initialize_child:
> + * @parentobj: The parent object to add a property to
> + * @propname: The name of the property
> + * @childobj: A pointer to the memory to be used for the object.
> + * @size: The maximum size available at @obj for the object.
> + * @type: The name of the type of the object to instantiate.
> + * @errp: If an error occurs, a pointer to an area to store the error
> + *
> + * This function will initialize an object. The memory for the object should
> + * have already been allocated. The object will then be added as child property
> + * to a parent with object_property_add_child() function. The returned object
> + * has a reference count of 1 (for the "child<...>" property from the parent),
> + * so the object will get finalized automatically when the parent gets removed.
> + */
> +void object_initialize_child(Object *parentobj, const char *propname,
> +                             void *childobj, size_t size, const char *type,
> +                             Error **errp);
> +
> +/**
>   * object_dynamic_cast:
>   * @obj: The object to cast.
>   * @typename: The @typename to cast to.
> @@ -1382,7 +1401,7 @@ Object *object_resolve_path_component(Object *parent, const gchar *part);
>   * @obj: the object to add a property to
>   * @name: the name of the property
>   * @child: the child object
> - * @errp: if an error occurs, a pointer to an area to store the area
> + * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Child properties form the composition tree.  All objects need to be a child
>   * of another object.  Objects can only be a child of one object.
> @@ -1420,7 +1439,7 @@ void object_property_allow_set_link(const Object *, const char *,
>   * @child: a pointer to where the link object reference is stored
>   * @check: callback to veto setting or NULL if the property is read-only
>   * @flags: additional options for the link
> - * @errp: if an error occurs, a pointer to an area to store the area
> + * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Links establish relationships between objects.  Links are unidirectional
>   * although two links can be combined to form a bidirectional relationship
> diff --git a/qom/object.c b/qom/object.c
> index 4609e34..7be7638 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -392,6 +392,21 @@ void object_initialize(void *data, size_t size, const char *typename)
>      object_initialize_with_type(data, size, type);
>  }
>  
> +void object_initialize_child(Object *parentobj, const char *propname,
> +                             void *childobj, size_t size, const char *type,
> +                             Error **errp)
> +{
> +    object_initialize(childobj, size, type);
> +    object_property_add_child(parentobj, propname, OBJECT(childobj), errp);
> +    /*
> +     * Since object_property_add_child added a reference to the child object,
> +     * we can drop the reference added by object_initialize(), so the child
> +     * property will own the only reference to the object.
> +     */
> +    object_unref(OBJECT(childobj));
> +}
> +
> +
>  static inline bool object_property_is_child(ObjectProperty *prop)
>  {
>      return strstart(prop->type, "child<", NULL);
> 

