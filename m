Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp781812wrx;
        Fri, 1 Mar 2019 08:00:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqytwTBOmmlg1nUe6+vhpH+3Xn2gxgSv3kFAukYYDYvnxeJsp2+S0RLvQ++dJ2cq6IO1g+H2
X-Received: by 2002:a25:4d8b:: with SMTP id a133mr4712781ybb.165.1551456006199;
        Fri, 01 Mar 2019 08:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551456006; cv=none;
        d=google.com; s=arc-20160816;
        b=mucz6z3TO3T/NVatjg8zQPbrgkMe7qJLdx1A4hJHfXZtZEjBwbw+sA58YzJTSaJ2JA
         +REVAC3j4/GHPqS17FlF964rH4LWltSh2Z5EeMwbd4jeCYLAZf+qB7Jerv42UuhsGGU+
         Bqrbks21NfEfvrJeK5Nd6Jm9g7XpXlyakHxYAJZ2WPUXJRdGyujmiGNMtRG5lg/8KAIK
         nDQEM4qnAWVRrD9fw87+GARNKty2NRjCBC8raSnXRgu4PaeNCpY0viLDIDqYc4ZEyA+W
         BJRvadTbbfuBjWSaNAtea9D0nSe4eBr03fHdzsqIqtoM7UdiLBR1ZllXuhBjwW4q9WlJ
         8UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=xB36Vi4t8tH760X3gJdCn48VAhF2UZg7PKi3+gF1xNc=;
        b=mps6OJegxVereTy7T3RUlYZV2owIZ5kIb4M/mS5d3+Rtr4S+Lc95Udqa7kjqb9Rl7W
         FmVFGDmmnVpYYqznUTWRwi0PwxiWKap07Fb2e52n/28uwtb8KbcHzFb74lo5ck0LHztT
         kH1EjP6mgH9Zhl6tMQLtuN5N7+Limv4TgbBzE8jTdrgQOquOliLUeB3JfQUXXlMmksAM
         8q4oCaSLVgIXfX6jhcIT6XLlOep0utCNTBSJwqW3YlNIZjfsKcK91ewhS7msJICWtKyp
         CxAHF83u5XlpKsWWDbJ3ahlj1GQWLpROGUXrN8mWGE814YTmTZqozHOaHMltPVgjManf
         Eoug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p130si9385797ywg.245.2019.03.01.08.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 08:00:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzkZx-0006vn-LI
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 11:00:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gzkQC-0007ak-Fd
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 10:50:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gzkQ8-0001Gc-LO
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 10:49:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gzkQ5-0001AT-UT; Fri, 01 Mar 2019 10:49:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31E75C7CB7;
	Fri,  1 Mar 2019 15:49:53 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB971608DA;
	Fri,  1 Mar 2019 15:49:49 +0000 (UTC)
Date: Fri, 1 Mar 2019 15:49:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190301154947.GJ21251@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1551454936-205218-2-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 01 Mar 2019 15:49:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate 'mem'
 parameter of '-numa node' option
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HwyWFSWlOzfK

On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
> The parameter allows to configure fake NUMA topology where guest
> VM simulates NUMA topology but not actually getting a performance
> benefits from it. The same or better results could be achieved
> using 'memdev' parameter. In light of that any VM that uses NUMA
> to get its benefits should use 'memdev' and to allow transition
> initial RAM to device based model, deprecate 'mem' parameter as
> its ad-hoc partitioning of initial RAM MemoryRegion can't be
> translated to memdev based backend transparently to users and in
> compatible manner (migration wise).
> 
> That will also allow to clean up a bit our numa code, leaving only
> 'memdev' impl. in place and several boards that use node_mem
> to generate FDT/ACPI description from it.

Can you confirm that the  'mem' and 'memdev' parameters to -numa
are 100% live migration compatible in both directions ?  Libvirt
would need this to be the case in order to use the 'memdev' syntax
instead.

> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  numa.c               |  2 ++
>  qemu-deprecated.texi | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/numa.c b/numa.c
> index 3875e1e..2205773 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -121,6 +121,8 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>  
>      if (node->has_mem) {
>          numa_info[nodenr].node_mem = node->mem;
> +        warn_report("Parameter -numa node,mem is deprecated,"
> +                    " use -numa node,memdev instead");
>      }
>      if (node->has_memdev) {
>          Object *o;
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 45c5795..73f99d4 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -60,6 +60,20 @@ Support for invalid topologies will be removed, the user must ensure
>  topologies described with -smp include all possible cpus, i.e.
>    @math{@var{sockets} * @var{cores} * @var{threads} = @var{maxcpus}}.
>  
> +@subsection -numa node,mem=@var{size} (since 4.0)
> +
> +The parameter @option{mem} of @option{-numa node} is used to assign a part of
> +guest RAM to a NUMA node. But when using it, it's impossible to manage specified
> +size on the host side (like bind it to a host node, setting bind policy, ...),
> +so guest end-ups with the fake NUMA configuration with suboptiomal performance.
> +However since 2014 there is an alternative way to assign RAM to a NUMA node
> +using parameter @option{memdev}, which does the same as @option{mem} and has
> +an ability to actualy manage node RAM on the host side. Use parameter
> +@option{memdev} with @var{memory-backend-ram} backend as an replacement for
> +parameter @option{mem} to achieve the same fake NUMA effect or a properly
> +configured @var{memory-backend-file} backend to actually benefit from NUMA
> +configuration.
> +
>  @section QEMU Machine Protocol (QMP) commands
>  
>  @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
> -- 
> 2.7.4
> 
> --
> libvir-list mailing list
> libvir-list@redhat.com
> https://www.redhat.com/mailman/listinfo/libvir-list

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
