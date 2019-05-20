Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp636957wrg;
        Mon, 20 May 2019 14:12:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdqer6GM2pVEeiGpZjJpqIPNzc305gBg3Dd8y7cThJ0CKh4yW5sLxA1oV+dY2JBn85Xzmg
X-Received: by 2002:a17:906:90c6:: with SMTP id v6mr37774359ejw.111.1558386736719;
        Mon, 20 May 2019 14:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558386736; cv=none;
        d=google.com; s=arc-20160816;
        b=H4UkKLviWCB46GCyGuYMxfSbdeqL2A4N+zoWI4gqWozBO/29bHVIUGPUxQckxgYhdO
         Pfomh5mZOtXMXZlx1eUol7nf4M73hbEHhzDfHkFik7gvVBV+nE3qedVrDPR8PMKWCqb4
         Z1BESqxIGAmmi12WkSc/1MpTK2ht4o917iq/chYN4xYTYfxWROGNql/gckFXVZwp++eC
         ZlTS4JzCJvvvPP/xwlHitgeaVH80tm69f9dGCQQzG68UUiEaQcOq7a3thqAvmi9VnY9D
         UCoIqiw/+w3V/Yfo31jbh2/3csSXE/5HSC8fKFX1vF4go/DEUxnT8Y+Nj4uec+JP3Gd1
         /cTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=R/9q/RFl8DbV+79Mgr4PzWU4W1UltbwdOezNUpZjutk=;
        b=O4WQJFs7rPF/iKrPqi+8PRgTK32Mp4AxXS6lE+/yZcJSuxmeEhgHj09hDIQmcMjH3V
         y2kB6O/AiZ2NnkAx1CrarzSYxF5FF8CVgaSQRFR0vndsAbk5CJCWRD4zQdeKu0kpdVy9
         e+XAPq9BKA5Wunshs5gUamTGVFNMnWx97YjtCwPelzU2JUeRmr0RVoKxWQDwhuP3ehDg
         yvRGlNzc3yKDxglWNnpbLEUU7ttUh1VUK6IWjuHjBhwuosOhcQ1BYtJ3iEoqt4Oq2lMy
         jOl64NLWugu4rVpHd0wvi+eMoSFZSZCo7ht+C56zO6AeMtYahb2REwVNkv5YXp/yyZqX
         54TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w31si4378663eda.349.2019.05.20.14.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 14:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSpZv-00039y-Ms
	for alex.bennee@linaro.org; Mon, 20 May 2019 17:12:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hSpZl-00039g-Bk
	for qemu-arm@nongnu.org; Mon, 20 May 2019 17:12:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hSpZk-0005Yo-EB
	for qemu-arm@nongnu.org; Mon, 20 May 2019 17:12:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36378)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hSpZk-0005YR-8w; Mon, 20 May 2019 17:12:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80BD0308FC4E;
	Mon, 20 May 2019 21:11:56 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F69D19C71;
	Mon, 20 May 2019 21:11:53 +0000 (UTC)
Date: Mon, 20 May 2019 18:11:51 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190520211151.GF10764@habkost.net>
References: <20190520152921.15959-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520152921.15959-1-lvivier@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 20 May 2019 21:12:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] numa: improve cpu hotplug error message with
 a wrong node-id
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sNXCb2Czrt6w

On Mon, May 20, 2019 at 05:29:21PM +0200, Laurent Vivier wrote:
> On pseries, core-ids are strongly binded to a node-id by the command
> line option. If a user tries to add a CPU to the wrong node, he has
> an error but it is not really helpful:
> 
>   qemu-system-ppc64 ... -smp 1,maxcpus=64,cores=1,threads=1,sockets=1 \
>                         -numa node,nodeid=0 -numa node,nodeid=1 ...
> 
>   (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=30,node-id=1
>   Error: node-id=1 must match numa node specified with -numa option
> 
> This patch improves this error message by giving to the user the good
> node-id to use with the core-id he's providing:
> 
>   Error: core-id 30 can only be plugged into node-id 0

Why just core-id?  What about the other fields at slot->props?

> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  numa.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/numa.c b/numa.c
> index 3875e1efda3a..c419c5b5b8ee 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -470,8 +470,9 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
>                                      "node-id", errp);
>          }
>      } else if (node_id != slot->props.node_id) {
> -        error_setg(errp, "node-id=%d must match numa node specified "
> -                   "with -numa option", node_id);
> +        error_setg(errp,
> +                   "core-id %"PRId64" can only be plugged into node-id %"PRId64,
> +                   slot->props.core_id, slot->props.node_id);
>      }
>  }
>  
> -- 
> 2.20.1
> 

-- 
Eduardo
