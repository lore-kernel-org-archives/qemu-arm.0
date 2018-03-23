Received: by 10.28.71.155 with SMTP id m27csp837552wmi;
        Fri, 23 Mar 2018 12:15:24 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuMdzMU1fSkkDTKdo7tG5hgLMbM3VPl4LAbNDxg5dmQOdyUI1ZMZWgCHM805letwF2OL6mC
X-Received: by 10.55.100.73 with SMTP id y70mr43071428qkb.293.1521832524771;
        Fri, 23 Mar 2018 12:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521832524; cv=none;
        d=google.com; s=arc-20160816;
        b=GKjPC6uC6dROw9VK7RjM/Ap1+9pm9csVQTvbCYNSOof2lnS7t+fOpOq+w3AQFdAx50
         7oUQK/2ELm87t0tbWjN7VkLlhZMaIWCjQrl2TTJqq6q+hlkynzR216VX+OF+Go/TOJj2
         NDvGlUhuGDb3Ah16DH7QgywZaZBLCPUjaLFl6QuxwCfEU1errVBr6OFhil/gTmBweJxc
         CPQVK6yPTROUUChYxzSXWUbQsleMoYylg6fcmQqD9zwxXVKh67xJh7P0aM8dlPZnrbOG
         aR8Qdqxpfbl3v2jwrFNo1mjl2I0zr9A6x4v4B7qPpqYnc7vc8OcKGHDjV4c5spcT628s
         PuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=5AWck4lpB5AOYfEBFzFNfHoeiAVO1hVFEutIrSdYqLc=;
        b=ytNoK6PmV/AbYIKFJkbA3RP95yyaWs+2eoorxxbUggRHwaUph4gEQTHCdp8MmVXSAe
         /LwVU794lfcZixE6sjzW93VMhQQ0aFcK5bIItTj+zrdDPXjg8N0n88RUFEMVzTjm+TLO
         KbTtEQXgC/oOEBgae400QcbIB/xz0nQRsOhZU6nBwTxa3a76H5ZbP+3bcIJX84qd8UDW
         isf9uB7W89ksyWifR4TC6oUj93dxuVp8g25m/UwXirdsLxrUhVLP3fCQ7RbzTKgJHki5
         OlARgUKMaUEyEuQ8+vSFgyVvpzN7nK7U89/C6tX2KnENRMZ7UwIDEl9f7kPrz0Vm2DZK
         /rTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t16si1209622qth.50.2018.03.23.12.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 12:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezS9s-0006gM-7L
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 15:15:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ezS9l-0006eT-JV
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 15:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ezS9g-0003OU-L3
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 15:15:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48004 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ezS9g-0003Nz-B2; Fri, 23 Mar 2018 15:15:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DC89722E8;
	Fri, 23 Mar 2018 19:15:01 +0000 (UTC)
Received: from [10.36.116.38] (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE162023233;
	Fri, 23 Mar 2018 19:14:48 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180323143202.28879-1-lvivier@redhat.com>
	<20180323143202.28879-4-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0a6bdc26-5380-e1e7-bf85-f124b4b3f9de@redhat.com>
Date: Fri, 23 Mar 2018 20:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180323143202.28879-4-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 23 Mar 2018 19:15:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 23 Mar 2018 19:15:01 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH v2 3/5] error: Remove NULL checks
 on error_propagate() calls
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
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g3NsrJQAsGbm

On 23.03.2018 15:32, Laurent Vivier wrote:
> Re-run Coccinelle patch
> scripts/coccinelle/error_propagate_null.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  io/channel-websock.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/io/channel-websock.c b/io/channel-websock.c
> index ec48a305f0..e6608b969d 100644
> --- a/io/channel-websock.c
> +++ b/io/channel-websock.c
> @@ -586,9 +586,7 @@ static gboolean qio_channel_websock_handshake_io(QIOChannel *ioc,
>          return TRUE;
>      }
>  
> -    if (err) {
> -        error_propagate(&wioc->io_err, err);
> -    }
> +    error_propagate(&wioc->io_err, err);
>  
>      trace_qio_channel_websock_handshake_reply(ioc);
>      qio_channel_add_watch(

Reviewed-by: Thomas Huth <thuth@redhat.com>
