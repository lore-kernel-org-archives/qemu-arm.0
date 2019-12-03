Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1088182lfc;
        Mon, 2 Dec 2019 22:06:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwg8LXGu9Gd+eHThndWhVY6oZMNHFq9EuufH445oa9pEoXCbv6dO/wTBS1//PDz2xoIMmG3
X-Received: by 2002:a37:a3ca:: with SMTP id m193mr3446702qke.217.1575353164134;
        Mon, 02 Dec 2019 22:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575353164; cv=none;
        d=google.com; s=arc-20160816;
        b=qG8j6znEtKgS0fS7iRUaC1oWBdWbtG0o5UOx70icKyuhzsPWwB8jbxExKNygMGXLDD
         M9I+bkCcxGaOUxA60pL1/bGctlleB+uzp6EHmS9kw7FdoBhFopMKhr1J63K2OJ2Gzhwf
         FTfJRyr9Z//1FhkU016G1jXlvpaHClY4I/a5tSX3sdx++hhd3H/G8h3TIJGj4pNJkNrz
         exMEH7mctWpc+0+gpl5Dfncl4xEcEX03g1vXE7E2yVoinSY+JhR9a10LkaO7hpN+bDt0
         mAQLuGazNk7dnuLwi2k5XA93le17mAvd2b7dHBI+cNhQ0PJrIcRKhplSLqhpdCt45uEC
         mh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Uvedzpt4OkIgx2yiLQUlMfryhKEnzzdOmhEosWuDBL0=;
        b=m2XI0Unz3cEeqbNUmEv8xwQMQaKyBUiK8PBQH5kskidUuLr/SYeCO4w4W4lHix1w4q
         h0edU1feqG83O6HcIpR//bcD/fniKlMfaPMwrS0fEzwCXSLlVUpUSagPISXlRP/rU3ju
         HXSH5lW7dRfE8SPvGA90yaOyNPIP55gp0SOvGIoLmPoWRLtyRKLm6W42y5hsYP0FTA8m
         D5fcXkKwyt3G+dfXvPlJgW99e9HMiD8PDfQ/8qEmXByOY7/NdWCAc/cDcpuD7e3gXG7a
         jcpBO1zGQTHOH0lTywhtZ2oBt30Yy4egFk4/x/aG1oY1QEGSkfEQT4OScWv1kuq2is0h
         invg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c43+a1nN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1427876qkc.333.2019.12.02.22.06.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 22:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c43+a1nN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic1Jz-0002Tl-Gr
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 01:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ic1Jj-0002TI-6v
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ic1Jg-0005Hl-LN
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:05:45 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47499
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ic1Jg-0005Fc-FO
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575353143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uvedzpt4OkIgx2yiLQUlMfryhKEnzzdOmhEosWuDBL0=;
 b=c43+a1nNFnnvJu73mRFRnh0tKF/Brq9vvjIA4fnJAYzd9OUEqQMCgXG1iKybWQji2Cx79V
 bTCbtA6ry7hFJ7jZqkPn1OtpTx729q9BXfpvPBAIZsb1BRGJe1Oaxv8mlYD28fNh/v9zlB
 rxDE6emjpv2619RXSd7+pAEHAnicdeY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-XR4lizlWNgS93tHlJsWgRA-1; Tue, 03 Dec 2019 01:05:42 -0500
Received: by mail-wm1-f69.google.com with SMTP id n4so548015wmd.7
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 22:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uvedzpt4OkIgx2yiLQUlMfryhKEnzzdOmhEosWuDBL0=;
 b=NUsG4h6lj5n9fZLhDoClUrA4KPLBnqARWuZW7Cq1BIR5NyGaJ9qmBD1ZZ5rbsHmQzk
 c6UYlP1AZeIv9kU6QfAiP0i8imXLBHv2MpLFVmi/bci/13HCS7FjTNeiWrB/fRKtErmr
 1JIL1h31Dnd2gceUCCgkg2VNl5OQ7YskkqRZ7FlqGFLhM539i8H9KJirHNjDvQziRm9h
 jSMeZ/IqYRPBhZnDoy0WpBUmDLsHRDX7kLMf3fx68yfkh01f8CVwiA/in6DQkCq4m5DA
 InDBqvoHh1JKp0aqp9tmRJrroCQt8yjJdCxnFQpewo/GWoTpeOIM0dMG0C22VkzO+cYY
 NJ4A==
X-Gm-Message-State: APjAAAUcARjcFRNBP17g6GVZSUMWNl7+Vq2skd/XbHPP1susqkVXincb
 ZOdPHZiJdcENC7W+8lu5//tb4mlB0Gjoze9ubq0j8trt5jd57Q+DG92pwOAbsWSsuuOv+uVyOgg
 M3e5T8xPhTMqk
X-Received: by 2002:a1c:6707:: with SMTP id b7mr28806157wmc.54.1575353141380; 
 Mon, 02 Dec 2019 22:05:41 -0800 (PST)
X-Received: by 2002:a1c:6707:: with SMTP id b7mr28806135wmc.54.1575353141122; 
 Mon, 02 Dec 2019 22:05:41 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id n188sm1991006wme.14.2019.12.02.22.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 22:05:40 -0800 (PST)
Subject: Re: [PATCH v2 0/4] Expose GT CNTFRQ as a CPU property to support
 AST2600
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191203041440.6275-1-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6540201e-b8dc-753b-cdaf-5d7da8716714@redhat.com>
Date: Tue, 3 Dec 2019 07:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203041440.6275-1-andrew@aj.id.au>
Content-Language: en-US
X-MC-Unique: XR4lizlWNgS93tHlJsWgRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vygdvB+LnkAh

On 12/3/19 5:14 AM, Andrew Jeffery wrote:
> Hello,
> 
> This is a v2 of the belated follow-up from a few of my earlier attempts to fix
> up the ARM generic timer for correct behaviour on the ASPEED AST2600 SoC. The
> AST2600 clocks the generic timer at the rate of HPLL, which is configured to
> 1125MHz.  This is significantly quicker than the currently hard-coded generic
> timer rate of 62.5MHz and so we see "sticky" behaviour in the guest.

Glad you fixed this! I hit the same problem with the Raspi4.

