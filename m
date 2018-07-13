Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1123537wrq;
        Fri, 13 Jul 2018 14:16:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcs7iNBhJDPvMHoeWq1s4zczaesK96RnG1jj2+V9P9L9Pu0yjwgB/csLxrMtqtWsK+Oa3U1
X-Received: by 2002:aed:2686:: with SMTP id q6-v6mr7399215qtd.199.1531516610531;
        Fri, 13 Jul 2018 14:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531516610; cv=none;
        d=google.com; s=arc-20160816;
        b=LTtC7gH8tNOEMzgbodbP7bIvG18XzCSXRS97O4gblNIBt+H3vCHaV1cfnGbd2SkRRR
         nzVGTo6Z43ezdeM8MZxsa29GeZDY+rtF96xSKm3tQttW1J9sQiMwZCcVVXw9eiFZC8EN
         94sXTUeFd5DRRk3Ew86pwxaHoctCnnzI4iXNcekq1yL92+WgOaB94RG69fi56zvG+BNs
         SXpxEXURTACGf1TjLcHwiTAqTAVGItBL9A9xRoulC0L/tff6Lsk/pU/SM2iKXOnNBQwj
         NIjJe601ocuQgqn+Y9rAU+HAYQ0si8Iy9BSCLgH994Eb2+kA3Qs9jDtrpGQOGg1DNKOG
         XhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=jm1xvYuS04qE07FS9NfyTZn1/7Sj1/c0Vuh4rCe+Iuc=;
        b=n+fu2cWCGpchE9at0ADowfuTQFbk6BeV8TquFOJAHutsEMn77oZCqPyez1G3X47IKd
         2PkKxhh+dGW1JVlJD/LceXZS08hZ2J5ELdVUCU2MHUHsmClMpCCbVAqXIsh5DfXnr49n
         MjxCTdCpCms8mURIaa8TqBx141LL7y8EhZz9meFmsscNU/idQX3OB1zLqEWYrjvzw+dj
         jM4R8mEVLL4yuNSmQ7SWWsiUA5WlbVAVGxtPYVeHPKZKVhqEi2YA7OeIFzTfTDoCgcxr
         nwYKzfqOQ043xTANsMN+qTgUsfMCr6OI9Js/vNmXB777KwjYRE5z0RYdGYjbDIHM02Ll
         2gyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d195-v6si12636882qke.83.2018.07.13.14.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe5Qo-00053A-0a
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:16:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5Qh-000533-UB
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5Qe-0003mT-PT
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:16:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe5Qe-0003m0-G9; Fri, 13 Jul 2018 17:16:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F30D432B674;
	Fri, 13 Jul 2018 21:16:38 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37EE119489;
	Fri, 13 Jul 2018 21:16:38 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:16:36 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713211636.GS31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-2-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-2-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 13 Jul 2018 21:16:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 01/16] qom/object: Add a new function
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
X-TUID: +W0optLgEXT8

On Fri, Jul 13, 2018 at 10:27:29AM +0200, Thomas Huth wrote:
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
> 
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

I wonder if we should deprecate object_initialize() and support
only object_initialize_child() later.  Initializing an object
contained inside another one without making it a child of the
parent object is a recipe for trouble.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
