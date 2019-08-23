Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp833988wrs;
        Fri, 23 Aug 2019 10:13:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEy8qPDHC/NWcYcHOgebSPjDAugAN2EijX5+QB2G6sCwmwnivZ1K5DhZL8uQDTR0EyYY2t
X-Received: by 2002:a05:620a:16a9:: with SMTP id s9mr4664513qkj.48.1566580385961;
        Fri, 23 Aug 2019 10:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566580385; cv=none;
        d=google.com; s=arc-20160816;
        b=DHo7KojDG4hfKNrKIB4slpNbkGzcVO640ChCyPJKVf6vfFAM/OqETY9gNeVZ6TQalP
         ST2X0nE+FZkd+Y5FVjEpUE8AUqtXmBRSBzncJ8d+ShOP8NRwvNXcR1Ryl5l2ECTMHLok
         aOaAznTI3mPJJt6WWzMJ3PE48MbOowtGW0PQ/yiMcacEFMZdFMB/d4+XLk8e3EEOma0g
         eb76s/C3oCdsWl1qu+mzzYga6eILPh66pIRpGeDFZ3aJXS+horSlApWY/e1Udo4qC4cG
         lLndX/ea+8/+GiyLW9YzPpAgj19uhoQXSh1YCsWA7u4PnH9a+eBQ3SktfPEWKc8h+Dp4
         KqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=cu/zsRExn2DzlN45p92HNZzGgyc5Z8qJPTMrJ8VUMmk=;
        b=PnDOzpN1spaH+FrUKXrU0McXQhDufMRSfXZnZdpA2v+jLwfn63Oy4wrNisW9zHNocM
         1ct5ELWLuPp4v10agIO1NazF6V9yePqIRBaEt1MSPXBVKajiv9I+HuAP5+kxc5/xFeBS
         PfrayGNKKxP5RyUOlD5u7VyZn56EVHcSVRQ03lTKQIwDqdXYsUeUatkHv6Pz+DRD9+C4
         0TMPyNnqzSAwjNUZNS2tTnqT6gwBPcbA7Sh7yKG/IbH4/aR0zIwCHkBujoqHmi/iqML7
         IOaRy8GsGiuJF53libi8YepfkTfmK90jLm1FsYJe/jy/zSWvGLXQz8fY5KWi5Mhss2m7
         5ifg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opeaVOGL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si2211933qkm.345.2019.08.23.10.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opeaVOGL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1D7Z-0002Wt-EY
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1D6b-00024h-Li
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:12:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1D6a-0005uI-OI
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:12:05 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39503)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1D6a-0005rk-HN
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:12:04 -0400
Received: by mail-pf1-x444.google.com with SMTP id s11so913308pfe.6
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cu/zsRExn2DzlN45p92HNZzGgyc5Z8qJPTMrJ8VUMmk=;
 b=opeaVOGLzkWLDRGILp8YDBzwudeLTdH2PW5FqPKL6Dny94Fdbq9fSFx774hMIPU0s+
 iqg/RX6+YEB3mV5fQgsNMij3fBdKQFoEmICqNQmSJR5bk70gY+jN9EQoCMkfcl7Lnn/o
 qFP7Ps4WSwR6QByI0o1hAsWFqPwI0rHo/KxnvJ0hKABY50PURG26XbLcyIjvk7nsG9xg
 N8PHGQimcJ4VQMee9A25B6Nu49IdM1IuIZBn68R/CcqJT6bLPQt8P4Tmass25mpHvW45
 9cZZf5IZ0moDTEFpd/fTS+17WZCBjzGj26WLQtIo2U2QrIN1hfmAKIFY3NbEzd1EiMkf
 74Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cu/zsRExn2DzlN45p92HNZzGgyc5Z8qJPTMrJ8VUMmk=;
 b=VpZHPpDcdqkLZP2qLi4dZ+XO00HxX/ahzptK5J5e+85mFy4Bbnqalojlh6W+VpBq+T
 IPWa2reXb9VntaCLd3Ees6Lg3DI6rOL96WxU6UrQsiXh2JmGzr8PAgAwv5Zk99+33TLL
 eloRGLeHCXm4aOX883E+8Vk1ldxzn0vrsCjkkX4QcVQ6NmreTGIOg77VlBkVA8mMcFil
 lx03Cc3G30g3Y50qDG2WBjerpAhLKwFcot+WwRv+RS204VOezR49+i+fOFNrnSLQSXWb
 qyOPysoUPUyCDkrCIRVOKVaBHVyv3FBL+AhN/ziY1qGCI/S/IbOPjs9KV6ZizYBSvJEo
 7Lrw==
X-Gm-Message-State: APjAAAWDtcr705Ih5auGXS0s7p86Pt6XmvpO7VAu9IWmsx3DQjpRw8jK
 O4ut1S5VQ/nGvJKmkw+NQzwFiQ==
X-Received: by 2002:a63:2148:: with SMTP id s8mr4803378pgm.336.1566580323313; 
 Fri, 23 Aug 2019 10:12:03 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t4sm4696268pfq.153.2019.08.23.10.12.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:12:02 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823135811.13883-1-philmd@redhat.com>
 <20190823135811.13883-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <402a2532-a61a-18cc-2153-73a0447bad7d@linaro.org>
Date: Fri, 23 Aug 2019 10:12:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823135811.13883-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-devel] [PATCH 3/4] RFC target/arm: Do not build pre-ARMv7
 cpus when using KVM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rQufCrr8CQ0f

On 8/23/19 6:58 AM, Philippe Mathieu-Daudé wrote:
> A KVM-only build won't be able to run pre-ARMv7 cpus, disable them.
> 
> If KVM is not enabled, they are enabled by default.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Sadly this does not work with --enable-tcg --enable-kvm dual config.
> ---

Huh?  --enable-kvm does not imply --disable-tcg.

> +config ARM_V4
> +    default y
> +    depends on !KVM
> +    bool

This should surely be "depends on TCG".


r~
