Received: by 10.182.158.201 with SMTP id ww9csp541090obb;
        Thu, 26 Nov 2015 02:58:01 -0800 (PST)
X-Received: by 10.55.72.3 with SMTP id v3mr21621006qka.107.1448535476541;
        Thu, 26 Nov 2015 02:57:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l89si25809232qki.93.2015.11.26.02.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Nov 2015 02:57:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1uFQ-0002RZ-9z
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 05:57:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1a1uF4-000286-2d
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 05:57:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1a1uF3-0007II-72
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 05:57:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1a1uEy-0007HV-P9; Thu, 26 Nov 2015 05:57:28 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 6EB949249B;
	Thu, 26 Nov 2015 10:57:26 +0000 (UTC)
Received: from [10.36.5.196] (vpn1-5-196.ams2.redhat.com [10.36.5.196])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAQAvLnh011460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Nov 2015 05:57:23 -0500
To: Eric Auger <eric.auger@linaro.org>, eric.auger@st.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com, 
	peter.maydell@linaro.org
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
	<1447946528-1533-3-git-send-email-eric.auger@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5656E590.3040001@redhat.com>
Date: Thu, 26 Nov 2015 11:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447946528-1533-3-git-send-email-eric.auger@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-devel] [RESEND RFC 2/6] device_tree: introduce
 load_device_tree_from_sysfs
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
X-TUID: Rv4Mh4CeSbj2

On 19/11/15 16:22, Eric Auger wrote:
> This function returns the host device tree blob from sysfs
> (/sys/firmware/devicetree/base).
> 
> This has a runtime dependency on the dtc binary. This functionality
> is useful for platform device passthrough where the host device tree
> needs to be parsed to feed information into the guest device tree.
> 
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> ---
>  device_tree.c                | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/device_tree.h |  1 +
>  2 files changed, 41 insertions(+)
> 
> diff --git a/device_tree.c b/device_tree.c
> index a9f5f8e..58a5329 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -117,6 +117,46 @@ fail:
>      return NULL;
>  }
>  
> +/**
> + * load_device_tree_from_sysfs
> + *
> + * extract the dt blob from host sysfs
> + * this has a runtime dependency on the dtc binary
> + */
> +void *load_device_tree_from_sysfs(void)
> +{
> +    char cmd[] = "dtc -I fs -O dtb /sys/firmware/devicetree/base";
> +    FILE *pipe;
> +    void *fdt;
> +    int ret, actual_dt_size;
> +
> +    pipe = popen(cmd, "r");
> +    if (!pipe) {
> +        error_report("%s: Error when executing dtc", __func__);
> +        return NULL;
> +    }

The Device Tree Compiler binary is normally only installed on
developer's machines, so I somewhat doubt that it is a good idea to rely
on the availability of that binary in QEMU? Maybe you should rather
extend libfdt to support such a feature?

 Thomas

