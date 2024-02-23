Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp640544ejf;
        Fri, 23 Feb 2024 07:43:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrv3OWjpl8uuCmnrEyfqu54jLi9aJJs2TuprVJgJJ824ofDcxW3MjWw/IPxQxcK60Fx8+ZLvUpOl6m2MVq4tDYYGesYBtm
X-Google-Smtp-Source: AGHT+IEffnL3qxMOEkcDLbu5l+KBg7l5QDODNmoUDAx/w4AK8bZ2hDNewqfBdvIdnIVpDcrkLztf
X-Received: by 2002:a0c:b681:0:b0:68f:2e5d:5d29 with SMTP id u1-20020a0cb681000000b0068f2e5d5d29mr116325qvd.40.1708702992196;
        Fri, 23 Feb 2024 07:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708702992; cv=none;
        d=google.com; s=arc-20160816;
        b=X5q4MbB0Sreiiks5wGvfo26rzelTkPTx5ZuA/eiYyZF+c+VtV+EL6XJR+XjWkEZrmU
         G0olxbQzp3fJfcKKsVTtIIniwEpUKWj3MSoA40VNbpsi85HPpRjaBgc7wqvohJDdQ4HX
         DMCkOhDK4x0UScK0HAUiM/adeyNFTHWAMOoGQVG8U9FQe+F5dvZ6xvxQDDntPKVjen53
         ZGV/vCx2+FtKj4aqHltftq9HQ8irBjuVFy61WNGgvYIFbPZ6o6BKRLw2uMe0bI3za7ii
         QH3L9PAZErdE0NJ4oI4UMZWa5Q4myXspMZr22wDAD80iF/926Jzp3pBfKQd8W1q/SvhW
         OPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yBUCS7B8iy7ibXpK9yUUdtBoP55z0gbi12cHeE1kR7g=;
        fh=KhV850wtWN4G5xkUxbLw9rvzY40R9RzCzMQhG5cdjvE=;
        b=T12J1QPxkQOsPe990UtWIL/Huexoo/cG+E9nZOAC/ptxdelokrHvufyW8NuMWRIe2J
         d25qpolzHE0Oaccssh275ZctGu6bPVEftL7Gtd6GoMHv5Rd4FvHlOE6u1yD6zwvFsLzS
         BKYmfEGHi5GIJGXQYcOYqHgVu3NKfVg5XLnUYNMfC0BmXrFrvv2rjpJMRYTGb0nCa2Po
         fPTNy6Vo0WkuEDbmb5DRdf0PXybT6XNODmBnYWzMVZx1T9bi++jQYNKDVxQva2yA4m6W
         G+takDgyskYteJte6fwU7mWpWYZHisTdys+ngH8aSAqRstyIJRFgaQq1UwL7n5cprP8e
         5yAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfqZFNyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05621419cc00b0068f9ce3fbeesi6974443qvc.362.2024.02.23.07.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 07:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfqZFNyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdXhM-0004hZ-Um; Fri, 23 Feb 2024 10:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdXPE-00066c-T8
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 10:24:08 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdXP7-0002Wo-8K
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 10:24:08 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563d32ee33aso1154559a12.2
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 07:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708701839; x=1709306639; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yBUCS7B8iy7ibXpK9yUUdtBoP55z0gbi12cHeE1kR7g=;
 b=MfqZFNySox3w1GxCoKY8jc3HoE37XAlcJ6LNQ9wVnvo/CHdwGd5Jmy3KC/SrhcwLZZ
 5X3vk0cp3KzMqBqiXQC7tuDCbUpNV2x8bZIO8auJxJGZoFbx9vtIzYWAfAuwayXhzoHi
 NLiqN71q9AvGZeBX4RiIXnVOr33wICwRyFTt6yqQJkm1monu5VL43FMkxbVM/SGRwPJN
 klGKLdYX6qerjVN02+1F/pTaIpaAUcKNfrfabjYUPf4oH9sM4sRno7/nuN2M3Jhb5I/w
 b+dQ1uh316bKf0FBHIVeXtlGb1o+4eL1R+33TUEj2luyM+AHuAuxrVEDZJ3qQNhYUcXc
 Cywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708701839; x=1709306639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yBUCS7B8iy7ibXpK9yUUdtBoP55z0gbi12cHeE1kR7g=;
 b=fEF7jDLekVhfz7b4rDkaPzsS+or8O29Y3SxhGF6i+u3b38oolHiGbNW5HujMjyVtJs
 g89toQnR9NaIL64PDuSLIq9hDT5WQdq+Wx3GspmCtVhq9UaRyFYdCsttART8Q998uTX+
 CV47RpwegOLNZTT0iN5/fn2CCtHqCnoiR+zLH/0wlHkq/ZGVGxEVRi11lR+m5jKWFgMc
 SIQEdloLLbLlRmXPL1tfLcgmM/3gSz3EjXh+TRALoMijN5bUrj3XLiV5+meD1SNA2sqT
 JMZgxqONcIyKkopB/tzBvMDKbGPXjhU9gn4q3ZVAFconiRxJ9EcG5+n77TtPUap8uBLw
 crkw==
X-Gm-Message-State: AOJu0Yw1akunekmBLFCWbo/nMNKoSbfUYlIt4r0DSYcOeGcYD2GtP3Gv
 +aVwpCA7wwxPvgPK+Z/nCln4Q3Qdz0r8EvKoNXNDxZ2unUYoZSkghd0pYu1dpdS4VPIRxOwrcjZ
 7xx1g//UIMV5LHLyDc+626mNV7UAV/YL7ofirBg==
X-Received: by 2002:a05:6402:695:b0:564:21fd:2710 with SMTP id
 f21-20020a056402069500b0056421fd2710mr97916edy.37.1708701839147; Fri, 23 Feb
 2024 07:23:59 -0800 (PST)
MIME-Version: 1.0
References: <20240221173325.1494895-1-nabihestefan@google.com>
 <20240221173325.1494895-3-nabihestefan@google.com>
In-Reply-To: <20240221173325.1494895-3-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 15:23:48 +0000
Message-ID: <CAFEAcA_peQktO-PHcyEcGZrvDN7_Zdg-x_ZBwJ5OCETE9hBr-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc/arm_gicv3_its: Use send_msi in the
 GITS_TRANSLATER write
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, roqueh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: MmSh4oLcUtpV

On Wed, 21 Feb 2024 at 17:33, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Roque Arcudia Hernandez <roqueh@google.com>
>
> This is trying to achieve 2 things: To be able to redefine the send_msi in a
> derived class of arm_gicv3_its and/or to expose a method call interface to
> inject interrupts from another device.

But there is no such derived class, so what's the purpose of
this infrastructure? If you have a specific device model you want
to upstream that uses this, you should include this in the patchset
adding that device model, so that we have the context to see what
the change is trying to and whether it's the best way to do it.

thanks
-- PMM
