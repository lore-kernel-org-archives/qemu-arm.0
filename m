Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4434689lfg;
        Sun, 23 Feb 2020 15:45:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqyv/QsT5PA30tncoIKZdjMAmGPi6umU6i7WR9KMTbX7/bzlG1H91UVwk/Fu7P8XjRaL1+EG
X-Received: by 2002:a05:620a:130b:: with SMTP id o11mr20708825qkj.444.1582501548050;
        Sun, 23 Feb 2020 15:45:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582501548; cv=none;
        d=google.com; s=arc-20160816;
        b=qUXX885ov310an0i7dPo++4IQ3Yi4XlL4eHtgUE74+28NuNl8WmTDjXinNBSQfGppa
         8y4wAri5QlwORJLt9x1FAeCtXamwvOlxUVdZum+D0JWbVLOlRb0k8IxXGr7K8WDUuLBZ
         tA7whI0vzDmpad8W10vqapsHnCGLuMVkICzHA19AqS1ljeYfLBhbjZKsPz0TELJRw+Mu
         L41YeOMlEPsloGz82tdOIs4WHVglatLowMywK05w2e0dkvIga2/c+/pdCPuQhiHSt5ay
         aE9l2O6kx6mJZFYGtu4peUineQ/dPwvOk+rclrqI5USwObWlTx+T6OlxdtbhDWsnJsLz
         r0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=/rAMJ3kGj3lDsn30R3lXQuL9ztKKnhTKEoy5EuYoFpM=;
        b=JgTjjMc3edeU1VwW935RNDZchoUdgZ6gca42qfKcaVdVTas8FZMHqii+2e+xr1NPpg
         JJpEiqNUciIO0edSkXw+iL4C+5EBRV2GhPjq/QxFMRpZ7gaPbx1qUIdx70K3AmpV7WG1
         /UW+arFLxJ8SraTu8JMcNoCjv7GRbC7X0obDG+/wKFvm6Eya9BWO4q+4D0JL6gMPJtkK
         ag9VNVvXY9A9RZPeHiqUmXrJ0FLvuFNkTu1QexhMf618foGscKZ1M8mszar1VKCG/4sR
         y67tY+P02IbI3Psmes31nly9szi9rDTLTWRulskSxMRHHX2lLuG4X10kIOHiG/s1Ni8L
         S36w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D8LSXQbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si4518517qvo.194.2020.02.23.15.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 15:45:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D8LSXQbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j60wV-0006od-FJ
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 18:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j60wM-0006jy-88
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j60wL-0004dV-7h
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:45:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21534
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j60wL-0004d4-4G
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582501536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rAMJ3kGj3lDsn30R3lXQuL9ztKKnhTKEoy5EuYoFpM=;
 b=D8LSXQbdYQ6j164hXLVbdBSlaNA6/RCjCHkijXVKVHtQrjL/XSzXMmOFNNQbbBkN7xG7ek
 A1lKL92VzEE3VHLsliholeEv+yj2XxKZ8bIjsas5+fqyMGkSV+b6KgpvOsHUY/HEjn3e7D
 ylNOG57TNi78yZ1y+EKPwBu1bpf0kqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-8Ri1HQzVPC6nhtNo6E7qfA-1; Sun, 23 Feb 2020 18:45:33 -0500
X-MC-Unique: 8Ri1HQzVPC6nhtNo6E7qfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A900D107ACC5;
 Sun, 23 Feb 2020 23:45:31 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-48.bne.redhat.com [10.64.54.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E68A90797;
 Sun, 23 Feb 2020 23:45:28 +0000 (UTC)
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
 <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
 <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
 <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
 <fe7f3a60-5d90-ea3c-44d1-119f8b45b15c@redhat.com>
 <CAFEAcA-1UWOfbvhEOhOvozT8RwGoPgRwn2+Lh-UzP3WH8Vw+Kg@mail.gmail.com>
 <1ae86c0b-d4ab-8063-747b-ebea4950e76d@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <ffbb0513-e24c-d41b-d511-a4bd2340d90a@redhat.com>
Date: Mon, 24 Feb 2020 10:45:26 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1ae86c0b-d4ab-8063-747b-ebea4950e76d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZNDRiohnANnJ

On 2/22/20 5:15 AM, Paolo Bonzini wrote:
> On 21/02/20 14:14, Peter Maydell wrote:
>> The initial case reported by Gavin in this thread is
>> "-serial tcp:127.0.0.1:50900" with the other end being a program which
>> listens on TCP port 50900 and then sleeps without accepting any incoming
>> connections, which blocks the serial port output and effectively blocks
>> the guest bootup. If you want to insulate the guest from badly
>> behaved consumers like that (or the related consumer who accepts
>> the connection and then just doesn't read data from it) you probably
>> need to deal with more than just POLLHUP. But I'm not sure how much
>> we should care about these cases as opposed to just telling users
>> not to do that...
> 
> No, I think we don't do anything (on purpose; that is, it was considered
> the lesser evil) for x86 in that case.
> 

Paolo and Peter, thanks for your time on the discussion. So I think the
conclusion is we don't do anything for pl011 either? :)

Actually, the issue was reported by libvirt developer. A VM is started
with serial on tcp socket, which is never accepted on server side. It
practically blocks the VM to boot up. I will tell the libvirt developer
to hack their code to avoid the race if we don't do anything in qemu.

Thanks,
Gavin


