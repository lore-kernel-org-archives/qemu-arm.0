Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3397914lfm;
        Mon, 24 May 2021 02:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyAbrHniRlOzaoZIU205CpxvZdML2wsBruuvRbyAf4cOBqHmcXURoNl0GyOi/rSlKXTPOg
X-Received: by 2002:a25:3c87:: with SMTP id j129mr33961328yba.141.1621849360738;
        Mon, 24 May 2021 02:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621849360; cv=none;
        d=google.com; s=arc-20160816;
        b=f6lthojMFF12qgHJnEr2qMRBlzUp3yUdeRsryoE0rySSZwmbDkuYtPFqfyuhhqKi0Q
         jvmHwLyK1LVK9Bv0XxkDuVp9JFb26PhvdrRXJ4NhKnul93YmPZne75YndSKF3myqFI2T
         7JUX9SMudpKmRoS4z6Jh3EPbdPfVld7kajj9LHqnzj6uy0LOG5NcKJ56Q8P6TQG/fx7f
         XKCjZkMUNXk7IsJiaXRLdc8tkhoTMEdyA4sJNwRBZCuXCcTj7VKy003SLsfoh6zhHDyX
         KR6wbPVyLlo54+gZVIs/Olkk1PNyjCQpsPjUxzCAxBRbqmTHSbldox2xKEicu3j9oBPS
         k0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5ONGaH/4OPzry/prSZ2UCPG8A0rU3qiC2X3xVrEjzzI=;
        b=Y7LVzEyCHquI6atR/ivy5PXUpEafQHrf0PRWXcsQSuiK98YMwmP3900/U/KspRcbJG
         XydLvMIgrW3m7fjXTOg3oVxRlZR/oUme5elOL0t/mOxUOv3kPMH8eHBCq5QquMQnmg0b
         hnUDisU14qun9jo6PKA8XdtTTJGaBxRGf6oe3JQP3zWbJeI1sDpMeJ34pQOjqtjyoK6q
         HOg9ODufHDW2nznnPlKqfBuaBu+FD9Xe+sTRi/cyVCJFqEk+a9qqoWZzMu5YDt71NVf9
         bHRGjM6LAShg7It0mIVQuCJlsbS6N6dKRtIDlCqZaQyqoG9g/84XZzVgh1F1So6YOnAq
         I19g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="k7/Q2vEW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si13695708ybk.79.2021.05.24.02.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 02:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="k7/Q2vEW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ll76e-0007Pe-1n
	for alex.bennee@linaro.org; Mon, 24 May 2021 05:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ll76P-0007ME-Up
 for qemu-arm@nongnu.org; Mon, 24 May 2021 05:42:25 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ll76N-0007SD-Jw
 for qemu-arm@nongnu.org; Mon, 24 May 2021 05:42:25 -0400
Received: by mail-ej1-x629.google.com with SMTP id b9so5593904ejc.13
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 02:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5ONGaH/4OPzry/prSZ2UCPG8A0rU3qiC2X3xVrEjzzI=;
 b=k7/Q2vEWQxWOCwWnS5qnhA61/mLJKVWyJVWLdjnL7sh92QKO+NExf4kMBCN0ysyzap
 DmvI6am5JpdFTI+Tm4I3mHK/vc+sKb1TdwvVd9OjQbbLxmVOBj928rEf+Vlj3aRHdp7U
 F0sgJsy0Zo+5nMghb5BKCbyJBxgfTppAvI4zYVEsW9pXUQ9Z15evYFzpMogtglBFPZHU
 BCSbhGuK8oSDZrdDk6xyKSrYibRrzbjWzRmys0GnmAr0GTREerHy8drQtxGD+Qu45/ok
 ffAT1irnrr5PhpbewhvVfs8kpGytB/C8Ir0G9AOHkoi9tFY3EJ3eUAXtl/Jr/9snZf6T
 fJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5ONGaH/4OPzry/prSZ2UCPG8A0rU3qiC2X3xVrEjzzI=;
 b=OdyOAjAxlM1SHFV+rpuuECCIuojFl6jLslRqow/ePv6gVkcoFJ+QBz+sVATBhbP39T
 KeeNy6js/RHdJq6VrngfistiG0Bvdl4IFTlOVD8m0j6hNsJPovgh1g0puj8ely1/ibnB
 lnXnEEp1d5NTOW1EwSLEJSHh6l4cbuIPjEPSeEA+Rs/zrBwzN/vNEPp7w62Y7XMsBiPR
 DaUAfUxk3vXyoZYY0+3lf2ZQGl9H+4GeI2xEJSnC9r2nGQYvCNPt7GjjUHguO+lIKleL
 Opcuh9v5BkIdvCpgQQHT02etLDI4pOZcHBL7Uc7gS9sv15mbhvPJ2+q/IpJsy6laX0y+
 0j1g==
X-Gm-Message-State: AOAM531oGHy3K294ua4sweU/efhZltPKOUcAJ3o8aOjyjAYblbVnh2SA
 RY0r7YE406agAdW3wbXe9J8dnk2MAh5FsxnBfrRZ4NHzwYc=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr22606123ejb.85.1621849341571; 
 Mon, 24 May 2021 02:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210524084201.1665973-1-jamie@nuviainc.com>
In-Reply-To: <20210524084201.1665973-1-jamie@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 10:41:58 +0100
Message-ID: <CAFEAcA_AZGK6yKy6FN=YfVC=OMdpQnDBz=nndKaibDLRXk2aDw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix missing exception class
To: Jamie Iles <jamie@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i4x/mscYYmJ4

On Mon, 24 May 2021 at 09:42, Jamie Iles <jamie@nuviainc.com> wrote:
>
> The DAIF and PAC checks used raise_exception_ra to raise an exception
> and unwind CPU state but raise_exception_ra is currently designed for
> handling data aborts as the syndrome is partially precomputed and
> encoded in the TB and then merged in merge_syn_data_abort when handling
> the data abort.  Using raise_exception_ra for DAIF and PAC checks
> results in an empty syndrome being retrieved from data[2] in
> restore_state_to_opc and setting ESR to 0.  This manifested as:
>
>   kvm [571]: Unknown exception class: esr: 0x000000 =E2=80=93
>   Unknown/Uncategorized
>
> when launching a KVM guest when the host qemu used a CPU supporting
> EL2+pointer authentication and enabling pointer authentication in the
> guest.

raise_exception() and raise_exception_ra() are supposed to have
the same semantics apart from one of them being passed a return
address. So perhaps we should look at trying to fix this by
making raise_exception_ra() not first carefully set and then
very opaquely unconditionally trash env->exception.syndrome...

thanks
-- PMM
