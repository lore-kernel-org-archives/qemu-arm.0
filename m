Received: by 10.80.166.35 with SMTP id d32csp1005476edc;
        Tue, 18 Oct 2016 06:58:39 -0700 (PDT)
X-Received: by 10.55.212.221 with SMTP id s90mr692043qks.169.1476799119434;
        Tue, 18 Oct 2016 06:58:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v127si2077414qkh.26.2016.10.18.06.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 06:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwUuc-0005cz-Pp
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 09:58:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bwUXU-0000us-GZ
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 09:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bwUXP-0005k3-LC
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 09:34:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1bwUXP-0005ju-Fy; Tue, 18 Oct 2016 09:34:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D43DC04B30E;
	Tue, 18 Oct 2016 13:34:38 +0000 (UTC)
Received: from localhost (vpn1-4-36.pek2.redhat.com [10.72.4.36])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IDYa89019588; Tue, 18 Oct 2016 09:34:37 -0400
Date: Tue, 18 Oct 2016 21:34:35 +0800
From: Fam Zheng <famz@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20161018133435.GD14000@lemon>
References: <20161017201530.502017.26289@ex-std-node742.prod.rhcloud.com>
	<6011d25f-9302-b3dc-36f1-567daf23b62d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6011d25f-9302-b3dc-36f1-567daf23b62d@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 18 Oct 2016 13:34:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 0/8] KVM PCI/MSI passthrough
 with mach-virt
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, fkan@apm.com,
	qemu-devel@nongnu.org, Bharat.Bhushan@freescale.com,
	alex.williamson@redhat.com, pranav.sawargaonkar@gmail.com,
	qemu-arm@nongnu.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ns+3wtGWtyKg

On Mon, 10/17 22:56, Auger Eric wrote:
> > make[1]: *** No rule to make target `../hw/core/platform-bus-stub.o', needed by `qemu-system-x86_64'.  Stop.
> I can't figure out why this rule is missing?
> 
> I compiled on x86 and aarch64 with
> ./configure --target-list="x86_64-softmmu" --enable-werror and it looks
> OK. What do I miss here?

I think the reason it doesn't work is this: common-obj-y objects are built as
prerequisite of $(SUBDIR_RULES) which is defined in Makefile, from which the
unnest of common-obj-y doesn't include this stub object, because Makefile
doesn't read default-config; later make enters Makefile.target, this time
common-obj-y _includes_ platform-bus-stub.o, but the object rule doesn't work
there.

I think the easiest solution is still move the stub function to stubs/, or
otherwise you need to fix Makefile or rules.mak for this to work.

Fam
