Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp600743ejq;
        Wed, 24 Jan 2024 15:12:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc8MXbMQETIFqv10XUhRyu11Uxo7YLyacI9bABM0EuAMuwXv1+kushq7Ng8eDibmwkc+YI
X-Received: by 2002:a05:622a:104a:b0:42a:60c3:781c with SMTP id f10-20020a05622a104a00b0042a60c3781cmr97412qte.31.1706137942454;
        Wed, 24 Jan 2024 15:12:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706137942; cv=none;
        d=google.com; s=arc-20160816;
        b=ykCBCI4Cf1gWKMkIJmhrw/AdnG2/P05eGnoCgCv/7PDxaJQWDd6xXdFnKTufHXyHJO
         Fs0kdOAACFln1wT2NKpSWBLpzLh1Lj0l8OjE9La4722K1aSWr/arbB9Gsqnz0ZpiX3v2
         K9n0QT/GRVRKFKZsy6ms/3S0LeoC+klxpNiQH5JDhHudmMHoHlvkwNFCM1V4otmfaAHh
         cICmrfKIqbN4ImsIJgxjLfBS0OzvHlAsg0ENIJg4TZbgNf/phfE9qx8HrSJYusxQsjKx
         abat+0x+WkSl++a/XxjJKh4QS9JiUHW51AMdqDUP1QhK5EPlOZiO+GuJxBAEax5uwfsE
         8pVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zL3mSug7ypJbX1MFggy4uUYgCNI2fpmdw45ztge7c4g=;
        fh=tvSoKfKG0C5+rZg70buX4YLSasjjtzKPCVsIOCyBYc8=;
        b=tUXsukzUVoloSUxTjT4gfQWoDnC6045KDqnBRp+ubFPdZJtFcTNcUu8Ce2s7bgvb9G
         iy8Aq8Wunoj3SEXV+pCpkbq62kXBmYxSD5cblsKuxY7lwm91n556IcGJlaBxf2lpjGAO
         PWK7DF/OmtvE/r/wFAspy8Vd7kUJD1wYpcRnq5Vfyh9bRN+0CPsQEnNyLH5AWKSmYkl7
         BU6vKbOv6ngeo9iDucYexz+eUnGJgv3j+N4X7YRpRhlS3RkyYsLFHxt2AK8JqOF1GREj
         jokEIckuhDIo5RXzL6YmPzx2gCp2QHC7wRYOBJYixFXkh59AMZY7/P6GXV9/BPiToL6o
         IfVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gia+n8iZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020ac87f8e000000b0042a33d9de42si10165996qtj.405.2024.01.24.15.12.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:12:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gia+n8iZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSmPk-0007Cn-VP; Wed, 24 Jan 2024 18:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmPj-0007AP-FY
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:12:11 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmPh-00043C-QT
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:12:11 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6dd839abbf7so2021071b3a.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 15:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706137928; x=1706742728; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zL3mSug7ypJbX1MFggy4uUYgCNI2fpmdw45ztge7c4g=;
 b=Gia+n8iZ8zowOcI2DVXy2cyATlqper31GrokJmblpkhocve3Pcl/6Y0eTxnlZ/MXAE
 Ze+JTFwSNQyZuQy7mn2MsibaETrOPteCBIbDAwurViUCrAJjPbN4+nWJZ9JNhVPvwvq2
 L2fUCPNotcGOYGAJGploullroDD4M/P/GYYm5xr8/bQ+tQ8miFtYtKxTW1P49zOpaA23
 /nsrzG4rd25jYblE4kszaDnW0Rr/AetEVkO9S7lnr+y2BIEAMZkSBQrl5vnVMRXNtHYy
 LYmA3K/kq2qNLbX58cxDOCcNzfnn3NrpiPEWhLBbax/aARmNQwDW72K96Z0wxlv6Gxkl
 0lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706137928; x=1706742728;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zL3mSug7ypJbX1MFggy4uUYgCNI2fpmdw45ztge7c4g=;
 b=CazwCB5lFGvQ1AjiuniRXcSC+/76zxGytbyd2v6/53TDMmaKs3ZCGTh+XA6FQcKpDf
 0rzBo7G2JCf3mUFFOxglC3nDNEIMQ/VrbgaJFucWrNE4C+ihZczhVcEzPHuhRx+qqw+F
 FzTD8kCKUPhxIQgXBfDNkZiNlyTw1QOuQmx26Pse8kvwF8mwb2s1UY8ri9ys3rh7mygb
 rNiyfoQK0mXCf/jWgJ1qjqaR7UpZkv/vVNg1gLnOpjYAZI/htL0sJyPWtD6TgQuqb1K6
 ezCb36EsyiEqht5ziaGV/gwSvNb6/NUmfHs41hYaZC2fidOszWqRG3OTEFYlRsxWkZKw
 PqnA==
X-Gm-Message-State: AOJu0YzcKnd4Ipiw4AkEzqXqTvTXdXMyPbssbHejdLKuxatiCR8hs0u8
 gBHdLwZLrvC4jeeH1Kj5g1liGLieXKTEsxid3gUtpczidqf1wAITJbG3Dkhb3Is=
X-Received: by 2002:a05:6a20:938d:b0:19c:5651:adc1 with SMTP id
 x13-20020a056a20938d00b0019c5651adc1mr237077pzh.38.1706137928455; 
 Wed, 24 Jan 2024 15:12:08 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a056a0010c100b006dbc750ea5asm9684090pfu.196.2024.01.24.15.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:12:08 -0800 (PST)
Message-ID: <647778a6-9711-49d8-a160-76be371011ef@linaro.org>
Date: Thu, 25 Jan 2024 09:12:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hw/arm/aspeed: Remove dead code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123224842.18485-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: B6BAN9mxp00L

On 1/24/24 08:48, Philippe Mathieu-Daudé wrote:
> Remove copy/paste typo from commit 6c323aba40 ("hw/arm/aspeed:
> Adding new machine Tiogapass in QEMU").
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/aspeed.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
