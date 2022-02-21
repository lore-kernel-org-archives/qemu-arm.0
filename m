Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2964241lfq;
        Mon, 21 Feb 2022 11:32:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLV+1Pt6z417H9xgKu2JaxSp/v8ztDWkDY4MvW87VUzonWz+oX3J//2v9DMX0F75SYyjF2
X-Received: by 2002:a0c:fd85:0:b0:42c:1f71:daad with SMTP id p5-20020a0cfd85000000b0042c1f71daadmr16869584qvr.34.1645471976332;
        Mon, 21 Feb 2022 11:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645471976; cv=none;
        d=google.com; s=arc-20160816;
        b=snf1nZovw29XqUT6IgpGEf84ldfQehtf+3W79a651PMecPozAhw2Btt0ql/Z5yYmGS
         R2fj9WSnrFDT9aYIFXSasIps0lbkzxjyksnkZ40T1MM4qmW1RF1rXDV1n6b1tyt9Smuq
         cLoPFDxS4D8nP8elemP6FPbO7ajVpo5Gj/olZ8qG0fA/nA3pDwQzIeJuS2j1QpjPJCnM
         zf6ZaIS3PWjJIQc8VDRfK1zBDTP05oYBNh5CXOfXYJFa1XV/rZ7KFDvAPnSBN3JBXXF4
         wRrY7iMPtocnoRGnarTbxyUDvgtrVFFMObMlU6BJOavMWUmH1x+0/Y5LOEgxEeth0Cpk
         qhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qbxua3vSH5ftP1sSbsW8W5JmQTTxMq36rEIZymCJ+M0=;
        b=rUBLvhl3tQqvryj68/l+66FbbCeu63zyToEHJlohusWgtmlLK6PklIBUq2Kz3NISNj
         ajxdxfqGs8FIIk3RDfEC/Ax4BgfdrQf/jAkm8J4eABbL6SGmz9ga9S/c887XZAzfxhgS
         5fxOKsoWYs75IRBCcbEpE22NHJgJBQidcgWCXFWvw4F77BZ3zALZvKpVFEJxw1Si9Gpr
         JBegzweadTNj7nUH00/EGoiuAvg3+P1KZYRGNXuz+gKFk/9uBkkVS3FK4dzGNvIMAlqs
         lbGHyGyrXIi1+nKBWtf2JNvp8CReJWNHhmMJlT3nwQxQb2xpJUvUkOD6R40l+w+A1PlO
         qQKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YIk7JeIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu13si12576141qvb.234.2022.02.21.11.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 11:32:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YIk7JeIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMEQZ-0007kf-OI
	for alex.bennee@linaro.org; Mon, 21 Feb 2022 14:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMELY-0004Pv-AH; Mon, 21 Feb 2022 14:27:44 -0500
Received: from [2607:f8b0:4864:20::62a] (port=35407
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMELW-0003SW-Cw; Mon, 21 Feb 2022 14:27:43 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i10so13708023plr.2;
 Mon, 21 Feb 2022 11:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qbxua3vSH5ftP1sSbsW8W5JmQTTxMq36rEIZymCJ+M0=;
 b=YIk7JeIPbtkIpx6zn7xXucG81k5FaUlRT9gN3J8dS7espZkAizVPHNl+VUpYrxNBM6
 yBsyeaOWX3qLTh7k+8U8X/f8SJyRYch/iHgP7rxIBunt0AMRnnYs2cWtjCWVKgQp7dFD
 lfieldlp6a7eAMTeHJMrbi0FPpDz4tnmzboQdxkz+E0Viho89VYC6+C5rP2g+su2VS1t
 SD3f1NTqFHY5sck7Ws6Ks/AIJL8fPcm8V9jH/ZU7DfndB5Bwno2zGsaVFIuBkDoJ6tO+
 R+KCii3jLb/QSjAXwpdaoqVsj24a4EP27uOoCr7xSnZybH50ogKKmPoKnHE7TddiPVR0
 p0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qbxua3vSH5ftP1sSbsW8W5JmQTTxMq36rEIZymCJ+M0=;
 b=JzeG7oPS5UnmtPA+iUbLb+I6Wh69k6bHttmuLj6NcSHf+O5OyhOUn6A72jUTFtAAf7
 LJmFnJ782vSC2iF2cS4tGsQ1m7Hcxmxos1B81aLsLxppgcz3IsqFBFQ86vA40YIpQpjC
 N6HzrWy0xIlJwGngJY3RUf9eum6LOS3qAN0NrO9kF0EYcXFEd3IyHjATsJibcLFmFvoU
 hyl7Hjm90UV5IY8ffwL36eeST5ww/O14ukQfKDqmZt6HqgZofsHYgy6JZzUd+WU82RRw
 WBOs6cYYN99fk7ASTEuDm4hzcsu6NtyIEQGwqynjBE315H7pj0iCDuOQBiweAIB4qvFQ
 SCsg==
X-Gm-Message-State: AOAM533taCBQMWrHNHi2BR6ETpMTTJvuRzRpZQuEgqZOLtsMhdA148jW
 4fREjUc7ae/baQRk9GxwKs8=
X-Received: by 2002:a17:903:2490:b0:14d:57a5:a472 with SMTP id
 p16-20020a170903249000b0014d57a5a472mr20371906plw.17.1645471659643; 
 Mon, 21 Feb 2022 11:27:39 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 z11-20020a17090a1fcb00b001bc58804974sm130652pjz.27.2022.02.21.11.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 11:27:39 -0800 (PST)
Message-ID: <3036ce6b-a201-4447-fd07-64516e0390fd@gmail.com>
Date: Mon, 21 Feb 2022 20:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/3] qapi: Move RTC_CHANGE back out of target schema
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <20220221192123.749970-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221192123.749970-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 8w2wDPf5rspd

On 21/2/22 20:21, Peter Maydell wrote:
> This commit effectively reverts commit 183e4281a30962, which moved
> the RTC_CHANGE event to the target schema.  That change was an
> attempt to make the event target-specific to improve introspection,
> but the event isn't really target-specific: it's machine or device
> specific.  Putting RTC_CHANGE in the target schema with an ifdef list
> reduces maintainability (by adding an if: list with a long list of
> targets that needs to be manually updated as architectures are added
> or removed or as new devices gain the RTC_CHANGE functionality) and
> increases compile time (by preventing RTC devices which emit the
> event from being "compile once" rather than "compile once per
> target", because qapi-events-misc-target.h uses TARGET_* ifdefs,
> which are poisoned in "compile once" files.)
> 
> Move RTC_CHANGE back to misc.json.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: Greg Kurz <groug@kaod.org>
> ---
>   qapi/misc-target.json | 33 ---------------------------------
>   qapi/misc.json        | 22 ++++++++++++++++++++++
>   hw/ppc/spapr_rtc.c    |  2 +-
>   hw/rtc/mc146818rtc.c  |  2 +-
>   hw/rtc/pl031.c        |  2 +-
>   5 files changed, 25 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

