Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp1331952lfc;
        Sat, 18 Dec 2021 03:26:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc2A8crMwQDFgxa744uXLCp9xfbQ+p8dkz/VIJVUpjFbbUQo7hjVv3G1ytZ2aBv3qHR+to
X-Received: by 2002:a25:d157:: with SMTP id i84mr9808960ybg.703.1639826816372;
        Sat, 18 Dec 2021 03:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639826816; cv=none;
        d=google.com; s=arc-20160816;
        b=h39mYQ/aBiErotiZJxnBfbo4XizSdD8HoddTRL9f3blS/P9F6kziRwNJy5OMp2k4fC
         UtSFQrKooQJMked7sQn49KYxfmNbTkcPe44hgEmuA5zKfRBwkoZTkKpXvYJtOXIj63G0
         BcBK9mCXkyXxMyFASRorBBFc3G2WIvt07SdPIOvjNrpjBnCO7nYWuGEwAg8/WZ5f55k2
         kvIC3N/yHtvroSpIfVapfIjoIX/2iNBaqGtjwVdzdRAmqWk79SpttuVG0Ozdco1Qqvrh
         ofPMIt6M4WEcmdEvetadciSHLF8uynxxEwxk5eM+WmRUXbHCFk0rk0sUzVQdkUNxcHQH
         753w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NqYzEv8sjm1chLmdzkY6W+PLu2mXRaztXkZrhm+3WS4=;
        b=XED9384KLEvYD77HOlIqtf7kQ/aQnMLp6MyqKt6Q2lUTN8uCtYPydpAkCtTCzJRt9c
         ZMUet8FWp+8v+9yKMUD8sXzyRhXX5r6As9tGU7v1Am0MuiGpXYi921PLL9wd0nBRFBwI
         euh3t5VPFwGOClNvS4lTfKl3/piU0mNAM0xl2b4SC/m95ihNU/C67b6h3J7JbmQolT/L
         iow1/aYMUeYmuySNugh18NMqMvDN8P4v+IHgt/x640fN086r6LXRZxR90MAJZtqtu0+M
         QnguMX8r0vwDVbYN4PJySuU8hc0rKV7VV/0FRlxnBQB9DWgAQSFB+7eWDxoxqxNcjm4Q
         3Urg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S5R7G1X3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s126si10751791ybs.829.2021.12.18.03.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Dec 2021 03:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S5R7G1X3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myXra-0000lm-Rl
	for alex.bennee@linaro.org; Sat, 18 Dec 2021 06:26:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXrI-0000lA-1u
 for qemu-arm@nongnu.org; Sat, 18 Dec 2021 06:26:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXrF-0002da-Bx
 for qemu-arm@nongnu.org; Sat, 18 Dec 2021 06:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639826791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqYzEv8sjm1chLmdzkY6W+PLu2mXRaztXkZrhm+3WS4=;
 b=S5R7G1X3NFY8P4VlgbycXIkqEZDoE5PKUEq1Re3xJ+2hyQEKKZcBpZBTm64eK+6m1mQX65
 IvuGJnyMeTvoIBrdUJlxImz06+Qk1ZZpHrdNVHKp+TaNAl4othUenax4aEQ2YjG4vGUnOw
 tFSsGkMU1+YIqlUHlGl6GLmX8G9gijY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-C289jobEO8yH6xWoKOCaOw-1; Sat, 18 Dec 2021 06:26:30 -0500
X-MC-Unique: C289jobEO8yH6xWoKOCaOw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so4330102wms.7
 for <qemu-arm@nongnu.org>; Sat, 18 Dec 2021 03:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NqYzEv8sjm1chLmdzkY6W+PLu2mXRaztXkZrhm+3WS4=;
 b=v6FmIKx5D6hzNd1yBKPCyBZlx0m8jSyHqOhE2ncVHcYYmEy/fOSSD89XE7Cb+2eWGm
 KkKlExgO2IUAUfA4DqHwcxMugMlrGQ533iIngEbXjOPuUkqGE3FeyjXFfz0xxl05Z7iX
 FY+hQbQSOmjmdMdg8QZLG6/VYvM04RI0/aAkuJzOOGuI9Oy7lwaNwtIxe3a6CAIzQB5Z
 dwVHvfV4bJOset5ys0s/sFODCmnFwQblIUGMBbnkJ6LpI0SrsZqLrbbuEDZT1UBEqvkt
 iuKoeqMif08ja5wsVM9i6ALcz4AveIrMy/w814IrDxwdyKPnD82XCoZdHWb1Bi3kDEX8
 eKeQ==
X-Gm-Message-State: AOAM530WJA37E+fA4Oy3k0K08KRvSYln8ZNtWDRkQNaGSQwgVy/jvcGd
 5lEzxd6M40Gmmz7pRzUBJVftwep1qbxW2L8rNOwni2OF4/I+lC4uUwTZqNFEWf7obnS74avBJeN
 K1u6X9ggClUgd
X-Received: by 2002:a1c:f217:: with SMTP id s23mr13204827wmc.70.1639826789567; 
 Sat, 18 Dec 2021 03:26:29 -0800 (PST)
X-Received: by 2002:a1c:f217:: with SMTP id s23mr13204807wmc.70.1639826789361; 
 Sat, 18 Dec 2021 03:26:29 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m3sm3577798wms.25.2021.12.18.03.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 03:26:28 -0800 (PST)
Message-ID: <266f9231-3925-dba2-61f1-d5172e2e9fe8@redhat.com>
Date: Sat, 18 Dec 2021 12:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
 <CAFEAcA_UKFHT=PbwNtyqV4G2Vdw7LVUjUj_X_DZ5Kk6=yF+EBg@mail.gmail.com>
 <f07f6b9c-ac81-62a1-be71-6c82267bdaf7@redhat.com>
 <65d60871-31dc-1e59-3cb4-34a27e7af339@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <65d60871-31dc-1e59-3cb4-34a27e7af339@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZsOQV7Cea+gb

On 12/18/21 03:07, Richard Henderson wrote:
> On 12/17/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>>>>   #define MEMTX_OK 0
>>>>   #define MEMTX_ERROR             (1U << 0) /* device returned an
>>>> error */
>>>>   #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that
>>>> address */
>>>> +#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
>>>
>>> This is kind of odd naming, because MEMTX_DECODE_ERROR already means
>>> "bus/interconnect returned an error" and it generally translates
>>> into what at the OS level gets called a "bus error"...
>>
>> MEMTX_DECODE_ERROR is "nothing at that address". We want a name
>> for "there is something, but you don't have access to it".
>> Maybe MEMTX_ILLEGAL_ERROR?
> 
> ILLEGAL doesn't convey much.  MEMTX_ACCESS_ERROR?

OK, such:

  #define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */

alternatively MEMTX_PERM_ERROR.

