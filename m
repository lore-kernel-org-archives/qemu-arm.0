Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABD2CA6004
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 11:02:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFUqI-000843-7P; Sat, 10 Oct 2026 07:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFUqF-00083Y-3D
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 07:02:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFUqC-0004nG-Uc
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 07:02:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a168355946so1322915e9.0
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 04:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791630131; x=1792234931; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WgbWk7Vca8kiyzRWUQBXqP04t299FF3XNSJGBMsqZPE=;
 b=c3zY9YOb+iBr5Qa8DqgbLZNZZxQW7ZjGex7aO7hk3C2Ot72NvU0SmEDMieegDbH2Vh
 jezkt2qUDXJhvgCoMNqsNWgKz4U5kIID3C1uuZE1HrsLyzUXFyRMolbj1DU4jj0pp8a3
 9+xu7jGmOuU0Gv/fVMDyMvGaXj8Exr7ow0f/tOAvN+iPdnAIhDSa7v0NA9jgVJpcLsIs
 W6FSvdXHr1AzKSMTTtnoQ8TGo+pFeA2P1Mw7foG7nwOlOGkHI07QMg6zE8fuuEEXefeF
 pB3OgrXroKpvhNpvtEaoegFrAW/RjShl7K6w+2Di3Ply0c8FLPQtYqDnZfdEYuGR8jrC
 gvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791630131; x=1792234931;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WgbWk7Vca8kiyzRWUQBXqP04t299FF3XNSJGBMsqZPE=;
 b=QomKvwHflVtw0DIZ8+vQAOjl5ejGOZ86pmEhNDmOawiHBaPZYy8WGtJboDiGtHmi5K
 5aOtJnkauKDIdfC2yRVyg5ds4wHirYTd8AigLl6r0VNJFpvpESgHAduqGlfW+bieHfzz
 NqrALc6Eaw1LfECMQ8JaTwpwU6MbYPM8vUfc9JtIFM57XbfFg6nrXr289ed6/mXRtv+t
 F7inXCYnJO/azMtgB7UrLnv+mQlUnyj2KixNZP/OAINcaiWEyRuWjU7sAN3SDHT3AFN3
 IGG7ZCqVt5MZr6i2DPG5DqpRUKs3Q4ClXRxqcYDoMoCRL2yO+K8RnGbQi8gLC4Nxlo/u
 RQQw==
X-Gm-Message-State: AFq9FYKG/Np5juj6Hf6ypB3nJir7TaJDZS24ERnQzhD3nHQR4OskmBQH
 XZUV1kiC4bi44NVAUUutJwxhkMp1oSKY8r3OUhf2bQxdtEL7FB6gFQC1Ko2LECZ6WCo=
X-Gm-Gg: AYBFou3C7hVhIfrFZmk/nTL3WfxoSDlZrY67WVjbcUTcjcjbfoL5/pnJjAbM6Dt/1Oh
 z3ys35YxkkTRTMnXs+zDSdtJrJKvyvl1kjHgnWQJWdKQkr8z/xqFbIyLZuftRgh3zWuZexOtvCo
 g2k8SXmdL+OtWBSDHt8HAGfY4LqagbRArnfmB2Ymv4BTuG5ZWqXie7/ek8ydyEuBvWHLPXX9l4q
 Bpp/cz0P+XOCS+gZkxDSIIRziqp24Hz7Hnq/yhnjyKCBEstioW3nxyNk7dVwJLbcxMrBt+POOe9
 fKjcAORiMh2XN1moECVyr7yBFnxUEJ2EG1ami6pPXe7NvnUguloqVBI2A5e2ChI0/pead7ZTi7Q
 tr3SO8ROU5ORGJpyzjE5a1mqcB1E+TW0RVPWjFUUfUrNjaBKd4L5KQNJc5osIyDOuom0ZQZr1Ka
 MpmvbQrgAYCPtwdur0iMd5/nTzy7vI4CRPEvnbAcAr1Qih2vmkZ8im9Fokn/huGbxfdtqe0XbBL
 HpO8MNY5z7FYNaDl7z2Fdfs2vDAHR1Rfov2aR60pKVk1IappJgm2+0=
X-Received: by 2002:a05:6000:4719:b0:48b:6d3:a6f with SMTP id
 ffacd0b85a97d-48dbace3a43mr7978020f8f.44.1791630130705; 
 Sat, 10 Oct 2026 04:02:10 -0700 (PDT)
Received: from ?IPV6:2a00:1e:e082:2901:1896:21cc:25f1:819c?
 ([2a00:1e:e082:2901:1896:21cc:25f1:819c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acfa28sm8729152f8f.51.2026.10.10.04.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 04:02:10 -0700 (PDT)
Message-ID: <77e10e19-47c4-42c0-9ec1-562c55a45bd4@linaro.org>
Date: Sat, 10 Oct 2026 13:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/aarch64/tcg-target.c.inc: Correct register MIN/MAX
 instuctions
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20261006-jmac-4609-cssc-fixes-v1-1-798505d4a4a5@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006-jmac-4609-cssc-fixes-v1-1-798505d4a4a5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/6/26 22:19, Jim MacArthur wrote:
> Some digits for these were one position off.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/4609
> Reported-by: Ayoub Bourjilat<https://gitlab.com/Bourjilat>
> Signed-off-by: Jim MacArthur<jim.macarthur@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Oops.  Thanks, queued to tcg-next.

r~

