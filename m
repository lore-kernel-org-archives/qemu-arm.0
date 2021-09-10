Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp880601lfb;
        Thu, 9 Sep 2021 23:48:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1OYutK3iMn3D3wtY6EKcADrJ5Sph+KysTDpzLuxfT4Z5kRXYbejNxgmgj/f/nI0ThjMKU
X-Received: by 2002:a6b:3e84:: with SMTP id l126mr5977590ioa.151.1631256490006;
        Thu, 09 Sep 2021 23:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631256490; cv=none;
        d=google.com; s=arc-20160816;
        b=W7uR5OxX2Z1uM02iVEZ93lHomWM/6ul+CBM1osJsotxPtT+RXLhUl9RzNwfftY9Ekm
         W7pLhZm0SgehgO4ZzD5/C6Ggm3VjAbWt6KV15OPocGlOG6YiZsrhLw+3fsDLTH4pnA+g
         tUwoyo4OM/tgXTlB/QWAfCOxtR2fJmKrWaZq64VA099XrV6wjgGL0SRZvExbYiy1Mcsu
         W9scR81L0txbSKOzO3eDthQeCzACMGhsTIhFaWf2U6olN0VFEoglNqwK0tcfCse+9zLK
         yzfcRmRoXdJ0lSJOO8IFCjoPFKNwpewZxn1PTzMlVHLrehjD6c8RFY8cfs7gb9LPJBoy
         9Czw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JZwVYff2olTKH4aZVpxOQc2TZr/YmofPRDMpeuN43uQ=;
        b=uLPvfmTPP4d5NapMt3ksIvM/7qK+0fL7vdkV3QAu/kqsxQ1Hr/0o5K7ITK/9npAn/s
         pY3k8kTo1H9y1wRz4HMnlmWWhysfYryhMjBAMIiojwVnYK98metT0se4A84pWKblTjzD
         2QFs0ZMrp5Q3e6tLBoCkT/2JGWMkXXl/Rzh1LdSe0YIlNjfmBGH8PZbGsxADXOqktFwS
         4sMvpLJqPtmOLv/B0teFTlUecrbQ+lAuB/MuOAr0U9mmhP6728mIYGl6MoaKyqAUBgkg
         LMpQBcX1sGFk3iCJg663IrFtHEaEcfbDzKuraXQvNK6ccQmXDkNVvOhgipiPHcxetB6Z
         ngxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oL9xe0b8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m24si4176368jac.82.2021.09.09.23.48.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 23:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oL9xe0b8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOaKX-0000GQ-6C
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 02:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOaJE-0007QY-1U
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 02:46:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOaJB-0003qG-2m
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 02:46:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id y132so447505wmc.1
 for <qemu-arm@nongnu.org>; Thu, 09 Sep 2021 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JZwVYff2olTKH4aZVpxOQc2TZr/YmofPRDMpeuN43uQ=;
 b=oL9xe0b8sEeHGs8Ygo4HpTeWlqJ1Z97hRRVOwUPAR6jCLEQi9dU04h4qxcfxYd6g0b
 RCf5Ah7Z4YImJad5zso/uz36uSipMHtNZlULvDh0v+G6MRjozDlYSMmHHVX+NcYio2q9
 CrG5zqn1nBEwO8Ynm5XtS6uq/wVOPaabiZmJr1orgE4UgYUF9RFPfuI1nZaLsmTVYCGR
 CvfGx1M0usQN2s/tgXjMlilqEGtJoG00vHVO2WobmgbLJlBSFbsth458NOTqld8QdtbV
 Gn1ZlPt2EcuG79Hh1Izw3CVbBTVmxs1TpPOXtA32etj1et9SKcuTcENVRC6XKv0y8Jnt
 9FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JZwVYff2olTKH4aZVpxOQc2TZr/YmofPRDMpeuN43uQ=;
 b=WqNcXF4hVMc7RaoJJYLNMvKxwpcjc2L+CVevvQKT+D6r/tyYTMDV6DhI07ZSFm4bUL
 OcK4InzUMloYWYGknRwUdejKghlwqRaYYTjN2K1hbnQEk2Xygz37eYMHDTojqPPXuhQF
 YmRoyi+HqKgRXcRaG21aAlbGqmKSH72FuAbs/NgJVUNt+wBc21GAGsQsh0lDinP6amro
 N5m1iTeZubnQve80UInyt1OeNq2QPhj5keK2ui6n6vfZ1lCLEXppiu1GyrKmfr8iDc70
 wkfhQKgb9ABV8D0ainb2JnUxDo/REwcErfSxLGYeXSlxV3671ah8HM4yyBOWCAW8BEQc
 Nh+A==
X-Gm-Message-State: AOAM532mcdKuVI1LH+TQGnoPL0COOgkPq3dEHtb811m4FbT9KyTbyR59
 zYGhMkcyBTKtxEVztwBZNkBlQw==
X-Received: by 2002:a1c:35c1:: with SMTP id c184mr6645132wma.68.1631256402954; 
 Thu, 09 Sep 2021 23:46:42 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id d8sm3994363wrv.20.2021.09.09.23.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 23:46:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2263937-aa85-c51c-9a2b-bc50043e10c7@linaro.org>
Date: Fri, 10 Sep 2021 08:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DgOXW4OOLPlI

On 9/9/21 3:46 PM, Peter Maydell wrote:
> On Fri, 3 Sept 2021 at 14:58, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> I think you need to go ahead and end the TB and resync immediately.
>> Just set dc->base.is_jmp = DISAS_UPDATE_NOCHAIN instead.
> 
> Is there a rule for when we should set is_jmp to DISAS_UPDATE_NOCHAIN,
> when we should set it to DISAS_UPDATE_EXIT, and when we should call
> gen_lookup_tb() ? We seem to use all three methods at various points
> for "I changed some CPU state and want to end the TB"...

UPDATE_EXIT is for when you need to return to the main loop; UPDATE_NOCHAIN merely avoids 
goto_tb.  Direct use of gen_goto_ptr should be reserved for branches (which I think is 
already the case).


r~
