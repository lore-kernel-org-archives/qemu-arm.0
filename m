Received: by 10.223.188.70 with SMTP id a6csp4984509wrh;
        Mon, 28 Aug 2017 13:45:46 -0700 (PDT)
X-Received: by 10.84.193.131 with SMTP id f3mr2211746pld.50.1503953146775;
        Mon, 28 Aug 2017 13:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503953146; cv=none;
        d=google.com; s=arc-20160816;
        b=BdzsalAYFef3dlWv16/X/x2yz28Hb51dGCwIkGJKTxyEg+/cCGq6DmFqI/HMO7Bdhv
         2ErDm5obLab4SkD5tIi48cZ0344K6oxSirOH7dunELe4Rf0xPxUw2LyoPhuMjsjFMBOQ
         oDf2FMsp8O1prLyQzturLC8z9IJmyNQfHLZm3Xl5D7Ny9ivrphJn84f3Dl66hSStgDbG
         MH5Qr6sFK4wjtocbZQEB07Ku1qTkXA5CL6Y5RsohdjjSUYPr0l9IPlXfUSLktGBaY8uj
         UN7YXWiDxoBZaqNAdoztOVVafGrVFewSp+uVZfUeHg6CqQ80yfh1J7Gh+dobtDwaMTWg
         CXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=fAZxB6alhsZN2rl6SzmfkXg+pG4cxsev+NTypUhbmpg=;
        b=nDXPuBouygu7EmV2V6ZOYu/PQKAnFPztT3BqdrsAEx9pQp24UGDkOtfryvc+oEg/JA
         7z5sUtt/RiEgxHxtvAipCJ0YsWfSSg8UP4SfYcYo3ha7BIphhhZAjglCAjeTUP5ilQsa
         fcOLZobepwgfU0GYHRb4zopJ2X9Si0f87pceYkZhnFlC4YBhwgVYja8B83jqeo5JeoI0
         aNTDbGu5OPg1h6I1+V4dxmLYX1uHXLRPxmwSOAmx4laerM2WhYpm83PsTqElMbbRzWul
         2B/q6mVoVHcBuVgf6HmCd4D09m6W0dC40M3vcGmG22FiHbCPsoh0wHeixz7XNjgGIXcR
         h0Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ICLLnLBU;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com. [2607:f8b0:400e:c05::241])
        by mx.google.com with ESMTPS id 15si931603pla.679.2017.08.28.13.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 13:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::241 as permitted sender) client-ip=2607:f8b0:400e:c05::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ICLLnLBU;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pg0-x241.google.com with SMTP id 83so1151042pgb.3
        for <alex.bennee@linaro.org>; Mon, 28 Aug 2017 13:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fAZxB6alhsZN2rl6SzmfkXg+pG4cxsev+NTypUhbmpg=;
        b=ICLLnLBUGSZj/mcDN/vrkM1gWCpO9QZnEEZFmtuOY5pXrBqRO+scenpkmeKXI4Uyx5
         GIscH3WtyTFh2J+FGPQROzFCin93L1P7tDivEkx2ny/Min5T2GHXJmmUlq/i3MBkJ48k
         PUAgUZgnB+jBY8rY7VcB4BnF9Pl5yNoA6cP1k29w0ucw832e/ETOBoLLxBhOXg6qcrhy
         TFU2arTemarJj4AxPYQ+uTdkGHpyokgd3lJyIgxE/l8QKPe1B4Mti6j+bbTKqIUmJ6gM
         qYZp6jCShIvRS1kTyhka8l0wBkct01lXuTUgfvB+ktmum15/flXF8UQqciD1vZaDKdyv
         e1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fAZxB6alhsZN2rl6SzmfkXg+pG4cxsev+NTypUhbmpg=;
        b=p2P408Sk2gm3lkLx89AXbwT/MPaCUR9vb0gWx25XvZ8mQ5Iz5faxYwqqFQiTDe3z58
         lDUZaOQf8CsWBK+wNPBiBIAdURYmDwi/1YoadnoV+QpqGSmBuCkt4i9Yl+Kib4TY5s60
         sJubWXKO3khtSli88kiZpEXLtqVbKD7swHv/bN5MHTekIEgW7ZyRoAh4ciYvGUDtQGbV
         9RoVzdeSk12mSzqifk8gv8JwuuNIvmtLYO7p1xbtOi9m7+ZMHWeT0Jr0IAXlsKRvdjML
         xbHAsqK6n2SAHhbXYqfT9YhMUBjqBbZeql7qs90viSIE5CfAGfIf/ArdCwp68T7Vk06h
         ZkDg==
X-Gm-Message-State: AHYfb5j55jVLHDfzNMRuOfPYGsUDp2XByn0TmW59I7RtBjwld97jbT96
	IJYhEWUCwyrjIQ==
X-Received: by 10.84.217.200 with SMTP id d8mr2302068plj.264.1503953146242;
        Mon, 28 Aug 2017 13:45:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.googlemail.com with ESMTPSA id i187sm2412283pfe.67.2017.08.28.13.45.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 13:45:44 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC v2 PATCH] tcg/softmmu: Increase size of TLB caches
To: Pranith Kumar <bobby.prani@gmail.com>, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
 Stefan Weil <sw@weilnetz.de>, "open list:Overall" <qemu-devel@nongnu.org>,
 "open list:AArch64 target" <qemu-arm@nongnu.org>
References: <20170824155849.30799-1-bobby.prani@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <14b3bf90-2c45-4c6b-3c26-9422eaeff88d@twiddle.net>
Date: Mon, 28 Aug 2017 13:45:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170824155849.30799-1-bobby.prani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: taPgdpOalaLJ

On 08/24/2017 08:58 AM, Pranith Kumar wrote:
> +#define CPU_TLB_BITS_MAX 12

Following up on our IRC conversation, host maximums are:

aarch64:	unlimited (32)
arm:		8 (patch exists to increase to 32 for armv7)
i386:		32 - CPU_TLB_ENTRY_BITS
ia64:		unlimited (32)
mips:		16 - CPU_TLB_ENTRY_BITS
ppc:		unlimited (32)
s390:		unlimited (32)
sparc:		12
tci:		unlimited (32)



r~
