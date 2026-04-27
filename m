Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D537CFF8867
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:33:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSdi-000672-Ts; Mon, 27 Apr 2026 16:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSdg-00061k-1F
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:33:08 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSde-0002ra-Kk
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:33:07 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488ad135063so97360585e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777321985; x=1777926785; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3HdjDaT3SryrI3CumM5wGpAplD2TZykyVHPV2cJRYt8=;
 b=uvbAlPeLh3WBOibY22pUSTXJnNVIRBnVfE9B1nZMx6ABTp0PfgNmltOP8/zhirPNf/
 rmFh3mWNQzjfDt5bN0PnHbBjZytZZdIZIvcEd8XRt/f83NJ0OR3Av+WuZzeZUSNYGrcY
 4BYXf3emehTXti8S1S2EdcYW+jWx8A6ZFBJEg4bbXkda+s7TgFKyT8J+Jp5AzfUnDNnt
 MPuFkrRZVSzdeMKTZOli6drpL+4Z4M9aFu+tciWm3f6P4de8UojYuSnvTMaX8t87WdgU
 NTlN4W5ZwNhayUXgKfaba7yk8UPvkk1guhzYT6+I43BdK2uw4vB450z/zfX0pqMp2cIk
 QrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777321985; x=1777926785;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3HdjDaT3SryrI3CumM5wGpAplD2TZykyVHPV2cJRYt8=;
 b=KtYb2avCosokeu0UTIk5jIhBhLz+LD/SpJxZnrhCTHG3+qrTCNKyK3CrIuuPj2LVaH
 yXirEaztHDTXumBFodHLPVdWzlYHgWwQoPTwhiho6EBkcsv6O48vA0i99CuS7FdE2yqn
 SxYf5yVcFf3u12YiiFfkDd0xuZ0D+LbPOUb9Z45NOFhhKHaT487UvfpYgGVXJXfQfVqw
 6i3KOdy/p0lfqjkg0hOVkZwLAUKSjP8GLQLm68IY9FJvsjIOdV2jYjaLYLbtfnTuXi0o
 2JDo3UE0Jdo7k+ItZ8FDWAk2BhN5XcJI5z1KnXt8V6YWIpJvMZKXfR4rm3uRAwu28ODm
 26yw==
X-Gm-Message-State: AOJu0YztuAAuH9aHY3YVbYtyS8WvYyagi4MkSMZnPQWKKhxkY9VIMwua
 DoHqMaP5G/AABRgs3HPZ/MUzv/UKCKTCoI/necIY0n3uxaTZZBeNXDi39VcRanp0uQs=
X-Gm-Gg: AeBDiesePINt13gPTgPpPvSCYk0NyInhB3GMy8Ee1pkmDrHq3Uytio7N4C8bPCBYqej
 LaTgr9MZY+kMWAalwh0oBY115laVUejWakqPLLnTTKs06WeRq8Zny2cfP8NJ7oS7D8asIntQI/x
 kddH1kqfR195HEI9HheP3QDS12d18h5eUCVo/jaMSJoPcnYndIbOLAAJ3Ce/TTLwSZUy+jmwl/y
 FQ+0nIfzbJzGeKd3f4C9rTKO59HQ0qNePppLm18m1gFHXU1sVsOhwxOjMKBqOq3oS9j/a+Md0DM
 9TQPMLph9e3a9AABLrj32j8XXrdNsbw8UaNA4bOiE2QmYNxtkDhCbRDj95/5wcpeb2+6szrZD95
 S4tOM1D/xBs5AySEjgB3ls+GaYsHi6SZJ+teYlHsPPNjd9Q5whIqsik+Ope6JSOIeLGuqUcfs8L
 FqaiX9v18y1zg+KUK8oCnUafhmSi7fU+LCGf1/5rSYUsKx5bxsnqJsap0pDK2BKAUNAnLMAYUEu
 rcH
X-Received: by 2002:a05:600c:630a:b0:488:ac01:72de with SMTP id
 5b1f17b1804b1-48a77ae0340mr3979775e9.5.1777321984946; 
 Mon, 27 Apr 2026 13:33:04 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a775f7ce6sm2636865e9.30.2026.04.27.13.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:33:04 -0700 (PDT)
Message-ID: <16c30008-5d6f-4ae2-9204-c8f5c064bbb0@linaro.org>
Date: Mon, 27 Apr 2026 22:33:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/84] fpu: Drop parts_uint_to_float
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Use parts{64,128}_uint_to_float at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

