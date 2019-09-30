Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6998864wrp;
        Mon, 30 Sep 2019 08:12:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhCkgjlaOEqoqyMS40/vdp7J/N3F3gUGCmmsRkEaJfuJLcmhyx4dF5j9wp+7zzBamtbad3
X-Received: by 2002:a0c:8749:: with SMTP id 9mr21002399qvi.174.1569856370318;
        Mon, 30 Sep 2019 08:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569856370; cv=none;
        d=google.com; s=arc-20160816;
        b=eCljCDbGZtq9SScSnpBcf/ObGEjR2gLuX11Cp7gAXwBB+P0ud3gAMaDZRmr6ETWTLg
         4Le0PNoY1ZmEaxha8vLeZMg20Ojc4MB8XN9xEGZOVrI4w32UeFRbzq5DZAdCJRXqPxmc
         2gk16kRuvyS8HHX4YdClPS3Dwf1oXogNV7QWorDSfE/9711uHsTcfIpp4Q++nbp8TRQw
         g+1nHk4HI3F+7EkXk5qlxE/ttKwXaYBABGkZ+z8qELoPZ/hD28Bb+10oSKBN9ZppH6sW
         KFhEtgUo1P9uNvxPDY4Sge/p1MY+xRVLzI/CGzJbqZa9ABTU2UIQedrJ8oWPNl8QOH/V
         1mdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=NQC4KaXLrh9qXtCz7FKk6N6dbYWOF3wmS+V+tY4ujkE=;
        b=HBpNtaUy84Urb5nyhVVGoQ3IYV5pMvS/m5tcvY9Bl8PfqDR4kR5g+d0wZkMND8LS/e
         X8CSh0gjui1lEBNCRmkCWo755ZtZACUFhcvYAJBLOU9GtoVYBDTdET85FuPjP/Cyx96w
         3PnFoRVEdRSLWwwNRhpFPj+rq7kwqfBryKJw2z/pZaC2LYuGLd44kzzic3Y3ufOky/zt
         57SQvh5w5bDONoUi/FdC7/U2QwhEWwa7rOSomlaKFeiclv5cQRmfgbhT10JsfgWg5gSH
         Df4XeOmT3wEZ3w0ptvEhptUoNZeouU6JDwZ8ZwDbWKBSkRMHx8tf7zxDJyrsHb0pRO9J
         VInA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m58si12430321qta.48.2019.09.30.08.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2019 08:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iExM1-00034g-QH
	for alex.bennee@linaro.org; Mon, 30 Sep 2019 11:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iExLt-00034S-T1
 for qemu-arm@nongnu.org; Mon, 30 Sep 2019 11:12:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iExLr-0005Bu-OV
 for qemu-arm@nongnu.org; Mon, 30 Sep 2019 11:12:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iExLr-0005Bj-J8; Mon, 30 Sep 2019 11:12:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB6811918641;
 Mon, 30 Sep 2019 15:12:36 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-86.ams2.redhat.com [10.36.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60ECF6012A;
 Mon, 30 Sep 2019 15:12:17 +0000 (UTC)
Date: Mon, 30 Sep 2019 17:12:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 04/25] error: auto propagated local_err
Message-ID: <20190930151215.GB12777@linux.fritz.box>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
 <20190924200902.4703-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924200902.4703-5-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 30 Sep 2019 15:12:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Paul Burton <pburton@wavecomp.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, integration@gluster.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbD11TFusjq/

Am 24.09.2019 um 22:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Here is introduced ERRP_FUNCTION_BEGIN macro, to be used at start of
> functions with errp parameter.

A bit of bike shedding, but FOO_BEGIN suggests to me that a FOO_END will
follow. Can we find a different name, especially now that we won't use
this macro in every function that uses an errp, so even the "errp
function" part isn't really correct any more?

How about ERRP_AUTO_PROPAGATE?

Kevin
