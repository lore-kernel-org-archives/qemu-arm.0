Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp428472njj;
        Thu, 1 May 2025 12:40:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPa2ncWJ1s2k5c4uuyCxPkC2pJ7G/in3WPGjnp9cdCnx1jB+Jy4kVxV2Rx0G9uiacO/8ibZp0QL7Asgg==@linaro.org
X-Google-Smtp-Source: AGHT+IE8x7etWCqtX4uAacx3N+p+xBwnFOYGDg3t0gYuy/b3onFylcbIyqFh59iILJtc3uj7dWWs
X-Received: by 2002:a05:622a:1f8d:b0:476:909b:8287 with SMTP id d75a77b69052e-48c317386d3mr2835271cf.20.1746128441689;
        Thu, 01 May 2025 12:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746128441; cv=none;
        d=google.com; s=arc-20240605;
        b=UvQl+asSTQmBIJY2gWDVcGRa5/HS7cVKOhnoU24o/pdb7acMptZGN1AdKdawXzpnwu
         tlXVeXHg0Bd41dkixYPWLVOcsbgoOXoxgAOxUXbDizDRMA6tAplSSdj98RzkL3D7RuWt
         +0FFdvoFxyjDy2tBwpn1J0+dXOoCOQCm6TGF/vdZ7afO8z8Bzf+gID2NivqN/BD6vXM4
         OaRLGBn1M92aO4rgRLCdAajrPD6XOyhvkKypSTtvlDRJBcDX8nKf8gnt4kGy982spZyU
         lLZah07fQkXPWu5syFciPGaFFkeeqJ9CXY2IgDYZ45CJhy2FHk6LJg+RDERgou8JV9PO
         uQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oJLy7DlOh0TcIV4iCR0WNqisTfgueeybnDgca/yHWNs=;
        fh=PWGwwkMo2q17hiDRUTGV2stSjtKddt0xctaMVmqcrbo=;
        b=b0RkxbKxKKJdj7ijYiiQzzyakqMrxPTTPqrr+ac65sPKESl/QMbL9T4JL0AhXKHAcb
         rj3+1JYXhxWNquPV0PxaL9IwxPpk/Df/tEjAbOfjYDVRtnY4GCMFoH64X8Og9dLEoIlS
         O4N/QBhDNyRncgE+2U6+WuelC70148NtVHfUqyQzfAnnOo7+i8m+JZGnHQ8jLQWQjXB8
         hLwbAyWmYb6kVFzG3T4iVjBX5NvQTldZt1FVgURjXXCBgS0xTWhtEdV0RNh+q+3pmHYv
         k5HxeS4SDeaQ6Aac88PBcWpzxZfkMsQE2I2fTCxd6tzljuc6T4xLaZaxcqNdiU14Ou5z
         qACw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qaUvnI+Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b987243ddsi12237011cf.402.2025.05.01.12.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 12:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qaUvnI+Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uAZlh-0000ZK-O6; Thu, 01 May 2025 15:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAZla-0000WN-NK
 for qemu-devel@nongnu.org; Thu, 01 May 2025 15:40:19 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAZlZ-0002Mw-0q
 for qemu-devel@nongnu.org; Thu, 01 May 2025 15:40:18 -0400
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3d7f4cb7636so4803065ab.3
 for <qemu-devel@nongnu.org>; Thu, 01 May 2025 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746128416; x=1746733216; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oJLy7DlOh0TcIV4iCR0WNqisTfgueeybnDgca/yHWNs=;
 b=qaUvnI+Yi+tWURWEuJZ57xbS5nwK/5Wc2nigspc/q6BQmJJcJKj6P7E6vvJTLSDsy3
 03xruBRAlJXfcOhfxJuWRxH4E4vmDABLYTd2RxHJ1++G8yS2/IOir7vajvCMzSwhQYDO
 9O+5NX1aP0aoINzbiSqz2JsozV0r6X0YgQMEC8jdsCjLCqn/UrdXogsXsEQHRqNmWFhC
 MAZh+YwRNEc9VcZ9mz8KQy82vUCaIbnpIuTOo75CnFVYwhn6H4iNbjpmR0W/9RRXMwSm
 Ah4jQ+HMc3q6yMVqV4g2nYskaXooZd98KEQCBoC8Pd7IcjYmREQnBDhX48mMOnNjhUaH
 ztVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746128416; x=1746733216;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oJLy7DlOh0TcIV4iCR0WNqisTfgueeybnDgca/yHWNs=;
 b=l1DeW14NfYrNnQX6A1rHUcxRc/YhqMkWxiWYvZM5TtRMeSmCXZo+eonpP+TWIUKsfY
 Fv576lF5OY8F+yj/fzeIln/HcyshqMZBiMGeLfWKUJm8CThsEjVO5CgQcX8wj3Uc12qF
 Skmo4gz6HTKRFYAbHTvLGiPoFabt9R47kQMY5xfiH5lL5bpR5i+HmoN6o49TdYGdorg5
 a6ScGmKFTUXdlOdO1Z1VcNhxlyxgJQn104aWxd4Z6yNDNddlBwe3kOwT/tHybwqyQ2tS
 wFqE4b8LL/HAQNFO4skHYnIYHqjHgsPM8pKW9KbEaxOJD/OOzI0x59yX8BStKvzWKe19
 6bhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJcD20APDYnvxfqYkrXVhxngXHM3urxN1vGVF+7pBgzLWnTE3fWWESN7I/rY/85D4RfnlwWEDS7yz4@nongnu.org
X-Gm-Message-State: AOJu0YxxlSiLaO5MNrcjQr6pnrfZd6PNP/3EJQrx4JXiKPt5ezYvIE6y
 57vRIE/ey4x4KXftvkvh9g7/gIf1Fo18tHM/plm96Zr2niZaX12/nGnH93zYY88=
X-Gm-Gg: ASbGncsCGSC9cnUrkb81oNtpqYtKpMghP2FwxIERZnFmYKKXF5gkY8yotw5MHtkyE/y
 6AMJzqzHxhxrvlWqJ2hhPiJXTJ9OsDFTZfUkI2cjzB8BsX1ti0JjTyFRPvQGGsnmbKh8nI5tiry
 Fv3GSWBISDXDN0xsMA7xs+kAA88pExtxTgLqwEA0PFIjnvm54O6OgW25nR+YzO52rW+kwRU3/sR
 UhLboJHcKvEPB/DOzgi1PciqUVd6TVhaKUslRDSjEwlt2YcFno3L2Irx+XN0JskltfhqbeQlbKm
 XR0gsdnbPaWpsm/c/H313z3lCDshqz5QL78xCuFaFP9zpz2PsdCBsnFGaUu8znMZNqd/Ut8kLqM
 xN/l8VRKSK6R5jw==
X-Received: by 2002:a05:6e02:2196:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3d97c1c636amr2029215ab.11.1746128415825; 
 Thu, 01 May 2025 12:40:15 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88a8d0ff7sm16481173.28.2025.05.01.12.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 12:40:15 -0700 (PDT)
Message-ID: <4539cebe-8b08-4454-9812-a91a01363c4b@linaro.org>
Date: Thu, 1 May 2025 21:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] target/microblaze: Delay
 gdb_register_coprocessor() to realize
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20250429132200.605611-1-peter.maydell@linaro.org>
 <20250429132200.605611-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250429132200.605611-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dAL5i/4eQ69G

On 29/4/25 15:21, Peter Maydell wrote:
> Currently the microblaze code calls gdb_register_coprocessor() in its
> initfn.  This works, but we would like to delay setting up GDB
> registers until realize.  All other target architectures only call
> gdb_register_coprocessor() in realize, after the call to
> cpu_exec_realizefn().
> 
> Move the microblaze gdb_register_coprocessor() use, bringing it
> in line with other targets.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/microblaze/cpu.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

