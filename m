Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2167872lfa;
        Tue, 13 Oct 2020 10:30:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5Y13KhLT1nPt6wyYV0nJEtyY+z/id0Ln1ERctsi8ZdQzeka2yDN8BdfcLu9kaQgC4h9j4
X-Received: by 2002:a25:48c1:: with SMTP id v184mr1331967yba.113.1602610240434;
        Tue, 13 Oct 2020 10:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602610240; cv=none;
        d=google.com; s=arc-20160816;
        b=h2ePxiv9vVuN2WX72tZ89cJhpHMa4yGOgSW43fONLxl6uQGmZbU8lSV+Hg0G0ymCR4
         L9gGvg+NKK0EeZGbzqbWd5UAIr3VJAwmUK4IAT39ynRxb/nR4UJqfKPBVy6UOfOftszR
         MHQQyBJnlU6wrPB8uDAEH2jQmxeqF/06r/3lBYWhiM61QTAiYoehBLMjOcEtoZudsGUC
         uXBETzy8tN8+MNJKQERIsZHnByaHFZck6ILjmYXZlximLcIHpvsXeCVux8IYxb+yH2Ix
         AofmzwGvlWZClAZ8bbP2XOnFrDAc7YnlkEDzU+xYrYc1LihPMosTkzrkRyAAEhuVYlJ1
         cHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XSPSmD3UytWT5FhvCfXTAMKPVPvO6xsiuSDCACMxO6o=;
        b=xFoPz5zv0l6trYWgohUYhWVVqYu/IluPOsrP3wZqUH/QABYzraJ5UvIHkv88r6DDnV
         Wl7ZxFTT2UHBxAh04LdCrW7RLGseNHwB6n9P93b2hc1IGDfHn6veeotxdFQ2a8HOcflF
         qM33lbOa5E/rFivRwU/9ndaJdFzqraDdOCmZ3dd198tImaVjDKWyTPE8Pa7XqFI5J71B
         LZXcp9NdGSLOwlyNi20fsJjWrmsmLlXaUl1u1TLcqOyPMqmL3IAdiJv5o2RTYB2hdxcT
         e43YXNcqlRz26ZmAP9SIER8OekLRtPD3DJMrb/cLRcVvlw5AofRLibQTA4HMosOeiLDD
         jeHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xg1/ag60";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x33si611449ybh.26.2020.10.13.10.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 10:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xg1/ag60";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSO8F-0002Eq-RM
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 13:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSO7t-0002EN-1p
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 13:30:17 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSO7r-0002C6-9W
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 13:30:16 -0400
Received: by mail-pf1-x441.google.com with SMTP id 10so202541pfp.5
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XSPSmD3UytWT5FhvCfXTAMKPVPvO6xsiuSDCACMxO6o=;
 b=Xg1/ag60zR8poSs/xhGZh6c3AUzsV1r6H7Wf0PWOvNQO+zSw83ojkUH4XzRGznhxkW
 8ScaRS7Ca9g0FqsNX24ogc0NxxcqAQoJzSJJ3gF/BCY4jp5E2nBgCnjQuV322ZfQAjCH
 ZcEI9b1+aGGP23YMKWY5lxl/hWSJaoKG74Dc8gEPtE75jauo8ZWyHfeARcKyckYigTuL
 9d6Yt2mIdEXFi7yflGAq6ze8VlcAS6N0nFGbAC+FmrNO15AIYbFgYvMLxgH9ol9Kj/RP
 S9NbvBNUVnaag2g1KSNK++beOAMlzELKMNRHHAg9jihZ6jK8DU/qms57G6jo5GOff4fJ
 q+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XSPSmD3UytWT5FhvCfXTAMKPVPvO6xsiuSDCACMxO6o=;
 b=TfET0llc0LmE5XwvX+9zyoxLZ56pYiQvd5f69IUPxGYmC1tn5j/VH7rx3WF5NWuWBw
 NpcftSXrBs9bg4S8cyHSK4dj4yrMWj7jWP/mobxxFzw8ipCSOmCrvJ4xINJVnJJsW3oz
 8n5EuRTgrRMSGHPmBB3wzZkTSHzhQwTF6RorUZwEzgNBQhEwy6+CeL2JfennS+g3GUUr
 63OTYd06UIvR1hCGJGGSrfk2fvZZKpfw/KRCX7QuMl7V+WT7b52v7FCfdj6/HDx6L4Mj
 R96ppx+F99Rn/YTZMU7CA82sUp7a4XHT9zs7/5RB5pxiUOmV7MBklb2NJ+YAiYGIBdeK
 xtkg==
X-Gm-Message-State: AOAM533jIieVF8GbzhGaHhLGXEgdxJZlWRxc/sKen+Ow5WLgWQT7zek/
 RYPH3sJDsFP8WmaB5FN1xSuXlg==
X-Received: by 2002:a63:5c07:: with SMTP id q7mr536577pgb.222.1602610213410;
 Tue, 13 Oct 2020 10:30:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y4sm266397pgs.0.2020.10.13.10.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 10:30:12 -0700 (PDT)
Subject: Re: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-8-peter.maydell@linaro.org>
 <CAFEAcA_MN4pzkWV65+2VtUgMdayf6pa-RCLXiomCsntF+38hNQ@mail.gmail.com>
 <9a06ae91-68e1-47a7-c6aa-19c1e2c47dda@linaro.org>
 <CAFEAcA_EHAsJTDV3JjriUC4rNj829LWCp9PNWScz+7uWFxxCGA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ceb80cfb-44ff-cca7-aae7-e4a4dbfabf0d@linaro.org>
Date: Tue, 13 Oct 2020 10:30:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EHAsJTDV3JjriUC4rNj829LWCp9PNWScz+7uWFxxCGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AZD5Ha6ees/5

On 10/13/20 10:12 AM, Peter Maydell wrote:
> On Tue, 13 Oct 2020 at 18:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/12/20 12:56 PM, Peter Maydell wrote:
>>> On Mon, 12 Oct 2020 at 16:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> This turns out not to work, because gen_jmp() always generates
>>> a goto-tb for tb exit 0, and we hit the assert() that exit 0
>>> was not used twice. Here's a fixup to fold into this patch:
>>
>> Indeed.  I was going to suggest that here you should use arm_gen_condlabel()
>> like you did for LE.  Which I think would be still cleaner than your fixup patch.
> 
> I thought about that but it doesn't really fit, because
> the condlabel is for "go to the next instruction
> without having done anything". Here we need to do something
> on that codepath (unlike LE).

Ah, right.

Well, the only further comment is that, in the followup, only WLS gains the IT
block check.  While I understand that's required to avoid an abort in QEMU for
this case, all three of the insns have that case as CONSTRAINED UNPREDICTABLE.
 It might be worthwhile checking for IT in all of them, just to continue our
normal "unpredictable raises sigill, when easy" choice.


r~
