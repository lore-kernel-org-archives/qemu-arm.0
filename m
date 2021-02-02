Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp162687lfo;
        Tue, 2 Feb 2021 06:27:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8EORQwUsgE0HkUbgK/lJPnU5hNW2SiSua/HZdnYu61OS4xiSCLJ+iU7CK9RwfCBHHWg/3
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr31424824ybc.41.1612276058319;
        Tue, 02 Feb 2021 06:27:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612276058; cv=none;
        d=google.com; s=arc-20160816;
        b=nGSR8tWdYruGsdew8e32ktwuz6KTF90UUcHP/5tszL6RO4yNI/iZYhTRM446xHnhQT
         uIJnar8dddEMV8x2sDvauqWv8N8Gmlg+3d8EatKtebNJ3lWHkeo4yrSNAs4arM11ftnx
         ccXJNHTUH9frl1nKHZLkoiMONG/kxfw+AbU9WQlhmUJAcB72EHGLxkoGrtT/WOox9BAz
         ZgsIpjeyom7JJFL0/Bt+w+CohZWvPOFAQXm7UO42UKHhZdiSfQBH0zLW5b/cX9C8WR2h
         KuDEA7qkBM80ojnsi7iQLPTE9xK2pV2z4Jyr5ItJiT8epqxRV2NKDN/c2sA81P5bulSP
         crpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r/qNb8iqW13I6zvP3bh0qRMsD1/YemJJvDsDIJV88ns=;
        b=SIyR+bo7iWObe23pcxr2a1Ntdz7fQEVv2kaQ0bzwIVTuAO30rExFSzE5fHE5+6pX8K
         lcxp9hDOW9V/ZpqOmAf3Jig5yankkOWhHC2bVR8QNeadPVBpToosGdHIqizlz7fvUI7j
         SPwag3P1Ovxx17dJrgEpums99CNvjRjTdKEb8/XHcTxYBPJ8cRw/zWn4Cc5snVb4tPdj
         oOTgEkKfr8839gjMO2GvHZs4E5ouiLM6XdGfgOt7jroFuF+Rb8wyDfKp+Q8RcOFjmX3v
         C+uQRA/UNEOHYIG02SzbiRHtywjUpWUJyKeIVwqWl+u9IaY0pG0K4LkjzQq6Jlv/GTfQ
         f8jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pZZVdASD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si20016271ybo.222.2021.02.02.06.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 06:27:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pZZVdASD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6weX-0007ob-ON
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 09:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6wdo-000752-OG; Tue, 02 Feb 2021 09:26:52 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6wdn-0002mS-9Z; Tue, 02 Feb 2021 09:26:52 -0500
Received: by mail-wr1-x429.google.com with SMTP id c12so20673528wrc.7;
 Tue, 02 Feb 2021 06:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r/qNb8iqW13I6zvP3bh0qRMsD1/YemJJvDsDIJV88ns=;
 b=pZZVdASDw/2bWyWJip0qWSIXHuNdssugvHraTOa4yZLTdFzV4K+q7GmHsLlhwKnXvx
 N5aVRUb0AUi3QcSYGrlDANTQaqAYZgf9xhgKZOTOEcRVHHaL5iPzOVHgZQeWoUW8EWNM
 +gG1Udi9iH11EW2ydLTEC/YMiiF1TquuQZmsc4y8IggKP0abj9htW7tyDV0ZiFUvvZxo
 Fyj8RYRqtjc6uTojUllF/eNfxqvrwgG/9ubncf1Aquu4mzakJlN02LePDgPm+54oYg81
 MjonO/fYr2jBQYg04SpFs+cyMbl/JiB33YXoSlXQZIisMVnQzjYiHSIMHaVpiFZqzDPT
 Xjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r/qNb8iqW13I6zvP3bh0qRMsD1/YemJJvDsDIJV88ns=;
 b=L/VM7hg/h38kYMX19ES11zbXCHtZHQW93kq0SeDrjkaH5Qw8J4/49voFaecOzlbuwI
 Vtzv+WHkHyuYcyFVxe7Be09fUshpTlKl4K03CzH3q0RuoB3ddyXOqNRHyCbh8e3BRUQp
 ilX5zPM9vnmjRhSAwHPllKwL1xZFOT7qLPs7HqbQHA+ogrX89KxY3Nl1vUBoE3iXBkWq
 reb8yWleZeCgUGeC//SjcIwg7NWiAibdYC0qQUUw9hq42Zo/bpIfII1kWobUyYMzG2Dx
 An4nZ2QuWaMkETwO/k64zRakhMyAEZ4yzKd7HyX8T2gK5CYLoj54qmZd+epQUtTCb0Ax
 Y47w==
X-Gm-Message-State: AOAM532s2f2CK+EejZ7Id+HbqxjTI67I4o3Pwpoqx0BYhvDgI/xLEv6H
 BAEHMqrehha1fexmdiBtCeTf2gMICls=
X-Received: by 2002:adf:a2ca:: with SMTP id t10mr23759333wra.370.1612276008248; 
 Tue, 02 Feb 2021 06:26:48 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id h23sm3503780wmi.26.2021.02.02.06.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 06:26:47 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
 <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
 <313440b0-95b8-a690-a7ed-65c8428d7c42@amsat.org>
 <CAFEAcA-9asbQXq8E1Jcqq=AcZw6kO8M9UKGbq=FSnB5iC+dAUg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8560a139-08b8-be47-f6f6-e3d3833687e4@amsat.org>
Date: Tue, 2 Feb 2021 15:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-9asbQXq8E1Jcqq=AcZw6kO8M9UKGbq=FSnB5iC+dAUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.155,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vnpmSMpACxu9

On 2/2/21 2:47 PM, Peter Maydell wrote:
> On Tue, 2 Feb 2021 at 13:29, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 2/2/21 1:28 PM, Peter Maydell wrote:
>>> At the moment we can reasonably
>>> say "only the 'virt' board and one of the Xilinx boards are
>>> security-critical".
>>
>> What about the SBSA-ref?
> 
> It doesn't work with KVM, and enforces it:
> 
>     if (kvm_enabled()) {
>         error_report("sbsa-ref: KVM is not supported for this machine");
>         exit(1);
>     }

Uh I didn't know... That simplifies even further the KVM-only
build, thanks :)
