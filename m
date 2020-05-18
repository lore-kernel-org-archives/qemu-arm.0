Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2933532lfb;
        Mon, 18 May 2020 04:13:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXWeWw6wBolxvxe0dBdL9q7VcpBU9w1so9g9iu+3v7Y4z4u5cPNStVE/Qar2hlyCeWmvdT
X-Received: by 2002:aed:3f7b:: with SMTP id q56mr15661927qtf.152.1589800401681;
        Mon, 18 May 2020 04:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589800401; cv=none;
        d=google.com; s=arc-20160816;
        b=cReegIOp8VJLkPMAwpNiiuyzt90vJQV80fGUFcxXbYzplY8l1G269qvTLoFEcmGZqs
         9Q0/mOPE0c0GQsjvPvUqPHCFgqFWSt80kLMRHkuDip5qd79wHQ/H+QKvmj91WvXSj9N7
         qA9DV5hEMDUl/FDDaKzLuR+EhJ2bU6wTVbw9SVy2Tf2kMal9Ds8ine20QDRhDItxo21o
         oUdsNLKuI1slb4xZ+etLBp9kNYNdRwEtRkkp/x3mAdYkVZqqclEsv+MeZQDP3nw78YRB
         ohDhUp6eeXDShwQNZddULHzf/pYUkvegb/9BhDqi78P4aUsa/g9wNnN780F2Ry/9MBbU
         s4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UCfIlQydaij2SjlGv4c506nsNsyE9ecXqfPWb2n/UtA=;
        b=K9nm6ToSd212dY1V6XPhHIm1ARGWezvyBWf3rmomwPwuvuneI3pTRWHKS2L6f99ieL
         Vb21VHhB2Gq6wqR51Qwpo1V2tkTfL+j+3sbi2tgc3TwfDG002zNrCKYxLGWEYLsIejPE
         FrIunp0M419zLcGR9m/PKsKSCnvNlXcfhK3MsV6b1h/fXMtR5gpiQ/dh+/wbIGyImoMv
         S2Sm/h0LpbICstkGIPLuLaSkbkdRPEDpRE8h1RANKEFAudQGKKgA9Dejgg9h61Xk3e4m
         7SIOu7wyiSljojCFqYcP8+7RRdXCrkFE+pPlNeKaw3piCWwXAOSzgR/yPNuNcboFfglK
         wuhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OZDqc7sK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si5331548qvx.50.2020.05.18.04.13.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 04:13:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OZDqc7sK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jadhx-0006XO-6D
	for alex.bennee@linaro.org; Mon, 18 May 2020 07:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jadhq-0006X5-Si
 for qemu-arm@nongnu.org; Mon, 18 May 2020 07:13:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20585
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jadhp-0005hK-IT
 for qemu-arm@nongnu.org; Mon, 18 May 2020 07:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589800392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCfIlQydaij2SjlGv4c506nsNsyE9ecXqfPWb2n/UtA=;
 b=OZDqc7sKTKwj3jYv+D0fRp1rumE0nMTid8vs3ODPwj2ANiSuNXp2E09OJBjAN21N/kOLaJ
 8/3qn+IYEfSlZWR6FfSbxRsezOjdbMCF+vOjufsUgQ7nEqI7kmWBo+RGb2cb6lTSWs19Ej
 6iVRPnKH8xAUHnmtRcZEb45BMW1xELw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-O0Fs0OCBOIezTo92tjyPhg-1; Mon, 18 May 2020 07:13:08 -0400
X-MC-Unique: O0Fs0OCBOIezTo92tjyPhg-1
Received: by mail-wr1-f70.google.com with SMTP id g10so5510781wrr.10
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 04:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UCfIlQydaij2SjlGv4c506nsNsyE9ecXqfPWb2n/UtA=;
 b=QyHSNFkjWilHC1k4ZV73G8ogy+cB4kmcjtrxvIU7y/2HJfIUELCLJuoPzbbGd4CSxc
 4CGJO8tC6ezyqKlp+a4ndqqj/M+rRiuV68Hncf1Gv0zm9QCMUWAck6W/oric0S9oOW0W
 q+8ck9Ni5pXEE7Y7PGv3MsGC3cDbb4krpLTW1rBEp7Y3wremsqmewCrsmCRE17BTH0G6
 VyZuKTFvBWNgvUgjjkftMiXHkgcA3oHrjq2d31uhm9PiGhePnF8/b1gCmGjKMAPdLeL+
 mW5Yq7ekwCc9VE9nJjP7TJEWbvkQwrOnr3XgoCalXqe3yTMe3g2vFWk892NKMFwnAhaK
 tXzw==
X-Gm-Message-State: AOAM532345T4lj0yYVYwyCaF6lWvFC7ZN9KnJqa7J1lVihOriR1YbjgF
 R3g+crbHFPHM1F9QGkk6pbknnXhbR77CO8NEPrNjYrF3p47xd1M/d2QkiaEKRkGbWXw2Bn6VMR+
 5OoQWkVBD3GsU
X-Received: by 2002:a5d:6286:: with SMTP id k6mr14874038wru.123.1589800387251; 
 Mon, 18 May 2020 04:13:07 -0700 (PDT)
X-Received: by 2002:a5d:6286:: with SMTP id k6mr14873993wru.123.1589800386906; 
 Mon, 18 May 2020 04:13:06 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id f127sm16757511wmf.17.2020.05.18.04.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 04:13:06 -0700 (PDT)
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
 <CAFEAcA-FKUHyG=bgJqPG49WZDXV8JGQqqZXOw49C8_h9mYS5iA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8daeec76-0851-54a3-d84b-67a6019eef85@redhat.com>
Date: Mon, 18 May 2020 13:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-FKUHyG=bgJqPG49WZDXV8JGQqqZXOw49C8_h9mYS5iA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oG/ec0YQlUvU

On 5/18/20 12:30 PM, Peter Maydell wrote:
> On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> xlnx_dp_init() creates these two devices, but they're never realized.
>> Affects machine xlnx-zcu102.
>>
>> I wonder how this ever worked.  If the "device becomes real only on
>> realize" thing actually works, then we've always been missing these
>> two devices, yet nobody noticed.
> 
> It depends entirely on the implementation of the device.
> If it happens to do nothing in the realize method that
> matters (eg i2c-ddc has no realize method and does the limited
> amount of initialization it needs in instance_init) then the
> device will (by lucky accident) work just fine.
> 
> We should really ideally have an assert() in the DeviceClass
> reset that the device was realized, so we can keep this kind
> of bug out of the codebase. (Last time I looked it wasn't obvious
> exactly where to put the assert now that we have both legacy-reset
> and three-phase-reset, unfortunately.)

Your wish came true in the last patch of this series! #24:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg704239.html

> 
> thanks
> -- PMM
> 

