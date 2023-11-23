Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp319305ejj;
        Thu, 23 Nov 2023 03:34:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErYbxiXjD8hKJ0ZT7HoZ6JWkcVzOZSze8tiZjMEo66teKqPn+PyrM5akXpe72G2eyedI1v
X-Received: by 2002:ac8:5715:0:b0:403:abf5:6865 with SMTP id 21-20020ac85715000000b00403abf56865mr4151442qtw.18.1700739296152;
        Thu, 23 Nov 2023 03:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739296; cv=none;
        d=google.com; s=arc-20160816;
        b=lPfC1XYKfuoRiVptv0TCVD4tIgT794o1SJa4Q8Z4n+3Pelq7AvHcCYQDHp8QgyZCLs
         GFfsNR4ro4JvO5jW74EfrVnNvZXTIuWF0sHZCSKgFndLejLlYVHtxEV1RzqFhpsq5rfp
         Q2HgDgFs4MbPEHDaHF25PHY5z5BPYOalPSX4YMR2if3MNklXFY0KZB8nbHbJSGH5OfdS
         NLsLZ6mPJEQ9c1c484+/EkozUlIa1Kl0DxVgu6A2g0dXccebnBEN9E5JZiG+Dq7Pr3XD
         imBulF726jU7hC6mWVS/7BLVJM1zogeAOjrct0YKt1MQqEDeBw0zeg+P+bzkshldDdw/
         6xSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LBQwTucn6ca5B6tUSsX2IIaRn5LWVeg0GAAl0vJkUCk=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=cpaJFBpGCf1NDn3EiEJB6ZJK0KOUc9K9+OSzVD4GZVHTJKO3UaLwr5zXAMeNNolfMM
         uLXHskYYwXL7zxVm155dSus/u4Y57SFOQv7bkS1vvBxxyaIro88tQBWTxsq8cTOMe82b
         zaw1sW/963oQAf1zFSvUHpFyVXi1chS9Z04oFZeErlfF1vELN0dh85ioCqgjwYTdgAEr
         FZlBoITs77l8USPyhvWDq4FDbHPtNSbnGobPqu8mHWLxy4lvBSUZLQrYDu1eBIjbIZ+K
         VuWsMzBMp38dbhFNtnznM0Lxi9bEQYrg5bz7ziOtMt5lMpS3zX4FXJvXUnv/4JjdE8QH
         LiWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fHOK5TXh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020ac87f0e000000b00418162e6a6asi943005qtk.789.2023.11.23.03.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fHOK5TXh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r67yj-00028j-U0; Thu, 23 Nov 2023 06:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67yh-00028O-T8
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:34:39 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67yg-00025K-Bs
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:34:39 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507a62d4788so1064766e87.0
 for <qemu-devel@nongnu.org>; Thu, 23 Nov 2023 03:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739276; x=1701344076; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LBQwTucn6ca5B6tUSsX2IIaRn5LWVeg0GAAl0vJkUCk=;
 b=fHOK5TXhgVyYvt7W60mRSB/u07zzXp85w5z0qSrIopuQNApyWEfL6eNy1NneKxCezM
 avL2Raqz0T6K6PH081w4fwkq696LbuIiXnQo5KysDbNiHH1YnYRGUpXaMB2gZjl8lS8U
 hn3v+IZsLJtlwBc/kLYgTH6m0zfzNlWEFpTdSIoH9RT3pmEISQ7UFa3rqN0lui9lntYx
 5I0UEl27yQGpzS7yt+eYFqjPcCKHnN3WzabCAMygL2sZAkJ/z5Rq0196VTGCLDyTFLCe
 dTJ1uVDlk8FLb2Uw3jZTR9Vq9In3DnCnUL8Au3qbM4j7bU1Ag2hWtb1XAEsm31eBdvrk
 s1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739276; x=1701344076;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LBQwTucn6ca5B6tUSsX2IIaRn5LWVeg0GAAl0vJkUCk=;
 b=FLrTvw+CsnTYq3b9iUqAPBnArJ3fZcXXBgRZzHrFNf4fSIw2ivP1VzZENrOuOOPs0T
 wZ8dFPTHIEmXHQNBBEXlgD/q5LORO3Y4phKchVzGiS8SbjOJTI1fwc/oASqeIP3zFPnU
 CDawp6F+1yCeKtcf9PXCK06rTdI36HO9wWI0IIEz9vq5j8/p7QT47brb7VXpiXudXbKW
 A6HVOcWnCVb4dkNLX30uPbW9kjuUziPbRzpI7ODiuy0+282qlDVOtBc3jZLPz3vjEVVN
 bwraStrpkWtORhe5E3U4yHWC0ntPDkx/c1cc87ijhoK16mF2Vp7OgvL08Y7AsO0B39yn
 DMIA==
X-Gm-Message-State: AOJu0YwW00fvNldyCKRJ14/HgWGOwY8DvVD0vpmMfPt4x8lhoCbjETzh
 S6ShPxSdJa7iBt0xTCvXKcrjjA==
X-Received: by 2002:a05:6512:280d:b0:509:4533:ddf2 with SMTP id
 cf13-20020a056512280d00b005094533ddf2mr4607857lfb.11.1700739276413; 
 Thu, 23 Nov 2023 03:34:36 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfdd89000000b00332dc82f70esm1408239wrl.102.2023.11.23.03.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:34:36 -0800 (PST)
Message-ID: <24a1d197-8c23-4a56-b400-ca0ff1cef44f@linaro.org>
Date: Thu, 23 Nov 2023 12:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/21] target/arm/kvm: Move kvm_arm_hw_debug_active and
 unexport
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Eb8qb62ZQiqM

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  8 --------
>   target/arm/kvm.c     | 11 +++++++++++
>   target/arm/kvm64.c   |  5 -----
>   3 files changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

