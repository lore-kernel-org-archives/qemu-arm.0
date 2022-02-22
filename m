Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3633268lfq;
        Tue, 22 Feb 2022 08:13:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKsUF48rKsEgv35igccTVPp4H9KecnwUwGx9RWtgz/07KRORaCG5FfpJf2Y70cHJNfiNMl
X-Received: by 2002:a0c:fe88:0:b0:42c:aa4f:d757 with SMTP id d8-20020a0cfe88000000b0042caa4fd757mr19946765qvs.80.1645546437234;
        Tue, 22 Feb 2022 08:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645546437; cv=none;
        d=google.com; s=arc-20160816;
        b=VHNvytQ65SK31cr3v/QE4Qfqe9nfluFIxAvDOZnRqiBqKdDmefiJb9AR55+TjJSyBY
         cRR2k7Gzj6AQVUvSlLa+SN37yI1O9IW5JWzHzR+Ybc39Xxu4f9PHrLzfcn3RwirxIMP9
         p6T3WXgGzKFM5QWN2bNgCWLSrUssgN1XOJxr2mq7uPFGj731TPo8q3Hi4y+S/Q3V2HHS
         GbVnh0kGGg2Ii1VGExloX+E18uANJdtN4dCLjsYjoMYT7tl7D2QF8fKzGpx34TyTM1hI
         0n1Ov3iSuptRFAfLmDADVEHDWt/1JI5cZ1vtIiy1Hrf/WQGZHC07fCZBFeLoxM7h2vnR
         WX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qlaWVc/vNDtKvm2S6bX7pn9pgZmm31DA5+ogrd618uU=;
        b=rfex8+PZcRFn38we8hPbOPBIOEfQLQiab7mykv/Z8GlWJ3WgnlTFmn2GkIEUTQulsC
         InJqWvx71Tq8V2q4rOJf1aOr1N2UglIte92l0ItVL3Cdnhc9F+mc/2ivr5M0VX/cGeWR
         oIfKC74Pp4ScMj8JPVaJsQSMag98TfRbM5rsqgfwTg50VZLbc2Ivavm4fsjCNDk7FKdN
         uOpkSbpGlIw9VvudHFx3pS5nLGVCosEP4baNVCvhBFpzQNJ3EHMjgaDrhJhQB9STNeZ4
         TJWV97SLaFXl6pFcq0PVNUlX3093oTaD53WFdCY+RCxC5De1GRlS0AZhLeWOzqvxOksS
         069A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=nIc9j68E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm9si16187qvb.407.2022.02.22.08.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Feb 2022 08:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=nIc9j68E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMXnY-0004zt-M8
	for alex.bennee@linaro.org; Tue, 22 Feb 2022 11:13:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMXOX-0001kx-H4; Tue, 22 Feb 2022 10:48:05 -0500
Received: from [2a00:1450:4864:20::32f] (port=50917
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMXOV-00010B-Fc; Tue, 22 Feb 2022 10:48:05 -0500
Received: by mail-wm1-x32f.google.com with SMTP id y5so1393150wmi.0;
 Tue, 22 Feb 2022 07:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qlaWVc/vNDtKvm2S6bX7pn9pgZmm31DA5+ogrd618uU=;
 b=nIc9j68EiFtj4ldMDpWMQgqLF2XzGP3r/exxa6m5yqh5noib7rgIIwVWc0i+Ry03e2
 YME8rfO7oSUJkQ0cvjCggsTGBvJt53Tnd4M8I5mdtcxtl4T0jfhSIm92zc6pnjqoogUn
 ov9AekAQezFptS5rQsfy5HDvknm3GJUVGJfOW3odzfl8ApYJJ7mBxDEttRU4G5aSppFN
 xwV05SVy0iqvwOnmCOLLhI4b3rkNYZpX3pNlnShCvxMXfROAYMcL5/xUAk29tj+/vApo
 nGVTA3JOwj4SLRcZd5hKCgD+Nx0zV5zN9MoQmg0Stzu3TooZ6tMVIvI+XMYzwaBZtK10
 qydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qlaWVc/vNDtKvm2S6bX7pn9pgZmm31DA5+ogrd618uU=;
 b=dR+lt2hlL+MA2vtN7qqPUNmCHXqfkSJmex5DPr0oyNsx/8wxoZo5OnZaiITPia4tjp
 m4KNnnpTFEUOF9bLPfLrpDQWjlonuSsJiXlF9yauhRJZjhQohdScB4NA/Ryq7MBYQxlE
 LhWEFgX4K1Fy8DcCnTwkDGI/QimiWiuVw3qE2G06iQbMq+EWOJpvS8kt8abxzDK7IBp4
 ovp7tgUaJT+dCuSEgZ3/dJMyHufvz+i3FjLZUaB+nw6kPjNkHr/3ddLEmdXNoLnpPtP2
 8sSSt9otuTLFvWrRm02ZunWiG2jhGIHWLRKAEun9zPFSriSm8KemuD9slhcy8uR1TJHo
 fd4Q==
X-Gm-Message-State: AOAM533mCygklipg/CekUNnIW9IucA9G3ZyiUNW/mKW/RT7pyghUbIv+
 vZ+SJsg2fcNUCXl4CXbu4uMz//kmPXg=
X-Received: by 2002:a05:600c:2f01:b0:37b:aa49:3864 with SMTP id
 r1-20020a05600c2f0100b0037baa493864mr3885439wmn.74.1645544881267; 
 Tue, 22 Feb 2022 07:48:01 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id x11sm1133684wmf.0.2022.02.22.07.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 07:48:00 -0800 (PST)
Message-ID: <619d37b8-fbc9-250a-4e5f-d37b972b62e6@gmail.com>
Date: Tue, 22 Feb 2022 16:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org>
 <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
 <CAFEAcA8OMB_+rxrS1pk4YJ0avj-ZSdyEROJyppOT1+0s6447MQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA8OMB_+rxrS1pk4YJ0avj-ZSdyEROJyppOT1+0s6447MQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WjAVWvv/EzxL

On 22/2/22 14:06, Peter Maydell wrote:
> On Tue, 22 Feb 2022 at 12:56, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>> On 22/2/22 13:02, Markus Armbruster wrote:
>>> Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
>>> the RTC supports the event).  What if there's more than one RTC?
>>
>> w.r.t. RTC, a machine having multiple RTC devices is silly...
> 
> I don't think we have any examples in the tree currently, but
> I bet real hardware like that does exist: the most plausible
> thing would be a board where there's an RTC built into the SoC
> but the board designers put an external RTC on the board (perhaps
> because it was better/more accurate/easier to make battery-backed).
> 
> In fact, here's an old bug report from a user trying to get
> their Debian system to use the battery-backed RTC as the
> "real" one rather than the non-battery-backed RTC device
> that's also part of the arm board they're using:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=785445

OK, thanks for this pointer.
