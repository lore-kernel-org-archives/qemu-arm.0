Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3870499lfg;
        Mon, 15 Mar 2021 11:43:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt30oEERo2rWMaq5TNBweNojPiOy0QQ8mMDlVvW/UW/Xtm9cAtMPzxT3DHxGaKIpBIatc6
X-Received: by 2002:a05:6e02:2:: with SMTP id h2mr776392ilr.81.1615833819820;
        Mon, 15 Mar 2021 11:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615833819; cv=none;
        d=google.com; s=arc-20160816;
        b=lVna1iosiK7m1NMAnjiesL5cIWDgHylyDEMRyYkm0YMwJE1yF5hsio8AUQ5xkkrxKd
         MCP1HI6ErBJYZ9pWvO3SESG3dzRAqtGlh2JTLYibQNl2UK+5eGYLHPkabTHNSJT5fvda
         63KCaN4Axu5RmSYMdK6TlgRoixyrjTC67wJaUN+LqNpSAfyLzvF4grAVqqjB0M2hkMwy
         4atkl9N/LiQe/Ef1MCjumOq02aidWjaIALpHF6T7d69OLONqQS/QDWrKrxCTNgvpY1sX
         39kN4kjYMqFVK+CegbuYezTuUPrkPxmL3Toz+qpQtFNO8uMeQKBg6kImKYrm4c+Jd5RO
         6gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QSNwBVax6qRWT0QDQ3UFEthjPS0Q7Z8eTuLF0JjOKCA=;
        b=kht8L/qgKwpgT1Tli7rnkEOprzQ0doBjkFoSizFQ0fGvXFW/L2bmchpSsXi3H61E79
         qvsqAno670cLKlaJ70ZeRBa66vanNBTdvWJ1gO4NNl64iBUvqmqiQoja/fN9TUQmqaKs
         ZRdDaB8HyAH4pG6i8x5tYK83T1PHV+NS6BfX114G5dT7AYu2/lvgpnOSjc1pemWD918L
         +rDkN9bz9htgVLF+R6haIE4UTQ2Mhz0KBVfjhhQ0hWwO8xcNkj1/9qrPVvsXCFWAzxyw
         A7cvnkGuCzcRlzh4l8KBSK+wafV0QLNRnHebC0pxpMOSQbeMAFtMer2TW1gb8/Mdx+nb
         zlYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=os3GID2C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e203si11353795iof.59.2021.03.15.11.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 11:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=os3GID2C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lLsBn-0001zZ-32
	for alex.bennee@linaro.org; Mon, 15 Mar 2021 14:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lLs2z-0006at-Bl
 for qemu-arm@nongnu.org; Mon, 15 Mar 2021 14:34:33 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:34786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lLs2w-0004VG-C0
 for qemu-arm@nongnu.org; Mon, 15 Mar 2021 14:34:33 -0400
Received: by mail-io1-xd2d.google.com with SMTP id o11so34541220iob.1
 for <qemu-arm@nongnu.org>; Mon, 15 Mar 2021 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QSNwBVax6qRWT0QDQ3UFEthjPS0Q7Z8eTuLF0JjOKCA=;
 b=os3GID2CabbLQmnjkeSlbxerYZ0IRx3zy8MMuDcSc0nANtF1fcjvLjGT5bRSxXdK/A
 fIvDKF1KSOSXkFmOXP43H4RjknEf84U1kpJBNcsm9pLyh9ksSLXKi/pWIp8EaoYb3ZH5
 3jS+m6aG+wPojKYKVK4DZWbXupwz1K3ZzwE6dQteTTjZ0rHaxa7ygTHOvbgGuJO+a4xh
 KCH3X0OEHVEFmlM1zs7Ym98qbnAV5lXtmnIDX+F/tV5nGRkE56Gkk3pU7W5OppRezEpd
 5yomZkA6YjLLK33OJkPda178r0UUcszBiKbNAVdins0oLNqo6uO2c09+GljA2SAqiaK6
 ddCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QSNwBVax6qRWT0QDQ3UFEthjPS0Q7Z8eTuLF0JjOKCA=;
 b=AYCuG8TdW8ZA+T0LoFVuSSt9FJEXd81++3TqtCmkXfnEMCMnatX9kV2Zi/ZQm39hvs
 w9mKeKg69j0LOsU28OvvxVArPa6gUgJsF+0fJlnwHstJq7FMlHkP4amCkbLRLNBz3QAU
 EN8e/ImJoFhpfdpqJw6Qzv61JFvQaYu6IY0NvdK2+XurDmKynyyUS6Fy41m4ayU/THyM
 Sezjq9Xa2SZFTj8Lzb6d0zTJ+vnegMit/EvwqslQrQfDfB0B0a7TsDhQvqr8jeKIVDfV
 RM4RfYy/ZHkMLcxGFcBiOysGgnNLtqIP4FnGSMln8Ga/tp4nYMT7TgdXTSe8YM0wfqMp
 8snw==
X-Gm-Message-State: AOAM5317VthW5JEU/rUJrAdxg8VIt3Ivxqd5wlxxrz8w5s9f2O1oj4Hd
 cUOyMuVl/1sTzoMYFuJ59nzkig==
X-Received: by 2002:a05:6638:e93:: with SMTP id
 p19mr10716435jas.10.1615833268486; 
 Mon, 15 Mar 2021 11:34:28 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id f15sm8259675ilj.24.2021.03.15.11.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:34:28 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <a1fff12e-eef3-f742-be40-3eee395972e7@nuviainc.com>
Date: Mon, 15 Mar 2021 12:34:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b/iFFsU5NGUb

On 3/10/21 12:24 PM, Richard Henderson wrote:
> On 3/9/21 6:29 PM, Rebecca Cran wrote:
>> +void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
>> +                                    unsigned int num_pages, uint16_t 
>> idxmap)
> 
> I am not keen on this interface.  I think you should take either 
> start+end addresses (inclusive) or start+length (in bytes).
> 
> Using num_pages, and as an unsigned int, seems too easy to fail when 
> applied to a different guest.

Do you mean pushing the knowledge of the number of pages to invalidate 
down to cputlb.c? Because I'm thinking there has to be a loop somewhere 
that invalidates each page if a full flush isn't being done?

-- 
Rebecca Cran
