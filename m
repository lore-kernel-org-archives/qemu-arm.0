Received: by 10.80.166.35 with SMTP id d32csp3336518edc;
        Tue, 25 Oct 2016 11:24:15 -0700 (PDT)
X-Received: by 10.31.141.5 with SMTP id p5mr16715641vkd.136.1477419855312;
        Tue, 25 Oct 2016 11:24:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si811067vkk.248.2016.10.25.11.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 11:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz6OU-00088l-Nz
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 14:24:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bz6OQ-00087A-GO
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 14:24:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bz6ON-00044Z-AA
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 14:24:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bz6ON-00044S-4X; Tue, 25 Oct 2016 14:24:07 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 676A080F90;
	Tue, 25 Oct 2016 18:24:06 +0000 (UTC)
Received: from javelin (vpn-59-129.rdu2.redhat.com [10.10.59.129])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9PIO10A032254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 25 Oct 2016 14:24:03 -0400
Date: Tue, 25 Oct 2016 23:54:00 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <CAKmqyKOXQhAh+5pK4XbvkJ664fAzRXqBGYfq61u7RV2kjOU6QQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610252318530.15276@wniryva>
References: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOXQhAh+5pK4XbvkJ664fAzRXqBGYfq61u7RV2kjOU6QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 25 Oct 2016 18:24:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] char: cadence: check baud
 rate generator and divider values
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Huawei PSIRT <psirt@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yoNq3mAQX8pf

   Hello Alistair,

+-- On Tue, 25 Oct 2016, Alistair Francis wrote --+
| >   * Device model for Cadence UART
| > + *  -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
| 
| Can you say what page/section the UART spec is in the Xilinx TRM?

  Chapter 19 UART Controller, page 585, 19.2.3 Baud Rate Generator.
 
| I think it might also be worth noting that the datasheet is a Xilinx
| datasheet that covers the Cadence UART. Others might be using the IP
| as well and might get confused why you are referring to a Xilinx
| datasheet.

  Right, I'll add above section details in the comment.
 
| > +    case R_BRGR: /* Baud rate generator */
| > +        s->r[offset] = 0x028B; /* default reset value */
| 
| Is this the correct behavior, or should the write just be ignored?
| pg.587 of the TRM doesn't really make this clear, did you find this
| somewhere else?

  True, page 587 does not clearly mention if it should be ignored.
But in Appendix B, Register details for 'Baud_rate_gen_reg0' says

    0: Disables baud_sample
    1: Clock divisor bypass (baud_sample = sel_clk)
    2 - 65535: baud_sample

| > +    case R_BDIV:    /* Baud rate divider */
| > +        s->r[offset] = 0x0F;

  Appendix B, Register details for 'Baud_rate_divider_reg0' says

    0 - 3: ignored
    4 - 255: Baud rate


ie. values 0-3 are ignored. But should we avoid writing 's->r[R_BRGR]' & 
's->r[R_BDIV]' for these values? That would lead to undefined values being 
using in 'uart_parameters_setup()', no?

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
