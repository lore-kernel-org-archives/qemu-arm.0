Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1725007lfb;
        Fri, 13 Nov 2020 13:26:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ953sdPeKcT5c4w9ElueeYIk2Yhj89SykarvZHXn4ivymcWB5TFJFgFbWrZKr8KDXWWGV
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr5967300ybc.273.1605302804538;
        Fri, 13 Nov 2020 13:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605302804; cv=none;
        d=google.com; s=arc-20160816;
        b=llHIcaqBA1a9ZGT+iwg5DZ+vogNL6tvnlTCpePt9CwhMMQ1xCSkxUuaDEfWk5eI9ji
         QzuH35xB9QD1aCTc+NoCQOwX+sw7RQH7WaypMBvuNx7dI9hj/lkJ0LSvuepyiaQpgSxi
         B/4dd4Vp38j1va/1nO3+2euaj9wG53j9bVMnHHv/s5QMce6DEFF8tAWms6TfCWyHNWYw
         snmziu4jWzoaBY893CPvZ86lwP4r5ADWWrt2Jh6wEkTZMe59gTTA4e/wpU1ZXBxKvf46
         7cYLeB0qZvea/jWWcgu4xyaBD/HRCbVN4FcoWtjbjx4v12l7tVBTtXbdneYnld1h9jSK
         Nlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iL0uRLI+yG9JxO21dMlu+eUszT9UXMWWrIEir3O7G28=;
        b=h/F9t2YGMQoEUIyT1sDlbIrh4YnIVdjXgE9/bB5owjcvxmoNAWq0DijlKvNcMcCSqm
         9m9A8DeRBzqej2v1iSBBwW/QAqc0Xqcx0WR70LiXwTfE4WihT2HvacQLGph1fCQRS4QN
         UFSrPXzMtx+u0saphrUa/w/VhYRh0pz4PvR5u6QTFq2mhvZXRXoPUP3Qt7DU5OOrMMJm
         8/iB1bSuGDq9oYxpUYdO5chq7zAOK+sddfwG4xQ9yxMNife96lka0hj9sxXTxeCASdsm
         Ku1GeTUstatTdJVyuGS7zS2nAV9aNjEksErTJaz23D4duBDvHd915LijoRN/igjecENs
         1TIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bOJYfXvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si9397839ybq.440.2020.11.13.13.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 13:26:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bOJYfXvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdgah-0000ML-Rg
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 16:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgaE-0000Ju-Mb
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:26:14 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgaC-0006jW-Su
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:26:14 -0500
Received: by mail-pf1-x442.google.com with SMTP id q5so8703366pfk.6
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 13:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iL0uRLI+yG9JxO21dMlu+eUszT9UXMWWrIEir3O7G28=;
 b=bOJYfXvGhivmabXxnuAaFlOILafCilhicL0NbYd1KvhTrg83h1Xen4BNtifCkN7G9J
 AxZXLVZpuRWFsZLOVGG8WwjCAp5okDzAuUbgDH62TJzjlElkBlFPxzsxlY9iU+h6/2Lb
 VWTrfklzoEjOPn125FMucybd76QHW+DxU4F1Sfb1zr+OcO5At3WC0JYqwFclzfb38XZh
 9wZzuej8gw6FYUl6HEVED0SEYlFBh+OcELxmNGcprJ3veUW6DcY/fKri4URXKlvGedYI
 bMUAvGOKrzIvVE/VcdjRb8A0lGrOTK/qjII8iCO/DgJWNM6lThhz2+vQ/QQkO1+pDq9o
 ZZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iL0uRLI+yG9JxO21dMlu+eUszT9UXMWWrIEir3O7G28=;
 b=SAyztJHil/IOEa1SJ68lc2vU3jQWsB0pfONAzPbe9YgVzYJyz4aQy2YJLGbR7POyJD
 wxAjqK3v+UYxTbng7pI+MQZ135FcEwMqg+v7k3HnK4FZsuchP/5CzDu9zhVDk5azVi4T
 ceCNdfVe6lZMRDrnsxlb0TGMWQ7/2LJEvWG8gCtRVKSXZgZ3zzaC9wIK4e+I8+DJzy6K
 i29dauyWI1Lm5Xm2s518B0ao3Xa+kINIUnKsGIOzu5mSBpSzRiGLhEWY1PIvXoD3Hy5C
 4FOiup/XQN+ujRvjU67gVOEGaPrFRuozbSb73+nKLsC57G9vGivXFOBud3rTTaoQNLPk
 hL7A==
X-Gm-Message-State: AOAM530UXi6mD2hbRU3vTKMu16KJRM18QprR9eBhjeJXmYrAn0o/jn1h
 5pir3GA+O7i8bTAI+pefs9XusQ==
X-Received: by 2002:a17:90a:4881:: with SMTP id
 b1mr5038256pjh.32.1605302771268; 
 Fri, 13 Nov 2020 13:26:11 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j19sm11536828pfd.189.2020.11.13.13.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:26:10 -0800 (PST)
Subject: Re: [PATCH 09/17] target/arm: add MMU stage 1 for Secure EL2
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-9-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6aaa5ef-bf43-4d95-3ce5-850dc888eefa@linaro.org>
Date: Fri, 13 Nov 2020 13:26:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-9-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PQgU1jhh8v1O

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This adds the MMU indices for EL2 stage 1 in secure mode.
> 
> To keep code contained, which is largelly identical between secure and
> non-secure modes, the MMU indices are reassigned. The new assignments
> provide a systematic pattern with a non-secure bit.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu-param.h     |   2 +-
>  target/arm/cpu.h           |  37 +++++++----
>  target/arm/helper.c        | 127 ++++++++++++++++++++++++-------------
>  target/arm/internals.h     |  12 ++++
>  target/arm/translate-a64.c |   4 ++
>  5 files changed, 124 insertions(+), 58 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
