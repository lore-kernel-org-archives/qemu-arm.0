Received: by 10.223.197.9 with SMTP id q9csp2536791wrf;
        Mon, 9 Oct 2017 07:58:12 -0700 (PDT)
X-Received: by 10.200.33.242 with SMTP id 47mr13865349qtz.301.1507561092839;
        Mon, 09 Oct 2017 07:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507561092; cv=none;
        d=google.com; s=arc-20160816;
        b=iO4t9P7va3x1lbdoVZgDRDyzh/SGo7V0iPx6kBE220QR7QOAAehmJE8PrGhwk5zYk6
         f8t64508KhBHrKFiT5bHjUhe5rAHuhfwWo0eq1gFKFLFT4cIzv25Rkg5nMdlS3xWyl6m
         s2PJwO1Gwz2Vlt/8gDTqONA7yPv9LSZZ7gfk1HrMjK1d41qqyq94xnwxdF1bgIu/zPly
         LoNkXw24WgzpGwLjdDc5zmyLVjSvBH46azQr803NJJUiKoofhl7LWmiOuSvV+ohdtJ2B
         hm2dDqbtT8hj+08CZRfk9VVBkpFWeofNMpN/bRQ5qLmtIHCGMKpYRHfswm5AdARRwRzX
         OBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=a8dfeBG/4zvqhLB9+TyBlnFb/SkWDg2e/jL55LF85nU=;
        b=wW/YWOH42j38rrYbakuaNG0BODCzbslJktsqqt5PJ7SiFB0QneIdnyAYXvPERXxrg5
         3QTiwk6wRenhZgk/5Dc/Mxg2VYA5LWI/0GL7gr6KycQojOaxiZU006ngh7t1uk77lc0t
         Ci39e0UkZPPUwiJuQv2E/a9rsm9fvxPrV3fF9XiFbRMLU/uSJLgvnGeAkYbVcF7H46+C
         kFROL/nSUW1MHIVBb5MAsl/9dKPet7qfnW1pZMgYJ0fyi7sXDR6FFLNLLsRsJm114Ae9
         zPt4KOLnA6ClY+S/eDQDaZL/VTHnf9vAknK0FKMBmnGSHaorpxs/Jsz9ZfVkmd2lVpsP
         QwNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XMeqPN7P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si6592403qtw.526.2017.10.09.07.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 07:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XMeqPN7P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ZVU-0003ZF-CW
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 10:58:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1ZVI-0003Xv-Es
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:58:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1ZVH-0002rz-BZ
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:58:00 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e1ZVH-0002rj-6Q; Mon, 09 Oct 2017 10:57:59 -0400
Received: by mail-qk0-x242.google.com with SMTP id o187so3530240qke.1;
	Mon, 09 Oct 2017 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a8dfeBG/4zvqhLB9+TyBlnFb/SkWDg2e/jL55LF85nU=;
	b=XMeqPN7PSzLPmB3dnM4zd08sdZK9vFF9PNv6Ll7Uygs61z1Hgu4irdLa2mJmyD0r03
	jdy/uUqk23gKzONgQffkkJzOWhACu1sTbAyiDTiRYtoGOvlW20p9+oidQVMk6qfw0D/n
	gd7Qh9JPQkCIwNEtPJ3W4vAY6+1+ni3pqD7h+G7ODsCws8svd/Zla0fPE5NPJ1w7qiRD
	MuiChL2eFU3mNAyQGMrFldGH/DFP1hmMKN21Gy0DgxzkeWrW09sU27TWWfvl5jD09CjK
	HNBhGOqGyx/RKDbSYKuezAU4F8Pf3l+WsZYI8vQ8a0q2zLWgU9KTw8kzhhvpGOz97FYp
	DV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a8dfeBG/4zvqhLB9+TyBlnFb/SkWDg2e/jL55LF85nU=;
	b=Tin2T2N/BGqhf0cQwFFr/8+rrtcmgnDS7Sof8KF0eD0UHegCwNo2PCHXnQBIuu+mmf
	qJQkSVlYhTjfK2QqSYCEE6PTpUIwmrDmHAqagXxMQE6Ig1YTj0LsSSPe8M93c91//DVZ
	ViEXn4yvDE2c+362mIDyykXfjRgiCcQZc9tPHuWULu45NdFnw7e8/mbqL/R1vxHBm7mx
	waNgW7JlSgmx4MU/FcAvNtbDLs/LI/nOzFc1NObGoXVPT/Kqp3Dj4+pSduMwE+4z5hhO
	AHvWDAwg/vFsTO+ZJ5w0ddN6TjUt5pWYAUPUT5TSMMvaCsQxu+VqcJeSuR/v2XxCeOKn
	VPbA==
X-Gm-Message-State: AMCzsaWIGXKhTfZgz0RcBwhZm6h0sAoPiQh4pfL4RzuxlUha8/OIDD98
	nXBi5aF8tEXN2O5K3EXl+ELG4qH4KiJ4Yrgd+AI=
X-Google-Smtp-Source: AOwi7QC3Y5k0VO8EkfRjLvO+JaZDQrgao2KCcivFEWtmzWsRACXSftvNFp3axMdYHwg6n0tfdUlCk3yoGZRJazZO/lE=
X-Received: by 10.55.10.18 with SMTP id 18mr8832367qkk.184.1507561078363; Mon,
	09 Oct 2017 07:57:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.165 with HTTP; Mon, 9 Oct 2017 07:57:57 -0700 (PDT)
In-Reply-To: <CAFEAcA-_E2aV78AnODfAvjObYpHdWXwxBxJLHDR9qS8yR9YM3g@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-5-andrew.smirnov@gmail.com>
	<CAFEAcA-_E2aV78AnODfAvjObYpHdWXwxBxJLHDR9qS8yR9YM3g@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Oct 2017 07:57:57 -0700
Message-ID: <CAHQ1cqGnxnMLezakUt6ZhZemW9BTe43bZ2a2O8Mf9b9YNQis8w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH 04/17] imx_fec: Change queue flushing
 heuristics
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: btq46J/RAm8k

On Fri, Oct 6, 2017 at 6:56 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> In current implementation, packet queue flushing logic seem to suffer
>> from a deadlock like scenario if a packet is received by the interface
>> before before Rx ring is initialized by Guest's driver. Consider the
>> following sequence of events:
>>
>>         1. A QEMU instance is started against a TAP device on Linux
>>            host, running Linux guest, e. g., something to the effect
>>            of:
>>
>>            qemu-system-arm \
>>               -net nic,model=imx.fec,netdev=lan0 \
>>               netdev tap,id=lan0,ifname=tap0,script=no,downscript=no \
>>               ... rest of the arguments ...
>>
>>         2. Once QEMU starts, but before guest reaches the point where
>>            FEC deriver is done initializing the HW, Guest, via TAP
>>            interface, receives a number of multicast MDNS packets from
>>            Host (not necessarily true for every OS, but it happens at
>>            least on Fedora 25)
>>
>>         3. Recieving a packet in such a state results in
>>            imx_eth_can_receive() returning '0', which in turn causes
>>            tap_send() to disable corresponding event (tap.c:203)
>>
>>         4. Once Guest's driver reaches the point where it is ready to
>>            recieve packets it prepares Rx ring descriptors and writes
>>            ENET_RDAR_RDAR to ENET_RDAR register to indicate to HW that
>>            more descriptors are ready. And at this points emulation
>>            layer does this:
>>
>>                  s->regs[index] = ENET_RDAR_RDAR;
>>                  imx_eth_enable_rx(s);
>>
>>            which, combined with:
>>
>>                   if (!s->regs[ENET_RDAR]) {
>>                      qemu_flush_queued_packets(qemu_get_queue(s->nic));
>>                   }
>>
>>            results in Rx queue never being flushed and corresponding
>>            I/O event beign disabled.
>>
>> Change the code to remember the fact that can_receive callback was
>> called before Rx ring was ready and use it to make a decision if
>> receive queue needs to be flushed.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/net/imx_fec.c         | 6 ++++--
>>  include/hw/net/imx_fec.h | 1 +
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index 84085afe09..767402909d 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -544,8 +544,9 @@ static void imx_eth_enable_rx(IMXFECState *s)
>>
>>      if (rx_ring_full) {
>>          FEC_PRINTF("RX buffer full\n");
>> -    } else if (!s->regs[ENET_RDAR]) {
>> +    } else if (s->needs_flush) {
>>          qemu_flush_queued_packets(qemu_get_queue(s->nic));
>> +        s->needs_flush = false;
>>      }
>>
>>      s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
>> @@ -930,7 +931,8 @@ static int imx_eth_can_receive(NetClientState *nc)
>>
>>      FEC_PRINTF("\n");
>>
>> -    return s->regs[ENET_RDAR] ? 1 : 0;
>> +    s->needs_flush = !s->regs[ENET_RDAR];
>> +    return !!s->regs[ENET_RDAR];
>>  }
>>
>>  static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
>> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
>> index 62ad473b05..4bc8f03ec2 100644
>> --- a/include/hw/net/imx_fec.h
>> +++ b/include/hw/net/imx_fec.h
>> @@ -252,6 +252,7 @@ typedef struct IMXFECState {
>>      uint32_t phy_int_mask;
>>
>>      bool is_fec;
>> +    bool needs_flush;
>>  } IMXFECState;
>
> This looks odd -- I don't think you should need extra
> state here. Conceptually what you want is:
>
>  * in the can_receive callback, test some function of
> various bits of device state to decide whether you can
> take data
>  * in the rest of the device, whenever the device state
> changes such that you were previously not able to take
> data but now you can, call qemu_flush_queued_packets().
>
> You shouldn't need any extra state to do this, you just
> need to fix the bug where you have a code path that
> flips ENET_RDAR from 0 to 1 without calling flush
> (you might for instance have a helper function for
> "set ENET_RDAR" that encapsulates setting the state
> and arranging that flush is called).
>

I don't know if you've seen my response to Jason Wang, but I think he
was proposing something similar, and, as I said, that should work fine
and the only reason I didn't do it that way was to avoid doing a flush
every time that host driver drains full RX-ring and gives it back to
the IP block.

I'll give this a try in v2.

Thanks,
Andrey Smirnov
