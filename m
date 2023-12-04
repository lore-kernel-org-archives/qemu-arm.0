Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2470490ejb;
        Sun, 3 Dec 2023 20:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG2pOBran3v+wm4R4JjlpiN++P8OdOxpohi6EiqxMdZHxb3tR7+013c5jM/9rm5I3BLuUj
X-Received: by 2002:a05:622a:550:b0:425:48f5:c899 with SMTP id m16-20020a05622a055000b0042548f5c899mr4240750qtx.124.1701665702053;
        Sun, 03 Dec 2023 20:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665702; cv=none;
        d=google.com; s=arc-20160816;
        b=zviopzjUpkA73RUwg97DDW0hNrZlDD7fCqBUAApeGVFBqnyWu57GMmugmi05QrNEc7
         iJ0kmLy5VCNW8nnnN2oX/CHxMsBRH6uxuhJgyKXFhLV/hL1Daq2MW9SWjVCORffLcB3K
         /p5CAapoRJK2fvOp6pHnr8NocsLpfP8Bn0oI5208RyyWFxOnkgH3eHBf8AD8MMj968bl
         ZyMPrZCRE54sOdgVKpfU3TB8RQunmS8MZMbOZvIsScO5wbpk9FATTvZcljPNyRi6XrvR
         SYV8Ti07W9itomyNkeQBT3lpVDs9YleGqN5FwkjN+Nt//D9Deoc6GQlRDYY4oP7CpSna
         rpFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Tjo6iUwbCcRTY8sn+MBPdkyi1mWYRvZ61wyiSN4A4PA=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=yJCaEA1A3NnFnPhhpY7OZnno/sEyg3qAlibZHnFxtBbd1MvonB3sKU9FvP3cMPG7ut
         Ffp1Q+xu2YcWYC4CylkZgNOD1o0xm/BugAZ2YHEAbZSBl2Wm8U/gLNDcYaQlk/pnQ+tW
         EJaJNK3nIH0ZUDV0CeN24k2iqbnJBmusx9QekiYwRkqUW45nQKEiX7Cqcm03VVljkA43
         86SnXBBzezY3EWBB9OkKtLrxfDphK4n3kfMNLz0I3XZmhFocmI07Tg+ShEF8suMV84BC
         6o3C+8vVD0MnLQtihiqV1fVru0if7E2xb3kizE5H+yaPDxGtgTmiZECsUH+xTxB68rAy
         jkmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XkenwDT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020ac873d0000000b004236f53848dsi8127240qtp.320.2023.12.03.20.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:55:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XkenwDT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA0yw-0004tL-Tk; Sun, 03 Dec 2023 23:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0yv-0004sk-7d
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0yt-0004xW-OB
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tjo6iUwbCcRTY8sn+MBPdkyi1mWYRvZ61wyiSN4A4PA=;
 b=XkenwDT+HzTzWfnf/d0++p0TVp6bpEMRJETscDO+NKKg5nSUukZnjVJvyBSEipRRrbJzRQ
 hW2wl6l86x+4agA3a6uOdsHiEddSe+/t6SR4bHF99vtkByXGS7gmjWUbZXhkS/EMwkoa6p
 WgiELumgR/gIsW+5i4P8252XplOb+xU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-l0c9GdITNlaCRZ352GmIpg-1; Sun, 03 Dec 2023 23:54:54 -0500
X-MC-Unique: l0c9GdITNlaCRZ352GmIpg-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1d0737b7262so4213775ad.1
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 20:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665693; x=1702270493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tjo6iUwbCcRTY8sn+MBPdkyi1mWYRvZ61wyiSN4A4PA=;
 b=NEu6qk1qvWRZeikYA5GKWUWTe/DuL6UmHd6HC76bR8H1r4ezNXtUdldxP/9Kow3Vau
 B8B6enPo0Q8RLNLwOU7I414QJH3LDxPcy60Pskk5LCXMcCQYq1jC39uMpYwZUmrmIVWx
 Dq97e+OhIpEcmL55e5+p/4RfrdhcmPJd6FZrj/9N9OmgEx4w2m3kJcCDgWDw69qq091f
 LlonTFkfIwcn5ibfpZlf0iKFhVkZTZoN4B4jabCQy4lrK0okb++x+eWijdkeze/v9YAR
 h+brhGonpsAXtSblZuRJDbURKz78OWgoPrYlWt5L/pEsz4cfYYyP03E/yHUbyJV7LiZr
 aiJA==
X-Gm-Message-State: AOJu0YyL4R6YTMG2bKByKB68jDyuho/aOMTr3NULwPbcItsr/oTuC874
 exuQn3xhWHMooq4Z0yTpNOfDJ2c5FzFUWqvK7BLTRiE6lQlKLRbq5xY55ayZnu33w5/qgredkW9
 zJBNbVVygoE1z
X-Received: by 2002:a17:903:41c5:b0:1d0:7051:d316 with SMTP id
 u5-20020a17090341c500b001d07051d316mr1392242ple.102.1701665693094; 
 Sun, 03 Dec 2023 20:54:53 -0800 (PST)
X-Received: by 2002:a17:903:41c5:b0:1d0:7051:d316 with SMTP id
 u5-20020a17090341c500b001d07051d316mr1392231ple.102.1701665692822; 
 Sun, 03 Dec 2023 20:54:52 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:54:52 -0800 (PST)
Message-ID: <cb51f930-7d39-4c43-a62f-780cc32b9896@redhat.com>
Date: Mon, 4 Dec 2023 14:54:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 13/25] memory: Have
 memory_region_init_ram_from_fd() handler return a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-14-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-14-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: K2CcE5TZ0mBU

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/memory.h | 4 +++-
>   system/memory.c       | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 

s/cpu_exec_realizefn()/memory_region_init_ram_from_fd()

Reviewed-by: Gavin Shan <gshan@redhat.com>

