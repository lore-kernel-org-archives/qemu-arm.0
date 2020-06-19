Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp625824lfm;
        Fri, 19 Jun 2020 07:10:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMNC0uBHlSPuk/Xpxnb7+RGMLN4tmw/eK/GOyCXbkSQU9Z9AXUBk7fhaS+0Fa3BuxjFsy5
X-Received: by 2002:ac8:a45:: with SMTP id f5mr3700229qti.116.1592575841820;
        Fri, 19 Jun 2020 07:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592575841; cv=none;
        d=google.com; s=arc-20160816;
        b=lFUzPitIrvHSELVld148WxcTnINZoBsalqi+7/o+mKsDx4vsYx3NSXb1E0n8il8bxJ
         02Uk1TQ5+etV8VRM2mCvULkv2g8TZTCF+XWUb7t/ljCSOGDXVy64rna/KZYZnlY2USg7
         7upMqW/ijPLPTedUjxajdsDXG2DOFDOjoe9VbB3X2mGRd3x1BNoFNAzvh6HRb2/PAt4+
         PQsZqr1luGWXW0ZzCXLSuIuENHShl7JKl4Sbrl1PxJc+CNNNY6ksEtzchJPc27gbM8aS
         Y86aQJQclJ17Z22wSqImiEGFuY8U/YUWnTMTRDW0M73nd3Ycn8OJzeZwMCfjO+2Lwf9B
         DCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TuBlfcvNjx1ivWXnUZtcurEYZkkPInVj7xpKTT6P+PM=;
        b=j2/FLWS5KUrmSHeLigSrVKEp9BjvJKP/9GWAXD0SOzpzf8tvz6hO0/EHN8uJVazh9A
         /deQZYeKjRt2yG+hB0NyeI7DE7ecoVoiFLA/8zXM4bbA7CUFd+A85EPB933XW262Az2N
         9sxmPsfHOVEazjsWHSND6P892OGqnn43+5DLF+U/A5jwMJH0WdgHBJcrDVIxsoghxyQW
         zc/Zz2GoLfy4V7aJxT9wrAPl3Jz/fsmtIE8kKsXQrGmBWB1iq1vmkyyjxiUVPDmIn8uJ
         EcMfs+doEPPGjchhf8V6BUyDy/y0QfwK8ac+QCK7gC91WOivOvucJDTXqxquC31fVIpy
         xMew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHe5r28j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si1324669qtk.248.2020.06.19.07.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHe5r28j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHj7-0000yV-1T
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHgi-00070Y-CX
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:08:12 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHgg-0003mR-Mn
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:08:12 -0400
Received: by mail-ot1-x342.google.com with SMTP id n70so7356172ota.5
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TuBlfcvNjx1ivWXnUZtcurEYZkkPInVj7xpKTT6P+PM=;
 b=fHe5r28jYJgKXmuBXwMViY+r2hjxoI5LVTNEkJHbNSysmAdPt9wFMRtcnb7Q+9N3PH
 d/OE8XUmaSSR7pd/Ep+GjnMun/MR+KfZ0rRLq9NF9J7NJp5KxcOJv1t4yqTYUCaXgoMb
 Mvdcm3uQndmvRMV71HMOZagsTrpsVGRnDI9S0+gSZf6lRQABPAYd3C62TGfRMTDaJx8x
 R/RDkvVU6eJp2CJumR5XwkayJd0R3Vo020xcM57rwc4Y6bUqNQyg3dxzI5f/8k5dJiTZ
 nX/ofRZcjZD3f+JnO0XpsAZf2x0/hSKCWcX4y7/hyRqvN+usOGy3bhqG2J+H3e2ya8QE
 KNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TuBlfcvNjx1ivWXnUZtcurEYZkkPInVj7xpKTT6P+PM=;
 b=TE51jvLhF6XPilW/NcrwIRrZkQ+6m4QApVqG91RAMQfKf8ZfgJDRNCIfyFbldx4XcM
 me2rpxvpBI+WVZ5MfgGAqOumvfeVB/TtUXjvmG0gKIV3HeQKS+hVlKYk/vOxUKAsWH+B
 QVT3jZCegMIxCppb/xbMM7TMSbNLcnTyictzc4aQVMZEgRtaPDXCfSS9GH8OsnArxmqs
 cfRLEVkugPUJBHShh63HZ2lgQqZNcMUwkmCfjhiZOCn0jy/3rhQ/H0ddc7/mrz0p9qg2
 V+qwbPII/38NNtLMSDsSM2zW8pyXyyp+tmIHGnMz/dCU5J1JenxaJvzUquNqlqSfu4jv
 ezQQ==
X-Gm-Message-State: AOAM531VEaux0x3LySyfz7PQbRUji/HNSTY86fx1uh+pZ+08FqDLBEmA
 MNNtffdDynnqzxbUPpdM9ZS3VrGYiCspwb8db4gCAUhGpaw=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr2991183otn.221.1592575689718; 
 Fri, 19 Jun 2020 07:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-35-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:07:58 +0100
Message-ID: <CAFEAcA8DozK3UT-5yGivNdvMwtm0JHHAgy2VR4LYufosCW6-Pw@mail.gmail.com>
Subject: Re: [PATCH v7 34/42] target/arm: Handle TBI for sve scalar + int
 memory ops
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SgtURHN1J93q

On Wed, 3 Jun 2020 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We still need to handle tbi for user-only when mte is inactive.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

I don't really understand how the commit message and the code
change go together here...

thanks
-- PMM
