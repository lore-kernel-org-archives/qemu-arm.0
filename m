Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2199068wrx;
        Sat, 23 Mar 2019 14:03:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpMQ00HmeH8xjeuu+gl8pdUHlZmq8zgUCy/K7h8OugoTtwFXQE3yrUx6TswDtPpjrlcrUK
X-Received: by 2002:a0d:eaca:: with SMTP id t193mr14937582ywe.29.1553374996660;
        Sat, 23 Mar 2019 14:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553374996; cv=none;
        d=google.com; s=arc-20160816;
        b=Uisci8q7S7RvMS+R1llfQVA2uJtZ0rxfe1lYcneWNrzWaF6FSDecHnmzBxY+IgXAtQ
         T4lUh3uANzmYEm9fTmdOjYEY0BqOR4KbPMGb95yZOkfBKMXF9+uLk12DPB5XMvKShkKK
         AMQK1FdOTYe/GkQ+i1SOh6Ol/X57xYlpRAXxUxjGlpsICSSxOhw7cO2/SxLzpnifPS7M
         8Z/Oq3cYpjthg9+4d4tL3vaxyu5Jr9PtjfHoNY9yvQ7yTpNjUk5GkCGDSakJglesA2QD
         juzPrkTMyMyhew5OmESJ88VWcQanHERtCEWaLA6ncbcNHaA2qywJo5pZz2rd4BJv9cpF
         t1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=CPxlZu/6Yfye3epfC2/RH2hyEjk5zhQ8AP1Dn4PeARw=;
        b=whxYzxl4xOZZBpgm2r42tRxocTtoDMq5df/IWTUK0lLL7GNUjcZcjxcLH6MFFSc4dD
         Gd2XxrAGoPRUxGLvguWmJthxPAS2K05ju8WLK1MB0vhlGSzELerulYpNZ4fG3YX6HgI+
         y/YwzCdsrcFY0hR2uS9BbK9ctF0NiLRl/BLiZf8TyK1ktDAwxgUkHxNSdZxNX7wk2+Oy
         HnUTv2CNjjtFa1FGz4FO5CdoqEUU5qvVzW3OkXAGxA7SeueJhZLr6h0whxmxPMxtq8YI
         6zuYSrir+fIPn9j6e/aKURbmDAv+6KyuihnFUXTuu3EOlsU2N8FGVQTkSaYSyTgKoM+W
         Zfng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iehokwhr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b129si7247121ywd.460.2019.03.23.14.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Mar 2019 14:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iehokwhr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7nnQ-0003aE-57
	for alex.bennee@linaro.org; Sat, 23 Mar 2019 17:03:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h7nk8-0000hJ-Rz
	for qemu-devel@nongnu.org; Sat, 23 Mar 2019 16:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h7nVU-0002Ts-9N
	for qemu-devel@nongnu.org; Sat, 23 Mar 2019 16:44:45 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h7nVS-0002Mu-Ak
	for qemu-devel@nongnu.org; Sat, 23 Mar 2019 16:44:44 -0400
Received: by mail-pf1-x442.google.com with SMTP id 9so3738107pfj.13
	for <qemu-devel@nongnu.org>; Sat, 23 Mar 2019 13:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CPxlZu/6Yfye3epfC2/RH2hyEjk5zhQ8AP1Dn4PeARw=;
	b=IehokwhrHQ+tI+gNlbLhLobjYD6td8RNx3CLANWzwXPJpbK9GLLPPPubl6YRpq6TJb
	gXFLfWJMfTWjfQ7WtlAVoN4xZTUcUV53wwgmc0AwlTkc25+kvjd13qFSSfGLX3mymXEq
	Jp2hKfeCNyz7yRf/E+HnLiK2BJeiV4EBIhvMBDA2rMM9HD4MlxGvzv921FtwBidL6oDw
	NO+qGAxvkriG2kJ+S6SsVByduqsLsaI34LNSs/Ox1BgziEghnt4JXyRqm/QUMsYFyQP/
	NddG6ni3dfG/egt4X10o2NOdvJdCeqauibr28JpjSxAV9Wou+fmzik0wXA6aLvP1MF3X
	JqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CPxlZu/6Yfye3epfC2/RH2hyEjk5zhQ8AP1Dn4PeARw=;
	b=j2qS3tL2i76LdKeL2sm8hPsFbfpcDHwuf8TecoucOPsQ986s/CRMZWBHuVUsl0Hkcd
	qi3TGa6GeuOeILT1r2w0DwOIE+QFJi65gdXe/w5D4vZn+4Umf3SxMaD8DNQF8axe5X5u
	mRlP9FMHajZdL8+3iy0vx7fUqwsvm8kTBdy1WyyA84rE6xeSmqY8gu7VYqWbo+GgrCqS
	g14f001Gi7jkp4nYZixaIYUrF2LjPg/av6rz2CxfNp1Pquvel6ahSPy5PygQxA4yzFGJ
	8F8GMJ++tDKbek2X5e5RwJ85Lf15kowmaN+9L293RrkrRuqPf9xWbH61ikrUJgWLqyKM
	WREQ==
X-Gm-Message-State: APjAAAV8EWGYuRBY7mDrL/wVWS6OFFGnN/BGRyMK5j/oLk70SktxGrd/
	mHGLHi87zDi/msd8zrqpaMpiiWPiKV0=
X-Received: by 2002:a62:5543:: with SMTP id j64mr16123683pfb.105.1553373880946;
	Sat, 23 Mar 2019 13:44:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-5-201.tukw.qwest.net. [174.21.5.201])
	by smtp.gmail.com with ESMTPSA id
	h23sm13948901pfn.68.2019.03.23.13.44.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Mar 2019 13:44:40 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190322162333.17159-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <60438f20-48f0-f43f-4d8c-876a5e60e47a@linaro.org>
Date: Sat, 23 Mar 2019 13:44:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190322162333.17159-1-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH 0/3] target/arm: pmu fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, aaron@os.amperecomputing.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +9Hl+cq4VjdY

On 3/22/19 9:23 AM, Andrew Jones wrote:
> Andrew Jones (3):
>   target/arm: fix crash on pmu register access
>   target/arm: cortex-a7 and cortex-a15 have pmus
>   target/arm: make pmccntr_op_start/finish static

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
