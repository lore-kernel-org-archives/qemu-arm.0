Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1775128wru;
        Thu, 2 Aug 2018 02:43:07 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdjJ+BRAWcthqWg2YlRYJi/r8c47+g1q3CHkDU0hN+16i1/dESBTCmHFvvzmenmaW/Mm5XS
X-Received: by 2002:a0c:c30f:: with SMTP id f15-v6mr1747680qvi.104.1533202987103;
        Thu, 02 Aug 2018 02:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533202987; cv=none;
        d=google.com; s=arc-20160816;
        b=acGu29ylv7LLEQnbmcMCNqg1SP0BlbLzvFV3cBbVGlPIi3hQWt15YOgM3Pnfzr7Q3N
         OqJGXfCpzNEeB2Cd4Ya5M7XbjyBuw+KsLZWFMSjjEN2whjlSDEgkCChyC5Xut+WT/dbJ
         +M2Wm+qXB/qSaSIZKijUp8H9ACjW97yhCHhYK9r3YYV/28yzSBdHP6jcpTRoAbchFxl8
         UmNpHcAJtV6cSGNVy8L5L5Cdhq90pF0pQP3LEaGE/oWyHL6RhuPJZh0SbKqOjvb9v213
         X68CSNBNfNmrzseisVoaDV/Co/uQpPw/36pyeFvZrZYH6fHK+mLcqJLI2HGsJQPyo5wJ
         f5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:dkim-signature
         :arc-authentication-results;
        bh=1ieZCkQDymp7Bs53xEDlTTcjdqlK0nW6vTljzNh9cCg=;
        b=Gg7VQMxNc7+x7puDtMqaub39aGRrw1TqBrshlbNhiItoFY7EQzI+0TnNyFZ3hdMiwh
         oWBt7db91JfjioOLcCzRBbVIfOfrOWl5d3mOOHRgiL/1EiuvNJIbMiCqDJqFts5YDyFv
         RSfre9Jis7UoNVJPeaNBbTNvjzyebG/4HbtjPgf6JytALF5Hl423GPZc63mnLOrCk2oq
         5Q17l/Q+awV+gbIrcyfr81S58B7VF9rOyBGn+BIV4Oe+1zTtHbeCCBN/9UvzSGEmWQp8
         U/RIgH0hDd2tjw3X5Kalm1g/Or9sVd8+FwQEu9Kq8EV4VOs9n6I0uTGVpbDvaw0DQ+TA
         Q0iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=NFCCDNEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9-v6si1415915qve.114.2018.08.02.02.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 02:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=NFCCDNEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flA8Q-0003O0-Js
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 05:43:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1flA8G-0003Nf-6z
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 05:42:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1flA8D-0005rm-3M
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 05:42:56 -0400
Received: from smtp55.i.mail.ru ([217.69.128.35]:48988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jusual@mail.ru>)
	id 1flA8C-0005oO-MA; Thu, 02 Aug 2018 05:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=1ieZCkQDymp7Bs53xEDlTTcjdqlK0nW6vTljzNh9cCg=; 
	b=NFCCDNEonOkXNrxAtwtf7+983EWeQZ6iAazy9TCnXvzRtqOFv8JHKwZY37s989Tx3Xya3uu4KgM1ct3uy2lNkbnOgHqGNB2is0m3qthLwY/WtoEq4cAlAcY9meg1jsjw9Wyyia9PU7QnNbWhpie4y28UhEw86ia9+yl2JyA+IRI=;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from <jusual@mail.ru>)
	id 1flA89-0003Nb-6F; Thu, 02 Aug 2018 12:42:49 +0300
To: Joel Stanley <joel@jms.id.au>
References: <20180726023645.13927-1-joel@jms.id.au>
	<20180726023645.13927-3-joel@jms.id.au>
	<94bc2d11-7916-bc4e-02d8-da62e3ed303b@mail.ru>
	<CACPK8XfYvU8+0s+FBGe7NuAst38ska0vpS8HVPWkM8OHyLFpdQ@mail.gmail.com>
Message-ID: <c2432d29-fb24-924a-4df2-2abf5d52afca@mail.ru>
Date: Thu, 2 Aug 2018 12:42:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XfYvU8+0s+FBGe7NuAst38ska0vpS8HVPWkM8OHyLFpdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp55.i.mail.ru; auth=pass smtp.auth=jusual@mail.ru
	smtp.mailfrom=jusual@mail.ru
X-7FA49CB5: 0D63561A33F958A547B47B8A81E29DC5EDF45C8B446C80E06BCAA2D71CBE50CB8941B15DA834481F8AA50765F7900637F6B57BC7E6449061A352F6E88A58FB866BA297DBC24807EA76E601842F6C81A127C277FBC8AE2E8B120C23C05AEC2B18EC76A7562686271E6BA297DBC24807EA089D37D7C0E48F6C8AA50765F79006376A93A8BE4E05AFD790A7522DCFA1831E089D37D7C0E48F6C5571747095F342E857739F23D657EF2B6825BDBE14D8E702AA1DF4CB901976EF00306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: 3BB5BBD942886723B9619626ED59B40DE45021AEF9636915F5E6AE83803A2CCECAE43C95141D0C847C4160E8B47E48163DDE9B364B0DF2898CB68AF7A628805D594FB4C9F0DBF412AE208404248635DF
X-Mras: OK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 217.69.128.35
Subject: Re: [Qemu-arm] [PATCH v3 2/3] arm: Add Nordic Semiconductor nRF51
 SoC
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
From: Julia Suvorova via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Julia Suvorova <jusual@mail.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VcDcsGbTToXf

On 30.07.2018 17:02, Joel Stanley wrote:
> On 26 July 2018 at 20:31, Julia Suvorova <jusual@mail.ru> wrote:
> 
>>> +++ b/hw/arm/nrf51_soc.c
> 
>>> +static void nrf51_soc_init(Object *obj)
>>> +{
>>> +    NRF51State *s = NRF51_SOC(obj);
>>> +
>>> +    memory_region_init(&s->container, obj, "nrf51-container",
>>> UINT64_MAX);
>>> +
>>> +    object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARM_M_PROFILE);
>>> +    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu),
>>> &error_abort);
>>> +    qdev_set_parent_bus(DEVICE(&s->cpu), sysbus_get_default());
>>> +    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type",
>>> ARM_CPU_TYPE_NAME("cortex-m0"));
>>> +    qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 96);
>>
>>
>> Where did this number come from? ARMv6-M NVIC supports only 32 interrupts.
> 
> I think this was left over from when I was first creating a m0 based
> system (efm32hg) over a year ago. Good catch.
> 
> I couldn't see a table of valid interrupts in the nrf51 datasheet. Are
> you able to find this information?
> 
> If not, I will re-spin with the number of irqs set to 32.

The only information in the nRF51 Reference Manual is given in
paragraph 10.1.6:
A peripheral only occupies one interrupt, and the interrupt number
follows the peripheral ID, for example, the peripheral with ID=4 is
connected to interrupt number 4 in the Nested Vector Interrupt
Controller (NVIC).

Thus, Table 2 in 5.2 can be used as an interrupt table.

In any case, unextended ARMv6-M limits the number of interrupts to 32.
And efm32hg is based on M0+ and can have additional features.

Best regards, Julia Suvorova.
