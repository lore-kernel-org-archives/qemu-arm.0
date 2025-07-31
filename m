Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDECEC87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:39:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhazg-0000sT-7H; Thu, 31 Jul 2025 17:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhamZ-0003dX-Qj
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:25:52 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhamY-0007OB-35
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:25:47 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76bd041c431so1116605b3a.2
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997144; x=1754601944; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B6UH//wo/VmgG639UCu7tCAm+lKhvQMnF3AqSS0GqJw=;
 b=FUcyLUz9OLb+W9IaVa6BiEsF4tj29K4WlhRZ0yvrd8JYSlNqkqAcamj72l3tlyAmoy
 S6+ivB8HMPMQNqf43ifkXTSV/I+QUPGvCcsrgsfXk82YiL4InGkugAE8YR+M6UXzVecs
 fycyYYTKOP8JUIVESOvbwJ/TcLov4CjoNHe1p0UDuXmvy66vjlun7H+BRJTOWOIZszmW
 IrgxDRSrTDaTa0aB1ZWlcMDE+jCtfHMNy//p8aqZ2AnfMrrelp0hbuMfQ8Ov6ZYw+Pb6
 12edby1JZal1dE0JrWY7s8zhSR+lcmsZASTnYhNR306rpVoD7rBT+6bErB/kJAloew8e
 g5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997144; x=1754601944;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B6UH//wo/VmgG639UCu7tCAm+lKhvQMnF3AqSS0GqJw=;
 b=OrBxOF+kNj3pQQGafghlMTjIcTrbr6qPuGTP7JF7WlVnDL0v0XDKzUud9V8N2wL92G
 WH7BGYbSVbMAb523H17PdSXr20jBlx2NxOpgGMKttHxEh1DanFxNnfb33LHImln5PgRV
 7bQHToTi32SiP8WTZAcH3BaGzsV/+OShdooWNc6SEuCrwQhzg69hye79PiMu6P+pyJBv
 R+j4Eeogl7+InTeWlrcX/nSRZBKGQiv6mUBuQWJU/18FHO7F91xjwwvpzNxO7pJL6RVr
 HZRyfmq+uUunpOKH9DcKwcIFLpJjt5CBdNJZ2g0ScOD7MBPyY8lD+D1RKv9evpORSHnx
 t6sA==
X-Gm-Message-State: AOJu0YwTasmH2vtUoz7/+ohL5nJF4hVNNPgveuoL9Gp+HBIyrCRsHK3B
 pejln/XZoki0GcWOf12J07rWv095DGSKG7vH6FukVhfLu+FFvOOKkwxWHKb436HD/y4=
X-Gm-Gg: ASbGnctARQNjIiM/CvNo1KGMIVfddcT7/qnPqnRjm7h68dcZcSmh7ZxUMu/i8HJI3Tk
 kiO5p/JnY9B6VMkayc2YKrhlARzWplpOeCl/wT/AfzP0L+17I5xBXkHfZbeaQ2DwMYrDUeITuHv
 q2OMRBK5RW7LmDFPwar6NPaL2JB+QqQqRYK0Latfxf2RDFHdPiQSwWkkecX1c2XMsI2q3xFCpBL
 zoxKaS7He+AVVrTyPcdWfLv42En4gPbyUk9p2j1eTwvH293VoGYURXUqR64p2CCkE01q9OXJwW+
 bgRZWCFqqDYtG1u8tcZLzQQozvvOAFlA2To24l5+/V5TTnTYoVlksS30YUSoZqQOJxtpIia/grj
 BjFeBKy4pc2o4VX84QCvWpNJEdJ8n3pXta5g=
X-Google-Smtp-Source: AGHT+IEV1PuA2YfOZeuOb/o100H+mE5COIC/w3S1vmViMkW29LubFHU48+11ZX8Dc8H/ejGqeZFIFQ==
X-Received: by 2002:a05:6a20:3ca8:b0:234:80f6:2b3a with SMTP id
 adf61e73a8af0-23dc0cf78ecmr14192540637.4.1753997144582; 
 Thu, 31 Jul 2025 14:25:44 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd7887522sm1214637b3a.20.2025.07.31.14.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:25:44 -0700 (PDT)
Message-ID: <17282aef-11f1-4815-8465-314f99c1d380@linaro.org>
Date: Thu, 31 Jul 2025 14:25:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 54/82] target/arm: Implement GCSSTR, GCSSTTR
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-55-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-55-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Note that CreateAccDescGCS() does not enable tagchecked,
> and Data Aborts from GCS instructions do not set iss.isv.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 42 ++++++++++++++++++++++++++++++++++
>   target/arm/tcg/a64.decode      |  3 +++
>   2 files changed, 45 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


