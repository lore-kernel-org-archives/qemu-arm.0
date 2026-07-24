Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CF9C531F9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 09:17:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnC1y-000868-9a; Fri, 24 Jul 2026 05:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wnC1x-00085r-6A
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 05:17:21 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wnC1v-0000Or-CS
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 05:17:20 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66807ba2f0fso128128d50.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 02:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784884638; cv=none;
 d=google.com; s=arc-20260327;
 b=UWgp7Of05LR0Kw8bK07sBwQGbhoA2xusyo2zpr51PPpoaoK2UJV2yqmNTnnt4PH10S
 OrkXy6uSmZNXG2wubymOqgX7wTKivGqCgG40lEgGkhB2P+HgWnV2lNUcLSKIDpcMkG0C
 00fpIxBQS+tKYR8Yn6GaoU/qmIbHZTqKIaxEl+5ZU7rlWIfF2cUgTO4pdho8wqbGF0gA
 DTqxNysOMUQgkQyo7U3+hTRqMldN7HdxIRctu6Zysx3Yi8558djg3VWqhYfBHu9/nXXD
 zn6Icrbym0uxhF7yxsKjFMvZVvuYIQATiYIEN/x40XHynedqSyEL4d6045dQpxxkxkJL
 S2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=irN58mUqxkQZ40ty49DFSyyF3AS4XGCjBJ+Y6EbUU4w=;
 fh=ATIlGTAKRs60+Xh4snqA+VsN9USD1pGo8+zUH04LdSM=;
 b=W3OBklMEBrbvUwRsaM4XhegkADFfwPQOLqmJjD56UXXXmZovWOxXjbXDPh/tClHNv0
 ZKGxIjrVPju7nd/BJC0iF3XZXPXprZEvYrMWbSn3iTrj69vMFgIDnqp03DhSV2BskRas
 hWDymd9Jx5+s6Z+ABGAbyEPxq7TDy/mDfqppQX7iLz00VhBn/4jgOrAWcDcrHt+iGRvC
 +cOuVpmYvtHX8TVjGwYteEtPrebvyWRajp4kvY+AkT61Km3YwMgqZZ0CTQOJhju8o28L
 ChcgvVOkoaLD4Ol4/VrNxWOYVx3xEQa0aD1ueZNnnAgr4kTAFtogu8UOLHJYdfuKhDzH
 TS5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784884638; x=1785489438; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=irN58mUqxkQZ40ty49DFSyyF3AS4XGCjBJ+Y6EbUU4w=;
 b=Gl369mtw7cO0iTdAZe6oF/YZATpFIWk8y1I9J5J2c/BJrLAKVuEKxSXz6GZbazwEo4
 Vdelawi1HTSy5xRHcB77CkH/Ear1IUhS2YINnlLbjsSZ1AwfdAHCWiNRAMZZYKH2btBq
 yrw8H0HKuOatWi55CUe7oN4swabb7+nxA8AG+CNpXFrnnK2NNcb3w0CkKmdRPFn+W7ni
 MS06PJSdFMsjmpX0JGa2HsUze3/R1tnZo6FtVryr4kfgBvQ0XR1F7kDTvGAIpEc0dMEK
 UNgRN96PM8c6RaZFlJGWFPMaKuf8PRm1sanYKoG2jBMuJex3+D73TVfTYUZIpa3z8H8A
 G+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784884638; x=1785489438;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=irN58mUqxkQZ40ty49DFSyyF3AS4XGCjBJ+Y6EbUU4w=;
 b=iUcZYPcdOuN5SsRm11L2LYNFfCAB/pxPMe8SWAf0vzc4tR9YoWkA/88VZfTqFlGN68
 q6AxLs5XhgYMJfmpfm8Lyv0LbPefZkfEvcTrPB6VFciIEvA/it4vuKelfGfDMZVO8O55
 9bAnylv3r2eYHnk9Xn8SvYDAtLslJ5qorfuzsP6TFqfhUnjMvmSLazY+sOv4lO2i64/B
 KY5q4Q+2DheONOzUW0HiGNCjmvsFjj+GUpzgSWB4wZ9GSXsEpEvK2tEI6Zvm2LyETKbZ
 cQa8FrdmRWSNeyPtuR+yOhGUwyJK13mgW3I/JC//DTzf0tEnOgVnRBGmch4gadXSUHVD
 jo1Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoKERrAMGClAKZ11hgMih40OEuIHkkDhhVah54LzmvghGUTYNWviabuKp6xePU5fzccYf6P7rCrUA==@nongnu.org
X-Gm-Message-State: AOJu0YztbSX5cw+wi+nxWicqQCRiJXwlJ3czgPCxYaR6jY+X5dYn0wBm
 oP0hHeRVYGx1PltGz2hyA2nrTxf85FJflXxFvfo/5W2/VowA161FDofK0uIpuLYP66I958uOgu5
 2BIHFfAogjcJfK+ANtn2+yr2GOkib36DYSogMooy7ff5gJPJ/HsHR
X-Gm-Gg: AR+sD13lQadF8+keMsgaD8QD9g1m9itTEsZwAE89bAgZxHw2lPVVlK0BdoJaioBKAtd
 CJpWXvDywuPfv6Qw+LCsCXODb8glYnqMqeAuFzHbYhTgBKaWsxEhHx+63H1g4VG3k9tAcjf6hsq
 kiYp8gIGnfzaTx0idRPig6l5oORmezMsy1/6sVrSVkO174Cxg0OaIzMl13LV34SwtOEXRx/qN17
 sGRsEIO2Oea4Liiw7Zq/HjwIDLP5FmFsyjKRoio1GHMxev99Ndb6LwFOaxAAuNrfIDb18J/9xIo
 PAlQQuh0OhPrbUpiQbie2DbOq3HOc+Snw6fWrpvQHi+m1eXv5JnVhR4O
X-Received: by 2002:a53:b19f:0:b0:667:8014:c3f6 with SMTP id
 956f58d0204a3-668a4f8a3f7mr1232487d50.83.1784884637889; Fri, 24 Jul 2026
 02:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260717174412.88258-1-dingtao0430@163.com>
 <20260717174412.88258-2-dingtao0430@163.com>
In-Reply-To: <20260717174412.88258-2-dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jul 2026 10:17:05 +0100
X-Gm-Features: AUfX_mx7rKkngbGD_RKEtXKHtpJU0t3FlMxkbdrdQQDn7le9W9hxh0DE4PJePKA
Message-ID: <CAFEAcA84shjJhXraFvULN1nODCBmk7GB4UTnBtTVoEBFdnrxtA@mail.gmail.com>
Subject: Re: [PATCH 1/1] aarch32 cpu secure register tcg migration
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 17 Jul 2026 at 18:44, Tao Ding <dingtao0430@163.com> wrote:
>
> In TCG mode, cpu_pre_save is called when saving state and cpu_post_load
> is called when restore state. There are two key functions write_cpustate_to_list
> and write_list_to_cpustate that use kvm_to_cpreg_id to obtain the regidx.
>
> However, during the processing of kvm_to_cpreg_id, secure state information will
> be lost in aarch32 cpu.
> The code in kvm_to_cpreg_id always add the NS flag.
>      "cpregid |= CP_REG_AA32_NS_MASK;"
>
> The final result is that after migration, some secure registers were not restored,
> such as DACR_S. And this register will affect the CPU's access to the address.
>
> To fix this issue, a new function kvm_to_cpreg_id_with_secure is added to
> restore secure bit information. Call different functions according to
> different modes to keep KVM unaffected.

This is definitely a bug, but I don't think this patch is the
right fix for it. The problem is that the 64-bit kvmid doesn't
currently have the S-vs-NS information in it, and so any time that
we round-trip between a 32-bit QEMU hashtable index and the kvmid
we lose that information. The fix then is to define a way to keep
the S/NS information in the KVM ID format and have the existing
kvm_to_cpreg_id() and cpreg_to_kvm_id() functions do the appropriate
thing to convert.

I have a patch which I think ought to do this, but I also noticed
some other problems in our handling of secure/non-secure banked
aarch32 cpregs which I'm investigating. I'll try to send out a
patchset next week.

Thanks for the clear repro instructions -- those are very helpful.

thanks
-- PMM

