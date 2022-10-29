Received: by 2002:a17:906:4687:b0:7ad:c089:ed49 with SMTP id a7csp144804ejr;
        Sat, 29 Oct 2022 15:54:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SNpPy5ZZyV8qVy9Zpq8JCRo9Pu8FXB0QkZsXGy4ESMVHmSdfdFKL3IhEa1VvAmZtUxfbx
X-Received: by 2002:a05:620a:2481:b0:6ee:b28d:800a with SMTP id i1-20020a05620a248100b006eeb28d800amr4316169qkn.129.1667084080602;
        Sat, 29 Oct 2022 15:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667084080; cv=none;
        d=google.com; s=arc-20160816;
        b=yAF0QnEFJVy0YDrb7hOrVBBALcHbtzOVI0vkMTa6VhfzsLJQ6IB2wl9e/mLrTtGP/p
         GcCzjsnp/IFZNlGvTVWeby+ldD2zc42pCjFCKZBwCj5DO5Te1ZRzGKE5a7LuM2omhyA2
         p8mCcX+NZ0U8N6WpO6aPpmH1La0DpwCLgWxzbYzStqdfWWsLGROcOCCvD12uS159Wk52
         H0LtXO/7I4sVRLgvSSz8EjwPv8CYP8UJHc7s/YmEcXdVtN/ArQkblQaTyuqj3ZStaOhF
         llKGNuR/q1U1z6Hlh3ylMbHIx7EPPVK8+Vtes35hwIDAlQ8lrV08r6kxbc179JPASAK/
         kG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=3pKeEZ0JMfye0Bg9di1PMQYnQ6Qwa+kKvoW2lwtGtiE=;
        b=f1gyrycsPTNFvQE18Bm8orBdTDLFav2Ct8J4c1Hq89yQKqz7V/3vZlTLHYwrTzaa7w
         ggfjYSuV45FB9pFxwjzBL5sENY+HPZiEZtn25k++/UXdD8PGBXNjLEDHrdc1/GQHbOAj
         31JQyfl3iAOj7E1VmotXYc0rPq2Avxxibw8W7LS7PtxZi8TD6Moir+5Y5YL5+jXmGnhs
         EFdK6GRToE4fF9V6n5tyL0efEezpsymda7/HrpufO5CLL9A/sWKWT0b+L89gMg55u2Hs
         UH3ZJP3q4iGayz3XH7ZDjEhoEYDUqTzEB/seCEBC2kJdnBuwEhAGGiHbHcqrF8ndFjO1
         bkLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cgf8ips5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a79-20020ae9e852000000b006f9f259ddbasi1418839qkg.344.2022.10.29.15.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Oct 2022 15:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cgf8ips5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oouiY-00062v-Fu; Sat, 29 Oct 2022 18:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouiW-00062N-Nz
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouiU-0004Wx-UA
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667084054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pKeEZ0JMfye0Bg9di1PMQYnQ6Qwa+kKvoW2lwtGtiE=;
 b=cgf8ips5r7xZ3gw7COuQEtrncKAhvpTuXgmAiyObZYMrbUkyJ2o6IqAtgOoGmU6sEGnKwy
 XCL2Lu3LfIJYiKeSn5PFrIbhYJdGmNz5gkL24B9THfbBq0FFrV9NV0qK0pracTftDW9FR5
 iqzxp6Y/sPyijBF4eLIqZm9IY2GQ5ho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-psNCyOfEPdKIez0pVj_5yA-1; Sat, 29 Oct 2022 18:54:10 -0400
X-MC-Unique: psNCyOfEPdKIez0pVj_5yA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50D6A85A583;
 Sat, 29 Oct 2022 22:54:10 +0000 (UTC)
Received: from [10.64.54.151] (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFBD2140EBF3;
 Sat, 29 Oct 2022 22:54:00 +0000 (UTC)
Subject: Re: [PATCH v6 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maz@kernel.org,
 eric.auger@redhat.com, cohuck@redhat.com, zhenyzha@redhat.com,
 richard.henderson@linaro.org, shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
 <fcf82677-dd16-82db-c502-a8baf35192f3@redhat.com>
 <CAFEAcA_XVOKS1mDwAMMiUeeo8CeeO-GCXmXECAJTP7Ys79bnAQ@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <a95f083c-cea2-193c-17ed-c1212678c365@redhat.com>
Date: Sun, 30 Oct 2022 06:53:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XVOKS1mDwAMMiUeeo8CeeO-GCXmXECAJTP7Ys79bnAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VUlbGTvwgdwa

Hi Peter,

On 10/29/22 2:06 AM, Peter Maydell wrote:
> On Wed, 26 Oct 2022 at 01:30, Gavin Shan <gshan@redhat.com> wrote:
>>
>> On 10/24/22 11:54 AM, Gavin Shan wrote:
>>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>>> are floating on highest RAM address. However, they can be disabled
>>> in several cases.
> 
>> Could you help to take a look when getting a chance? I think Connie and
>> Eric are close to complete the reviews, but v7 is still needed to address
>> extra comments from them. I hope to make v7 mergeable if possible :)
> 
> If Eric and Connie and Marc are happy with it then I don't have
> any further issues on top of that.
> 
> NB that since softfreeze is next Tuesday, this is going to be
> 8.0 material at this point, I'm afraid :-( (Softfreeze caught
> me by surprise this cycle...)
> 

Ok. v7 was just posted with Connie/Eric's comments resolved. Marc
also provided his r-b. Nothing is really critical since none of
the patches fixes an existing issue. It would be great if it can
be merged to 7.2 if we are fortunate enough. Otherwise, 8.0 is also
good to me :)

https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00693.html (v7)

Thanks,
Gavin

