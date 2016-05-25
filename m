Received: by 10.25.30.65 with SMTP id e62csp1298426lfe;
        Wed, 25 May 2016 06:03:45 -0700 (PDT)
X-Received: by 10.140.100.167 with SMTP id s36mr3154000qge.19.1464181425553;
        Wed, 25 May 2016 06:03:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z128si7852286qke.35.2016.05.25.06.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 06:03:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5YTQ-0005Tp-MU
	for alex.bennee@linaro.org; Wed, 25 May 2016 09:03:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b5YTL-0005R0-JI
	for qemu-arm@nongnu.org; Wed, 25 May 2016 09:03:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b5YTH-0001Ym-EK
	for qemu-arm@nongnu.org; Wed, 25 May 2016 09:03:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b5YTH-0001Yh-8F; Wed, 25 May 2016 09:03:35 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1B52285C1;
	Wed, 25 May 2016 13:03:34 +0000 (UTC)
Received: from [10.36.112.49] (ovpn-112-49.ams2.redhat.com [10.36.112.49])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4PD3TcH020901
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 May 2016 09:03:31 -0400
To: xiaoqiang zhao <zxq_yx_007@163.com>, qemu-devel@nongnu.org
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <288ac755-99df-d22d-446a-26924f73ce4d@redhat.com>
Date: Wed, 25 May 2016 15:03:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 25 May 2016 13:03:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/6] Drop the qemu_char_get_next_serial
 function
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
Cc: peter.maydell@linaro.org, robh@kernel.org, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajfLSj77HuzB



On 25/05/2016 12:58, xiaoqiang zhao wrote:
> This patch series's main idea is to drop the use of
> qemu_char_get_next_serial. patches 1-5 QOM'ify the related 
> device model and the affected board code. Most of them
> are arm related. The patch 6 get rid of the function from
> the code base.
> 
> I only test the code with ARM versatilepb machine. The other
> machine need test!
> 
> xiaoqiang zhao (6):
>   hw/char: QOM'ify pl011 model
>   hw/char: QOM'ify cadence_uart model
>   hw/char: QOM'ify digic-uart model
>   hw/char: QOM'ify stm32f2xx_usart model
>   hw/char: QOM'ify xilinx_uartlite model
>   char: get rid of qemu_char_get_next_serial

These are all ARM boards, so I guess they will be merged through Peter's
ARM tree.

Thanks,

Paolo
