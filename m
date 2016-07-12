Received: by 10.25.21.156 with SMTP id 28csp124704lfv;
        Mon, 11 Jul 2016 18:24:25 -0700 (PDT)
X-Received: by 10.55.221.157 with SMTP id u29mr27859264qku.200.1468286665411;
        Mon, 11 Jul 2016 18:24:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z68si2614299qke.276.2016.07.11.18.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 18:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMmQy-00064G-Ue
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 21:24:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bMmQs-000639-VN
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 21:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bMmQs-0007vM-42
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 21:24:18 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:51616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bMmQm-0007s4-Vm; Mon, 11 Jul 2016 21:24:13 -0400
Received: from 172.24.1.137 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DKB76780; Tue, 12 Jul 2016 09:23:57 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 12 Jul 2016 09:23:49 +0800
Message-ID: <57844691.1000001@huawei.com>
Date: Tue, 12 Jul 2016 09:23:29 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1468260552-8400-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1468260552-8400-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.578446AE.0074, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c76b42820f5ae2b10cb10f68cc58e8e6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix unreachable
 code in gicv3_class_name()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PaFBbnXZa+xp



On 2016/7/12 2:09, Peter Maydell wrote:
> Coverity complains that the exit() in gicv3_class_name()
> can be unreachable, because if TARGET_AARCH64 is defined
> then all code paths return before reaching it. Move the
> exit() up to the error_report() that it belongs with.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  target-arm/machine.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 2dbeb82..7a6ca31 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -340,10 +340,9 @@ const char *gicv3_class_name(void)
>  #else
>          error_report("KVM GICv3 acceleration is not supported on this "
>                       "platform");
> +        exit(1);
>  #endif
>      } else {
>          return "arm-gicv3";
>      }
> -
> -    exit(1);
>  }
> 

-- 
Shannon

