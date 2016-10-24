Received: by 10.80.166.35 with SMTP id d32csp2619419edc;
        Mon, 24 Oct 2016 05:46:15 -0700 (PDT)
X-Received: by 10.200.33.201 with SMTP id 9mr15539404qtz.141.1477313174977;
        Mon, 24 Oct 2016 05:46:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o128si10815626qkf.325.2016.10.24.05.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 05:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byedp-0008FR-RP
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 08:46:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1byedh-0008Dq-Tx
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 08:46:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1byede-00036J-1v
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 08:46:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54922)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1byedd-000367-T9; Mon, 24 Oct 2016 08:46:01 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F49B9D0D7;
	Mon, 24 Oct 2016 12:46:00 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9OCjuhn009779
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 24 Oct 2016 08:45:58 -0400
Date: Mon, 24 Oct 2016 14:45:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161024124555.brbzuq2zvwsqrtbl@kamzik.brq.redhat.com>
References: <1476707466-14300-1-git-send-email-eric.auger@redhat.com>
	<1476707466-14300-3-git-send-email-eric.auger@redhat.com>
	<20161017140707.ygezwdokyw4lj53s@kamzik.brq.redhat.com>
	<CAFEAcA8MGaRf5ytu3VcKGZj-kBAXoPdYvFN6k7Bx+zPaPsLXPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8MGaRf5ytu3VcKGZj-kBAXoPdYvFN6k7Bx+zPaPsLXPQ@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 24 Oct 2016 12:46:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/2] ARM: Virt: ACPI: Build
 an IORT table with RC and ITS nodes
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
Cc: Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Prem Mallappa <prem.mallappa@broadcom.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hkm/RERFr5bj

On Mon, Oct 24, 2016 at 01:29:42PM +0100, Peter Maydell wrote:
> On 17 October 2016 at 15:07, Andrew Jones <drjones@redhat.com> wrote:
> > On Mon, Oct 17, 2016 at 02:31:06PM +0200, Eric Auger wrote:
> >> From: Prem Mallappa <prem.mallappa@broadcom.com>
> >>
> >> This patch builds an IORT table that features a root complex node and
> >> an ITS node. This complements the ITS description in the ACPI MADT
> >> table and allows vhost-net on ACPI guest.
> >>
> >> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> >> @@ -667,17 +722,6 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
> >>                               ACPI_BUILD_TABLE_FILE, tables_blob,
> >>                               64, false /* high memory */);
> >>
> >> -    /*
> >> -     * The ACPI v5.1 tables for Hardware-reduced ACPI platform are:
> >> -     * RSDP
> >> -     * RSDT
> >> -     * FADT
> >> -     * GTDT
> >> -     * MADT
> >> -     * MCFG
> >> -     * DSDT
> >> -     */
> >> -
> >
> > I guess it's still debatable if the above change should be a separate
> > patch or not. It'd probably be best if it was, or at least the commit
> > message should contain an 'Also ...' sentence. Anyway, I'll leave it
> > to the maintainers to decide.
> 
> Did you want to suggest a suitable addition to the commit message?
> I have no idea; I'm just going to apply these to target-arm on the
> basis of your review...

How about

"Also remove the comment block in virt_acpi_build that lists all the
 generated tables, rather than update it. It's redundant with the code,
 at best, and otherwise incomplete/misleading."

Thanks,
drew
