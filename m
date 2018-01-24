Received: by 10.28.71.27 with SMTP id u27csp1031642wma;
        Wed, 24 Jan 2018 12:07:46 -0800 (PST)
X-Google-Smtp-Source: AH8x227UmD4uTWOlKnBDw9OvKit2o9u6ffCHfGTqI0Pa/kyGIyO4rH2twfgujptlhvzbAwkreDfL
X-Received: by 10.37.20.6 with SMTP id 6mr6438354ybu.449.1516824466299;
        Wed, 24 Jan 2018 12:07:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516824466; cv=none;
        d=google.com; s=arc-20160816;
        b=wphGKsXsaGOgQp7VVbDsdCtaDl8eTkjf8ez5MoTOnAdcr0K4b4l4s96dml6Ci4N5OH
         tccbLuADpCPCB9d+MrxLL4e4N+BOphBql845ZQ0+S3ueNQQuCX3+kletkX4M8KmFVSyC
         vf65t1k3HnAYFw7wCTL7x1+1gk4SRgZNFOqQRSPpZY98AIIpfUVSwsMcwR9aLWs2p62X
         yNs5G9utsojowuIQxBF3j2ttsNQZcnYdCJRHE/gZA+pdErpxhcc+fMTVD5lPp69xm29b
         qqlQ8PjPj06Y57cVl/hHTl+GRqiRk0vhYxKht1I0FVS8vlbJYCgfI3HcpBu7xw+pXE9E
         1+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:arc-authentication-results;
        bh=LggLNy2onAbzRtQW9LKpu/XLPEgP2JRmWIs5KzsmK8o=;
        b=U5voqvYl/EvziCYP6UgtesZtf29A0FpvMfYVbJvFhfi1+K0S9l8Orm/2m23+54feh/
         kz9WveI9Z427OADD1kEdpOFEXzjGrat/sOLcj5kfwgo6DZfTbVtOVzvJAXmtpGIi9iH6
         RdtDGX2QbuMJ5nQLVKJQP5J/6l4R2ewSbnQzDz1G8WyqlqUGFu51K3mpQU8iZgBCBOjn
         H9mieCZl8UEjvKxJ2NrPho+eKPC0tedij8YsBTsWoo+EqHHOWOBPWzbCL1ZP/HQsA+M8
         gT39PCOX9yeL0mlwj5JXrhANthRNvvCFjJB0vkXB+rglpxsRmW/FCQR02Qj5hzORwLKk
         C86A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s138si1766437ybs.644.2018.01.24.12.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 12:07:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeRKj-0001uc-Jj
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 15:07:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1eeRKY-0001s0-Gi
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 15:07:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1eeRKX-0008Qs-8j
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 15:07:34 -0500
Received: from relay4-d.mail.gandi.net ([2001:4b98:c:538::196]:37756)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcd@tribudubois.net>)
	id 1eeRKX-0008PK-1R; Wed, 24 Jan 2018 15:07:33 -0500
Received: from [IPv6:2a01:e34:eebf:9c0:b947:2360:5276:c8f9] (unknown
	[IPv6:2a01:e34:eebf:9c0:b947:2360:5276:c8f9])
	(Authenticated sender: jcd@tribudubois.net)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DDABC1720B2;
	Wed, 24 Jan 2018 21:07:27 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20180113113445.2705-1-jcd@tribudubois.net>
	<CAFEAcA_epX=BOj5sxNVB2z-k3wQ+RRAry=OQi2b=i0d9pJaSeA@mail.gmail.com>
	<CAHQ1cqHXHxSH4LxSu0Jjug5hy1FhMYF-O2FtYbjpnm68VjTDpA@mail.gmail.com>
	<CAFEAcA-XKE=KkOdT62i3VdU=pfQZq7D9KRHNQFjn4Ei_EdpPoQ@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <31001893-5198-edd5-9184-3cd7bd0d5859@tribudubois.net>
Date: Wed, 24 Jan 2018 21:07:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-XKE=KkOdT62i3VdU=pfQZq7D9KRHNQFjn4Ei_EdpPoQ@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------330C24D69A5F915F0EB5203F"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:c:538::196
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] i.MX: Fix FEC/ENET receive
 funtions
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	QEMU Developers <qemu-devel@nongnu.org>, fyleo45@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QQeiLpqrLXt7

This is a multi-part message in MIME format.
--------------330C24D69A5F915F0EB5203F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

My guess is that with this patch, the "flush" feature that was added by 
Andrey in "imx_fec: Change queue flushing heuristics" (commit b2b012a) 
is not really necessary anymore.

But it does not hurt (it might induce a little bit more processing).

JC

Le 22/01/2018 à 15:59, Peter Maydell a écrit :
> On 22 January 2018 at 14:54, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> On Mon, Jan 22, 2018 at 3:48 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 13 January 2018 at 11:34, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>>>> The actual imx_eth_enable_rx() function is buggy.
>>>>
>>>> It updates s->regs[ENET_RDAR] after calling qemu_flush_queued_packets().
>>>>
>>>> qemu_flush_queued_packets() is going to call imx_XXX_receive() which itself
>>>> is going to call imx_eth_enable_rx().
>>>>
>>>> By updating s->regs[ENET_RDAR] after calling qemu_flush_queued_packets()
>>>> we end up updating the register with an outdated value which might
>>>> lead to disabling the receive function in the i.MX FEC/ENET device.
>>>>
>>>> This patch change the place where the register update is done so that the
>>>> register value stays up to date and the receive function can keep
>>>> running.
>>>>
>>>> Reported-by: Fyleo <fyleo45@gmail.com>
>>>> Tested-by: Fyleo  <fyleo45@gmail.com>
>>>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>>>> ---
>>> Andrey, do you have an opinion on this patch, since you've been
>>> looking at i.MX code recently?
>>>
>> The rationale makes sense to me and patch looks like a good cleanup in
>> general, so FWIW:
>>
>> Reviewed-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>
>> I also gave it a spin against my i.MX7 changes with doing basic things
>> like ping and scp of 1GB file, so I can give my:
>>
>> Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Thanks; I've applied the patch to target-arm.next.
>
> -- PMM
>
>


--------------330C24D69A5F915F0EB5203F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">My guess is that with this patch, the
      "flush" feature that was added by Andrey in "imx_fec: Change queue
      flushing heuristics" (commit <span class="float-right"><span
          class="sha-block"><span class="sha user-select-contain">b2b012a)
          </span></span></span>is not really necessary anymore.<br>
      <br>
      But it does not hurt (it might induce a little bit more
      processing).<br>
      <br>
      JC<br>
      <br>
      Le 22/01/2018 à 15:59, Peter Maydell a écrit :<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA-XKE=KkOdT62i3VdU=pfQZq7D9KRHNQFjn4Ei_EdpPoQ@mail.gmail.com">
      <pre wrap="">On 22 January 2018 at 14:54, Andrey Smirnov <a class="moz-txt-link-rfc2396E" href="mailto:andrew.smirnov@gmail.com">&lt;andrew.smirnov@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Mon, Jan 22, 2018 at 3:48 AM, Peter Maydell <a class="moz-txt-link-rfc2396E" href="mailto:peter.maydell@linaro.org">&lt;peter.maydell@linaro.org&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On 13 January 2018 at 11:34, Jean-Christophe Dubois <a class="moz-txt-link-rfc2396E" href="mailto:jcd@tribudubois.net">&lt;jcd@tribudubois.net&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">The actual imx_eth_enable_rx() function is buggy.

It updates s-&gt;regs[ENET_RDAR] after calling qemu_flush_queued_packets().

qemu_flush_queued_packets() is going to call imx_XXX_receive() which itself
is going to call imx_eth_enable_rx().

By updating s-&gt;regs[ENET_RDAR] after calling qemu_flush_queued_packets()
we end up updating the register with an outdated value which might
lead to disabling the receive function in the i.MX FEC/ENET device.

This patch change the place where the register update is done so that the
register value stays up to date and the receive function can keep
running.

Reported-by: Fyleo <a class="moz-txt-link-rfc2396E" href="mailto:fyleo45@gmail.com">&lt;fyleo45@gmail.com&gt;</a>
Tested-by: Fyleo  <a class="moz-txt-link-rfc2396E" href="mailto:fyleo45@gmail.com">&lt;fyleo45@gmail.com&gt;</a>
Signed-off-by: Jean-Christophe Dubois <a class="moz-txt-link-rfc2396E" href="mailto:jcd@tribudubois.net">&lt;jcd@tribudubois.net&gt;</a>
---
</pre>
          </blockquote>
          <pre wrap="">
Andrey, do you have an opinion on this patch, since you've been
looking at i.MX code recently?

</pre>
        </blockquote>
        <pre wrap="">
The rationale makes sense to me and patch looks like a good cleanup in
general, so FWIW:

Reviewed-by: Andrey Smirnov <a class="moz-txt-link-rfc2396E" href="mailto:andrew.smirnov@gmail.com">&lt;andrew.smirnov@gmail.com&gt;</a>

I also gave it a spin against my i.MX7 changes with doing basic things
like ping and scp of 1GB file, so I can give my:

Tested-by: Andrey Smirnov <a class="moz-txt-link-rfc2396E" href="mailto:andrew.smirnov@gmail.com">&lt;andrew.smirnov@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">
Thanks; I've applied the patch to target-arm.next.

-- PMM


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------330C24D69A5F915F0EB5203F--
