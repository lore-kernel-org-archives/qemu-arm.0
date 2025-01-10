Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp115691njn;
        Fri, 10 Jan 2025 04:30:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJ6XUSwO80zv0G0Hi33RwrAqqqIlx7ureoi41PRwOnZ8NEu2FcV0j+JrfIDNLgB284BC3/vy7T5izJ4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHTt0CxmY2r07VKatkPjOHETZXra+XiTDkoiehh2nB+ZK+NmxKESuwjw+VK1fvLlYfEsWBt
X-Received: by 2002:a05:620a:4016:b0:7b6:6c33:994e with SMTP id af79cd13be357-7bcd96fa26cmr1752150085a.6.1736512212168;
        Fri, 10 Jan 2025 04:30:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736512212; cv=none;
        d=google.com; s=arc-20240605;
        b=Zz9xTvxRvdB/WQkFlnaVDwYPW2+NTDoHUt++Xu9W8QQfLlLbwYdUsRZ7B7d32Uj4mP
         cXj7EDapqEPd8okcbLOt4zNf5+/aaOeITUZI2ahqBHaFg3tsXfSb//erqwFm50iPsEQt
         jL3bcf4BzgizMBot1zWExaLYdb8Yl/UPa9PQ7skqCvjzJ8THzp/IU623FgD5CjU10RI+
         Xgm8nC1hUn7gts2bb5GtM0SG/DrSJC1atR4S+TwdNdrtoMHo6xSyM7ozn4fWjIU+37hC
         y/RwFudGAqIymudNCdCNw+56u9oII1vqLpknybxEpOPoiwkljPpQymHWE+jY/hUOKg3z
         rzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AivpEUPvu4XqN7QhBIWcNtaeHxL3gUSC8LCMUCmgVnI=;
        fh=s2MOsf897/M8XTvkmg3sVyoNMIzQLZnBaylXT89tuyk=;
        b=EJjReZCOBF9sMdGKIsc6Pa3pCvM8U3WQlAZt30xFQFlg4yHSXtmAmBSM2fVjipJeCK
         QAtw78UJCv1Vfff/+JO5k9E5sfzyT/Vj3iBjmCLDztmlTaCY7I61DHUJqqM0yGs82kg+
         nViEzDo6hdF24Pd88mALzONszQKwsPs7LiHuthtDkjPwziYDpjpwid1WFGZwNcTUZJ7w
         UfBFjsQ7SbmFaNhhJKQ3LUGhd41dCVUiRn5T0uJLXR0GvNv6biloRkFgtjn+uXj2mpdj
         0yLY1qC4CEqKZiq4d54p6KDRn8Vqj2Nnob006n1CeaHazXkqZ0nDqCfeOq5a7zGXhmAq
         Oo4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9AkLjPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3508013si387109685a.515.2025.01.10.04.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 04:30:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9AkLjPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWE93-00030D-6o; Fri, 10 Jan 2025 07:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tWE90-0002zT-IN
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 07:29:42 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tWE8s-0005yO-Q3
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 07:29:41 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e3a1cfeb711so2887302276.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 04:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736512171; x=1737116971; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AivpEUPvu4XqN7QhBIWcNtaeHxL3gUSC8LCMUCmgVnI=;
 b=L9AkLjPM1JWZbpkytwn2XvDCa5yUj4uKK5S1T0PIr2hUg4GANnJGWz/7azJktTCUqd
 AXrM76OP6zCNLAXRvFt3qN9otvULmsW+zFl4wfPCImDf4nXjXLljIKrNexMfzre7HLSG
 iGoyeeopAhLn2qJr57UHTJ7JgF4OLdwMHD8zBFmIOX4//bk6MH+FerZwoqCTyNj7cXQX
 xWJ6K1eN06afBT3Lup+0elLHhmPzZZRjqwTt/LjVJqmLyhEb7nV/ruBo92QM7DHxLpO/
 Oiri91Ef6Lp+F9kphbmINLvAizv296fpLbSm7NZBVfr5u7OO7mj7idnDfx/i9YMcb6UK
 bs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736512171; x=1737116971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AivpEUPvu4XqN7QhBIWcNtaeHxL3gUSC8LCMUCmgVnI=;
 b=qY8+d7OxUiwgaiLnoH7JZkRzD0bxbHAK490z1Nw+KfIuih0Reh3MvvXUORI8RfS0mq
 7z9CJ3gjbtPZ5k31v7uHOd3FWZWdW5oXUAiRtMsVnGJKqEbaOb3tap0bjCsrstXcjCJB
 a7DPUtqX3y1L7kxNebaskDTi1V34/JmptOBh6cU7v/PhXCEHt7ahtU3Dy97bCGPejMEP
 AuWbaC7ZSSbKN1BVZXaajja1ViXQtwbbnwtk78NtLJTcb/priFaeFYFvmKnIqQ9CHTZ9
 i/fnfaOne7NcLp5BxAKzzPcwjShhuOou9XDD1njab3JW95k4AKhmARAKnPbrfrvqntJJ
 wxvQ==
X-Gm-Message-State: AOJu0YzCOCWA/Fei2owfyUzvMyymn7puX8m11q84GcL3aVP3kyBryi8z
 HChJdaa2dmEm4+ihFKuu4SoUC3vzdZy6xtabMpGkFSRcvvC8UW1VRWLZqn0V4kG961e4aJK+Q2D
 yt6Oqz1Js01xkRLm1lo6hPfKS25OPWWCtpvOhRA==
X-Gm-Gg: ASbGncuhidSsZO60meESvE0cgUzIshGd8huIUsUlP0ZzPdJ+BVovcSKuz12pmtHkOuy
 Ao4BW2v+1MhTPN1O+cvyLPbFWyTbRdAFO9HW79ok=
X-Received: by 2002:a05:690c:9a87:b0:6ef:6cdd:57e3 with SMTP id
 00721157ae682-6f5311e6427mr83278947b3.8.1736512171210; Fri, 10 Jan 2025
 04:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20241220125429.7552-1-abelova@astralinux.ru>
In-Reply-To: <20241220125429.7552-1-abelova@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 12:29:20 +0000
X-Gm-Features: AbW1kvZgF33SI4fc98M6C_juQrmP4eeQ6JMCd_7K9izf_NeRcL5hScNEydHCG3k
Message-ID: <CAFEAcA89TWtcjt4SQrzSsuESWs6ur6BaR8nTQdtAo1UoV51zSQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm_sysctl: fix extracting 31th bit of val
To: Anastasia Belova <abelova@astralinux.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-TUID: wCwZDb3/BBSS

On Fri, 20 Dec 2024 at 12:54, Anastasia Belova <abelova@astralinux.ru> wrote:
>
> 1 << 31 is casted to uint64_t while bitwise and with val.
> So this value may become 0xffffffff80000000 but only
> 31th "start" bit is required.

This can't happen, because the MemoryRegionOps uses the
default max access size of 4 bytes, and so the high bytes
of val will always be zero. But the extract API is clearer
anyway, so the change is worthwhile.


Applied to target-arm.next with a clarification to the
commit message that there's no guest-visible wrong
behaviour; thanks.

-- PMM
