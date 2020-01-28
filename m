Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp326090lfp;
        Tue, 28 Jan 2020 03:01:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqyezPPqgzh//u7Z54mxwRUNAKmkhIF5LoGA53ufpeciAebDXdCQ/y6lKQdqXLhU2jUQXTvt
X-Received: by 2002:a05:6214:13a8:: with SMTP id h8mr21016582qvz.41.1580209264171;
        Tue, 28 Jan 2020 03:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580209264; cv=none;
        d=google.com; s=arc-20160816;
        b=lk9w/uqR9zotFCkGtaov5bg4BOpYWP9tiod5KeipZUS+Y29DtGG0TwlaV7w0+p0jOp
         Od6QHHxPJuK2SB6wSxfHwZhLMhAv2txlTl+XZG3HMfxlrSBtokNr6tCw2Fe3J6BcOQAC
         CNRmG1xWhYlTXS4g7KBTGNH8r5zRRkSdtTTrx4fiq69sIXxuekQh5oAMlXvEHUxKzpPu
         OodzIvxYtSlS2TdbzvTPTX5i5cFU2QejrEEVaul8W2np+FcmhQ1wGfmdjNA/jkYiP4VN
         6iJZQoKJ8hr9hteduHyW5s96/L5zUa9ViLxQ7HMit8lfnm8k3SCkaIPmW1kdW4yezdF0
         8uLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9dSYi4dvn0AY+/YeHWr7iYWeBW00lmhzZ7LvW95TaqA=;
        b=DoFQqRy0BfUGIkiKlYT+puG381aACiglobYxPJm6x9UlP3rWtNwzXKeSOCpn18u769
         m5F/If6ZsGAd9D9eBk7Wm0rujGzMID0NwidDmYz1G23VkNjJ3awkfGQoJ1yCWS9FCE5+
         M0m4L7BYFsg8opxW9MZZEnCX5sgi6QZKFGxAMQT+rFpKIDHaA8vjBEThRKlIZo1MKLNc
         OggM7QrZBwM7VCGYrua8Xw/I7CfVM+G9v77nSoJsdr/Ao7wxrBZLOl7097r/4lVRkz2Z
         wj3P7K1FQ1k5wwALN61L+q/nLJd714uHXzvCC6HvdfugK+taGCeQa84ForHCglnAsWQ8
         uqqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L3wxap78;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si6576712qkg.349.2020.01.28.03.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 03:01:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L3wxap78;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwOcB-0006pw-Hi
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 06:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iwOad-0005C1-I9
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:59:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iwOac-0000ya-LR
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:59:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58994
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iwOac-0000y1-Hv
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580209166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dSYi4dvn0AY+/YeHWr7iYWeBW00lmhzZ7LvW95TaqA=;
 b=L3wxap78vDfsk70tnJvbSRL0BUILKA/t99laARV0seKnpFk9G8LyEsB1SXeF+zS6cJT7Vx
 4JBLIfknpRGOFxTLHs6K5i86TT0kXq6xsVG5amOX6UVsr9AFRhu4wERoPMfkZrm9BTIVnb
 ivSPJneYNKNztnJMiOFYtVaUIxorE1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-tq_6zD0ZP6yVktb4oXzkmA-1; Tue, 28 Jan 2020 05:59:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A612100550E;
 Tue, 28 Jan 2020 10:59:20 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C96578887E;
 Tue, 28 Jan 2020 10:59:17 +0000 (UTC)
Subject: Re: [question] hw/arm/virt: about the default gic-version in
 accelerated mode
To: Peter Maydell <peter.maydell@linaro.org>
References: <df1d6ae5-b734-ef64-4ef9-c661e8f797e8@redhat.com>
 <CAFEAcA8hib-3YWuS-MajjvokOFCGKUHeuz+XQTBYf8LBz+PuFQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <516da1db-a959-95b4-2d24-cafcd7136bcd@redhat.com>
Date: Tue, 28 Jan 2020 11:59:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8hib-3YWuS-MajjvokOFCGKUHeuz+XQTBYf8LBz+PuFQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: tq_6zD0ZP6yVktb4oXzkmA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f42IJJ6Iz8p7

Hi Peter,

On 1/28/20 11:52 AM, Peter Maydell wrote:
> On Tue, 28 Jan 2020 at 10:47, Auger Eric <eric.auger@redhat.com> wrote:
>> When arm virt machine is run in accelerated mode with "-cpu host
>> -machine virt", the default gic version is 2.
>>
>> I understand the rationale with TCG where we don't have MSI ITS
>> emulation along with GICv3 so we need to choose GICv2 to get GICv2M
>> functionality.
>>
>> However in KVM mode, I would have expected to see the host GIC probed to
>> set the same version on guest. Indeed most of our HW now have GICv3
>> without GICv2 compat mode so our default values lead to weird traces:
>>
>> "
>> qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
>> qemu-system-aarch64: failed to set irq for PMU
>> "
>>
>> I would like to propose a patch to improve those errors and also suggest
>> a hint. But I also wanted to know whether you would accept to change the
>> default value with KVM and choose the host version instead of 2. For TCG
>> we would keep v2.
> 
> As with the -cpu option, the default is there for command
> line backward compatibility primarily. Even if we had
> better support for MSI ITS emulation we'd still leave
> the default at GICv2.
> 
> If you want "do the best you can, regardless of accelerator"
> that is "-cpu max -machine gic-version=max".

OK that's understood.

So I will just try to improve the above traces.

Thanks

Eric
> 
> thanks
> -- PMM
> 

