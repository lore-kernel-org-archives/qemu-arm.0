Received: by 10.25.208.211 with SMTP id h202csp269225lfg;
        Thu, 3 Mar 2016 23:42:28 -0800 (PST)
X-Received: by 10.55.71.76 with SMTP id u73mr8472953qka.6.1457077348396;
        Thu, 03 Mar 2016 23:42:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g184si2579768qhd.51.2016.03.03.23.42.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 23:42:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abkNX-0004cm-Vs
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 02:42:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1abkNW-0004cg-1t
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 02:42:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1abkNS-0007ad-LF
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 02:42:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1abkNS-0007aW-Fw; Fri, 04 Mar 2016 02:42:22 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D3B7EC0006E4;
	Fri,  4 Mar 2016 07:42:21 +0000 (UTC)
Received: from redhat.com (vpn1-5-36.ams2.redhat.com [10.36.5.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u247gIKH013998; Fri, 4 Mar 2016 02:42:19 -0500
Date: Fri, 4 Mar 2016 09:42:18 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160304074218.GA17059@redhat.com>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<1455288361-30117-3-git-send-email-peter.maydell@linaro.org>
	<56D86A64.1040909@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56D86A64.1040909@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 2/4] loader: Add load_image_mr() to load ROM
 image to a MemoryRegion
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
X-TUID: OL2XuIDxJEd1

On Thu, Mar 03, 2016 at 05:46:28PM +0100, Paolo Bonzini wrote:
> 
> 
> On 12/02/2016 15:45, Peter Maydell wrote:
> > Add a new function load_image_mr(), which behaves like
> > load_image_targphys() except that it loads the ROM image to
> > a specified MemoryRegion rather than to a specified physical
> > address. This is useful when a ROM blob needs to be loaded
> > to a particular flash or ROM device but the address of that
> > device in the machine's address space is not known. (For
> > instance, ROMs in devices, or ROMs which might exist in
> > a different address space to the system address space.)
> > 
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> The patch looks good, in particular it should be fine for the non-fw_cfg
> uses of rom->mr.
> 
> The fw_cfg interface to loader.c indeed should be turned upside-down so
> that the knowledge moves outside rom_add_file (to a rom_add_fwcfg
> function for example) and rom_add_file doesn't need to call rom_set_mr.
>  Your patch is at least a step in the right direction, because it adds
> memory region support in the !fw_cfg case.
> 
> So,
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Thanks,
> 
> Paolo

I agree here.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

