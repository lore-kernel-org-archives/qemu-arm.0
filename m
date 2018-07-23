Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5613071wru;
        Mon, 23 Jul 2018 05:43:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgperEoHgkX62nGiidKt4STduh8zQ7QectDHOYJXTCDQLs8x8svSCWlI9B1Ogv/bg5xoISqPI
X-Received: by 2002:ac8:d4a:: with SMTP id r10-v6mr11736614qti.271.1532349795802;
        Mon, 23 Jul 2018 05:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532349795; cv=none;
        d=google.com; s=arc-20160816;
        b=NbFVMDolyZZnqaD8tVgcrCbJGrq2Y5dX7F/LBZqf0Y7rtLEJx5SWfIKA9DI/YMTB7D
         emVh7S4sJ1dvAbie5q4SzT0AuTcp5JcD6zKinUqW9IydM2dzZCVIQIXhuL7uHXaHANxz
         9OAGygPT1+STclZihF4kfyQEoZudWyXpocy5nuOSOZbBYmkwytZjwrHOQRRAS4k6A/zg
         1Z0Oz08YV1C1c0tPogqGxwgA+trndWIVYt8S7PasHKQ2OpAeB8UJZffrKqvtHjBHvzTt
         omn1NG2CC9lNVqFQ0NCKqlJpiCDNxL0l0iH46wE6k4qAhatDmRrXippEab8uoACR8iH1
         iQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=++oIPBanHk72EXZSjFBEP3glTnGGgklsE/xdvf3q1DQ=;
        b=IFUAap4fW1IcSMxsMt8fGKmHMF+ESpTM9SULuOZ+4TOEpTKGJ+hKJJJdBG7YiJBqeJ
         FY10ex5UnkBa0NG13rt2ECrlQxNkwyp+sfEEBoGqGl5/Q//XHKwwZkMabOVoNs+x29Ll
         TcU4CTkvrJQ8YdDw/TC50pXIQ1G/OVv8ApaDORpee/qKqnNC+R3ukRoG4KzkKVpllDH4
         E9o9/QYlu8OjAOh+HaMmizY1z5ybuYeb+PnJWXZMRyH5YWI51aG2ZDKHkwBrqtf/W6KW
         dA8c7z2GxRNll2CS6k9TZyBzkL7jtNPWTur1J6AQSH/cRK2HErI5w2ape8h9EJa/IsQY
         su+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si670437qvl.54.2018.07.23.05.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 05:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhaBH-0000aA-C5
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 08:43:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhaB9-0000a1-Sz
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 08:43:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhaB3-0001W4-SI
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 08:43:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53932 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fhaB3-0001Vy-MP; Mon, 23 Jul 2018 08:43:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAA6D7A7E9;
	Mon, 23 Jul 2018 12:43:00 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DB54111AF0A;
	Mon, 23 Jul 2018 12:42:56 +0000 (UTC)
Date: Mon, 23 Jul 2018 14:42:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20180723144254.663f457f@redhat.com>
In-Reply-To: <20180704124923.32483-3-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
	<20180704124923.32483-3-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 23 Jul 2018 12:43:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 23 Jul 2018 12:43:00 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC PATCH 2/6] device_tree: add qemu_fdt_add_path
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, eric.auger@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xfkcGQb+j/lt

On Wed,  4 Jul 2018 14:49:19 +0200
Andrew Jones <drjones@redhat.com> wrote:

> qemu_fdt_add_path works like qemu_fdt_add_subnode, except it
> also recursively adds any missing parent nodes.

Probably add here why new helper is need?

> 
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  device_tree.c                | 24 ++++++++++++++++++++++++
>  include/sysemu/device_tree.h |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/device_tree.c b/device_tree.c
> index 6d9c9726f66c..ad570a4dbe3a 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -520,6 +520,30 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>      return retval;
>  }
>  
> +int qemu_fdt_add_path(void *fdt, const char *path)
> +{
> +    char *parent;
> +    int offset;
> +
> +    offset = fdt_path_offset(fdt, path);
> +    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
> +        error_report("%s Couldn't find node %s: %s", __func__, path,
> +                     fdt_strerror(offset));
> +        exit(1);
> +    }
> +
> +    if (offset != -FDT_ERR_NOTFOUND) {
> +        return offset;
> +    }
> +
> +    parent = g_strdup(path);
> +    strrchr(parent, '/')[0] = '\0';
> +    qemu_fdt_add_path(fdt, parent);
can it be implemented without recursion?

> +    g_free(parent);
> +
> +    return qemu_fdt_add_subnode(fdt, path);
> +}
> +
>  void qemu_fdt_dumpdtb(void *fdt, int size)
>  {
>      const char *dumpdtb = qemu_opt_get(qemu_get_machine_opts(), "dumpdtb");
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index c16fd69bc0b1..d62fc873a3ea 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -101,6 +101,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>  uint32_t qemu_fdt_alloc_phandle(void *fdt);
>  int qemu_fdt_nop_node(void *fdt, const char *node_path);
>  int qemu_fdt_add_subnode(void *fdt, const char *name);

/**
 * qemu_fdt_add_path: ....
 ...
*/

It would be nice to have a doc comment here

> +int qemu_fdt_add_path(void *fdt, const char *path);
>  
>  #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>      do {                                                                      \

