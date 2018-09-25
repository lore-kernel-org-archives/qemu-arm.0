Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp722850wrt;
        Tue, 25 Sep 2018 07:10:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62tSwkP5JqzNDJlPHv7YhLEkZNENYFa0Y0VQiNxHKatr48lz8b6O5CBxVLkOgtdrDCRzB0y
X-Received: by 2002:ac8:36c8:: with SMTP id b8-v6mr950145qtc.49.1537884632122;
        Tue, 25 Sep 2018 07:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537884632; cv=none;
        d=google.com; s=arc-20160816;
        b=fv60/qDn4VSRjNLTY6VS75oxfrQ4t8vQNqL+QQHkUrQxXPPqsef/SKKNg+h9d6drl4
         C7S6SsWDjl9q1y+m+a7XriHjTHT0XoFAeGT6X/4cDiVxEU5Hfu146nKFc92CRNnAMOe3
         uddDWBQzhMCkr2c2NmbEUsXxdUY7+2nwx7b+SnrKUhmIyD3db6tpi49s3AcHq8pmkWQ7
         mqHdL9QMgk+ikiq1KqWyyRkI+BIUigX4lweEoY9Fvg/u+4fiLjT9dHb6GUn/KfCD7Aok
         uEgKwM7bGxbLf0UbrBsZzVB2DYkXWnmcLeBHMNubBbm9/zemebq7p8RNTMjM93NUesJh
         q4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature;
        bh=B819NQoRJogJwXi6i+5mjF9QDwJXGhdPDIl3TMm43zQ=;
        b=Cz3RCWrwkntxvXOxeg36nd9XrYabzA6BdOk9lHuEzG1CB51bLZlHlHfnPsaPXChXn7
         2NQdZIbYNLwkOluoz1VTqUv5kNOWJvNmr8g9kNMoaJAkXqWBS5inPYiTfqYSRnpvyAWO
         P33S2gBndTjIrSnNk8cFkhZ5fspqSPlfUmgMsRB7brAMYDdnPov6f8i0cY5CYZD0nTAb
         eHiZedmMvO8kyG3tWJfMl/kYTZsfJh0XlVMq5TjkFiUSMoFAU0CejWvMn42TfL4UagaY
         sigOwKYOO6jA1871JlPI7JlHZIru/l4JJej2u68ocKqQbfij2Yx6VCwa9BroxRPvZTle
         HWEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=czvhtKIB;
       dkim=pass header.i=@greensocs.com header.s=mail header.b="2C4XF/kJ";
       dkim=pass header.i=@greensocs.com header.s=mail header.b=SmC4WJR3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u32-v6si2097271qtb.176.2018.09.25.07.10.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=czvhtKIB;
       dkim=pass header.i=@greensocs.com header.s=mail header.b="2C4XF/kJ";
       dkim=pass header.i=@greensocs.com header.s=mail header.b=SmC4WJR3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4o2o-0005vH-Te
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:10:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g4ns1-0005A2-81
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 09:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g4ns0-0007Lw-6G
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 09:59:21 -0400
Received: from greensocs.com ([193.104.36.180]:53241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g4nrs-0007IV-9y; Tue, 25 Sep 2018 09:59:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id F14E84F7678;
	Tue, 25 Sep 2018 15:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537883948;
	bh=q8JfZURgBS8jwYKquxGQXCjfGa6jG/IK0XwcNTuu1Tg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=czvhtKIBa0xDjqg98EUXS7XSpFoVJvozUyukUG2f8u5Wx3tdVTgfcKm43h8Y7iXFi
	qPMYxXSTsiGSxYeU0V1a9DV0oB0PvVM1qrwm/AZMR+j048caGcSvtKSIRp+XssM7at
	Cn2olGYhfZBYm5B0UyEH8d0JEAqXWmqXivD3JOjM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=2C4XF/kJ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=SmC4WJR3
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29-9Ke_9rvUy; Tue, 25 Sep 2018 15:59:07 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 11A87238705; Tue, 25 Sep 2018 15:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537883947;
	bh=q8JfZURgBS8jwYKquxGQXCjfGa6jG/IK0XwcNTuu1Tg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=2C4XF/kJuQ3A9+DYyqx46I5sIPq7xBrQQMIM4gLx3yl3951/H55ma38MA+gtX1jQK
	pUNYz7aZTM1BhI9fFq+i2ftCkvCdfvpNF315oxyLVu6lgJx+CBgaYjcJXcKrOU4HYj
	p9yK+gJMy+rTnQIkbu6ggLauQsEyqQlP2F0I9rgY=
Received: from [172.16.10.171] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id A15E5E0878;
	Tue, 25 Sep 2018 15:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537883946;
	bh=q8JfZURgBS8jwYKquxGQXCjfGa6jG/IK0XwcNTuu1Tg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=SmC4WJR3TmgUjd2ejxTyHxWvKn5/rQvwhGozRT3CsFaZ/A78DtDKqDMS7w44hCzBc
	ovhWia0j2J0gTDjNo8Cg2aaLXzxKxi4vG4s3fp4wRpgNi3xLUfUL2PrSktkYtHuf9t
	5POc08OpdE8tlKLu6M4QmZbrGEB4eVttxRRhBiJI=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
	<20180917084016.12750-2-damien.hedde@greensocs.com>
	<CAFEAcA9M1MDcbx9CA60zaHnFbtHQD2G_HAWFdPimWhyn==_jqA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <7cac68bf-4047-c20a-dee5-2764ee595795@greensocs.com>
Date: Tue, 25 Sep 2018 15:59:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9M1MDcbx9CA60zaHnFbtHQD2G_HAWFdPimWhyn==_jqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-devel] [PATCH v4 01/10] hw/core/clock-port: introduce
 clock port objects
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: USFiFhOubAsD



On 9/25/18 11:42 AM, Peter Maydell wrote:
> On 17 September 2018 at 09:40,  <damien.hedde@greensocs.com> wrote:
>> From: Damien Hedde <damien.hedde@greensocs.com>
>>
>> Introduce clock port objects: ClockIn and ClockOut.
>>
>> Theses ports may be used to distribute a clock from a object to several
>> other objects. They do not contain any state and serve only as intermediate
>> to carry a ClockState which contains 2 fields:
>> * an integer which represent the frequency in Hertz
>> * a boolean which represent the reset status of the clock domain
>> Both are independent: eg the reset can be asserted while the clock running and
>> vice versa.
>>
>> A ClockIn may be connected to a ClockOut so that it receives update,
>> through the callback, whenever the Clockout is updated using the
>> ClockOut's set function.
>>
>> This is based on the original work of Frederic Konrad.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>  Makefile.objs           |   1 +
>>  include/hw/clock-port.h | 153 ++++++++++++++++++++++++++++++++++++++++
>>  hw/core/clock-port.c    | 145 +++++++++++++++++++++++++++++++++++++
>>  hw/core/Makefile.objs   |   1 +
>>  hw/core/trace-events    |   6 ++
>>  5 files changed, 306 insertions(+)
>>  create mode 100644 include/hw/clock-port.h
>>  create mode 100644 hw/core/clock-port.c
>>  create mode 100644 hw/core/trace-events
>>
>> diff --git a/Makefile.objs b/Makefile.objs
>> index ce9c79235e..b29747075f 100644
>> --- a/Makefile.objs
>> +++ b/Makefile.objs
>> @@ -210,6 +210,7 @@ trace-events-subdirs += hw/audio
>>  trace-events-subdirs += hw/block
>>  trace-events-subdirs += hw/block/dataplane
>>  trace-events-subdirs += hw/char
>> +trace-events-subdirs += hw/core
>>  trace-events-subdirs += hw/display
>>  trace-events-subdirs += hw/dma
>>  trace-events-subdirs += hw/hppa
>> diff --git a/include/hw/clock-port.h b/include/hw/clock-port.h
>> new file mode 100644
>> index 0000000000..2ab554c30e
>> --- /dev/null
>> +++ b/include/hw/clock-port.h
>> @@ -0,0 +1,153 @@
>> +#ifndef CLOCK_PORT_H
>> +#define CLOCK_PORT_H
>> +
>> +#include "qom/object.h"
>> +#include "hw/qdev-core.h"
>> +#include "qemu/queue.h"
>> +
>> +#define TYPE_CLOCK_PORT "clock-port"
>> +#define CLOCK_PORT(obj) OBJECT_CHECK(ClockPort, (obj), TYPE_CLOCK_PORT)
>> +#define TYPE_CLOCK_IN "clock-in"
>> +#define CLOCK_IN(obj) OBJECT_CHECK(ClockIn, (obj), TYPE_CLOCK_IN)
>> +#define TYPE_CLOCK_OUT "clock-out"
>> +#define CLOCK_OUT(obj) OBJECT_CHECK(ClockOut, (obj), TYPE_CLOCK_OUT)
>> +
>> +typedef struct ClockState {
>> +    uint64_t frequency; /* frequency of the clock in Hz */
>> +    bool domain_reset; /* flag indicating if clock domain is under reset */
>> +} ClockState;
>> +
>> +typedef void ClockCallback(void *opaque, ClockState *clk);
>> +
>> +typedef struct ClockPort {
>> +    /*< private >*/
>> +    Object parent_obj;
>> +    /*< public >*/
>> +    char *canonical_path; /* clock path shadow */
>> +} ClockPort;
> 
> Having a ClockPort which ClockIn and ClockOut are derived
> from seems a bit heavyweight. When would you want to operate on
> a generic ClockPort rather than either a ClockIn or ClockOut ?
> Why would you want the name (canonical_path) to be different
> at the input and output ends -- is it possible to simplify
> to just having the output end keep the name string ?

Here the canonical path is the full qom's canonical path. It is cached
in the state to avoid recomputing it when needed. It is only used for
log/trace purpose (without it, log is useless and calling
object_get_canonical_path at every log seemed too costly to me).
A connected ClockOut and ClockIn do not have the same (qom) parent,
their canonical path is different.
For example, in the zynq platform, there are 2 uarts, each one having a
 "refclk" input. There is also a clock controller (slcr) having 2
outputs "uart0_ref_clk" and "uart1_ref_clk". We end up with something
like this concerning canonical path:
+ output "[...]/slcr/uart0_ref_clk" drives input "[...]/uart0/refclk"
+ output "[...]/slcr/uart1_ref_clk" drives input "[...]/uart1/refclk"

Right now, I log a line for every end (output and input) when the clock
frequency change, which lead to a kind-of-duplicate log line (names
differ, but clock frequencies are obviously the same). I could only log
at the output end and drop the canonical path for the input or pust the
path in both objects.

Anyway it is easily possible to drop the ClockPort common ancestor. A
user never operates on it.

> 
>> --- /dev/null
>> +++ b/hw/core/trace-events
>> @@ -0,0 +1,6 @@
>> +# See docs/devel/tracing.txt for syntax documentation.
>> +
>> +# hw/core/clock-port.c
>> +clock_connect(const char *clk, const char *driver) "'%s' drived-by '%s'"
> 
> "driven by"
> 
>> +clock_disconnect(const char *clk) "'%s'"
>> +clock_update(const char *clk, uint64_t freq, int reset) "'%s' frequency %" PRIu64 "Hz reset %d"
>> --
>> 2.18.0
>>
> 
> thanks
> -- PMM
> 
