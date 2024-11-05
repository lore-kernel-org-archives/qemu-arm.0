Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2830056njc;
        Tue, 5 Nov 2024 05:45:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2kif9/IMPA2Y6I4AFNO4yE/fZ8cpvQbzH0veR/GyNN+IV3srr26EJ69OZWeUy3m0wy+4TtYRMeLmNlg==@linaro.org
X-Google-Smtp-Source: AGHT+IGJPXO4TyDeTr7wMwEJUt+cm4E9v4FnuIU/LSyFyi3xkCwO0D/NlhdmbFikSWGRn+BZ6KSp
X-Received: by 2002:a05:6214:398f:b0:6d1:9e74:923c with SMTP id 6a1803df08f44-6d35c189576mr221126826d6.32.1730814319900;
        Tue, 05 Nov 2024 05:45:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730814319; cv=none;
        d=google.com; s=arc-20240605;
        b=AmeV0psYMqmNxunKfpIanrBl6EflBXBBjdKZW4X5v8Yi/y18y+c+R4N0mY8GaSz/pI
         i5P6MHkNbF1PDoeX+9U5h5ybvPTX+SxsHEz5xdEzf1JL/rjP16pMP0q/zvyl9t4CwUIk
         yO7nO7qhHV7tWPnhE2wf1bajZwc9yV+naDPZJgUuihdcT8VBOthfw0Kln1aiFyXCvzDW
         ImOtXVT16+7aDMUgxs7Fsp3emnw/axHk2V7egKHhVVbiohG0DLJX4BR6CiXRWokHvabS
         PiiD3T+obpA+T1rkvmDr4l4oTL43t+H/E66Jh7J/y31rAZK8O6VRIvbpU4cDyZIp/8xl
         Wruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=c3aoQgldD43PHs/6k8QsXfJTzVW7Rpwn6Nrt8InQfuk=;
        fh=eZXG6T8WwLwut0LXV7/SF9LX9IH5rtHyF2gKLm2ol6g=;
        b=lsXbRUz4BxkVS12RPnbnZo1vmtEZW79/srY5+3V/lvoHVh04njhlLsuHffcQ9YvriW
         sXOP1JO5g0MAYZqQXbN9e4chRFtIeEnAuNWZkgjHUYvbSEUn4TAePx6qUJIOr38XxZmn
         J2/WO0All7Sj5QnHjNSkf8lyChE2NTGO+RWLfbEL2yPKBT81gQ4UpHaQPGstQdzLYZly
         rjdHiYqEBudN60Bqh8BO8VxTAoIYvlD96jqJUacR23jDuSM1x3rTBVIKmsF3tsp0N96d
         Li0pH1o0WzR6KEKR3u5cUPC7MkOm7UIp6vbcfVqscWXEckv8iOuGFybzomzZhvCNBUZx
         2uXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYGr3PDx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d354184220si141342396d6.409.2024.11.05.05.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:45:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYGr3PDx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Jrk-0003hN-Ai; Tue, 05 Nov 2024 08:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8Jre-0003gA-Cx
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:44:59 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8Jrb-0000bH-Tu
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:44:57 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539f58c68c5so9915876e87.3
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730814294; x=1731419094; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c3aoQgldD43PHs/6k8QsXfJTzVW7Rpwn6Nrt8InQfuk=;
 b=UYGr3PDx/B5kixCH3ZV3NfCjKMemMdbS1NBGoFlzUinNHEgnUN/F7TutYl5KcjlSGO
 krXW3gSpsEwdO7b2XjxKRejzPplFBkNeFbdDBUXHoY4wTZBUxZPHZsVRULAtgcgPQU1h
 +CMJVp2uLGRQtyqMP6AYN0ZNQ3Gm2axs8uuDxlrqCyQmimToW8YkQVJ/K7NgdPDwqRKY
 oFmOYpSI/KxGe08yXjmsPU2HcJK1gq6CCRHMHNW+ECepJO2c4oN0E+R479crPx3U0APJ
 TS0Fu2BEBzAJqbW6BkwmcBBwWlaxiYUyJI8s9HNDv3RuZJbWmpVXE+B1n0mxKyYtHi4+
 H9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730814294; x=1731419094;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c3aoQgldD43PHs/6k8QsXfJTzVW7Rpwn6Nrt8InQfuk=;
 b=meUtlJUqNxqNqhhqpAcV+33OwUVFnJB0zW05/cCDrNCcoWBiR55U7QGTUcjs393e4y
 /1QWpKy89D+95t1jQ/3EJFS+Dn5G1xiU6VebiCCuC40PgRy4j/eGEOsIVuqdTvqR4tCB
 wWGf31tRUVv2kPf3e8f+ZyEFusKzLt+VrYZe4EZy+auMfYB44SUFdt2iFNj/752CcHFB
 +vs+JftSkLatjfIBk2wcy0Y5ZFRL8+IcmYs29+mSylS379cezpExDgWzlUDRtUb9GKR5
 m9/m+b7SnEmcP4+bRjCc4B+OQ46YKf/H5jQ+ThgPESjVRxqX2OGIwcEl0vl32NDvs/Sy
 2F4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXraY6QPmnJcI2dV7u6Oet1zWzhk6L08IZiswyEjSDm1e5VmKNPh7bhwJirpKE3kS/ryQNy56cZJA==@nongnu.org
X-Gm-Message-State: AOJu0Yyaomi9egWyFZmeDXvi8JcZylR6566YuOWqWe2N9B+JPqxuTGIs
 8tGJGi/uMClihCjixl4nScZcRgTJbvPLPdFvLSAT7OFlmDYSrCgQPW53tQxdF5s=
X-Received: by 2002:a05:6512:398c:b0:533:4785:82ab with SMTP id
 2adb3069b0e04-53d65dca853mr10449603e87.1.1730814293733; 
 Tue, 05 Nov 2024 05:44:53 -0800 (PST)
Received: from [192.168.21.227] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb1813841sm133549966b.178.2024.11.05.05.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:44:53 -0800 (PST)
Message-ID: <c27c6a0e-5f26-45b9-bdda-28e384809f9b@linaro.org>
Date: Tue, 5 Nov 2024 13:44:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] tests/functional: Explicit endianness of microblaze
 assets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241105130431.22564-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: F++3ng6DBBW7

On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
> The archive used in test_microblaze_s3adsp1800.py (testing a
> big-endian target) contains a big-endian kernel. Rename using
> the _BE suffix.
> 
> Similarly, the archive in test_microblazeel_s3adsp1800 (testing
> a little-endian target) contains a little-endian kernel. Rename
> using _LE suffix.
> 
> These changes will help when adding cross-endian kernel tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/functional/test_microblaze_s3adsp1800.py   | 6 +++---
>   tests/functional/test_microblazeel_s3adsp1800.py | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
