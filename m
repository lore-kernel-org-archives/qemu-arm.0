Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1656275wru;
        Thu, 27 Jun 2019 12:42:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbG1aYl7xKYCZmTV/Xbwrok/J4XAkZLMwZW8Xx8+c4E3r99Nl9+CzEqMveWyv8rA3UnEqm
X-Received: by 2002:aa7:dacb:: with SMTP id x11mr6456426eds.299.1561664559451;
        Thu, 27 Jun 2019 12:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561664559; cv=none;
        d=google.com; s=arc-20160816;
        b=QAZrIoCOMaYNAA1rdLo7YHXLRb12KAJwYMZdxPTuIZWHOYTRBwie43QOjYaU0bB/2V
         0Wzg1FY6TjD86nqpuDR08YT95sxuuGpq7cN7UD73a8KCR5hyd5lF1PVf6f5yxj1EkRWS
         YJwSzHv2DKeP9FfzO7HQY9UcIMkppcZvIwS/31uNpEzbtNVejYH5DNgQGcty5q/a7086
         EnQ/ftfkhilfr4yJlxXw2xhHiKtSBdAHbVTGWcWNMkAGPCTyqLVlOxrDILFChmnMPaiM
         G+DuuI/3h94t2N+NHLD9BhUhFz3/ayWO1rgtLkFM8N9q0zKX0aqs5IWNmEVYDAHSFIO3
         TbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=FtdAO2NiCb9jo9th4k3k12diIIqT5y0YdPmgtR9hurc=;
        b=eqgT8c0A1uUcaTau26tN7naIuiLxdTGakv8AgSNNJJqb3r79SbyJT3x/OScglliP6l
         WTNiPMCgyXgWBRFuh1PJEeBxAeXLeOxmhsXq44prACSNcZ2gThxBOrf4hbkFJUF40W8A
         +NNMKsaNYPUBAMErrFpWHehtjzYzrJosr6QpqQVBeGYzegh+NtNIznv6AF3YrCAs557m
         xVRqr8Z3vygTZoWlYy+NtgHupooCypzSBDQawLKgq0Wxr/qfX6qg0CyT03IPDayRtE7k
         YQB4owjCZ1ORGh/uNs7kKLb2lTL0MzHeLfa1hPncwwTKzBiG5B0SWqvJ6VNURmfvCKCq
         KtIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x43si2529339eda.147.2019.06.27.12.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2019 12:42:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hgaI2-0000Ly-JQ
	for alex.bennee@linaro.org; Thu, 27 Jun 2019 15:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wainersm@redhat.com>) id 1hgaHU-0000Lq-5v
 for qemu-arm@nongnu.org; Thu, 27 Jun 2019 15:42:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1hgaHS-0006v7-3P
 for qemu-arm@nongnu.org; Thu, 27 Jun 2019 15:42:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>)
 id 1hgaHR-0006FS-Od; Thu, 27 Jun 2019 15:42:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B13843091782;
 Thu, 27 Jun 2019 19:41:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-99.rdu2.redhat.com
 [10.10.123.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECC5619C4F;
 Thu, 27 Jun 2019 19:41:07 +0000 (UTC)
To: Andrea Bolognani <abologna@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>
References: <20190620222314.2670-1-wainersm@redhat.com>
 <CAFEAcA92m9n7FR2a6=ecnr5bn-Sq97LZRxHRuzWO-OcbdgA4fw@mail.gmail.com>
 <20190621190421.GA679@localhost.localdomain>
 <CAFEAcA-x_GSxiULrxvRj7dtCLM-r4YvRpwkVosW+1SutAUJMoA@mail.gmail.com>
 <7745c47186278c1b7f1781c9173ef0e2e8a55910.camel@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <edd405bc-c2cd-da6f-ed8b-5ec7e6873a0e@redhat.com>
Date: Thu, 27 Jun 2019 16:41:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <7745c47186278c1b7f1781c9173ef0e2e8a55910.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 27 Jun 2019 19:41:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v2 PATCH] hw/arm/virt: makes virt a default
 machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ezxbBdxRDL5q


On 06/24/2019 05:37 AM, Andrea Bolognani wrote:
> On Sat, 2019-06-22 at 16:58 +0100, Peter Maydell wrote:
>> On Fri, 21 Jun 2019 at 20:04, Cleber Rosa <crosa@redhat.com> wrote:
>>> You can consider me biased (I do consider myself), but trying to wear
>>> the hat of a user first interacting with QEMU, I would expect a (any)
>>> reasonably capable environment that can represent the given target.
>>> That will probably be a different environment than the one I may need,
>>> and I think that's fine.
>> I'm really not sure what you're trying to suggest here; maybe
>> you could clarify? If you specify a target (ie a machine type),
>> you get that machine type. If you don't specify a target, then
>> we can't really guess what you were hoping to run and
>> magically pick something that works.
>>
>> The main problem here is that users expect "all the world is a PC"
>> type behaviour, ie they can just provide qemu-system-arm or
>> qemu-system-aarch64 with no command line arguments except
>> a guest kernel (which is half the time something they found under
>> a rock or extracted from some firmware image) or a guest CDROM
>> image and have it boot, because that generally works for x86. It
>> doesn't and can't work for Arm, because of the much greater
>> diversity of machine types and the way that kernels are often
>> only compiled to work on a specific subset of machines.
>> Making the user specify a machine type means they do at least
>> get prompted that the world is more complicated than they
>> think it is and there are decisions that have to be made.
>>
>> In any case even if we did default to "virt" the user still
>> has to specify a CPU type, may well also want to provide
>> a GIC version (gicv3 being better than the default v2),
>> likely more RAM than the very small default, they need to provide
>> all the virtio devices, and so on and so on. So giving
>> them one option they no longer need to specify doesn't
>> really make it any easier IMHO.
> Additional note on GIC: most server-grade machines you can buy today
> do *not* support GICv2, so you will need to opt-in to GICv3 if you
> want your guest to even start.
>
> More generally, as someone who has worked on supporting non-x86
> guests in libvirt for the past few years, I can tell you from
> experience that you're always going to need some arch-specific logic
> to deal with the small (and not so small :) differences in behavior
> between QEMU targets: as Peter correctly says, machine type is just
> a single example among many.
>

So NACK this patch. I will attempt to address the problem of broken 
acceptance tests on avocado_qemu side.

Thanks Peter, Cleber and Andrea for sharing your opinion.

- Wainer
