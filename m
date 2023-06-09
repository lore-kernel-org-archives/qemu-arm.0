Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp605508ejb;
        Fri, 9 Jun 2023 12:43:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FHL3EXIa+ZKOK6kLHKdo7zsM8nCkZoMqd7uTM4JUWQ52wkkt9Ep3PlsHnh2VKvWekiAin
X-Received: by 2002:ad4:5cc5:0:b0:628:7be8:97b7 with SMTP id iu5-20020ad45cc5000000b006287be897b7mr3844601qvb.23.1686339801309;
        Fri, 09 Jun 2023 12:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686339801; cv=none;
        d=google.com; s=arc-20160816;
        b=kvrX51RqUA2ZrHWW2EWiTItgwDtcpxv0w1kXXqDjWKb33JlvSXUgcc3pz/hvJ8rJE+
         LRP8CwP1ACPgVa59Saa7RmmHDE+DwVwJpMz2yAZznhq9va8/26fN2CS5RWtjj+7g/VuU
         GnHZt6F2ZsheKrpqZ5TK7gPjVQJWoAJy534Qwg55vUxzBNbn6elucxZoGV5+VDQuKqA9
         NpfgwcO8JQq3ftKDqJjBcngWG2I82ZxMwk9jYc7sJKl9kgFz7RWX8zBNEUCgEzVC0Mz+
         aRRgvtKKXOimEAvn5/jp5GOAlqfu4AOMVnQilgkyphFG+jqAIYGa2LYd+rURZv5fyTmG
         qIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WLCcyKrO3rHV9OQbuMvJS+cXaXIG1J3bnykCNeWAn4Y=;
        b=O/LvCdREDlE6a6V6xewaGkCfsy2W21Mk8ThiCQTFgEQ5nsKT6xvhlEOA5ODYYah0QJ
         PX66UCD/9BtnyD+CoGqEYvclyDTb8CzRIyW9V85YJuAXoa+Qiit82sZkryk2bvg4Znh0
         b9EnGWdHtaiTTk2ERNXU6JtadWqyAhfP6uzVHYSh6VE/v67RUDNo8qKTk9b+T5c5UplG
         wUqD0Pnis22xv4hXwiW8F8owVCSzWmI9CQC0zdaytyXgPtJ+teaO6CdEFrZnQFVv49uO
         mXOlI6jOyVVLX7SeghP1zzQ4ZjioO/bWepfInWalI891HUuwHTgKEWAF46cUuAm9wxNe
         bgCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bk7hnD1c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w27-20020a05620a129b00b0074acaf141ccsi2559868qki.676.2023.06.09.12.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 12:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bk7hnD1c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7i0l-0001re-9a; Fri, 09 Jun 2023 15:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7i0k-0001r7-4S
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 15:43:02 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7i0h-00081F-JX
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 15:43:01 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-653bed78635so1581771b3a.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jun 2023 12:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686339778; x=1688931778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WLCcyKrO3rHV9OQbuMvJS+cXaXIG1J3bnykCNeWAn4Y=;
 b=Bk7hnD1cDxLtseHwqMQ+zlsu8AW57NQqWAwFlrhOhOV7/X2gpMb9o3xjUTJWpdD2dT
 ZbIy4OLzF2vfroeYkOnWosY/5Bl8K24YHum7hQi4dvtCI/cDZQ0e8HDUwkcbq5O66v3L
 RKDoYw+ma8g034N2so/BGC67SMVXALQIg6OfqeOL8uzmD0tGMEJmRKVYpw2tHCLPLAbd
 8CCyQAdnBhpJ/V1dI+9ropNRtsmRMpQNCie2Wy0TqiwuJ2eQx36c5z1PEUG/BwE1QCym
 gmg9TNglXCo3qaBYt4APxUqbYiQzpW8V8OlogLIEgtEHLLVMumnHbRtQjTxGdaBGOMRq
 M+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686339778; x=1688931778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WLCcyKrO3rHV9OQbuMvJS+cXaXIG1J3bnykCNeWAn4Y=;
 b=MxZ8G20ze4+h/VxihDMJ9MTTc3d2+MSFHLWdEnoD88z04Zri0j2RfV2sHyQWwiy9CA
 kOsPXuLFRh9aBRaIg/xQs6Amc34PekFSCSHL2AnkuCX6KRvzhTKV+AchqhVFE7XVqASR
 Or+jv0uXhZqmm9YEPVm6r/5DnI300+YbyKNBIoWvkf77dJ4uqTZs+CXdk/MQbZkLRXRC
 9Afy11O9+1vmhy6St2yeltHAh2gkylpVdOftwpPzsvaYMC3ISjVPdL3GYcfOBcaf06aj
 Jb0KnKpD7Izwf/p+l7tdJd2EeKbphzQhNNwVKq/4spFM2rv6MV/pWLPoL/6SesPaW1LI
 2TVg==
X-Gm-Message-State: AC+VfDwYlhRiMCWskYzjHBFplspY1SGPNgBwOxfA+mvmZysR5fi+uqwY
 IH4mQvlg3vj+4lXjVUVaK211Bg==
X-Received: by 2002:a05:6a20:8f26:b0:110:f66c:a0e1 with SMTP id
 b38-20020a056a208f2600b00110f66ca0e1mr3166150pzk.14.1686339778025; 
 Fri, 09 Jun 2023 12:42:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 u5-20020aa78385000000b0064d4d11b8bfsm2992631pfm.59.2023.06.09.12.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 12:42:57 -0700 (PDT)
Message-ID: <5b5d8f93-a81f-2b96-17f2-ab6fd49293f4@linaro.org>
Date: Fri, 9 Jun 2023 12:42:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 13/22] target/arm/tcg: Extract NEON definitions to
 'helper-neon.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-14-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: y2Ll2NgsEg6/

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> helper.h is used by all units, but not all require the NEON
> definitions. Move them to a new header; the next commit will
> remove it from the common helper.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h              | 206 +------------------------------
>   target/arm/tcg/helper-neon.h.inc | 205 ++++++++++++++++++++++++++++++
>   2 files changed, 206 insertions(+), 205 deletions(-)
>   create mode 100644 target/arm/tcg/helper-neon.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
