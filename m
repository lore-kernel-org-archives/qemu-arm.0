Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2420674ejb;
        Mon, 20 Feb 2023 08:19:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/KsdXk6Cb/ZRTzMmgDZWsxMyK3VkG7gFyMgoBeYK8LlsTgKajiDdywA1N42JbmcujgnLXA
X-Received: by 2002:a05:6214:c6f:b0:56f:556:1236 with SMTP id t15-20020a0562140c6f00b0056f05561236mr1894964qvj.35.1676909948312;
        Mon, 20 Feb 2023 08:19:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676909948; cv=none;
        d=google.com; s=arc-20160816;
        b=V/NjZL+6cU63aXwJ0iwkh8xYmXbRmR79YPeKoPql1ZQWn9r0xvWy79IXuU9oU0i0KL
         LPeevV4PYKvXfOoxfNL3RyBzzdd175neoPItUhlpiucIdkGJZ9sKFpxgCyY8plbbtpIE
         l9A7667YTBHH86b+YpRXZkg+bZUebMbqHYRMx/+kLSyQnpWIl5851fJH+2tc49hg4hdN
         kBnSGr/Ra/G4VHqhMBYoujfHE5m5ZW9MfiFt3sn551LsFo7IL3ezf8GgTirSpm+btjK/
         96/0w/qszqLZShEibn2s3ATa22RRBlLhgO5UcGDz+UWdheUY9fYAIm64CeUXecIUp+Im
         tKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ImTxngVS6KmYoQdJQ80fW021PSXRBcVh2PjUhWpEIGM=;
        b=tQhJgtuixFwCBSn7u1NcnXXSrjv6ayIYWuepRGM6i5NKeeCrSEoZU0/UnFj5LGYK51
         hFJRXpiw+q9Un/xV++a9x419Q6Hpqus3GDoUuLxny2BRyhvHYxRmSnprdABgoy/3b2kr
         SSAlPwK0ekEV4/T1bh2EmzdSoiOf7q3c7YCoWGzhBktgnIc72ZJvWsG678wb/T0bo0Qa
         vAxgCiITTwZLmGuyPxRp56OjPwK92KR47VV6CdMOfa890itlkAK++6S/qzFd0P/dwq2w
         sdROFrAi3WlxYX4gcm43r4P6qhc9HEPq2lAbz5wLWwpMXnpSfocbLPcMVGPqgmoitJ6o
         ON/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sl+eTtlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a0c9a4c000000b0056cbb225837si9815765qvd.274.2023.02.20.08.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sl+eTtlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU8sM-0002iX-VB; Mon, 20 Feb 2023 11:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8sL-0002i4-BP
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:18:49 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8sI-0001BK-MK
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:18:49 -0500
Received: by mail-pj1-x1029.google.com with SMTP id o16so1919368pjp.3
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ImTxngVS6KmYoQdJQ80fW021PSXRBcVh2PjUhWpEIGM=;
 b=sl+eTtlusNMCyQ+eO+0JCyBVIWsRDcIIiPcmiuPf2ZQYnMYbKX03oYYHKr34ac0wAU
 F4jE2KUZaECIZh5De+D3XkMv95x3fFM0Nnoy5RqY3+jNM/KcmHsb+eB8KuGrCnELmhvL
 JXP7hrEVtFrttky0ZkAkA9aALtwFYj4I/s3PVSq8dob1rijXYjdWOsTB+aBWADJ2/XZ6
 JXP+bh7FQzGQ9ZlpYoNH2Yh5p08Cryd9NNVJ0YvK4cbwrubLmQyY3zQJ05RGNSpTpntP
 OaAaUJ5tYWNl0E987rgK0TFfICuy2GL8PB+VTUjnkoOdTU1BrA2mrF/Dc9g8HiAkxyVc
 0OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ImTxngVS6KmYoQdJQ80fW021PSXRBcVh2PjUhWpEIGM=;
 b=Tb2CLlGUFZpMGzR7MngMGirP9KB76/NNbTmE0kB3Xa6bl89yBRLCPheSnRSupzEntw
 LamXuot1oQZ7Gf3kNJU3rXO/bmHa3+LPrDVvWEJmAoB35+JS3/yISgcDnBaw0W3cSbpg
 YDHgk33ZydLRB/8S5AiwUqBK1lWTgbiAtnztgKFS8vAKk+6VzxbTb1qeKpHZGTu/BHDb
 dMG+1oJ2PaX2cf0S5jAVywkDSd4MEbK5WuuG1LoZPjq1AiNCiNOk+C5dXeuomt8WGrnF
 MIleQQkH+9Jfs6DXhmxWsvOCt76FVCAzRBkUPFzMQXOopn+u4bVXY/CBYWxbRudjeUfc
 /qSA==
X-Gm-Message-State: AO0yUKX3GrHyXUiQjALp1fzQw7CLPFZCakyGMBdsqRYzKk0YplEm9msp
 SXUEBTsMLQ+v7spW6hAyT3JeXOOXAaQdPfu8mxfb/w==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1000359pjb.92.1676909919317; Mon, 20
 Feb 2023 08:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-8-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:18:28 +0000
Message-ID: <CAFEAcA_m=8fT1fKXhgMH_v6S7UoOeDwokjNO9QH6GdCO6fGT2w@mail.gmail.com>
Subject: Re: [PATCH 07/14] target/arm: Fix svep width in
 arm_gen_dynamic_svereg_xml
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dVzKGenOPpmz

On Tue, 14 Feb 2023 at 16:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Define svep based on the size of the predicates,
> not the primary vector registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
