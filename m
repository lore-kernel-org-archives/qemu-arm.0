Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1290081lfq;
        Wed, 6 Jan 2021 17:13:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxenpoIUUNIRz1vinMVu7mWelknRze8kJUKFG++Yhhql8jp+TdNiVkBH1nA7VfWYuXET2Mg
X-Received: by 2002:a25:9906:: with SMTP id z6mr9660912ybn.238.1609982032279;
        Wed, 06 Jan 2021 17:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609982032; cv=none;
        d=google.com; s=arc-20160816;
        b=ASS7JgWDyEMCJsbMyBRYBY+DRgGOAeEfq0tlzVC5I6ZwCCgEcZyovUBUdCJ84PcUwC
         nQsIj45Qdu7b9vEmaGccp4AhNB6YXrx0VfzoaQUCGLS/cQHoEgpJSK173nSZ/LeHHrfZ
         tfhvhQhD5hpApoCkTShSK3tAE/WA/af5GJoiCMVhomDcPYNAcbnwDx82l7f0tZLA6Cq1
         URLhY7wfsF1ANv9tANsZLL0qiV6HKBHiG2+upD3MK4RxCF06IC1vzrxWAAjScGKpoCGE
         U8GYIhYx52u1oDJQqlcGs94Vn2J3TqhUrQ5g1M9CBCzEwy5h37W6Y3bcLiSiWz9KzcTV
         zViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBp6wbOMOwhNQ9exUGCC8ZAdUvgF9coi+jYY4k9Amfo=;
        b=vRz5CmfotOB/eVOIPzxQGVu9fU/Du8AV7JXAhbDP/OfcJtAvnAhII/tVujxrJBI+Y+
         xK1qIoFJUxectozdpT4QEBThd1Ry05WsfEShildveqOcEv5lW1x0NAZFV5sJrLW6VU92
         eRNdjij687CBNN8f4FC2YhAB8H7Wl+aM6C0T1ntThibcdvMNdCJEvU4PHxmHWJUHJ2yD
         IZOUPFDgzuPULXdQrgY7IfEMBUpTVCTX7lIdsxwsvkTp2koDI9xJHoZ2oqDnyTvo+qTh
         /dyKxQubop1PP7l+c0J5JxBCLQKVEL4fQYYwXNSpZ8qy+4GcMSzX5N/82df2ItyG/YoK
         z3CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JcFbTuH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si4488387ybg.285.2021.01.06.17.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jan 2021 17:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JcFbTuH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxJs7-0000nx-Mz
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 20:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kxJrq-0000b2-3K
 for qemu-arm@nongnu.org; Wed, 06 Jan 2021 20:13:34 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:37992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kxJro-0002hy-8S
 for qemu-arm@nongnu.org; Wed, 06 Jan 2021 20:13:33 -0500
Received: by mail-il1-x133.google.com with SMTP id v3so5171911ilo.5
 for <qemu-arm@nongnu.org>; Wed, 06 Jan 2021 17:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tBp6wbOMOwhNQ9exUGCC8ZAdUvgF9coi+jYY4k9Amfo=;
 b=JcFbTuH6tjF8wYqRRFbF/UtbnEXnz35V5p/1W6ToIana7qdO5/zlGYQEnhfT0bJVjf
 h78WSHYChk84wfaXJcTP96ZjQda6imHp+L3os7CX439/PCJNnxqYfMVEwFi6HMgt0WaH
 V+M50FDZU+JmRI2HHmzKYoFyrvq0yycoXMUK67n69TU7Z6cKAXIcJUk4QiRoituh2VGA
 /LH2YqcEHENgdm/2mgZa5zLoznQEWQkuz9H+hmp5+0cMGgoVLS+rAkv+KqdkR6/4RV5A
 2/hNJhBJq5wvNB5Yp2z/Hz2kzXiW5O4NgnmzOF5B7tHLCX4xauwIf47sMTc1Lpz2n4Eg
 mNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBp6wbOMOwhNQ9exUGCC8ZAdUvgF9coi+jYY4k9Amfo=;
 b=LEIe6TF3h1CIlPCdZ3RWrtiv2Nz4jlys64zIQzkmKUpV+khkiUEdwLq0Ul4+QMgX4K
 0ZpB8W2e25yx2/Bd3+aU+/a/8amcXcqEwOGqoonZDpAOQN0vZ7P3Jc3SAnN40Qjita0O
 fM2r19HOEfWGcDdhz/dOTQaU16+nx0QdTtyTzOXLI+CLlnI6XaRpdouY0JhQoNWYrn+9
 jUWY/+nRSa04h0rJ0v3ILxa1yeQpeZhGIPodoGmg3gW6BSB+PnPlEUYvvFHmCmgmb/vo
 OtLb5TuVPwW2pCRNuYbIu1Dp9Ys7zwlJNlpBMQ0MgWealQBgrEMTxqTgPoADxFQXdPdG
 2lpA==
X-Gm-Message-State: AOAM532OKVTWZ6EdAYsKDTU3CVkucZWMq3YzrYX1Nh48aa/9dI8v16YY
 /svHtO3BQ92iJsS5JSGhKNDLZtELS0IhCItM+wOP
X-Received: by 2002:a05:6e02:c2a:: with SMTP id
 q10mr6791177ilg.92.1609982010187; 
 Wed, 06 Jan 2021 17:13:30 -0800 (PST)
MIME-Version: 1.0
References: <CABUrsp+wLFdSDPrHX66gQSXyk1GKS0M29x1g3sOw0UBK9MOe2Q@mail.gmail.com>
In-Reply-To: <CABUrsp+wLFdSDPrHX66gQSXyk1GKS0M29x1g3sOw0UBK9MOe2Q@mail.gmail.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Thu, 7 Jan 2021 09:13:19 +0800
Message-ID: <CAJc+Z1FdrRmYrG5xbjqeUTbwXx_FK3Ee35Nr52527QM5mh2fNA@mail.gmail.com>
Subject: Re: MTE support inside QEMU?
To: Yu Nexus <yunextus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xzePfIjGb2mz

On Wed, 6 Jan 2021 at 20:13, Yu Nexus <yunextus@gmail.com> wrote:
>
> Is there full support for ARMv8.5 Memory Tagging Extensions (MTE) inside QEMU?
> So is this MTE example code supposed to work inside QEMU? https://www.kernel.org/doc/html/latest/arm64/memory-tagging-extension.html

As far as I know MTE is supported with QEMU TCG mode, and the KVM mode
support is still WIP.
I have verified the MTE example code with Qemu KVM mode(patch still
WIP), and it worked well.

Regards,
Haibo
