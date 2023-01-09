Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2382839ejc;
        Mon, 9 Jan 2023 08:10:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/wh+spLE+nXG8jIJF4tvRJJHLUkaItcWlE9gE69poMFEGvk5Mc3ALidpBhVlDGP4hJtrD
X-Received: by 2002:a05:6214:3785:b0:531:a996:e6bd with SMTP id ni5-20020a056214378500b00531a996e6bdmr43304173qvb.40.1673280652674;
        Mon, 09 Jan 2023 08:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673280652; cv=none;
        d=google.com; s=arc-20160816;
        b=oIzuOw0dtBDtKKIIVBnIlXYfJgpg0tG1iC8dUu7Imyg5t5pNM5oB3+QT09qesdT60c
         oE7/Pnf+uzZi3otNCr1Bafkx7b+DkX65obL3wLsJh145iNyQv5x6rKb3nw2yt3s5jD71
         RvbhrYyovtz33lbLG3OYEEfPog3dIasvPdbqFTT32f4oaX+f5yDtVsjHqlJeccbyUwP+
         aGlC/BGEd4oByfEhTjGvzrwq2ocWbG/qyICF2qzja19eS3ViDh/nfeI+Fu3tA2OuUb5p
         HL/+Lzpdrcj2H/YLgMc1zCKjHnDL7xrIrvdQSI+OSj5cYTXJCYuhqzmlkpYrI92mgLEH
         Ngag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WXWtiELz+9v87ReMcNR5qnXsLmL0CPSMu48poXSrAqI=;
        b=MRM3rvjsLE0i+nlT4s9JzZWheYE+LRcOqw8pbSrqwM6bkCyiZVukAEWa36gxDaQxzC
         jDILQwaGCcjC18YjDCJm6DagPQrbFy0KdQ07bLeVpxtg4T2c/g8oDAoSQv/NiEcsO5ua
         16+vq52h5uoQ3QuX5ugvkLQkAlJItoe2I6TE7z2QXMpD5zVK53Aen9JZMBT2WoUbkUcz
         MhCLB8EqoNc2hkekK9k3K4yMNgYlCQJOuqJ2IFFt+Dq0pHNenpTYCqnnQIivuq3iUu5m
         FgMqk8NROIvaQ8T/ruRgvDjHD1ga+ZQY05bu++W6Kbs+jeI1ITR0WoWwsk+RqLWl03Hu
         jTgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O9Eya10N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs13-20020a056214226d00b004bb9151f128si4774812qvb.499.2023.01.09.08.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 08:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O9Eya10N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEujS-0003Q8-DI; Mon, 09 Jan 2023 11:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEujO-0003ND-B9
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 11:10:38 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEujK-0002Qe-Q5
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 11:10:38 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so13268544pjk.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 08:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WXWtiELz+9v87ReMcNR5qnXsLmL0CPSMu48poXSrAqI=;
 b=O9Eya10NgLm4WhB+L4M0l3ZW1afO7rRvMiANZzYFlWbQF2R8d5iVzt/hs5Ha1EzBZW
 6zLuN75rcjA7YicPN4O8zOXqQPrd5Nb9rcDfxqG8SRzmjSb88QT/BiMF4oh4ho/zNvRA
 OCnO9n8WF1g7IeEzgsApGX3gzmG51Im+BjclH3WmQQppDvMp0+K5qwYfOKLLBtKyT+Cg
 IyhQexsOp6YbamiA/LC1Yr1GmP5R7hNjWEucaKcvViH0NZpfwar0G7YFB3HZuMFAD/sN
 J34AKmhWR4VcaDg9Hu+Aw3FwkyVXYgZ7uHKK7eFyqfJ2g7RrmygCOx4hYKgnLJ7kErJH
 UZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WXWtiELz+9v87ReMcNR5qnXsLmL0CPSMu48poXSrAqI=;
 b=vsWca+RBOGioSyCFvF0mvzjbhgWYLfWwYPop4Cjo+geRm+W4G3uENT2Y4l/X0JPtUP
 CAyMDJ5ZSMgAPIBM6zh0Rgm8LTB2TarLvDhPBmd4ABWS0zNrk168OpWqswvTo7vDSCFD
 JPHi2BwY3mOXelboH2AUbid+HBqBt41JPYM7Nie1gE2WEZjR12hBhMAbyMdZhmFws/IY
 RuTV7klTKpToLXV9rmGi/D6lnLqfPhkfIcaq91aoUY+P2tNMShjA0Z53KvXyYCwYx5/r
 ivXuOiQbOJT8c19muNaE9zvQHcRPzao4lzq33bPRW3SGJM1CTQ3kattbJzm97iCfNirI
 cc7w==
X-Gm-Message-State: AFqh2kpFbH5lkkSOitZSNlBQ/P1ckomaYxGEQACR/T/a7Bn14EHBYGT0
 NuzYDUiNO6m47eyrhPaqX7PdJQ==
X-Received: by 2002:a17:902:f791:b0:192:5ec4:6656 with SMTP id
 q17-20020a170902f79100b001925ec46656mr66901294pln.3.1673280632126; 
 Mon, 09 Jan 2023 08:10:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170902f7c500b0019337bf957dsm1699570plw.296.2023.01.09.08.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:10:31 -0800 (PST)
Message-ID: <dee15a77-3fd6-4368-6c1a-c65e8d1da2e1@linaro.org>
Date: Mon, 9 Jan 2023 08:10:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B/DiJC5YV8ba

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Convert the remaining DPRINTF debug macro uses to tracepoints.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/bitbang_i2c.c | 18 ++++++------------
>   hw/i2c/trace-events  |  4 ++++
>   2 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
