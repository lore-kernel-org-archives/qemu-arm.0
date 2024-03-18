Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp536035ejb;
        Mon, 18 Mar 2024 03:13:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTV/nftSPSCiUglDex5CQgzZ4JoAidygudihg0+dCJyrVYePLxiHvwFkEFgbMa0XR2HbjI5fpWEoZ/MhnLtVUen8XWLsTC
X-Google-Smtp-Source: AGHT+IEMGJbp0YvqgJxCOv+8BEC4HjCMo0tEQdtCeH11gDcyPKIadHzggPSEH8peQrDRwyCCX2OV
X-Received: by 2002:a05:620a:45a7:b0:789:d76a:c58f with SMTP id bp39-20020a05620a45a700b00789d76ac58fmr15702627qkb.76.1710756828307;
        Mon, 18 Mar 2024 03:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710756828; cv=none;
        d=google.com; s=arc-20160816;
        b=a00N31ohOephv9RJRExnbZa3vhQwuZvjYMRXiH6/FCap69egCo1xyMacuJZPVh+qNB
         1y7WCbyrxZ+YoH0XIV9Jgp/TuCNT4q3gvuLCk/Ksi1Vtbu2awpUpZ0sXHruXRo5T3D4X
         kCbEGphKHlOh7r9vGbCxeqtsv+T199HrIAfZawdN9ZXr1Mf8wI9XQhIQkUO1ch9OlDeh
         0zJytXzb3CNw6slvqZUS6UoVmz78yTPP9sDallJhBfmpm8LNDxVI4BLa/CMWtDKFQ66y
         ZyNe5xAdpOM0zOD5465ZvUR3MquS4Fog+0PsS+J7Z+X7YKefALhAJWQkjvQRw6Q3K9Hj
         48BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wcwn+sUR+Od11Wt0mE4L+CboL5vA9UhwnsgI8ABE3Ps=;
        fh=jT06233x+hzZOjWNwVkCz8lVp2AwKejgPMiSFIvDsGM=;
        b=r3ov76BJOlUBBCZFyIW/Rkt8dmcr4NHj3W+3cP0pUd/adfbCgZVDjO5B/l2H2rIOwO
         VP7c+2GIpP/1EdUnG9pR2sXCyng000e8hKbzwa89kNGTlAxzXBkUoY571GKtYh1vdXjo
         uj7thVhNVUW/CPAs8iGmp9+4nLQMjUPUJgXay3BeNlPrRB5ZG+IzOZkhaW9WUPcQoz1W
         7ChrwHaZXY44SBp2yuXZryFB5t1oSA48qS8dMuPEBx1Oh3s97aElinadT2imN8pqK/V+
         vUr2XBPVCin3o17e8VYdpy2l56igtpmsJmYSxUgMKDoQnpIAUCQaUgxUZIjjjstBvsjq
         +aVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=McH0tAsl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05620a291100b00789f5b8531bsi3547598qkp.164.2024.03.18.03.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 03:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=McH0tAsl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9zs-0005bJ-4m; Mon, 18 Mar 2024 06:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rm9zr-0005bB-GD
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 06:13:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rm9zq-0007G0-47
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 06:13:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41412253e71so3919505e9.0
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 03:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710756811; x=1711361611; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wcwn+sUR+Od11Wt0mE4L+CboL5vA9UhwnsgI8ABE3Ps=;
 b=McH0tAslksqRaDweFTded5dNH846ZG/xUfN2xYLuYtcHvjD7f3rVeN2cPrkqg4S8pn
 erJpcEiKzfT+H0dqpCmpSnyqL5ttXyJCaWWjVhaUzlrPeXmu5Lu0HqrB1IeLDqKzenCT
 +ksGU4UGJETMUMgOSee+uhA4LhELktfWBKCWnZyd49y746CV53BmX9SCibCE3qqVqQ1z
 AZuz/KCaFQ+RW3bfRnQJpXQH5yG3Ck1P34qOvJ4OLey+fZ2kMvNQkbXrZmBQrDo9HjRy
 ZiE7IJJ5rCP1MmKTWJ1bwzrF0G31eeik0vfCINrBq7z8P7ALXpDyCbw6Ip20wVFfme99
 1lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710756811; x=1711361611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wcwn+sUR+Od11Wt0mE4L+CboL5vA9UhwnsgI8ABE3Ps=;
 b=BlE4+z3zcwDWBaquLDsQ7Era7tfEeDxcXKdyXGvsRtcaQCPd3iueb2Po1x3Kpfto/9
 sSG06nXEO5ksoOG+6rB47kB24RiEtr632+0lw0qrfYNc01liTPNpbgSu4/mANJwp9S4V
 ApUuJxzONjWppLPdu0GZk5dgRYGaRQhhfGGaaJv66k/TsFI+2rXxkd+gQAGoUSqi7RCm
 NUno+bA+TnNIz8YwMQDuZIGC7FdzDJ5TDknfHns9wA6X4wwEjZrm+zESKRtniJkGgmmA
 wHmpXdOzXoXwCh7+b9/+007lfUYGbKMPGlkCxu8mCGOJdrOVaRr1OnjfUyRuEF/9ccun
 q3Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9kGB7L60Uue0KrjG6/wz3fjyLILkGFoTNO6vR/R8TUTRSfnFyiWgHUacNqIm2RgZTmTTmVA8Fgnq070wM6/Ee3dmy
X-Gm-Message-State: AOJu0YyJ3wrhSy86o/1wg0u/TD437qI9QTycdhbMWQE9N02JD0LnzpL6
 Nb4y/GJZdRWUle0qXi73bE9QhCzp+f+kFqRtQtzEh1xrNVsy+HUZ9JlPVOIUdiw=
X-Received: by 2002:a05:600c:46cd:b0:413:fec5:2982 with SMTP id
 q13-20020a05600c46cd00b00413fec52982mr7272457wmo.0.1710756811290; 
 Mon, 18 Mar 2024 03:13:31 -0700 (PDT)
Received: from [192.168.69.100] (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 ay18-20020a05600c1e1200b0041412fa398bsm1566364wmb.5.2024.03.18.03.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 03:13:30 -0700 (PDT)
Message-ID: <1b903c28-f427-49ec-9b98-c96d0caf66b2@linaro.org>
Date: Mon, 18 Mar 2024 11:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 0/3] ui/display: Introduce API to change console
 orientation
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240318100543.78846-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240318100543.78846-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Qu86xAOkQ9en

(Forgot to Cc Akihiko)

On 18/3/24 11:05, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The idea behind this series is to reduce the use of the
> 'graphic_rotate' global. It is only used by the Spitz
> machine, so we could convert the '-rotate' argument to
> a sugar property on the PXA2XX_LCD_TYPE model, but since
> the Spitz machine has been deprecated recently (commit
> a2531bb855 "Deprecate various old Arm machine types") it
> doesn't seem worthwhile. So just extract the API to change
> console orientation.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (3):
>    ui/console: Introduce API to change console orientation
>    hw/display/pxa2xx_lcd: Set rotation angle using
>      qemu_console_set_rotate
>    ui/console: Add 'rotate_arcdegree' field to allow per-console rotation

