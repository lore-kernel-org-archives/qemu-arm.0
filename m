Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3233454lfv;
        Tue, 2 Nov 2021 03:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt/uMH+nuaet4hovwmw0nj8hUQfTvH4kUKLigXt+vvBFZeLN9Z1gaqTj4CxnL6qRyF1E+L
X-Received: by 2002:a05:6808:30a7:: with SMTP id bl39mr4330127oib.92.1635849891751;
        Tue, 02 Nov 2021 03:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635849891; cv=none;
        d=google.com; s=arc-20160816;
        b=YeFJdaBjaCmv2+ncTFM4wryuWuQW23udelJRl593ACLiHhskm6DSXDjwHPNmFMZ/V/
         S5H6nOk1pRTzJkSEBCiKophJ62s4pjHeFrSf5w61VkU3Csea3Tphh2pjyFwZQ3Poulvv
         Dc5M9quJkWdSSeDvROQ1HDL8es0mzhg/ZRkivO4JZdqVpDOReJ/+Qy11S2v0pSIo2N6X
         eAIa2XTFuzUm/sMJFLUNgT81UgtWv5VGYi+LjKHsH48gIn9p/RlWBgqEWY3cBn7YES2L
         8cwgv2pJXsWL/JTzStpmnR8OmpRtTDpoWRd9h0VR+1Os27j1gs+mNrw2qOhlzuEC9tRA
         MLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1YbZJKOp+rxVP+Ro0kYV+vfpuUUpMbR9Ehxm+ZNWN0=;
        b=tC41jaiCPPbOYnCCcHa+4R71NAjy6m7wKgPFlOyZwop/XynMVbNqj/kB20VyuNecPL
         r6SB0x65hF++zzRKEjz/0zKIQ/pcFCg5O1TECu8MSDupF6BBgHHhtDcHpVpFo1hdxko2
         aCQPCEdu7/wHjnuvQWVQNtEDgOL4d1EEtP5qKSA/QqEY/w8ewBeJ5b8zDwZBdCWkFdyb
         eQewTmzz0c9jL4kCtDDXpX69sbCiP9GWylovw4ZGMqoukGm7igQDsq/Llp1/Rm7aFiZj
         OkVb8k8pby+rg8y7cC/d3imkCpduj7eL9CBcWDGRIf4Hd23p2k+fvrGzk8AftVYStzTp
         ESag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pOQF5Rs6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi7si11468818oib.152.2021.11.02.03.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 03:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pOQF5Rs6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhrHf-0007Zn-2K
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 06:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhrHW-0007Zc-Mn
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 06:44:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhrHV-0004Bu-7P
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 06:44:42 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso1499076wmc.1
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 03:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1YbZJKOp+rxVP+Ro0kYV+vfpuUUpMbR9Ehxm+ZNWN0=;
 b=pOQF5Rs6fgoU3yXvhviNb6KdzjOOfiOm7mjy5eCLyabe42kj6LgBWMIwOD2i23fCtc
 3xVxmPFCAvCRjEWedl/qKIhVmgdJ0eovlq9PHzCSCDYdGYkQRT/zfDL4B+HNt1rG7R6N
 hf8k9wCEv8ylWTlR+mZ5mDljJtI7nkXygLjme1FuYyqNP2Az38Ofq/rhNa6GTXG05jBZ
 VDFEppFUQaJCGr78G1OmDN7EnE9Gu666kn9y4rrbmkziLM1lQSYQwal7ZdCjlvvzleH7
 qXMlsZi/s8V2SjOWxe7+TAoJUOioFKUIXt7FtdQPAcOr5iPLbgVAboNznmJwuCQNSSE6
 AUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1YbZJKOp+rxVP+Ro0kYV+vfpuUUpMbR9Ehxm+ZNWN0=;
 b=bYge4ZQlqSQM/c++zXNpKzsd1MKpQWEcR9ctT0bbevyRh+/9VvHRQ+HGs+oomVLfB4
 9UCYAcM7/2AEbIPrD/mcCF4rtDbEKTaNoqooZO9La/dXnrd7tLSUYslIKOU87urlT3pS
 T+E3JN2uGChiDdb/Cnb8or2vxk53tKu8FNSmHMygHSKJwO+XFfvubQPFirSGekQ3Mh4F
 1IgGA313JFDyr4m0JxZf8Ht8UXdmNARlfLRiFcKBctfox4AooBLMbn2oAa3u0KsMTTlx
 Pn0Etxxfo+K16RA0vkMRmJMP4qQfRwaW7caJ+Uz02ecc/+ceMe6yI8Q4k0DLwarUP5of
 jiZg==
X-Gm-Message-State: AOAM532O7u25YnKhYMcMVAf5MnNlX94KLTNGA0/+/YWrxcpDaPB/ST1Y
 yVw9s5y2ag7M0lf/1Jf56rMyq/LbmmDr21rcJ3uIUA==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr6103039wmc.126.1635849879409; 
 Tue, 02 Nov 2021 03:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
 <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
 <3d2a1f82-a32d-a423-ee6c-12a842bbf6c8@linaro.org>
In-Reply-To: <3d2a1f82-a32d-a423-ee6c-12a842bbf6c8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 10:44:28 +0000
Message-ID: <CAFEAcA8VnBS=V9BUqGPHg-mXS975SPCsDXQobyJ7P=AwGLeMhQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MEa/5oMRULsx

On Tue, 2 Nov 2021 at 10:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/1/21 1:50 PM, Hao Wu wrote:
> > Is this reply to a wrong thread? I thought it was applied a long time ago.
>
> Probably.

Possibly you meant this 5-patch NPCM7xx series ?
https://patchew.org/QEMU/20211008002628.1958285-1-wuhaotsh@google.com/
("[PATCH v2 0/5] hw/arm: Add MMC device for NPCM7XX boards")

which has been reviewed and is ready to go in I think.

thanks
-- PMM
