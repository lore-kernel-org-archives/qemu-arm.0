Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1450917wrg;
        Tue, 21 May 2019 07:15:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoSmuVfeiCL0gTCGm2/TuxOIVKpoqIZRB6hvvz7ARCZVgL0L9r1D7551xdICs/+P2//h6M
X-Received: by 2002:a50:974d:: with SMTP id d13mr83895961edb.209.1558448151902;
        Tue, 21 May 2019 07:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558448151; cv=none;
        d=google.com; s=arc-20160816;
        b=E8da+yyE1jxljAzK3uKIRuHYo/8SE8b69WFGpY+9Ew+Z337fALIJKfLj/6PUD0GQEi
         WxiiUSEMcKEvVJw0RXZ2/Pb0DirKup0O8ySXFNcoGz3VODP/AF/F512mT8Ql6QDow+b0
         GQ0AvdDJveNjDukcghgGsYjimGbf0vjOl+xZ4yOOg+5AWYCeQC/qA//c4Q7P/Gi8KkE5
         A6tnK574OjcJhBzrh0P2MV+0HhW9Rf1zEndf9smMJxcfZraxPf1WAckbrFi+03foauvC
         ULXlOe6D1VjIJX8+cZV+W13Lzp0aSnar6o1ouFjAP0zS49IbTtvmWlMqfFL9zXPDfyK9
         wmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=4xvcOn4FUkD9pzv6kKPfPloql3KayWTgRl8NumWyurk=;
        b=HHjjVVsK72UXvxVQ5aJ2XZ5LnPQAS8AmWXoUg3LPUo9/tW6oR3Rj/nrxhuoh74+oyf
         FLVB7p3gSkjrggLUWY1Wb17nm8sGsvtVBfgO7+QyCKHnOVWnlelywlApQsKCmFVjOQKd
         7snskHvFDGbVPRNx++KLAXxtMsjs9G9+KLvbTisSZG4NrHbYtyh5THlPGtXCiYnnomQY
         QG7J5KmJ8BotYsdKeDVwsQhtonw397T1Ao8FwHTFTNzPMUXS8jHdUgGbnGyFQ4UsheBz
         17nqz7UNNqhU2VVbnl0qpNtgkB79OA16VsxkxhbeVmiqWMEw7bQApy61eqg3kouZre2G
         e9YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp6si3113225ejb.60.2019.05.21.07.15.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 May 2019 07:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hT5YT-0007Vw-HR
	for alex.bennee@linaro.org; Tue, 21 May 2019 10:15:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hT5YC-0007UM-2g
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hT5Y8-0007IK-92
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:15:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hT5Y4-0006tg-Ip; Tue, 21 May 2019 10:15:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F25FC3098557;
	Tue, 21 May 2019 14:15:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1974C4387;
	Tue, 21 May 2019 14:15:08 +0000 (UTC)
Date: Tue, 21 May 2019 16:15:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190521161504.75ca268c@redhat.com>
In-Reply-To: <20190520233730-mutt-send-email-mst@kernel.org>
References: <20190521033249.1960-1-richardw.yang@linux.intel.com>
	<20190521033249.1960-2-richardw.yang@linux.intel.com>
	<20190520233730-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 21 May 2019 14:15:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/2] hw/acpi: Consolidate
 build_mcfg to pci.c
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dmutiMtJOG5o

On Mon, 20 May 2019 23:37:46 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, May 21, 2019 at 11:32:48AM +0800, Wei Yang wrote:
> > Now we have two identical build_mcfg functions.
> > 
> > Consolidate them in acpi/pci.c.
> > 
> > Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> > 
> > ---
> > v5:
> >   * ACPI_PCI depends on both ACPI and PCI
> >   * rebase on latest master, adjust arm Kconfig
> > v3:
> >   * adjust changelog based on Igor's suggestion
> > ---  
> 
> 
> same as 2/2 - do not use two --- separators pls.

I don't really get this requirement, it's common practice on
list(s) and used to work just fine.

The 1st separator is added by hand when editing commit message
to separate change log from main commit message so that 'git am'
would drop change log. While the second separator is added
automatically by git when patch is created.
