Received: by 10.25.208.211 with SMTP id h202csp2271576lfg;
        Tue, 22 Mar 2016 22:58:01 -0700 (PDT)
X-Received: by 10.55.73.199 with SMTP id w190mr1018864qka.77.1458712681143;
        Tue, 22 Mar 2016 22:58:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k11si894001qhc.14.2016.03.22.22.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 22:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aibns-0004sU-Qh
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 01:58:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibnp-0004s9-TM
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibnk-0000Di-Uj
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:57:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aibnk-0000DU-PA; Wed, 23 Mar 2016 01:57:52 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id A570F4620F;
	Wed, 23 Mar 2016 05:57:51 +0000 (UTC)
Received: from pxdev.xzpeter.org (dhcp-14-238.nay.redhat.com [10.66.14.238])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N5vdpT015024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 01:57:44 -0400
Date: Wed, 23 Mar 2016 13:57:39 +0800
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20160323055739.GJ28183@pxdev.xzpeter.org>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1458711153-15988-1-git-send-email-peterx@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v6 0/4] ARM: add query-gic-capabilities SMP
	command
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xZ6DOTix5Jsp

On Wed, Mar 23, 2016 at 01:32:29PM +0800, Peter Xu wrote:
> The new command can report which kind of GIC device the host/QEMU
> support. The returned result is in the form of array.
> 
> Sample command and output:
> 
> {"execute": "query-gic-capability"}
> {"return": [{"emulated": false, "version": 3, "kernel": false},
>             {"emulated": true, "version": 2, "kernel": true}]}

Sorry! This is wrong, which is v5 version of interface.

The new interface should return a dict rather than array:

-> { "execute": "query-gic-capabilities" }
<- { "return": { "capabilities": [
                { "version": 2, "emulated": true, "kernel": false },
                { "version": 3, "emulated": false, "kernel": true } ] } }

Thanks.

-- peterx
