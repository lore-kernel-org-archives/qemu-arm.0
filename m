Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp775992ejc;
        Mon, 31 Oct 2022 01:16:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4c9wMd/jRPuMxUdc+n17Qg3ehaMletgVFmo09mNBldjaNfdqHjXyP7qUDPFzlcPDWDfekd
X-Received: by 2002:a05:620a:a8f:b0:6fa:3134:e82b with SMTP id v15-20020a05620a0a8f00b006fa3134e82bmr1435825qkg.382.1667204202225;
        Mon, 31 Oct 2022 01:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667204202; cv=none;
        d=google.com; s=arc-20160816;
        b=kcyr/RLEJoaq69iwnO++u93Tdny8N5fEJYfkfnjLaR76d79UbMUjSvcJs67ORRDoji
         ez8xQWU4c1ZE3w1htR+REnL79J7BZHkhwIDMe0WaJIpiFgznVOIcxPV13nNoQto9rIJf
         1kVYbP24gEKmN/+27S7cO7Zoi5F55BPVBsmQ+JuSYcUOueVC8NMXLhMOzb8ICusOVRNo
         89j6x7uHnU+WEo7Teciq9Bc4DVcXecD2bIQil+Yj96676e7x4i/9fThciTxAQbzPFw12
         SiDp8s6eFGbloS3BBAaS865fea/sxKYlJxoSu2M8z18hl5V/VZXtomQyz0HZ4yCJYJlh
         lqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZVOuOlnoN7BE4w/hIBlhFCAJX0WT3zJ0oUcJmvVh2Lc=;
        b=WtUwfkShB09pjZ7c9JLAfgVZUT9oBGf/DJd6FnY36aaoGG8kEo9nH4uH97meJl2are
         r5DaNy8cU5pDykwpRETkST4Gw6bkXYbX8JyI7T5cAsY1VmSnDyWzC0/+LDefqYchoYJU
         od3fV5GEpa1JlvZLUq2KsUh2BS0KXKFS+GYV03L6HGeH68uVenlEAGeYQ8GbeX98uP27
         8INqVAUdCW4xZf095+zI998bYMmiXv9NDerXn8ml5L0ZdTnXC+3IJfsS1RFi13vd2k4e
         wQRuWtWrT3rvmuXKA00FPGTXFwSxkIa+Bc2JGHDvA0l/WtyURWnolf5Xps+DWVxzC+zC
         bpAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUTaPvhi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020ac875d4000000b003a4fb4b6420si3373865qtq.162.2022.10.31.01.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 01:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUTaPvhi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opPxz-0003aU-9D; Mon, 31 Oct 2022 04:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opPxv-0003Yy-SG
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:16:16 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opPxu-0006VU-Dy
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:16:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id t4so6673073wmj.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZVOuOlnoN7BE4w/hIBlhFCAJX0WT3zJ0oUcJmvVh2Lc=;
 b=AUTaPvhiFxEoMwOYyXOhJY4kWHEN3WA+9x/+f048oF+/Fnno4N+vvwiwI5yqHNe1GN
 CDczbtG3BpUDwqw+s+1duIBUSQGFRfXCkbMgIJHF/FkYIvlE+OqfVE0GoE/mVXGzZOy9
 siy5nejxzBYTdRzbo60QL1oM8YlvpDcu+PgyT8Zl08i0sDpMeTxY2hOZBNNBU2+8y6a3
 W6MFEf9bnX7CJm4dX4YRYWgXugJFMMmTdx2NUp5LiS7YH4d5ZNJGeUPqiWkonMipomfS
 pXMANtWuzNPEJYroO3kyJNcCCD3gqkVv0AzeOH5FmXmYIabS0/dxTlDnrR0suWAcd3o1
 j4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVOuOlnoN7BE4w/hIBlhFCAJX0WT3zJ0oUcJmvVh2Lc=;
 b=2hPcEPySMYu8Eq581gYJp/bWopSDPbzwf7okuI1zOF0QDql6+GCMPI/qEheUd6pptD
 9WXa7mVx5wtkBn6bonhjSjFZPlhJgKqP/5HLHaEO0+HaJHz4/HsssU6HE6ACSerxQG0I
 tluE8eQjx6intTNJo7qpVt5W9EqpWdnXlGPS+bvgmBEau6pgEekwlJ0VRevI9tTjgLRG
 msUdXL3dxwLC06RBo+JzJa3sZndEofLLMLPFWYsCHT0BYNPMBV1vrPQ0z9a2sRH9tE5a
 Q7mw6Kt+KBELK3KP4sze1virPitZcrAM4Xwgqy2mDu785TZjyUzDnShwkUcXMCtO/lUo
 FMyQ==
X-Gm-Message-State: ACrzQf0c92v25/Sv81EJldPJh1fdKqnSlteABhJOdIN0OSyDZAA1sF4X
 t6HtAOXAIssgM9gp/rj3KJMxbg==
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id
 p14-20020a05600c468e00b003c6f510735cmr6972788wmo.179.1667204172942; 
 Mon, 31 Oct 2022 01:16:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c294800b003c4ecff4e25sm443136wmd.9.2022.10.31.01.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:16:12 -0700 (PDT)
Message-ID: <fbf756ee-e334-66e6-e84c-3ba207544b65@linaro.org>
Date: Mon, 31 Oct 2022 09:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] target/arm: Copy the entire vector in DO_ZIP
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Idan Horowitz <idan.horowitz@gmail.com>
References: <20221031054144.3574-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031054144.3574-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DGlkTBW6G9Tl

On 31/10/22 06:41, Richard Henderson wrote:
> With odd_ofs set, we weren't copying enough data.
> 
> Fixes: 09eb6d7025d1 ("target/arm: Move sve zip high_ofs into simd_data")
> Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/sve_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

