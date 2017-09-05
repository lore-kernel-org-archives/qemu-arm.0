Received: by 10.223.172.38 with SMTP id v35csp899558wrc;
        Mon, 4 Sep 2017 20:35:19 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5VmQ2JXG1aWdZ4rjyT0xb+3AQmdZf+L6ZBLtW5Engwh7TGN5NiUreJmyDbUrL37lBsd7Fs
X-Received: by 10.200.20.132 with SMTP id l4mr3687720qtj.10.1504582519090;
        Mon, 04 Sep 2017 20:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504582519; cv=none;
        d=google.com; s=arc-20160816;
        b=IUs0jkLD67LMjf+kNQD5XG3bV9HWzfeVxf2GrqDlMauOSftrReHKPfc4VHAm7lSJk+
         eNm1NDY2ScjkqiwW2WdSBxdkROJZgWnI79yEl3JuPCbHz60PloP0tiLl47iZIpkXXkJW
         /6+RVhONtUJlwGDMCetKp3OQwY2hlYi2KGNxJLP31u3UyJNMsLs5587ScSbnSQJdwQ+O
         JDU+6CJ/ULk1/v7/5N23de1teLliHjQicnfEB/zBYqNGDCRd1c1Ri+BHQRiTQuENmbo/
         XQcEFyIsk/4pVTWo052pbYkPsTZBdWkBr5rCUJsQQ7TgqLmBEQIPCJ1wylNIaQM936SJ
         Dlww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=9foD5UwkIbfiTgyVwABqP9tUZq/bjHZCjYiw/qJkf/8=;
        b=VROk761Cr5GAOzvZRYGOvsc5w3vOksrzvdbuwSFl7kKopq/z25jLHNkg4wEaGWj3R2
         itpzB/cki+oPPnX9j2zYOQbgZ6NbBl1E+HCpf8AeAOy8DzE6YGts7DGzZHdM4Y+rRVWQ
         tlb1Cu80laKyabG42PGSaebf1OMsykmWsHhpDDg0upDxlpLLt82Id/UHBLTKggESh47h
         H08LcLZaezpoxTYT3Eu3knt64Zlknez9J7MSrOubA0088LLdDUSfd5Ij7gbhoF7HPpOZ
         T+gj/hOW/txKoAkoI9bNoINOOVoruMi8caDFf9ZLI1cCg8TOyhjX0PMz4eVQioIhKkjV
         N1cA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si7074701qkf.219.2017.09.04.20.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Sep 2017 20:35:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dp4dw-0005oi-Rw
	for alex.bennee@linaro.org; Mon, 04 Sep 2017 23:35:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dp4dq-0005ll-0n
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 23:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dp4dl-00028x-EB
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 23:35:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dp4dl-00028i-8F; Mon, 04 Sep 2017 23:35:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A28F272AF;
	Tue,  5 Sep 2017 03:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4A28F272AF
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D757CF469;
	Tue,  5 Sep 2017 03:35:03 +0000 (UTC)
Date: Tue, 5 Sep 2017 11:35:01 +0800
From: Fam Zheng <famz@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Message-ID: <20170905033501.GS22515@lemon.lan>
References: <20170717023824.18796-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170717023824.18796-1-famz@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 05 Sep 2017 03:35:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/6] arm: Make use of
 DEFINE_PROP_LINK
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IZG/6AGKOU5g

Hi,

Ping for 2.11.

Peter, what do you think?

On Mon, 07/17 10:38, Fam Zheng wrote:
> This is the arm part that was left out from:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg04006.html
> 
> Make use of the new DEFINE_PROP_LINK, in favor of open coded the
> object_property_add_link. The advantage of it is the property now get reflected
> in the info qtree output, for a bit more introspectability.
> 
> Fam Zheng (6):
>   armv7m: Convert bitband.source-mamory to DEFINE_PROP_LINK
>   armv7m: Convert armv7m.memory to DEFINE_PROP_LINK
>   gicv3: Convert to DEFINE_PROP_LINK
>   xlnx_zynqmp: Convert to DEFINE_PROP_LINK
>   xilinx_axienet: Convert to DEFINE_PROP_LINK
>   xilinx_axidma: Convert to DEFINE_PROP_LINK
> 
>  hw/arm/armv7m.c             | 16 ++++------------
>  hw/arm/xlnx-zynqmp.c        |  7 ++-----
>  hw/dma/xilinx_axidma.c      | 16 ++++------------
>  hw/intc/arm_gicv3_its_kvm.c | 19 +++++++------------
>  hw/net/xilinx_axienet.c     | 16 ++++------------
>  5 files changed, 21 insertions(+), 53 deletions(-)
> 
> -- 
> 2.9.4
> 
> 
