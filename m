Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp852462lfb;
        Fri, 15 May 2020 14:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU0SMZDFOEdee0JwCvmDGQPq9VRxCLM/7GlgK714wpJ8Lepi72/Wf1eAMSFoqZ41d6MkQs
X-Received: by 2002:ac8:108b:: with SMTP id a11mr5826647qtj.173.1589577965319;
        Fri, 15 May 2020 14:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589577965; cv=none;
        d=google.com; s=arc-20160816;
        b=YB2+SMhkCb2LDyVGesjsvw3zk3guquBqXEcWZltchggi0WHsKKI7bpslvh5SKwFP3D
         dH+ROIjKM9KApaD/bM0xntuTBZuiPpXoHjeYa0FWMfPEp5r5454KBEXnp+PDl/4h+JAy
         +FjNMM/uEvmi8k9kWbTJuOV0hBEzK5fh6ne+LKptOEB0UQz/ND671xqcC/7wejsZ9KMz
         cW2wnnBZnqNhD4I4ly8EQ6MImqoB5zvy5pHfZQ5Ky2f/4LGOJ6Z0BnoHapUMCS/E0DcZ
         hrhLwKIcAjUkyQxrTlvhPTk4PyNltb4ietLPXbiLSwzsXx4Ro+nWVossM1AMGd97AWse
         oFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dqC1gW7Ev9zXaqHiZqDoUVI45PdxTDsiQZAOzL+z+FY=;
        b=YFLNaVj4h4N41t35D0D+isyIplcz1fqJg8qmRIE5VeCV03nE+6xMoAl5CEgRVcG6N5
         cOPEtHGKhAL6CDrnitoK05TO57dPWjxhxen+dNQR+s3SnU2U06v8KunRjvDSbylTrV6F
         hZdbMlgIg/Nkdo1uzB7PCqWxJr+0t8aHrDepwKNHfqf00vGZ2WnAt5QGNBShM6kG4POz
         zD2GvIk+hjcFgjMpV9AbMiyevGf0NPIRM5NEhtun9q6Z0w0bXa8k/C85uVAcMwXfZfLu
         J8Re+d4ECyFhYzjDb8YpBA63xCx4j/XM9cbioPbwdBlDjVUXwCm+9sPLRMtj+zV62IX8
         62sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QKxRkyAk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d204si1940025qke.290.2020.05.15.14.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 14:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QKxRkyAk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZhqG-000798-P7
	for alex.bennee@linaro.org; Fri, 15 May 2020 17:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZhpq-000773-Ct
 for qemu-arm@nongnu.org; Fri, 15 May 2020 17:25:38 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZhpn-0007td-9I
 for qemu-arm@nongnu.org; Fri, 15 May 2020 17:25:38 -0400
Received: by mail-oi1-x244.google.com with SMTP id 19so3522218oiy.8
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 14:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dqC1gW7Ev9zXaqHiZqDoUVI45PdxTDsiQZAOzL+z+FY=;
 b=QKxRkyAk6KNc+l73aZhIXWwZhWwhtQVnwfpR88ZOeeYs0izMBAHQ/VPD456Mml3bj5
 4hXm46VNBJiFiJAz1vmxo/LuQnzG5AhEX3Sdp+w9XWk6sH6zOt9UNPvFWlecwqGDXl19
 XycRmeNJhd6wnnN3EJZUD7KbpCHW153vhPzdun+lmLVqh3V3GllvU1fFsKl8hctdlNKV
 xBBCTUEmNKWltf80TRP0uGZ3/rdYbY49Hra4OQ+nlHAvJ8uSiQjdvHRyXe9PR94l6sJV
 4Jgrs6BAe+rtt4PY7cLI0jH2ZqacoCWiMAp0Ptj3N6W5ZZW2PPvCAa4NuOBo3mAmfbK8
 hQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dqC1gW7Ev9zXaqHiZqDoUVI45PdxTDsiQZAOzL+z+FY=;
 b=I7/IlhRe/aKoS/nTlK94atf5cfVGWEVA/MsnjWJQ3dLoIW49PRdanaLytDtIgb6tLn
 RRJVGd7KWPIoB7jh+j02RxJUpJ3ejQhJxrs/ztufsk6Zu2I3NHRcaAutkHv9Shn3k3sg
 PVNvckWyYjmWmzTjqan9964yc84ZcadAH9vTX9npl5X4F45yfZ+U64dd+bTLr/vvkncN
 Qn0yyu0sqCZggV7ZTn4nISB8CrJaN3jSgs4mnlGOqN+uCrhXMEYth4e54mFmc36jJQ5W
 ouNYADONzspgdsGhTIFdn5K7z57hVKn0EspRHmMNczUL5/nP+eY8YN3fb+h6sk9cCqjN
 N4nw==
X-Gm-Message-State: AOAM53082kt/tVDhpbTbiJFQNemT3O9iJCNHd99HwYfvg/wdRSza5cPl
 HMwStf4X/QwTCCVQOrm4OBdbIr/3jBUR8n/OsjK9YA==
X-Received: by 2002:aca:eb96:: with SMTP id j144mr3346053oih.48.1589577934092; 
 Fri, 15 May 2020 14:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200507202429.1643202-1-amanieu@gmail.com>
 <CAFEAcA-n8-pOcwovsS1Z3T4AMa1Nueo2yik9zX5H16QAHeE05A@mail.gmail.com>
 <CA+y5pbSueV8HQKQEZnBS4DvOvMDXUY7HMaODNhY7v-fKkJJPYw@mail.gmail.com>
In-Reply-To: <CA+y5pbSueV8HQKQEZnBS4DvOvMDXUY7HMaODNhY7v-fKkJJPYw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2020 22:25:22 +0100
Message-ID: <CAFEAcA8etD+V3KrCFwvqfDuZ0x4_cW-RN423WG13iVpJBRvq4g@mail.gmail.com>
Subject: Re: [PATCH] linux-user/arm: Reset CPSR_E when entering a signal
 handler
To: "Amanieu d'Antras" <amanieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k2+Xb8xW8OjR

On Fri, 15 May 2020 at 21:41, Amanieu d'Antras <amanieu@gmail.com> wrote:
> On Fri, May 15, 2020 at 7:34 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > I was just looking at the signal code's handling of CPSR for a different
> > reason, and I noticed that at the moment we don't allow CPSR.E to be
> > updated from the signal frame when the signal handler returns
> > (because CPSR_USER doesn't contain CPSR_E and that's what we
> > use in restore_sigcontext() to define what bits from the frame we
> > allow updating). Don't you find that when the interrupted code
> > returns from the signal handler that it ends up running with the
> > wrong endianness (ie the endianness the handler used) ?
>
> I actually found this while trying to test the SETEND instruction
> under risu. The signal handler was crashing because it loaded a
> pointer with the wrong endianness, which was pretty obvious. However I
> missed the fact that code was now running with the wrong endianness
> after returning from the signal handler since I had both the master
> and the apprentice running under qemu-arm.
>
> > I'm going to fix this by putting CPSR_E in CPSR_USER, anyway.
>
> You also need to call arm_rebuild_hflags() after modifying CPSR_E
> otherwise the change doesn't take effect.

Hmm. I was expecting cpsr_write() to take care of that if we
updated a cpsr flag that was in the hflags, but it looks like
the rebuild_hflags() is in the HELPER() wrapper but not in
cpsr_write() itself. Richard, does anything go wrong if
cpsr_write() proper does the hflags rebuild ?

thanks
-- PMM
