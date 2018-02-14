Received: by 10.28.71.27 with SMTP id u27csp772280wma;
        Wed, 14 Feb 2018 02:37:49 -0800 (PST)
X-Google-Smtp-Source: AH8x22469WS9MhB6FjfDqC4bO9dmXTKiUznIe4g2i6QXOeDs8tzIgiDTR70KJ8Ri09JDEQ4YkikE
X-Received: by 10.37.201.66 with SMTP id z63mr2832455ybf.250.1518604669141;
        Wed, 14 Feb 2018 02:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518604669; cv=none;
        d=google.com; s=arc-20160816;
        b=HJ46wOvPka4m+oqECdz91M8kt/RLvOZ60jD5Bjb71QiFzkD/bp4UHe62coAhDs0gGy
         72lwZvrva3J555FJ/Qt5Eah4v4xwWhDGcqlSh07mOlWIPenhUxPjTJZh3CnqtdGBkz/+
         JpmRTnEl+O9J7EV+Q3uwzazEad/wbxudljJGXgnGD0YcWr68+Tm8SuCeWV3kDm/mCbko
         Afu2fMAVIamd6LKeoGKH8/N/C28Kr8/MRdJyee2g2eq7DQYm2FhtpkbVdEETOKRGTrAw
         jV1ruYBuXYde3yMdCsjW1F173GsG5A9avoFbAR6mJc1Bl4+EMkO1l6O5NvPaUvdw14yQ
         X+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=gsYJMR0FdNLCZJXDwvOSgiCKuNU2gLz9meVlrUFPLTI=;
        b=Sr/4TxJf0qH1QhWT5Y6Kh0Vv4pminROLKUdBALjVyWROo7hroFrR+TOvv5KLylS0N4
         HxwAYx0EMoBR9u77+6t4sZVi1VYX+H5GkKMGmi+1lYr/K/iFOUY7Ei9z4WB/O8Qh0We3
         bm3zcvMgSNtPJ3BoTRUM2Gfx0s3BBO02dSwQz7ac4xl0hKNejMgUbu2vj09KSZgjtt8R
         8bCSskXH0Ms/HTFdz/Qs3HrmBngGnCXpX+GR2HY2xhd0X8DIH8sJ0nFpcgXqbySjSZH0
         FgV8PBG6En3nbvSR1W6CpHdG1BYt5S9njtR7mLzFZgCKWjC8uySU6U1PNzrYOEFl1N4k
         akCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r67si133538ybf.583.2018.02.14.02.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Feb 2018 02:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eluRg-0000wQ-JJ
	for alex.bennee@linaro.org; Wed, 14 Feb 2018 05:37:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eluRV-0000tO-5R
	for qemu-arm@nongnu.org; Wed, 14 Feb 2018 05:37:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eluRR-0001b3-75
	for qemu-arm@nongnu.org; Wed, 14 Feb 2018 05:37:37 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55760 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eluRR-0001ak-2S; Wed, 14 Feb 2018 05:37:33 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAB0DEB6F0;
	Wed, 14 Feb 2018 10:37:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 118422024CA4;
	Wed, 14 Feb 2018 10:37:12 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-4-git-send-email-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3ee22637-a0a9-306a-4e6d-14295d4bcb27@redhat.com>
Date: Wed, 14 Feb 2018 11:37:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1518189456-2873-4-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 14 Feb 2018 10:37:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 14 Feb 2018 10:37:21 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus
 devices again
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
Cc: Arnd Bergmann <arnd@arndb.de>, Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, qemu-arm@nongnu.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kx8AMFScjauS

Hi Geert,
On 09/02/18 16:17, Geert Uytterhoeven wrote:
> Allow the instantation of generic dynamic sysbus devices again, without
> the need to create a new device-specific vfio type.
> 
> This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
> Allow only supported dynamic sysbus devices").
> 
> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b334c82edae9fb1f..fa83784fc08ed076 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->max_cpus = 255;
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
Couldn't you limit that to TYPE_VFIO_PLATFORM instead?

Thanks

Eric
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;
> 
