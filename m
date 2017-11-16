Received: by 10.223.150.237 with SMTP id u100csp576772wrb;
        Thu, 16 Nov 2017 09:02:52 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZXSTn5WcKbNSsBIJtMzbZ79NVp6gff0y2hLERUa/X+B5RyK9Q+oElJvjTPKOojDRlgZ1DC
X-Received: by 10.129.116.6 with SMTP id p6mr1365251ywc.136.1510851772412;
        Thu, 16 Nov 2017 09:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510851772; cv=none;
        d=google.com; s=arc-20160816;
        b=LU37NSiJyR1TnVjCuuR7YJIZskthl2r6ZHPQY5snfDQ2jof9l8TLwhSxvsjQ9V6oT2
         5Fb4wvMf62P4SdBRVmQ/wiLs0YM/iPEm4lLVXLLYXYhNpCpQAiUcQs4721Hu+6i9m92E
         qJRH5Kasm1VG4VZpCdFPIhxhE2KuajJzH+L50sQNEubDQQXcX3IZnnQS/Y8bfSWLxUi2
         z1vvnzz3Ua7flqWCvcPwFlbvZPV4A0Lug0Sopqa/X3QAwBaLYGoIlNA2avxASvxLO/VR
         zmu/BiC9ZlA+/LTdt1KQNtdyhE7gt8lUSkavfZIWxR+tsi65JxLgon3lmd+ZvQ6NgYP9
         3nWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Da8GDpMg96E3fQBf7PliDy5mecGPSPkb1o6/s1PJioQ=;
        b=oUdPzX4d630LZY/dPxKhBY1BciiVy9KSTvcloc1F4/dcIvmJ9zA2BnNA4sfaFiwmXT
         kXStggkyhpBptqZguw0hqYPcgJaM2AFJnDnZePPd3hV+JDLHrH9ZFrzU26Buavab7L3i
         AP1kAnZ9/FaSRHX7P3jinMTIX0hUhIKiVQ5/QUgsPyAaSxhMEmf9kRUgxs/I0BPrbugQ
         /y2OyydvKd97PR3GaIHKh5ZsnUapZTb8vjwXxk2Rk5lgoeeAtRDHwAGDQ50P8NjG6BPY
         sK8yD3WoZ6MWJu+BH6xG/9TLVVN5h07TkZFlEBK+UUAJLUk9z34N2tt6YN0lBLqKjkq/
         71vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i69si292535ywg.757.2017.11.16.09.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Nov 2017 09:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eFNYx-0007WJ-RL
	for alex.bennee@linaro.org; Thu, 16 Nov 2017 12:02:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1eFNTi-0003dl-Sq
	for qemu-devel@nongnu.org; Thu, 16 Nov 2017 11:57:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1eFNTi-0002Fz-3A
	for qemu-devel@nongnu.org; Thu, 16 Nov 2017 11:57:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1eFNTd-00023V-BY; Thu, 16 Nov 2017 11:57:21 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 862807652C;
	Thu, 16 Nov 2017 16:57:19 +0000 (UTC)
Received: from [10.10.124.125] (ovpn-124-125.rdu2.redhat.com [10.10.124.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D6E35C885;
	Thu, 16 Nov 2017 16:57:12 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org
References: <1510846183-756-1-git-send-email-thuth@redhat.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <ac117f5e-49cb-3832-c361-ca27bf574882@redhat.com>
Date: Thu, 16 Nov 2017 10:57:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1510846183-756-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 16 Nov 2017 16:57:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm: Silence xlnx-ep108 deprecation
 warning during tests
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /++8oFZikGex



On 11/16/2017 09:29 AM, Thomas Huth wrote:
> The new deprecation warning for the xlnx-ep108 machine also pops up
> during "make check" which is kind of confusing. Silence it if testing
> mode is enabled.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Note: I slightly shortened the message so that the code still fits
>  into the 80-columns limit.
> 
>  hw/arm/xlnx-zcu102.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 9631a53..bbe7d04 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -24,6 +24,7 @@
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/log.h"
> +#include "sysemu/qtest.h"
>  
>  typedef struct XlnxZCU102 {
>      MachineState parent_obj;
> @@ -164,8 +165,10 @@ static void xlnx_ep108_init(MachineState *machine)
>  {
>      XlnxZCU102 *s = EP108_MACHINE(machine);
>  
> -    info_report("The Xilinx EP108 machine is deprecated, please use the "
> -                "ZCU102 machine instead. It has the same features supported.");
> +    if (!qtest_enabled()) {
> +        info_report("The Xilinx EP108 machine is deprecated, please use the "
> +                    "ZCU102 machine (which has the same features) instead.");
> +    }
>  
>      xlnx_zynqmp_init(s, machine);
>  }
> 

I tested it and it did solve the problem.

Acked-by: Wei Huang <wei@redhat.com>
