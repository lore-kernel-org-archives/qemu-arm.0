Received: by 10.25.0.144 with SMTP id 138csp605191lfa;
        Sat, 15 Apr 2017 04:24:15 -0700 (PDT)
X-Received: by 10.28.107.13 with SMTP id g13mr2235308wmc.117.1492255455631;
        Sat, 15 Apr 2017 04:24:15 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id v124si2582584wmd.89.2017.04.15.04.24.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Apr 2017 04:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id x75so2118533wma.1;
        Sat, 15 Apr 2017 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=AvVzg8qVtFwvMyq7myD1cQ2QNr0PYl3XXtoIPMU2yRE=;
        b=uczHkucRl50HDJ48t5kp5GI2c2p7I6Y5ahi4RwXqGgTu1gKGqhmEb5+sg1orJ8VVDU
         pn1sl1ER9707mUwJoe+apxa7jflhpeoT41LWlBWmu1E81ZZUhjBzP9W4SrXzxlOlkvxm
         9PRWlSJcSjTPjDpH7frpO5gwoXV5OvpHXe/xD0Md1dmeijEqCOV4o+7d2jFN+6dsPfdy
         d52nI2Aw0oc4D908x0ZtRzhW13MrF+qPRlu4APiyWy4s8XwrLmIFHfhOZTtnAy7NekBr
         wa71r98mGNLyMOzskTtMAraRZjZvrZRcdN7fi69azp65QAIKlZloHzXMdj3NqGHOgrGg
         L6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=AvVzg8qVtFwvMyq7myD1cQ2QNr0PYl3XXtoIPMU2yRE=;
        b=HhHCf0Ry8fgSyDWyJ5/vv7iEX0hnILfaQ/n3bOjHgmaBUptvSXxD0YGOelSyxtfviS
         Sw9pTtmi+6tB8gz5SbFfefO24apl7Qj93Wbb+rD/0lxqIxKpOfbShDIBlqqMwIm3z6dy
         66MZHCX8f6Q2Qcw6nSZ78i25N8KQ85fFfyIxHkvDxcF2aaSEaQcqj6mcMpa1TJXg0Yjn
         bU1mncamTnNqyKUy7AFRNby0hA85MsUVGAbTXT6rNzSkXCqYaxUvpkaWfOzE3anyPtLT
         eIUPmB4wytTWVGLf4v0i3O1auJq5V/zMXmhCdK4X/50YRUdlfj+SMrBS4j0EbOg0DoSq
         zayQ==
X-Gm-Message-State: AN3rC/7+w2KuQfL9V84qqgOQC8rhThjL99V064Pgd72jebBu8sucWfL2
	3X5921O+g0cT9g==
X-Received: by 10.28.154.198 with SMTP id c189mr2206421wme.45.1492255455008;
        Sat, 15 Apr 2017 04:24:15 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([87.111.149.139])
        by smtp.googlemail.com with ESMTPSA id u190sm2239984wmu.8.2017.04.15.04.24.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Apr 2017 04:24:13 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 03/10] target/arm: optimize cross-page block
 chaining in softmmu
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-4-git-send-email-cota@braap.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>, Stefan Weil
 <sw@weilnetz.de>, Claudio Fontana <claudio.fontana@huawei.com>,
 Alexander Graf <agraf@suse.de>, alex.bennee@linaro.org, qemu-arm@nongnu.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <44eff6ee-1059-8a77-aa91-ca5d9fd332de@twiddle.net>
Date: Sat, 15 Apr 2017 04:24:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491959850-30756-4-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XQQyTo8Ffmod

On 04/11/2017 06:17 PM, Emilio G. Cota wrote:
> +uint32_t HELPER(cross_page_check)(CPUARMState *env, target_ulong vaddr)
> +{
> +    return !!tb_from_jmp_cache(env, vaddr);
> +}

FWIW, helpers like this that are intended to be used by more than one target 
should go into tcg-runtime.[ch].

That said, I don't think this is the proper abstraction.  More later...


r~
