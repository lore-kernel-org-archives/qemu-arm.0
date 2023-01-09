Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2433548ejc;
        Mon, 9 Jan 2023 09:08:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvYOKLcQGtjh8ZW+oiSorIA18NfPnaFGQv6WNK2ybFdICUSa1Lk9WrTsuiYqcuLSC3D0gXB
X-Received: by 2002:a05:6214:850:b0:532:3af0:136e with SMTP id dg16-20020a056214085000b005323af0136emr494783qvb.11.1673284133373;
        Mon, 09 Jan 2023 09:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673284133; cv=none;
        d=google.com; s=arc-20160816;
        b=Mt9f3wdpZwp9G7J/UgpEecaJQpxF53yJU4BtNBlpB2/gmm4D43V8a/xXFLiRkKeqvm
         3gvyx4eGX76ekGI4FiGf4pzAxQGgYS9lkqRaF84NtISLR48lZS0ol+Oy/SgQktCT5xqi
         l5J69znFBFFBLae3xAZRQRPYSmfxO3jsI5E2hYoh86sloZzzfgIUQ68GKp8v0M+HDouQ
         y0KyHP4sR3hrut62iPYny5CajiasPxKpduKqwYOThDA2f5RRLKSRZ/F7wl6sL4UEPXlI
         rRIKckYicQJQtsaQO3pbi8o6BegNRtToTVOupchefKsTID+QwoGx+4s/z6bk3fcwN7IS
         0njw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/kDw5do4OJo9qC4J/ERsOLAcitpyu9YKNp5iwCH1+xE=;
        b=wuGl1jG25ekJgPNbQuISmsHVPcWg5FTOo9W0E3b0g1BD0pgG2Kc5VsmIoxmxRFMMlT
         HvuFI5vnyvZp1RqTwWe6m/S00v//saGMZKausln4GcjI5rtc+0S+eOxsu7lHOyrg8mYY
         MqA2TFjIyGnH3naL0FWfj6Xu6Lzl1cKXHwiscTB3rQcla2B70qTLG8sMaqHEOIhXeZbj
         3vwP2GPvaGfHtsd5/zKn8Z84CKbA5a3Y4D33B2NjYGeOohQBQ1qhb6Jff5Nlwuj4oMv9
         hO9eaSk3euctGDysM6UJiSC+drehNm28ABimEoGg13eoSrjjgKye2RGaB62Yg52lca9w
         EyrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jXawHFvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv5-20020a05621429e500b004c74db412b7si4871162qvb.526.2023.01.09.09.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jXawHFvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEvdf-0001eE-SR; Mon, 09 Jan 2023 12:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvde-0001dy-CS
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:08:46 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvdc-0001Ju-V7
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:08:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso10341558pjf.1
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 09:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/kDw5do4OJo9qC4J/ERsOLAcitpyu9YKNp5iwCH1+xE=;
 b=jXawHFvB2+2ZxIJifSFGcrwCG7JRfKnA3ANZwv2ew78SFaNT0bcSRQ+dqq3aCF3/Id
 UF/VxrmiEjow8E6I+ABa7lZk7DlvQcCsDiEwpmvYntDF1zq19tEQufAqOJaISoI/Tu16
 HoupnQbtiiBgQuKSA2D6O05Wd4hXaJBW3W5eBX0cc16hHjN5cb3OJF4b7DJk+Kxqbs/P
 fBpkhlj2PMf6L0x3aMdx9rC1/TgcMbeQIAyS67zyVbC/rAQM7Kd/NgwdRBcihS8jB5/g
 fV/W2alt4mkDDr/wyl4FejxgJVCdQ+und4Lym27vMsHQd2NN8ViEbDqTPQdlkKQxybV/
 GDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/kDw5do4OJo9qC4J/ERsOLAcitpyu9YKNp5iwCH1+xE=;
 b=q6ubtw5+AUhl65d28egfW0fPiYJvbBc8kNFq7Sw/W+fQCJ97DsI30FnYu0mi8TCCoR
 uxMOW+NnyL8Pw6iVr6SkmBoyTWMLGGuZVztbo2OyBSrjV5xoJAdKIW1kb/jpP+KKGPKG
 k0QL3bs85UrsBQEyFFwrZmq1VarJ+3xTc8D2YIbGLGI3OXJc6h+SsAkWwFl3GMBZc0iN
 HPyeYOvN1SXeHwi0CE4GTlz1nwHJ7sGtmhyyzSvji88wKOZZ+lnLN0lZrawInMdQlay+
 6AdG0B182EQG68MeeULfcAsRx2pfgSVckRC7QPPTg0xe+MvHRXF0BD6ON2tTMQPXmYc+
 K5mA==
X-Gm-Message-State: AFqh2kqO7zjF1Kw4ZvS5vuh+eifREyF79BUy5+Byv99xx1YXJi+oS4tL
 47bmycTYVqSvalgVEmqjtjUfJw==
X-Received: by 2002:a17:902:ea0a:b0:192:6b73:ccee with SMTP id
 s10-20020a170902ea0a00b001926b73cceemr81573282plg.18.1673284123260; 
 Mon, 09 Jan 2023 09:08:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a170902c41200b00190f5e3bcd9sm6417382plk.23.2023.01.09.09.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:08:42 -0800 (PST)
Message-ID: <3b1572bc-a178-5d04-9e55-95878bcb05cc@linaro.org>
Date: Mon, 9 Jan 2023 09:08:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] hw/i2c/versatile_i2c: Drop useless casts from void *
 to pointer
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109091754.79499-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: k8s8zgn8tpn1

On 1/9/23 01:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/versatile_i2c.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
