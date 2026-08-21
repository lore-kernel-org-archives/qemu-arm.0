Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CD8C5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 15:58:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxRcu-0001Na-Gk; Fri, 21 Aug 2026 11:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wxRcs-0001NB-N8
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 11:57:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wxRcq-0007Lv-AO
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 11:57:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-499a4d1d7f1so7128625e9.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787327866; x=1787932666; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ClpDRpU/xMOy9ZQD/Be1G7pmb5g9oC91EjdPWHSSUAo=;
 b=aymEXiCA2NKMdyH29iPX3GM4Dg3PAmJngaZT5b4Pb+LzEd4rj0urZ4XJ/e8xbwWBtq
 eIJVSLvbgXnSfa/v93dpZyGzg9XaLU9+hjuuJa2+bR50UKgPrsznmz+qaR36bjyrsgCf
 wZClmyd6Zt2ciW55ds/YPw6xOdBiHzDErXlcAGkM2WWlSPlTzYePPYHWtP5SvGdAZXMz
 1VolZHjmmvG+X44oZ2c1YNFAw/I1ssb7/hTtX8IGvKatb0fUE4hbYNi5hinzNTgRQRs0
 iDmk7nLEc7IqlS4wEQZXi4OBcFpOo0tlTeiwLV8uPY0ZybLz/xSxNSKegnftbj8DnWjz
 T/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787327866; x=1787932666;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ClpDRpU/xMOy9ZQD/Be1G7pmb5g9oC91EjdPWHSSUAo=;
 b=Sdd/Y82E/FE5EUf387GqrvCy5uyS6WmGFQhM5Jr/iXA2UYv31I6E0WDpsaOn8t2oWZ
 xltN3JGT1dL2ldtIZucW1yTVOAxjbGOky59rtVwONwSZCXnkfYfCJK16bViApqOT7ad1
 vJWYntPCkfYx9XpIpLHW6h6O9ezjrgfPZ0yOd+3zZrB26VdIvDEQGYV2fofzQZ13GmK6
 YuWuAYrDV42DqwLloyV+UZiPRg0Ef5Frc5+MxQIBLvSoii75ISNtrVQVWiNjbCgR2J1W
 InLrFOR7LLsLDE1NpGlrtPltAFVZqgaisQZ/yG5XjGnkK564dp5urYCtfqoFpBV7guKe
 0ceg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqSWBltZuzFRE4xRi3lgrMbJl1rnlhr2oRbAZGz9N2vaUoXgQJaSIavdBYAXrpva/nfRr64VAFlEg==@nongnu.org
X-Gm-Message-State: AOJu0YxUZ6BjZZnZIv6sU5Z1+dILi1W31qWPcBtJRg/M/FNUMsy3WvZY
 Y8GJ6FkBa0xAHPmtQxOj/kEY1vM4g5uM0MdfN0jLvBQj6KBSNFqisrxcwa2sGr5YQzs=
X-Gm-Gg: AR+sD135Jn0PbcbpbdOYalHqxbQq1Fc/0JKurbOXXRCgpccCsB4ITm/66hRuSLNNdUY
 fma183Bd+p83f0xjbr7b2kQCEz9Bjb+NmRvkXj/g3v2Ms/PgPhxAIg+Qe+eYqNtVXcvobFXI3TJ
 w/nfv60YUH84JPbkzsLCzbGEE6Rl6bB1tMVfAePMCfyJiuo+XLa7mv+75s03UwpWIiqS2lcD0nk
 507jjGSq+US2o4PaPvf4ibi25VLiKkWWTp/d7qcf9V6i0BRVxeHWjv3uNNQl+MAbbtJLuWR3N7P
 BnH/S0r2cnriLFefGry0spJA+yVcM0YT5tc3Ts1MLnx+eJ9REv5rskoBUS8Zdyfu5JE65EGA14U
 v16Kj+XB46M4nqEh/eOsJtUz+ZCB16/zKC76Bm/WZosP34Pe13a5coxfCff22csefybvux28TeL
 0czFSw7qAW8MQnV7ROPg4jXFRf6Yg4UTMl+a4VwaBic2Sm2DmQpEhX4RdSOTJ/AoGc5xs0U+Ytu
 g==
X-Received: by 2002:a05:600c:1548:b0:499:841c:2016 with SMTP id
 5b1f17b1804b1-499b8273456mr115808405e9.0.1787327866201; 
 Fri, 21 Aug 2026 08:57:46 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:fa47:b339:78a1:d4c6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b9a89572sm24077605e9.0.2026.08.21.08.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 08:57:45 -0700 (PDT)
Date: Fri, 21 Aug 2026 16:57:44 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>
Subject: Re: [RFC v5 13/28] hw/arm/smmuv3: Pass sec_sid into cmdq consume path
Message-ID: <aoh1eKD9LiMm3TYl@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162512.2807281-3-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162512.2807281-3-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Aug 14, 2026 at 12:25:10AM +0800, Tao Tang wrote:
> Make smmuv3_cmdq_consume() security-state aware by passing sec_sid
> from smmu_writel() call sites (CR0/GERRORN/CMDQ_PROD paths), instead
> of hardcoding non-secure state. The related AddressSpace and MemTxAttrs
> are also obtained based on sec_sid.
> 
> Also move CMD_SSEC legality checking to a single early check before
> command dispatch: secure commands are rejected on non-secure queues
> (including future Realm queue) with CERROR_ILL. This removes duplicated
> per-command checks in CFGI handlers.
> 
> Finally, extend cmdq trace output with sec_sid so command processing
> can be correlated with the correct security bank.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c     | 47 +++++++++++++++++++++------------------------
>  hw/arm/trace-events |  2 +-
>  2 files changed, 23 insertions(+), 26 deletions(-)
> 

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


