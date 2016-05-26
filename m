Received: by 10.25.30.65 with SMTP id e62csp530105lfe;
        Thu, 26 May 2016 07:48:49 -0700 (PDT)
X-Received: by 10.200.55.181 with SMTP id d50mr9411300qtc.32.1464274129683;
        Thu, 26 May 2016 07:48:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si607831qhc.41.2016.05.26.07.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5waf-0004d6-6I
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:48:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1b5wYh-0003bQ-82
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1b5wYc-00039m-6W
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:46:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1b5wYS-00036n-1x; Thu, 26 May 2016 10:46:32 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEEEC3D1EE;
	Thu, 26 May 2016 14:46:30 +0000 (UTC)
Received: from localhost (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4QEkTZu016812; Thu, 26 May 2016 10:46:30 -0400
Date: Thu, 26 May 2016 15:46:29 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Message-ID: <20160526144629.GH28935@redhat.com>
References: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 26 May 2016 14:46:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: Reject gic-version=host for
 non-KVM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XIt9Z0q2v7gJ

On Thu, May 26, 2016 at 10:31:25AM -0400, Cole Robinson wrote:
> If you try to gic-version=host with TCG on a KVM aarch64 host,
> qemu segfaults, since host requires KVM APIs.
> 
> Explicitly reject gic-version=host if KVM is not enabled
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1339977
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  hw/arm/virt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index e77ed88..1e82597 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1122,10 +1122,14 @@ static void machvirt_init(MachineState *machine)
>       * KVM is not available yet
>       */
>      if (!gic_version) {
> +        if (!kvm_enabled()) {
> +            error_report("gic-version=host requires KVM");
> +            exit(1);
> +        }

The problem with this is if I'm using TCG fallback mode, how
can I specify the right gic-version?  ie:

  -M virt,gic-version=host,accel=kvm:tcg

Only qemu knows if KVM is going to be enabled.

The same problem happens with '-cpu host' BTW.  I really want a "make
it work" option, as I've said on several previous occasions on this
list eg:
https://lists.nongnu.org/archive/html/qemu-devel/2014-08/msg04173.html

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v
