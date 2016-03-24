Received: by 10.25.208.211 with SMTP id h202csp349033lfg;
        Wed, 23 Mar 2016 18:59:24 -0700 (PDT)
X-Received: by 10.55.192.154 with SMTP id v26mr7583395qkv.36.1458784764477;
        Wed, 23 Mar 2016 18:59:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si4628907qgx.113.2016.03.23.18.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 18:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiuYW-0002QO-1w
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 21:59:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiuYT-0002Q3-98
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 21:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiuYQ-00044N-3u
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 21:59:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45533)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aiuYP-000433-Uw; Wed, 23 Mar 2016 21:59:18 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id CC4FC85542;
	Thu, 24 Mar 2016 01:59:16 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-35.pek2.redhat.com [10.72.7.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2O1xAag014981
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 21:59:12 -0400
Date: Thu, 24 Mar 2016 09:59:10 +0800
From: Peter Xu <peterx@redhat.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <20160324015910.GX28183@pxdev.xzpeter.org>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458711153-15988-4-git-send-email-peterx@redhat.com>
	<56F28BEC.2070008@gmail.com>
	<20160323145652.GW28183@pxdev.xzpeter.org>
	<56F2B044.4030202@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56F2B044.4030202@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	armbru@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, qemu-arm@nongnu.org, abologna@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 3/4] kvm: add
 kvm_support_device() helper function
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
X-TUID: rFMXlQIoytWI

On Wed, Mar 23, 2016 at 06:03:32PM +0300, Sergey Fedorov wrote:
> Yes, but kvm_create_device() returns a file descriptor whereas this
> function is predicative. Personally, I like the convention described in
> chapter 16 of Linux kernel coding style [1]:
> 
> 	If the name of a function is an action or an imperative command,
> 	the function should return an error-code integer.  If the name
> 	is a predicate, the function should return a "succeeded" boolean.

The above is talking about return values. Maybe you were trying to
reference this one as example about add_work() and
pci_dev_present():

    For example, "add work" is a command, and the add_work()
    function returns 0 for success or -EBUSY for failure.  In the
    same way, "PCI device present" is a predicate, and the
    pci_dev_present() function returns 1 if it succeeds in finding a
    matching device or 0 if it doesn't.

Seems make sense. Will take your advice.  Thanks.

-- peterx
