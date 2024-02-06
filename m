Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1846441ejb;
        Tue, 6 Feb 2024 06:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPXtenRupb+msP8TZ7QYzJEzp4oxDtn/t0+O/tr71N6hp1UyPcyAmLnQ0sMaUjkr8vlMRb
X-Received: by 2002:ac8:7342:0:b0:42c:c5d:430c with SMTP id q2-20020ac87342000000b0042c0c5d430cmr2261810qtp.18.1707231282387;
        Tue, 06 Feb 2024 06:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707231282; cv=none;
        d=google.com; s=arc-20160816;
        b=rQ7dqe05oF837CZpFuHgmFDSvbrWBpLWHysK6vWFhw7uAZufgBJSHXJ2W2qnppdvRZ
         l/eSIcDDrlyCHGAQfZ2V4KPphj97NAwQClQXxxHZxIxAeaAj2eWiHYizxSJEKKUglr2l
         i8hAX/zpR1wO6PEoE8wr469RlNgH6X5gvXOTf+YvPPPtDJoggfkfy7wxUQYA9bT92B9s
         vy1C6qtysZa21M7LPB8fU9GEmsctx1NHgETwA/IAA0dolARCAzzNHVq5/UpYJFOo4pEc
         DbXR7YJap14CcIdNCUuryR8rwOomWTcnCkH6PcfzcEpDtGTogJp2a2J11YX4gY7ZTu71
         wGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VjutBhRlYmo1DRGC7Mrvt3EGfc0jRA5QdNLOuXPjKa0=;
        fh=OTzqs4ncRpP25CDy3uOTviF+IpwnRG77ILLNX0NWwQM=;
        b=cw+lBmOorqvKldMCjFpsD5tAL8TR1Fku3xDKgPSRe+CbfIxA83lHSu0rZNAm53MDQF
         ML3dvpzgP82jNbq/1slhk3OmXQpru5FbpdqiqBg6j6xKz3r5WATJezEtx9rsATbcEEem
         WBRmm8XnowoDbhLjwVvL8VxkVPsfAOziJoqroiPQms/JQynf8/MBBoy/o5HNsybq81PI
         d+ie7TSiwLJ4LiJGrM6CJANaT68eedoepVMTOK6amkCR9V8z/lalNCULbV+Jxtq90qjx
         0opPgYec60K7naVENqRbYKOm9IFv9IS5VuZVgofS3P6aUlEjKmnYr4rVAQTWiewvzcRj
         k4sQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRvjRo4E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVQWyzHvQuFJ71ctNJSgjWoJuSDOob1yE2D5k7osSlX754+OGWk7NtabdlPq/pPN8XHjSrGrVfs9XR2qPjepNG73AfIxYxH
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a05622a064700b0042aadd56214si2453390qtb.92.2024.02.06.06.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 06:54:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRvjRo4E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXMqH-0004ph-Ah; Tue, 06 Feb 2024 09:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMqE-0004gk-Mi
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:54:30 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMqD-0000yw-7a
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:54:30 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5602500d1a6so3557363a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 06:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707231268; x=1707836068; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VjutBhRlYmo1DRGC7Mrvt3EGfc0jRA5QdNLOuXPjKa0=;
 b=HRvjRo4E9cx2JIFp9+Xzv8LPOhyTg0uPZnEKH3A6p42DzmD4Pf6n5NHh0bD00lxinT
 FoEH/MJS5pYYKICAkYfCLCc+rTb3Z5IQUHGEydaWrXPoRE53LRHJlEGI/tScBgNb7Mz5
 /u2pLLM/gatBgX7o/gUodGV2MvrRayn+OXvo3QGgaRbkdHlxg1SiogU2RUdAxQJPiRFN
 KASGPNo39e6eA8ERPvI3L7QE6XAufaNJJ9UVEgh2Sgg0Kczydkca7pKh+PsKrwqQM2V0
 wDSB2aKkDGIg+QOLJY6rzY3sTmzWi0gdb3ZoUCjF0UprUUPHgYYa3S8jVkHZJe7+RpKO
 /e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707231268; x=1707836068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjutBhRlYmo1DRGC7Mrvt3EGfc0jRA5QdNLOuXPjKa0=;
 b=WlunDgiH9uu+QpAwvDqSgtEuRKDt+EAsy6QZbiBaWMiIpnS2/ABvSJFvNnrW7lBYw4
 7JVG/cg4z4Ub/bff9mmUNKNEupvNCXiK7GZ5FwlGo/lCLxpAvm/c8CG6no81moCsMp7g
 kgfLB5s6MRV2LN0ZSzUD7X9+B6YSYH3F1v+ZmJyzv//DBRDz5qfziDTKTkVzHYQjpa7D
 n4frHzg/qTyljKZ5Gagj3TiRoL9dPEybaBiFzUrcsLInO3flXkCeSvJCmYO6hmjhUTuq
 4PJB2+r4DGuRSAu+x3HHEgMIRknPPTqF45qNtRx1LxKBefPZIgOLEeO27JLeJRH53xUW
 Ykgw==
X-Gm-Message-State: AOJu0Yzw475mvkK36I2BTezLQFwwJR3m/ZcK9fl7q8+JJGLk9GWoBl8v
 A++MSYVD0o1mE9CuFAvHQyDHdRZFA1RjQe2+I8La/9Vuc6IN4/6J8hy8ezJVPFDyIpdWBlgrL4N
 uFT0fHoGh6griTknfj7+UWt8NT1Nf8uhyJZuV/Nuo8hvPgWzo
X-Received: by 2002:aa7:c713:0:b0:55f:e682:9720 with SMTP id
 i19-20020aa7c713000000b0055fe6829720mr1817322edq.25.1707231267766; Tue, 06
 Feb 2024 06:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <20240206030527.169147-7-richard.henderson@linaro.org>
In-Reply-To: <20240206030527.169147-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 14:54:17 +0000
Message-ID: <CAFEAcA-pZJt=+3CyGN1E+-_+-2JeyzgdQDFv4ZFsN+8QqF+=2w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] target/arm: Fix SVE/SME gross MTE suppression
 checks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: uFtzX/xFFAmP

On Tue, 6 Feb 2024 at 03:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The TBI and TCMA bits are located within mtedesc, not desc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
