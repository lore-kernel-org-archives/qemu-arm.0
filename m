Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp890444eji;
        Mon, 18 Dec 2023 07:58:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWZ91edmA2C9MkPYdDvQFwgQ5zmzyorhepcWpjwWirOphnfstYXO4odXFuxJwXA1a0s0g3
X-Received: by 2002:ad4:5ca2:0:b0:67f:4833:2168 with SMTP id q2-20020ad45ca2000000b0067f48332168mr1976149qvh.32.1702915121663;
        Mon, 18 Dec 2023 07:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702915121; cv=none;
        d=google.com; s=arc-20160816;
        b=olc7+sZ1potrRri+0+SsMfmubEqYWlgeP7owY0LeBRewKg2xY73e8bR4gaMoIuuTbB
         UoVUr5j6l90isLLjrigR4kSgIMXjkN051F1DNOt314IhwCrHAtahf2ie/XoE1i/KwxAy
         snOR4FhpjoUk/R/hOeXnzu5iWDm3gL7ihI3r1HNlDCZj33gdRxsGDW9F5wQCHlyw2XUY
         xZgVHRDaqRXi4mo0JD5sdGh9qDhk6WKPiMepSstaNoVy98oWm5o4AYMXs7pglswSECNd
         nOfvRQjo2X0fKo5g6ZJ3J3v1K4cxceBGtGh7hgFz12ED4/UKEldd6DBZAFckbDozUECl
         UHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ziet/5GPRfY/4z7BJpvIceS9XR38XkHOYidZ9w/7C+o=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=NrZC3FqKRqh3HITyzWPIGcyg0SzSff3DR31zDISJdIMxrtWTvHpJcRvAlQBWV/+sHR
         +0lPlX2zZuVjg97VHPx066Ev2xWhwV4b2XriEZwJeZECrwMDwpMvefrBsDzl4xF73Mim
         u544UEk/QKw2sq6V7OIBLXbHu1ANqWsxWkAbj2SwKIoIInQsf+RjzUseZfTe/UCUaVWT
         qesE3OoqFxL7V2NPMfUL/sCvptE5jrlP4SIZMckEPQr8wQMfN84EJuOTaRXqV7QZgU8i
         s+L+cMk49UgxzAc0mRKH0B2HiDi7ZLjNu0TYmdX7lFhCtkyLclA0NjXgl7LDY15S/Ary
         OtGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zBpwtH8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020a0caa54000000b0067f310e6554si4433153qvb.313.2023.12.18.07.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:58:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zBpwtH8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFG0o-0004gB-Qx; Mon, 18 Dec 2023 10:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG0n-0004fE-2T
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:58:33 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG0l-0001f1-F1
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:58:32 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e23c620e8so2920727e87.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702915110; x=1703519910; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ziet/5GPRfY/4z7BJpvIceS9XR38XkHOYidZ9w/7C+o=;
 b=zBpwtH8TNF4Gka0acG7HREDl38YOX03jbhhQquoV9be8KS2YyuKr84FtQmp6+HiGId
 ZkcgP8N/816mjQBqBWFrJPw3gBdzXd9ay6w8wnnHAg/1frP3ENslbmuIC9Cvi8IE0VTI
 1gz3GAGf3/lw3L54YyQ7tFfbbdj+sTznhGprnc+7kU1tlIvi2fIpD8IowwSoldidNTAs
 vkMLOPEZvpR7cAd6fMcgPp7FFizKI0YrZ3e9bc1hrtZLRK+5+7ge0WoQ6p4R0LeJdgLH
 fkd7dDTH+OWUck4reYIVivKUtvNkrT8xx1JnT5M/W4c6ooe45diOj5Zh/Jr8TgLzlVRq
 JHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702915110; x=1703519910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ziet/5GPRfY/4z7BJpvIceS9XR38XkHOYidZ9w/7C+o=;
 b=dZebmWejJv1szJDXwhgKDoCUbPiNZaOBfqfCc8EG0s7F3xNC98vBrt6dogS01Zbk9C
 hsbhibLTwooE7DlijSvfx2sL06dOnBa1WJoqAUxMuHlIEQcOkCfuV7eirabvos0afXHn
 qe6OvIJzdgEEA5pwQ99jIsHw1R0tXlfWS6VvDQTlSlZjGvglRMD8FNykQUz2XodnXn5/
 xZqIJ3yIypqpThPW/TW+6FSB/ISehM2jSLaDbnhSvMl3dE9U+Ku5QYbD1muul49syX0P
 FvRpUeXl3CErHpAO2mNhlBZGJDoT0lfCj0wQTBeTOzvq38hUeGu7OZJm0dRRVd8BTFX1
 nbhA==
X-Gm-Message-State: AOJu0Yw48zXPbN/yRFukSVdwDwd7BzVy2xiVJVjZMvYX0zLCoeVoULB2
 gw5qF2+q34S8KXkO4kewKR7UKuxn8DANWJwRkrcKQw==
X-Received: by 2002:a05:6512:a94:b0:50e:34db:a601 with SMTP id
 m20-20020a0565120a9400b0050e34dba601mr1439405lfu.48.1702915109661; Mon, 18
 Dec 2023 07:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-2-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-2-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 15:58:18 +0000
Message-ID: <CAFEAcA-xQ44whk0BEjdMehmH6U=SSxOanKAJtsR6GAaFC2cVmQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/45] Split out common part of BCM283X classes
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Qglq9uYfVpyq

On Fri, 8 Dec 2023 at 02:32, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Pre setup for BCM2838 introduction
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
