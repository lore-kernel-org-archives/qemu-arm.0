Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1348487ejc;
        Fri, 3 Mar 2023 09:38:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8uxb9VRe5HFHgr4BitK0P6XMu3f1C0cuX+QJQxEeZwvZjrPdBaNVUGtcfm4UShvfxuO3yf
X-Received: by 2002:a5d:56c9:0:b0:2c7:6ce2:bb37 with SMTP id m9-20020a5d56c9000000b002c76ce2bb37mr1898546wrw.29.1677865123707;
        Fri, 03 Mar 2023 09:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677865123; cv=none;
        d=google.com; s=arc-20160816;
        b=M+lMQtumRH1GRJOEJN7kiWFAJ+7yY1xRtV/p5Y1XvQRYAlqTdsdVMqeWjmVySZ3RPG
         mVx3cz7JSLDOG8Y0r48OaR2ECimO5rN68r6gfsADxbf/Ca1LQuan9koz+L4S9ea0wYhV
         Sqn3Qkvk78tqWcOJtk78YLTFc5ApeMQSs6UA7dhGy6bGsxTxePH4vybC2vQPI+4m/SEI
         oB3YwbDToshR9nugfzEb30AN/OY432f8JJctr7rZsKWwCqzrOTOD9ZXNxWc/fthNHnvR
         4Nl4/2QwknG8OYG/vnqaSc47rgXGritkq0h7dHrJNUj6s9tNAP0dX30n3cOLyFOE4MDS
         RrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9je84Zq3E8tnA0U1J9Pfoxxl29B84Ox8ThKlHgDuPb8=;
        b=tcieXHcxVTYDov3GUjGtk7tZ7bwEGkpkNlsMIs+3FBDWDybyb9c+pzyoD2wKUzThGN
         6TNKfgh0rqpm7mfhoFeiTGOt3M0qD8KPgwk4103RVSR0n+ylypF+3iSqGN0GA/aTGeZx
         79QYHmmKTVk3Q0eOmYmJwdO4SRYs8sfboc6Rkn7pw5s5rcgIus/Kj4vF84NDNGC1DRzt
         RRCnzfO0D8LurgY014Nd9HIfj3ApSWmXrQIqXDmichsxVtdqF7egQPPaYSyzbELjToIe
         DXpOVn7b90cFrgG7YSzQGZjeRxH11+QuXOyALl5Os8XCbeGiWgulEGmiJer954+/DhS9
         zcyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QYYmMcM7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5-20020adfed05000000b002c54e891095si2033741wro.138.2023.03.03.09.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:38:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QYYmMcM7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9MI-00060z-8N; Fri, 03 Mar 2023 12:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9MB-000603-Pl
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:38:13 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9M7-0002O4-7p
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:38:08 -0500
Received: by mail-pl1-x632.google.com with SMTP id ky4so3494238plb.3
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677865086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9je84Zq3E8tnA0U1J9Pfoxxl29B84Ox8ThKlHgDuPb8=;
 b=QYYmMcM7XDIiAgIMQcPmt+vy3IHDjWeY06gqG/znioqbrF7ISqW8cFYrewL7kdyLNm
 0f6oW9CRloKKh/GiYVy4KtDO1cJKWiRCBCsLCYtjD8EpU/olvJoEh8P658M/67+FlNcj
 uM1CxiZ5XOfZqk1du9PP5Rfdx7DsacPi2U+qGY83wvjGjwOggtnuepEMo+f9esWox040
 4VkNVLoZofbzXrym97Tu74oulLc1mZ3DrsUz9ugG1AieoHsmJjZ/qVOxZ4l7SZlj4X1t
 nrFWb58B7A89jShj9yXHBg6iMr/zB+JmJR+mCHQVvQgbI6Q99R2pIxkmaouiM324mbax
 Ld1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677865086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9je84Zq3E8tnA0U1J9Pfoxxl29B84Ox8ThKlHgDuPb8=;
 b=R8Sd/WA+1YLN3K0/FnSWt9Da+Bky1GwWuHDPAgRGJTGXIhmXxgUWIYaLFhl4hBULR7
 fePG075EoliNK+F3Dai0f3uJPY5WOo9a6tYGUNdW6W3bX2flwFao3+Mev9yxDMquXTdb
 CPoInHMyS6vRPgjm8MAqEvaJCHwZmoZ5xvqjIIIaj+pFRZ36twQ5LKODKkBJ0FH2x4ur
 gmukq/1LHEm2r97C6A5AWKmvNGLJzEm4aD2Pu20gOlcgVps52FW8OnKjKpJU8Nu/hKio
 rMqUFkuSDbrb9eJFY3cp6748czSG473hh2AMPdbVGdsYZDJKMb6pHAaNI7lemEeHlz2D
 JJXg==
X-Gm-Message-State: AO0yUKWgQluRvn01Q9aC+KwBUrQqxwl1F67Fuh6cdkqag7BYVukPB3Qp
 3K2dlq3TtK8zMYYMpZ8EgK8OG4AGQaqnhFccBbEmZA==
X-Received: by 2002:a17:902:ab05:b0:198:ec76:e249 with SMTP id
 ik5-20020a170902ab0500b00198ec76e249mr1045233plb.13.1677865085783; Fri, 03
 Mar 2023 09:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-14-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:37:54 +0000
Message-ID: <CAFEAcA_qhH1xikZhVijg0xC=5DQd3sa0LNQ6T0a7ub2QkGwAAQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/76] target/arm: Drop tcg_temp_free from
 translator-neon.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PVZIa+TRHpZf

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c | 131 +-----------------------------------
>  1 file changed, 1 insertion(+), 130 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
