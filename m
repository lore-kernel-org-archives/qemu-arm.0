Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp887898wrx;
        Fri, 12 Apr 2019 11:46:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEV87R1lAxjYAeApTaL0k+TgpKeFheRMiwVzCzyK7w3FeTgtCuDEpnCF13A4/Eh1Y9kX+5
X-Received: by 2002:adf:f102:: with SMTP id r2mr22008347wro.136.1555094772028;
        Fri, 12 Apr 2019 11:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555094772; cv=none;
        d=google.com; s=arc-20160816;
        b=Jo6XdtR6MxvKQ29yLGVhwPJfZw/Rdkwe+C6aumBlIrwxuShv4CjfxPQ4xa9GdjTTY6
         YgNfAPQoGzXEgcOcyUNhAPnWQP0tM3uffyPB6zk5NZ86slnD2xtaBaEE4SnclnMd7je8
         2haxkbzQWoDEE8OlB4sHy6et8CyZXQL/UI7hoFwxZFoOgCZ2faCUEVDuMvdypcB9qk2k
         n5yn7u04es/L9L+wqTHg/lVB6veGpYcLDE2YroT7vhPofNDFp2Ju2+FyPLlkdSFXoY9X
         QnGoqmx49caCy6MiYHmkdaBhy25F1yuyqg5Ig0p2eW6J1Aayumhe3SQd8o0Fk/f0ZgbY
         kWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=YL2cYFdZpYAZ0YnMSiGuFhre2eb34/3xBAZx3ONvlBo=;
        b=qyiZ2KTNclezq+0Kah/ieTH40W2rb2BEtV3W2qz3wP4HVFs/nhLbo158x7wa9QBCXH
         quRWZ0m4+R0qz00r4H1XiNeldIw/QWva+7D2WB4za/56Lz5tOULVCxoJAWO1Y6yKSe8O
         Pvp8Ia6t2WPR4BqmmJ7bbJbZutiTqwJOtIH9szXvCoPql5i0Hiwap9ZHXqOmW43whaO7
         AX5ToOUmz/qPMtIKrVkpNyUo6mMinL96d3St30V4fZXj0y0HCJq1JwE7LJw4vreqb8Z/
         xojQe/u/sjU2CZ16PQVuUskLOVotJBTE0jTc3WbGQqAnldGt4D5kT1JVrsibl50MY4xh
         l8/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21si5668744wmc.153.2019.04.12.11.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 11:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hF1Bj-0006Fi-3r
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 14:46:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hF1BX-00063K-D4
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 14:46:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hF1BW-0002hq-Gj
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 14:45:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53662)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hF1BW-0002hE-8u; Fri, 12 Apr 2019 14:45:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C13913097041;
	Fri, 12 Apr 2019 18:45:56 +0000 (UTC)
Received: from localhost (ovpn-116-78.gru2.redhat.com [10.97.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9713A5C206;
	Fri, 12 Apr 2019 18:45:51 +0000 (UTC)
Date: Fri, 12 Apr 2019 15:45:49 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190412184549.GB31999@habkost.net>
References: <20190411102025.22559-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190411102025.22559-1-cohuck@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 12 Apr 2019 18:45:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.1] hw: add compat machines for 4.1
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n9kanRQXHAvb

On Thu, Apr 11, 2019 at 12:20:25PM +0200, Cornelia Huck wrote:
> Add 4.1 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Thanks!

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I'm queueing it on machine-next.

-- 
Eduardo
