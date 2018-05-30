Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4961781wre;
        Wed, 30 May 2018 09:59:44 -0700 (PDT)
X-Received: by 2002:adf:9724:: with SMTP id r33-v6mr2935862wrb.79.1527699584779;
        Wed, 30 May 2018 09:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527699584; cv=none;
        d=google.com; s=arc-20160816;
        b=IW4KXOweyJgE6xDqbxhNwpwe6vgi20IgwAJYGpuDhSFFyqsyJ3yorAJ+uc3UdAtCDn
         +ucvJ+qCEYKnclGiU9UTnQTKsTTrmQxBzOA/ob/M6SyAYR+5JlfBjsNR8Nt0Z+u/txU6
         zddxEGzMGhTNbQGansmkANjava2Eo+pAeBa9pZ66UiSCekCAFj4HaGvSg2xUQrnP9309
         690rlGvKZu5bXOeNOXgr+281OjLOg6CNhHZy3icT+7NdcQpMfRBVM8tAj1hJfORCX/DD
         78v29d/CkEpengj7CzYAW1vgOB++P7Ssk5/0BGNiBaOw2ajYPzGOGMXsJKW1b5OW5bxW
         Dp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=pivYUKVz+/U1lgPh18GLfOqdXbHSI3w/1jyc4AQW7Rw=;
        b=OQvKOiMDql/bgr9X03YIS8N1df2wxNmnDwmO6O9nzlxIR27uEY6hR29lt4K8WuLHuC
         kKze/2qpQYoCfqAZKbam5PJddKv/iR8iUmudJrHdpC5LpkDrEZJath5fSb8z/lgc6bDm
         M76GUnOYB9OcVR+3hI8i2Y1iAnBNBkU35nSWm6of5uNaAG3C4Tg5Tss7gAvLAR0iFYbm
         4EFamr6OwCW6L0dveBilLPX9N0od25e4mRFxIK2WgwjcbJhc6d6gxGIhPo87G+f+/1nn
         nK1LkrRoPFdaFMjv9XFl7HQKf/CNF+YsTHQr1JewiutJATI//fnMSFL3uvTEi+599K+g
         rhUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p1-v6sor13095026wra.0.2018.05.30.09.59.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 May 2018 09:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pivYUKVz+/U1lgPh18GLfOqdXbHSI3w/1jyc4AQW7Rw=;
        b=mV8DcZPG/VNtN79yhw4bBaBA8vCQUtnhPfJ1LxoddLU/whnpF1oarasyGG5AEknnB8
         1/85pMf2BHd19MIcEleZg7PbTgmE07jUu4zXwt/uqkxzEovy3GKjgpue9cnsqM8JRJtm
         MZOn5WFCN6TCLdgDC5ZJPDYgvu+GtIISosdmtL74LVvKz6A5XjuAxrR39dL2DaXnZ0l6
         V/ZuvbG3E5MW+5CF8Icu9otH7R9jQe5eD9lPE/Fs839+PAZJPxU8tPTQ9IvO+ZjMhuBY
         UHK85mvJSrgErCFixzPQ4GUW7snnEXCsS+CdbDCJXK4BdScRWN0ncFY9RJ+QnSBlMQdU
         LzTQ==
X-Gm-Message-State: ALKqPwcUFQL6uEPnQL7k7aSCQSt9ATisBmDBd0GzPhMg5sDfSTAe/E7N
	JEvwvgif2bYQaSPrju9LCExapQ==
X-Google-Smtp-Source: ADUXVKJyVl5QsrhnMRfYGTqSENt4K796SHA8LlYRyClzMHwDms0vOAD07A6Jht0UGHfJxtq47PdYKA==
X-Received: by 2002:adf:e345:: with SMTP id n5-v6mr1768175wrj.82.1527699584495;
        Wed, 30 May 2018 09:59:44 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.165] (dynamic-adsl-78-12-189-60.clienti.tiscali.it. [78.12.189.60])
        by smtp.gmail.com with ESMTPSA id n17-v6sm33458545wra.3.2018.05.30.09.59.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 May 2018 09:59:43 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 23/27] hw/core/or-irq: Support more than 16
 inputs to an OR gate
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-24-peter.maydell@linaro.org>
 <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
 <CAFEAcA_ErfYKnVrp=Dv9mNg55Y+=fFmg4eEMddGdMxUGVb9ztA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <530bef1b-a143-1566-3089-32629ab250b8@redhat.com>
Date: Wed, 30 May 2018 18:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ErfYKnVrp=Dv9mNg55Y+=fFmg4eEMddGdMxUGVb9ztA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: iawUHZQKV7bz

On 21/05/2018 17:02, Peter Maydell wrote:
> On 21 May 2018 at 15:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> Why do the levels have to be migrated at all?  It should be enough if
>> the IRQ level is either migrated manually, or restored (e.g. in
>> post_save callbacks) through other data that is migrated.
> This is standard behaviour for devices: they track their
> inbound irq/gpio lines, and then that becomes internal state for
> them that must be migrated.

But or_irq's input are another device's outbound lines, so tracking them
should not be necessary.  The other device would do it for or_irq.

Paolo

> If we didn't migrate the input line state, then after a migration
> the levels[] array would be all zeroes, and the next time a
> connected device signalled a high-to-low transition we'd take
> the output line low even if it should not be (because we'd have
> forgotten that some other input lines were high).
> 
> In a different world, the state would be in the qemu_irq line itself
> (in the same way that in hardware signal lines are their own state),
> but we can't get there from here.
