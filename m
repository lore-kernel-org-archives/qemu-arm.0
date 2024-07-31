Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp225563njb;
        Wed, 31 Jul 2024 01:30:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbXntOUb3Vc46wy+8Jfwpu5qs3N2PdYZyGVwJ8oK2bGc/JjWGR5ZQG1zp3DFimN10AeNKZeFhCbgiLNukSMYVkZsUplp8s
X-Google-Smtp-Source: AGHT+IE2lP/qScTOAQYSAeqLphf+6xRlKvpXkYFJf3DfUOgvQefXzC1E1jUlo7D7e1drDK3fQYmQ
X-Received: by 2002:ac8:5f14:0:b0:447:eb16:2e6a with SMTP id d75a77b69052e-45004f987b2mr150565691cf.40.1722414615872;
        Wed, 31 Jul 2024 01:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722414615; cv=none;
        d=google.com; s=arc-20160816;
        b=b7re6Af4xczJlnGDL6uVxsRXbxgsqkDKAJQtNIYTfjG9eTHqfPqose6Fm6IJ6liLKs
         ydliAb1A0xwmF0Z9ftZXNc+Jm9tDeTbOZEGcirtI+g4RnfjuwiJzh6Z/HlSbob+2UnLM
         yI6DzYIpRHyT0eZ5etcgZf61Ua+QWx5QaOX9Ce32gCHdXZCLfTwBCS0LTHy8uEeAM9gC
         IBSFtXnyhXlySHLuMFMWllGag/OhJT8bJfyGw8lX1kx6AhHUuJsh4vWoyBn0xqbufwCM
         nUD0pFYgecWOEpX1b4Gf/8fpORt/cE8zv+IYT7FdOwQda7I+/PCpLNEwL2gvDxl9UjEM
         4Abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0YOTAMMf4iPZMx01Vfm9GIEOnEcMxS+mWoBS6sntgd0=;
        fh=V7xKNTiTWG9O0R4mxise7T7l0pv9eNt2qQiNY6hORuE=;
        b=sKv4UzD5pj72mZUxXxZ0F4d4z6kq181cwyybjkqaHcnrEy92sYQLlc0lnFxyxgdiDb
         /MB2MOv9wMERepOE/xbaNxl9Df3w03ULUCok7vP3N8gW9IgEeqJ0HNq/608MQECF19T7
         WqfatRTNmkodjC37auDbxq/KE6MiX/MXi51uf7/MrQyag9f0hOn971XYXDwALAYs6vuf
         NQvGuFEERfIfZyHjhp3229TbNQrbDD+Hz+05+Qbztk0lcXfnQEMM37G3HdVmjwSQwKQl
         gADTQfu13wmD3m9a95m1NK6E0pzOpnbG3Vgw5aWPyO1cmVItt6vWSO2CMsBM9xjluZ6N
         O4rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VAo305Hq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fb72bsi150412871cf.292.2024.07.31.01.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2024 01:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VAo305Hq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZ4ij-0003mP-TP; Wed, 31 Jul 2024 04:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ4ih-0003b4-6r
 for qemu-arm@nongnu.org; Wed, 31 Jul 2024 04:30:03 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ4if-000106-Bp
 for qemu-arm@nongnu.org; Wed, 31 Jul 2024 04:30:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa7bso5707494a12.1
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2024 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722414600; x=1723019400; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0YOTAMMf4iPZMx01Vfm9GIEOnEcMxS+mWoBS6sntgd0=;
 b=VAo305HqSonS2cY/sgCWvkVMTbpkZeh5iPHDq8SdjiL2BXJ+T2swRpLAQrrY8Nevh1
 k+hQWaFgRQkXSnycnbT7XUwGR9noXWNBZ6AhX8coIi+S3lvnSByCv1HR8Ro2uKFp8Hip
 zHvqvZ7haIcuHXem7wRlQ8RRkqOs6ljl1ozM9JFzTddi0EKq1/MCy+r8glC6+zLhUDAz
 s6cfaFHwL8cVi6ECTrJZm1Q12AEqDjMxZpvlBu+In8/yIC8Gry1gmxstW5Qr4AB3ecsH
 D4B/F9k7+PQBMcKrDgVoEkX26zn2FgjSfv1LeJzLyWlMGzivK1FRsyKJm9YoGLqiUflk
 q7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722414600; x=1723019400;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0YOTAMMf4iPZMx01Vfm9GIEOnEcMxS+mWoBS6sntgd0=;
 b=n9BQT3YmHOMNdg9i2j4EQmotr0y2mV3YKG23p2bvWnoWhTp85mCgLabALBMJyufvIj
 c3SQQp1odrWJCtN09n5LB67598QEgCMCbU8NuRSdyVaCW0zwNfjT4va2I8vVSI7ZItFp
 uM92Z+MgyqBeVdNxxm7b5mNi/pvMiTDqR9RasfwmlUO9bY8UzxvzX7s6AHklAe2YQSVw
 GbkHN4AnHY9w+9v9JsWEpPJ3SePt6EWe52Ke3aW8N4PrgYgBwozi0GGyR7ga9WkdfTN3
 KYo7OQ0n5WoAO8vreTp46L7S4tvGtaST8GUJ/oOvz7z9VqialbB4g9BD2OkM9wKnr68V
 RGkQ==
X-Gm-Message-State: AOJu0Yzm+QHhQOaNwanpYANvP1wWlrQ33kQqJE4NaWhnkTK4CkdW4oRY
 SomrhJPhkOTK5G1mKxoL4cR+riYcgv39BAnjJxirLtvX12djtu2XT0pzBivP/6aMIhVAqr4//UE
 XcKmu+AUJaeaR5nhj3aplepk7kCuYFe2fpe+nRg==
X-Received: by 2002:a50:d55c:0:b0:57c:78fb:1a32 with SMTP id
 4fb4d7f45d1cf-5b020ba8220mr8340344a12.19.1722414599667; Wed, 31 Jul 2024
 01:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240730155819.2958924-1-peter.maydell@linaro.org>
 <7c9662a0-240b-4bf5-9676-5eff403f86ef@linaro.org>
In-Reply-To: <7c9662a0-240b-4bf5-9676-5eff403f86ef@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Jul 2024 09:29:48 +0100
Message-ID: <CAFEAcA_97tRc-=XuqUgVa=CF7y=PmV7pPjRVbRx7C4qVGHaC4A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Handle denormals correctly for FMOPA
 (widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: Mf5w4JUHtTiA

On Tue, 30 Jul 2024 at 23:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/31/24 01:58, Peter Maydell wrote:
> > -void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
> > -                         void *vpm, void *vst, uint32_t desc)
> > +void HELPER(sme_fmopa_h)(CPUARMState *env,
> > +                         void *vza, void *vzn, void *vzm, void *vpn,
> > +                         void *vpm, uint32_t desc)
>
> I think the env pointer should replace vst in the argument ordering.
> That keeps with the standard gvec signature.

Here I was going with our standard signature for everything
that isn't gvec and putting the env pointer first. I'd have
done that for the gvec helpers in the FEAT_EBF16 series too,
except the gvec machinery doesn't allow it AFAICT (and also
doesn't let you pass it as 'env' and insists on 'ptr' I think).

But I don't feel strongly, so I'll change this.

thanks
-- PMM
