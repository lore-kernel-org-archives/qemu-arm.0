Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1563370wme;
        Tue, 22 May 2018 07:22:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKjxQab9r/J2vZgsZllCDzJ+A3MSdgu+txzDxg01NonIEIKLg+Uv+yO6qDixTq9bdUTUs9n
X-Received: by 2002:a37:318c:: with SMTP id x134-v6mr2534045qkx.389.1526998970760;
        Tue, 22 May 2018 07:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526998970; cv=none;
        d=google.com; s=arc-20160816;
        b=HJ7rZmN3ksCsqFG8TKvy3ay4yJfGSaRn55z51ZAY6vL5nGxt84xSjav4LlMVPQBOlN
         VR/DgDzN/TUECwDZMwh44ptNROMiLVjgogtso9QxFVRQWMz63DJihX5sIWHXZaQx6gC3
         HlL1b9Hh7Nte73AWpMWp1WGBztM+f/x16TppK//bQ084hiLAe40kvtt4H7fWSGKK9SaM
         FZOsMVXiwysMSyXiICsgoyejFEWpH3L213TgbNb8emkrWo0O1tFs06utoIO9/2wkR+yO
         Cls6dL9AKSz4Nyn+iz91c9OO0kG3PSQ7l5nKKR4dsnHzYzjNO9v2ZlV2MtVFIuVm3Fg3
         CjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=nV7/WhLkImbNT74koWak7OOV7rtdGmtESpIYaE82iLY=;
        b=E0PRaYTF8zHLDGhLOBgnt0BZ0V73vU0xnESxaKD12r7jH0KkpQNPaqoYqorplXwtLh
         jN1fCLO3vsz4Ucp2DGrW9xaOe32YvlrA8Of4uy0WGbhMQVlP8BVACT5GNxSJ4UBUedyY
         ZC6qRoevzPKEUvuFDpnb2PyTpcRemXUIylH71nL2zcZCEECkLUPMvEq+KFxplZyx7HtI
         yn+DrTRqbJmsAu8jadNpjfgXnAd+oA8o63A5lKBknCEXbGmcqlEufNYFu9NNOHTB+OEJ
         gyjVkUXN4CfFIo9kyH5X9k/l++U4pHpYOJGF8KEGVDw4VQSWBvwxqii2PN4Yg0Glwk9s
         OWoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id o7-v6si398831qtf.181.2018.05.22.07.22.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 07:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48D804187E39;
	Tue, 22 May 2018 14:22:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3636B2023585;
	Tue, 22 May 2018 14:22:49 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org>
 <47281818-f0cf-0ed1-c479-fbcaca5c5167@redhat.com>
 <CAFEAcA-R9t4K488viYM9ipmfArA=ijMMJn+FD1wekPdAbNOHvQ@mail.gmail.com>
 <595dcb89-3856-3755-e8db-7791c1374284@redhat.com>
 <CAFEAcA8Eq+EvtL1JuqtHePWMLPdkHG9zzAh7Wkrw7sNYw8jzUQ@mail.gmail.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <baee90f4-2006-ed78-c052-b735145527d3@redhat.com>
Date: Tue, 22 May 2018 16:22:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Eq+EvtL1JuqtHePWMLPdkHG9zzAh7Wkrw7sNYw8jzUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 22 May 2018 14:22:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 22 May 2018 14:22:50 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: 3uVL9lh11aHj



On 05/22/2018 04:19 PM, Peter Maydell wrote:
> On 22 May 2018 at 15:11, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 05/22/2018 03:22 PM, Peter Maydell wrote:
>>> How many substream IDs do we expect to see in practice?
>>
>> Spec says max 20 bits, matching the max size of the PASID
> 
> Right, but do we actually expect to see transactions from
> devices that use the whole 2^20 possible values, or will
> they in practice mostly use 1..5, or somethnig else?

An example given in the spec mentions 8.

"An example would be a compute accelerator with 8 contexts that might
each map to a different user process, but where the single device has
common configuration meaning it must be assigned to a VM whole."

Thanks

Eric
> 
> thanks
> -- PMM
> 
