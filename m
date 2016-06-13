Received: by 10.25.85.209 with SMTP id j200csp1100111lfb;
        Mon, 13 Jun 2016 02:26:16 -0700 (PDT)
X-Received: by 10.237.48.45 with SMTP id 42mr12834365qte.7.1465809975879;
        Mon, 13 Jun 2016 02:26:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f91si14666813qga.24.2016.06.13.02.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCO8N-0008Qj-8x
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:26:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCO7Z-0007r7-Iz
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:25:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCO7U-00076w-80
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:25:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCO7U-00076e-1x; Mon, 13 Jun 2016 05:25:20 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 743F980E6A;
	Mon, 13 Jun 2016 09:25:19 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D9PE6t029549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 05:25:16 -0400
To: vijayak@caviumnetworks.com, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
	quintela@redhat.com
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3182a047-21e2-cccf-b42f-bc1651c51f45@redhat.com>
Date: Mon, 13 Jun 2016 11:25:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 13 Jun 2016 09:25:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH v1 4/4] target-arm: Compute page size
 based on ARM target cpu type
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
Cc: Prasun.Kapoor@caviumnetworks.com, Vijaya Kumar K <vijayak@cavium.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AO8NwQpIDg2p



On 13/06/2016 11:08, vijayak@caviumnetworks.com wrote:
> + */
> +#define TARGET_AARCH64_PAGE_BITS 12
>  /* The ARM MMU allows 1k pages.  */
>  /* ??? Linux doesn't actually use these, and they're deprecated in recent
>     architecture revisions.  Maybe a configure option to disable them.  */
> -#define TARGET_PAGE_BITS 10
> -#endif
> +#define TARGET_ARM_PAGE_BITS 10
> +#define TARGET_PAGE_BITS arm_get_target_page_bits()

Please avoid the function call and just make it a variable target_page_bits.

Paolo
