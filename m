Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4124516ejb;
        Wed, 22 Feb 2023 01:42:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9nw2Gnsa83JS1O7XKOj5RRMRFaUM7Ye0lbobeIPbkYWxmI7QQdUnsshDgfJKIVxoYtxcpy
X-Received: by 2002:a05:622a:13:b0:3b8:6d3b:b083 with SMTP id x19-20020a05622a001300b003b86d3bb083mr13703923qtw.10.1677058929416;
        Wed, 22 Feb 2023 01:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677058929; cv=none;
        d=google.com; s=arc-20160816;
        b=w3ukAehtnZtWADA5A9IQp9ppWoQzbMGWIBzfPIacXFGY5YJdYDJRs6Uq3FDYOD9YzU
         ht41NcPPViZCNDXB/JrOm/JjdR9L3diRA1W8s4pdVQANRNvBXvAAUeD7brCp8N8zdu7C
         RJPY0Mu9RQe2FXCVPcHgDikz/oEi0yDD+LSq6Ed0F8vi+TnsleFCxOzJKx5nkvS7383O
         GygUYFBeKF72lPwpc2NDIicMFwfpusNxTQV4iSWJZpexRX0Te+u3QIDPMvLxAbPrJjWu
         4tD0qr4bjnA/gQ4CjAhnw4UK90ccQBRVXDPwLNa/18hePqskf4N+A144rLl/EPCdJK/I
         Sm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vY+IDOaZOk+/+U5lTJS/PpCEdxN3eTBnE9TGeAWFaUU=;
        b=lTLL66hDZuD5vo5zAxrY9kmKnhOZlgZSO3zyR537Qmm2fr7FpH6y05W3aVr9lRP6F1
         Zrb1FQ7M6hRyYbUnShMQRAl41PCkVC5ydU5fCtyuGuifkKrNjKjDCncGhzjfCn9jmlPK
         jV7dxLK//VVuSIUQTG9qmcAnWMZgJb84uYhTYRgH7p35dSgO3psItlKBOg8/b+C5IY5D
         Pp7QvTM5Vg2f/J21OODvE1MXAC3oun+fjEsXXfO3YlpMx3q1vzlrvySFeOcB5/XQi0eI
         Kn6alF26d9b2RIJc6krpEMBzCSkbZU31l8ERwvhf4ZfVBbijm9k/urawfdH5JHi3i7M0
         jNcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oB2Uoc14;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac85745000000b003bb8a14baf6si907456qtx.595.2023.02.22.01.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 01:42:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oB2Uoc14;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUldI-00013L-3C; Wed, 22 Feb 2023 04:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUldC-00012J-9t
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:41:46 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUldA-0007JC-MH
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:41:45 -0500
Received: by mail-wr1-x436.google.com with SMTP id l1so6795932wry.10
 for <qemu-arm@nongnu.org>; Wed, 22 Feb 2023 01:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vY+IDOaZOk+/+U5lTJS/PpCEdxN3eTBnE9TGeAWFaUU=;
 b=oB2Uoc14QKB2WL09VuF6O5NPJHG77sPNzsQiVxb7H+WGp0W56LX3jZ9/wuduz5chYV
 GMyT2T0igIzJgfCkPKPeiYs7TuEcnk5PJxJ4e3Rd1gYKZPQn5TKyMzBKBzCYF8pCM0sF
 tQ9PhlIlaj+VWdocLPxCAQZ6Hb8asNvNiN5oqZ+H1SJtZ6LCecrWNIo2L4kWfewHOVna
 E5HidHsNHiQC8t+4onC2DvJQ3OwZUYanwpl8ppNCg5dGnEnmV2VhEbCxRtvGBubVZORk
 XpyewtEzYP3nOqsUplZD3FZ7DPmlJoKrQz0IQ6InM3r4oolHFASYOkUXCbiaFsy1Qic9
 uroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vY+IDOaZOk+/+U5lTJS/PpCEdxN3eTBnE9TGeAWFaUU=;
 b=SFYRCjN8tE9MkIwE8GcZ8gskQo32QreZJjpCC88I+5EbxDDYgUFl8NcFTDvwim68W+
 TjC8YXoXm0tSkSR7WEnGS6qgQLTIy4XwcCjNcvyrhGpFXVLc+uKGKDuCfz0ucaxqP3UL
 1ZQW5NvlGAfNBEZEpKCKr/n/i3GbRlb6fb+XEhwRZdJruCXu+QWL5j18brk4ZC3NWb+0
 hF61jolLTEttp8A+syB4s/JjFy0hzaIyWqsVJB0onrgnKN9M08yat4DTKaDW1fCy7fAb
 dISJFuQO3KJ8oZ15xrSv0qaw6CLdpHpH/XbbzXMJOPnkRoH4MiDabXQMt6lnuuM2rQTX
 P0eA==
X-Gm-Message-State: AO0yUKXgZQexVU9l1eZJCzjh/sU6AeTSRkPNEqMjVgOgD2J7UKpata4q
 2gfJhYgXFXCzMKRNlVqUay4nZg==
X-Received: by 2002:adf:fcd0:0:b0:2c5:4a20:cad8 with SMTP id
 f16-20020adffcd0000000b002c54a20cad8mr7408103wrs.60.1677058903203; 
 Wed, 22 Feb 2023 01:41:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v15-20020adfedcf000000b002c70ce264bfsm699253wro.76.2023.02.22.01.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:41:42 -0800 (PST)
Message-ID: <320b8f7f-efb7-26f6-d0f8-d9e1cca0124a@linaro.org>
Date: Wed, 22 Feb 2023 10:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 05/25] target/arm: Add isar_feature_aa64_rme
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: cS7JlS5MjSF4

On 22/2/23 03:33, Richard Henderson wrote:
> Add the missing field for ID_AA64PFR0, and the predicate.
> Disable it if EL3 is forced off by the board or command-line.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 6 ++++++
>   target/arm/cpu.c | 4 ++++
>   2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

