Received: by 10.223.159.82 with SMTP id f18csp77088wrg;
        Thu, 30 Nov 2017 06:57:37 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYTFbg460yMKOHt/PRhsLLHQ5T0nvFAr8obBkBks1obz0L51mRl5XhbuJKRIUWNXtofVO4G
X-Received: by 10.37.188.1 with SMTP id i1mr1612899ybh.147.1512053857119;
        Thu, 30 Nov 2017 06:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512053857; cv=none;
        d=google.com; s=arc-20160816;
        b=c9+VY5ORVnYkGIqcZTV8KgnOhwh9UP+yXzV61a7BqmI2EJLZ4wNcIh0zoJwsvlfn6Z
         0weu+/UaixW865UcPa4dA9/mMNJ2TOKiYWw/BO+alQYdd/jFGtOkNNSBDhGiGe7c+lT/
         B1gO7Q9UxthmJtXJkVLQOOSwNHQ4RkCkM2VA+eyzBnTt5tXYG3pWJvnS2nx3JyLLFdFM
         0ys7Kf6twAdiwar9DGYk9X038Nq5sHel+nwg+PYDEJtzwYs87xDn8/bJRo72iGl+5+0v
         k0PhyI6RyINLDDRYCTK4gut0jCPSEwajNB6L+inTpjJWfMa5WO4m7jw0Hv/3eqorxRGp
         jwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=G1qA6EQzsCPU0SN+g5mj5Jh7uLsu9bJeLLlKfqddDw8=;
        b=zFiYOLDVbdVRGWdrDOImeVCxOqxIzP9Tb9NuGG0rZcHlAht+FMyNyCtZ/9uu6ar0Rc
         cFG/J/SqNzcOOQUKtYR29YvGCubGtNfBV0CR18h8NR9NQLRKdEHDpusjW+VGFVQIrsdR
         ltTUZxY9qYBKrUVkDdriV5Py2s/sUhOXqTvByvwBlHHFwiUkLpYZXtvLrD56VMCaYIz3
         ip4N2VNEUytLr9WAk01fy8zS/KiEGXvdfsMjWXxoBF459LZd6An46UnXectxahay7AYi
         5KwEeUESNVrKSnc/NxrQ2nxk8JC+NZIPZmrxpdusNa20tYoePtOBOHkvFDvhX2GOgqlG
         yWCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c205si842042ywc.199.2017.11.30.06.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 06:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKQHQ-0003qy-Jz
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 09:57:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eKQGj-0003Q4-5e
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 09:56:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eKQGf-0003XS-9T
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 09:56:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1eKQGf-0003X3-2O; Thu, 30 Nov 2017 09:56:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AB954E4C2;
	Thu, 30 Nov 2017 14:56:48 +0000 (UTC)
Received: from work-vm (ovpn-117-222.ams2.redhat.com [10.36.117.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3C2360BE1;
	Thu, 30 Nov 2017 14:56:33 +0000 (UTC)
Date: Thu, 30 Nov 2017 14:56:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20171130145630.GD3952@work-vm>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171130134159.9697-4-eblake@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 Nov 2017 14:56:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/3] maint: Fix macros with broken
 'do/while(0); ' usage
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
	Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alistair Francis <alistair@alistair23.me>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Max Reitz <mreitz@redhat.com>, "open list:New World" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FbRB1+A8BzEi

* Eric Blake (eblake@redhat.com) wrote:
> The point of writing a macro embedded in a 'do { ... } while (0)'
> loop is so that the macro can be used as a drop-in statement with
> the caller supplying the trailing ';'.  Although our coding style
> frowns on brace-less 'if':
>   if (cond)
>     statement;
>   else
>     something else;
> the use of do/while (0) in a macro is absolutely essential for the
> purpose of avoiding a syntax error on the 'else' - but it only works
> if there is no trailing ';' in the macro (as the ';' in the code
> calling the macro would then be a second statement and cause the
> 'else' to not pair to the 'if').
> 
> Many of the places touched in this code are examples of the ugly
> bit-rotting debug print statements; cleaning those up is left as
> a bite-sized task for another day.
> 
> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

> diff --git a/migration/rdma.c b/migration/rdma.c
> index ca56594328..9d5a424011 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -88,7 +88,7 @@ static uint32_t known_capabilities = RDMA_CAPABILITY_PIN_ALL;
>              } \
>              return rdma->error_state; \
>          } \
> -    } while (0);
> +    } while (0)

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
