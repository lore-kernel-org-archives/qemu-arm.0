Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp313750njb;
        Thu, 5 Dec 2024 09:56:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1Qkrc4GS99ApXVv6TYkipMme1oxHGk5cU0FC0JXoYCGhUwi/NCdutkeczw2t+81Tn3madImmDL/OVjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHGocaySmfzFVPffNYLtjIFLmoeGF5rT2Te2lALPct2EfpH69MMEyYXfQICP3kZuNb4rIbg
X-Received: by 2002:a05:622a:4ccf:b0:466:a9c2:640 with SMTP id d75a77b69052e-46734ef275bmr846911cf.44.1733421372405;
        Thu, 05 Dec 2024 09:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733421372; cv=none;
        d=google.com; s=arc-20240605;
        b=E9f4E8sl0bWmYv88ajXDZjZo8vQloI1xgXbc9HzCmcjAsNycH18pRQYCXpaNhVuNl3
         jWmihrUtuQp3q3wMwwgyY7SvoYnkY3AEI3rHBnyGl046qKgEy6KTXgE4Wn6smq/BMJe9
         c5Xz7iOkKk/XKy17jhyMzS4M/Y6oO+hAgkevekVztCpiMb5vHtTTG040ybwPiFV7+nQv
         24u5V8xCFIJwR2w+jRgmhlGOPCW8GWAfcDBy/JQH+BKZ/UbF/vPf427ZZroWIG1ujOo2
         eE76TbKvrlT2UL8noAAo9WnOcF00xJoBJQnu0tKqLNTLjLN8bUKbCF5b1byLDrgWmPc+
         gVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9oEAsEbXO75Ds842USNMvm28B86C6j12K/EPM9t9A1A=;
        fh=hcZxlkiZDnNW2SXrzbf2EbCw7rOGODnqTMIyjKEqBaY=;
        b=Zi6yq3RiBPKRNSW4XcEyWs4R/RgrNoTfFem6OOQvg5mXKPjWTNpw1HCuH2TM5/zmo2
         NZnp9vURloAnKWJGywHeZTqszzHkx6wrQn6a+3+Fpthw02hgYsbyxVFojCysOYqAM4Qj
         boIfZKwbLLnGIc0MRDb4q9gRVwh9oPpQXJl7uRZ4c3fvf8AwL+Zu9HB9jFG6T4q4jvM9
         /jGDfp4pMfVXD6z7/EiPmvhuZ23cZMbBywbvK6auQjMIN01YnyJ1YJ23OKImo7/nVpMO
         DyEGMIyMd5Os4S74JjNx7fCvjm4qSr+P8ZufbFGV5brKj+LJUH1UfmS6u5mQKJU0KoWO
         ix9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sKZ8tVYs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296e917asi21724221cf.169.2024.12.05.09.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 09:56:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sKZ8tVYs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJG4w-00051V-GS; Thu, 05 Dec 2024 12:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJG4v-00051F-2l
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:55:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJG4t-00041R-J8
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:55:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385d6e36de7so1121588f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 09:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733421350; x=1734026150; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9oEAsEbXO75Ds842USNMvm28B86C6j12K/EPM9t9A1A=;
 b=sKZ8tVYsQT44c7cGHJuPn2YIt8zjWQgeHnGBg0unfQ5imF0/seU443eo9YWXtTe8ya
 xLra8B81HqvU7iTeM4PiR8O42N7WtriGPzeLck+j+GzqUkDerk7kosi3i0NYERf5eYnz
 CzpyDkW9Xsf4wwVdeKg7gTkVWYqbqvFmprH2vuzDNewHb06YLj6R94fRDYb5NlM7vNc0
 R7A1P39rKA0aNMfyK3GZ4W374iYNL4W4AvZBnhwlLGUlTZFb/LuOoDMM2GYXuIVdKUQ4
 W4iVJVQ1/GDYG+450ql6BawZqNrtbycZojQLzkFOJyU2Amz9WxWQv799xsPYcSRHKEUG
 ChfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733421350; x=1734026150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9oEAsEbXO75Ds842USNMvm28B86C6j12K/EPM9t9A1A=;
 b=oTyFK2zjcF4546LgPb/JSouCPI9Vkv/Cq8kByrADdFAFoWbdX2pPQLz8dSaphEssgd
 JLl0hulpWhPPekLuDm2h0L2klvvx+Kkg6Oj8Xlv6U7ehKOkoxEzHVLMXyUVh6xKy8C0P
 Z21kWeMkiIo6Gzu1IroB0UBVJ20lDpUpJ3cmrHjrMQNgvRDXk5/CkYrbJfxfVvzIM3ZI
 P74DVfh3IE65/o2neEVFgYhYWT6n9OxBe78DQrBsY/sPqyJNrG3W2NTJqQQwib72RPaW
 R9NnT/56f/OLfa4lGVw1xH4vBvtqqnzlTPua1D6i/8yw24sTBFHi4tqV0lQdAKQx9dEW
 ej/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFrY9RCreY5N28bRft4NwOPX+5RayYWNYeIL+oknPaPZKz7mHIOyPm7gmgyMa4ZHpawLnUV8ap/Q==@nongnu.org
X-Gm-Message-State: AOJu0YyR2s/iLlLRYzYmEfb9+aPLOb8/QgJjXt8AoAdvHexx4yUhFhhm
 suQk+y8vHeUwwU6F5qtPzLfbpQ8fzW+5KQj2Qf08MAoOCVj79dKWq9yklh+OyJOi2jCJhaPc+zJ
 OYW/NIF7B7P9rpWJYYCANrYKinVz0gwQRIqCv+A==
X-Gm-Gg: ASbGncuS/P+3oPpsIGcb+O2KljZP+MXb7cvbNtRrQzP08TdMKKX7ipP1AXKbSunBluq
 yj/pN1yBCovqdCPHxBAsZq1RVw2snWiUY
X-Received: by 2002:a5d:6d01:0:b0:385:df73:2f42 with SMTP id
 ffacd0b85a97d-3862b37bbb2mr8444f8f.32.1733421350138; Thu, 05 Dec 2024
 09:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-15-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 17:55:39 +0000
Message-ID: <CAFEAcA8LhQ8w61m4qnU=SR+ZfJGeYzVCcp-s-M-+SrN7RSo97g@mail.gmail.com>
Subject: Re: [PATCH 14/67] target/arm: Convert disas_data_proc_3src to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: T0p7h90XMGVe

On Sun, 1 Dec 2024 at 15:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes MADD, MSUB, SMADDL, SMSUBL, UMADDL, UMSUBL, SMULH, UMULH.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
