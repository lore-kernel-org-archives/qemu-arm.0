Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1156315wrq;
        Fri, 13 Jul 2018 15:00:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcgc3S1ffAZa/lfygolLE4Gc52oT72qCqxs2W6JFCR6PFxMuMe/RV0OGjJv+l6zFTubiZKu
X-Received: by 2002:a37:8dc2:: with SMTP id p185-v6mr7046790qkd.53.1531519223329;
        Fri, 13 Jul 2018 15:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531519223; cv=none;
        d=google.com; s=arc-20160816;
        b=Pu4pU1iGyb/3skrgrA151TkOQ6N3byH4m0idchVbaX2DaFhRXrZdKKMxLlRvBgojmV
         lv93NY/pqjcJjScqyIfX46BgCNjqgZwnAQQatLEzms+xwa6QS7fAsNEj9AF4dnwAGD/t
         6vVKSER/5YJ9umqKW7t2tpcZdl+J00NCZWTnlJK9JyqLSYU+SSXqBt+L2N+7dT6qnT4D
         FXabSvcbXXJ3luaiCqgUucyE4IYZ+94SRNmKTKAcbcwl0BsAwWt5LGIf54JmhcHZ4Mvh
         hXkUyTyJv2v7DXMjj9T3vhmjb1/+dyU0iI8MWrrQloFMaJhfrMDkz35ehKVakcQLEMl9
         9W+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=clGaMWXarDv00bnAOedgPowS/OGDB/x4G/Z075zRTeg=;
        b=e1gAoxRgiettkXnq/JnxjWxfo4YmV9HXrtbOciQikTU/DQr7LecwCHvLHLm2am7Syd
         VFtTkD1QhIHnUQPoRkihKWwPDx/JPbzHtVGxKwp8go2cL5cvUsR6noP05tC1AUZbm2ip
         j9WWV2XbuHh2JmV68694jP1MdrQM+QbZFNLB7q9U//VWufnsor/ow/b2rNJif0OXIpLt
         W6/T49kfDLQ5wWij50flpWeaEElb7Yv6cT1WZsPDvTmQsN12yNu6tlm89ogH8uAipm5q
         9DcvLG1j9iCp//p3RxlTQmfUw2BpYTbXEEQ+J/HecoOi0ST2u4uiQ8WPnA56J9cMKqxT
         c+fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y7-v6si2170154qkl.26.2018.07.13.15.00.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 15:00:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe66w-0007TF-Sf
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 18:00:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe66o-0007Qs-0a
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 18:00:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe66k-00065k-Qa
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 18:00:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe66k-00063R-LT; Fri, 13 Jul 2018 18:00:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B95E7F6C2;
	Fri, 13 Jul 2018 22:00:09 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBF475D96F;
	Fri, 13 Jul 2018 22:00:08 +0000 (UTC)
Date: Fri, 13 Jul 2018 19:00:07 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713220007.GB31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 13 Jul 2018 22:00:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 00/16] Fix crashes with introspection of
 ARM devices
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
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vex5XB+B7gZi

On Fri, Jul 13, 2018 at 10:27:28AM +0200, Thomas Huth wrote:
> As discovered recently, you can crash QEMU with a lot of devices
> that do not get the reference counting of child objects right.
> You just have to run 'device-list-properties' and call 'info qtree'
> afterwards.
> This patch series fixes a bunch of these problems in the ARM code.
> I did not fix all problems yet, since it is quite time consuming,
> and this series is big enough already. The remaining problems can
> be fixed in an independent patch series later.
> 
> v2:
>  - Updated the first patch according to the review feedback from v1
>  - Added more patches with additional fixes

OK, I will stop replying to each individual patch and just send
a single one for the series:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
