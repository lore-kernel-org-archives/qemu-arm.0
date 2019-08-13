Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1000432wrs;
        Tue, 13 Aug 2019 07:01:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxc4nqSrgG/j08YJbSovmhVM4hDxXSNlr639cBMNM3nYpAS1kNfr4rTPqDFFVH3bUZ2+fg1
X-Received: by 2002:a1c:721a:: with SMTP id n26mr3275070wmc.88.1565704873614;
        Tue, 13 Aug 2019 07:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565704873; cv=none;
        d=google.com; s=arc-20160816;
        b=UHNzDyLQ6cD9dbRU0ACer00RhkSQQY24nMYBA2klUmAlQLiVciE8o+fbdBsQcyrmqf
         IQaHSjssFUCMdcCWbe4OjX8b/NMqQtFbkyI4s3v5MB7G878jHBmJMACBP0IxHaW/uSPZ
         ojrHqjvhA3dOIq1RA7rVQZhJNf6591xC13ZoJBGkEK098csf0vr22cpDc5N5Le8l0Iem
         20GfX8rvuLkGHODLPP8gc8ACky/gZ/RZ5a1ZKCMIQrctGpp0tlWI4gd/Ex151nkwPQUF
         3Jl2gmN0UP/8jonB7fTIKwSCv1P4evxrl4xSjRrL9M6zdwMS25Q/qRq8urItW+xXpvgN
         HM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=S2nzCLiSk42XqO7Hc9bFKIwIPGuATEaC1EipNq0MK24=;
        b=WIvATY+oNHu8spK/q4LATCoxXuR4swfl0oQWcU5Qc6cfVChdsu+caleX11cc8C2RBv
         HcBxXxeRbAL9p4EHWa5rT6/PK3PUPMoSIR/tCJj4b3MqvYdoCEcVsUt9HYGJdT+IzmCu
         KmXOx815iw/5TNDbnoN1KXztb0ujhHUPxTrsHQz+6lchyvgfRkv5d2nSS89AvA6i2mav
         AEnbHc6+c7L3VlaMJlm5tevliCJyeV0S0hiJNZRJ7BXSdiaZPJ7aCbucrjhY1PMkJ8MZ
         cJ+eSyoYI5in7jIbXwN9og68C+bDLV2qZ3U+FuhSLQD78xnKusLJnuDNtJh+kYaMopbC
         vuGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si44231335edg.400.2019.08.13.07.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 07:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxXMO-0004kg-Oa
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 10:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35705)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hxXMH-0004gX-Dj
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 10:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hxXMG-0002qg-D2
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 10:01:05 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:45473)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hxXMG-0002pu-64
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 10:01:04 -0400
Received: by mail-wr1-f42.google.com with SMTP id q12so17595893wrj.12
 for <qemu-arm@nongnu.org>; Tue, 13 Aug 2019 07:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S2nzCLiSk42XqO7Hc9bFKIwIPGuATEaC1EipNq0MK24=;
 b=BeLVuM7Giq1uEfCsOZDnRs7cX/RL+YwEn401Hybyy0ZBJS7enTKbmghWlOHUVf23i5
 U9i0o+GZfKx9BfYPVvMHkSOGWCkzzLnO/tKY2s/lU8ss5cu/8twyhT06v/wOW4UyoUMX
 95YvOL++rfoCAfnzy4uMWqLc1W4MAbQBJIKbLTdQNfFPdTc0Fqjj+ITSSXoVRtmKtm1/
 /J98W2R4WPRJrT7ef/lAFwBIOjZbX/G2I17nUiwiboYZvTrzbQqdUsG4D6s7BsCRGiEV
 Io20Pk4Wt/0T9ds8KdveUK9uohMbBT3S71yKxKWiwfLYGhHAziU0gFpXEGScUppMkpby
 +SrQ==
X-Gm-Message-State: APjAAAV2f5TU+e1fFvmh9tSNwfOtR70D8rcrk4rNs8Der1lJy/aQXuwJ
 Esi7WwFYDZafnsz7Vxe/+1q0bA==
X-Received: by 2002:adf:dec8:: with SMTP id i8mr5182289wrn.217.1565704863100; 
 Tue, 13 Aug 2019 07:01:03 -0700 (PDT)
Received: from [192.168.1.35] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id a2sm1370975wmj.9.2019.08.13.07.01.02
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 07:01:02 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <421f2fb2-6e8d-7579-029a-e8de726c6a5e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <56d102b4-3f55-7070-c012-56ad65138873@redhat.com>
Date: Tue, 13 Aug 2019 16:00:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <421f2fb2-6e8d-7579-029a-e8de726c6a5e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.42
Subject: Re: [Qemu-arm] [PATCH-for-4.1? 0/7] vl: Allow building with
 CONFIG_BLUETOOTH disabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oIzS+qa8zn+R

On 7/15/19 3:13 PM, Thomas Huth wrote:
> On 12/07/2019 15.39, Philippe Mathieu-Daudé wrote:
>> A series of obvious patches to build without the deprecated
>> bluetooth devices. Still worth for 4.1 or too late?
>> It is clearly not a bugfix.
> 
> I wonder whether this series is worth the effort right now, or whether
> we should simply nuke the bluetooth code after 4.1 has been released?

Well, perfect is the enemy of good :)

This series is already done and is an improvement to what we have.

Regarding nuking it, it depends on the Nokia N-series boards, they might
become useless without BT support.

Peter, as a maintainer of these boards, what do you prefer?

Thanks,

Phil.
