Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6558548wrg;
        Mon, 27 May 2019 11:43:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfiewmxQ+P81IFLtntxGfQ5pL8WkkKSrL0J6dHhlYtoIx8XHvFItGPwL3uM3pajDqbYowK
X-Received: by 2002:ab0:7453:: with SMTP id p19mr20166303uaq.15.1558982621626;
        Mon, 27 May 2019 11:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558982621; cv=none;
        d=google.com; s=arc-20160816;
        b=ihFatFhmJYOTqJ3qzPwZlEeFn1Qt3i5dY7mesDphbVYNXoICMkRVNB9cRbr6VcDUhP
         u0M7hXFgh3zY3E1IImL3VxK9umCZq/qqXbxEWYnXi16s1wNjeF4PSmA3rEpm9xOtGryN
         E+hpm1pbVIfHAFvsyb9sUiV6/XMB+I8IDSeVwoTpno/v2sQxido2xQ3y4GhTNeHryDA/
         K3FtdgbavofqRHm7V/uxZvEb8IgSPBV7T8b5pRvIFVaQmoyPoi158+jooSir3eJWUKh7
         a28c28/6VbguoAF08cERxly0UQ8fRHGSRqsCDcsxAWG11CMQM3t6SgPGnkCTFHSFoasH
         yAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=UP8WzIlgEk5m8Eo7I18QMvjlHTepqvVJMK3l9mKAlxE=;
        b=HqO31FrqZVm/Rwp/d2jemDErINcKoIKVgvqYtuBmWAlrnpgZOcz0dCm068VC5nThXm
         oWW+DMO+iIQI8I1xxrpAd2kkg5FOPWBik6s/D1xAsqs9rkqpq9r9u4SU7SnHvKEWmuR+
         zQpM8zzJCt5mifrkZhiwnUvts2WFra5UuESa3L5ltgbNpmNW84ZMcfjKjXSvLkBDT7o2
         desXtJfcBFNNEM1YM8NL8z63Al7zFWEHHM2kZ3G/NDaJr1b1gIFFKBTR79N4U1gWTIMc
         HYrDWQw3IdGjMeSJEmVM1A0sOANGKFZQTEuoXLypXtmw8PUKP4bRYKVZu4acVQuHZKmX
         KnKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19si4294571vsq.190.2019.05.27.11.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 11:43:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVKaz-0005d1-45
	for alex.bennee@linaro.org; Mon, 27 May 2019 14:43:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hVKal-0005cq-Ry
	for qemu-arm@nongnu.org; Mon, 27 May 2019 14:43:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hVKal-0000ML-0r
	for qemu-arm@nongnu.org; Mon, 27 May 2019 14:43:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34039)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hVKak-0000LV-SF
	for qemu-arm@nongnu.org; Mon, 27 May 2019 14:43:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id e19so528536wme.1
	for <qemu-arm@nongnu.org>; Mon, 27 May 2019 11:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UP8WzIlgEk5m8Eo7I18QMvjlHTepqvVJMK3l9mKAlxE=;
	b=MBBx0Az5LblH7508ouSGTUO+NNVX2PhiSzmWXNCrZ0tg2viuqStPP1UfpJCvZo97uj
	Kmh2V+/KZy3mb/7extTcVgtlr3VwUtk3vHHsT6GD4QFSC6HbhLoCF2J1TrUj7fzlL50S
	u7AvMLxiGabMcYfugUXcdVYPXqmeTfv4ewW2TD+FpTgK6UKQ86Afz8lWYbU70dFZU2Gn
	N656fkH26YX8+ibsSQ6znvcY6ouqOssVUylwtfeQ0HDr1hI05dEfChIW0Gn/zI8wCr6I
	rT567BrNo5myMlGVy0eBq2/nS1uhCRPu/o+1kFLzzJt7CPyQ57nWYl65f57vOSf0yt69
	+ZBw==
X-Gm-Message-State: APjAAAVqhAdMBUP6YUC9LzlQT87pluuSo2qzxPhk7MwQwCiA+Gx9vLE1
	C+ST3UVbvMWiraaeRcgJ1wJyzw==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr287182wml.108.1558982605727;
	Mon, 27 May 2019 11:43:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c92d:f9e8:f150:3553?
	([2001:b07:6468:f312:c92d:f9e8:f150:3553])
	by smtp.gmail.com with ESMTPSA id x22sm511301wmi.4.2019.05.27.11.43.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 11:43:25 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190427141459.19728-1-philmd@redhat.com>
	<dadba93d-fdf3-25b8-b3e2-5b43a4618292@redhat.com>
	<CAP+75-UKFxtHrfzAF4G=YD6XDGcDVyvTeHdzYTvOD4vecT0feA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <08f3e1f4-8a4b-2115-d042-965a6978ea3e@redhat.com>
Date: Mon, 27 May 2019 20:43:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAP+75-UKFxtHrfzAF4G=YD6XDGcDVyvTeHdzYTvOD4vecT0feA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH 0/3] hw/microblaze: Kconfig cleanup
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u1Vio8ejMk8w

On 27/05/19 18:10, Philippe Mathieu-Daudé wrote:
>>>
>> Queued, thanks.
> I don't see these patches in your queue merged on "Fri 17 May", are
> you planning to include them in your next batch?

Yes, thanks.

Paolo
