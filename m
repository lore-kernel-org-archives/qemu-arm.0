Received: by 2002:a0c:eda5:0:0:0:0:0 with SMTP id h5csp5251699qvr;
        Tue, 27 Oct 2020 01:55:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzRN0m8qtiUY4mzl+2BP+naEtFMDqjQ6N47nckjUn6+8SH5qAP3Z5Yc5KlMb/E0U1aYPHc
X-Received: by 2002:a05:6902:4e7:: with SMTP id w7mr1728157ybs.190.1603788922184;
        Tue, 27 Oct 2020 01:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603788922; cv=none;
        d=google.com; s=arc-20160816;
        b=hiM+0tmYwy2udVYvRk742rJSMfMujnklCZBhO4bBzE9nyFWEP8sj8rJqVYeZuILlL3
         nRnFAk5Af4sGOBCDI3iQ9WvF3f5BTuDPWrC5Y78FVcRS5p/lLvP64Utw+I9ndcX7IAZu
         G5rd9IG7V3zPVdzRLIwxJm2X8oy/v5PQHyF9X3wIy1bwMTablg+2oCZqRueBqeLOO/+Z
         jgJdwPiD8mtXry5XrstTFiKuLmB052yH//UQH4y3l97sngXOWfMxsdZtYD5rYSwqau1V
         GPEy09+RlIMvLQtwBRCT2xv2hndEdO3HD/+3ILTaxDbTDUu08unh7VcjMjRqidzGVBTM
         Lo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ubmnbY3abywQoUdtv/SSGer9u/ZWhGOteWaQjl95mE4=;
        b=fC2zNkAbUTbMM+Qbc/LKxlRdAAeC/9Djt25u0KBXcFnw0/ZnWYDowK+mhJeEulMFPs
         l8e1Z8u0JeqDkjRdmY5mNRD2ak56G4cf/F/9Om3M2uH1EejM+6mIudtpB1FMwPV2IQkx
         IfqgYgu35LX+lfOv7csmzsdzybDeXj6DS/4cMWSCmf9q4jHNU6tQla2N79jvNP+agOh5
         oLsaU+TJqJXZm4BmaqRd9J1/9dakdVf33D3eBSwYkn7tLUGBLjvm7jojZzVo8CUgksZE
         VMnQNmGdl0gZ9HgnmQlKD+sqJENSkjbvMFcyHyPOSmyAM8PXsQYkcMYnjFyLvEKgsD8x
         r/0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="qts58u/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si933665ybs.321.2020.10.27.01.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 01:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="qts58u/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXKlF-0008CQ-M0
	for alex.bennee@linaro.org; Tue, 27 Oct 2020 04:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXKl6-0008C9-GF; Tue, 27 Oct 2020 04:55:12 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:40357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXKl4-0002S2-PT; Tue, 27 Oct 2020 04:55:12 -0400
Received: by mail-ej1-x642.google.com with SMTP id z5so1064266ejw.7;
 Tue, 27 Oct 2020 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ubmnbY3abywQoUdtv/SSGer9u/ZWhGOteWaQjl95mE4=;
 b=qts58u/nvC9K8rZ7TSk6rDJrqRLRHjqfS/LWHdz/1ESRwWEhVcL8NP5rEzj5GKpPvM
 jh7Qt3dN4d13bFTVea84uvfBi5HJxMwWRArQKLrvgc9+HEz8ASMGLkYMp0XqwngBZcm+
 9ajVSRLC6UH3+TZuogeH40elRe3IgXfOV+zVJOuicvQ3CTvj97qSGqJc5uwaFnncbaRw
 1AVTB+pmmp/J31YQsFMGXPwBYhzIh2kK61RDem0JXBvPZh5OqDUlvVBN5uKL51aH712i
 4GNIuhb7j5ZyozfTKtKwhL8mX7uXhnsmOynLw45/3GQlh6qRLarCNfDJtzvmAlh1KBAS
 2nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ubmnbY3abywQoUdtv/SSGer9u/ZWhGOteWaQjl95mE4=;
 b=f/QxLSgOrda6Tds4b/WWUOOvXQVRVZ55C/MUUtvJ7Gt7LdQAqmaC5mAwtkz/2/ou0q
 KwbJAeEvDVrOkDMFv0WVJOt/9zlP6axS6/VDw3ZQvwCB5qy5eFr1aRDNMgErQIYYIOGa
 dQEarZR4kOU9O4MkDR97ekucJMPqU2cggA4Ta3jOHak9HowcgN74kenrmkoIKoNDQ+xz
 vhcdrOeNbb0calzGMksIEH4yJoxHninkvZwigmrW53t7iniNGIHdeq2/3QMS629UPGjK
 y54js1QspWEwCnAmRWWG+9i9jHAoYnaWeOsPG0hbGA+ocfle0HmfmneSO0PduQPNX9RC
 davA==
X-Gm-Message-State: AOAM532XM+x6Mf2oSncKjA0C43N8SoYqPS0F/U0dBVLsgxaZ97dylR4A
 fSl2HjIa0srobnoNlf/xRt0=
X-Received: by 2002:a17:906:7f05:: with SMTP id
 d5mr1266992ejr.362.1603788908508; 
 Tue, 27 Oct 2020 01:55:08 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id h15sm582960ejf.50.2020.10.27.01.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 01:55:07 -0700 (PDT)
Subject: Re: [PATCH v3 00/15] raspi: add the bcm2835 cprman clock manager
To: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>
References: <20201010135759.437903-1-luc@lmichel.fr>
 <CAFEAcA-F5WCv6We3V=kCV8vH79ko=KGHYWKLaxNVEd9HjFES3Q@mail.gmail.com>
 <CAFEAcA9fHTO2f_KdCnFvqhEOwTzOwtMf=EhKY=9S_5twpabaCg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <63d302c6-5cd8-e321-090f-7b1a5979788a@amsat.org>
Date: Tue, 27 Oct 2020 09:55:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9fHTO2f_KdCnFvqhEOwTzOwtMf=EhKY=9S_5twpabaCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.167,
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t9XmIwip9QB+

Hi Peter,

On 10/19/20 9:31 PM, Peter Maydell wrote:
> On Mon, 19 Oct 2020 at 16:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sat, 10 Oct 2020 at 14:57, Luc Michel <luc@lmichel.fr> wrote:
>>>
>>> v2 -> v3:
>>>   - patch 03: moved clock_new definition to hw/core/clock.c [Phil]
>>>   - patch 03: commit message typo [Clement]
>>>   - patch 10: clarifications around the CM_CTL/CM_DIBV mux registers.
>>>               reg_cm replaced with reg_ctl and reg_div. Add some
>>>               comments for clarity. [Phil]
>>>   - patch 10: fixed update_mux_from_cm not matching the CM_DIV offset
>>>               correctly. [Phil]
>>>   - patch 11: replaced manual bitfield extraction with extract32 [Phil]
>>>   - patch 11: added a visual representation of CM_DIV for clarity [Phil]
>>>   - patch 11: added a missing return in clock_mux_update.
>>
>>
>>
>> Applied to target-arm.next, thanks.
> 
> Dropped again due to segv in 'make check' when running with
> clang sanitizer, which I gather from irc that you're looking
> into.

The fix has been merged as commit a6e9b9123e7
("hw/core/qdev-clock: add a reference on aliased clocks")
and the series also got:
Tested-by: Guenter Roeck <linux@roeck-us.net>

Hopefully it will make it for 5.2 :)

Thanks,

Phil.
