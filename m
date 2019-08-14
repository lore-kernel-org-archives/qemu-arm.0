Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp784538wrs;
        Wed, 14 Aug 2019 05:48:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7qaN2/I3rDqq2RLhYatWwQAHPGSZHiMFfnPsjM7LIB3sjG5ISc4pzeAtuaJQB8HYqi2Px
X-Received: by 2002:ae9:f101:: with SMTP id k1mr38119302qkg.337.1565786927755;
        Wed, 14 Aug 2019 05:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565786927; cv=none;
        d=google.com; s=arc-20160816;
        b=L1saJTOBSRsDnGmdSS0V12o+MFvev9MY2bHbJlwxjFXUXURwGhHH2rKOUoOcnKHfd3
         5PvB+Tq51/fbLsNJ+OVG10GuUDS61lF0EQYy3OwbCtedzy55at3MFBuF3VBm0Bmvra1c
         WJ6n1tgXoAlGp0/YJuC/A8aOMSNuA9gcyZfqtHH3rxI8j3A1GE4JltZ7Jr51h5jnUcvF
         z3Ph/rGw+/s/EOZUYFFqDSO8XNwWQroPGIsAbxzIY0YAEpJJlgjAgTxSbk4VdD1i6Evs
         RwSszoESVu5GY6pYeqZnxJUlnx71IlM4BlnLjoyVD/0QXdTMDqBfc6O9hT1rChR+0mln
         dPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=GC88iupRSuNnyAPJpl7DNBIbadpWmmmmfnXyCOrnxdA=;
        b=soqx0drceQfWM50uG3z7qFzG7g7PygNHG6SL1i4zEelELsCWnTRN6wKbKr5oEeXK2J
         dflBcnsmotMshSEUCdZ0v6ZByvnpukqo159EHAk+ZJ5XIvRmcW74r5V67UuZKTDhvvQQ
         58z+JXM/4R9WREkzSk5PXx6XUd+nD+t/cxmwvkzCQWQIouoJj65/KnXwQWsGydF+3Q+2
         kz6yYzGRgt+CHpuyrAwqnnj1/mToqS8FeYBycLMk12w75pyxJCUCP3zwHDmoFusffLMd
         pBl1joMsar3CLxT8CHQYVBt4rIiKtb3/Qu49uQ6o4evQhw9q7IwT5+MNe4j9Q3JJ1Lnu
         5TAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x45si60439858qtb.369.2019.08.14.05.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2019 05:48:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxshq-0003r8-TC
	for alex.bennee@linaro.org; Wed, 14 Aug 2019 08:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hxsga-0002rM-NY
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hxsgY-0006IR-Qs
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:47:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35392)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hxsgY-0006Hv-LE
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:47:26 -0400
Received: by mail-wr1-f66.google.com with SMTP id k2so25124990wrq.2
 for <qemu-arm@nongnu.org>; Wed, 14 Aug 2019 05:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GC88iupRSuNnyAPJpl7DNBIbadpWmmmmfnXyCOrnxdA=;
 b=kyfixxO6MslFKa9gJggrUETKXVCvdePqM8ish+OWZ0f/1TSvFSJDBwuY7Lo0OQpZ6I
 7dqpeOD10ohDDg1iz4SGVU9JQ1uNbPF50I3TY/Esns4EePLvOpBFU0n4zh/nb0PvRdO5
 4hpu6WP0z+guHlQBXocGOCGJIK3TfwflkqTnD4olmTzZkjfk07dHBCxS+RZQ93zr7RgG
 S1IP2hFj6Qu5WDG5BA1Af6W6URjrkD7xXHkGMbJFoNsanVktaSski4uBZvxZcHLdDQtK
 zC3+ekuL4W8ozWzD3KzsT6g67BAHvOU/FnhAZKl19PI6XGOU3CFXFtGkxEMOQTL0FXHS
 0mgg==
X-Gm-Message-State: APjAAAXgMvRqnbO60rInsLyaQW6iC7C0JBqsb35SGAfufbcUBbxPP8E8
 TbvBrs599tuymg4slGm86bwIpQ==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr27046370wrv.237.1565786845734; 
 Wed, 14 Aug 2019 05:47:25 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id w14sm10127884wrl.21.2019.08.14.05.47.24
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 05:47:25 -0700 (PDT)
To: qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-4-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0ded162d-50cf-42f6-bfcf-a0d1b0d97007@redhat.com>
Date: Wed, 14 Aug 2019 14:47:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190712133928.21394-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH-for-4.1? 3/7] MAINTAINERS: Add an entry for
 the Bluetooth devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bzCe56/h6c0c

Cc'ing qemu-trivial@ to salvage this patch.

On 7/12/19 3:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc9636b43a..5d8f27d9bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1733,6 +1733,13 @@ F: hw/*/*xive*
>  F: include/hw/*/*xive*
>  F: docs/*/*xive*
>  
> +Bluetooth
> +S: Orphan
> +F: bt-*.c
> +F: hw/bt/
> +F: include/hw/bt.h
> +F: include/sysemu/bt.h
> +
>  Subsystems
>  ----------
>  Audio
> 
