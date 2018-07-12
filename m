Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1610895wrq;
        Thu, 12 Jul 2018 10:15:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf0C3J4MNNxJnJJLEZAy0rLLsU2hFWG1+BN2Jbhl+IhngOY8ueKzOwYiA4r2O3dvlYhGwrx
X-Received: by 2002:ae9:edc5:: with SMTP id c188-v6mr2489401qkg.92.1531415722100;
        Thu, 12 Jul 2018 10:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531415722; cv=none;
        d=google.com; s=arc-20160816;
        b=EW4jbBGP6SNlSt6cTcQPQWH0h4bmtUioDhAuj2z8kpuu66D+1uUJCP/xwS4gU2BVVO
         MrWMSlMjoNEmLSR37WHTb5f+JpfVwj1BcnKqf011zCdiQ+rzuiMtc2wc7rjQw+Is8mkY
         xXN62BtL+hJxHtynu/RfFd7ig9KYcm9g7dgCa38yZLCLa1rpMHh1gFa7CQO+beCfHwR4
         +BLJLf4UuiNILY+uwlKJr8K2lI51qsMEXGi+9PIs9i6bxdnvXsDcgX+9vQuz4W3NFPf9
         nU+ktYgseB5jloTsZZRBLzBEZuHs2VoywVtogMkEgBa82ukzuAwtDxVcYjUExwokkkpv
         yYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=L35CaRA79GJ30aS5TkhbA+lPgNDoIiMlOuEqDnDtBV0=;
        b=l2dpfzCVcJoZFncgYg8nCcc+y/Zzqsncg0YbxW8tMga8xojQK958zgTHp8NtxuOcxb
         hHsKbV2moLBrXM4B2U8GTWRzsdXvfn2IE5WDnCWH+DxRJsokzhUDyEYRAh8r61Y+ob3c
         f67a3I0ffxxkMMcPquJ/JkC/yVE1R5Cp1F7aBavO9EsgeCYifXor9hCpbwThPD0S0pnZ
         wBWJVilqF7zf0U3C2w67X8i7FM3t6kxAB0cthYmfueu5gsrHbXmHFBEowvJ+rj1wkqCM
         /zQbvVOEf+QDFU8b6VcLm6QOpCvnZXbXzCA4qhJ88ZI8p+rBTbx3Z127S5EC6MswP6+R
         NZSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e33-v6si3513635qte.258.2018.07.12.10.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 10:15:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdfBZ-0001D2-GS
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 13:15:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdfBR-0001A2-N4
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:15:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdfBO-0006XW-DE
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:15:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52672)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fdfBO-0006WN-3d; Thu, 12 Jul 2018 13:15:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F44F3082270;
	Thu, 12 Jul 2018 17:15:09 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDA42194AE;
	Thu, 12 Jul 2018 17:15:08 +0000 (UTC)
Date: Thu, 12 Jul 2018 14:15:07 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180712171507.GN914@localhost.localdomain>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
	<1531409463-3843-2-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531409463-3843-2-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 12 Jul 2018 17:15:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/5] qom/object: Add a new
 function object_initialize_as_child()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hz9xD6dfXh10

On Thu, Jul 12, 2018 at 05:30:59PM +0200, Thomas Huth wrote:
> A lot of code is using the object_initialize() function followed by a call to
> object_property_add_child() to add the newly initialized object as a child of
> the current object. Both functions increase the reference counter of the new
> object, but many spots that call these two functions then forget to drop one
> of the superfluous references. So the newly created object is often not cleaned
> up correctly when the parent is destroyed. In the worst case, this can cause
> crashes, e.g. because device objects are not correctly removed from their
> parent_bus.
> Since this is a common pattern between many code spots, let's introdcue a
> new function that takes care of calling all three required initialization
> functions, first object_initialize(), then object_property_add_child() and
> finally object_unref().
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/qom/object.h | 19 +++++++++++++++++++
>  qom/object.c         | 14 ++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index f3d2308..c1b254c 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -749,6 +749,25 @@ int object_set_propv(Object *obj,
>  void object_initialize(void *obj, size_t size, const char *typename);
>  
>  /**
> + * object_initialize_as_child:
> + * @parentobj: The parent object to add a property to
> + * @propname: The name of the property
> + * @childobj: A pointer to the memory to be used for the object.
> + * @size: The maximum size available at @obj for the object.
> + * @type: The name of the type of the object to instantiate.
> + * @errp: If an error occurs, a pointer to an area to store the area

"to store the error"

> + *
> + * This function will initialize an object. The memory for the object should
> + * have already been allocated. The object will then be added as child property
> + * to a parent with object_property_add_child() function. The returned object
> + * has a reference count of 1, and will be finalized when the last reference is
> + * dropped.

I think we need to document clearly who owns the reference and is
responsible for dropping it.  In this case, we need to make it
clear that the child property will own the reference, and nobody
should drop it except object_finalize_child_property().  This is
a subtle but important difference from object_initialize().


> + */
> +void object_initialize_as_child(Object *parentobj, const char *propname,
> +                                void *childobj, size_t size, const char *type,
> +                                Error **errp);
> +
> +/**
>   * object_dynamic_cast:
>   * @obj: The object to cast.
>   * @typename: The @typename to cast to.
> diff --git a/qom/object.c b/qom/object.c
> index 4609e34..de2ded0 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -392,6 +392,20 @@ void object_initialize(void *data, size_t size, const char *typename)
>      object_initialize_with_type(data, size, type);
>  }
>  
> +void object_initialize_as_child(Object *parentobj, const char *propname,
> +                                void *childobj, size_t size, const char *type,
> +                                Error **errp)
> +{
> +    object_initialize(childobj, size, type);
> +    object_property_add_child(parentobj, propname, OBJECT(childobj), errp);
> +    /*
> +     * Since object_property_add_child added a reference to the child object,
> +     * we can drop the initial reference from object_initialize now.
> +     */
> +    object_unref(OBJECT(childobj));

I suggest "drop the reference added by object_initialize(), the
child property will own the only reference to the object".

-- 
Eduardo
