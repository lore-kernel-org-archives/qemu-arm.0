Received: by 10.25.159.19 with SMTP id i19csp1091638lfe;
        Fri, 12 Feb 2016 14:55:01 -0800 (PST)
X-Received: by 10.55.31.3 with SMTP id f3mr5258536qkf.100.1455317701335;
        Fri, 12 Feb 2016 14:55:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6si18150658qgd.81.2016.02.12.14.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 14:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUMc9-0001Eh-0S
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 17:55:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1aUMbl-0000vQ-UU
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 17:54:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1aUMbl-0008Gi-0A
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 17:54:37 -0500
Received: from s16892447.onlinehome-server.info ([82.165.15.123]:52728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1aUMbg-0008Cn-E0; Fri, 12 Feb 2016 17:54:32 -0500
Received: from host217-42-178-8.range217-42.btcentralplus.com ([217.42.178.8]
	helo=[192.168.1.65]) by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1aUMba-0001Lx-Ae; Fri, 12 Feb 2016 22:54:27 +0000
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <56BE629B.3090403@ilande.co.uk>
Date: Fri, 12 Feb 2016 22:54:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.42.178.8
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 0/4] virt: provide secure-only RAM and
 first flash
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3cqsNDQMZrqh

On 12/02/16 14:45, Peter Maydell wrote:

> NOTE: to get the -bios option to correctly load to the secure-only
> flash I had to implement a new function in loader.c. load_image_mr()
> is just like load_image_targphys() except that it requests loading
> to a MemoryRegion rather than a physaddr. I think we can also use this
> to clean up the Sparc cg3 and tcx display devices, which currently take
> a qdev property which is "the address I'm going to be mapped at"
> purely so they can use load_image_targphys() to load their ROMs.

Yes! This was something I remember having to explicitly work around when
adding the FCode ROMs to these devices as I couldn't otherwise see how
to load the binary directly into the appropriate MemoryRegion.


ATB,

Mark.

