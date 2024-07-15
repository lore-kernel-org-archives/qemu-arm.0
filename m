Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2073840nji;
        Sun, 14 Jul 2024 23:35:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkhQvKpLV5FkTGAWhKV3YoNiOrU284xlg/ZcxNIvCXP5YYaLQvm09tpTyGI0o3sSirvO7uZJXgff2G3MA2ywuM1FqcjnR3
X-Google-Smtp-Source: AGHT+IGabsvIUxSCKwv9EIuPj03xwqc4qzqhvMQCwey3I0QypFpNIXs1YFdE3DdgmXMSZq8MTxIL
X-Received: by 2002:ac8:5e4e:0:b0:447:eb43:5d0a with SMTP id d75a77b69052e-447fa8949f0mr234633161cf.25.1721025333841;
        Sun, 14 Jul 2024 23:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721025333; cv=none;
        d=google.com; s=arc-20160816;
        b=i6mAu9fIvs3ytW4cmDKolNd/iEcPJ4skcXfFKN07+kdLBSUdrji48zkObtQyy6C1dg
         nVZq5GapmC3OBzgMwCzXTjmM1U54/oCOU3MDObm1QsjKE64Gnjyxv5XUWbm0WJ6rcT1e
         LBThT9C+UG+3ypSi65sIrg/4kPEif+fhlZt4he7TXL0wRRYVE03YlZ0QzWkxSefw8Gae
         28ub1SB7/EN3hnOpreQ8oGL/NEBLmE3iKqUTrP39LSejacIsPsQbCtTtrxu77mPpNiRB
         ZUEFjJiykZB6BCZB4GdyxoGgjX8XXxHMw2C+PeuUfoRorDPAGiIDRLyVnOALogTttsLK
         pkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1ZM+8MEwDB7RXfXkCuzXW/XmZtNyrPCPggfs/ca6Pg8=;
        fh=uQrcFWW3CooPl+3nSC3US1f/nKzhJn3I3btK+/z8JJU=;
        b=Jhsz/01bjbwsyS8B2q0iYGjEqKs/sR/1wFqVy0/0GpMCH+Sl6tUW32TaEGR1Km2RxW
         tmMv7kJjkA7Ph9l+PPPwOc8YEw/jie6h3qLLcHwY3zMg+pjJcUqKsFPfQEjCCOIxytck
         xO6ITNm2lsp0uVCjmwkiNavtlC9dOazTeK9TmVcSvcU0HRIqyqcpHr/BMoaVSYq4XS/m
         TTK4n4FW4NhOWSfMyysxA7GCrTK02rWUbux7lWwv1RZndUAnhQIoTOLM0rjeI085GnwZ
         AnSg9QQ0AgwagO2EDC8/t5fyqpGk4u29nbyrU6kCIUv+MZBEFqdvUIqh43DBZvp7umgk
         BKPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LBV8WTBX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b8353bdsi46046391cf.794.2024.07.14.23.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2024 23:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LBV8WTBX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTFIx-0000v3-8L; Mon, 15 Jul 2024 02:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTFIq-0000qf-Hs
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 02:35:17 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTFIo-0000qV-Na
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 02:35:16 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3680667d831so1329393f8f.3
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2024 23:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721025313; x=1721630113; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ZM+8MEwDB7RXfXkCuzXW/XmZtNyrPCPggfs/ca6Pg8=;
 b=LBV8WTBXtUGmRnwffyTfhWy1TIizLoJYXQ4x/AVdIxJ2NFlrJ86A9F3xJ/rOv1Fy4H
 V52RHfV+idRC6+3Fq21hzTNp5/tr+W1sxF1Zqu5SGL9WxposASz57QZUrsmU30JrwnxD
 ZGaDCzu2BnqH3tMPC2wia1xXuGBCn5wZzsSSiCl1vE6PkPVu7Cdi+Ai3u5cV5JjbvYPP
 t3vhzgQ1bIc5MUeDnnfBisYMZIy42r09kMaVpzgMCR3EdjYO0/oq6u3omDTZ+k6zLkXB
 EifjQ0wyeK2gzVsv43ZXXFz3PdkmBkNUhrXBZU9Uqw8lkICfbs0yigB5ANqLQg34GzZ2
 t5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721025313; x=1721630113;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ZM+8MEwDB7RXfXkCuzXW/XmZtNyrPCPggfs/ca6Pg8=;
 b=s8UtOJecqwlVOMx1o28TACPQQpzqi59qTHuSpb2MHmmoclYsvMW82IH4ixaD+mx4Of
 pXODvP9g9alI1gIErdMSCS1vYVzR7drw6YfqJ/Bir7FnxkxB2S35J1Tx8YA+Nmq+FMdI
 Ct+oTfCiKjLDd9zLANYbEPWPgvSmb6p0Zl9NmsVSEKh5fa8CtvU5xprdwSEiC70AiEnT
 DKB3d5q1P3OT+rwZB9ZBhQpYL9uEss42vWPRHrzlDQ8OtOACqDAF9bS6J2ivoBPAv6TO
 BsUlzBNgcF37eHdL6v+XLSAmxZcPGSGsyHYMRwin3u0+icuq1w9Ltx5noUB3WkjIf/TX
 8tyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU52oIQUH2K0Vie1g9D2UWaOSxgAwNzPeOTGONOBb89k0X8VjVgooKoAEAyVerebhEiIba/dT7+BQFCD2y6lHU74xqY2ik=
X-Gm-Message-State: AOJu0YzGJ9u+h5XYjPzkFcP2zd5AUU2LwPujvhZM0WlwckQuDDejKea5
 h1ZEAMyYmgm+HukEDPkzG5Cl/A52JPWMAMDgowd4SMe3YieinAuPaHT978vicdg=
X-Received: by 2002:a5d:4523:0:b0:368:75:26fe with SMTP id
 ffacd0b85a97d-368007527d8mr4950123f8f.32.1721025312721; 
 Sun, 14 Jul 2024 23:35:12 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.134.54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafbb07sm5376464f8f.86.2024.07.14.23.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 23:35:12 -0700 (PDT)
Message-ID: <e70f5115-20a7-47e5-92cf-ab1ff5e7de46@linaro.org>
Date: Mon, 15 Jul 2024 08:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/arm: Use float_status copy in sme_fmopa_s
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: danikhan632@git.sr.ht, qemu-arm@nongnu.org,
 Daniyal Khan <danikhan632@gmail.com>, qemu-stable@nongnu.org
References: <20240715055820.319035-1-richard.henderson@linaro.org>
 <20240715055820.319035-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240715055820.319035-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: +D6lB9mc3bII

On 15/7/24 07:58, Richard Henderson wrote:
> From: Daniyal Khan <danikhan632@gmail.com>
> 
> We made a copy above because the fp exception flags
> are not propagated back to the FPST register, but
> then failed to use the copy.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 558e956c719 ("target/arm: Implement FMOPA, FMOPS (non-widening)")
> Signed-off-by: Daniyal Khan <danikhan632@gmail.com>
> [rth: Split from a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/sme_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

