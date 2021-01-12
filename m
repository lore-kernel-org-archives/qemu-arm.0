Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3091124lfq;
        Mon, 11 Jan 2021 16:07:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN02P82JTu53i+nwHywZOfC4t2monjhTRp+XDd+hNjKzqM9nt31DLS0f/9rm2m0sp8acWk
X-Received: by 2002:a25:6e46:: with SMTP id j67mr3067589ybc.443.1610410056208;
        Mon, 11 Jan 2021 16:07:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610410056; cv=none;
        d=google.com; s=arc-20160816;
        b=PG02CSsT0HsjONMAPM/frXk74iMBqxH5EGWx0gT1OgIsCFkERkZdqRoGv71c6S6R+l
         FGJjusvyAaOYzfFERlafhA2ip3YLeJZWF7hC1xk7cZYQTSCrUSQNk43vqFI//mi+ixrx
         aRZ2uwbunAgTAYA5FFEJgBJUG/6Z8TNRaQpLPciEejMtz7Jo9lWCKWPBQ0e4klwND+WA
         CIZOVQVWbk0lZesRBA/8ZMOWtvVxlsmcDOAfEiqh/vTdOOExZAdPntZ+wO/cbtJUrs6z
         Rrqena9dDscyAV6lv/308qTJ8LVZMFgsM/MfJ4g/dHavhVeV+ifb/Z38ufqcTYU31rX5
         fwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=n5FZap7gAE9g9CaJLrmxs5NNKN4tivOtO8uV3BqCazA=;
        b=MEWOo9J6/XP9jS06Ll65/xPjjhqkgdozfK+XsBZZsH0dLBTwosH5Ep7YEhgGCWAq/k
         SPof/NJcbGu7a1qiqOZ3YVg87eS3sKwRPDcYyogMjZxoph7xaRgOJKgwDC+somcQIFjh
         xJ7mT74c6B+FL43an2tUnmGQYtLlRWths+sJgXN/Inw3R4lOP9jK/8egYVPUdtKpAdX9
         Wz2lnm8IWQrPfppGRNrWbZm9q9/lM9m/tr/nwlnM6mLIDfqbEogI1dxPWhwB3fikoIkx
         M/BbUA77Ra+oavPhWkAigZDxY9QmsazRblxHyXfp7fhDn2bpsnPGshg/apCmb4q+syiF
         9qIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oUDSGYbq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si1329734ybm.261.2021.01.11.16.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 16:07:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oUDSGYbq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz7Dj-0005nZ-Kj
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 19:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Cn-0005iG-62
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:06:37 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Cl-0004U7-Jx
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:06:36 -0500
Received: by mail-pg1-x536.google.com with SMTP id 15so228881pgx.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n5FZap7gAE9g9CaJLrmxs5NNKN4tivOtO8uV3BqCazA=;
 b=oUDSGYbqwvbd/AGuVhBI5b9EHnBFmXCLv/Zm9FcJqO9sF9enE1f4kQXEM5YhlWeaHL
 pRku1S/YZGTPwgB8PiyRoJ2aCNavkAaexP0Ft9nXn//bYNl6mDMB5F9WXu1IA1c6lQK/
 /8Kq9hoTiC6Umt5Qicgz4c5k8nM2j3MwhRGi7JIm6l7MhjTeRk0UUrmd8EBVNAccpqp5
 hbcey7p1yEBRxPhsIoTdJ3y/yRJbsufPq3eNEhkK2ndsOJEGRx3r/TWEC+7VHwG5S1L/
 0cPtLL1onsUgtxxWpgwpMlUk1u4HPnP+lB62gZaryx2FvQ0wHgquH32QBTnX5Avw/qZ6
 N+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n5FZap7gAE9g9CaJLrmxs5NNKN4tivOtO8uV3BqCazA=;
 b=MpuJTF9Ord3qH4BeGX+LNeNkcULUZtBOHsVmiEUGUJeTUeSNukLZHYZ5EWSEOpaOlI
 Ui9bbouWW6lomY52F/t6DB9p3eiblhs8Re42oCzRIQt6fJq8C2hYGeQl3bNw8tOVjhtv
 FpKedhFUkUl+jf/kHMYbEaqEXxnq1uIuxWtwnfLerkZj/YZ6lsmRpWANiu78k5+7TFlW
 bEAlR2AQeU3CiThAJVtvTKwRCrmn1JdQ0suYCRiBZgQwq62obXXslQoZbASe3d097R9+
 GvtD3HwjdfH4wOfG3dANEKdpVfJdNeHc+owRx+Ue+iECzg7MoxWmaLHv1IudQmlWW72P
 D5mg==
X-Gm-Message-State: AOAM533a/7SP/Vypbxp/ASrs+ELNJu9wtqzmYNopSIARbLiV8lUONzNI
 3Zo8DR3cdd0HLYCI7YslCPeWvlm/sF30tg==
X-Received: by 2002:a63:1c1d:: with SMTP id c29mr1953624pgc.94.1610409993979; 
 Mon, 11 Jan 2021 16:06:33 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 22sm603390pjw.19.2021.01.11.16.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:06:33 -0800 (PST)
Subject: Re: [PATCH 12/18] target/arm: translate NS bit in page-walks
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-12-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2c3a883-145d-0d82-f644-33b3d63e5ef0@linaro.org>
Date: Mon, 11 Jan 2021 14:06:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-12-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5chqCjusn1hG

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
