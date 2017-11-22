Received: by 10.223.159.82 with SMTP id f18csp615789wrg;
        Wed, 22 Nov 2017 12:23:48 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbnE+RwhYdzuwPWe1PE2ijBwKAfMYFkskWwttMsT1+bWK9oGybljzx1WW95bQO/pSqUOBza
X-Received: by 10.37.56.84 with SMTP id f81mr13372330yba.207.1511382228362;
        Wed, 22 Nov 2017 12:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511382228; cv=none;
        d=google.com; s=arc-20160816;
        b=UZkOHAbsOyRwkNzXkHsTzcay7+NDZKURU2Z8bK8xRsSfamcaCrhXc0hNFO4Xwsl9+h
         laDIVXOzXV0SsJ5E2286l+2uOV5P8B2a8Y0MCiqPZEtrDiACHar9NA4FgLlgwgAZXbcp
         1LW5uLHGFPPh9fV/+aUuj2J2bA3qC/XGi+gLQQmI2UYs5KB7w86QTd3zfx7HTpmE0OvG
         krjRpQ5yj9sp1GMOTEvQ32uruvRTRzZ/Efh7oax/3iJaPQFNKY4ULuGDLNcPDbhAqd2d
         WXlyRJo3FTi7GJgRE9TAezE39dUL4k2WgVCzru6pp1BaDNZTVR8hL6BGSeDNBM5k4hAt
         sxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=o3gWz7jTki3Flcl2rg6cq3TjcUT40L9Kl1mQ68KxVQQ=;
        b=mDH+WKViOoOatz8qI43c70Jbvhpa/V7aJzLhDYD3915bvxSPrh2GmvxvmK9PfbPmuA
         pa2KxLHiC1r+LVH9v/caKVtrLp5jRCzzCyV19EuFX7Z2R2GbtDUWcHyCsGBVMS9AMNmO
         JafO1voFWrmFSo7dWbXgIs/CxCc8qYVdGj2cD9PFJQmM4Rah3fCenhjdSTdKu60+sfne
         HVRhnsSwI9++LygqoI4XtlXbhpa1n9APJE8zzuV0EZObXILEOL31I9HwifoA5chsOojC
         1QcpxKyInWgpIm4PKPhEI/19gVnHASbbV9MXy91+FGWRq6l2Nh/AINHfk1y3o5x6p/E9
         B7Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NLJBl8QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z84si3746190ywa.176.2017.11.22.12.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 12:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NLJBl8QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHbYh-0001rZ-RV
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 15:23:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbXe-0001HP-HZ
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:22:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbXd-0005eM-EF
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:22:42 -0500
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:35546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHbXd-0005e1-9O; Wed, 22 Nov 2017 15:22:41 -0500
Received: by mail-qk0-x22f.google.com with SMTP id p19so18403482qke.2;
	Wed, 22 Nov 2017 12:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=o3gWz7jTki3Flcl2rg6cq3TjcUT40L9Kl1mQ68KxVQQ=;
	b=NLJBl8QJOp4qx+I3q7woKthkd+tHW6pzMY1hQIBcwtwWna5aIvFqTzmoYTPtTiodpp
	MS4dBV9mEKgIrUrFnmfE8xBXQXmHnHkrnIAsp4jdetbsrIecqMYBdbnXePgqJYDTe+S7
	GE3CaCg+fpeYNZmsFSN7B+2xxAX0l3f+e0t5xe/WY/xINTc240mO+0BnCSyDDl7AWq9r
	7jrjaqlKkWixj6glJa3XUMPkgqJTQ/ewSPi+6rgHvppduCGT8bBxNOHLYrxdRzNCJ0Wl
	f1LXXeqd+eVP2ES/XkGFUhmCZ01r1oKQr59dfn6Mhu/ekUXG7Zh0bn+gE71z7oyQd2qc
	A/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=o3gWz7jTki3Flcl2rg6cq3TjcUT40L9Kl1mQ68KxVQQ=;
	b=nB/td/Za8WQXBDhu8Au4JXXNfg3tLgLBEkZJbGiGsLB8aNzQPh7FQLHSmMcAXhW1hL
	NHsaZdoA32f5k+lbFkw6hsSWQxmZPtlIqtbJlRomi/AtTrlZDvs0eOr/sURtF6Top6De
	GSb0JVyueLcTMCMY13m3HwRrh8yUlCaxgmGrAVSjawt4SjFNYt7Gi630vFZEHuqfU/jD
	M4f0EsiUxN2rjkj84FA1Vd/tHvsTtnLG7JVlmNF7Tffnp1EW+fa1ELEqSMntAIVBiOXY
	txoG9i9sROD8eannPW12LcW0WnK2P/m6pIMqzLBUIKurowgOSU8xuHY5vFbV95z8MO4A
	f+yA==
X-Gm-Message-State: AJaThX5MmeEKGUTCGZFtT79ds1JbmG+++8w+yu33CNiJyQDJsc1yOafb
	q46XMRNVr/W7GlEeH9OFDnrW2B1oHxobBw3hYjF5kw==
X-Received: by 10.55.97.135 with SMTP id v129mr20219755qkb.305.1511382160668; 
	Wed, 22 Nov 2017 12:22:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 12:22:40 -0800 (PST)
In-Reply-To: <CAFEAcA_+9fz4zzWg6najN0pn6-=jRMzz2zbHneZxca=SYyxDKA@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-4-andrew.smirnov@gmail.com>
	<CAFEAcA_+9fz4zzWg6najN0pn6-=jRMzz2zbHneZxca=SYyxDKA@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 12:22:40 -0800
Message-ID: <CAHQ1cqFGr9YMeXPHyueKVpRQp8ugvF7+gnwSZRk=rBY20UYV7A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: Re: [Qemu-arm] [PATCH v3 03/30] imx_fec: Change queue flushing
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o0h6Y5hsrkZh

On Tue, Nov 21, 2017 at 9:27 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
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
>>               -net nic,model=3Dimx.fec,netdev=3Dlan0 \
>>               netdev tap,id=3Dlan0,ifname=3Dtap0,script=3Dno,downscript=
=3Dno \
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
>>                  s->regs[index] =3D ENET_RDAR_RDAR;
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
>> To prevent the problem, change the code to always flush packet queue
>> when ENET_RDAR transitions 0 -> ENET_RDAR_RDAR.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
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
> This field isn't needed any more in this version of the patch, I think?
>

Yeah, my bad, forgot to remove this part. Will do in v4.

Thanks,
Andrey Smirnov
