Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp491322njb;
        Fri, 14 Mar 2025 03:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcCVt+lU5XZgfA/OHXbqI0H0dEIRUcC6cJmAi5FvyOJQWNJABOPGQm4PxpgPVLoC0N1pQ2uX/av+5UsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEDaWxr6HvefCZPV8ezBMXrNSszwu7XkzrqvkrX8lqW9ufp7e3nCPk+yKY1RW3yG+MOL2K0
X-Received: by 2002:a05:622a:1343:b0:476:76bc:cfc4 with SMTP id d75a77b69052e-476c813e54dmr28513751cf.21.1741947824523;
        Fri, 14 Mar 2025 03:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741947824; cv=none;
        d=google.com; s=arc-20240605;
        b=Lut6e/PPe/1ln5IMRTewhJZJJt3jGqH84UHohKBOCCWr2+hUPhpQuUeUmI4T03qb5V
         tJTCclURsqqVbGsTMnZ3aJF7WDgOXjEciZLMa4nB28WzxnZ419v+dJAEwKF2gsdhsKGi
         KBQ9IfmPBdVPfZGt5S3bSJXdKk3bnyaPlI1DotWunDR7wfbeW2kbeCzu8ZscbDb+1DXw
         AcqfGCOpfTQT5FO0MjvG5usLu489cY2BQr81rchL04fIELfXOH3VMdC8eUJKVL5PDV1V
         cwY0NhTwOHcXIQGv8hIw4JV2NDPiyK+prk1B7cPx108yIVU0JM3kSXP8Gjeidx3NhYPX
         x84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OYkiyS1XYmvyCyxAfD7RScZbhCwAx/jD+RBZEwHgFeg=;
        fh=xfLRi1bVOcDiTHpTBCG3VH9PL3Flti+ixtwq+IIgBTE=;
        b=VYCCxOSHiYtx9fGNm+8oAaeL7ABiHYB3nEH++nsAyMsrrjhXF/ImedAC/sLEGTB8f1
         6AVRT9oHkcSJSAun7wUau3B/lUQFv8qFyyeiPJ9MkPClwRMiywcq7Jv3FGNUVOp/QNQT
         zdvD2omwlJRGCfuhEPai+bxrAcd1OBPMukgmURSS6qE1NX7D5gCsyzwB0ewT2T8EPFBk
         9U2+2wHa+hmvvlQWLoj0dQXcEAde+NtkPExE6BbDIG0SyOBci09pgC1bgAxrqH1BZHFL
         cknJkkN3a646gbJGjLdeyF/8YCZHmzXWCuGC4s18stTvGBAIsj3gHRSEnpybkaW1JC/c
         DcRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u66VO1Wx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb85d6c1si34150751cf.581.2025.03.14.03.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Mar 2025 03:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u66VO1Wx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tt2Bu-0002Hb-Rt; Fri, 14 Mar 2025 06:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tt2Br-0002Go-NR
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 06:22:55 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tt2Bm-0004VQ-FW
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 06:22:55 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e46ebe19489so1627960276.2
 for <qemu-arm@nongnu.org>; Fri, 14 Mar 2025 03:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741947768; x=1742552568; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OYkiyS1XYmvyCyxAfD7RScZbhCwAx/jD+RBZEwHgFeg=;
 b=u66VO1Wx6SD+99QiT+EsDUhMKsq/KYKmz/N2EGWVojRxexWsPXZ3j/uLxzMhF6g5Uc
 YFAjF7y/Nu1n4urMjICOvb+WWDTw3dGq/LvHUz4eU//U86e0InFrKPNQVXAgf05UAr3D
 3nKuI9/Wa8SZJ7VFEe/7/ngdPNlKDbL7G9wd7Suw5h0SttXXHJVCz/vAILIKc6L3cCXN
 19nc9GHYfRYEEU5+G4tOzAMkhwhPgz+oCuwoCxqG0OMGHphSJCa3G+bbekASng8M8FMT
 XgEyHEzElvyh6UIFc0d7CgKgQrZPeT9dAdSnpyHjPxIppD6u8DIbdIDQ6D7/EMgEwifW
 1PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741947768; x=1742552568;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OYkiyS1XYmvyCyxAfD7RScZbhCwAx/jD+RBZEwHgFeg=;
 b=qifSTNRBZ9PsJX0wIkRlAjoMb9qLZa9HRuZYDR8HL4LcMI7rPSzAuimmETxqdxi6Q3
 Gxaiy9QMq5jm4I8pUdTs6+pZMEC6+oL9pkrqkrEg4ne/cyECh1wUZ4yCs3dhEMXbLp04
 9iDoXVfi7rvEUC1k5udCrdS6i/RYutmjDwPkAoD6pfibo476xxOlxdax7B/u/hjKNKt8
 AZZ5HEV/8+y0PegV603crMgfQgQyzbTELZAZ7L4K4bjzqgSWV9tdkKINAQOxSzJtnt2t
 1x4LsEFw1je+0CQuCfJQNu4/DiAGcAlRDrYYl2/uDg15z9ixVQwkfWFZ4c4mSPmAOYOT
 rKaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRi9DOiUJMa++WOaaLXkBr6KFVdILKXG9qN4JoZKYYCn3eob6jNLvbDxenMyu+7BLmca//VcK9WQ==@nongnu.org
X-Gm-Message-State: AOJu0YyzjgyhbTGedxfjQzcDrbT0kSgFJN+O2rQqy6kSEXOqu/rOq5OJ
 E9zigUIw2/DkbAWkC4LWofz0PumQcwPZ8nj7Ff+OPhjbwZsAZCUEK3TdPsaOEB84HJL8g60U/fd
 Bw90HrBUisI8f05sqxHk4GqY5z9qfEa324Dp6YA==
X-Gm-Gg: ASbGncviOCFH8YWFbaYBAet286Y2hjMsIElnq44JShoqX5YMCXldJriA2m/4BzGj7vO
 u2dKne4p0niHT+QJZWM5a8v/DYhVQDNoulAT2tFGsomGpq2P+I/NFQkW9pAP+SmLbIjdpcuX5wf
 6bUxPf6ssit6zP6PFyMrfLDXYNAH4=
X-Received: by 2002:a05:6902:dc9:b0:e5d:cdc6:7acf with SMTP id
 3f1490d57ef6-e63f65c5536mr2198074276.31.1741947768624; Fri, 14 Mar 2025
 03:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-clr-v2-1-7c7220c177c9@daynix.com>
In-Reply-To: <20250314-clr-v2-1-7c7220c177c9@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Mar 2025 10:22:37 +0000
X-Gm-Features: AQ5f1JpDZDzemazfQHx8KWpMLuRQEyUsTllxky7nainhk-4kLNIz4ejJ-itnIO8
Message-ID: <CAFEAcA9yKETtDhJroC7RD5itUjsYAkj0fVXHJaUxoU_bce7Gvw@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Define raw write for PMU CLR registers
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: 6aKU/VOnOtO8

On Fri, 14 Mar 2025 at 08:13, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Raw writes to PMCNTENCLR and PMCNTENCLR_EL0 incorrectly used their
> default write function, which clears written bits instead of writes the
> raw value.
>
> PMINTENCLR and PMINTENCLR_EL1 are similar registers, but they instead
> had ARM_CP_NO_RAW. target/arm/cpregs.h suggests this flag usage is
> inappropriate:
> > Flag: Register has no underlying state and does not support raw access
> > for state saving/loading; it will not be used for either migration or
> > KVM state synchronization. Typically this is for "registers" which are
> > actually used as instructions for cache maintenance and so on.
>
> PMINTENCLR and PMINTENCLR_EL1 have underlying states and can support
> raw access for state saving/loading. Flagging a register with
> ARM_CP_NO_RAW has a side effect that hides it from GDB.

No, the CLR registers don't have their own underlying state:
all the state is handled by the SET registers, and it just
happens that you can read it via the CLR registers.

> Properly set raw write functions and drop the ARM_CP_NO_RAW flag from
> PMINTENCLR and PMINTENCLR_EL1.

I think the correct fix is to mark all the CLR registers as NO_RAW.

thanks
-- PMM
