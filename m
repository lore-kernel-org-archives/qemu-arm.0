Received: by 10.25.0.198 with SMTP id 189csp1293555lfa;
        Mon, 8 May 2017 03:52:28 -0700 (PDT)
X-Received: by 10.233.222.5 with SMTP id s5mr14014619qkf.287.1494240748432;
        Mon, 08 May 2017 03:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494240748; cv=none;
        d=google.com; s=arc-20160816;
        b=HaK/bEwEXwxrSp+NFXijjYU2vCWi9xbtQQ3jH8eVQTgnF9dnRGDaNQHZMCuM1QngHu
         q3aEZqoEGAnJGCT0kQ+kaMaEC2m+R3ZYe+Hsxn8RJhKqm+7cPLxjzaTVHiHG/nwfQp+u
         SHNkq/3Dvq2QUMkF/TZWuBZOKlH3aFCc2UVJhtW5IrfSZT3AfYUVpPbRZmXYkvVpuiP1
         5y1KyfVtmquF27tHJAk9huT9zpX/qvXBs7OXmmCtz5NyMf+saN6IBkPCE/Z9SYJmL1C+
         JwLi2Olodbj3yMz1Q4a7Apvojcj83Q9jBU5M5rc8vSTsaCwGff4r1romD/REJbj/xBjq
         bIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:to:from:date:arc-authentication-results;
        bh=7iOW/UITrfDvH3SQv4T6ElAIfKsuXH6U6wtDlUn7yys=;
        b=li3798TZk7kqt60oVgpqVCApgvJTuy+tdl6EavjK9mifTAdN3H3l5rPVekBrUUlLG8
         0s+qtXCA+/0vy/90/HFVP5I8trLQtAI8/s9NRJsqn1MKhB29xJthVR3kP2KsTVHBFGSb
         JlTHiWAJXaqXcVLdRnQp/Rpa9KHp2zkCrdHquJJLLlSMlHMYmn5JVBGJb181OiUIsr0j
         nQABcaECetSfiuNyyFlvVPqBan8E11VIQKv1qVxslPvlrjC6UJH7/3khsCDiR0hKeeVO
         csjYnoIzqyS5LdTS698+qE8o3/BpV4rjbOCBWTSI/lj9xAblDRU6FlYc29rdenMXll1w
         HXug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g46si12321137qtb.317.2017.05.08.03.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 May 2017 03:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:58753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7gHD-0000O2-Rk
	for alex.bennee@linaro.org; Mon, 08 May 2017 06:52:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1d7gH3-0000Lx-O3
	for qemu-arm@nongnu.org; Mon, 08 May 2017 06:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1d7gH0-0007bt-Kx
	for qemu-arm@nongnu.org; Mon, 08 May 2017 06:52:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37269
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cornelia.huck@de.ibm.com>)
	id 1d7gH0-0007bg-E3
	for qemu-arm@nongnu.org; Mon, 08 May 2017 06:52:14 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v48Ae88Z064806
	for <qemu-arm@nongnu.org>; Mon, 8 May 2017 06:52:13 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2aaguvjgtw-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Mon, 08 May 2017 06:52:13 -0400
Received: from localhost
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Mon, 8 May 2017 11:52:09 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 8 May 2017 11:52:01 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v48Aq0GG37945484; Mon, 8 May 2017 10:52:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A431AE057;
	Mon,  8 May 2017 11:50:23 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 759E5AE051;
	Mon,  8 May 2017 11:50:22 +0100 (BST)
Received: from gondolin (unknown [9.152.224.119])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2017 11:50:22 +0100 (BST)
Date: Mon, 8 May 2017 12:51:58 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Eduardo Habkost <ehabkost@redhat.com>
In-Reply-To: <20170505203620.GN3482@thinpad.lan.raisama.net>
References: <20170503203604.31462-1-ehabkost@redhat.com>
	<20170503203604.31462-3-ehabkost@redhat.com>
	<20170505093622.37902dea.cornelia.huck@de.ibm.com>
	<20170505165419.GF3482@thinpad.lan.raisama.net>
	<20170505203620.GN3482@thinpad.lan.raisama.net>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17050810-0012-0000-0000-0000052484BA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050810-0013-0000-0000-0000185F2AD4
Message-Id: <20170508125158.713581ce.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-05-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
	definitions=main-1705080061
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-arm] [PATCH] fixup! sysbus: Set user_creatable=false by
 default on TYPE_SYS_BUS_DEVICE
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Yi Min Zhao <zyimin@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Pierre Morel <pmorel@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	sstabellini@kernel.org, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laszlo Ersek <lersek@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Gabriel L . Somlo" <somlo@cmu.edu>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Juergen Gross <jgross@suse.com>,
	Frank Blaschka <frank.blaschka@de.ibm.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 755wJyuMrgWb

On Fri, 5 May 2017 17:36:20 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Fixup will be included in v3, or can be applied by maintainer:
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/core/sysbus.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 6a2eec8dd0..5d0887f499 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -327,14 +327,14 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
>      k->init = sysbus_device_init;
>      k->bus_type = TYPE_SYSTEM_BUS;
>      /*
> -     * device_add plugs devices into suitable bus.  For "real" buses,
> +     * device_add plugs devices into a suitable bus.  For "real" buses,
>       * that actually connects the device.  For sysbus, the connections
>       * need to be made separately, and device_add can't do that.  The
>       * device would be left unconnected, and will probably not work
>       *
> -     * However, a few machines and a few devices can handle a few sysbus
> -     * devices. In this case, the device subclass needs to override
> -     * it and set user_creatable=true.
> +     * However, a few machines can handle device_add/-device with
> +     * a few specific sysbus devices. In those cases, the device
> +     * subclass needs to override it and set user_creatable=true.
>       */
>      k->user_creatable = false;
>  }

FWIW: LGTM

