Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp308644wrd;
        Fri, 17 Aug 2018 08:05:43 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw8X6Igjon2iTc+QVFWAu9bqp6BnQpKpieYpk0RbqgThQDouUC5D6s/V+kokspAiU6Rk/mF
X-Received: by 2002:a37:5742:: with SMTP id l63-v6mr32250372qkb.246.1534518343145;
        Fri, 17 Aug 2018 08:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534518343; cv=none;
        d=google.com; s=arc-20160816;
        b=FNz+D3aXSj7wRhKvLHu6jc72SpZSX0nEYNNJGNM8BqaRZwQfE5KkcDz+EXJqxmMOws
         1X0AO3LpgDpkBID2fLzcZhedHjUDtEbIWi+3UWZAF5zO1t4Y1HKLACxk6DxG+CWwT7sZ
         SYDllHnOWx8N52zutUgDl5GedYXG5joKObl8wMaesLv+OlVf4F+ZmfycmQ3SPlWMDMCD
         ACOdeDXK+47LGL8FBRPeNv2HWwecxxvBY3H6WsIILBORP/QN/lb5J/kDM3aSTOEvh0Gf
         QirS/iJNxrVIdUd5ZngZPErJLg4I3Z7zu7oU4LxBeeCAayelFrdehvPbZpZOadaAjAlU
         IiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=JkERALybcARUcIs/ljFW9HVJPToQEmipP4VGzAJpS00=;
        b=gLcU2GwbILTLjflBy//DUdmR45dv/EFkXe/cnSoBrQV3aEjxMqKorv6OdgcJubD4e6
         TpYlKfHOeLxpWOY6NSQelidZKjMdYyvIDX33EVa87CD5aN1RAoKoSClpEdqM2XCBhhZ4
         1G+7VYv+UfaQqkWVVEjKCgQcjO/6Mdqt2M0rARt4aP59/hcq9M5P2yoZDYJDZVmlWdim
         RS2EaSHHnxU60IhEiFYrBcEO618fwxZvk5yu+r3Qi3C18+LOhStdzhLeySeXjbkBsU+O
         a/+/5cFgCxPB3mdpYn8IM9bnLE7At3GvYw8IkO58QlAuWNhQj9LPtebSRw5uyfGNDz+g
         6MsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5-v6si2136824qvq.156.2018.08.17.08.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 08:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqgJq-0002PZ-Ik
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 11:05:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fqgFA-0006bA-FU
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 11:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fqgF5-0006AY-En
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 11:00:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56724 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fqgF5-00064W-8s; Fri, 17 Aug 2018 11:00:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28A6976F90;
	Fri, 17 Aug 2018 15:00:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FD2D1010439;
	Fri, 17 Aug 2018 15:00:33 +0000 (UTC)
Date: Fri, 17 Aug 2018 17:00:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180817150031.wykey3jih3a47yhl@kamzik.brq.redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
	<20180704124923.32483-3-drjones@redhat.com>
	<20180723144254.663f457f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180723144254.663f457f@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 17 Aug 2018 15:00:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 17 Aug 2018 15:00:39 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 2/6] device_tree: add
 qemu_fdt_add_path
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
Cc: peter.maydell@linaro.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x+mHHUFsUoTF

On Mon, Jul 23, 2018 at 02:42:54PM +0200, Igor Mammedov wrote:
> On Wed,  4 Jul 2018 14:49:19 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > qemu_fdt_add_path works like qemu_fdt_add_subnode, except it
> > also recursively adds any missing parent nodes.
> 
> Probably add here why new helper is need?

OK

> 
> > 
> > Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> > Cc: Alexander Graf <agraf@suse.de>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  device_tree.c                | 24 ++++++++++++++++++++++++
> >  include/sysemu/device_tree.h |  1 +
> >  2 files changed, 25 insertions(+)
> > 
> > diff --git a/device_tree.c b/device_tree.c
> > index 6d9c9726f66c..ad570a4dbe3a 100644
> > --- a/device_tree.c
> > +++ b/device_tree.c
> > @@ -520,6 +520,30 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
> >      return retval;
> >  }
> >  
> > +int qemu_fdt_add_path(void *fdt, const char *path)
> > +{
> > +    char *parent;
> > +    int offset;
> > +
> > +    offset = fdt_path_offset(fdt, path);
> > +    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
> > +        error_report("%s Couldn't find node %s: %s", __func__, path,
> > +                     fdt_strerror(offset));
> > +        exit(1);
> > +    }
> > +
> > +    if (offset != -FDT_ERR_NOTFOUND) {
> > +        return offset;
> > +    }
> > +
> > +    parent = g_strdup(path);
> > +    strrchr(parent, '/')[0] = '\0';
> > +    qemu_fdt_add_path(fdt, parent);
> can it be implemented without recursion?

It can, but it gets ugly quick, as we need to walk forward, instead of
backward, building the path node by node, instead of letting the recursion
do its magic. g_strsplit() and g_strjoinv() help, but it's still not very
nice. This file already uses recursion in read_fstree() and the recursion
of this function is bounded by the number of /'s in the input path. I'd
rather leave this function recursive, unless people feel strongly about
it. I should add a sanity check for the root '/' though.

> 
> > +    g_free(parent);
> > +
> > +    return qemu_fdt_add_subnode(fdt, path);
> > +}
> > +
> >  void qemu_fdt_dumpdtb(void *fdt, int size)
> >  {
> >      const char *dumpdtb = qemu_opt_get(qemu_get_machine_opts(), "dumpdtb");
> > diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> > index c16fd69bc0b1..d62fc873a3ea 100644
> > --- a/include/sysemu/device_tree.h
> > +++ b/include/sysemu/device_tree.h
> > @@ -101,6 +101,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
> >  uint32_t qemu_fdt_alloc_phandle(void *fdt);
> >  int qemu_fdt_nop_node(void *fdt, const char *node_path);
> >  int qemu_fdt_add_subnode(void *fdt, const char *name);
> 
> /**
>  * qemu_fdt_add_path: ....
>  ...
> */
> 
> It would be nice to have a doc comment here

OK

Thanks,
drew

> 
> > +int qemu_fdt_add_path(void *fdt, const char *path);
> >  
> >  #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
> >      do {                                                                      \
> 
> 
