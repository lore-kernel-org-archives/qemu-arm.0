Received: by 10.28.71.155 with SMTP id m27csp549580wmi;
        Thu, 22 Mar 2018 09:24:04 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvPc4wOVBwFDHC4mwpXmHRMIFoHJPPVasvT+wUXQHOzFbT9YiLocKUcgvKQS/p7P1NTLbrw
X-Received: by 2002:a25:5556:: with SMTP id j83-v6mr15308686ybb.21.1521735844154;
        Thu, 22 Mar 2018 09:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521735844; cv=none;
        d=google.com; s=arc-20160816;
        b=l5Om28BkHU8F3EiSSb9ByB3k/X5/ORxV3m9B69TKGkWH0PqKm11/Y7fqKUIdixZfdX
         6JyLHfMA+AOPYIr4vR4hWP7vqX3IDXwC+3XPRrFfo0TrrBiYOMy74Ecb854Euhfs4KqG
         fxYc/P9v/kKJHKbUcyq6SF+vKmtGeBKS+E0im7wEF+DYXJ7wOU/FH9b5pB367ZBQf1Dt
         0AWcdKoUR4DAU40LVdnwkH1OUa/JAuPTNhWbdl6Czw5rggkWCwLta5B+B9BplQ+5V4M/
         WE80gjSlKpVXeurF3tK4qMexChNwmqErYewCfEft71u9hPMQKA4Ta8K3ob3RK1Q/euOo
         CWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=RDgGrbKn2JbrskgH4Gb7QSC+eBQcYJ319BO54p8xKoI=;
        b=dzy7/OXmNUlB8no8fMu9v79hg8eJld0XMip+RHuaUqEvdvUqbA6vSojs4zZDJ+8CfF
         PgSxrWx8RulnJV4OSMS6eZwQwhaY5ngSBtatUysBRm33mbZ3F4YP2mE7lzJr8Wm9RQBt
         rKWxsGnwZ6/TJmdGxNecX5MflzeRquneXz8EevNyfoudOvKuWGAiV7eIe6aQGtXn/BfZ
         jzON3gC9YBDdI2GqNxH8+JDvTG0cIUCXfuhDRW50PW9Jhqo4WE9plb/M9g3k1i/iuJqi
         fliehmrTt37U87LfmuOagLpgKXMfj8uKBt1wb7wpPbGopQs+ejEB0i0+feuVQ3+tUybv
         Vt/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q5si862334qkf.4.2018.03.22.09.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez30V-00025l-L9
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:24:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ez30O-00021p-KZ
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:23:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ez30L-0000Cx-HO
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:23:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46396 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1ez30L-0000CV-C0; Thu, 22 Mar 2018 12:23:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56381406FA25;
	Thu, 22 Mar 2018 16:23:52 +0000 (UTC)
Received: from work-vm (ovpn-117-132.ams2.redhat.com [10.36.117.132])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 047417C34;
	Thu, 22 Mar 2018 16:23:43 +0000 (UTC)
Date: Thu, 22 Mar 2018 16:23:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20180322162341.GC3205@work-vm>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-4-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322161226.29796-4-lvivier@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 16:23:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 16:23:52 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 3/4] qdict: remove useless cast
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ivs9+5j0wPAi

* Laurent Vivier (lvivier@redhat.com) wrote:
> Re-run Coccinelle script scripts/coccinelle/qobject.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/nvme.c | 11 +++++------
>  monitor.c    |  2 +-
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 8bca57aae6..c4f3a7bc94 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -695,12 +695,11 @@ static void nvme_parse_filename(const char *filename, QDict *options,
>          unsigned long ns;
>          const char *slash = strchr(tmp, '/');
>          if (!slash) {
> -            qdict_put(options, NVME_BLOCK_OPT_DEVICE,
> -                      qstring_from_str(tmp));
> +            qdict_put_str(options, NVME_BLOCK_OPT_DEVICE, tmp);
>              return;
>          }
>          device = g_strndup(tmp, slash - tmp);
> -        qdict_put(options, NVME_BLOCK_OPT_DEVICE, qstring_from_str(device));
> +        qdict_put_str(options, NVME_BLOCK_OPT_DEVICE, device);
>          g_free(device);
>          namespace = slash + 1;
>          if (*namespace && qemu_strtoul(namespace, NULL, 10, &ns)) {
> @@ -708,8 +707,8 @@ static void nvme_parse_filename(const char *filename, QDict *options,
>                         namespace);
>              return;
>          }
> -        qdict_put(options, NVME_BLOCK_OPT_NAMESPACE,
> -                  qstring_from_str(*namespace ? namespace : "1"));
> +        qdict_put_str(options, NVME_BLOCK_OPT_NAMESPACE,
> +                      *namespace ? namespace : "1");
>      }
>  }
>  
> @@ -1082,7 +1081,7 @@ static void nvme_refresh_filename(BlockDriverState *bs, QDict *opts)
>                   bs->drv->format_name);
>      }
>  
> -    qdict_put(opts, "driver", qstring_from_str(bs->drv->format_name));
> +    qdict_put_str(opts, "driver", bs->drv->format_name);
>      bs->full_open_options = opts;
>  }
>  
> diff --git a/monitor.c b/monitor.c
> index 6ccd2fc089..6e7667d82f 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4316,7 +4316,7 @@ static QObject *get_qmp_greeting(Monitor *mon)
>              /* Monitors that are not using IOThread won't support OOB */
>              continue;
>          }
> -        qlist_append(cap_list, qstring_from_str(QMPCapability_str(cap)));
> +        qlist_append_str(cap_list, QMPCapability_str(cap));
>      }
>  
>      return qobject_from_jsonf("{'QMP': {'version': %p, 'capabilities': %p}}",

For monitor:

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> -- 
> 2.14.3
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
