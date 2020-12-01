Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp220819lfb;
        Tue, 1 Dec 2020 06:45:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGRPQhcs/vlLqDOkzr9aGga2JPQ6WtR5HKANXFqE+qeZFDbwq8rky1hEWDm9I7wn/mWl3u
X-Received: by 2002:a63:eb4b:: with SMTP id b11mr2514983pgk.351.1606833911114;
        Tue, 01 Dec 2020 06:45:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606833911; cv=none;
        d=google.com; s=arc-20160816;
        b=Xn3ZU0uR/OLQkhu/7w9vksRAlRB1sP8VaPYzWQ0QmLIPt8BEhK8w/mT5KqN0SAcN/1
         fOwSvxbT1VXRO2828U8yIyZ4K0cLjuLnzBxEioeTzvjQ9hcIKb0khy2avXYzseG42dCy
         Rza+2mRx5cJPGRVWvJEb09YNmdnobZU9G4RqoE2JB3HvVpG51fL2m7GZ+7fNmbo8bGmV
         nHffEeSecX2SrXMKChE8JhfB1VcbCJn3NmKS0UN5rCnnDdZCm2RGf9rJRLd4Ft6hX7iA
         cfABkfYJwoI5/czshshz1OSap5DT5Vz5xgjtG3V4scj8FtZq14/2DpK7jo4f+teIaOSY
         /TVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/qDkkHIiWPtg7breVYjTIvrWE8moMqM9Z3FdMNwGBxg=;
        b=aVRjVdTR+caC6ZJklw5hqheJL5T+xNg+tEjmOUkPrf1Rx55VE1qR0wVI70b+d8gDTx
         FPpP6FwOEGW3vhDmpWn2/NQDJPVFUKMs1nQLtP6PXP+mgBdTDa6IzjR5J83RSyCkdH+C
         I2j7WNMSeI4kWuJ9EexiKeNVbF8YIbNIA0IuYsxiY1OxoagsrvyDseYBTkhONpvWXJ+F
         I6yuTTn1lDQ33873KpbijYklNlA9O/+gmzVZDC/M6bIxXCJhNWnPd49iAZ/DSOBvIPe8
         SzMt2N7zvilpCirkkzVBsNCX3+CUu8VDgy/GmBs2R140BEbZpVs0yHkOPZir+iBihpd+
         KeJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L7+KPiNO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si1560522pgl.125.2020.12.01.06.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:45:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L7+KPiNO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6tw-0001B2-Of
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6si-0008No-0Z
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:43:52 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6sg-0007j7-BQ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:43:51 -0500
Received: by mail-oi1-x243.google.com with SMTP id t143so1950468oif.10
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/qDkkHIiWPtg7breVYjTIvrWE8moMqM9Z3FdMNwGBxg=;
 b=L7+KPiNO4P6uUVORqPk1+iDsrk62KW2iJRyKKqcJNV+QKaOeEbdvvcz6ZAWx0zWvew
 sQKCIsLGSbpWml+/HNzE7zEYs6Zk/2f9XxF2POn9Imn7URUAjOkBrofGLRwGsz8YrWnW
 JQN2jHcnEXG3e/PzkEj+aYqw1pctswTRuecOHw0+mAMpjnJZydHjySkdxBq3Qj8d+F+U
 k31fSporU5u5iDH8kkuQSlfuC+KvB5EuTK4sxpXQ6CEQpMToQCVexA5tGWxD1lP9ixNj
 LQb3RnbXc78nNgbmu0A631SSldvJRzbp1tPX05xDV7C9yBVA4ZMkP8VfZMYRG/F4VmaC
 PwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/qDkkHIiWPtg7breVYjTIvrWE8moMqM9Z3FdMNwGBxg=;
 b=O6BOs7cL6dADsFEMbGwq4jiBP8ByGWZyLwe8nstoV2DCH7rUURkIIAY6VWqxs9vfki
 SqrV8ZbW2js236TUCitVBYcJ2nm4W8h/GpxEqjeF9DtP0c7/KRLgF/5P/ptJTDLtLB50
 jtGZtSK0UB+KLDu66tKJ0vj1x3NgzZx2XGsnPmCqGsXgrb6Rren+TRVaxvbKZwRdaKCi
 INhsiwOJwE+ONz8nS0RNjGYClUQtQLNzeLrTMQWkpyeG9dhu2NA0QnvLhS+kz4SQnfMx
 P1HGWFku/lOEgxvIZt2EBYog7MMwI3MQ5HpCFlluXNsjmL7Fi5FDMlhPouQPsxatSObz
 0K3A==
X-Gm-Message-State: AOAM5307kv0/y0B7boe0l3MYac07v9xozKgOPOeifyw1uGJeTfpsckQP
 ycL9c1IKzpJRXosUZEvlvYw4AfTMaOIBNH1Z
X-Received: by 2002:a05:6808:5:: with SMTP id u5mr1933807oic.18.1606833828885; 
 Tue, 01 Dec 2020 06:43:48 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g3sm431791oif.26.2020.12.01.06.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:43:48 -0800 (PST)
Subject: Re: [PATCH v2 18/28] target/arm: Implement v8.1M REVIDR register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad3b415a-d573-3ee6-7869-cfcd3a9d30e9@linaro.org>
Date: Tue, 1 Dec 2020 08:43:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ydZ0oFS5z8sf

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In v8.1M a REVIDR register is defined, which is at address 0xe00ecfc
> and is a read-only IMPDEF register providing implementation specific
> minor revision information, like the v8A REVIDR_EL1. Implement this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

