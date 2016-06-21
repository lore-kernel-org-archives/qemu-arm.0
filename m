Received: by 10.25.21.96 with SMTP id l93csp1904906lfi;
        Tue, 21 Jun 2016 04:58:08 -0700 (PDT)
X-Received: by 10.55.203.73 with SMTP id d70mr29655430qkj.116.1466510288596;
        Tue, 21 Jun 2016 04:58:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y32si53525136qta.101.2016.06.21.04.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 04:58:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFKJk-0000lf-2Q
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 07:58:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bFKJg-0000Uw-5q
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 07:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bFKJc-00024e-0E
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 07:58:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bFKJb-00024Z-QO; Tue, 21 Jun 2016 07:57:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CB0373049;
	Tue, 21 Jun 2016 11:57:59 +0000 (UTC)
Received: from [10.36.112.60] (ovpn-112-60.ams2.redhat.com [10.36.112.60])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5LBvsUq029708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 21 Jun 2016 07:57:56 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-4-git-send-email-vijayak@caviumnetworks.com>
	<16ef20d6-8c02-8617-0b6a-16fab76d3333@redhat.com>
	<CAFEAcA_A=f0H3DkquozZKKVs4A3UR+fEhE9wfwe8zDHrsprEyQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0e6c012c-26c5-8878-f579-d2410c640cfb@redhat.com>
Date: Tue, 21 Jun 2016 13:57:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_A=f0H3DkquozZKKVs4A3UR+fEhE9wfwe8zDHrsprEyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 21 Jun 2016 11:57:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH v1 3/4] translate-all.c: Compute L1 page
 table properties at runtime
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijaya Kumar K <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 97K+uaKFJZZv



On 21/06/2016 13:53, Peter Maydell wrote:
>>> >>      object_property_add_child(object_get_root(), "machine",
>>> >>                                OBJECT(current_machine), &error_abort);
>>> >> +
>>> >> +    init_l1_page_table_param();
>> >
>> > Please call this from cpu_exec_init_all instead.
> If you're going to call it that early (ie before machine init)
> than I think we might as well just call it from the existing
> page_init() function in translate-all.c instead, right?
> (gets called when the tcg accelerator is inited; we don't need
> to set up the l1 map if we're not using TCG).

Yes, good idea.

Paolo
