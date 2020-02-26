Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2786274lfg;
        Wed, 26 Feb 2020 00:56:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdwzmErFAOysB8Q/V7BhQYYAaQhQf7p2AcwDyNpYG4GtVs8U7G2vOKtEa/XF9b7/Wmyha8
X-Received: by 2002:a37:a9c3:: with SMTP id s186mr4260750qke.118.1582707369089;
        Wed, 26 Feb 2020 00:56:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582707369; cv=none;
        d=google.com; s=arc-20160816;
        b=B3c17RabGLRMgSAY5CNGqp9bjhmgP5kcctgI/xcxJP2H1I/OSHjA9ZqX8gqmHP58SP
         sSz08MtaLEtDAv0h1BoIH95GASvnErmXmwEkcQOsiuA/qLk77EMrToYpxhGV99Gs0lR3
         U+9GctktOmfMiQ2ccWrHFQLpt6qiYWUH2T8sKnIn6mfrNWC4eKJfbZ0tCuqWbnydmDtq
         3DFUnoliMqFQwBuylodhil7yls1uKug4OxtaDdvfWWZ05uKKtjHr+GmRnUnAZRdfXqiu
         FclCUDMbacGC7Z+/Ou12apAHnnhpyx872QXh8bbXduHBalILLltzXD1ZcJyAv+1m6iJp
         kUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EQpZlTFOpCQdcAfmaVjhCvGpQBYYpPhdmTp1WoVfG9Y=;
        b=YcOa7pQbXlftTlfIglJGztcIIgePB31jrC8t+JDnR4y9o/WVvUoiNGGzg+eUQdt6d3
         UA9Pa4LgIYihQAza+hEW+RQGXWRLVKFbG5LxqmUYphhbvDHaF/fPycjN3Pfua2BuzJ8+
         1Sr5kQUaI9XwQZucWYZo6rrXGovwXzUVct+bOMIeOzrBZ3C2O08xQFWyf/h3KEk795La
         40sBANpyD7KpJ/lf2zqrF+ZQyooU5JH8FJf217hl0UIo1E45G1FlnBHy5OX3ibQIGzQv
         wac39C/+r9qJx4wl8dORJZSPK5eqDDF0cf67rQgrHDZo2/fm6kM/aeMlifWP+sdxnW5v
         awJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nr34XaMI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 82si294402qkg.81.2020.02.26.00.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 00:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nr34XaMI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6sUC-0007Wa-HD
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 03:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6sPM-0006a8-3Y
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6sPK-00005D-Vp
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:51:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36368
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6sPK-0008Vs-Ry
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582707066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQpZlTFOpCQdcAfmaVjhCvGpQBYYpPhdmTp1WoVfG9Y=;
 b=Nr34XaMIylP8pIqrBzKwxCUSkwFi6JWhnbH8pennb6bTRhkPqjqSohYj4wV6x/wCFfNywF
 F4dtGt9KcIDhDsomcfWAI2jnbxEv0qdMXxYQWDI8ETEXe9u6cc/PjkLcuKGmoU8xYLQbk1
 a1wKAjbsjNiIyEqn3B05B/0JcejZg0E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-8It3PF-FMVSSyJjpAwLKSA-1; Wed, 26 Feb 2020 03:51:04 -0500
X-MC-Unique: 8It3PF-FMVSSyJjpAwLKSA-1
Received: by mail-wm1-f72.google.com with SMTP id z7so639848wmi.0
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2020 00:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Erw3p9ZDh3qQ0G03wAN100FaGTX0pQtWBoXwxb6hOoc=;
 b=R88CQyC8eBbUAT509bS43GQbJZEQB90Rz7Jy2no8C+vQxGmtmEdzqesmuYOkjL4mRP
 NUEexx37x0jhJuWaTzk+rJSkflWcdyOiYyWl7CWTt8RbxsMGrNmb0/K6QUUTZ6CMDkw5
 zWq8zNA1oD/0YlVrgpMdWTtE08udvPC5gRpV0oT+KfD+QkHIZ2vNkm0vYjGguwOyPtj1
 bmYuXd5O35495KEOwpFc3OQVZPBcG6sZJhFJT4C1pFjeBPDiE5Rvf7FfO2dLN4yAqCDP
 2v+KNYnKaoYQj0Wa/SB1X7VFzNzXVUqO95zP/MonPg/p67CVfl+zDDEhahFoH0i2a6so
 pgYg==
X-Gm-Message-State: APjAAAV55IcahzEPDpS3E81CTWkM9iJYDT48eSz/jH6fgH3WCvhiWHs+
 Ki3T6wPYLFN9y3/rYx8KJlMT7pBNjPm+o7AbXLKy2hhIf0jlvBuZkIlo3BHQK4gs64ibNWeotxj
 Jgke1aeELTnnH
X-Received: by 2002:a7b:c109:: with SMTP id w9mr4122433wmi.14.1582707063584;
 Wed, 26 Feb 2020 00:51:03 -0800 (PST)
X-Received: by 2002:a7b:c109:: with SMTP id w9mr4122353wmi.14.1582707062761;
 Wed, 26 Feb 2020 00:51:02 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id u62sm2051825wmu.17.2020.02.26.00.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 00:51:02 -0800 (PST)
Subject: Re: Sudden slowdown of ARM emulation in master
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <CAFEAcA_azGqyzbxegpK8ch_bums6Wtd=U7cNxvM=bAJ-Ld2DDA@mail.gmail.com>
 <ffa87cab-e85c-c381-289a-fdf1ef07b45a@redhat.com>
 <CAFEAcA-32ddJW0ULWzGDDwLcvPGnXOatRHy73Agh0NRajfnRCQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <99625cab-71ff-a925-fbed-28120f046f0c@redhat.com>
Date: Wed, 26 Feb 2020 09:51:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-32ddJW0ULWzGDDwLcvPGnXOatRHy73Agh0NRajfnRCQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ot96gAHIFplE

On 2/26/20 9:48 AM, Peter Maydell wrote:
> On Wed, 26 Feb 2020 at 08:44, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> On 2/26/20 9:41 AM, Peter Maydell wrote:
>>> On Tue, 25 Feb 2020 at 23:08, Niek Linnenbank <nieklinnenbank@gmail.com=
> wrote:
>>>
>>>> Just now I was working on some small fixes for the cubieboard machine =
and rebasing my Allwinner H3 branches.
>>>> While doing some testing, I noticed that suddenly the machines were mu=
ch slower than before.
>>>> I only see this happening when I rebase to this commit:
>>>>      ca6155c0f2bd39b4b4162533be401c98bd960820 ("Merge tag 'patchew/202=
00219160953.13771-1-imammedo@redhat.com' of https://github.com/patchew-proj=
ect/qemu into HEAD")
>>>
>>> Yeah, I noticed a slowdown yesterday as well, but haven't tracked it do=
wn
>>> as yet. The first thing would be to do a git bisect to try to narrow
>>> down what commit caused it.
>>
>> My guess: biggest chunk of memory is the DRAM, registered as "fast RAM"
>> by QEMU, but the SoCs provide SRAM which is supposed to be faster. Not
>> anymore with QEMU. And Linux try to use the SRAM when possible.
>=20
> Doesn't sound very likely to me: generally Linux doesn't use random small
> lumps of SRAM, it just goes for whatever the dtb says is the main RAM,
> usually DRAM. And I thought that all RAM blocks within QEMU performed
> the same?
>=20
>  From the commit that Howard tracked down as the cause it looks like
> an ordering-of-actions issue in vl.c where something that was assuming
> memory-size-related stuff was set up is now running before those
> variables/fields are set correctly rather than after ?

Yes, I just saw Howard's email and was going to reply to my own "I'm=20
probably wrong since the mac99 machine doesn't use SRAM".

