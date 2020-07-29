Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1678660lfy;
        Wed, 29 Jul 2020 08:15:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3K9YyYsGbmObQ+ggYrZqcX+iRzgG5tGIEoNu/lfC7KxfvC9oP2XpTi8SmRgvdjJchVqjH
X-Received: by 2002:a25:c743:: with SMTP id w64mr33821467ybe.127.1596035751087;
        Wed, 29 Jul 2020 08:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596035751; cv=none;
        d=google.com; s=arc-20160816;
        b=iFD9t8VlrnzD4aa81nRk+s9J0u4jWAdG7fEgx5iLUzdDk+L8vvE677SRKjP50rbc/v
         MBzH4eKXqAY1xorIaQACbJX7fJKvjhEoqhs8MXr6kZp5x9bajpfxnZ6NoGH1QnnW9J8Z
         ZX+cJlGNhU4+UpDdIviF+NT2+1mjQdvffYRRnSI+dzcscPZRNWuCg70wadwOr05cDOxN
         appCll1LpY0mMArcqgD0DEwC688a4QllnBRSFkjL6gKMZKb3oGrPdoZQQr/RpP+zRvUG
         Uekw2g+USwQcwQhaX1xCKo57z7REM3bJF9Dyiu28wvkBLr7dnZn0NmAGG7OEQlRK5EGy
         viwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+cObEl5n0/2g844yRZNcgZa4XMMwSNhBNYUy044bT50=;
        b=JOf5sWQJhUnqoQX1GftwA7yOrPjQ9hWLF6pwQALcOJeq5YV+36tZrIwI7uOnc2Xda0
         l99tPGtnBRJ+Q+D3GgEuDQH/+x0Fwnbwtm/TSYmhP9zq+dTavwvpPvG760bU5KkdkfLr
         twmcgjAuYgF0uYaWmCKohVyU6rbYtyicHsK34M+qY7gR6xwbQwoVLRbYZL+xbLNn3doG
         vcymvwMO0JYpUfigL2o+BMNVh4bDegIcIfmF2YLFI9EXRkaxqkYonCe8BuG7qSaCRpxN
         rkjs/+xCDnqRPX9Zs4KEjDxRVkgVQwE2J43EjyZu2BEVNSJ8S8Bfu8UAfp6aVWW1Jxhi
         W9Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f82si2331773ybf.177.2020.07.29.08.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 08:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0no6-0003sj-EQ
	for alex.bennee@linaro.org; Wed, 29 Jul 2020 11:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1k0nnn-0003qR-EA
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 11:15:31 -0400
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:45581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1k0nnl-0001pQ-6C
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 11:15:31 -0400
Received: from player762.ha.ovh.net (unknown [10.108.35.223])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 0E18198C6A
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2020 17:15:18 +0200 (CEST)
Received: from kaod.org (bad36-1-78-202-132-1.fbx.proxad.net [78.202.132.1])
 (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id A3CED14CDD546;
 Wed, 29 Jul 2020 15:15:09 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0047b7a6a19-3090-437b-9bb5-a0acfd90bf0b,565E08D03F5381EE4F4017DF562F253825237DEE)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] hw/net/ftgmac100: Fix integer overflow in
 ftgmac100_do_tx()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200710085417.638904-1-mcascell@redhat.com>
 <CAFEAcA-pRXOz5JVcwHa8=oaeogwaOK0YVXYQiJUpdM_rFZ+QTA@mail.gmail.com>
 <d7affe2b-0a2c-4e06-a874-daccf16bd136@kaod.org>
 <CAFEAcA9=_RC0w-EgjdPw=UWXZ-ufHjkeDWTMj_jXfSQL8G9GHA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <77ff42a9-a5a4-dea7-0b9a-c699c35b32f9@kaod.org>
Date: Wed, 29 Jul 2020 17:15:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=_RC0w-EgjdPw=UWXZ-ufHjkeDWTMj_jXfSQL8G9GHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10557844905496578972
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrieeggdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdejkedrvddtvddrudefvddrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.50.107; envelope-from=clg@kaod.org;
 helo=6.mo69.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 11:15:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, ziming zhang <ezrakiez@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rsdSPICswxpE

Sorry for the late answer.

On 7/13/20 6:15 PM, Peter Maydell wrote:
> On Mon, 13 Jul 2020 at 15:19, Cédric Le Goater <clg@kaod.org> wrote:
>> On 7/10/20 1:33 PM, Peter Maydell wrote:
>>> Andrew, Cedric: do you have the datasheet for this device? Do you
>>> know if we should also be flagging the error back to the
>>> guest somehow?
>>
>> zero is the only invalid size of a transmit buffer and the specs does
>> not have any special information on which bit to raise in that case.
> 
> I found a datasheet which might or might not be the equivalent
> bit of hardware -- does your datasheet have a note on the
> TXBUF_SIZE field of a tx descriptor that says "When the size is 0,
> the descriptor would be discarded" ? (Though I found another
> random doc that just says it's illegal...)

I only have : 

  TXBUF SIZE: Transmit buffer size in byte
  The transmit buffer size can not be zero.

>> I think FTGMAC100_INT_NO_NPTXBUF (transmit buffer unavailable) is our
>> best option and we should add an extra 'len == 0' test in front of
>> the dma_memory_read() call to raise it. A zero length is not considered
>> bogus by dma_memory_read() it seems.
> 
> My best guess at "what the hardware does" here would be:
>  * TXBUF_SIZE in a tx descriptor can be anything: the h/w
>    would happily allow you to assemble a tx packet with a
>    whole series of 1-byte sized buffers, each with its own
>    tx descriptor

yes. 

>  * zero-byte tx descriptors might just be marked "done" and
>    skipped over since they have no actual data

yes.

>  * any checking on max/min lengths would be done
>    only on the accumulated total-packet length (we do this
>    this way already for the frame-too-big check)

yes.

>  * I suspect "transmit buffer unavailable" means "the ethernet
>    controller needs more data but the next tx descriptor
>    is still marked as owned by the guest" -- this is certainly
>    what we currently do with it, and that doesn't seem like
>    the best thing to signal for the "tx packet too small"
>    case. It's possible that the hardware simply sends out a
>    runt packet of some form if the software tells it to do
>    that. My vote would be for handling it with XPKT_LOST,
>    the same way we do for over-large frames. 

XPKT_LOST means that packets are lost due to late/excessive 
collision. I have used this status for large frames because
not other bits made sense.

>    This probably
>    is not what the hardware does but at least it's a
>    coherent thing that the guest might be expecting to have
>    happen for a tx attempt and it matches the fact that we
>    really are not going to put it on the 'wire'.

I agree.

> 
> Side note: I suspect that any failures from
> dma_memory_read() and dma_memory_write() should be
> reported as AHB_ERR (currently we have a mix of
> ignoring them or using NO_NPTXBUF).

AHB_ERR is not used in the Aspeed implementation. I checked with 
them. But I think it makes sense for other implementations, so we
can add this status for Linux.

NO_NPTXBUF means a lack a transmit descriptors.


XPKT_LOST is our best choice then.

Thanks,

C. 

> (It would in theory be possible to test some of these edge
> cases on real hardware, but that kind of bare-metal test
> case is usually a pain to put together and way overkill
> for this situation, so I don't think we should bother.)
> 
>> Is address zero considered bogus ?
>> If not, we need to check that also.
> 
> Writes to address 0 are fine, it is not a special physical address.
> 
> thanks
> -- PMM
> 

