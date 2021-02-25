Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp349773lfg;
        Thu, 25 Feb 2021 05:26:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9mm0rch4BVMekgEVZLN9GdsgaA9+T2/zgYr0Vs2zJJOALXBbV5U47Cl/lnT/EBZihUGN+
X-Received: by 2002:a02:ca47:: with SMTP id i7mr3163935jal.33.1614259584435;
        Thu, 25 Feb 2021 05:26:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614259584; cv=none;
        d=google.com; s=arc-20160816;
        b=bZHiBn7ANwhoeIhmlkv1oGiZPuJdZsO9zW3/WgdvkQh9mhNhltSBoGpNuv8n+ph4EB
         EqeRTs/x7HAY9YiMn5I5AA3HP6PDeAmSSIlGM9Hj6O09Js+vSo0ktBKEN+qRO3pPooS/
         06V8+bxew4Mg9dJczgU5th10gsBsZQi62IXNyZRuxwEbr43n/cw+PpqAs+NBVzVJdkzx
         A9QP5KYH8DtGhEtPW0m66z7iTx+EKFXj00hZuBrIUBL4+NkktA04s5HebDyPjqX/baor
         /MlZP7YdlU7n2ivb4upqEX/De1JwbAf/R3nbH/qd0uCpaYLHK8SyC8GvwPvJ2peimXXX
         OSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=TkUqK/pMkDObD+D1Sta9lBixh6HS/TyipdzhzziGrRA=;
        b=xbd2JpD8zgc0nQiaEomlCkqUoHkn2Di0UmP0s93D1z3q2RoMnhWK7YhskETflZQkQq
         yntITCd2Fjr4zb7obnRgXB7ruIGO43J4X38fjsXc5ol5iZaSuPA7KoqMlmdfZWxFnyTM
         PHYTdzZPV2xt6jvOkSjRHpyFtlpQDnM2Lr18T0iNZ/1WsevkeNg5QIMdi4P8dPnqvM0S
         jq+Ss9xpIanegMPa+pBkXwQUd4ZOxwb8C4OmtrdtE8rxXXf9kw/GJs2wKbCIWOdsZukK
         LEGHBIBqMA5XOjmmmbzoj9XOnBjHgAPs0HVhxmI6LRDxDUVSToK7UlykMsnLK9l9jys4
         rK7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zjeed9d2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si5116630jat.19.2021.02.25.05.26.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 05:26:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zjeed9d2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFGet-0001Qs-Pv
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 08:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFGeZ-0001PQ-7N
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 08:26:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFGeR-00088l-Ig
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 08:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614259553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TkUqK/pMkDObD+D1Sta9lBixh6HS/TyipdzhzziGrRA=;
 b=Zjeed9d2Q0HnKepl3bGe9cv7xY3yLjYoZiBfWcQD2c8ip3EX+K2n4ltgKBysiggmkPfLV/
 vi1NnZVcstyyyyBm+pU7BBhgdDzMwmIJhHHXU0DG+TTNnaRBmqIVC6wgpwYi/d3avk91sS
 wByAOdRUw6kyO1tfxWEom86XH0SMhvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-k-16BGrrPKaYSIvoOmm3vg-1; Thu, 25 Feb 2021 08:25:49 -0500
X-MC-Unique: k-16BGrrPKaYSIvoOmm3vg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D511005501;
 Thu, 25 Feb 2021 13:25:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0EE6090F;
 Thu, 25 Feb 2021 13:25:38 +0000 (UTC)
Date: Thu, 25 Feb 2021 14:25:36 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 1/5] device_tree: Add qemu_fdt_add_path
Message-ID: <20210225132536.ns4fheaik6vt45si@kamzik.brq.redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-2-fangying1@huawei.com>
 <20210225110311.quvchs32o4n6iqpt@kamzik.brq.redhat.com>
 <278b7b03-f463-61b6-111d-1e840df22eae@huawei.com>
MIME-Version: 1.0
In-Reply-To: <278b7b03-f463-61b6-111d-1e840df22eae@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ztXM7MWIIar3

On Thu, Feb 25, 2021 at 08:54:40PM +0800, Ying Fang wrote:
> 
> 
> On 2/25/2021 7:03 PM, Andrew Jones wrote:
> > Hi Ying Fang,
> > 
> > I don't see any change in this patch from what I have in my
> > tree, so this should be
> > 
> >   From: Andrew Jones <drjones@redhat.com>
> > 
> > Thanks,
> > drew
> > 
> 
> Yes, I picked it from your qemu branch:
> https://github.com/rhdrjones/qemu/commit/ecfc1565f22187d2c715a99bbcd35cf3a7e428fa
> 
> So what can I do to make it "From: Andrew Jones <drjones@redhat.com>" ?
> 
> Can I made it by using git commit --amend like below ?
> 
> git commit --amend --author "Andrew Jones <drjones@redhat.com>"

That's one way to fix it now, but normally when you apply/cherry-pick
a patch it will keep the authorship. Then, all you have to do is
post like usual and the "From: ..." will show up automatically.

Thanks,
drew

> 
> > On Thu, Feb 25, 2021 at 04:56:23PM +0800, Ying Fang wrote:
> > > qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
> > > it also adds any missing parent nodes. We also tweak an error
> > > message of qemu_fdt_add_subnode().
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > > ---
> > >   include/sysemu/device_tree.h |  1 +
> > >   softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
> > >   2 files changed, 44 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> > > index 982c89345f..15fb98af98 100644
> > > --- a/include/sysemu/device_tree.h
> > > +++ b/include/sysemu/device_tree.h
> > > @@ -104,6 +104,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
> > >   uint32_t qemu_fdt_alloc_phandle(void *fdt);
> > >   int qemu_fdt_nop_node(void *fdt, const char *node_path);
> > >   int qemu_fdt_add_subnode(void *fdt, const char *name);
> > > +int qemu_fdt_add_path(void *fdt, const char *path);
> > >   #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
> > >       do {                                                                      \
> > > diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> > > index b9a3ddc518..1e3857ca0c 100644
> > > --- a/softmmu/device_tree.c
> > > +++ b/softmmu/device_tree.c
> > > @@ -515,8 +515,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
> > >       retval = fdt_add_subnode(fdt, parent, basename);
> > >       if (retval < 0) {
> > > -        error_report("FDT: Failed to create subnode %s: %s", name,
> > > -                     fdt_strerror(retval));
> > > +        error_report("%s: Failed to create subnode %s: %s",
> > > +                     __func__, name, fdt_strerror(retval));
> > >           exit(1);
> > >       }
> > > @@ -524,6 +524,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
> > >       return retval;
> > >   }
> > > +/*
> > > + * Like qemu_fdt_add_subnode(), but will add all missing
> > > + * subnodes in the path.
> > > + */
> > > +int qemu_fdt_add_path(void *fdt, const char *path)
> > > +{
> > > +    char *dupname, *basename, *p;
> > > +    int parent, retval = -1;
> > > +
> > > +    if (path[0] != '/') {
> > > +        return retval;
> > > +    }
> > > +
> > > +    parent = fdt_path_offset(fdt, "/");
> > > +    p = dupname = g_strdup(path);
> > > +
> > > +    while (p) {
> > > +        *p = '/';
> > > +        basename = p + 1;
> > > +        p = strchr(p + 1, '/');
> > > +        if (p) {
> > > +            *p = '\0';
> > > +        }
> > > +        retval = fdt_path_offset(fdt, dupname);
> > > +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
> > > +            error_report("%s: Invalid path %s: %s",
> > > +                         __func__, path, fdt_strerror(retval));
> > > +            exit(1);
> > > +        } else if (retval == -FDT_ERR_NOTFOUND) {
> > > +            retval = fdt_add_subnode(fdt, parent, basename);
> > > +            if (retval < 0) {
> > > +                break;
> > > +            }
> > > +        }
> > > +        parent = retval;
> > > +    }
> > > +
> > > +    g_free(dupname);
> > > +    return retval;
> > > +}
> > > +
> > >   void qemu_fdt_dumpdtb(void *fdt, int size)
> > >   {
> > >       const char *dumpdtb = current_machine->dumpdtb;
> > > -- 
> > > 2.23.0
> > > 
> > > 
> > 
> > .
> > 
> 

