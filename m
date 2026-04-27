Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D32FF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:47:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSqg-0004Hy-Rq; Mon, 27 Apr 2026 16:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSqW-0004Gb-UL
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:46:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSqT-000732-6D
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:46:23 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso91374955e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777322779; x=1777927579; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QTF7Yr6hK79y98oY3+YAgeilETvNKFOVBDJFrBUqMTM=;
 b=yMIixyz0i/Aw8rxXxRUI6r1Y9vO8BWTt2VfPeHEREWPXJIceolEh706HFrO3sjlS6w
 ZhIy0kDYPgLQ4kIgo/VWuMJF5Zk8IbzsJMIPLuhcvffRiLnKM1UQZO0QPrTC4rsqop7U
 N4sv4d7tQBUI9ssNH7pSwRTIdP0Itpuq33ey7Lvd9jOnLXiLfF+Yv/azZmPdOjSIhQxI
 93UDdSYlORu86xnXCzIwL1jZ3wOL4SUfLanw4mjCg9oHdbYiwlO9tT+qzIY9ohXOsK/f
 pOSe/Cv3dsGT9tzKDZ6wu5x2W2vmpRghAkdqeVgtJ2Xm9BjDmbq7FKIJYF0ZHcLkBfUL
 nu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777322779; x=1777927579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QTF7Yr6hK79y98oY3+YAgeilETvNKFOVBDJFrBUqMTM=;
 b=e0Nr1SO2fqq0uUxcM+yJlEIEeLjVpj0oOIerFykfvWrX5MMXwfR7aqs0ncu87JqSSl
 x5SJGuKr1sKf9mj7OYzl3tFTtqLpdgc9FF7CpZ44s+XzWiu/4MZzhJzffpxUv5LbX3HG
 k9K7UFk5AABFfKKaYBwEiQjTuBPuh7/zwbnch8KA+M0hl0c2eQQR9tJhrILXX8pc1xi5
 hkmO4b1xBHm+cCcvJHzeSlgxlAPbmL6S/qxywWd6Om6nabUldx14DcbHUc2EKQI0z+//
 dkQgiPvfnGcsiYlF0VB0L8cVyu2mlcSrLSu2X9geK0inMh7tmRl2Y2kGOvASoyTe2i8S
 /WPA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+TptIWSP556lHEVp4k1a7r1BvW+UI4B9kE2EmrBzQYqVZGHHLxbGWk/W1OH0JP1hkfPryLE5wSUg==@nongnu.org
X-Gm-Message-State: AOJu0Yx/ezdsZb4cKB66SNmwm/f05Tw0dp0PED1ilMgPKIfWrUtqsaAq
 4Js5smr9QLY+mSPwIGLTgMnzZ0XihH3x1GfNyumirSrslCasjLrX68Ee9stjzCrYZEQ=
X-Gm-Gg: AeBDieuMvkbi8gRDf/GajlAtad7l3xw1VIQXJUpmD5BrRNB2dFeT29OgbDr4nfdy3TH
 pp38W7Rp9ZZD02F04wZD8X9JMV0eeLkMhaB1vpBxa7x6GJeBPHv4+cRVRj9EwhQik32bh4SiMtA
 9y4zZjtCFgqCNEuRRUdJ9O2JpKNYd0vWhaBDnYyQ3yz/2h5cqp9PkujK+9qjBNkJ2eULxiTBvuH
 xuYAkRVDxlvC7smeLCvlL+MO+5eeSTNiIuUvVQ0XMdGFgZubcElQyoJEl4jPE8GC9TZ2cAFIyVm
 idz4Co24lbxlB9hFhNiERKaVzIVvHPhyVB0uMclNo3MpXeYwKW9xfJcUlNC+H4yCB2Lj9kskoic
 2MEJ6wFRHrEHB+I8/QF+xukVRtgAkSuuZHxuLKePTImsqG4Iaxl/SfNtt3llp+ZpvWKWHHJhPQv
 m7dBf7XJf2eNRsQwVH+Jybp7zzz+pzTFRgOoij4Rg2w55gSHclsWm3lSiFswp6G8LplW9NG0zWp
 L5B
X-Received: by 2002:a05:600c:3541:b0:48a:599a:3716 with SMTP id
 5b1f17b1804b1-48a77b19ce1mr3149475e9.23.1777322779257; 
 Mon, 27 Apr 2026 13:46:19 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a773f1fa0sm10961165e9.14.2026.04.27.13.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:46:18 -0700 (PDT)
Message-ID: <85d9d9e9-445d-43f9-928d-dd4906ba716c@linaro.org>
Date: Mon, 27 Apr 2026 22:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/41] hw/gpio/pca9552: fix state_str leak in
 pca955x_set_led
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, Glenn Miles <milesg@linux.ibm.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-30-c413f3605311@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260427-qom-tests-v1-30-c413f3605311@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 27/4/26 21:42, Marc-André Lureau wrote:
> visit_type_str() allocates state_str, but the function never frees it
> on any code path. Use g_autofree to ensure it is freed on return.
> 
> Fixes: a90d8f84674d ("misc/pca9552: Add qom set and get")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/gpio/pca9552.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

