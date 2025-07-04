Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1296833dyc;
        Fri, 4 Jul 2025 08:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVngdD7RWuabXYiMWzdHDPiMu+6GoqQq7JXOsbvLPH1HfQA025NAUooxQkUfJIFu3QFE7YsCSwtVp7Xpg==@linaro.org
X-Google-Smtp-Source: AGHT+IHZ6c8lk1uZ5OQgfJ6/GF++var6MBWu/75e/AXroxwOsllT+WxVG9UNelgNNvQ97E6+3/EP
X-Received: by 2002:a0c:f113:0:b0:702:cea8:c598 with SMTP id 6a1803df08f44-702cea8c5cdmr6494436d6.3.1751643519138;
        Fri, 04 Jul 2025 08:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751643519; cv=none;
        d=google.com; s=arc-20240605;
        b=R7hkQmwgru+j11U+WJvQ9qPbCk0OSycK1KhbUnaYswBkllUBi4BwYhcNuGRKuYHjX3
         ZoGJe2VPqj7v0O+oBwJj/iEgJEVeHGJeb8RW/Yc5hDBQHWzdi0NENWmj6cX/xb0+oYG9
         ER/+QRNFQ5FLr0fl1r9IDkUe2M1l6qkFmWY6qgNiK5w0bln35D2gG1hTsKYvW3trJrN0
         9Z2VoIBDFEUWVHb+OEgTmDTkqo5fSNlb+BPCKTrtemf1qnl4oij4SGiHv1tfPJtBy47d
         OxIJmlerXxDqchUYaHr46a17/ooe160Hsf168xVCDYMiO4bxNKsiXNnNlBXbo30LSqnS
         e8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=X+1qdRe8xdVibZVctag5le32T2XQilUjEKnUgN01u1I=;
        fh=zLvtcTKKIz5DGo6KzpTAPe4x+7LNCm1NxnrtbIaMFgo=;
        b=kIdpqX5rcRAQuJGAuYrXaJVssjDr5qpM3ZJmy8HPheSFLWTjeL0CsOzu7+9AHBma1Z
         t/K7VxxdWoLLtsiAPXZprMxOM3E7UOb/EbRkVzWN1eTl2v00CryZKDxF8jNYqbP2/CME
         CmoK63Lp4502sWNCeW1pC0uMJJsKRVGgRtmjO5DDE6PhJJN3LxjSkmBt1mFkU2B6KyaS
         sdz4kHPwPgXDSqecWW1isJiPaeXP0pW4SG8cKpJ91nxpc65ZU+1sUYn+LGz+ZmV1uJK6
         Vu0AzkTTUk/zcpLJbCSoPBvNXMSQd8ZcDsrbE3/dZISZOLzEBnnVOKUsYPhaPPw084Sw
         c8GQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VInX977I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4d56051si22273446d6.248.2025.07.04.08.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 08:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VInX977I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXiUY-0003Uz-Eu; Fri, 04 Jul 2025 11:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXiUU-0003Qw-SK
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:38:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXiUT-0006pq-8z
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:38:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-454b1d0a115so3508635e9.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751643496; x=1752248296; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X+1qdRe8xdVibZVctag5le32T2XQilUjEKnUgN01u1I=;
 b=VInX977Ixg4a8vRbMrhE7rHRCRuG4DYxki8KBXunzoWcxOjjcMKYCe5pPZDLx3dGba
 a3I+w63cc1vQFNR9spo9GMMZqe4vm98DTZHioZR+GM17HA6iTruWXT/evXXBjgBD2hZF
 ioPwudX29oab268fwOMFHwxUvwIrhf4kKm9+lo7r4cGqsVoAOmUYk4AOUJjLpqFjuxu2
 4rvDQNRUQM7MGJmA2yIbltntejx9ilNwkPCZ/UkGPsX6RVMlYivISaq/uRPkFvYiLb4n
 WK4tyc65aWH6QufX3kzYytiF0P3iFHG5n5D2fzvGphHhbfR0zIEKmBlHJk1bsipNJdu9
 zTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751643496; x=1752248296;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X+1qdRe8xdVibZVctag5le32T2XQilUjEKnUgN01u1I=;
 b=B2yRkQZaiNoaqvy1E/aXbouewf09FQ1VjiXd+U/oIKuftlfcRq0KiCI214G2yY/zG6
 mfAZbrwD9nKKq2WLVWFE6ySMSlgfamE6mOpckDMwWdPowAXO1+7KvUlZzuJvLjegGKNc
 avKRGmy2Ke7gg7psRQL2g8zKR4Bm20E0fWdUCafi9ps286QB0BGAMlB5EkthBeZl+kS+
 6ZcJddQhY+buPnxGng+6DhwYoxo4qJEbWB7xJyEdgm/+6cqJ5tgdWNScYnYJ/2b69Spq
 eOX2TIrlP4tF9wvR/MlflkpTVXpLM9b0xgTZ+5GSq09jn+v+UVaRYKOthVhCU5ZGKBT3
 i+uQ==
X-Gm-Message-State: AOJu0YxHKMUFnase/fdbN+n1qN5AUBarNrlflD8kL7cuikGmZ7NUuHau
 XXf/CcLL9ErIFbC2Iii5TbSKKBtdU8NkpU/wSPPBe4RUF6TP3jL/YsiNDUn3apFR4XA=
X-Gm-Gg: ASbGnctQtuwJTw2Jzr1F/vnxb8Vce4DmfwGV3/t/cIvHx8DnoATa2zfgB1QewrU+AGn
 J6xj323SL2m9r99MZgvg0Xjat6o90UEnnxtHfw/IqpV5i3jpzhj/KjHUFJqAkJu2ADQZEd+9yCD
 r6CH7FxMJzO+TuXWldq9YG+elZRnRxRa6jDzv6iOjiFvd7PcJpdDyDyJvIpCdu2jFtNQH5HioP2
 yvdC6YUJyn0dXxZ7MH4MAKpC0GZeonXcZHVZYUgTb1ym4rGD8LP97c+5UjOFCNHPvKYPJQW2W5E
 EzZUJ9jv8Pd5ftjMppzob5VyrWZ1SwtQLVaA6jMfg6jU99nBeOSo2WU1jGvbTLVuYGgp8tgUIcX
 KK7OKvUeJWueEsK2OcUkASJNKm6DHV0/kCio=
X-Received: by 2002:a05:600c:8595:b0:43d:82c:2b11 with SMTP id
 5b1f17b1804b1-454b5110eb1mr19523955e9.23.1751643495625; 
 Fri, 04 Jul 2025 08:38:15 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1687488sm29576705e9.25.2025.07.04.08.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 08:38:15 -0700 (PDT)
Message-ID: <05f558c0-9047-496d-9d47-b66d02d7b8fe@linaro.org>
Date: Fri, 4 Jul 2025 17:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm/cpu: store id_aa64afr{0,1} into the idregs array
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
 <20250704141927.38963-3-cohuck@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250704141927.38963-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: V0+BpmbIRHPT

On 4/7/25 16:19, Cornelia Huck wrote:
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/cpu-sysregs.h.inc |  2 ++
>   target/arm/cpu.h             |  2 --
>   target/arm/helper.c          |  4 ++--
>   target/arm/tcg/cpu64.c       | 16 ++++++++--------
>   4 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

