Received: by 10.223.159.82 with SMTP id f18csp608308wrg;
        Thu, 30 Nov 2017 05:05:04 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYNa6K5lBcdY6nADNct9Mvi4DB+72qy7EhuwifYDXmjM1HVR0vOyo5D4PZ1iuiT9CvZmnTX
X-Received: by 10.37.12.6 with SMTP id 6mr685941ybm.156.1512047104588;
        Thu, 30 Nov 2017 05:05:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512047104; cv=none;
        d=google.com; s=arc-20160816;
        b=h8fXnhoLfZOJtrVzewqIGWkyA5S2RoWnopt1d53/UOytMgE0boUsnzIc5XIpcZv2SZ
         9DyJJ5riUi0JFpjLjw/TlrqRJeXvtrd4lLG3FyjNQtsciazS6Gi8izR/WkOBPaA5p4g5
         YhfvyUFxwwbElXkYkpeAQ2SNUjxF8UsBeVNrgD8r2KWPDUU+sZzmjCSwaaFF/7wGHUP5
         KPVQmzKrnLlUm/QRxYk3Mb8Edl7AwawMQ6VwsIbpUEE2DgvAzcnh7mRsl1VZu2/Mk/kB
         Y6a2sHAhRR4FBwUCItWyHeTgKaS7r0uTPdfkMFAbG+ry+4uW8VRqJWJomV0I0F5+JiG6
         Fuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=4RFgui4E6OzZer7tvXqJuYjB5shGF2qpTPkrBL0uxL0=;
        b=jR4e/uNbfHvaEOYa2bo/A7S79G+oWzgLWXsz0EtQamrI9APobL7pnE37X5SaqmgHZF
         QEFr2b5pw0Hq66NgYLwYNQdogO/PZMWwNWcY3JxPfTMw/Y8RJJJc0OKNtwjjRjKkwExJ
         aup5QK12c6A+7gaZNKoqJP7SiuaYTUN639PwBQFYw1bfs5pA3kItqzt3E4lkKTzaEOBt
         Znc9DN3wKi84YnX65kf26EdVSFDevuf83r5TTCz0J2X725ZLPL/wN12v3uun6YNWggi6
         CaMiaPeAYt5W78YXGN9A485sZpdMfNlkRJ4EyNFRT4TBxtYKUldc2IWP9p4hIPcyD+ut
         Y7vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si778005ybi.387.2017.11.30.05.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 05:05:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKOWW-0008GG-2z
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 08:05:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eKOV1-0007FX-Jt
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 08:03:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eKOUt-00008v-VJ
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 08:03:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:13607)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eKOUt-000084-PP; Thu, 30 Nov 2017 08:03:23 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3F4B80478;
	Thu, 30 Nov 2017 13:03:22 +0000 (UTC)
Received: from [10.36.117.126] (ovpn-117-126.ams2.redhat.com [10.36.117.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B09635D6A3;
	Thu, 30 Nov 2017 13:03:18 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
	<1512031988-32490-4-git-send-email-thuth@redhat.com>
	<CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
	<22aa483a-ede3-482d-88a9-ca1c03c37420@redhat.com>
	<34115e36-ab8c-d828-d1a1-3ac7f32ae80b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e55017f1-d9c9-4ae5-40dc-9842b41ebc1b@redhat.com>
Date: Thu, 30 Nov 2017 14:03:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <34115e36-ab8c-d828-d1a1-3ac7f32ae80b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 30 Nov 2017 13:03:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12 3/7]
 tests/boot-serial-test: Add support for the mcf5208evb board
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MqltIz8xo57j

On 30/11/2017 13:51, Thomas Huth wrote:
> The two micrablaze data arrays are completely different, since one is
> big endian, the other is little, so I'd need to byte-swap the whole
> array on the fly, too. Not sure whether it makes sense to add such
> complex code just to safe 16 bytes of blob data...?

*facepalm* :)

>> Likewise, you could have just two copies of the code for all ARM boards
>> that have a pl011 (or any other UART with a simple byte-long transmit
>> register), one 32-bit and one 64-bit.
> 
> OK, having a patching mechanism in place likely makes sense as soon as
> we want to include multiple ARM boards here. I can do that, but I'd
> rather like to do it as a second step. It was already quite hard work to
> come up with all these assembler snippets (from CPUs where I don't have
> a clue of) and to determine which machines could be tested this way at
> all, so I'd first like to wait and see whether this patch series is
> acceptable at all or not, since Peter has objections.

Given your remark on endianness then no, having one snippet per binary
is enough.

Paolo
