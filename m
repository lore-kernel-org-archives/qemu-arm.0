Received: by 10.103.98.197 with SMTP id w188csp436733vsb;
        Tue, 21 Feb 2017 07:31:05 -0800 (PST)
X-Received: by 10.55.88.66 with SMTP id m63mr26958018qkb.270.1487691065268;
        Tue, 21 Feb 2017 07:31:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k67si15322979qkb.55.2017.02.21.07.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 07:31:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgCP8-0004rs-Gc
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 10:31:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgBuP-0008CD-T4
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 09:59:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgBuM-0007nY-6z
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 09:59:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32792)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cgBuM-0007nE-14; Tue, 21 Feb 2017 09:59:14 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3F9AC05678D;
	Tue, 21 Feb 2017 14:59:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LExAFF012572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 21 Feb 2017 09:59:11 -0500
To: Sinan Kaya <okaya@codeaurora.org>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
	<1487683100-16013-2-git-send-email-eric.auger@redhat.com>
	<98d4d9e8-761c-76f9-ecb0-c5a4a658dfab@codeaurora.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2dcc9002-ec06-c55e-c0a2-75d05fe05762@redhat.com>
Date: Tue, 21 Feb 2017 15:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <98d4d9e8-761c-76f9-ecb0-c5a4a658dfab@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 21 Feb 2017 14:59:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/2] vfio/platform: make the vfio-platform
 device non abstract
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
Cc: pelcan@codeaurora.org, vikrams@codeaurora.org, shankerd@codeaurora.org,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YqECKj+dJ5+u

Hi Sinan,
On 21/02/2017 15:45, Sinan Kaya wrote:
> Hi Eric,
> Thanks for the long anticipated patch.
> 
> On 2/21/2017 8:18 AM, Eric Auger wrote:
>> +    DEFINE_PROP_STRING("manufacturer", VFIOPlatformDevice, manufacturer),
>> +    DEFINE_PROP_STRING("model", VFIOPlatformDevice, model),
> 
> The OF string is not always of the format "manufacturer, model".
> 
> HIDMA for instance uses a syntax of "qcom, hidma-1.0" and "qcom, hidma-2.0".
> This syntax is used for cases where an IP gets used in multiple SOCs. 
> 
> Maybe, we should call it just compatible-string and try not to make meaning
> out of it.
> 
> Sinan
> 

in  http://www.devicetree.org/specifications-pdf I found the description
at the bottom.

I your case what would prevent from creating 2 entries in the table and
then use either in qemu cmd line?

VFIO_PLATFORM_BINDING("qcom", "hidma-1.0", add_amd_hidma_fdt_node),
VFIO_PLATFORM_BINDING("qcom", "hidma-2.0", add_amd_hidma_fdt_node),

The issue is the comma in the property is interpreted as a separator for
options, hence that choice of having 2 separate options.

Besides I will fix the CONFIG_LINUX compilation issue asap.

Thanks

Eric

"
The recommended format is "manufacturer,model", where manufacturer is a
string describing the name of the manufacturer (such as a stock ticker
symbol), and model specifies the model number.

Example:
compatible = "fsl,mpc8641-uart", "ns16550";
In this example, an operating system would first try to locate a device
driver that supported
fsl,mpc8641-uart. If a driver was not found, it would then try to locate
a driver that supported the more general ns16550 device type.
"
