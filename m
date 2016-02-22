Received: by 10.25.208.211 with SMTP id h202csp1372294lfg;
        Mon, 22 Feb 2016 12:12:56 -0800 (PST)
X-Received: by 10.140.221.16 with SMTP id r16mr9548925qhb.67.1456171976441;
        Mon, 22 Feb 2016 12:12:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e5si30983369qkb.92.2016.02.22.12.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 12:12:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXwql-00083I-Lk
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 15:12:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aXwqj-00082w-HJ
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 15:12:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aXwqg-0005cV-CR
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 15:12:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aXwqg-0005cO-6Q; Mon, 22 Feb 2016 15:12:50 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 9117D746;
	Mon, 22 Feb 2016 20:12:49 +0000 (UTC)
Received: from redhat.com (vpn1-6-31.ams2.redhat.com [10.36.6.31])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u1MKCgVQ008361; Mon, 22 Feb 2016 15:12:43 -0500
Date: Mon, 22 Feb 2016 22:12:41 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20160222220400-mutt-send-email-mst@redhat.com>
References: <1456144729-17196-1-git-send-email-mst@redhat.com>
	<1456151216.29896.63.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456151216.29896.63.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"Gabriel L. Somlo" <somlo@cmu.edu>, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC] fw-cfg: support writeable
	blobs
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
X-TUID: pN1X6UHKYn95

On Mon, Feb 22, 2016 at 03:26:56PM +0100, Gerd Hoffmann wrote:
> On Mo, 2016-02-22 at 14:41 +0200, Michael S. Tsirkin wrote:
> > Useful to send guest data back to QEMU.
> 
> Use case?
> 
> cheers,
>   Gerd

VM GEN ID at least wants to pass address of some blob
in guest memory to host.

Apparently, that's also useful for nvdimm.

A reasonable way to do that seems to be to write it into
fw cfg file, this way it's also migrated automatically.

-- 
MST
