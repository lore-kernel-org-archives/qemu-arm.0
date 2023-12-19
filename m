Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1709682eji;
        Tue, 19 Dec 2023 11:17:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2KAVne6JxYq9CjjtocnIdQOjiDX4eA0tOxJoDNRmn1SKx+L52KvdO7/V0ClNLuKrHtVqG
X-Received: by 2002:ac8:5c96:0:b0:427:840d:30ca with SMTP id r22-20020ac85c96000000b00427840d30camr465146qta.28.1703013466178;
        Tue, 19 Dec 2023 11:17:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703013466; cv=none;
        d=google.com; s=arc-20160816;
        b=OE2I1NVI+oU0PdeXPJycSD0doAXud/akQDaZfXyI4lDsV+rj+rO2uH6Uy8jLVl4HvM
         Xm/HcaZ/heopr/L6KEJ/K2kgx9JJCzjmo+CseXqWu8XQb9y9B0laGCufu1AJqJvODQzC
         47DLCa2V071zZtVlQk2bY1hNQiT93Vf5TmVK2RImEXCNFeKSs3s0jd8pkQG5RBxNJK4H
         RTkHL7Ud5sTQW+fJ4HB1Gp9yqwioNUc/nfGrvffCZAAFFTXDrWpcKLRxTJXKg2be0AJ2
         vngLY0eYoh4AWOMrOiyZFMTij2Oy3J5V//1khNnRqYnVvBaB2yqw27erDKOQ9ilaCZrn
         H4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id
         :in-reply-to:date:subject:cc:to:from:user-agent:references
         :dkim-signature;
        bh=+2n0eztlKQKtd+61w2wLkVjInLicXnvFmFlcQAWV2ZE=;
        fh=K23jbVeYX8JyYCsNW43xPI8zhnzTVNF8hPRLQTJjE1Q=;
        b=mlhWh6nQGaZUf2slwDB3hNQztdPJxrp/jC9JgVkKH3th/qIXUqrQAvbLUAZEvddgfU
         tiPuxGJCShdGelqmG06yJulgwuUpJzVIqEM089nkliLqd4/XkDFu5/V+PxoU7MCtRUhE
         xA5JtbjEFmmwgvqhEtImkDlGkv+abyU1iQVCodzNzp7cwTBsd4ulenS8XnLJ7Ez9rWtm
         JdY1BPTcpqzH59PjzQsAptn/TxyMKKFyWfqKdOPuZAbhH458ZuSoKfDg2GC/yfJPMdwL
         nCyDHKgPRGqtJtmpVAuRWjPZoGz7dCuq6lRifdg9GlNddVittKGZRJP7DYCGMXXfoPut
         oipA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=o9LVi3mV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a05622a01ce00b00425840f70a2si28494380qtw.427.2023.12.19.11.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 11:17:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=o9LVi3mV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFfZK-00086o-HW; Tue, 19 Dec 2023 14:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rFfZI-00081C-E5; Tue, 19 Dec 2023 14:15:52 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rFfZG-0002RP-1z; Tue, 19 Dec 2023 14:15:52 -0500
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 7AD9880024;
 Tue, 19 Dec 2023 20:15:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1703013343; bh=0dClO786ziR8HNe1s46NWlhaDGUzRlloPD7GXUzTnJA=;
 h=References:From:To:Cc:Subject:Date:In-reply-to;
 b=o9LVi3mVPDajKlQCn+2UdzAmbWsadIpaPrMsAVQkf9I3ve8PrXT6Y3xVb+GtKaHqo
 u++oiRkQN8Fiqlhb4stTKYwrIJB6RvxocGgTXVmXG/MGiSzYhGjnk0g0S8mRvV4s8p
 MeCySE+t4qb6uu4qqyjIv0pSHKnTvLhcYQdZTXioX9djSfWAd7L7kAmCk9sJaLvvjj
 cRVxcYOsLinrHNRfuBwjyZkBVYY9c7WcfUbO0c4relgCnkHUk984OAhrys3ly/7T7y
 GRX348cRZestfzRvh4EaIyhutIsF1ffQIVUr5at0unvrG28JTLjrivbAdh/RuenZlU
 zCHMClCstzmMw==
References: <20231216182740.3305724-1-sam@rfc1149.net>
 <878r5tqnyu.fsf@rfc1149.net>
 <CAFEAcA8sTLZSQdqZmNGSv4yp3TZvq86kwbhU8gFmK2=j8vVZhQ@mail.gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Samuel Tardieu <sam@rfc1149.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, Alistair Francis
 <alistair@alistair23.me>
Subject: Re: [PATCH 0/3] Add "num-prio-bits" property for Cortex-M devices
Date: Tue, 19 Dec 2023 20:13:52 +0100
In-reply-to: <CAFEAcA8sTLZSQdqZmNGSv4yp3TZvq86kwbhU8gFmK2=j8vVZhQ@mail.gmail.com>
Message-ID: <87wmtaxaub.fsf@rfc1149.net>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URIBL_CSS=0.1 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W6FCLJNv4chQ


Peter Maydell <peter.maydell@linaro.org> writes:

>> Any idea to why patchew fails to apply thoses patches? The mbox 
>> at
>> <https://patchew.org/QEMU/20231216182740.3305724-1-sam@rfc1149.net/>
>> applies cleanly on master AFAICS.
>
> This is because you put a Based-on: tag in the cover letter.
> Based-on: means "please apply this other patch first before this
> series, because there is a dependency" (we use it for things
> like "this patchset has to sit on top of some other cleanup
> patchset I sent last week and which hasn't got into git yet").
> So patchew applied Anton's original patch from 2022, and then 
> tried
> to apply your three patches on top of that, which caused a 
> conflict.

Thanks for the explanation. I thought "Based-on:" was just a 
polite way of attributing credit to past discussions. I'll keep 
that in mind. Do you want me to resubmit it as a v2 without the 
"Based-on:" tag so that patchew gets it right?

> Anyway, I just wanted to say that this patchset is on my
> todo list to review but I'm not going to be able to get to
> it before I break for Christmas, so I'll get back to it
> in January. Thanks for the contribution!

Noted!

Best.

  Sam
-- 
Samuel Tardieu
