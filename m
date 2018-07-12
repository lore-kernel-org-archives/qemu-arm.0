Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1587196wrq;
        Thu, 12 Jul 2018 09:52:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcVAOPqtvJ71h1R/I8YClGQ0OhzrjYeUN3JlR3Cs1uej2/4MV/ADlqlZrk6YxCP/uWwjACr
X-Received: by 2002:aed:2496:: with SMTP id t22-v6mr2643472qtc.44.1531414361494;
        Thu, 12 Jul 2018 09:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531414361; cv=none;
        d=google.com; s=arc-20160816;
        b=yVZPR3+YoOAGsrn/gZqeMpVXJ+gqweWXitxhMhLMkUVILOHYakq1FlpUyh+FUvh0DJ
         3T1mZcwT4Mm22d7R3HkArrnb5fMeLo+S26of2Bs2oiQ4QRnsKyriBLFkHzg3prJ2+o9W
         5P7h9L2smdXU+zypohKAaxWOIzTVOLja6w//f9mPjACafOg9OAMokcpNv1E2Qet8wmJU
         XuXWFoTxsmlHY1NSUcmnwXY5Dkn0BPloWafvgRYy9RnWA/tvF1l4SaBn+KpnnGb1RvSu
         YSJv8GNETI4CxEr38kUynJ7YpRx7RNlLu9bjFk4T26fYeM07tNwiHD7VKCHEEv+ySJVm
         iSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=hpSXkc0/Br7dhaXqPoxzSCKuZS8Jnq+p9DCrRCuLJf0=;
        b=VNa0sFJSI9tmtBE/uTksjSetZJ/wdkjl6FS8r+ewbcd+9v1cmLBL44pfV/hhWaBjii
         k7HWx30Jcn0G+BaDIFjFlAZNIuWG6NyX/VERRrYlHflYPG5Ily5N+FczkPkyx+kJsYpT
         hjXo8VKQIozs7dVuQvDkncuCqZdu6ZuX+gXpse94RcYd4R+HNPfgqGLhrjDE61ya/Qpw
         EsDSkD+HxLpUlD+t2Ob46mypRVjJGGh0fvJMuJ7HfZW5t/KCkwGUZT9WtH7LD2uq1tkO
         F/F4ggOPBqtFzCav56ZT+6pcMJni9ut4eRyvL4ujhumVkxy/XGAqY2rJGtnHciog6GNE
         wQPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5-v6si3101999qki.111.2018.07.12.09.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 09:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdepd-0008Kh-2Y
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 12:52:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdepU-0008KR-Fu
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdepP-0002yL-Gc
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:52:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42144)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fdepP-0002y4-8p; Thu, 12 Jul 2018 12:52:27 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com
	[10.5.11.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3488B356CD;
	Thu, 12 Jul 2018 16:52:26 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5E5630A62E7;
	Thu, 12 Jul 2018 16:52:25 +0000 (UTC)
Date: Thu, 12 Jul 2018 13:52:24 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180712165224.GD31657@localhost.localdomain>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
	<1531409463-3843-2-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531409463-3843-2-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 12 Jul 2018 16:52:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/5] qom/object: Add a new function
 object_initialize_as_child()
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
X-TUID: SAXkdMyqPdSQ

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
> + *
> + * This function will initialize an object. The memory for the object should
> + * have already been allocated. The object will then be added as child property
> + * to a parent with object_property_add_child() function. The returned object
> + * has a reference count of 1, and will be finalized when the last reference is
> + * dropped.
> + */
> +void object_initialize_as_child(Object *parentobj, const char *propname,
> +                                void *childobj, size_t size, const char *type,
> +                                Error **errp);

Why did you use void* instead of Object*?

-- 
Eduardo
