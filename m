Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1586349lfg;
        Mon, 16 Aug 2021 11:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq719cIDXXIxZ0nTe9HvKrlHA/jWoBcVtFKnz+khachnmAN9gHQZmcT3enUdugbgq5JRFc
X-Received: by 2002:a5d:534e:: with SMTP id t14mr20062274wrv.109.1629136878323;
        Mon, 16 Aug 2021 11:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629136878; cv=none;
        d=google.com; s=arc-20160816;
        b=PSALR3B0tt3Z9cxiLFdTonVedyxYnJpOh3Jv+OLNQ8Xlpu7PN1Hq0ysrXuGQH7/ExP
         sa7jGKVELfmSJjvQ6WekqC/nwW/Lkog310QN9iXuWyyRvEDxaRTFm/p4fnKpX8W1twD+
         mcD8C6flN2VXhRiA15JW+ktdbhFxlm9K8pJbmmAJyMEL/sgCC905HcN3qAIprdUmriPw
         p3Ks4U11xlEDtiPG0jlQwZbDq1yymAnZvBTQWpcCKe2V7XiC2m8gt/J2b5BVkUFfmoMF
         ky1YI6zhcA5J7dw7Ubu4laR7rtd3fD3drl22pjYMPuV6yqyobPP+6I1HnggEkbaAz6YP
         S1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nafmyV6c+X+K89fT/+8F8Qnv6LuwyVol6Rp945Dis2k=;
        b=uLcsPR0DxnhbWhVOY1Otoasulp9jeq0lex9EhfJDehDjwDmvfHbSVJ4GGJ2gSO0Sxa
         4E5qXs+1oZpkYB0Ddb50wxLdhS6JSGPoGyR29B/oS/FH9dMi80c2p51KkYkGK/o1Qrj2
         Sdl4ZZ4syQqD1bincA0WE9SSqSC9o6nK3/GHtLqtI+jPDjyTMwUdmSfNr76QioV+xOt3
         lXkl6qckKF9jaWoxkAG5o+E6F3EV3XbGOPi8/h/CQbShQK+A7RjbEXerBC7vdLIEz90D
         fZa80I6eNfqNm8xP8WelyfRH4OAbCXRj53QdE9n5NjL7PSJicje6jvJArMDPmVFzC4Ts
         Rw5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBriyo60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si13908116edi.368.2021.08.16.11.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 11:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBriyo60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFgvE-0008Kk-KJ
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 14:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFguK-0007P0-E0
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 14:00:20 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFguH-0002b8-IQ
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 14:00:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so15422895pjb.3
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 11:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nafmyV6c+X+K89fT/+8F8Qnv6LuwyVol6Rp945Dis2k=;
 b=WBriyo60naZ1E1GdtLVd/hRE4mJDr3NKeWmOxR9cs7yQWv/xGNbZqJ46vVVU1b/wU1
 RdbCgekFJhuGlFQHrdtqppOXN5V6ck1TU0YLBsMNhC9Ddpr+jhwKCgiJzmj94hS4aFsI
 lMWoSPpbKCA7pedZpSsRnn7vSfQOQQTqItKxbBvD92XFmtSZQ7YcjwAitZbSs679Fz8S
 WqpqbOKOWKR/GFvuX9Vy+UmevZSvrjfaVVHLDlh8ouJCsfNNTPapMyauznm1Xp+JyQK5
 Hv9Cz77ncY9/mmzyqMiaylWzNG3b4tE3uobG+1kdDNDs5sNxEpd0gV5+ebz1qnCvp23W
 L+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nafmyV6c+X+K89fT/+8F8Qnv6LuwyVol6Rp945Dis2k=;
 b=OglAkt9UvZFwvDWpfOK+MUCqCcjX2f4EKz9WOT6TNC4RVPGg33vdKu1mYLaw3a50Ht
 AgQcjvkzYy5uhJQil6ekw5eNFoxQdDEW5Hha/tkiQ/61QotNskX92w6YFmp71ww9siCN
 kLmFTpxOA4R0h4JzXioy+32SWUHxGLrNhOA4Xsl5iwi2c3RgKLpWjD1PCwt3RZtOIjMB
 auQpm94FoQU1Rp7rdV+C/j4T5VLwY96MndcFiCYu28H5p6mmofxe2gsHnZ+wPkCCLXwE
 QlCuQfgUwt/hmwOvYIgIZGd8xRNrRKauwNj9fpmIAQENlLRPU+XEwx2bkhZ1F8Nymwgd
 uCyA==
X-Gm-Message-State: AOAM530ELdvtf8FxsbTXmpPguXEjJtmkp5kB7KucQVhdaLQWTJ/b+ai6
 /2rM0TE9QspWEbhADWO2MRyCFA==
X-Received: by 2002:a17:90a:a406:: with SMTP id
 y6mr313349pjp.221.1629136816027; 
 Mon, 16 Aug 2021 11:00:16 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w186sm55503pfw.78.2021.08.16.11.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:00:15 -0700 (PDT)
Subject: Re: [PATCH 0/3] arm: Avoid asserting in cpu_address_space_init()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210816135842.25302-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ba0fa2f-b9bf-7175-2c61-e506f3dd5585@linaro.org>
Date: Mon, 16 Aug 2021 08:00:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816135842.25302-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DdxLKlBkckXw

On 8/16/21 3:58 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    raspi: Use error_fatal for SoC realize errors, not error_abort
>    target/arm: Avoid assertion trying to use KVM and multiple ASes
>    hw/arm/virt: Delete EL3 error checksnow provided in CPU realize

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
