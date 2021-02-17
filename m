Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6984196lfc;
        Tue, 16 Feb 2021 19:46:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2K5L3eHYzJkm+r4FCpSL+4kgW8drRlPT6eYAwYfLXF+dfWeMZly8dG/gzFYsaJAmVWRgM
X-Received: by 2002:a25:50d:: with SMTP id 13mr35350121ybf.5.1613533562838;
        Tue, 16 Feb 2021 19:46:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613533562; cv=none;
        d=google.com; s=arc-20160816;
        b=AHr/tit/a1iAzath6WkDoZtU5+LG7lAyXk/DKM2fDc7CiIHdbH5SrmfB5D8tJ8CEgj
         0wO9DRx4DCqciIgDfPOjnPmbQKQ6tgJj+bVKwHE+LxJYyqeLSNpAAhFuPYCG86/dZ7V9
         29NQIjiV0A7/s8BqzJFQfPKUaJ+U4glS0huHy2hlDVKcp7wB9i98RiKW9oYg23ic3drQ
         ZedO5XO7ZgJsiCr08CAlHs/O64cOmqyZz8HmNfyIejEyNpQbFN7uJ6TKEWVZhWUojtAO
         hxxazyb4K9BLTVLPDPf8Fj5QeBBTifk6ESdp7uu1iJ8HRw7g7Au5oAGmhX4QWQDqXNM9
         u85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JMxbtxx7bMCLhGz9dcCS6nwDK/8XWrhJs7Bgc8M8ujQ=;
        b=St+1mlgDnv26jYKLvn2ru4f8//OP9c9LwChHSEB5ue+eQMgcW8zK0ARo/O0oxUcyQ6
         sqC/+KdQk1HwnaFjx0Vs9Ib/IPCGFTWf3W1j0nKssG8Fx8c+Vb3CQXuTiYqBJQMEaEID
         A/A/JF73HXKkC0D7QKwWIJ9X82skkvi0866Fbbbg9X3U04HOI+q9TOauLgK/t7gGcdVX
         2PB6p2wk6pu8181vNVCDozeGH6ZOl0UjOWPAL6XuR0p5yxYUTGN7eKjCsShz9Vr378Pz
         BFUwvui7RHH5XQbguKC4dxrf73NMyi3Vul8kpXl6GdSZY9AzE8tqryccK6kwRJU1V/WV
         /WjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eNVB1KPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n72si932376yba.370.2021.02.16.19.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 19:46:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eNVB1KPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lCDms-0003kX-8w
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 22:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCDme-0003kK-DQ
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 22:45:48 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCDmc-0004nO-O2
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 22:45:48 -0500
Received: by mail-pf1-x42a.google.com with SMTP id z6so7593287pfq.0
 for <qemu-arm@nongnu.org>; Tue, 16 Feb 2021 19:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JMxbtxx7bMCLhGz9dcCS6nwDK/8XWrhJs7Bgc8M8ujQ=;
 b=eNVB1KPly6LsaS/zJinQUVbjAmUsFvn62PIXkQwOcJJDIUY3izHkvv1meNV52OPupV
 r/+k59AayIjIAkG+SUG7WwxCS2F+AVmCD5KBhIbck0cbMykzEEksujs5nKUEqvsiBi/H
 zqU9cxdTy7VUWKm+13/t6Mwd/DVcDiHbfvadHqWYyPYhJguemJJ/ZXuHlRR0qaDXJMQu
 q+99Rhg4WL2hdaT8q7fI8h8IsF0ZAfX1majb3Z5GMbK0exv/uvlJUK47FMrqwGvlsoXf
 ZjYKSe67xkNNZw6hynrq3/3ZBhK5tch+lwPt/j6qiiKx+EiaI10LYvEo9voQWVgus5zt
 lRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JMxbtxx7bMCLhGz9dcCS6nwDK/8XWrhJs7Bgc8M8ujQ=;
 b=batVw7XQv49Bk5qbg2jqp5moadRHI/cQtlWdV/y15Ie+NTz/MNPcU+qIUd3HLIio3v
 ZHrrzYkEspwE6pe3ZIgjOzCMYjjEsG2NPJqjscysfN1BBiBAiKrZfTYjYzHMXphjYCpU
 FMRr5t17BpA4OgAfgdVB1WCZQJCCmzmcjjGHu0TF9TzLJPjdqp2PD32gIkIdGtof6M+H
 SGnqUmTGQCK64dH1wolGmxFKN0DKqSCRn5Zjmo5acDiyTChC6OVWCKr1v9qQbNd7R2nH
 e4UAY5Hp/de3ARtiwiMs45sCks49DC0yc5Wr/bKD34Q7xrB26fdZOgu51PxngmU5aUJA
 m4lA==
X-Gm-Message-State: AOAM532HN+mCZfucwN/GM0UjcyOoyAVVZZzcVVTZichm1ZAmwmvrAtrt
 Z4pVmViSc3YdkrIKsz6T6xATHA==
X-Received: by 2002:aa7:9018:0:b029:1d9:55d7:1ffc with SMTP id
 m24-20020aa790180000b02901d955d71ffcmr22297469pfo.71.1613533544660; 
 Tue, 16 Feb 2021 19:45:44 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id y73sm421141pfb.17.2021.02.16.19.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 19:45:44 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Add support for FEAT_SSBS, Speculative
 Store Bypass Safe
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
 <20210216224543.16142-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ad3acde-1f9b-13d5-7600-000400fe0c38@linaro.org>
Date: Tue, 16 Feb 2021 19:45:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216224543.16142-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: 39lcNG0NZYi/

On 2/16/21 2:45 PM, Rebecca Cran wrote:
> Add support for FEAT_SSBS. SSBS (Speculative Store Bypass Safe) is an
> optional feature in ARMv8.0, and mandatory in ARMv8.5.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu.h           | 15 +++++++-
>  target/arm/helper.c        | 37 ++++++++++++++++++++
>  target/arm/internals.h     |  6 ++++
>  target/arm/translate-a64.c | 12 +++++++
>  4 files changed, 69 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
