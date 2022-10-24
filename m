Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3432123ejn;
        Mon, 24 Oct 2022 09:30:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43NlgK9CnlBN+GJjvAX/+UcjEG9/XIUO1ugglXqu4fDj1UP2s3WV7dg4y2VeGYzrukqTnk
X-Received: by 2002:a05:6214:2aa6:b0:4b1:95e9:f948 with SMTP id js6-20020a0562142aa600b004b195e9f948mr27871936qvb.129.1666629043286;
        Mon, 24 Oct 2022 09:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666629043; cv=none;
        d=google.com; s=arc-20160816;
        b=MooQgolXasnAsYux78UDwxVkcWI9NlfLkmQgSapu+ZlOZVstyvUlrsBVWRbtZjUgt6
         F3wqwUualz0RlI2JP+rd+DOqprHGMJJqoq3dEWeeodruyP4mFUKtcGFX4g+vXr4Okkyr
         UNlKw3QdtvAvrNKrDWt6lMGHe26p/jnoTOAzHxlPPmFKLYHjZGtEI6F99v4JXfycFdB8
         EirDZZYkFnj2UZ9viONMfWHuwiOpKdeUXLdzb/w9YNtxbuCKNFhdYJqBnhsxkTDHe22P
         jKZSXGYbDkJ6wOQ8VpYXzpbcSgFbqz8aJH4VutRTqADurM1dS7hB0wnYUSUISRGSJosg
         k9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id;
        bh=922FEVrlWbgeOrUt1bJviXh8QaPc2Br7SKvlPOAVb1g=;
        b=DQ8utcH2pWRFheZvfLlKxLQWanPLO+AJ1Y1Urc+rA4s03LTKRbe7zlRB/Q2xa0PoJY
         0kK8Ymj1L23QNTFcN9AZrBLJRCdGjAZNpNOIbQXq6+CLRxaRMD5uwajTBHDowa/qviOX
         b6cNAvEzxCN5vfdA7KiI6sSyWBZB+cTd+kxiulL0PSTdzh9ZtXHRdVd4jttMFxrSX6i2
         LcHxYOGCFj6gOfH3hljqxDasduMUYMVgJibbfEkGUyj49rgxnBWR5uRc2VXa5r6YRGSL
         I8J92ikyYpvrWgSweMdYTqvbkZ0Ndimh6J8BpQstlL2WrjW3pJIphCL0eug5Lqm1FYIM
         69OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=codethink.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23-20020ac84597000000b0035d420c4ba6si250377qtn.14.2022.10.24.09.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Oct 2022 09:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=codethink.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzmT-0004za-NT; Mon, 24 Oct 2022 11:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1omzmQ-0004yj-VU; Mon, 24 Oct 2022 11:54:22 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1omzmP-00050i-CQ; Mon, 24 Oct 2022 11:54:22 -0400
Received: from [167.98.27.226] (helo=[10.35.6.130])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1omzDu-002Qlb-KQ; Mon, 24 Oct 2022 16:18:43 +0100
Message-ID: <3c28b299-28ce-04f0-1430-f2b2ca0f2a95@codethink.co.uk>
Date: Mon, 24 Oct 2022 16:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: add qemu_fdt_setprop_strings
Content-Language: en-GB
To: Andrew Jones <ajones@ventanamicro.com>, Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
References: <20221021055808.342055-1-qemu@ben.fluff.org>
 <20221021070047.225ngzlqqwsvgbqw@kamzik>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20221021070047.225ngzlqqwsvgbqw@kamzik>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +U/bQyKjTHkI

On 21/10/2022 08:00, Andrew Jones wrote:
> On Fri, Oct 21, 2022 at 06:58:02AM +0100, Ben Dooks wrote:
>> Add a qemu_fdt_setprop_strings to set a string array into a device-tree.
>>
>> Only minor updates from v4 to fix a couple of minor patch issues.
> 
> Please see the comments I made on patch 1 of the v4 series, they should
> be addressed. Also, I'm pretty sure I gave r-b's on most, or the rest,
> of the series, but I don't see those here in v5. And, please CC previous
> reviewers when sending out new versions. Finally, why not generate this
> cover letter with git-format-patch?

I'll go back and check the reports, I think I missed the "static const"
one.

I did completely forget to update the reviewed comments, so will do that
and post a V6 this week.

> Thanks,
> drew
> 
> 

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

