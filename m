Received: by 10.25.227.6 with SMTP id a6csp2143291lfh;
        Mon, 3 Jul 2017 04:37:49 -0700 (PDT)
X-Received: by 10.55.97.148 with SMTP id v142mr42020371qkb.107.1499081869496;
        Mon, 03 Jul 2017 04:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499081869; cv=none;
        d=google.com; s=arc-20160816;
        b=pIvQcbdlLA9VtPYM63ZMEpd3iBxFBF3d330NoBBc92MxQgYlMYWtqWk3AC6loZyzsl
         HBadmz7luvMhJvPjg6/8TUHJWy8pduZCAlLeh5pIB4T5qyzscTPfDx65Vj0bf9dRQzHK
         lZm7tY2Lwk80BNDRcYcNfQ58SmasWG/ZkzTiv6yQbqZqdjqUy2I+NLAGvExJgCBLAT8l
         vCm71hUh5kanPUiqQFzeyNM+QX4VuTtHCA1s6u+CAlZNiTsSAvszMcytg3yt/R1jCfwl
         e8KnIiUR5Lkt2wwbbKvstzy15Gj1tQEeE8uo5kyK30RWInIFXDmHCV7tyPrTMERQZ6tV
         1ERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=KYm2lqKEuNkyqVCEsbdz6spuXG1kdf725tonZl5j45s=;
        b=ncJssdEWtvDt98y+kpPWtu63TwmopU7nKd2Zt6yuTGOYz9lvvuZYMeFQ3CedWGUeYb
         48KvXvcv4XtqHbNNprFfbtxqoypwzSoMPFggg0gt7klQf9iqfdjhnKXL923nL3hiO+r4
         oAyY6LvLLU2VdXXaos5kAHuJGJWKB5Q8KH2R+pO9l8eWjbLzmNLS4/iy5zwNsZaC36xg
         aYlZPESwIrL7B1HwzS5A4ZpwGdVQVFtFXmCvpsi0xayNlQ9MiwEWA1eWE4D5/3y08Dhp
         zaJrUZZXbbU7JcBwb9Oc8eAvslm5pYk5BEybgiVE7l7QDlZRJ3c7ia6PeMXAN40bZ6jU
         x76g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m23si14875936qtb.270.2017.07.03.04.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jul 2017 04:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRzfm-0001VZ-S8
	for alex.bennee@linaro.org; Mon, 03 Jul 2017 07:37:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dRzfh-0001VR-7s
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 07:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dRzfd-0002sj-6T
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 07:37:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dRzfc-0002rd-WB; Mon, 03 Jul 2017 07:37:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2438380F6D;
	Mon,  3 Jul 2017 11:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2438380F6D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2438380F6D
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3D18893E6;
	Mon,  3 Jul 2017 11:37:27 +0000 (UTC)
To: eric.auger.pro@gmail.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1497360677-4780-1-git-send-email-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8d9934e2-efab-c7c6-da3a-31749a031f31@redhat.com>
Date: Mon, 3 Jul 2017 13:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1497360677-4780-1-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 03 Jul 2017 11:37:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 0/3] Generic PCIe host bridge INTx
 determination for INTx routing
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
Cc: drjones@redhat.com, agraf@suse.de, christoffer.dall@linaro.org,
	pranavkumar@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NYRwpTVig0Ax

Hi,

On 13/06/2017 15:31, Eric Auger wrote:
> This series implements INTx to gsi routing for ARM VIRT/GPEX. This is
> a respin of [1] which was lost in limbo.
> 
> ARM virt uses GPEX PCIe bridge. This latter does not implement INTx
> to GSI routing. PCIe/INTx assignment works but the consequence is
> irqfd is not used along with INTx interrupts and VFIO INTx handlers
> are executed on userspace leading to an important performance degradation.
> 
> This issue is witnessed by the following messages;
> 
> qemu-system-aarch64: -device vfio-pci,host=0006:90:00.0: PCI: Bug -
> unimplemented PCI INTx routing (gpex-pcihost)
> qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)
> qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)
> 
> So with this series, irqfd is set up for PCIe/INTx passthrough and we get
> the optimal performance. Also we get rid of the above messages.

Ping? any feedback on this series that fixes irqfd setup for PCIe
passthrough/ARM with legacy interrupts?

Thanks

Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v2.9-gpex-intx-v3
> 
> References:
> [1] Generic PCIe host bridge INTx determination for INTx routing
>    https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg04975.html
> 
> Pranavkumar Sawargaonkar (3):
>   hw/pci-host/gpex: Set INTx index/gsi mapping
>   hw/arm/virt: Set INTx/gsi mapping
>   hw/pci-host/gpex: Implement PCI INTx routing
> 
>  hw/arm/virt.c              |  4 ++++
>  hw/pci-host/gpex.c         | 22 ++++++++++++++++++++++
>  include/hw/pci-host/gpex.h |  3 +++
>  3 files changed, 29 insertions(+)
> 
