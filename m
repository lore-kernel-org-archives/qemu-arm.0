Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3390675ejc;
        Thu, 16 Nov 2023 02:29:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZtuLH5skNeCNyJm6ZdAZoIZtfbCdBHtgQfiI74WMT35H25EnBQkpTxtuZFHMDtst5UYti
X-Received: by 2002:a05:622a:4d4:b0:421:f619:7e69 with SMTP id q20-20020a05622a04d400b00421f6197e69mr4636741qtx.36.1700130550259;
        Thu, 16 Nov 2023 02:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700130550; cv=none;
        d=google.com; s=arc-20160816;
        b=vS9JyQzV1K7DtddgB0y1nVCbD6vw7e8ndZFq4nBuwwZRYLssNQ6Q/Bs5DWePXKGan2
         XKm5+msv/4sa3xGcmZnViUG1wjSilhg/T9TGaPnFEL59HamhY3wIpZoLUvNg+3WPjwm+
         t0ibkaTckbToCu4KogPrZvUFT794BQo9Cm/1zaiC4BkMbbUUaFGyoptxyTLPOVIZt56D
         7v2VUEEmcCTN1pvXWOaC9y+pWi1wvgJxs/txpG/+dwkf8RZuPCzNmoT8N+7KZkPQaCg9
         FtrgjPYGqMoz9BwVsmO5MtU2toHh5nWLcTXYNB/9tG0Ch3DRbCmrcmmcp/zJLG0l0I6Y
         w3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vp2Yug76sGhP1dRbpTDljUWQDqY76ISbTrciUKra5Os=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=mCjU+sJTqbT9Tcvdx6n5PG3s79YDbkJywBQdGsTO/+FmZLCzR6vUtT24aDOz5UO2dr
         qOw5ZcthZfqtRMfm7tSWMKwWe3CbtWt1oD2jd4ZdT1Jci3hlDiE8EqWrO+cfp5lUYJ7o
         s9PsPjFd8UmdYaiclMXDVar7uMXLJK417X8OXg0YfrCJVck7pVTkLX81zLQoH4bYDUjM
         JBfQUPPTyx2H4qB5gzAfZh1UWoRS3R1xI6XV71e2ICPAE4HdtdMtljWn3YHUvbM7SxvM
         u8W7flEdr4zbwVHE04S8eaxw4MSAIv2iOGHsm29RCYD2TICRLg9RrmV7hS6R6N12NtnM
         hllw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=itRmWaee;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020a05622a134f00b0041e1e0c38f3si11646428qtk.741.2023.11.16.02.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 02:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=itRmWaee;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3ZcB-0001EC-Gx; Thu, 16 Nov 2023 05:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Zc8-00018v-KQ
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 05:28:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Zc4-0005L5-Jq
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 05:28:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40a46ea95f0so5081055e9.2
 for <qemu-devel@nongnu.org>; Thu, 16 Nov 2023 02:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700130517; x=1700735317; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vp2Yug76sGhP1dRbpTDljUWQDqY76ISbTrciUKra5Os=;
 b=itRmWaee7utS1gbigh5QlyVGkfmvLlDX32KkDuNw834i6Ccs8B5vZI51ZnF0CMe7VR
 v0nTj0h6cHC2cTVmXecmtHevBL7mkeoad87PyyuEbdlTRDYOcALoznV/9yvtYvVCSoK4
 9uEX/yYbbqTEyfk7FxNZUIORQn86jU0Fyr/IYqhIxoQU9P1sEQs5NNQ6NQNjTqVOmK+x
 2q6OcazvjRQCy3UPjn/l90WClAIKFmqkYyoxRDpk/cDz1ROpn0gOfbhTAQrDuqClOj8d
 rh0JFd8i5p5IEsmreyeF24B6pdGj1HdFAocLpOy7IDKMy0nZzFB9UbDp/2TaiY4LyuAz
 f/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130517; x=1700735317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vp2Yug76sGhP1dRbpTDljUWQDqY76ISbTrciUKra5Os=;
 b=PDMUCtDwBV4zEmFav8577GR/IofvSdDJGjLfJtJTSfvpoOuTXQFDGI8unOtHYEXUwD
 Pwz0zuNmCt/cfEvaH5l5wqrBZ9qacx0ogyKo4b13IbsquZReiDJZDfKCyPkQr1x6OoNj
 Izl8xdjvieqGbs0NXSKvrZKwU7kobzqXKhr5jW92PpfDjcW2OhJOdutjACwpysftM28K
 WIpJg2100HVwC4Vhy/Kn3dblhqFRKruU2zd+WXhjNk/D9jfF8t7U8pXOWSSUSeQ+G8gd
 NrPXG6cVKQTue4w5OByfc+eSIhEDMJTQSs2DgxsoqREJJNIAaIiUa9HM/ddHLUyD0FqY
 NvLw==
X-Gm-Message-State: AOJu0YxyKT9blMTgrZMWhYjbPRRIAEdvuaUFDVDkbI+1cFoQlubyWh3v
 i9/di4pY8B8lVqPsVBl20hZGPw==
X-Received: by 2002:a05:600c:4706:b0:405:4a78:a892 with SMTP id
 v6-20020a05600c470600b004054a78a892mr11321053wmo.9.1700130516753; 
 Thu, 16 Nov 2023 02:28:36 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b003fee6e170f9sm3001006wmf.45.2023.11.16.02.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:28:36 -0800 (PST)
Message-ID: <fea2352f-8511-44b9-88e8-410240aa719c@linaro.org>
Date: Thu, 16 Nov 2023 11:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/31] target/riscv: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-18-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-18-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 2g3eRzMq3Smi

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-riscv64 -cpu ?
> any
> max
> rv64
> shakti-c
> sifive-e51
> sifive-u54
> thead-c906
> veyron-v1
> x-rv128
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-riscv64 -cpu ?
> Available CPUs:
>    any
>    max
>    rv64
>    shakti-c
>    sifive-e51
>    sifive-u54
>    thead-c906
>    veyron-v1
>    x-rv128
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/riscv/cpu.c | 29 -----------------------------
>   target/riscv/cpu.h |  2 --
>   2 files changed, 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

