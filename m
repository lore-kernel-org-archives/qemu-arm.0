Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1443860ejm;
        Fri, 21 Apr 2023 15:20:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350asdJ5XMEyhM5iS9O5CAt1uX0ngYWGh0/uV60UYApDdMaGnzo/4n7sq8umdNQAv60A+ke0i
X-Received: by 2002:a05:622a:42:b0:3ec:45c7:33be with SMTP id y2-20020a05622a004200b003ec45c733bemr11670287qtw.42.1682115622078;
        Fri, 21 Apr 2023 15:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682115622; cv=none;
        d=google.com; s=arc-20160816;
        b=TPuckcn+wkiAKCVlGo7ioLN+urIvSP/QKMBbeb6b6zSmQqeGU4qkBSHBjTwJmMpRSR
         KnRrukYnoHJ4VE5zjyy56MgepoNIpcHN2BaKsnTaXg2yaRJTsDTKX2mRQdDUwr70jKia
         LDch9lUhUQAIqwa4L/z57oJyOlYDhV9DGZVaVQ0ebZFDS6NWfhTdW/ig/Q8CyuZKdmrp
         0O6HpEQ9Bu4y8y/lMCHvW8NdxH+fF82DHmpq/lOGhN1Eui4Jthb1xnEgElH6wL9GrjHO
         hR7/j44jueOT3tbyoS4E6oTbOEyBhZj6deQKTWAeV3LqePiEij/oj9eD+WTPf1kl8cnu
         C91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hH+CvDoYoPdBsPqTz0C7nRbqeWnKiOcvphox59dCQ68=;
        b=ONikrUqPdmiY5Sjc04aHWS5ZPLCk6P+HbQik1w4prGPgSeKIL8W5NVOxPIJLr94FNc
         Jwdjdx56Jmh2p/b6PNBeBOvNKZWGeoIC4Ppal5YyVPq48f+kDdaMUKCEA4k2LlfHeytw
         VB26qcMvvFHHfCkTQc+kOH/E6xW/YEkQ4SbkI4v6VQGeacD5Zug8KjYSOvuC6AVIjlT8
         0t/IiWm85RDWeA3zzrifAr4KBjNr77eTcbhH0jm20Ryu+9Yrs2AIPmjGC9LgpGrHV+n9
         uYHzXvE+8fjIu0x6/4hHn7dVX8hP6p7yid0fqP9eOp7KeAlJrIqAh5AfCGfnPq7NnMCM
         V9hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d3zdmNgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020ac85711000000b003e4e9ddc6f9si3863433qtw.118.2023.04.21.15.20.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d3zdmNgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppz6s-0007GC-JL; Fri, 21 Apr 2023 18:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz6r-0007FJ-2V
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:20:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz6p-00043D-E0
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:20:04 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so2056747f8f.0
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115601; x=1684707601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hH+CvDoYoPdBsPqTz0C7nRbqeWnKiOcvphox59dCQ68=;
 b=d3zdmNgJqtRRNR3T3SoYkl2b6O68Gpabj3V7I5IxolrXcSWwuxEjeuUHEYR3+LrGTZ
 3ZY+iVJzNKxyCUOH7k3Vx59sXBwLsm1DDiDKzBl5p7+kJKDXeOStpluLV4/Ojr8AjVch
 2gmhszFUuRzPEjmO8mbNg5gq1iTS/uO4+4FiYzBRMh3PFenAetd8Dq/TqqpK0YTjzqnx
 68gDRyvUp/FhThbnarAv9LjLisYQ2E9Acpk4nOGPtVsE19hS7pLXB00yzyc9MTHNb1+J
 RFTmcTgIEliztXbuxcZCL4P/uVAhzjaZXfCx71QbSN2VY6Nr3XDGvdvOnLAfi3n5VKZA
 PxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115601; x=1684707601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hH+CvDoYoPdBsPqTz0C7nRbqeWnKiOcvphox59dCQ68=;
 b=FRlENlqy1kzyfYqDW9+aklyIyEBMzSYxDpkWieYK7Ti29Dtg7PTDCSNuCdbKflEQZg
 l/NPZFFR6ygElZdrfiAU6DofpGLfgEqwngGMbAoh0v1QzLyGVpRt+X+BUPefjF84Psp9
 nlt54SqGZr1sjnpms++8wAvSZwVc38mFhnEe6750csZUs5vtHc4WcVN4GE4IveouSjLF
 cyQ99Ej3cvizfsTgSumRjFmmD8E5mUFJNmjTwtnBfGxlD4qQQSZT4EKHFw8MZe2LjbcC
 7XBDjDSylhsemJoli4j/IVdFpZjiPpWnaz9fwEAnawoVkwFaaKdFSzKjLyHAdkS16Nba
 v+xA==
X-Gm-Message-State: AAQBX9dtfOYdYpv8rAaNAtnQZz6Dh0SFhifOAyLB+AZC4TT3UyAFbcOp
 6P57h2F6NofI3YSNcleNa7rzAQ==
X-Received: by 2002:a5d:5582:0:b0:2fc:4e4:b4dd with SMTP id
 i2-20020a5d5582000000b002fc04e4b4ddmr5091979wrv.33.1682115601701; 
 Fri, 21 Apr 2023 15:20:01 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c215300b003ee20b4b2dasm5854655wml.46.2023.04.21.15.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:20:01 -0700 (PDT)
Message-ID: <7f944d19-fb20-cc39-e03f-4d59a7c951b5@linaro.org>
Date: Sat, 22 Apr 2023 00:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 21/54] tcg/aarch64: Rationalize args to
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LIrReXkHwYGN

On 11/4/23 03:04, Richard Henderson wrote:
> Mark the argument registers const, because they must be passed to
> add_qemu_ldst_label unmodified.  Rename the 'ext' parameter 'data_type' to
> make the use clearer; pass it to tcg_out_qemu_st as well to even out the
> interfaces.  Rename the 'otype' local 'addr_type' to make the use clearer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 42 ++++++++++++++++++------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

