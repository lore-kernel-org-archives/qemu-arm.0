Received: by 10.25.85.209 with SMTP id j200csp311602lfb;
        Fri, 10 Jun 2016 23:42:30 -0700 (PDT)
X-Received: by 10.140.28.8 with SMTP id 8mr5027482qgy.91.1465627350541;
        Fri, 10 Jun 2016 23:42:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si8486137qtv.128.2016.06.10.23.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 23:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBccn-0008Qw-VE
	for alex.bennee@linaro.org; Sat, 11 Jun 2016 02:42:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bBccj-0008O3-8o
	for qemu-arm@nongnu.org; Sat, 11 Jun 2016 02:42:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bBccf-00054f-4G
	for qemu-arm@nongnu.org; Sat, 11 Jun 2016 02:42:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bBcce-00054a-VG; Sat, 11 Jun 2016 02:42:21 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F2E3C04D2A4;
	Sat, 11 Jun 2016 06:42:20 +0000 (UTC)
Received: from [10.36.6.20] (vpn1-6-20.ams2.redhat.com [10.36.6.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5B6gFjg021944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 11 Jun 2016 02:42:17 -0400
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <575BB2C6.2050603@redhat.com>
Date: Sat, 11 Jun 2016 08:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 11 Jun 2016 06:42:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 00/16] Rework SMP parameters
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, imammedo@redhat.com, dgibson@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uRjP/mIErInT

On 10.06.2016 19:40, Andrew Jones wrote:
> This series is a first step in eliminating smp_* global
> variables (the last patch gets rid of two of them!) And, it's
> a first step in deprecating '-smp' in favor of using machine
> properties, e.g.
>  qemu -machine pc,sockets=2,cores=2,threads=2,maxcpus=8,cpus=8 ...

Why isn't '-smp' good enough anymore so that it got to be deprecated?

 Thomas

