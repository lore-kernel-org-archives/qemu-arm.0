Received: by 10.28.71.27 with SMTP id u27csp2016359wma;
        Thu, 22 Feb 2018 06:25:52 -0800 (PST)
X-Google-Smtp-Source: AH8x225D9D2t9C58evPHOts+Y2YvF3LS77heN3pFWoz9c1ccesnHHtk1R1RP12z4DOkgmES4HPse
X-Received: by 10.129.93.139 with SMTP id r133mr4777372ywb.422.1519309552088;
        Thu, 22 Feb 2018 06:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519309552; cv=none;
        d=google.com; s=arc-20160816;
        b=pVMBmHxc5t5BacLfQ8/eptIKVT0adElDocnkzaSRAoqmbi7nEYLNRpfzF8/IusB9vV
         pcuMG5kGcfmyCUWbkT4UPRI8X6p7fToweDlaeKMQadGVMciy/CVLGsr7Y3gstcjhscSK
         tbJ9TDfvl0DFL15FD0/LPBKncbASL2o8diqhRZW+QWQcIWXo0A2BgNofUT48NwJszQoa
         RRMIobcrnd4jAHVD2VoCPzsrkrVWl0iQ8Y8HeYkQei+nPE7uK+Azn61dT9PiYDlKNPmH
         zXrtGG3CI+mxmYU1FBXM/2suiK4f2Lbg1TCJ7a2RZOzBTBpKTMbQ7MBYD06sHvR4Bvwv
         ZH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=GcLFd5aGxHAh5sCQ+73IWs57IbAtk1Wdsn4KCJjHpRA=;
        b=MAx+5zq3HkjtjmFupkH46rRSecURdULuj01s3iBTgkAy5cP63qo/rPI3ykpfujJ3zh
         3RhsU21o4R7Pm7urvCLc47+V4kcUmYWCyYjUkyymMOuSd5yiD5MDmEru0VWSh+ChLCBH
         1UDlUcMoXwLnKWyVVoUhJMZvaS3iTkZfPn67Gk39F9pBMkxz36X84rTnd/vZ1O9vhs0E
         TTYFmi7Jr8+PD04hEjEkiA4UBDUVe9WXS1wcF8AvI7Qw+eW9vlcd8rerx1xaHCBFQh35
         4pYzo9IxlL+PcLHTWeDahh83LLwRGMOwolVniKNaF8H9lyt6uJQ6BQZTo8pdoJ/Azpuw
         g+XA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14-v6si28424ybl.521.2018.02.22.06.25.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 06:25:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eorol-0000ma-Fy
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 09:25:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eorob-0000ki-Ok
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 09:25:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eoroa-0000q9-Qc
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 09:25:41 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60648 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1eoroa-0000pm-LR; Thu, 22 Feb 2018 09:25:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DD9140753A2;
	Thu, 22 Feb 2018 14:25:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-147.ams2.redhat.com
	[10.36.116.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34DF31049460;
	Thu, 22 Feb 2018 14:25:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7E3421750F; Thu, 22 Feb 2018 15:25:36 +0100 (CET)
Date: Thu, 22 Feb 2018 15:25:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180222142536.2upstkie3wsv5cps@sirius.home.kraxel.org>
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-2-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519303376-92875-2-git-send-email-imammedo@redhat.com>
User-Agent: NeoMutt/20171215
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 22 Feb 2018 14:25:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 22 Feb 2018 14:25:39 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 1/9] acpi: remove unused acpi-dsdt.aml
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Pl3fMDY/mrR

On Thu, Feb 22, 2018 at 01:42:48PM +0100, Igor Mammedov wrote:
> SeaBIOS blob which is currently shipped with QEMU
> doesn't need acpi-dsdt.aml nor is able to use it
> and code that loaded it QEMU was removed by
> (commit 9fb7aaaf4c "pc: drop external DSDT loading")
> in 2013.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> CC: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

