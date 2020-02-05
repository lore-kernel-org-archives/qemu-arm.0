Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6537763lfp;
        Wed, 5 Feb 2020 03:10:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsTnM8sedPrC6LqlXuCvwJTRt47yZOxcg5OStrBHiAmanhRHP1IFJF1kQaGbvRmhEwkQyj
X-Received: by 2002:ac8:6ec1:: with SMTP id f1mr32737115qtv.144.1580901051868;
        Wed, 05 Feb 2020 03:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580901051; cv=none;
        d=google.com; s=arc-20160816;
        b=w6yqcd24dl1FGaL/fCa6z09X9HqxRqaqvMhDO24Rjnc9mKjqtTXUO6KIJa2d0StDrn
         DyihDnO2e99GpOeFKbdWogJH1ze6cLg7rIhG4N8+kT2YYgXHtuRyPNMz7Qy7B57xcEAv
         Obd595jVsu9tuPvpjDDdTGl55FKzQNdZCuU8ukUmcG7zgFJmKN19V1LbAa3MrTkph8fz
         LjvqhvxRBKmaASWITQoH93qzfPUjgdta6Ap/sSE1zJLCX768Mu7SpoFVJSBCGnjFcPCQ
         4DRTsgvPeCaG1Wg1ZZTGUqynyxFq4Cn0C6F88WICo7zmFhiQAc3tKpe4vMLAVz2rTAEh
         00yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Ed+wZVag99E1yDNJq3c6SAFMNeyBfm2UUayXncyesxA=;
        b=zb39Vl+4PHWlsQ2qT2Jw+PkX5R/dEb0dZe2QfOeKTSi5w40gDNW1qzknQfVC0V/xb9
         YtUG92a+wlI/pnttEcpMsBSClLNH4v4E/+2ohbzTZNFqwYHliFVZXymceBX/QhivdmeS
         68QxGspwt5Op6Lz8hpi995oItb0PJ6s6X+LJe/Oq9/I5TyO5gWjENEDBoMj1Z3XoXN2+
         fIFIHQfFOeZj+oF9GQnA7TVhMNzk+BlOTNCo5QPJirfEFnMkQc3AVSBRE/U/CscXOHtD
         5ISh/RnqByCVMoW3/QEDz6fyn1yB1ZQDV3L+PGhyNSeuGlCEQC/2oK3h0kFqgpqNJ27U
         jFLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h3Ek2IQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si14688509qtk.86.2020.02.05.03.10.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 03:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h3Ek2IQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izIa3-0006lV-93
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 06:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1izIZu-0006hx-4x
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:10:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1izIZt-0007VQ-2N
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:10:42 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49420
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1izIZs-0007Sa-Tm
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580901040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ed+wZVag99E1yDNJq3c6SAFMNeyBfm2UUayXncyesxA=;
 b=h3Ek2IQGGkTyEKeNnxZ4CScIwmIXRSxRW4cFeoyU8MR2Ro2b/f4MGmHDenIqO2WsZMqVFv
 bxmNAz6NKSut864BmZVFmUyKeG6FTZBl21YZNBsfV11jHxpblKQk/hzORHii/YMVNO2DqN
 3e4E0y7cKvl9xJDfTXevvzNRFZIBIhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-BAxY3oirPDG-AW-EadY03A-1; Wed, 05 Feb 2020 06:10:39 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E800B100551A;
 Wed,  5 Feb 2020 11:10:37 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-31.bne.redhat.com [10.64.54.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 742EB5D9E2;
 Wed,  5 Feb 2020 11:10:32 +0000 (UTC)
Subject: Re: [RFC PATCH v2 0/2] Support NMI Injection
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200205031227.24355-1-gshan@redhat.com>
 <CAFEAcA_3A5fxo4gedJxsc64jus-rjzaLgzcipguOMwkSD4PNbQ@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <728d4be5-72f7-7742-98a3-c80c4c930f62@redhat.com>
Date: Wed, 5 Feb 2020 22:10:30 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_3A5fxo4gedJxsc64jus-rjzaLgzcipguOMwkSD4PNbQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: BAxY3oirPDG-AW-EadY03A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VvYVWjLzuTgJ

On 2/5/20 9:57 PM, Peter Maydell wrote:
> On Wed, 5 Feb 2020 at 03:12, Gavin Shan <gshan@redhat.com> wrote:
>>
>> This intends to support HMP/QMP "nmi" command. When it's issued, the
>> SError interrupt is injected to the guest. The guest is expected to
>> crash with it. The behavior is similar to x86: NMI is injected to
>> guest as error indication. The guest possiblly crashes and reboots
>> with the injected NMI. Note that the functionality is currently
>> supported on "virt" machine and {"host", "max"} CPU models only.
> 
> Hi; you forgot to cc qemu-devel; can you repost, please, so that the
> tools like patchew that monitor the mailing list pick it up?
> 
> thanks
> -- PMM
> 

Sure, The series was resent with a "RESEND" tag.

Thanks,
Gavin

