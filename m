Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1105150ejb;
        Fri, 20 Oct 2023 03:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSRB00KYCfGzBFoOkDpbIwdQ1ytDEKKKf+3HyFdhx3YVZM0BmgQ/dupS25U/PPfGFVf0Q2
X-Received: by 2002:a25:db54:0:b0:d9a:c88e:e78a with SMTP id g81-20020a25db54000000b00d9ac88ee78amr1325018ybf.35.1697796334005;
        Fri, 20 Oct 2023 03:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697796333; cv=none;
        d=google.com; s=arc-20160816;
        b=VcLZ0JmG4nZ9G65zaoC0OcDrFihK6uNltS14V3ENRSDXR3+4xm8rs7bgh3gd9C4rAk
         5VhvP0R5oTNV7y5VEyN7ecg25jcoibVw/ukskqIgcuCOXBX0eVc5kZ4lsBLHl33/f779
         tjZoroRZ9qUexdS7LDEg/wLqCTHEKVzxl2doBvZc4W6TkBKON2CA8uWM4w7BVFNkUUAu
         HqG9xo0PVDJS5d5vUyRU3drVj0RNrovQxxCsce2pT3wa5BDMvO8T0UG9ligixJF3Y6BD
         9yxhA1nwqIRY42xoWH18/fb9RCEKeLOCVQHSF1mft++skvMH9stkA6AWWHbPhCKEfG3w
         6cSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FuXVKI/L2uGHl3E8LwcUCfAYOXQ/87vheSiGRI+GPPo=;
        fh=3gtYWTD0QGwWLEU0THC/EPbNNftfJZpwTBSEN3e8kFQ=;
        b=UqzhfVORGcRsrmqhXo+mZJ9BGnbv82wSvLUavRomnNE6lOpce4VXNG23uF1QfiWfVy
         CE1666lSd37FMv7G1YJ67XMFUl9VXWw/0kpd1fAD7hCEsJcC/FBUlRyTvtZZvE8Zf1uw
         S0kJX0pPUhn4eogTeeIjq4Qn8vWbeccYY5BT3yxjIjxTtit73HJBTI+PJSPBEF4XPPbA
         Nl4hNeWai+ive4kP3RLcU9omieeoNn2ziwCq3ioovdz8q1PMdS6m5ltsfmmbL21VAXNv
         ppI0jv4aaHfGLKfz+YOMmuEaxoH0Py2w0dPJMDbW9UW18qBRvaYHMTiTT2qMkwaWpdqs
         vyNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zk1/2W4C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lb7-20020a056214318700b006594b2aa680si1123459qvb.491.2023.10.20.03.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 03:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zk1/2W4C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtmNJ-0005AE-1z; Fri, 20 Oct 2023 06:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtmNF-00056k-Mo
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 06:04:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtmMx-0006OD-EH
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 06:04:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40839807e82so3823915e9.0
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697796275; x=1698401075; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FuXVKI/L2uGHl3E8LwcUCfAYOXQ/87vheSiGRI+GPPo=;
 b=zk1/2W4C84goAmVkL9RcZP/S9xmJUKXvMMI9W5evPR5mhuHilMc3ZvYZ9NqKI7S4/H
 RcHFZdyJJBQD/6ITM+IJZuaoVPZyunSZiOQDtVzYR+7MCFVXJsKeo8NS8noaf49tixqp
 I2OLa61SHkwrDAaE1IHDa6mfFPW/DZ9hZqdiUqKeZNc19pzbQtvvk/WtLcdK0qyk47UG
 Cat1B6/m52sUeJ11a9nXTK4r+/QNEOkWpWULgPgc/cz65adghuWgzlJKcSiI/Q2FE7j1
 9S9MJtBAlsehxfgMuoA33x+CLHuyQmBDxm5Y71eL3k8/LPLFfSX5fmvfqVN+2zPnE54J
 7aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697796275; x=1698401075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FuXVKI/L2uGHl3E8LwcUCfAYOXQ/87vheSiGRI+GPPo=;
 b=EB3UN3lInslDlQ3ItTd8HrXagbLyuibGpj8qEQTBwETD/9CKJ6WITkTSadter1UGc8
 +a7uSkNuFTBX7Iz/T9pwoEeawzBeNBoW+fMOedtOT+mEzZyMT14YRFiZgc91jSxn+VK0
 OAawX5/uSe0j5W6zOjEDHARGW06wyskjpDJkKEQS2yURMmju94mH3Ck2pTcEWBcbFqXi
 Lqxb5/Dc01r1mC3I5TQwWd2NNQ9S/PgDJUXF2K7N6rVBk1Z22dinG7feT967m/AWMh6m
 3k2CI/10rLM3yevo60v3ssdqXdwWICNQd6Ga1pjWJonDpjzGJ8WoJbCvXqUTW4HP2hy1
 y2KQ==
X-Gm-Message-State: AOJu0YxGKImfeJzeevcYF6CXMDZ4a40dJKeqvSMAS4WiEmw7N1toICzH
 7xVlJcxzWFIko/b7sRg78sqrjA==
X-Received: by 2002:a05:600c:298:b0:405:3be0:c78d with SMTP id
 24-20020a05600c029800b004053be0c78dmr4203309wmk.3.1697796275135; 
 Fri, 20 Oct 2023 03:04:35 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 x5-20020adfdd85000000b0032dba85ea1bsm1338801wrl.75.2023.10.20.03.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 03:04:34 -0700 (PDT)
Message-ID: <3a05d669-fbd7-6fc7-451d-edbbed20d7d5@linaro.org>
Date: Fri, 20 Oct 2023 12:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PULL 00/46] Misc HW/UI patches for 2023-10-19
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org
References: <20231019211814.30576-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 SPF_HELO_NONE=0.001, SUSPICIOUS_RECIPS=2.51,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ZymUGGnCfM7h

On 19/10/23 23:17, Philippe Mathieu-Daudé wrote:
> The following changes since commit 0d239e513e0117e66fa739fb71a43b9383a108ff:

> ----------------------------------------------------------------
> Misc hardware patch queue
> 
> - MAINTAINERS updates (Zoltan, Thomas)
> - Fix cutils::get_relocated_path on Windows host (Akihiko)
> - Housekeeping in Memory APIs (Marc-André)
> - SDHCI fix for SDMA transfer (Lu, Jianxian)
> - Various QOM/QDev/SysBus cleanups (Philippe)
> - Constify QemuInputHandler structure (Philippe)
> 
> ----------------------------------------------------------------

Stefan, a change has been requested for #30 "hw/audio/pcspk: Inline
pcspk_init()", so please drop this pull request.

Regards,

Phil.
