Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5715526lfa;
        Wed, 9 Jun 2021 13:20:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZytLNpt9284ec52zALX1Nyh41L9SjVnXLGVTziJlFWTx9FTVaCHUYccdOcLLfMw+r/2v4
X-Received: by 2002:a5d:804c:: with SMTP id b12mr917171ior.15.1623270042752;
        Wed, 09 Jun 2021 13:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623270042; cv=none;
        d=google.com; s=arc-20160816;
        b=YkLJ9A35SxwpVAu0xrQPBQD6yLHTvoezrty25rf6ZnjWenNhjefjPPhxnyv5J5xLjO
         kigkHjf4CvSI6xTTv7Tnx2UFx+kbJ24/fzOTtyMWIE/up+GrMGK1rbGtyzXXNVb1tR+f
         TAK8lhkbXwny5GS5p20jTCeJZnfsuvyIQiw4ueiYpGZo4yMh4vO5GkowfnSVDGtUjrBo
         E6en2I1bEuan2s00orDxwnnaRV064mMLqPI/l57gvvY54WZgEE4epITL8Lw0F5Ke/ZfW
         G97vFiXGmK6WyZWHIo9OxI+zwv7zdjmZrllZKfiwEiccKONy5Oq4X//SZHo+7FkCuboK
         4Ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vy5kRoHOzTEL2GiMfrYh+k2M8Di4bx07Nrdw/jXEu6U=;
        b=ngKh46xxYEQPSUCIYxNWtOWZ717JkO8TSvPNjea64kCfrGtGqhg6L+0pjQ/Od0ZL3X
         Vfm6azvUhZ+ViYRt4I0jFvJxXaASYiZCkZ4aS4fICBPf8gckgBkgVEyCzu1f3A1qTfel
         DOcmk6bj3NTHvCEGYrO7RIFOQlVYY60RzjrvVuDGKaAlgMlh00IZaCAGP4OQnBb16R8y
         5KnUX1QdBervmrvecu+UwNf218pfZmMKNyRF1bhi4OBMUYlMLMqYlP25BIogEdtRPGBD
         QVgfPQJbgwa2vQzxFxGVzDfdYSvEaAR6o49aS/zBGMo0eGC6G1V156gHQgheRz3yyCXi
         Utlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=blIIVwLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si801318ilj.126.2021.06.09.13.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 13:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=blIIVwLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr4gs-0006bk-04
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 16:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4ge-0006bV-0f
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 16:20:28 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4gb-0003yh-QK
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 16:20:27 -0400
Received: by mail-pg1-x52b.google.com with SMTP id i34so14163663pgl.9
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Vy5kRoHOzTEL2GiMfrYh+k2M8Di4bx07Nrdw/jXEu6U=;
 b=blIIVwLmh1VJivvWXVfGLtLY2YdWAR8H9mBEX9cPCbIrKYJc8Z0NOaV4WFIYf/JklI
 GOOlNfdw0WVE0Owbz+0Nz4zpx1lwfVUHBJzV6Rebi3d1AIKyvjrh8Cc8Lr8J3TmldmaV
 gJ75hOEdpZLSZW/HWk+hm6kdlkOhdRMX7aaXrtI4iQuQmVf0xsRjKsOcJrUCOkbsIfVP
 byV7KRJ+hFx4/7Gg0lARS5TxFfzHU4YRrRzIHxuXA++CNOqJO0DaGjwW9UyNEjSN+XeL
 6bv5N4e1O6oB9PrzxY6Yx9cxLEplDfLaodxPadBcrveLP7elJWOMswrATHONY/2pnhEQ
 zvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vy5kRoHOzTEL2GiMfrYh+k2M8Di4bx07Nrdw/jXEu6U=;
 b=i62HSujFRVwI8iiTHbJILUsK8u6MdzB3STRDkZZypr2APAmiZ9Gb6kXs6kHMm4K2Bx
 5MvNF2K+OJTySZ0tvpnDZDhTzsm19xshK+yLuhdap6Iwtao13Gi0GilMYE7cXvr40unK
 DndpIshAOcuEMKTsQxU11BW3fKCJtYR72Son1th6Z+RtvdHnwc0l/CdZQnA4aeDGUoOe
 wfQd9SBz7IBICOYTXG2p9w2DND6YZESmMx8xN2zqH/2ZWV1JXq+hZBnjyd3D0G015bZ2
 gyFssVnnqSLjHWXJOtZbYgUDUqjRMKKE4bUIagNd3/mbaFoHJ98GfM/GXMCzmFgZ9bfP
 rIqg==
X-Gm-Message-State: AOAM531sU3W3xPU4kAwshruC6GbVSHlM9p4CfG7AYDrFn7MS/9X/DWLx
 UxDlpN1g0UIzG1ZXDKCZ2FVkQA==
X-Received: by 2002:a65:60cc:: with SMTP id r12mr1450424pgv.164.1623270024159; 
 Wed, 09 Jun 2021 13:20:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i1sm348652pfc.206.2021.06.09.13.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 13:20:23 -0700 (PDT)
Subject: Re: [PATCH 49/55] target/arm: Implement MVE VQDMULL (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-50-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b0a7b23-7e96-4d0e-abe9-5f137da131da@linaro.org>
Date: Wed, 9 Jun 2021 13:20:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-50-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ik/kNdqdYBh1

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +++ b/target/arm/mve.decode
> @@ -39,6 +39,8 @@
>   @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
>   @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
>   @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
> +@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
> +     size=%size_28

Move this back to VQDMULL[BT]_scalar, I think.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
