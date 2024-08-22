Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp634457njb;
        Thu, 22 Aug 2024 06:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7d9QEXX1aVrf0/Qsweqd2EO+TY6pPAqFJb0MZkTfNVSZukiTmvDVIfAnqL2b8OS4JY09P5LN4uyAi9A==@linaro.org
X-Google-Smtp-Source: AGHT+IHD48TYtkbK60ja6y+eOSOXj/dzy323diixKkf42tIMfK9RyW4nwYpkrRfKLhEngg5qf8gq
X-Received: by 2002:a05:620a:430f:b0:79d:7d6e:e02b with SMTP id af79cd13be357-7a674106cecmr458796685a.70.1724333331704;
        Thu, 22 Aug 2024 06:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724333331; cv=none;
        d=google.com; s=arc-20160816;
        b=InEUsJNePkFIpQfUatF1VTt6qB29vn+cWSIAE5mrAoWN4S/mt3qJ2og0f423GAARb0
         ton9Je1fNW8rgyRA+VKMUZ7g2EEE0ikqVLaOsoTE5yiymmNQmGKRBvlGT3ibdUseehEZ
         8BKuEIgCvUV4LGEhDW1zVA0mA+gOhRjFq8HzriTaYX+ORGd8YgGFZ3Kqcb9BUQALsqPu
         V+gIk1fQx7OmTOcamjAslm/8ADwYDYI+SDvnAaFJT5wgEl9DVw6BseNRKtrxqbrzjMo8
         xTusK6bOhG0mDsoYdSMh5S+iH6i+RlnNrYLjt3URIviY1jxMG1ZTsSNaL1qSsVSx2q2W
         oyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iboVwxqYZ7dX7dV1LSG5gTtGmY5fYUoZtXeRX0F1mrU=;
        fh=6/CDHjMawg0uaTejzm0ook6ctfJ+Ejs3I9RJ9mLgTpA=;
        b=ajCcsUqlMjeAxMWIpoyrcx+0+hCYts+psW3qG5IlJxhcJl89d1W1uKrBtO78TRUO3m
         g0kOUyRhXh87UznE05vjSw23DwRxCniIRzW4AicSe7MjYl9fjpIsU3j+xiQ4WYrEeh8Q
         nEcq3ZB304remwj2MeQD/u1TN8KBKFskTKpX5Kd1nakza2GoBGv/q1pH00llrdQeHwf9
         5pm3gEly1BOujwHHsPQLQCE0OUnM8scD43sTuPNhCyXp3QuC+CAktbUKBftGF0w+WcU9
         w2HFwCYw+MqUJRFsqmhOTerp1ZAwph3bMXdT2DPtF1/7g/Q6azMTjHMjfHeN/nZLfzO2
         L8Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=luU1f+sT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f3d6ed2si155642985a.309.2024.08.22.06.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 06:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=luU1f+sT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sh7rb-0004UW-Oy; Thu, 22 Aug 2024 09:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sh7rZ-0004TL-7D
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 09:28:29 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sh7rX-0007H3-AT
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 09:28:28 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f40a1a2c1aso4047121fa.3
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724333304; x=1724938104; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iboVwxqYZ7dX7dV1LSG5gTtGmY5fYUoZtXeRX0F1mrU=;
 b=luU1f+sTRSgmHJVcKDb8iweOaONsuLcYgfu5d5oo1AtbaW3X+512bB9Zj5i2ZfNCQM
 I7PIjr3C6Di4SD4qFWDXW8b3JEdfesQ/Pt5PtLdLUyf/nW5W+ydn7EIclwTZYVCUQwlQ
 vyok6pY76PrFQLwDmJAtEuG2jsBpSORqQozDq5adhKdNwGdL9PjWbUittH6Bgjy/FwkR
 e8Xl/iCKaZja9Zh2YF60CTSUvKwFu95lJr0xa1W+9em44xsA5maiwp1KaD1deFBcUarv
 IAdrTczvQF50dvbCKXNUcck0Pvb+jSeVjJibQNUldvdxHwGTPed0qx/bUxNpXm89cuOP
 cAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724333304; x=1724938104;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iboVwxqYZ7dX7dV1LSG5gTtGmY5fYUoZtXeRX0F1mrU=;
 b=Jwdv1mMfR5DkSKPZHcYQy6eAbIPL6nr85ZiQbDiPNns/sfuP7Gyu+KWOOGv6i7Rm7d
 xE+nqUEx3OVLb+LopDUVF178D/5Wvj+8cxUWSelU6kyrmkvJXwvmSPBy9Ll8yFEyigOX
 5zNtsY3j0fCRBisKKDeRkKajFPlAcxXz7dak4cGUAEDPply+4a+OLtJoCwOUPUL5601u
 wGfiJW0HwFaQi6IvK55/5E4pWT/rpwUnKKazEyfUA89f5LwX0j3k/Vs1rXdRw83qpvXE
 KV5VgItPDHznFh4SunlE0kQodl2HXr5/5qMF0+0qU74lmdS9a1gtLqtZvsfZCKshTdW7
 Lqtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUABFAxm//JsziQ9jPJKbLYSBTgYnu1MW3T1ymxnVFzCF2jG3gksJ5hSNfeUc3osT4nBVOZcNvmWQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+soOtV4HDo7mSRqFjPXoAuMBTBlA5R9ChMJ0rvG9UmmKtHv7B
 8M3ShGaTTzkcQxFjlYyDWnkihxen8tuefCdWHUSe1uLSOcIulvHnzH+3jJasjgbZGHvpA6WgA1O
 MoFzey0BTdK2fTmWf8X4kL4oT0vkgz+eHTyk/I1Tys2oqiE4X
X-Received: by 2002:a2e:a549:0:b0:2f3:f49a:c6df with SMTP id
 38308e7fff4ca-2f405eedcf3mr13183331fa.32.1724333303859; Thu, 22 Aug 2024
 06:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240817102606.3996242-1-tavip@google.com>
In-Reply-To: <20240817102606.3996242-1-tavip@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Aug 2024 14:28:13 +0100
Message-ID: <CAFEAcA8gg1u4_HwG9QOHj4RqfHgNLkT5nHLTFNrcaHdgL+zEPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/23] NXP i.MX RT595, ARM SVD and device model
 unit tests
To: Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
 pbonzini@redhat.com, thuth@redhat.com, marcandre.lureau@redhat.com, 
 alistair@alistair23.me, berrange@redhat.com, philmd@linaro.org, 
 jsnow@redhat.com, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x236.google.com
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
X-TUID: AIqBFIA8e0K1

On Sat, 17 Aug 2024 at 11:26, Octavian Purdila <tavip@google.com> wrote:
>
> This patch set adds support for NXP's RT500 MCU [1] and the RT595
> EVK[2]. More RT500 device models will be submitted in future patch sets.
>
> The goal of this first patch set is to provide a minimal set that
> allows running the NXP MCU SDK hello world example[4].
>
> The patch set introduces a (python) tool that generates C header files
> from ARM SVD files[3]. This significantly reduces the effort to write
> a new device model by automatically generating: register definitions
> and layout (including bit fields), register names for easier debugging
> and tracing, reset register values, register write masks, etc.
>
> The generated files are commited and not generated at compile
> time. Build targets are created so that they can be easily regenerated
> if needed.
>
> It also introduces unit tests for device models. To allow accessing
> registers from unit tests a system bus mock is created.
>
> This can potentially introduce maintainance issues, due to mocks or
> unit tests getting outdated when code is refactored. However, I think
> this is not an issue in this case because the APIs we mocked (system
> bus MMIO access) or directly used (irq APIs, chardev APIs, clock tree
> APIs) to interact with device models are stable at this
> point. Anecdotally, our experience seems to confirm this: we only run
> into one (trivially fixed) breaking upstream change (gpio getting
> removed from hwcore) in the last three years.

My main issue with the mocking is that it introduces a
completely different way of testing devices that is
not the same as what we use for any existing device.
QEMU already has too many places where there are multiple
different ways or styles of doing something, so adding a
new one should be a high bar (e.g. "this lets us test XYZ
that would be impossible in the old way") and preferably
also have a transition plan for how we would be
deprecating and dropping the old way of doing things.

So my inclination here is to say "you said that you could
do the testing of this device with qtest, so use qtest".
If we were designing a "test devices" framework from
scratch, using mocks would probably be a strong candidate
for that design, but we aren't starting from scratch.

thanks
-- PMM
