Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6708174lfg;
        Thu, 4 Mar 2021 16:31:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3cZ3QyAvkFsqnrhvUxLpwcn6haj/IcqxJVFYFNJdSXzZsvA+oaalbP6qNPIDepXuoirz+
X-Received: by 2002:a02:9083:: with SMTP id x3mr6797966jaf.17.1614904308538;
        Thu, 04 Mar 2021 16:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614904308; cv=none;
        d=google.com; s=arc-20160816;
        b=a02OiA7v/kSRq9Q42rbx47AX9jI+qw9Gyj+LiwxA5RCKd/FK5Hs3aa66n6HjENf259
         WtFHIgkcy6T49O+YBVF2wCP+kWwnl0mgquFDBNBQHiOpHiVh1HGVafu6AjiNgiIt+usu
         5UCHfMA/rJzPGm/7Ivy4V4J+N225LuEZvGm6baW6+aLsf3as6Ajal6j4bTviygrID5wP
         QAjx3UimHa19l3OTT4DJf6QAEpucrWPnK54gG2iDZ0l6rPPuYt1DxEc/8VVtc/Zl86Z4
         VT3tqYFz4h8S2V1nmL7cKSaBayAXDtkXu4Gdh9IlOGfP3yBXYHKbPdJtgWkLSApljwp6
         7nJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bvFd1Gr4Aj4ifwWA4NAWtAWhHdlgxfrBMugrvvOzp7c=;
        b=qIO7a/u+iNn3hYp0jDSu9kc/qGiZGA8oLxO0Olqhx73EDLsI7S692e2Dts/3ZC9gQI
         GgP//hGqVb3IyFz7R85airXF4jAbMDF0PxO6I8mJKnokDqOQRuqxUh4zJwWdDNJgVveS
         VfF0HIRRk8mzQ+PNGTSFMBSiID+aVxakQ3m23mXyiayR9V4KIo587DU7lKljL16TWBwe
         YCjhVcjRde7tH2xGhdw+85u++222E0RQaWGguX8M/RIYu10CLKoDfrKQxVAUTCEvgJda
         2brIhKb19lZv/FZvG6B9ZDwPC+QTexVm0bjtKu2qUqrc0sl5VNX256bQI1dqaN6QO49z
         v7bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pPnHDGVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si855045ilv.10.2021.03.04.16.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 16:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pPnHDGVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHyNf-00034z-Qj
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 19:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyN4-00034j-6E
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 19:31:10 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyN1-0001TC-NG
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 19:31:09 -0500
Received: by mail-pg1-x52b.google.com with SMTP id a4so147787pgc.11
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 16:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bvFd1Gr4Aj4ifwWA4NAWtAWhHdlgxfrBMugrvvOzp7c=;
 b=pPnHDGVFhZJ3hLoxT31ISzUoCwSgA+gvP7GdOtEmJCxDjLHjyYsaceuq6upPP5ME6r
 pkraGldvwdh8vhDhslDZ8m6Hfzpxl1e2oiBnQPe2rpDQ36q75asw6o5dXc35woQVTdtR
 o92o8Bcz9ch750W4DSTAOL7xEUJ3UBWFUR/EfoekPILc2EvXhXrXe2ssxQVWD5AyHEje
 seUxn57TwnZ7/vNh6kfGQ03dH/fpDDDeoTwyibS4dxXvuH/Z9YBd7HEDXoUssLXRsc7M
 SPUV7xOxdV86AUmH2NH/TikEHQRlGk2jTePFhhwFNNbBEoMbjPtbrI1fPRtf/xB+f3V3
 fQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bvFd1Gr4Aj4ifwWA4NAWtAWhHdlgxfrBMugrvvOzp7c=;
 b=uAvfEQVf2c0LIxtA6JyaFHshV2PXc0nP6tdMapVR4Jdtk6BtNZcIbSwdTWA/4JONmm
 mbzSCwkUzLz2eNlHmxYQqdh5qmFjlq6jufmCLJeiLnFT+Ki6qN5uKqCii0QzqstZQl6T
 RPxZfDDbWRgmyzc1yWXXBVh1C5cDfY+PXKz5FBGPnLV6ZapPzN6SO8uZYD/K/6QK6VBr
 coKYEblQtMNNP3pj+4rTrVUmpt0HMU4gOlVcoWBwQ+gUeIoLrsZBv6VpumAL17HCVBZT
 BdMRyuhDPSY0VJ+XmF9/1jy1iK/bIvTz8ypoVbgcPzcugDIjQ/lbpXXewqJ0Fv7EyB+k
 oqRA==
X-Gm-Message-State: AOAM5336JEvYIvqvaD1RIVZN7EMDquCv5hDRN1ucbq8wyZuXTvenkeIZ
 6N3asb11FoDRSJEu3gXOxocKIw==
X-Received: by 2002:a62:683:0:b029:1ec:c88c:8ea2 with SMTP id
 125-20020a6206830000b02901ecc88c8ea2mr6284641pfg.27.1614904263219; 
 Thu, 04 Mar 2021 16:31:03 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b14sm383659pji.14.2021.03.04.16.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 16:31:02 -0800 (PST)
Subject: Re: [PATCH 39/44] hw/misc/mps2-scc: Implement changes for AN547
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a78bced8-2dff-49ae-1a4f-3d1b0bdeadbf@linaro.org>
Date: Thu, 4 Mar 2021 16:30:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E2ccHPj6Dp48

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Implement the minor changes required to the SCC block for AN547 images:
>   * CFG2 and CFG5 exist (like AN524)
>   * CFG3 is reserved (like AN524)
>   * CFG0 bit 1 is CPU_WAIT; we don't implement it, but note this
>     in the TODO comment
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
