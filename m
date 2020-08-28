Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1766307lfc;
        Fri, 28 Aug 2020 13:33:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylOGvkbl32aZdahsKWZhxirJsCb0pGQTs41w8ikZZiVvOFdCJLS21erKPg99CUR++T/s8e
X-Received: by 2002:a25:b83:: with SMTP id 125mr5237312ybl.173.1598646833775;
        Fri, 28 Aug 2020 13:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598646833; cv=none;
        d=google.com; s=arc-20160816;
        b=hpmw1emTCzQwSxo4xELTj1oo7koIeXOF1+dtDYXe4BUZq4BJPbMDcUA3Ip2cxF5uvn
         OEGsmaoEBQrmB2XBhfwMMhpJ9xHM4fv3NDtSyTVYKngWYKhuqhu3jdGJMoTU+x8mN6Gh
         QUUZ7yE0GGMrGhvVgwobVXI+Hb2OpVsMpOHrXWD6bREWLAWDx8Vb4r+pQnUaSo/bOTXl
         byZzfNJCsV6bero0jIdhjgVmgs8ZChWiFgb2eJJvwhKedkQMftOg7+iMCXUuHLH12PAo
         hhBVQzVWQ990HEiuuUN9dGD4q4QCM6saoQF4CRg/HBGSUqBJ1qDtfwOQ2gQD4D/TBo7c
         S9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vdDOyDijRjE1ptteUMGDx2/i3MNjI+NxccBmLnqZQ/k=;
        b=ArE/lSmw1tBzvQM5wq8UuRBxEyAoF5rJD7s1m8uK/EWlwjs7ibQciwf6xB6mou2xxA
         Sfg+5uBdrvAfMr+10TnmUHTsP0fKQQRO0XMgGqaWapd2u1jDQFIf9kHRxxy9WsiR5tUY
         9ygkdpS4DkDDgb73FqevfK7MBrPnLOUAwDM3ziAbGxPfjr4Xh2ZQBSXAlRMmkqXEIvd+
         h/VIyMhmRnh/R5DNDtSwl4KwR8xfcX8bJ0jstnn35VNaR4O+pHNi9+kalY/fP56G761S
         kBLf4tU3ndTSkhRv0jaSqjsEExqgQY0kIqS9S1vAUUcO1Q7YDpwrvDTTf80QWHFAWN/l
         P4Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vt4LTlpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x135si338541ybg.443.2020.08.28.13.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vt4LTlpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBl4L-0005ad-7G
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBl4C-0005aJ-NX
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:33:44 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBl4A-00042a-UV
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:33:44 -0400
Received: by mail-pj1-x1043.google.com with SMTP id q1so122675pjd.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vdDOyDijRjE1ptteUMGDx2/i3MNjI+NxccBmLnqZQ/k=;
 b=vt4LTlpyM1HOzm9dmVE7q1uab0QUhY6f649qA5vrwhhVoTYZuq4UcI4otTp1RdZxvF
 5P3qGozqoTvtekoxnrqqKJWXox1//+faakvR2cc4qDLlZInRoVX933rh1aM9iJngYOGA
 hE7qyl030Q5/eE1tRg8qn++H6GGgshMtT/ZnGzoVZJesdB7p9FGv2kpdRk3Bs9wkJfAV
 q4ic7oQGKBN1cbJLaggPh9EUVMxFWeTf3j3qCwhe9h5L19Ywu8Gef9UW0AmhD5vK1rRp
 SbIFXsX7wUx1RUd5wpDXYKSk5re2lJBCRJnceF0L3Xuj+XxDl9lb4o6mWXcaMB6oIHVz
 ubaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vdDOyDijRjE1ptteUMGDx2/i3MNjI+NxccBmLnqZQ/k=;
 b=mDbZqN8IAXtGuOz9fFZG2vRW3pQ+Wmd66WG5XuBnRRrbyFjasRCNb7a4h66J1jodEI
 lzvZebheVLRqSCC9tGfKZkCDaREqrcROcm1CqPGhWG67vI4lccOXQB8qaqS61wtzg4qR
 /6LgdGkfcSdV6vK6devcvcCiUyEY7s9xsfruo19PZJB1M6LsdXwt7TZ8NNYy2VXAv0bO
 16KH3+c5GQoNj2eBtjTuuq1OWf1bPfJbsz3IVpTCtSkOhzSSbwEYBWEmvVTtz72WzP58
 FxI+rsgdDVj0USOGt8qtQpJNWThT4LTeKOGu4CxiI4ZgG5f6+fIT9b3GT5GBm6sjwWw+
 GJRw==
X-Gm-Message-State: AOAM532BgYLK9shvY8g2BNTDvWHaiUMZ1ihZXpG/dJi6Muqg8gcvWWhr
 ntt8FXl40UdXNYvFIDXoPAOYEw==
X-Received: by 2002:a17:90a:ca89:: with SMTP id
 y9mr664197pjt.108.1598646820735; 
 Fri, 28 Aug 2020 13:33:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l24sm301803pff.20.2020.08.28.13.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:33:39 -0700 (PDT)
Subject: Re: [PATCH v2 25/45] target/arm: Implement fp16 for Neon VABS, VNEG
 of floats
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81cb8181-f605-259f-1aa5-193a2af6dc94@linaro.org>
Date: Fri, 28 Aug 2020 13:33:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gcVzhg78QvyN

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Rewrite Neon VABS/VNEG of floats to use gvec logical AND and XOR, so
> that we can implement the fp16 version of the insns.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.c.inc | 34 +++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
