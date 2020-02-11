Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5405093lfp;
        Tue, 11 Feb 2020 10:31:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTdLR5kzJD9FW3I8RcBsFHbCwzuMLoOelR2H17I+TNblDj0xGYaiVqwNUhUFGRk+eoiPKe
X-Received: by 2002:aca:ab53:: with SMTP id u80mr3633486oie.94.1581445866752;
        Tue, 11 Feb 2020 10:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581445866; cv=none;
        d=google.com; s=arc-20160816;
        b=onKkuRPCwY4xf2P1q8RAL4CE8AfS1FkzF5tnyfXMcUyt2Me5VKgtvAFEC7NCEAfkyF
         31JhB5id40JsbldhrSwsQF3QHu1bhE1Bf5cHA5D10txTL7lKhiXsa26GYxUSELK9lLgO
         1Qz20Kjl98wxZxfc8yqldngK9ykMtLwssJVnqjFPBx92mlot0t1TrUqEFPD4/1s4Rwg2
         eWbAyEiHqz4E+tkIiQRgAbBfctChDeUdh4Wt1t23iuvcpTXvruhFgqzBkzJLfbCppTus
         AYbGOrnBjnWgfo3CSNlhl0DFt5yX1VOvT2Itd8jNwnbtlVPyHuqd1apVHm9llzTun+eC
         7Dyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=vQe3nGagGzeCsufC3rqZRuUQ8B4VGRBcrcOfQrGBV8w=;
        b=UNSVaAfIQed8N4Hu0f7C1H7fwM7769w15sLcYYHNoYiNN9OTuDC2xJFXhdNrjrr+1s
         ffvMSAAvUP7r+VlYZoNpYzr8B/CmOCpt4yWYnyh80PvCriPelF+V5umAUdg4DcdHJJwa
         oAHp3yiN/eVwT30tJt9LUTfwk+2rQ46SyX0eMxF2S5fARc6MBAysRZfdARGgZ5IgzW0k
         sasAtU5oGWgvOnVN6EdbdgrMi5Oos9XFHs2Tzn/FmLlGrpIs0LYaJ75rn0HnAxZ4PdZy
         lHJ9sXSsoYwOmVJpYBb7hqIa+FPDhLrZ8jFUaH2dHbpssDQhVeAeEp+6+SWvcTmvebrT
         93xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XizbppCk;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s8si1934014oic.7.2020.02.11.10.31.06;
        Tue, 11 Feb 2020 10:31:06 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XizbppCk;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbgBKSbF (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 11 Feb 2020 13:31:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47937 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727361AbgBKSbF (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 11 Feb 2020 13:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581445864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vQe3nGagGzeCsufC3rqZRuUQ8B4VGRBcrcOfQrGBV8w=;
        b=XizbppCkcIq3S0jPR6Yg3/Y+HDcyF02GFLkUuS+eqEqnhruL49WoKpIjI40/YDmU0CcGE5
        FxxH19lIGS8qlUcOo+uE6iQwKluCR30kSE1VFvNyGnzE0Uigbzn3EgNZc2JYdQYSq3FxwQ
        KQvD88omyJGCgb1qA5XQDq1/s5+E8G0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-MhMVp186MkW1lxqSwApFkQ-1; Tue, 11 Feb 2020 13:31:00 -0500
X-MC-Unique: MhMVp186MkW1lxqSwApFkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED611005510;
        Tue, 11 Feb 2020 18:30:58 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8935689F38;
        Tue, 11 Feb 2020 18:30:53 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v2 6/9] arm: pmu: Test chained counter
To:     Peter Maydell <peter.maydell@linaro.org>
Cc:     Eric Auger <eric.auger.pro@gmail.com>,
        Marc Zyngier <maz@kernel.org>, kvmarm@lists.cs.columbia.edu,
        kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Andrew Jones <drjones@redhat.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>
References: <20200130112510.15154-1-eric.auger@redhat.com>
 <20200130112510.15154-7-eric.auger@redhat.com>
 <CAFEAcA_jfZKjey8komTt97Mu-oFjWyFNG2cY4-o8yFAP1oGiug@mail.gmail.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <5f11c69b-655a-2fa9-462f-9fd6ebdb501d@redhat.com>
Date:   Tue, 11 Feb 2020 19:30:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_jfZKjey8komTt97Mu-oFjWyFNG2cY4-o8yFAP1oGiug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: /H0tDIQhEXh9

Hi Peter,

On 2/11/20 5:24 PM, Peter Maydell wrote:
> On Thu, 30 Jan 2020 at 11:26, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Add 2 tests exercising chained counters. The first one uses
>> CPU_CYCLES and the second one uses SW_INCR.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> +static void test_chained_sw_incr(void)
>> +{
>> +       uint32_t events[] = { 0x0 /* SW_INCR */, 0x0 /* SW_INCR */};
> 
> Cut-n-paste error? This test relies on the CHAIN event but it
> isn't present in this list of events to pass to satisfy_prerequisites(),
> so I suspect the second element should be "0x1e /* CHAIN */" ?
No that's not a cut-n-paste error. I may rename the test into test_sw_incr.

It starts by testing unchained SW_INCR.

chained SW_INCR testing start with
/* 64b SW_INCR */


> 
> (This makes the test fail on QEMU TCG, because we don't implement
> CHAIN.)
OK

Thanks

Eric
> 
> thanks
> -- PMM
> 
