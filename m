Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp926417ejf;
        Tue, 16 Jan 2024 06:59:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXu894x1WywinT8O5kG9Ct6lkXnYIe/CwZFN88yBW95zFLZYAAaJM/U7OPppp0JfTbkkoF
X-Received: by 2002:a05:620a:4ac1:b0:783:52a:2597 with SMTP id sq1-20020a05620a4ac100b00783052a2597mr6736137qkn.64.1705417195975;
        Tue, 16 Jan 2024 06:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705417195; cv=none;
        d=google.com; s=arc-20160816;
        b=r1p+20ARnvoj8fZG7DXVhCy8eiQ18+tJwLeYD8dwBHUIGCyU1h2YpX4XFI/rzkcflR
         ZgUOorKxg3P6I2AZRe3x2QBa3jaChUkvaN8Tbfv1k8eBWHeI3Kd/g6YfxDp97tSNIKlC
         DJOfRwbs4GYaGW7bmBfcH0DqdVnGaE+aXeFSYdRWft2E8HG8QU0Cg0tF2KeIrTMJ7T+9
         xTLbkm7dO8kIxadwyagIlEtgjC9PJJYtm/f7eyRgGuDs7WrdV0KIF2nFrB2kxvgM7cKz
         MCweY0JbT54vpza2K+m6+HHuKxq4KM5URshRIBT5HvXPm0iJxIul8qUjtjzsZlUMmvTq
         ksQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YrJ+VmxwgbKzw3XkqeIfss4FMWzAgprqMmIV3Uk7Gi0=;
        fh=G4ej1JnN8P6fgAZk0wPFnEOwbCZSOB2m6YxI6BipXl8=;
        b=cpOc9h52y+i42eOD59HXvXWEqtUT+3bFccSJ3KvG6ZloZ708Ku0FioAL6jC0NGdzM4
         yomurRMlOsOeMBbZeiCy7eyKRST7w8k/MF1e27hjn6dGGBxzmizeHeWyKUAxvcMraaZi
         Gf9YAP+ldLqmaTmigGAaAo3SgbvfDIFIJSsYUjKgUb+P8x+Kgzdyjsi7VWNTNCdrHMv3
         AGupgzessM5hgjL34UeQJ5HOm0yqNDDKrB3/WkapGSqp/82CByevGt48Nl/7HwN0g8Ks
         P1zKFIyomOVdkYiUkL9xo+h76hswf1gPiwzyCwWpWLkho4Od1GnPxjMqjgQMMm7NP1dD
         x2PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RfMLt3ks;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj1-20020a05620a190100b00783363d74d9si10265375qkb.76.2024.01.16.06.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 06:59:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RfMLt3ks;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPkub-0001tD-5K; Tue, 16 Jan 2024 09:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPkua-0001rw-IS
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 09:59:32 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPkuX-0003M8-59
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 09:59:31 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-559533e2503so2413095a12.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jan 2024 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705417167; x=1706021967; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YrJ+VmxwgbKzw3XkqeIfss4FMWzAgprqMmIV3Uk7Gi0=;
 b=RfMLt3ksHbojJEIlbqBcNmrnu/xOWOTai3skG+Q9BJh3C8bU3Mwez14iYZdcMW7ZvZ
 gYv7VOKc+CybZmw282bQkV/cP+PYFLT4KL9+nhfMfE1qSlE5KgZzqS8syu23aTj0ECE+
 VzNQUqIOpeIiWb9LXqecGIprAxUL+qAx417ylLJr8bSCWxk9Mq9I1mM2rlxjnDg+BNgI
 KOu48jz6C9sA8O/IMk6bgkQeQTx1jqydJtVdvFvG1xAKrnh84XbesTcwlG4r+BvmA+dV
 dYDEc3eV7QY1e3DUtrBvYx42DRnSxbrQ3lqN2mf+s+85Fkr4/OMsbaWsJSqhNbv/Wp0G
 t/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705417167; x=1706021967;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YrJ+VmxwgbKzw3XkqeIfss4FMWzAgprqMmIV3Uk7Gi0=;
 b=q/qBRUwWxkd7LKKEpHL6GsMSHeb3b9nes9jGGW7U/9j61hqJtQGbJIJOzLvRg84gZs
 AvW7TjSaOT6Z0RYCuYjMwjJaE4/JYDHki+L26f67XugVBJkj+pZquRd98BMV8hkSA/J7
 jBHC82f5mUr+77v9YzCeSiwmfiKmnr0DbMoWUhx1Ci3O51LEE/EJhbgn7VjG99qql9lA
 xIiEH0MRQ3O0U/Hc5p1dnFequ+ysJ5Ag86HnxVlbWzJl5IH7jrOfrvI9lgLquBuwuV18
 PAFnSHRPYqNwpNO2+8/+mir8oAHQHzBviHvN94dwl4MxD3GlaRtRR0nI/SMYx3stat0x
 B3uw==
X-Gm-Message-State: AOJu0YwDoanpkEFLRFdZFj5JoHit52dM1pCylG5ZIE2IlBIFXeBVtlF7
 akvnHo7HEh1K8PmG8AZ1IKqouSTIYw93Hb4bv8BPDroJxO+gvLHkpYrs8umc
X-Received: by 2002:a05:6402:31eb:b0:559:bdd3:80df with SMTP id
 dy11-20020a05640231eb00b00559bdd380dfmr278031edb.45.1705417167403; Tue, 16
 Jan 2024 06:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-28-peter.maydell@linaro.org>
 <20240116130940.00002523@Huawei.com>
 <CAFEAcA-94-TeFw4AmTsuQaJROADaet8aWDEBXbt9H_gc1Fs6pg@mail.gmail.com>
 <20240116145051.000004f7@Huawei.com>
In-Reply-To: <20240116145051.000004f7@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2024 14:59:15 +0000
Message-ID: <CAFEAcA8=CK00w_Yk-X=+6cm2X5BWSiTw7_y6uQN8qyFHF4-iFg@mail.gmail.com>
Subject: Re: [PATCH 27/35] target/arm: Report VNCR_EL2 based faults correctly
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: 76BivVHqA+qa

On Tue, 16 Jan 2024 at 14:50, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Tue, 16 Jan 2024 13:20:33 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > Bisecting to this patch is a bit weird because at this point
> > in the series emulation of FEAT_NV2 should be disabled and
> > the code being added should never be used. You could put
> > an assert(0) into the code in translate-a64.c before the
> > call to syn_data_abort_vncr() and in arm_deliver_fault()
> > assert(!is_vncr) to confirm that we're not somehow getting
> > into this code for some non-FEAT_NV2 situation, I guess.
>
> Not that, but surprisingly is_vncr == true.
> in arm_deliver_fault()
>
> Frigging that to be false gets me up and running. I'll see
> if I can figure out why it is set.

I don't know if this is the cause, but looking again at the
line that sets is_vncr I see at least one obvious bug:

    bool is_vncr = (mmu_idx != MMU_INST_FETCH) &&
        (env->exception.syndrome & ARM_EL_VNCR);

is testing the wrong variable -- the first part
of the condition should be "access_type != MMU_INST_FETCH".

If you fix that does the failure go away ?

Yay for C and its very sloppy typing :-/

-- PMM
