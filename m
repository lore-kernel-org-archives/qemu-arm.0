Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp559900pjq;
        Thu, 30 May 2019 02:01:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWaRXU1tFre+DquT18yTin3jAVoYzTDD859LCx21ZY/duHov3WZXS/Su0WU9Fh9UX+4nQe
X-Received: by 2002:ac8:38d5:: with SMTP id g21mr2322852qtc.52.1559206873658;
        Thu, 30 May 2019 02:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559206873; cv=none;
        d=google.com; s=arc-20160816;
        b=F+A8R9ZpVKCzXj5maEHS6/SLTWcvs085m8LXw5YBByBKi7NH1vHfoEJc+jLFJs28VM
         nCB3TVc5Q8SFkSDB4wY3yhQxDsn3cEqAkAz3Jwjg8tkgwgBpD73FaQwfW33ZyVyVjzIA
         MZYPkIiKeYeUYSeIREMqtMK/kId6Yn/QCKPkISetRIwaJFbSk3n/GYDr1H4yn/NF873l
         ewiY1Q50k77VxnvEuSeqY5WeBz8FveZsovm7/K/YxUPlIcWFZsQXFn/vqLwy0cYiB4lp
         vio9KHx6W9UrH+/voQbRxBbspvNygCoIYeVXRKdE8dgl1J72UAFe+GvEng2bAJEZj5p8
         XtFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=uNU1lgP95SHwtG+LF+SNM88xD+phTff1rqLp9kWL6W0=;
        b=T1tMCn10VxP6L59/+6qm30arFmHSyVXrMjRPaZ953T3YTtqSFSoRb32eQhuZW9cLDr
         2FfJ/Anuhr/ZX9Dk05gqSUBhqWErwsabVMYmzYugN19nZtAiwXoCBBEcVOF/aab4d1TS
         jQJH94EvthHrMoSZBYC23svwb+kmYXUIB+rzNNqYvFxpMlX3svHeitkvsV0FXBRGoKM2
         iEtNhbm723qlxP3+ru9ppn1yj6OMZvCGki7i3gKgalT9ctCzpgZmWFcmdOdTjCfuPcTh
         rMbBctqboxPMuPBe0ok8VVIGxTGSbuq/bjxjg4DKeBCnUqvIBm+s+MXoEr4oEq7+iQEu
         61nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 37si1077691qtu.91.2019.05.30.02.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 May 2019 02:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hWGvx-0001nw-AK
	for alex.bennee@linaro.org; Thu, 30 May 2019 05:01:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hWGvp-0001ni-CI
	for qemu-arm@nongnu.org; Thu, 30 May 2019 05:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hWGvn-0004yn-5w
	for qemu-arm@nongnu.org; Thu, 30 May 2019 05:01:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hWGvh-0004uw-Qf; Thu, 30 May 2019 05:00:58 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B3612E95B1;
	Thu, 30 May 2019 09:00:49 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A809E2B1CA;
	Thu, 30 May 2019 09:00:44 +0000 (UTC)
Date: Thu, 30 May 2019 11:00:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190530110043.047b2f1f@redhat.com>
In-Reply-To: <20190529160747.778-1-lvivier@redhat.com>
References: <20190529160747.778-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 30 May 2019 09:00:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] numa: improve cpu hotplug
 error message with a wrong node-id
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xt4fhGGsCveR

On Wed, 29 May 2019 18:07:47 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> On pseries, core-ids are strongly binded to a node-id by the command
> line option. If an user tries to add a CPU to the wrong node, he has
> an error but it is not really helpful:
> 
>   qemu-system-ppc64 ... -smp 1,maxcpus=64,cores=1,threads=1,sockets=1 \
>                         -numa node,nodeid=0 -numa node,nodeid=1 ...
> 
>   (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=30,node-id=1
>   Error: node-id=1 must match numa node specified with -numa option
> 
> This patch improves this error message by giving to the user the good
> node-id to use with the core-id he's providing
> 
>   Error: invalid node-id, must be 0
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> 
> Notes:
>     v4: simplify the message
>     
>     v3: only add the topology to the existing message
>         As suggested by Igor replace
>           Error: core-id 30 can only be plugged into node-id 0
>         by
>           Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
>     
>     v2: display full topology in the error message
> 
>  numa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/numa.c b/numa.c
> index 3875e1efda3a..955ec0c830db 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -470,8 +470,8 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
>                                      "node-id", errp);
>          }
>      } else if (node_id != slot->props.node_id) {
> -        error_setg(errp, "node-id=%d must match numa node specified "
> -                   "with -numa option", node_id);
> +        error_setg(errp, "invalid node-id, must be %"PRId64,
> +                   slot->props.node_id);
>      }
>  }
>  

