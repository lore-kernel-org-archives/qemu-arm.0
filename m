Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp1075598pjq;
        Fri, 31 May 2019 12:50:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzR6OTSl8ypGiGI3MwAVBzp9DxEfUrnIQw0peeXvcfoBverl7YI4phcN0D30arRN6Her9oW
X-Received: by 2002:a37:7bc3:: with SMTP id w186mr10266127qkc.225.1559332214031;
        Fri, 31 May 2019 12:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559332214; cv=none;
        d=google.com; s=arc-20160816;
        b=THFkqBdHUIgxR37qu+UqZLZsKAMXLOBQRiLSDc2kjntRXxPFRNB6S6qU5K1PPhpyxZ
         1swAJ0YKJP/vp5DF2LFa9VOugBITP33CoZI/JxXoXDc/ZUNh4jrta9J7F3QdsR6p/GkP
         UUyoZwmjuoX7Ud2gSc2VQiUontr8vDRyy41k7GxNt8SAVgZEmtvJ4HE3x5JFd7M3lIXx
         8nSBXuPjXbLMsdvEXG3S2vZNF7NC+XGO9LV0Cwxs6QHi52lQB2IMn/3stp5eKLFigLtH
         QffeBpBpvjvDt/YhZTpwPllvOHJa48SvmvVecTLA7wtm/dt67lFtV9/gcXgNObf++3hR
         0+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=ZT83s3dd4XesvXw05tq+/zEiKFgpk/sTfkgT1zkjkQA=;
        b=Wmrco0QoGWh08aNKW1X1Ji1s4pb68dQ34oEsZcxaK4fYwXTp12gxhwd+IlOGHJ+9Ok
         TQn11dOgU4lpAJEww+nQ1v/YVTI0+kW45bIIgs5RcXcpwTHSrZ+OBHxlMKIW6NBwQtLQ
         eO5JViVTyd+/w+L88nGk/KX2JUvAdWQb+9izz/3Af/WzDNDtVOVmvxve9/EsJLTZ15lR
         aV9fctRIIPsxC3jSjHOOMIU4BOgjdrkF9GET/itzIMDizb1XJ0Ngv0HFoUxVycfrUun8
         L4YRAGOrnir2A7+HSXtnmBGXxkImfLgjDzFVuA6M/Vzz4+SvxBPrAT96aTDTojnnpRH0
         05dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c33si3860428qtd.183.2019.05.31.12.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 May 2019 12:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hWnXZ-00032i-Ii
	for alex.bennee@linaro.org; Fri, 31 May 2019 15:50:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hWnXJ-00032Q-7v
	for qemu-arm@nongnu.org; Fri, 31 May 2019 15:49:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hWnXI-0004K3-AU
	for qemu-arm@nongnu.org; Fri, 31 May 2019 15:49:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14329)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hWnXI-0004Ie-4Y; Fri, 31 May 2019 15:49:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4BDF30C1E3A;
	Fri, 31 May 2019 19:49:47 +0000 (UTC)
Received: from localhost (ovpn-120-246.rdu2.redhat.com [10.10.120.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3217578380;
	Fri, 31 May 2019 19:49:45 +0000 (UTC)
Date: Fri, 31 May 2019 16:49:44 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190531194944.GL22103@habkost.net>
References: <20190529160747.778-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529160747.778-1-lvivier@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 31 May 2019 19:49:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4] numa: improve cpu hotplug error message
 with a wrong node-id
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
X-TUID: nsrqVjV73O3P

On Wed, May 29, 2019 at 06:07:47PM +0200, Laurent Vivier wrote:
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

Queued, thanks.

-- 
Eduardo
