Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp169607ejv;
        Thu, 11 Apr 2024 13:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVd99/EoVP3QBQNvDlMD/UjAktMJ8nFP0baQGw2E1qoQNLYLMOEVqy7U4njjrGCPW5eLDRf5HomxWhEyBR8bEeM92jjn4sP
X-Google-Smtp-Source: AGHT+IFwwlSQsARCC/jBbAnJ7RyC7/dBJC2qEWATehWYtBWOD49Jw/i3Qh9WYGvNQOPLgZKbTre3
X-Received: by 2002:a05:622a:606:b0:434:89af:bd3b with SMTP id z6-20020a05622a060600b0043489afbd3bmr871472qta.40.1712867673305;
        Thu, 11 Apr 2024 13:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712867673; cv=none;
        d=google.com; s=arc-20160816;
        b=MSBVHMXmVR//CLPpG9UcmdMkEdFh4NW49PAVLqg1NRp6SWed10StLYptEf9gbnpgYo
         ZsM3G9y+7sUxyBSZrgcwrrmFEFiX8zijUUyb6tamGgs7Dwv4mKvgMFpQzThIK2smd8zV
         Tcuxrm1iOnnQpCX6bV2Z7MWZwjQpFvPHHTLjgnORSsicINbI8U5mGdlfKmHYJqcOepwt
         M3A+VcCbZFGKxj6xtqjGywQ5u79J466RQEyp1SlT68U3wpREsxbejcsPXyScfXdCFIJr
         9Yh5Sp3fnUXNmauehb+wI2G8ALR0xzhFTMYjfAR3gMEa1yn0noWvkIDO/8CMG+EGWA1z
         8HSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DIFwJw7nxzI8TgUbQsZmhWeHrsU0VGJ/tbEGDLAdra0=;
        fh=DYxFEC1sFBL94PbgajS5Zrig2dzxo/T30f3yCJ4HC30=;
        b=I3BABWxKAYA9ofo2p/M08uX4PMHcxc7LahWfIX49yJYfFaqgb39Q26VgPhWj57e+l4
         Ri+Zrdu9Q8HlPyhd8dqyJuCItyaUxYbrtNr4QyMpC5+BgzZ58oul+U9Timahv3FWvi3y
         6n+SLWOYVVGEwAVoA7elYWBBWAyZe6dejRRGyDb2J/7E9hoWLEo7sgnjVLtXp8CCfMuO
         v7xqtu0EfETwLFPIzB7yu0StmHD/anoY8SKQOKMtutsVsvyPEySP/SWRuDTkqA2byetn
         Fod7rg+F4DV4Tg0ELjiSXPDyWX4A4eiwXVUihEkJBzrvbI7AsHaRz1JuF8OZDmlbt+Mn
         mU6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vagTANW6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020ac85996000000b00436742616e7si1320198qte.237.2024.04.11.13.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 13:34:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vagTANW6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rv17Z-0002Sr-No; Thu, 11 Apr 2024 16:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv17X-0002S7-CP
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 16:34:07 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv17W-0002JD-0q
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 16:34:07 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6ed11782727so258629b3a.1
 for <qemu-devel@nongnu.org>; Thu, 11 Apr 2024 13:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712867644; x=1713472444; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DIFwJw7nxzI8TgUbQsZmhWeHrsU0VGJ/tbEGDLAdra0=;
 b=vagTANW6+tCAYquyz07nMS4pvfd08e3FfVqY09e9cRf26yDhu2jUsc+Hh/Kzj1lPmd
 jPbOpvBlKgpILQYJDj02p939COxgy+U1LMkk8MIZGbV8HEtY4VPTwzjebTe6Sy1m6jcq
 caphDD3UFoKW0aNkqFhGWoZYpXaAjIubwFoG8yLBYei/vSInBNqykXvbZceW//1QQZ5m
 bdk6m3b86pcdRvoxKRsBwRg+wBWHKoTgNN6FkroIG9IWCH///MoKSc2YctCjmSfCH0AW
 ARl4UHFjZ61Qq5KBilgpJnUn7/78+uiGYxByC9tRlCWbE6rm3mS7mdvJkzDPgYEFq8c1
 VnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712867644; x=1713472444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DIFwJw7nxzI8TgUbQsZmhWeHrsU0VGJ/tbEGDLAdra0=;
 b=FTN/pOPwIJ2xkHyGGjsYa2M60PLX/YwYuF9CWdpHyL/6tNMKdMKyZz+dLcWhoksxw2
 X7y3iLOzygqfugVz85H2EUBS9DHU/1N9/EHBbYycIDp0vTmIksMtZk2r5xy/IeRyd4OI
 A0ySzfSTaw3ZR7SrcTbJMgVKcAKV6sB0I0NiXuyzXx0D/NLvFVsJFyrTToS2ofqMfGSg
 jZxOCy0AFEF4Z8SJSqDHdo6Ad1jPXImJC02SMpXVW8Bi+ng3xW6rXF2JbbLblzN+AfC1
 hPX4jqTdyXBM6EDIoBb+wiXa+wTUl6bT+in5MnB/TMln9PRdRSzD7VXRyd6sQnhOyEUB
 KJbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPBhqifV1tDBm2gZDFCevaRXarDWcr+UuTcZaD3oCiyELiNc9JhGnPAc86PJGf7juf7hFf/TcuJCTwePuVIGmnzQhNKZ4=
X-Gm-Message-State: AOJu0YxkwGv49ia2SNDJLgEWo2sYvPZRqguHTNor49yrsmyjkQnO4DR0
 aAf1imXGUNSgMMwB7+epjIc/m/SKW9YPGLGjRM1U15mIZJcv7y+isLgqA4hGHZ0=
X-Received: by 2002:a05:6a20:9145:b0:1a7:824f:bb31 with SMTP id
 x5-20020a056a20914500b001a7824fbb31mr1234580pzc.8.1712867643739; 
 Thu, 11 Apr 2024 13:34:03 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170902dad200b001e451abffebsm1583082plx.86.2024.04.11.13.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:34:03 -0700 (PDT)
Message-ID: <e547de0b-cac3-43ff-9fee-6cb4494a31a7@linaro.org>
Date: Thu, 11 Apr 2024 13:34:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] util/hexdump: Rename @offset argument in
 qemu_hexdump_line()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411101550.99392-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Crv910Qci0sK

On 4/11/24 03:15, Philippe Mathieu-Daudé wrote:
> @offset argument is more descriptive than @b.
> 
> Inverse @bufptr <-> @offset arguments order.
> 
> Document qemu_hexdump_line().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/qemu/cutils.h  | 11 +++++++++--
>   hw/virtio/vhost-vdpa.c |  8 ++++----
>   util/hexdump.c         | 16 ++++++++--------
>   3 files changed, 21 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
