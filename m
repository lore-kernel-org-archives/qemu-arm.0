Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp121962lfi;
        Tue, 29 Jun 2021 11:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD6W1u/JhCo8kLbQsRBVKvQS6VrtRGNbzQg4VyIoKrfHNgIYIwV9vx91ocDmntEy51drnZ
X-Received: by 2002:a67:7908:: with SMTP id u8mr26454221vsc.10.1624991610408;
        Tue, 29 Jun 2021 11:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624991610; cv=none;
        d=google.com; s=arc-20160816;
        b=b0Suv0x3BKtG9IvFGSglbol9bP76XoTWWecf0dsQJYd7VVd7zPU7XZSa0ieC17oIkJ
         xyjzEN0ejrgBStwfXh8kJ2p/T+95iINBzEQdZ8XlAHBeg1AgJLIj//5ekWUyWjctzW1u
         b0jyyXfy6dyflL87a4mATcgjljjnlx7trAz5/X4wOiCBHKJHoppXyN2h8sIWUnx8BbtY
         qsSSX8pFpUwLtnr+VFw0hax1/KVY2hkSVRolzSclDtGwNe3+7FdsiQEem8ujfEh/ewjK
         /6I76THVHGv0ISFqHjz+yV+xel5z68EnFjnYsjEbRRnUx8opmi6/7/8Rl+H5P/1wIVNG
         GeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9QzL1z6vcX25s6sUIhuDHggygoMjsvQaR8I6rC665A4=;
        b=FsdwID6XJUycdUnK79BJF5ubAKFxgthfjV3E463WFEj7rZEoma+tm78GVRxCgYLusy
         n3vx7vz04SDBVPLrLZWW+CYfB5NeakBa7w8ZZFvTZtNnISKfNSjnJOcxVBhkGpLnkrH8
         Ya7XeTi96lZOkaIMnOPhJJHCvZxI4xpzcMT/vtTzmVpb1ebyk3GYrCqD0IE5v2stPpzh
         +FNrTnpWUHKuaZDCOem2TAp1tuNit/ONLOzSRiF4haP+9Qtf89gMvGEbFZpHdirwlS4p
         5hJNnYnHF/cg4cHmGy/gjsbL5DYTivcX+Q1O1g6Mp0ZHz1oBhT9sFL6EsutNVECA3uhN
         96/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KzIyOi/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s135si12085522vsc.200.2021.06.29.11.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 11:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KzIyOi/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyIY5-00066a-No
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 14:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIXh-00066R-6e
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 14:33:05 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIXe-0004NJ-VT
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 14:33:04 -0400
Received: by mail-pg1-x529.google.com with SMTP id 80so3565958pgg.10
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 11:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9QzL1z6vcX25s6sUIhuDHggygoMjsvQaR8I6rC665A4=;
 b=KzIyOi/RpBf6UxOFaeagwCC/Kzqq6vt2lm8UE/V62YO573k5LbeF2E9Sj/QB0R0ZwY
 1sxRwHDoQewR8+sXWBKd40dpByUAtGSMoVuBlCJ2nnvoyFr5Fcwd9pcVLbaOCD1BCuKt
 e3VYKnCIJnVoePYhyBmRFKsZ6WLMfDh1v74D8fanYVGPhpWrSJ9CdgbGDA5tibj/3n3b
 DQVZceg4/iSQm0XORUnwroKZ8ynV2cveZG5O2KFDLXxq2qNkqKghfshst1OUOFtsIUFo
 Z3Wyb27QEmEEGbWlebA4LFgPBwB9XeFmFCbRdfnCxNFSMdWWLXP95RoWf9yDBdJQB9Mn
 KBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9QzL1z6vcX25s6sUIhuDHggygoMjsvQaR8I6rC665A4=;
 b=GTbLeDQRE9vnoKbg/yvofolyrwsYvrqPJ42ZxLRPImPuh9ix8xU7+TVcrVrl0RPYxi
 WQKPQNp7rxMwwTKg0v6p/DsmJ8l0NJaIBK7gyLgccY/g31LdYWKaDSYSDown6VUi0yH6
 hyGh4ULmJFP4wY5oXM/pz02IXj1GUIr3nnt6YtEQpHBgfCTo+OU3EJvo6fOyKX2bD6Wt
 vz/MJVWM+LIn8sG74QDWLkoaUCFUWVL+o1eUT6sCPTzc7qL4QElMUZsJ/xPX+7HHl/WS
 TIyQHGch+ZnMfTQL6RJzrrtxpI6Xhjz4YHPH73Uq7Xkr68Mnoz9tnEPUs0JXkqf40h1E
 Vacw==
X-Gm-Message-State: AOAM531WytpJRLh1SWdo0YJ1i3N/b1tu8r23l2LsOGnKOQiQahB3HL6U
 l8XsfVpiKLo9LFyy3cq8PiBtZw==
X-Received: by 2002:a62:ae19:0:b029:307:403b:5d7f with SMTP id
 q25-20020a62ae190000b0290307403b5d7fmr31603695pff.5.1624991579724; 
 Tue, 29 Jun 2021 11:32:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18365087pfj.168.2021.06.29.11.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 11:32:58 -0700 (PDT)
Subject: Re: [PATCH v2 05/23] linux-user/arm: Implement setup_sigtramp
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-6-richard.henderson@linaro.org>
 <CAFEAcA91p7_PKvs3aJnqe2zy9MOv=y5pn6yp-SmwRVZow92tww@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91029900-3fe9-f252-bede-26c9cc1325d3@linaro.org>
Date: Tue, 29 Jun 2021 11:32:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA91p7_PKvs3aJnqe2zy9MOv=y5pn6yp-SmwRVZow92tww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yg2Z+EcfntFX

On 6/29/21 7:09 AM, Peter Maydell wrote:
> On Fri, 18 Jun 2021 at 20:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> ARM is more complicated than the others, in that we also
>> have trampolines for using SA_RESTORER with FDPIC, and
>> we need to create trampolines for both ARM and Thumb modes.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/arm/target_signal.h |   2 +
>>   linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
>>   2 files changed, 100 insertions(+), 72 deletions(-)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> though I'm not 100% confident I checked all the details. Do you have
> test programs that checked all the different trampolines ?

No, I have no fdpic testcases, and wasn't keen to spend an afternoon building the toolchain.


r~
