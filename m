Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2984954lfq;
        Mon, 21 Feb 2022 12:11:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBesFdR5t+8nQY8KlVR97BV2fptbaPnXjuuap1uKCSQSvGllFWMIC5p+wffGPYBjyEWtEO
X-Received: by 2002:a05:620a:4ea:b0:60d:da69:20a3 with SMTP id b10-20020a05620a04ea00b0060dda6920a3mr12516822qkh.157.1645474302992;
        Mon, 21 Feb 2022 12:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645474302; cv=none;
        d=google.com; s=arc-20160816;
        b=dUoP8E8mAaurDPeKZP6VO+zi5Lk0sYnspmAKQZMntKHmzTSFZzGcvtvd+R1ozXHjT2
         2IUc4OYdUh85sV0VENUMPcPw1LL35NaikokfQF1KfzqHw6wksU8NfilOJNEJNN1SX+60
         uRChZ908TJvY4QJCryjnLvibJxuU357z3pKUhrznHiV+swY4oxiqMlVFcFhJmSJ8DMPi
         fxki3NPQibXcpkvbKg6tGZI10X4g98pGpMWrzq6CQNDhOqm4e9yBlkBgnrGl+TmpiYss
         TsXEg8XiWg3KENbbvdfKVaKjFMuk7lJDgdR9Y+GkZhfcbSUgLHzIi1HIpmat0pc/nWsZ
         FNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XcpQnC12mGMa0T6Sy35EF6aR7AjZ5NjU6XBGVlQnwro=;
        b=kZRStDM/obaJ7fl8Y79IhfT4vTZl4tRvam3TeVMYOeC05glo8Wukw7ev+L6wBLT+ev
         EVfd9ENxTpEKfCMtHsfI7fAMv6K9n2BKc16QVYWtk7TKVa+c5paEV9bUouJBaBGccRph
         u6JSr+LRbGtvEd5UjgMlHa8EIkxVjhc4oiEU6J12H1N8ebNU2kunyimGoZUSnUKaTt3C
         mddEgYrA8LhCOi0AS40iyf/6YDDDbLUdCR6/OusXpSHWzHFxvL4a6XJo5Stw+2hhgfrk
         XsluP8D2uBT/MN0eYSXkojWMDDSl7oI3Lj2kealQp6PY0x/5wbCEhgz2LoqZ1I30YiIy
         MxZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S358Kt0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si10897035qvx.578.2022.02.21.12.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 12:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S358Kt0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMF26-0001Nc-GN
	for alex.bennee@linaro.org; Mon, 21 Feb 2022 15:11:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nMF1h-0001NB-97
 for qemu-arm@nongnu.org; Mon, 21 Feb 2022 15:11:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nMF1d-0001t1-7h
 for qemu-arm@nongnu.org; Mon, 21 Feb 2022 15:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645474272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcpQnC12mGMa0T6Sy35EF6aR7AjZ5NjU6XBGVlQnwro=;
 b=S358Kt0oaHaMFB40r3hxwzBo9cxBEYjVoyA2TctLU6x43m+y+hZHLOaZmi/FeqZZvo2j6o
 QVTlVrQNFjd1jTXZ4Zs6Z1H/72Y6Z/OhE32wzXqTOlaszcT2CB3CG61/jps6R06rsv+rhO
 e5cImc1rMNWK5qJP8LTq9oUdbzW+nCs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-pRHGY6VGMs2dWOVA7ZS9pg-1; Mon, 21 Feb 2022 15:11:10 -0500
X-MC-Unique: pRHGY6VGMs2dWOVA7ZS9pg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay41-20020a05600c1e2900b0037c5168b3c4so63591wmb.7
 for <qemu-arm@nongnu.org>; Mon, 21 Feb 2022 12:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XcpQnC12mGMa0T6Sy35EF6aR7AjZ5NjU6XBGVlQnwro=;
 b=RkfLO+MCWRJ12t2mKCf26tgbIJ0p4rOshrFGprfVPhoMqsd2EE9RJSPXhjQU2m/yLH
 CxiDwUXK5flh/pin/EcfzZs5ch8KhO+b6IYBYbcLwmgArc60HiCtkCkxQ5mlkxIofU0Z
 lJbHP10E0s6QFFamBgyUJEscwSETJmbD07EEqafp/1zHp1KgS2G4nMcwKblCKXdSkIxy
 BS6bAOv2RJPQacwvnHyEEw+/QHqwVt4WTFRvBwVUH0dWEUW1lFeJfwsXRFR5Z+6tKMKY
 MNtUiS29jYRqJU5kY4eqq+/XVlDvvLtbrE8IHjt5r/kqrIwxbj3SIq2VucOLzFyYLTHh
 4sXw==
X-Gm-Message-State: AOAM530t4BIxlosSjkP1ukArOZ/sE+bD0+I6oI979R1TGjVtzGIrSD0x
 h+769iReiM0bZsqa2zRxSIQgUf5iHa2j0samqFs0jr12/hCNBvsBUf1QwicDCl5EWxCdfxrC7fS
 uwK5fmcRo3Fuj
X-Received: by 2002:a5d:440b:0:b0:1e3:f66:bf59 with SMTP id
 z11-20020a5d440b000000b001e30f66bf59mr16801334wrq.250.1645474269695; 
 Mon, 21 Feb 2022 12:11:09 -0800 (PST)
X-Received: by 2002:a5d:440b:0:b0:1e3:f66:bf59 with SMTP id
 z11-20020a5d440b000000b001e30f66bf59mr16801322wrq.250.1645474269430; 
 Mon, 21 Feb 2022 12:11:09 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id d13sm32897295wri.38.2022.02.21.12.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:11:08 -0800 (PST)
Subject: Re: [PATCH v2 0/3] qapi: Move RTC_CHANGE back out of target schema
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220221192123.749970-1-peter.maydell@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <6875ffb9-da1c-7e58-4606-6bc15340e407@redhat.com>
Date: Mon, 21 Feb 2022 21:11:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zaDGDbjIQbgU

Hi Peter,

On 2/21/22 8:21 PM, Peter Maydell wrote:
> This patchset moves RTC_CHANGE back to misc.json, effectively
> reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
> the target schema.  That change was an attempt to make the event
> target-specific to improve introspection, but the event isn't really
> target-specific: it's machine or device specific.  Putting RTC_CHANGE
> in the target schema with an ifdef list reduces maintainability (by
> adding an if: list with a long list of targets that needs to be
> manually updated as architectures are added or removed or as new
> devices gain the RTC_CHANGE functionality) and increases compile time
> (by preventing RTC devices which emit the event from being "compile
> once" rather than "compile once per target", because
> qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
> "compile once" files.)
> 
> Patch 2 fixes some minor documentation issues for the RTC_CHANGE
> event, noticed during development of the patchset.
> 
> Patch 3 makes the pl031 a build-once file again, which was the
> initial motivation for the series.
> 
> Changes v1->v2:
>  * patch 1 needs to change the #include line for pl031.c, now that
>    the change to make that device emit RTC_CHANGE has landed upstream
>  * patch 2 now also notes in the RTC_CHANGE documentation that
>    not all devices/systems will emit the event (suggested by Markus)
>  * patch 3 is new

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> 
> My default assumption is that this series will go in via the
> qapi tree; let me know if you'd prefer me to take it via
> target-arm instead.
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>   qapi: Move RTC_CHANGE back out of target schema
>   qapi: Document some missing details of RTC_CHANGE event
>   hw/rtc: Compile pl031 once-only
> 
>  qapi/misc-target.json | 33 ---------------------------------
>  qapi/misc.json        | 24 ++++++++++++++++++++++++
>  hw/ppc/spapr_rtc.c    |  2 +-
>  hw/rtc/mc146818rtc.c  |  2 +-
>  hw/rtc/pl031.c        |  2 +-
>  hw/rtc/meson.build    |  2 +-
>  6 files changed, 28 insertions(+), 37 deletions(-)
> 

