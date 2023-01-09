Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2437887ejc;
        Mon, 9 Jan 2023 09:13:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv6HJfE8g7eHJRjItJTgFebF2su61b+WdVnaqxWzExQKfGUzRLPVJ4f+HvbECYIPp5Gkr6x
X-Received: by 2002:ad4:50ab:0:b0:52e:5988:cc75 with SMTP id d11-20020ad450ab000000b0052e5988cc75mr79886378qvq.14.1673284438321;
        Mon, 09 Jan 2023 09:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673284438; cv=none;
        d=google.com; s=arc-20160816;
        b=0ALGIbwYWjVxSIr2ei8A2tsQtBhNlas0a+tEu6suEqt32JUPXwrcXLX/pHV+iwF+we
         kCETXGCJTW2GNd2UANo8p5HZrsmH12lthk83/BDfCTbrozdw/Dc7l6agodLkdn+cmNuS
         TFvPlY8cIV5XPjbiGbOALhFxmrSqGu6mJr4fsgfbEIcLxJep7KUzJe/Uicwwmz4FmzaA
         4BuIs8YNw40W2QHD3fYNbaMlrEuirTMgmfgfLvJRPu3vHl3q89quF2xuYLHU/2LXbLTJ
         fpqc0MsDNr+ebKXQxRGfymMuDdJNnogyOeDKvv8fprHbeN5ZGHqRSZn2WXlSZFFZewE8
         IeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wvtvhBNcnzQGTaKuTcdOmITkmNunXGMrPAwqsovf0Tw=;
        b=iuUnpE+DXCgMSxVJeXtifNRkmqFZ5B7AzhuJi4X7/D4+yPvCtlpalrmP1PVP5Yq8aU
         cWOZ0gEOua489BWYwEFQikys1tZq/Rjs1fMnFDiNI3V1vUm6uUEeyafVfwe09rRWimUy
         ZR/pvrpLuW7DRGHOZHvuOrvRhREnz1yXCFNBVfnnlMat7v98c/3vNFZ1U0W3Mt+0Jbt2
         fOrllneGuouSdiKlJ9KKPhEdUYW63qBf65+gH1znbJKiiLb2hwV3GiOosMSdiTYfVe7d
         OFqv3PrLWjH/BB8r3d1eudjh1eygLk3r06PonOTHODzhSL6Rq8ANHcDo3xOh9yAV6B+U
         S0sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ygcdGzeU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020a056214124b00b005322f6c17absi1691029qvv.18.2023.01.09.09.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ygcdGzeU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvic-0006Bl-3m; Mon, 09 Jan 2023 12:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvia-0006BD-Kd
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:13:52 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEviZ-0004Zp-8V
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:13:52 -0500
Received: by mail-pl1-x62f.google.com with SMTP id jn22so10186806plb.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wvtvhBNcnzQGTaKuTcdOmITkmNunXGMrPAwqsovf0Tw=;
 b=ygcdGzeUDAQitwmWCIjICtSpZcAbpaItfCZd66L7fglNJbysMM3423u3mNzGgHcQEB
 93JuX1fLsIZIIb7T61CFaDLlDIkFuB+Om3qoYtmLjbIbIN5yyu/L5sy8quFzm2S6Jc8M
 VZqMCb5a8NLhJMg26+5jqzENRtVtKt/vjlM+Pzp4g3ADQxyn3Ny5XQ1nItBmPS5gkyuW
 paKRckMwET36bWuhp8UUXZBIa5R9XTtCSWeabqR03whNsiyhWQGYCvnOZ7SIs2xtNYyk
 M/8yw3SbAC0+KJ0YZSXKnIVW9NUYCiMsyQEHmJB9u/AxHF4N9XqTlWMhRo3Oqk2Jp1IB
 pQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wvtvhBNcnzQGTaKuTcdOmITkmNunXGMrPAwqsovf0Tw=;
 b=AmiqnAnkFm9XC1JFPRagn6FNpf19MRKMFAkJtn4M1IhVuEU2svC0o3tp4ViFZK7aE3
 m0jjZPAj6aqnMQ/CyU3kbEqlJEDIqVsv1klV8zqC6AkinGcUZ8edx0YNE2yqtYCQsADk
 BNSCqUopuSD2C5Ny1/dIO1fmLs84QCqV0QuQa207C4e2WSIiB/IaOxfIzDfqVp72lzIa
 pGFlMZ8qPq8+g3IHtkM1tz27uBZU6ZtiNxJ0udAwhEtOHXeQyl46YbekVrkPNnAgMHHi
 IRBsxhJLXwbFGRbBf9o6sMl7plVc+IULvQ/zwCaCThiXN6Qp+eY91IIRTnTOCVvwb5Do
 GS4A==
X-Gm-Message-State: AFqh2kotWrFb4Hi2o3vYq6xexRIKcxGvh0Q5B0aArWuIbwarGVPMhEi/
 Xnr5PtKaOJGDppgCG896iVH8Og==
X-Received: by 2002:a17:902:6ac6:b0:192:cd8a:f358 with SMTP id
 i6-20020a1709026ac600b00192cd8af358mr25925760plt.69.1673284429390; 
 Mon, 09 Jan 2023 09:13:49 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709026f1600b00192849e1d0asm6338616plk.116.2023.01.09.09.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:13:48 -0800 (PST)
Message-ID: <333cc631-ad8a-0efa-efc7-1132dd3ed0a0@linaro.org>
Date: Mon, 9 Jan 2023 09:13:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] hw/arm/musicpal: Remove unused dummy MemoryRegion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230109092617.80224-1-philmd@linaro.org>
 <20230109092617.80224-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109092617.80224-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3/kYxXclYOIr

On 1/9/23 01:26, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/musicpal.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
