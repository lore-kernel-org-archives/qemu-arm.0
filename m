Received: by 10.25.208.211 with SMTP id h202csp2437153lfg;
        Wed, 23 Mar 2016 05:05:12 -0700 (PDT)
X-Received: by 10.55.79.17 with SMTP id d17mr2818276qkb.56.1458734712291;
        Wed, 23 Mar 2016 05:05:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d197si1866444qhc.123.2016.03.23.05.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 05:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aihXD-0004wR-SH
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 08:05:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aihXB-0004uH-2y
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aihX7-00054m-Th
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:05:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aihX7-00053P-Os; Wed, 23 Mar 2016 08:05:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 91F2578250;
	Wed, 23 Mar 2016 12:05:04 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-25.pek2.redhat.com [10.72.7.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NC4onb031625
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 08:04:55 -0400
Date: Wed, 23 Mar 2016 20:04:49 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160323120449.GT28183@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-3-git-send-email-peterx@redhat.com>
	<874mbyl64i.fsf@blackfin.pond.sub.org>
	<20160323041429.GG28183@pxdev.xzpeter.org>
	<87egb1bjxe.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87egb1bjxe.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, abologna@redhat.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 2/5] arm: qmp: add
 query-gic-capabilities interface
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
X-TUID: DGW312wLgOU9

On Wed, Mar 23, 2016 at 10:52:29AM +0100, Markus Armbruster wrote:
> The rule against returning non-dictionaries exists to avoid interfaces
> that cannot evolve.  With a dictionary, you can evolve by adding
> members.
> 
> The rule does *not* forbid returning lists of dictionaries.  When a
> command fundamentally returns a list of things, being able to evolve the
> things suffices.

Ok.

> 
> query-gic-capabilities looks like it fundamentally returns a list of
> capabilities.  Returning ['GICCapability'] is just fine then.

I have posted v6 just as Eric has suggested. At least one advantage
is that it is easier to be extended (if needed) in the future, also
to follow the more-generic format to use dicts rather than
arrays. If you would not mind, I'll keep the dict interface there.

[...]

> In either case, drop the change to returns_whitelist.

Yep. Dropped in v6.

Thanks.

-- peterx
