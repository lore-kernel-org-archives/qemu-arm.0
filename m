Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6479586lfg;
        Thu, 4 Mar 2021 10:39:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPdutQBWmAf59a1Xkj/Oet1Eq1dE6lniOqp2u0k0TGwKpWGuVS48/9rnvlxd+OQIXSAJyj
X-Received: by 2002:a05:6602:2248:: with SMTP id o8mr4566704ioo.155.1614883177563;
        Thu, 04 Mar 2021 10:39:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614883177; cv=none;
        d=google.com; s=arc-20160816;
        b=WT1v8bQLGWYc6tq3VNRJcF4FqIOJ35ax58MywXHm6vfezKfJJ1+rIXT77/xeiySL4p
         Y/CaOfuW+KbXfaSR55f2+Hr/iSfOAOwdHHcz/Jrf7kfVbaWjqdgqqZae7oApCE87CYaX
         NSFXUX/E1qeeZTlE2WeEvp9seNpMVPVVcClN/hBMKemQOw41vFksSYtL9X014CHMhTOZ
         ul54XAoOt0ldRNJTHR60fFZjgsnZCAWZj+pthwPLGbYYlzTjMfXHHgytFnjdjoOqIVky
         1rsnJJHLVvZ59DAsLiLMNFUlKJ7jlGWRiwKg7T1bsGseMRnA5kFAw/X71Ox8fm+d82DY
         05YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7CkzNXuEbYSGkJDtStWbiEBKR2nqWeCAE3VHI6OZ4Ek=;
        b=Wl9AR+s/kN7B13bN/pBygpCAa7YRGIyFwUbPRNeZG0DNjPKE/X/d9QT8JxWUX6oTzg
         /ZJ5J3fxpldCXESMkuJsVqBzyAjzTxXps84NMPwccp/0+SlBH13hC3V/IDSmxpWX158B
         L4I3KWmC8ZMDqPMhec3Q/WH8UiiJtNdmapVsBXjZWQb+X1e7HGaF3JjEGNq2ru/VFEbY
         N2q5HBaa3rHycwqrgValgBkQk4nAeQaO7PvRyATzL52LtcBSFHTJiaVTsMFIzxWvn233
         ZamY2g99zb3yv9IOFOqF3WWbG+8qEOFxico+UYQF8hcVoW7W4uuUn/WcHBsieusA7ozX
         3ViQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TYZ1/vfJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si119833jak.102.2021.03.04.10.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 10:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TYZ1/vfJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHssq-0000aQ-Pv
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 13:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHsrx-0000Zn-FI
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 13:38:41 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHsrt-0005NC-M5
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 13:38:41 -0500
Received: by mail-pl1-x632.google.com with SMTP id s16so16642755plr.9
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 10:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7CkzNXuEbYSGkJDtStWbiEBKR2nqWeCAE3VHI6OZ4Ek=;
 b=TYZ1/vfJmw4AmcNfjpcaPKI0pyTLQrZuXBK04VavbskmKIqzVbFnbSaauEP+FVOafd
 zw7F5mU5mpe+tGfnP/NBEcz02dEEeBTaT1qU8k6X8/7TAdxpQV/Obkep8OlE6KyAP8sw
 DqVeBnnUBYEw8vSyRv36vQe0rMzv1n4NfWaUYd5QOPiP7PuzHTl8QPf95XndZ5h/PTe2
 q5IvZbC8jJqyRIGarlBo7E6EmvzSqhOvJcMaisxPl5wXZO84GlGNT56p0sFqhr5EY2fK
 l4L5gtX38GmZ4UYB+4h0vMN06W9+xyWUqUFHw3A+kKro3e5uM8SMClal4lSickEOkiTj
 r1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7CkzNXuEbYSGkJDtStWbiEBKR2nqWeCAE3VHI6OZ4Ek=;
 b=H5GxiJEIMM3MVqNEBbbsbaMj870Yki6vZGqNw5+2e5pShmjWqXQrF+tWWNa3agrcAN
 swVtfTP6GuAqRUi97KcBkGaOGUW3sbQgZ89jMKAlc/ojfKSVZV7ZdVDZorPWW4xTmq4E
 5esmbKJGr8wUbF+TUGSe2pYLsWAL3cT3jg5aYfW84vxTHuavj99juzCDa7JHsFYqFDUj
 p1GzT63kw67g2kA1EenDQwaZWUopcZmx2qldr1CtPdIEXMYF1VzOyX++xuPL+To8HLpu
 FZYYe0oXofAyuApwAkizZ3ahLOJH14kHvDaTv03OM0gXp0ES85V/XHFggRTUpZgaaWxg
 NQgQ==
X-Gm-Message-State: AOAM532wtb/scedc4VHIqrV66rIfaTiFIUoxoKgmULjb2rI203MoQoT0
 r9MlFWxSbdSLWIq8X70ueOS64Q==
X-Received: by 2002:a17:90a:9748:: with SMTP id
 i8mr5037460pjw.145.1614883115345; 
 Thu, 04 Mar 2021 10:38:35 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z10sm16816pjn.11.2021.03.04.10.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 10:38:34 -0800 (PST)
Subject: Re: [PATCH 11/44] hw/timer/sse-counter: Model the SSE Subsystem
 System Counter
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <abd5bdd0-2bbf-f230-8c84-02b85ba03491@linaro.org>
Date: Thu, 4 Mar 2021 10:38:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 525iay4yNu2U

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-300 includes a counter module; implement a model of it.
> 
> This counter is documented in the SSE-123 Example Subsystem
> Technical Reference Manual:
>   https://developer.arm.com/documentation/101370/latest/
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
