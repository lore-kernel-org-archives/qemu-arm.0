Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1334598njn;
        Sun, 12 Jan 2025 09:24:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHm22ZhBrNVBy+BZMVWIjxF5/clKKEzqBUCPkBb7NpbZM9QHn3jkLcH1DFntPRrpoQAN4MU5+rxTC7RA==@linaro.org
X-Google-Smtp-Source: AGHT+IGP/1jRR8/jVPadvAspW9uLnL/D7WaaYn7QxqJtolJO8jU1QkTot7MeNbv3/OOJs43p3U2L
X-Received: by 2002:ad4:5ccd:0:b0:6da:dc79:a3d2 with SMTP id 6a1803df08f44-6df9b1cf4cdmr304176546d6.5.1736702697224;
        Sun, 12 Jan 2025 09:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736702697; cv=none;
        d=google.com; s=arc-20240605;
        b=YTQ7G38dspB3ChZIb55C0hhmfNP7WBfbLGvafr/R4GA5CHdZhqO2zWqJNsuWxlde4B
         Y0vtPAnOYe7AJJYp5ccy3vYwADfYAht3xeqUi+4yOJsVI+HB95ptxYrqeDCITvK5k2lJ
         tWfMbR8DMD1t6W1koVBikbPy4+CfpJyLehCGUXSdIMbTI5Say0mrgUbswq8ovHspm8t3
         xnTjNN0hX+bb3gFAoVKoIu4XdhSErEw0Y8XzkUdqqQ7Fnri7AYIThBNgrT/cpN6QUxme
         Le6dXoGR8kKowAsE3hv4D7H8ve78DQdGi0JhpMGO83JK9a2b0sGZ4aN2qZHs3/LO7yi7
         SPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LVYVb1bxDW+nR29j3HrlxxRk6/o2MQ6s22PJWedoSD0=;
        fh=6ZGSPgxcCueKO2ImfhxiWqnAhYOnkfr5OcXn1SHp2tY=;
        b=Jk6fQDgd4TxygccQEjcUseINxJtcSrdEBFNuR2/K05Lb+dTVdSusVu3MLF9dVHwxGs
         w7dNwSzY7eHQW/8JhNVZnw5eTZ64+kKVrgSyVa4mkzFutjBZ4WL5qxslF4p0WuZccdMH
         Vhldi53NW6h3vV6fKRRFlJhrxszSlEpholkFFPJAB2WavIoXNOPboz/tn6wCNt7Y5ig+
         x/kFIsLNs3OM7OAEhd9wFCZQIC5GjPo9DpSUL5oqCtHjHhQrr6rJfr1tYPGa5hJp+Qaw
         E2CqhorbSxXdRTl+TIvD1Z2M5xTa5jFPOZ5X7YpNe2gx47dC8R+RsNtxTygsIlnlpkQK
         zmEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsX5EGq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfad9d43d1si73382056d6.143.2025.01.12.09.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 09:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsX5EGq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX1gx-0005vf-07; Sun, 12 Jan 2025 12:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX1gu-0005u6-Go
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 12:24:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX1gs-0007JS-3L
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 12:24:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so25399805e9.0
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 09:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736702636; x=1737307436; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LVYVb1bxDW+nR29j3HrlxxRk6/o2MQ6s22PJWedoSD0=;
 b=xsX5EGq9IQVTaFrCZu/2aP5D1YcL1W3JGYkqbfZM8XT8+sF25zz62WTvbKSoRyuDa6
 pIWghhTUvSBt14ZA/P9NKYS67DelHbhJE1iyEhwmcZnZ96mHdOIK+6B3L5dsYzXHyfFH
 fVHxnE284psGk8cL2ZAk+7yh8iTfl2kRbNMUT/BzGcMyTwrqIc5Ptf76HN6eig5qM+Cq
 9C6T6RZxoyMu4ORxHWAw2jC8PloAdwGLs6bvJwCMA1/T3nDskgeO8u9EjExpoHNvgIdv
 N8Xe0xx+d08e3/mcuQVlOTwdlv1D1ifsW/4O3ndXhnjteeGt6o+5gnGyxtn4L62WmzU2
 8jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736702636; x=1737307436;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LVYVb1bxDW+nR29j3HrlxxRk6/o2MQ6s22PJWedoSD0=;
 b=MHzVzWkguqAu0ZTO6T/jG4TglIUbSyM5n8YkO9EbJP4Nlk1ahWUZIjcfrmYRFhIlV2
 iKsnI0zlUYX+Xkh0q3+8468VP5LeBziGCt1eCBZEm0O4ES7hBbp5vglTlHahiHMLpxkY
 oIFLAys1BtFFg2K55dq/LRXvoGQFtutx5pWal9YbhAJad696Z+wUaDX7F/JWSJK3zpvz
 G2QF/Sq7cpmOyjxKyHQUj2Q2p+LEgAVQZJDoEPLmYzK8cVxFEMgP6VfeG9GIXGQa4tzu
 x+ePkXfGbe1tFQSz9lHr+VgDcQ3XHqZlJRIPWf4ufIJygeU6CcwKyroJJNRH/KtRa3c7
 5oaQ==
X-Gm-Message-State: AOJu0YzvOZ23PNokrao7TE4b2Ggco0xm07plqMua/VI9nL7q7jj28E5J
 G6veqRskwVdmHKV7c5BIuBMO/E0vXlE94/Ba6YNOIU/xXkcvj6CqOrOuK7bXO1g=
X-Gm-Gg: ASbGncsm7t6/XuQrNOFfpCvPD0k254ZOGJGOgeyUTRS6leNpmL3SrYB8CnGtm7MLjtN
 gZ2GIlIMw22vf3caHsGvodhAF0ajVNlz/pV7fwfBG6kmzAuJR7TW94MrjUF4sjzke7XleO2fQLs
 btKvhp05Ek3Ahd/8CKVVGOH+Ffc4PZTinCZmjzZOmKsbLKOruoZrmiI2OcQqnzI/iXaayZ0BuHN
 vasC2y/xnNaID4ZXXGhk5djwM/xoxhRMRhrKwzecoZmBCJUF7LHqOUnpe0OgZUTVp+KG/5ymNIk
 UF2vBGV0cvHQ03gl+nd24yWI
X-Received: by 2002:a05:600c:198c:b0:435:306:e5dd with SMTP id
 5b1f17b1804b1-436e26f47e0mr143622835e9.22.1736702636043; 
 Sun, 12 Jan 2025 09:23:56 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da6336sm152122675e9.8.2025.01.12.09.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jan 2025 09:23:55 -0800 (PST)
Message-ID: <f2d4847e-0711-409a-898d-f1fe4977e977@linaro.org>
Date: Sun, 12 Jan 2025 18:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] hw: More QDev cleanups
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
References: <20240216110313.17039-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: k2A55vPEAD8g

On 16/2/24 12:02, Philippe Mathieu-Daudé wrote:
> Various QDev cleanups extracted to my "enforce QDev API" branch.
> - When available, instead of plain QOM, use QDev API equivalent
> - Add missing QOM parentship for some obj created with qdev_*new()
> - Prefer object_initialize_child() over object_initialize()
> 
> Philippe Mathieu-Daudé (21):

>    hw: Replace DEVICE(object_new) -> qdev_new()
>    target: Replace DEVICE(object_new) -> qdev_new()

>    hw/usb: Inline usb_try_new()
>    hw/usb: Inline usb_new()

>    hw/net/can/versal: Prefer object_initialize_child over
>      object_initialize

>    hw: Add QOM parentship relation with CPUs

Queuing reviewed patches.
