Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C37DC4451B
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 13:51:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkixy-0004pg-Eg; Fri, 17 Jul 2026 09:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkix9-0004Pz-5x
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 09:50:15 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkix4-0001be-If
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 09:50:09 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-80e2cfe6918so37404727b3.0
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 06:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784296204; cv=none;
 d=google.com; s=arc-20260327;
 b=gsIRUAWKRtOUZ53qS/QQygm1CAcZSEP51p5OAALAE9eX+tNJrTiMHKrkHd0njXWpaB
 Ijky3VSuE8rz6DKl5uroXNaid9lYWeboAx2mtj+gAUoZWUrZSUOfNaVvxm7R4IYB04Uk
 LWpqiLvxV4PgG2nsWnqk3NX5+SoX1ag83nUhieXQJl1mNfDEQ3CERZbvy287SDaD7Rp+
 E5dHYfGBIWB11cC/Kjeh3VcAvJ/y6m8HPjz3R2txCDw6WoOCJgmimr/t1D3Rf9z+DWSd
 /FhVcaKobGDF1q8pR2+tLw+tehCXefA4tYNSSJtBpNTEiY/aPhyyyYN/ZMNvraaFRwDO
 +RMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fbnd4avmCZuarZm8evJ8GJbSYptpIMj9ydyywnXY8to=;
 fh=bY8EUZmpLheN8NonOFVpBf1DxNt0QG1L5scbWlt5NyM=;
 b=abtg9F83Hy87N5jSqxtIoqoHUiHyDAUowDd+oBnB47Qyu0lj8YaqpBO2iC/HSFVh3k
 /7toXei6NP5STPj2G3nihK9qa3gGoJTVar52gwxvTH85kKQAXe22N/BKQNM6lPxo2Del
 pi3IdRoZgnS98Zvcxrmhsj7DbtgYuaQi9/hxOdfM2GjLuJOuqHB3VnCE0Tsjg/mlRUbD
 YfNXL6yoVVDmoixQyecGAUrZNXs8Ee5H6kTa1Nc9ISC4eR5tFQt1MnGjZV2Il6L5yPzv
 Iy3Dw24S2KL5jzTBh62uTj3HOnD8KVnI44mujygt4k8xuqdbDHxsGmfTEF2N1R5yZ2bu
 g05g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784296204; x=1784901004; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fbnd4avmCZuarZm8evJ8GJbSYptpIMj9ydyywnXY8to=;
 b=s1jdsyWFuW8ihwPa7jkEZ7t7kcjiGEE/4L33LrfFA4y7pGPRVIj1Ee/bwqD9w0gYes
 4C7+crLt1l9GuRfl2yIOVTEWJOY2V9vlgDXGcU0pD3r5pAY+3nmThhwgWW0MmR1PPe91
 4/mQAQv1b/0+7vHiUVCM146lxsRJK8gZ9plBe4ial4/+cI6/8ewpvPfR7KBZcDmlZt0x
 2Mfu4YhVwtAARlM8biZOBU5qnqDdfGSIoaAg/5v2vdF1PtnA5ScpDJQKcE5NuBdg94VQ
 Z5kluJp5K4d1UY8Yqjgxk8vpUc6e+o0WV84jRkZXT3y4bdOXu6QSRR6iVjROOfhbmXUo
 YCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784296204; x=1784901004;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fbnd4avmCZuarZm8evJ8GJbSYptpIMj9ydyywnXY8to=;
 b=K3CdM9yqMcYL8fJizo4CbUmUCBbbht4dgFupcedSFv02bCPlBYtpohKWFYNmCL+n4h
 s5kchcUTFWq+n0H//gacBSmKgJrEdRS3ZLIJmT8g04qjvJTltCazEwLjcVmKgoghHIP7
 vNvnXfrjQ+cAVpeoz9A7hw1Honr2MGZTy01rgit/ME8GQKVh4bBGpR7BneezMui796H1
 wlL7H0uCg5afeXJokmHmCtmbpjNJfJJsPYTASxLUIN7mlMcwhKeoeJ0awJ9pwQTWL+nC
 lXp4YGB5IsecMIQ5f102iN5jxOOapHYKKSUW0cocZFYYqoZnpmcZA2FOyqB6U6Z/8wGG
 r/kw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpk4DVwflW4yyM/cz+R/4aQFixMgSEC9lmbjz9J5t+6M+cYbp4mBqNnGGES4gWP4l9T0ut7EhlKSw==@nongnu.org
X-Gm-Message-State: AOJu0Yyi0fr/HRrCsAnularJGk5sa6BzgDx3Soa6q6h+SDOYIu0eOk94
 Ipy2S7MbEbyGeC292H9/zqpd15K8nHEm34neK7SYe8yTQPfQ+0MuWgGggcLp145sFbmrJ8UrXBN
 xlxEuLNugBXgRnHuITvZL821kLjqNDRy/6zwMt/uJ7g==
X-Gm-Gg: AfdE7cmo+3WvNBu6GI0M4L1kuqOU8uJaXDH7bkbzIySCbU7i09gaGBaZ5bhHuBvx2A8
 0aVHjiFC7+BKwQhBaYw/PskokuxfIY6htaQPIYfNYioCjKsSm60Z3VcYx8CxiPe5vGz0TMjxv/I
 OOwt+QhMXLj1EzEUo631RbY8+tELidaSoErbL2CmYjyLGJCjEum0ofJrVzq8ffACz/iruxa9anf
 cM2U/wxtt3ijNca7DPM3nEmNeyjB2GQcXJ2imdMpAhAAj1RTCtGmzQnK9LSO4XbzzNGQnjdoM2b
 i8W11DW5wIigt396xVWRokw+BxFdPv9Fm/f1eLmHRwHfug==
X-Received: by 2002:a05:690c:4801:b0:80c:85c6:897f with SMTP id
 00721157ae682-81ef263285dmr8165487b3.62.1784296204492; Fri, 17 Jul 2026
 06:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260625070551-mutt-send-email-mst@kernel.org>
 <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
 <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
 <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
 <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260717091756-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2026 14:49:53 +0100
X-Gm-Features: AUfX_mzSQyLYQofBBh-fPCiowP3Wl9A04pifrBGZdwvQ1aWJUo0gu2VipGSTwAQ
Message-ID: <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, alex@shazbot.org, richard.henderson@linaro.org, 
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com, 
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, 
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Fri, 17 Jul 2026 at 14:24, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jul 09, 2026 at 07:52:12PM +1000, Gavin Shan wrote:
> > Hi Michael and Peter,

> >
> > Could you help to confirm if the conclusion is to have unified qemu_ram_{copy, move}()
> > for all architectures? In qemu_ram_{copy, move}(), the fixed sized accesses like
> > 1/2/4/8 bytes are handled by __builtin_{memcpy, memmove}() and fall back to
> > memcpy/memmove() for other sized accesses. It's basically what was proposed by
> > Michael :-)
>
> No. __builtin_ and  memcpy/memmove are same on modern linuxes.
>
> I'd say as a 1st step, on x86 hosts we can do a fixed size
> memmove for 1/2/4/8, on other hosts
> *aligned* 1/2/4/8 bytes can do
>  __atomic_store ... __ATOMIC_RELAXED
> and the rest can hobble along on memmove
> and hope for the best.

I don't think we should be doing something that's x86-host specific,
as I've mentioned previously.

-- PMM

