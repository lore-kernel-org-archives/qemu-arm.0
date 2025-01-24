Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp953458njk;
        Fri, 24 Jan 2025 09:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVETrhSlgvSmP+xSnWT5F1sTtEZfkCTem4IckBxsOkSs7EtGQwJBQetG6xw0Rt/mO9apA+ivtJgXuUnww==@linaro.org
X-Google-Smtp-Source: AGHT+IGcF8BsQwoZgRXrN1Vy33dixmS0KXv5AB6vj3UTogEw0sYs3/c8I+CCvwYeFdHUao02vZcZ
X-Received: by 2002:a05:620a:45a6:b0:7b7:68c:bcfb with SMTP id af79cd13be357-7be63249f32mr4391416585a.33.1737738541521;
        Fri, 24 Jan 2025 09:09:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738541; cv=none;
        d=google.com; s=arc-20240605;
        b=hEJNs0KwAHYxZzu+jqRlqNRhZNmvUyVN6EivxkkpC6aikQZvTAjjgDaUCB+8YxIISb
         WM1MR/RtZDv2WGyrd2dDUy6vwZ2Be1hGdgrGV2TbG83c8uHHa5rdW7XAlAyc2a6yIZkU
         Z7x0rRkbWz0rnUNXYBERz38YCnvGbZaF6cm5HWRX4okjL2c2gxdb1N0iaaua9Onbp0WQ
         l3nVjYmWWE0QafDG6AojWQsp8CrMzgpGKfHFFCsSqQE1yKNpKH00AIPDZkkizpkCYZto
         13WKkDqr+aHFqe0sRUkxFjBPT5T6snLn1DuecPQX9PboC1FowiYmmm1WxxmmnKtpbfdk
         AD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tj/NAv0Ynf2AulVqLQQFTDULGRVSFIkbpyRGfXdGZ4M=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=T0hUjYsw8STVtt8GTnOoZ25pCtEP5s/pdsc3PfYQTHoI1csx1eyXcHSsnXb2+eocfI
         0wKOW0f+SSwb5ja1VEUDLpgj/wTR8heX1br/MC1v/MAZk62ia0uQ+JUytDyVF7gKQsTH
         NffICJPuwHOwPPVObDpHwv2buk56qAKa5ywGCBRhl23dV9qbw8YoAiFFoXSPAu6qZslc
         rtU+TKZ7fN2QVQ6rRpUwz31YbkKG23Mx36tgxQgIHejGBY4O23aebor5U1ZEvOewYi38
         vjZhtBMytBOmc6iDJmTlCDLV0GhedKeLIpZ80UNYtQrmQxvpYz/SnHI1IOn3Yo6cAUJH
         0Uag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BHBKWbxY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b87e5bsi31194321cf.401.2025.01.24.09.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BHBKWbxY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNAp-0000gS-N5; Fri, 24 Jan 2025 12:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNAo-0000fx-U9
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:08:50 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNAn-0005LX-DC
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:08:50 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2165cb60719so42360025ad.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738528; x=1738343328; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tj/NAv0Ynf2AulVqLQQFTDULGRVSFIkbpyRGfXdGZ4M=;
 b=BHBKWbxYvP5rGxSRV540quJs2nBrqzoOrnJEGv2eRjXQOOT+TANZmsO+D0X0hpVHYo
 3Y0QdjIz81HIz+bar01ELIn9CjxOyKnAeakZcGvXQx9P3hg4jBGOuErfvVi37NNIKMOk
 LWHxPeM6bz6ujXMMtno//CpIn/l0ER+SAdkURYX5gYvTDny+zvvJ0NKAnNRm1Xx4mYqG
 OBO4SNWjtNLzES2TIj2E1yG4JbX9x0Sr8zE28+f2Ie+iVUysrbvDlON1i56DgoNrHCcS
 duvEy02W95WbKF8W8uOSrIuX9x75676y1BvKxrNFy0dX7ivhxjWQ000eecAK77RuIh+x
 jLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738528; x=1738343328;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tj/NAv0Ynf2AulVqLQQFTDULGRVSFIkbpyRGfXdGZ4M=;
 b=ZMjK+Il7KHDJ73O0BPFFjZo1On4ko+vAwMbeZmfu6+vkpxREOo/hjSEKGxEMFMa1/N
 pOHAe3ROdEmI65W9xq2FiJtcGR3IeTl1VNHoR1l1l7TEWjz+7Et0fAUwTV4sU/D91Div
 diqQiPXxuph0HtFfW27ceHdvSTUqTub0jm+hdc+dtwQfCnASiDoJItZIadAW87u5kwvJ
 Cb4Eu4jaZ/LtGfZLNfkfM2zmgNyPgN5zocXAD4CNYZ6dG8n97pwa4Gad7/i6Iw2jpRi/
 GI+CMU6SX9ovLJzmd3KrfjF6u34E0HwE+rbJJq1sgDIBWppEgtNnCxAAGEyM71IUA56C
 9Cgw==
X-Gm-Message-State: AOJu0YznhOL8eK/PBpvqIzXN65M6w35qN8hwUco/It5f82cNO26HFr6L
 cI6GEBApOrL7SRjtdbQ+TO0ogIL+ZiVWJydS0PWY1/a8snwnAFBhbwgY3cA4jo1IGSODq5JNvvb
 2
X-Gm-Gg: ASbGnct7lh4uDQaoMeXxRe+QJbIhkQRY8zwhehjppOSniQ37qdxeV6jSSjhkAnpbETE
 3wE+rFvQ5/RqSimApCWA2dnYO4k10uBE/v0UTC26UlfFOMNDHJTZw284oixhcctcpaV1NNDkJVG
 /bwIaaxNk6CMx4TviuTQfnNy2Df/ebhJ2pWMclpj2gdB+PINbafmNzYUpbImUlKJcBgy/QAj1rV
 iRLULWR++AvjB2TeC4ZM9Av+DPm/+RGVkZ/OcnNyDnScmHYkhY1avj9UMKPEB7hmJPWZpdSHwbj
 zJ1NjyBJjhYesXdJ20kq149W
X-Received: by 2002:a05:6a00:be0:b0:72f:59d8:43ed with SMTP id
 d2e1a72fcca58-72f59d84743mr18054700b3a.14.1737738527933; 
 Fri, 24 Jan 2025 09:08:47 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a761144sm2173711b3a.101.2025.01.24.09.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:08:47 -0800 (PST)
Message-ID: <579fb936-8d4a-4967-8130-07ff28e529a0@linaro.org>
Date: Fri, 24 Jan 2025 09:08:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/28] target/hppa: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: mGIOehceT0Wg

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/hppa/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
