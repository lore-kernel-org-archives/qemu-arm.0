Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp37557njb;
        Tue, 30 Jul 2024 15:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDc0OPKcvBHIZnjn8l+4xHKibX3rSW+dsfPYE9Eqktu7g0Tng+7nXQgW9aobFzlog/a8VJjuHg6ZnOiHJi+HxIRQdeSoBd
X-Google-Smtp-Source: AGHT+IGQgIyDVNf8Z85j1W2Vbo8zt2ZiGsKb/CA0w3hIYH9Osk5I8UPNVmZPuO4NnZtenv/dpM6y
X-Received: by 2002:a05:6820:555:b0:5d5:d718:1b7f with SMTP id 006d021491bc7-5d5d7182410mr14242888eaf.1.1722379044837;
        Tue, 30 Jul 2024 15:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722379044; cv=none;
        d=google.com; s=arc-20160816;
        b=Nn4K4csrptYlfZ5TDZ4Wpxw0eW5onpxpGequgy6H6h6EaPQxJj+ao6IOvBe1Uk9DZV
         uECmHIdlzk7CAULBCIVpaxM91nPaCkeaCC85tNhyHETpQv8s5JMiAXMbGL2qx9PcF0xc
         VwaPGDoZNMwMrR3g8lB4aAZs8XoPL5DuhFmVQdch754+OUQmJjXksEGbh0QY00DfplH8
         uhlQY7z58/fvHkd8dQhBsMF0nI5OMHkbwRUkqvqAexLq97xdFEWfbDdarpghxTrI2bqX
         yMElsN0gskMr6E4bhRkhZr8Z9t1dB6RQ//iinQxeZP4dGTuxckKrKwu5GYSJV8p9ATuF
         HqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ObO4rf3+Yh1uQa1rPri0fpxTbgw3SANBVkBBG+duNQk=;
        fh=tvRrz5Ax9f1s9PLk1h5cgTHjAZP9ydHbIrpWPTlTenU=;
        b=j40dzcCFL6agZmWl4ntdd5zF6zYIpZbPbFk67pKGwbWtlOtEunY4r0SsfkmlZwH+BM
         JR+vb2PYtiPirjQtJcfEmdqIAhwBuT6AENrZHxqOk57zATrsojSL16zYf4NhXoBml5+i
         MwaOv7iXVg+88azJxCyk2V+zQsvCz5g+j3yjTALghXbdhiD77SI+DpLyB39J7vRa02zY
         uDnGkeqQWHBzdkVaRKGPmx/iCauY89NDLY47ABX8h5sMMmKAeo8sgIOq3GrOky+U5h1Q
         3jTe4/DeY2UGUBrjzOa9ggNDSoghJ9fY6TKAcGUaeSge0dUOeiRw3aHV3ZmfLUJxPfxr
         rS8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOOQonCK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fac1d08si133951056d6.398.2024.07.30.15.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 15:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOOQonCK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYvSR-0005an-4q; Tue, 30 Jul 2024 18:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYvSP-0005Z6-FJ
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 18:36:37 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYvSL-0001RB-OL
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 18:36:37 -0400
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-39834949f27so25572945ab.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722378992; x=1722983792; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ObO4rf3+Yh1uQa1rPri0fpxTbgw3SANBVkBBG+duNQk=;
 b=VOOQonCKsrt/K6aP23Uf1T0G++cwMad6JxvQWGA5a5cTQpFBNSec0DReYEtBmxHoh8
 30SRvhDI5SPWt3I8UbeMXbI7zOSowpKTjr7PNBcn8SyqrGYER2EJYtrGECyHhxe83hwo
 fcgDImm/csG9fwBemDu5hdu7ygn3hlLEWpf8Uk5/UkJ+5IFra9Jyeeg1DQN10Y/vBvCv
 xXWqidN6nEfZJQXHWvpsl8HLG7i0LVgPFOCwNGrdgPntFVWOF2A4xnBFudOpakOhxvGK
 hvbbXBe6TU5qBByHpuTlMBr9UZ/y3884iqGgqxQGt1nN1JpkrQ4vLKhi2YstQrmYNIKj
 ul0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722378992; x=1722983792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ObO4rf3+Yh1uQa1rPri0fpxTbgw3SANBVkBBG+duNQk=;
 b=bbRXewTA6Rc2WYSUnvrBAPUawMKaxQq9rd+LnaPLYIGlzieSCLYfcGilrQza9pjcAI
 JCPcaKK+7Yelw/ClpuHQs19dgJUCoW6ou7KqpCLaUR0V4LtNiyRaNZItDhuhdLrIqZ4F
 uWpWEhW3WZ1aO+pS/91tH9069EzViMVNnXXPn5VkrLW1NEXCs7AJWtZPNb2VkIdCnNFr
 Isk6egFitAYOH2ImqQxS3LQgQDF+F/ky4enMT5Y4JqPtDPdLbnSVQcSuABsiVh4quLvi
 WmOimgyiw7oqRcaFIKmhGGCnzh5C1JK+pxUuwyxtAIciGqqbfOHC0jBprg1NiJuOk3yw
 dj1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV16ulctwj+iJHORjj8SFa2+LDSH7OxuLTeMANrGv127sMdgaBMJhjdNnbZo5fqPaL6TrNdk4JIJC06uYjGrTtelEpz
X-Gm-Message-State: AOJu0Yx86Yp8F/2jIKH+frT59EPCB2IzuczrH+nZrBkZ4cjnCZGNqRKp
 fmqktfnH7SfgYfg48n88B/dwRAngGGdZZeuBo13JwIq/+NwzWrImJ7hMKQbx3/c=
X-Received: by 2002:a05:6e02:12cb:b0:374:a44b:1186 with SMTP id
 e9e14a558f8ab-39aec2df3e3mr172211655ab.12.1722378992169; 
 Tue, 30 Jul 2024 15:36:32 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7a9f7b7b029sm9310999a12.11.2024.07.30.15.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 15:36:31 -0700 (PDT)
Message-ID: <7c9662a0-240b-4bf5-9676-5eff403f86ef@linaro.org>
Date: Wed, 31 Jul 2024 08:36:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Handle denormals correctly for FMOPA
 (widening)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240730155819.2958924-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240730155819.2958924-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12a.google.com
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
X-TUID: 7+06cndZOAhb

On 7/31/24 01:58, Peter Maydell wrote:
> -void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
> -                         void *vpm, void *vst, uint32_t desc)
> +void HELPER(sme_fmopa_h)(CPUARMState *env,
> +                         void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, uint32_t desc)

I think the env pointer should replace vst in the argument ordering.
That keeps with the standard gvec signature.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
