Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1355299lfm;
        Thu, 9 Jul 2020 05:16:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4PSrQZ4Hr1NcATJ6ugc2BBahS1sEvphNQmPOwEdo2um2PUocFdN577jvOiPhY0j7z0Ckk
X-Received: by 2002:a25:e806:: with SMTP id k6mr53649628ybd.154.1594296996724;
        Thu, 09 Jul 2020 05:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594296996; cv=none;
        d=google.com; s=arc-20160816;
        b=OpBbDi1gLWhbyc9cOY6M7vNo5V+/jXwNoWO54FUHVPm4aKfl6uXu5iKxzG4nz2+eUx
         MLTFjrmdqmnh4UstSY8LvZ+fEP2X7dOwSmO1xdgAZM8uUb1bISUWRhkd+Y9FgYVt3t4m
         7SOnAXVirF1DpV0dKjyHU0PvAKtQZ0R7o+YLEi+tZlC+otLAO8a8B6dVIiJXHeIR4RG4
         Jqwy7NZF97muYc7yas0iTULbp0lBmpCVDSRfS5U4BHn66IFL42Fsc5Dx3pZnTB4atVzo
         dasjhV7jppmxOAADx2SwwXcjEPj0TwTY8tvfRoJQqe5gCZBqgw4ybldno0aDJVDoDc4T
         eXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject;
        bh=ubGTFUH4bwgs0jyl5nbfnhn9gze24290CXOpRbmJiYg=;
        b=NpTupx1ieGGoCej33UN2AO8tlPA9uh1dD6AYk5lLYfDIfBd7z/zqDsxSQYzADKPnVt
         zPB+3PXm2mL0tNHchsIGBrdAi5EoBmV8zSHwAlQK4ekUYgBj2q6PTyBZpNABVNz2mY6+
         0kvlE0oghwpMEejEIn3A7GXicPtTEfa+/yy7SSWSIBcCmJgpW7KUOFJBBbdriKstOpgF
         uj9rWJrABlV2OQWkoWdcjRDzqAQBlffauXcTnN5UcVql7Uv9+e2LzKVpWREfcgv/hzoT
         GDnBfH5gyeyNedZ+4/8Ju/ygifI04edj58jPKFaBnPASYh1R0U5Pv9bOHcn4YtSVFGVj
         cHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h187si2456725ybh.113.2020.07.09.05.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 05:16:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtVTg-0007vT-4h
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 08:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vav@sysgo.com>)
 id 1jtVTR-0007un-GV; Thu, 09 Jul 2020 08:16:21 -0400
Received: from mail.sysgo.com ([176.9.12.79]:41314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vav@sysgo.com>)
 id 1jtVTN-0001YP-Cl; Thu, 09 Jul 2020 08:16:19 -0400
Subject: Re: [PATCH] hw/timer/a9gtimer: Clear pending interrupt, after the
 clear of Event flag
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200610084551.28222-1-vav@sysgo.com>
 <CAFEAcA9uF01LnFy6o4Yy=aeuy9ixyGWZFVGtR66ah3w1458O5g@mail.gmail.com>
 <583c6e8e-fe52-881d-1a61-f02ce7b16d23@sysgo.com>
 <CAFEAcA8XLnUWQP9BgYfN_Q5Kg8nEMfEynFiRMx8NOS2roE+V1A@mail.gmail.com>
From: =?UTF-8?Q?V=c3=a1clav_Vanc?= <vav@sysgo.com>
Message-ID: <a9279c39-9e5e-0cb2-c4fc-474b108c04ce@sysgo.com>
Date: Thu, 9 Jul 2020 14:16:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8XLnUWQP9BgYfN_Q5Kg8nEMfEynFiRMx8NOS2roE+V1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=176.9.12.79; envelope-from=vav@sysgo.com;
 helo=mail.sysgo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 08:16:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xwdadgFSRxT2



On 6/26/20 4:46 PM, Peter Maydell wrote:
> On Tue, 16 Jun 2020 at 08:04, Václav Vanc <vav@sysgo.com> wrote:
>>
>> On 6/15/20 1:04 PM, Peter Maydell wrote:
>> We must distinguish between two cases:
>> 1, Auto-increment is disabled.
>> I just run some test on SABRE Lite (i.MX6) board.
>> I had auto-increment disabled, I verified, that GIC is configured for
>> Edge interrupts. Once count went past the compare value I got the
>> interrupt. I did not touch Timer registers, just signal EOI to GIC and
>> surprisingly, I got a another interrupt. If I stopped the timer
>> interrupts stopped coming (Status was still set to 1).
>>
>>   From this behavior I assume, that every time the Timer is incremented
>> (and Timer value is past the compare value) an EDGE interrupt (that
>> means actual X->0->1 transition) is asserted. This is really interesting
>> from HW point of view. This would mean, that a9_gtimer_update function
>> should generate the pulse and not level on compare event.
> 
> That's interesting. Which version of the Cortex-A9 does this
> board have? The TRM documents that the comparator behaviour
> changed in r2p0...
> 
> thanks
> -- PMM
> 

It is "SABRE Lite (i.MX6)" board with Cortex-A9 r2p10.
Behavior is also the same for "Xilinx Zynq-7000 SoC ZC702 Evaluation 
Kit" with Cortex-A9 r3p0.

Unfortunately I do not have any board with older revision of Cortex-A9.

Best Regards,
Ing. Václav Vanc
Project Engineer

SYSGO s.r.o.
Embedding Innovations
Research and Development Center Prague
Zeleny pruh 1560/99 I CZ-14000 Praha 4
Phone: +420 222138 828, +49 6136 9948 828
Fax: +420 244911174
E-mail: vaclav.vanc@sysgo.com
_________________________________________________________________________________

Web: https://www.sysgo.com
Blog: https://www.sysgo.com/blog
Events: https://www.sysgo.com/events
Newsletter: https://www.sysgo.com/newsletter
_________________________________________________________________________________

Handelsregister/Commercial Registry: HRB Mainz 90 HRB 48884
Geschäftsführung/Managing Directors: Etienne Butery (CEO), Kai Sablotny 
(COO)
USt-Id-Nr./VAT-Id-No.: DE 149062328

The protection of your personal data is important to us. Under the 
following link you can see the information in accordance with article 13 
GDPR: https://www.sysgo.com/privacy_policy
