Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp8578710lfc;
        Thu, 28 Nov 2019 23:33:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsPs4GXaumIGczMIXyQSdbIgT8Fa8639Jb23ZMVl930UNpHTFPJXLi3SHSe1rkYg73uAs4
X-Received: by 2002:a17:906:e94:: with SMTP id p20mr12314571ejf.57.1575012795571;
        Thu, 28 Nov 2019 23:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575012795; cv=none;
        d=google.com; s=arc-20160816;
        b=q41r4Z0J6SWupjRW8cMUaFQU2OvQuO+kc+89OKldP3+dHKFElymNk+Cs9jYRUGdxGu
         3uuQBlF/Uzib81X6F6Fp/AG6o6ZGxIfJMFIrpwW3/+IjlAzTkHFSUdhs++HCfBOKijXq
         PfCg4lNP1LoU0ZVM7hqR20ROaPfrEn6YRSV86ROL1570n7iyf7fpmSEty6/yxoo6YeLQ
         15jrCvSkdBUXC1UqjCoIb0w8mp0cN1H6jl1dOxic/Pep3D5EFU73DfmD5KYmORF2FWli
         f2wwAz+MEHhf18zT/KQoTu+1E8KGctnCRyy9bFZMJVJ3vYRpCxcVmb36hBfxURhXF5dq
         NXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=myiM2jB3BAAt+97hTTYInGs4H8+sWsiz2awia6JDoGY=;
        b=MK9YWQK3Ng5jRYo9dQv/jciE48paQeL1SeqFijPMqisLp3vFwtZYMNHsbl1khLrb/a
         8Y8wpAGUx/wIxyW15VQJSkWCxFpW6CU43ZrBFBqWxLwn5YQEa3bdTPRU1qBZj1E6h1sr
         4rVeauwxly0DW5/U/vPICLOchfI6PHx/GahWS7Bh0IwEt11+D/FvOMw898YBNJiZ3FfZ
         cYv/jgbW2JlC+ekY9rtZeUEBIQkDxCdEp3pbJAfcRQGjduOslZikqOXy8M4AlWA1xMHm
         X3hAzlAyDlpNY8e+wc4Bxh9SxTfQiQtnW5NR1ZNue9fr+qAugJJvD5oG5JFtitFAPx7L
         TpvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H6d4dUyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si13640725ejd.74.2019.11.28.23.33.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 23:33:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H6d4dUyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaam6-0006DO-2g
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 02:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iaaih-00053U-Qd
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 02:29:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iaaig-0003c9-Mn
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 02:29:39 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35751
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iaaig-0003X7-Jf
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 02:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575012577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myiM2jB3BAAt+97hTTYInGs4H8+sWsiz2awia6JDoGY=;
 b=H6d4dUyI9EpSoo5OWSvlfc2P9x4k9n3kYk+Ty6b5UDgsngRS3VbzgwzBhx9kTOjC3Hf9SP
 EgMdVolruRYsQLXT4B8/A/bur+BQZz5zgnVt3/BvVFjNqzFm5v/Xe3Q6jtEzRaswb4/WlP
 UlXAZzYk7nXBDReit2/N29J1e+vhWCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-7QyO11nNObmT_7vW29Bs_Q-1; Fri, 29 Nov 2019 02:29:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46010800D41;
 Fri, 29 Nov 2019 07:29:31 +0000 (UTC)
Received: from gondolin (ovpn-116-140.ams2.redhat.com [10.36.116.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1B6860900;
 Fri, 29 Nov 2019 07:29:25 +0000 (UTC)
Date: Fri, 29 Nov 2019 08:29:23 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 5.0
Message-ID: <20191129082923.1c4d72fc.cohuck@redhat.com>
In-Reply-To: <20191128203811.GD14595@habkost.net>
References: <20191112104811.30323-1-cohuck@redhat.com>
 <20191128183706.21b1fe0e.cohuck@redhat.com>
 <20191128203811.GD14595@habkost.net>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 7QyO11nNObmT_7vW29Bs_Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ihMdcxSAnzyO

On Thu, 28 Nov 2019 17:38:11 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Nov 28, 2019 at 06:37:06PM +0100, Cornelia Huck wrote:
> > On Tue, 12 Nov 2019 11:48:11 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >   
> > > Add 5.0 machine types for arm/i440fx/q35/s390x/spapr.
> > > 
> > > For i440fx and q35, unversioned cpu models are still translated
> > > to -v1; I'll leave changing this (if desired) to the respective
> > > maintainers.
> > > 
> > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > > ---
> > > 
> > > also pushed out to https://github.com/cohuck/qemu machine-5.0
> > > 
> > > x86 folks: if you want to change the cpu model versioning, I
> > > can do it in this patch, or just do it on top yourselves  
> > 
> > So, do we have a final verdict yet (keep it at v1)?
> > 
> > If yes, I'll queue this via the s390 tree, unless someone else beats me
> > to it.  
> 
> We won't change default_cpu_version in 5.0, so:
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> 

Thanks!

Will queue through the s390 tree.

