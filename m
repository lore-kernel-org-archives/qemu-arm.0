Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5867602lfg;
        Wed, 3 Mar 2021 18:27:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLDz2FSGMTJoIpUrRA1WN18cE16KXE0/GqLxzdOgmqouuYYixWxIN+zYuzPjYQBqhvKx3a
X-Received: by 2002:a25:ca01:: with SMTP id a1mr3298045ybg.298.1614824850875;
        Wed, 03 Mar 2021 18:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614824850; cv=none;
        d=google.com; s=arc-20160816;
        b=qfq17hrvGpErnOznqO9ZU0844ISCdMQVkKPcgycz7HIjG0JLYaPkLtIX/PDasc0wHf
         pcgwUSMV+AIs/ivuvr784zkR/AXkTba8yeQ0ZvqsWE1Z2bqrR959+1KEi12KUhlQYvnF
         kuKz4WMeUvYYboNPcUCYE2MYav8Oyt4XB0QQo+BkYBjsWQkzs3/H2hTxMGln9tm58wwj
         aIPKRFeriFBmI0BajBuaqlRFMRitsbpF0uEHq4puKwliEp68lr4CrWo/EYTQscrMGhde
         Vb0zsTqBfp4BbKdFLGk1Y9G4St8cr3fiKacLEUmnKjQHR18xDtGJKakzwHRvEDruE1hj
         R88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BybwGU/42trw+TzG1KD5ROWieVKsLXoWH5hwyXcHGiA=;
        b=zH0VEJ+NAS8kEw+ONixjLrhb49aH7iTCDfpQDAsCqNEZcs4XmiUW+RGjkLjI973sbP
         5+QWEd6+uLXmSvml6wjSXmJNQgzucMgpdLnBhzRID8n1o4iV9lqvyVlLatjXd7jUXBp/
         Jimfox6O+7vMRyYCX5yxzHf+k2Bbj0qXKLVSfoPlhUH9tpqUgEATnC5WargyYYTz6QuU
         CsuurSB4dSKm6UTtt5bRJ2MuEdIvYQl+YU/2tV6VVTGXoVN9yd63dIK2yL2tCzIu+2e2
         iVEEgqcJBJSX9PWNLyvOkqxFc/KkKcsDfrAEBboyGuwV1D6cMWWqL8SuV/cx0cqY2Ys+
         ZbpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V3anvyb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si15472730ybk.470.2021.03.03.18.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 18:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V3anvyb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHdi6-0004Qe-66
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 21:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdhi-0003tc-42
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:27:06 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdhg-0001A0-8z
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:27:05 -0500
Received: by mail-pg1-x52e.google.com with SMTP id t26so17901273pgv.3
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 18:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BybwGU/42trw+TzG1KD5ROWieVKsLXoWH5hwyXcHGiA=;
 b=V3anvyb5briLsnfsupzCXqtqZ4Lv353VuJPHJlSyHnBu2RCnFNF1Aq/Y+I8jBoOtot
 qtFSDhOQb3rNm5rmokpiNeLwc6aM5w11rm4GGTuCQzI+5RpRCQb0h3JRNQ1V72zhNF72
 g37mOodEh6gZOB0s+yygv8qWNAJ5Snue1MWHit3mgLyyUwHk8/Lq6LcEgvCfy4FuH/pR
 YR2H7aqLrpOwUmk0Nac7vE71IHvLhSZpFX4v2c1e1Xxaair9E2dQd8UAvdjLu6q0Z/Yv
 FbaGcda1oM0uPapSyBy0rvAYJh9kh9i0/ZJbixcXhlMorsQNebWmNJ/STCBPcnkMWCu8
 57iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BybwGU/42trw+TzG1KD5ROWieVKsLXoWH5hwyXcHGiA=;
 b=A9lL+Tz9v26X3U1YFLHkl9hlL1AuBDnWo6QFZjzUyq69y0kYO/CI6u8g7ppniyym4k
 U0wT09RZBxOOHwMVvryJ4pCfiRyWylbBemT63yfItbWEYNdGNsC5bfiNiaQ48cmewWkt
 d2lc4+gyC9NFMd+7PcHxyp8KSFQ7w+rhtcinnIVcPiKIHD3FKfbh9Gw5ZUtbNocOKosB
 DrvRN2yDvA98K811lnECNPRRgwpCrgftC4iy7fH4OCCN0yUPph7venhBmC3vB/FGyqyp
 X3b2sics2favF8UA3vqa9TQDXRrAokvK+r7q789dbe3jNsqV6CayqbxLlTNV8bgyvJVU
 SyNA==
X-Gm-Message-State: AOAM5311Ns/ZYATNRDUrI5cqz1/otheyW/AO9wLDJCIA1XMeZmAOpFJs
 d20zV3q91my8tTDVOzx/ZfxblQ==
X-Received: by 2002:a63:f055:: with SMTP id s21mr1720925pgj.293.1614824822783; 
 Wed, 03 Mar 2021 18:27:02 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 14sm26062042pfy.55.2021.03.03.18.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:27:02 -0800 (PST)
Subject: Re: [PATCH v2 24/24] hw/arm/mps2: Update old infocenter.arm.com URLs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da74dcb7-17af-89f8-c3ca-3bb17e2e3983@linaro.org>
Date: Wed, 3 Mar 2021 18:27:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R5paT6NQHh8j

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Update old infocenter.arm.com URLs to the equivalent developer.arm.com
> ones (the old URLs should redirect, but we might as well avoid the
> redirection notice, and the new URLs are pleasantly shorter).
> 
> This commit covers the links to the MPS2 board TRM, the various
> Application Notes, the IoTKit and SSE-200 documents.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

