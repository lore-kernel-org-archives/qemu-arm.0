Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3648703ejc;
        Tue, 10 Jan 2023 18:58:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCoI8nIO6f+DcCus34lROC18sAXLjvbBGyLuaNbpTDJsrp+S1kDYdzylAPqotowmM3Dihx
X-Received: by 2002:a05:6214:5245:b0:531:8089:2f0f with SMTP id kf5-20020a056214524500b0053180892f0fmr92144230qvb.13.1673405889575;
        Tue, 10 Jan 2023 18:58:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673405889; cv=none;
        d=google.com; s=arc-20160816;
        b=isFnqblX6rvV8ltfYijbMDyf2udoNKyhk9/hVQ7XW8qd90IUNoiZVUuVCHJl4K3oEQ
         FGxguSHZ7Sh587DxiDtchClBc5dR3bW4II3rlGGKPTXWnDcH+WC1mVypw+D6QJvifKWx
         6w5Ir29v3BvHetDEDb19s76WP4bkVhxIlndi7Yy76jkLqs4krV8dcFTxt0XKjNeAa9Jr
         CyKgEWtk4FiP4jtoCQW0W0FIDPFNBzC+UAwLMctOAr5rHUzsOFR88sttXXE9IGryBVmv
         E8kS6jDEQkeMhmFz2FHWksIX1ARacftWOIXbU0qnXuQdsIxBesx1Y7hSvehhUkSOjpMM
         ASKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JQ2CB58YKxPVDH8ptf5VYn34nkrclyuEszfQZpKf+Lo=;
        b=ip2FzzMSkOjzdL3gmjtPPwVyBl8JzJZAT7UTZ3n+lMDG+9OxhRi3DjmIevTNf9Ie2y
         HAOYjFrV43nr+JV66iWoSBcNEmSk/v7MPizsZI6i/w0CGhV+JiwmpCEYjKhPpib0aJ0/
         4OfONQb2Ih+5z5drWqcBF/NNgTJeyuyHCXl+M2pwYNVM4EyOyYc+svEbpM5tVHiLZzkJ
         JIqC0kGV0fDPh9/7NjzlLBsOla0YPXem8+G1WpA1W8HqF1GhVBr4NB/AzdmXHA0rh5SU
         0P3uYTRDJlWPonG31N14TISDmbd4aUdMbtLlU5zpR1G5EwYph7dj8nl+a8xCHse1Bhqh
         GpxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYMUKpZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16-20020a0cfa10000000b004c72a45ee19si6712586qvn.180.2023.01.10.18.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 18:58:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYMUKpZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFRJG-0006ir-2G; Tue, 10 Jan 2023 21:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFRJF-0006ic-83
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 21:57:49 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFRJD-00046G-OZ
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 21:57:49 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso18527881pjp.4
 for <qemu-arm@nongnu.org>; Tue, 10 Jan 2023 18:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQ2CB58YKxPVDH8ptf5VYn34nkrclyuEszfQZpKf+Lo=;
 b=fYMUKpZjtNEpGTdFZKnoLH+0+WyztHfXy97FP2b/lSny2shAJmjvuV9dnNxf6gHeLo
 NXQAUDEULCI3uHiIGkLWEE/a1V7QF15sJ0ieMmplD7hnLwoNyEtU3qfehI5j53CRYgQ0
 k2w+zftk05pEIkwG1n47JfW8E2EeDGb9uhaarXiZW8g3OI0mH15WY1mDn9I9Q/l7l88N
 AvCWPDG3NVyLyntKiP+Qusr0BFFxCGG/ESiIVjIg2IpaFUdVdpmibJT3cvrnoV0+1OSb
 SRQ4b6GacXjD+cLVk4h74oQOO2Pwekr/Cmw9N4tSQnSrXxH42idUoOIb3IgN4uvocXU/
 bAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQ2CB58YKxPVDH8ptf5VYn34nkrclyuEszfQZpKf+Lo=;
 b=ogrHmtAekGCWE682WB21fNAxRGxVvlVFPQe7lqeR00dLlGejR/CqAM4Zoe/EXQq+dR
 OZoOHvH3ZOXN/flJ32/v4LCpU2mHfHcZiIq1Z28CVZVL3LoGEH4t77IdX+3wAYoBrfS8
 NRQwMULFeutb+FfAGGRegJk3OqjsP/QB2snDeY2VUUKCWmkSJINOrHYN5QPp6OIi9ZG6
 0aYK4mDg7ZJAtjXc4NJpwao3pkX+nWvNY5y1d46C7PeTnORhR4cLQHgNr4BLrKNFUMiB
 vVFJfDUuGKWzlCvFY/K3swvUhn7jME+gK09SG0JEtuy6+XQLjmGHLTdXooMqZXyAf3dR
 QyUA==
X-Gm-Message-State: AFqh2kqtykOckOwyQDH99vj1h2fGX1NPxsDID11OLlR66yFdIc9c9fkm
 2NJFLMI8PGdFIP75+gPksm/s1A==
X-Received: by 2002:a17:902:850c:b0:192:bbe9:4cab with SMTP id
 bj12-20020a170902850c00b00192bbe94cabmr34295733plb.24.1673405866167; 
 Tue, 10 Jan 2023 18:57:46 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net.
 [63.157.97.90]) by smtp.gmail.com with ESMTPSA id
 c6-20020a170903234600b00189b2b8dbedsm8799877plh.228.2023.01.10.18.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 18:57:45 -0800 (PST)
Message-ID: <dd853782-cdee-3e5c-c6c9-802653537e70@linaro.org>
Date: Tue, 10 Jan 2023 18:57:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] hw/i2c/bitbang_i2c: Trace state changes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
 <20230110082932.24386-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110082932.24386-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: HMA24T0mnw6W

On 1/10/23 00:29, Philippe Mathieu-Daudé wrote:
> +static const char *sname[] = {

Oh,

   const char * const sname[]

should have caught that the first time.


r~
