Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5814361lfk;
        Mon, 15 Nov 2021 04:52:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvoWqnL2u+2IqixtvV30p4eGOx+OIwTJbkObWfjaIfiZ8EA8LK8jgM03HpOGMHtG6aQxyb
X-Received: by 2002:a05:6122:7d4:: with SMTP id l20mr6364411vkr.9.1636980727843;
        Mon, 15 Nov 2021 04:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636980727; cv=none;
        d=google.com; s=arc-20160816;
        b=DzNh7o/gS5EGrG44U/cR3r6hyCUb7tCC2oioUX4neHmLv6qer5HEE8Uhmv2kulXy1N
         w1Zon2DqDUHe8lMREKXnYBOnRGt6p8ZiloMHaSWpy/rp1jQuXHdIrpsAfSap+D7himHG
         Tl5Ffb1Rh7Je1fTlredpLaARybAfehj0hz1mBclT+E83rPelqrwD+GRT9w2b+TKkGasI
         kCu6M/NiWUBgfe0nFkiO8puiZHZ6+l3QzUGZfpolC/qSUwgVDeotX5j3y5ZIO8J3NPpY
         8xsQARVo8gUZInO6oSKX/goaX8COeeeVnDTPM09ClA1BOMVq9jQUh98voKrsJoXX1xZq
         tbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=m14S1J2qicA5TmCBCcBBLInqB50gvC/KVeGN4CJDIKU=;
        b=nTRnRV5bcYjjZmD4Cf7w3EwDFFpedr6jw9bRWTTzeryzP1ECUxdohq9eHq2bGIri6G
         yVXs0QtNh9QQsOcgu+8l4Q4Vm2vcmm+itVDkgEAuAHmHfwwOOV0x765bcQBVXhC1Pf4D
         Vi7g6ubjv1HwaQyXcimx6v+vFlnQkdDRFtRsJNzf/i1czGHF15PELSuj5NsjKNi6odSI
         nDzYGIiI+2pf9pEfjLL7iMPb7dnxoOYLRYNDN3U55UUiawWSclkMI0oYts3LK9KieFIv
         N72hFpdsJEuTnOUsxmwHvSaBxH0j/9SQstemgorB1lPzeUqI6o2i9i7LpFod0G1Td1Cp
         pSxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LZLm63DW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si33427990uav.213.2021.11.15.04.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 04:52:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LZLm63DW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmbSx-0004Yo-8N
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 07:52:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmbPz-0007va-UN
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmbPx-0004Cp-VZ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636980540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m14S1J2qicA5TmCBCcBBLInqB50gvC/KVeGN4CJDIKU=;
 b=LZLm63DWXmuHV+ICTK3bTTk2NSn7RrvkoBQlvJpoPjDPdNLSXl9KBXTfHUnX3EGGjEtF+b
 LCE3s1QT7EnS7HXjNE6rp83esxfNu6tNpZFTSVE6mlz1/H4bIy3Sh7yNo4crTU8nr/TXJA
 K77PHPSM5D2GkTYjCHQQctynt1H2od0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-XDhgru-AMaCV0Z0VpgFl6A-1; Mon, 15 Nov 2021 07:48:57 -0500
X-MC-Unique: XDhgru-AMaCV0Z0VpgFl6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 779F018D6A25;
 Mon, 15 Nov 2021 12:48:56 +0000 (UTC)
Received: from [10.39.195.133] (unknown [10.39.195.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4D915DF21;
 Mon, 15 Nov 2021 12:48:51 +0000 (UTC)
Message-ID: <3c241757-eea9-90ce-4c86-19391efbba7a@redhat.com>
Date: Mon, 15 Nov 2021 13:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
References: <20210920122535.269988-1-eric.auger@redhat.com>
 <CAFEAcA-8497+XS0PU3RAkGsrf7PGVm=oGymuHznE3iuopMHbKg@mail.gmail.com>
 <CAFEAcA8tbJ3jbHghvqk3hmUOZmQEzYva2Qqbq49i4dC93bQXCA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8tbJ3jbHghvqk3hmUOZmQEzYva2Qqbq49i4dC93bQXCA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Gavin Shan <gshan@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o9sJYnrp1Ifk

On 11/1/21 17:04, Peter Maydell wrote:
> On Thu, 23 Sept 2021 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 20 Sept 2021 at 13:25, Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>> The PL031 currently is not able to report guest RTC change to the QMP
>>> monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
>>> to qapi_event_send_rtc_change() when the Load Register is written. The
>>> value which is reported corresponds to the difference between the guest
>>> reference time and the reference time kept in softmmu/rtc.c.
>>>
>>> For instance adding 20s to the guest RTC value will report 20. Adding
>>> an extra 20s to the guest RTC value will report 20 + 20 = 40.
>>>
>>> The inclusion of qapi/qapi-types-misc-target.h in hw/rtl/pl031.c
>>> require to compile the PL031 with specific_ss.add() to avoid
>>> ./qapi/qapi-types-misc-target.h:18:13: error: attempt to use poisoned
>>> "TARGET_<ARCH>".
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Thanks. This looks plausible to me (well, it would ;-)) but
>> I would appreciate review from Paolo or somebody else who
>> understands the rtc_change feature and handling.
> 
> Ping? Review from somebody who understands rtc_change would
> still be nice...

The change looks good to me (sorry I missed this v2).  x86 also has some 
logic in the migration post-load, that might end up sending the event. 
However, that's best done separately after understanding and documenting 
exactly what x86 is doing.

Paolo

