Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1759143lff;
        Sun, 19 Jan 2020 11:10:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmazXSey3vDtw8nNY30/tFOz3gAsM+dg5Sh+VfOL2tcuPOLE3XvBIKrhVpuEA6KcUhydUW
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr13928715eds.183.1579461017686;
        Sun, 19 Jan 2020 11:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579461017; cv=none;
        d=google.com; s=arc-20160816;
        b=uHdD18qIKMYUYmh3zeL4CakGjtlM2FLr+7FwrcG9AAM7YgTOWMoUgSpzlvL/dUT9mG
         /z6UbuoORYvkfAAhoyy6NewVfOfcQ6jMz7DgifLvjhUGOS9FWTvSsU8Ntgonlq9Gr06E
         iOTGzB0qEH55hjURpuWpk5cjnB+yt3CjBAwKfK69vbHcvFm9AY4JesnVtOppLWfQLQ6h
         B3IjTEW/jsTq+gq7tEPCCiBZFDvtQnsdjl4gb7BV1/fH7dU0wDm0u8WwFVXVBvP49hc9
         rWcDI/8sGHtZs17w7+E/7srDZNVZQ2nS6PNsPRAhWOp3ahU3PtsR84CHWnOS2llFRRTM
         TFSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cI9GlKmUduIQj1qPCU3Q9ivuSO9/wEiAI2naKXrrqOE=;
        b=SGoWX1jJR/qtx4U4CElkntLdgOcvwBSlNaYoIUgiUk9DZ7ZwsukiA90RRjlVpRhiM9
         In+C2shPdLmepP6uECaA/FE/Gnm03chXXdzaYt/mtEqYxKd+MLGEYgPJb6Zk2djcKOhU
         Betbe9gU9+ipMDxxyk2bQuTORlP6IPa+Z8T9LdieiwKc2VDvkiUvACrWfNRx2e60ownR
         mI8g6xfxn6ymRjnbXvZhUThokM33UtmUpKG0p3WzuUZhvn92xqcj9ZvuK9F0gIcLi4bK
         KAtJXrOlzbbplxtEtOxnlVlLlcDKUOIQ9wBkwFLtGGCsvvt4AUQfe98R+P1vswf/HNyZ
         rdxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aQBh+WuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz12si21664293ejb.418.2020.01.19.11.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jan 2020 11:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aQBh+WuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itFxg-0005nm-FO
	for alex.bennee@linaro.org; Sun, 19 Jan 2020 14:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1itFxU-0005lI-DF
 for qemu-arm@nongnu.org; Sun, 19 Jan 2020 14:10:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1itFxT-0005Ys-F6
 for qemu-arm@nongnu.org; Sun, 19 Jan 2020 14:10:04 -0500
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:35107)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1itFxR-0005XR-6U; Sun, 19 Jan 2020 14:10:01 -0500
Received: by mail-yw1-xc44.google.com with SMTP id i190so16953255ywc.2;
 Sun, 19 Jan 2020 11:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cI9GlKmUduIQj1qPCU3Q9ivuSO9/wEiAI2naKXrrqOE=;
 b=aQBh+WuFqiQkRWA9qThGEW81q/bzwPYgALbw5n25uvZHPwgcdxIL79fiFKjCYlTFwc
 wWrRo/RAcV+IIA/uMMQ08S+UwIJNyn/fS7gQ7HS6hMVxT20mtpNXEhvgk87EDW0q/p7x
 pgKFkLVfXC4ccem48yQWyslxCrUUL+FPOsBjjcjSSNPnoUbRnAP8Y6vIF8jaSrpW2Pb6
 W90KI7oBHEvpeI1fRt55fxA1tjT5xg+NszBgdf32Xsk6XalBof0Apu3nplo3o2hdsiM/
 zfaljsKhvb1X5ONlpPjqWhTH9b5xjHlPZrT38HDPr49wjS4AHXKsn0bU7zvZGjOBHSY8
 jDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cI9GlKmUduIQj1qPCU3Q9ivuSO9/wEiAI2naKXrrqOE=;
 b=XV6yUSvhfQXmSXZB5L3WYxGxSstpHgYLCW3PQSx7OLH9xAivZLglpit/1G03B6D58K
 vg11ER4vkLNOayQuKW9bZCgGgS1m/eO94oGPryUkecvQCLHRnB7Q7vP/0xnbZgxaBzBT
 6jUOKVZPZLdcURLgJKtuTkXmFL5Gbioapv032AWOB5z4i139q4FJ+nXDX9jhSfBOvzr/
 7LY1t8LHQAAT7Pw8srHkB8G5VNxyVyNwj5Wh4vxK/o5RnuJ8BNzVjGwLRIWPlGyGaECs
 ahSZ0s9/HgtB9xGPMpFBhUOpHKvTGPMXHHL71lTf3gKihnTPsX3LOIVPpCySUTMGl5xq
 RKbA==
X-Gm-Message-State: APjAAAX5eYp5gcDmjC5tjKSj/NnSDU987q9R4JwEp+NYW53NkBvxgGWv
 iYcFCA3pnjKesYJpi1NSMSYiqUXT
X-Received: by 2002:a81:a0c3:: with SMTP id
 x186mr33178446ywg.344.1579460999827; 
 Sun, 19 Jan 2020 11:09:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 z12sm14016291ywl.27.2020.01.19.11.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jan 2020 11:09:58 -0800 (PST)
Subject: Re: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-7-linux@roeck-us.net>
 <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
 <20200117182939.GC13396@roeck-us.net>
 <CAFEAcA9zWeW1k-K7qVzCSOA70BmOCa9onT2z_QUQK-=0AJ+NjQ@mail.gmail.com>
 <7a9967c6-a370-9137-10fd-095113dd9852@roeck-us.net>
 <CAFEAcA99CgreMMeTH+nmnY+6OU2xY3A-db6MfBuU8i_MCA+y3w@mail.gmail.com>
 <97dafdcd-3f4d-5cc3-efab-b07f373765d5@roeck-us.net>
 <CAFEAcA-9Q7kyJLGcz=kX+mgpL=8Hkt4hM2so1rG98t-ViBS+PQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <770ce52f-6a74-c462-6cfd-57fc369ab868@roeck-us.net>
Date: Sun, 19 Jan 2020 11:09:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-9Q7kyJLGcz=kX+mgpL=8Hkt4hM2so1rG98t-ViBS+PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uX+dqnjVJx6V

On 1/19/20 11:01 AM, Peter Maydell wrote:
> On Sun, 19 Jan 2020 at 01:52, Guenter Roeck <linux@roeck-us.net> wrote:
>> I'd rather try to fix it all if I am at it; otherwise it feels kind
>> of incomplete. Would you be ok with addressing this separately after
>> the current patch series is accepted ?
> 
> Absolutely, if you'd like to clean up the code please feel free.
> I agree that a separate patchset is probably the best way to go.
> (Do you mean by that that you'd like me to take your v2 as-is?)
> 

Sure, if you accept it as-is.

Thanks,
Guenter
