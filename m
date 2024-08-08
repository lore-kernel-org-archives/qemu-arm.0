Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp424744njc;
        Thu, 8 Aug 2024 01:48:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOS/AUt72S9RTmwz8z/INHISbl/2vKeZxwL+Rut65Q8k3cPmPvhf/k2hba7tYaKsKOU73IJo1Zvyay43UGYr9RQeIKuDqn
X-Google-Smtp-Source: AGHT+IFfxiQZjRpgtFxnpPmwJiXqrH/P3Dz0W68U3+jLttU04RDSRn1OeQwKtRVV8ad93+aDi6Am
X-Received: by 2002:a05:6902:2e0a:b0:e0e:4350:d7d6 with SMTP id 3f1490d57ef6-e0e9daed1c5mr1219218276.31.1723106922837;
        Thu, 08 Aug 2024 01:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723106922; cv=none;
        d=google.com; s=arc-20160816;
        b=MopTBDhUlIdlswVjWCCejienvVw79dXY5UdU5DzaQnRmLO9BaYySWUiZh9BZ4k8ih0
         7X6sLnIH2OzXua1poXvJfB8UZSaUz+07nyvnX6UU/ABYrsgF2NdaBPGgJuXpgrMVnSV/
         7UXZIMFnJeUJBlH7ufPojOkv/zS9dVHkzxffBGSAXxwklbYOs09R+9VyWwqpdyvGQbUN
         Q3SO4VkJSfNEov4632RJJbopHnyZRrVZxGgmeMZ1u34RzXJtmOpnOvO6j0vw/vRJP8g6
         uvLTpcgKWc/b8vz60u37fyhiGzc2XEVmiQHrGJWl7Zc+HNGcO4wuBaYzIuVVfyIeS1eK
         kXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eHQJLfzTNPDA1/pQTZpx4Byq4XPizN/2E9nRXaGdCGM=;
        fh=bGkl5w40RXQubdCtEHD+rNd2gu8Da5qIuoP/Ckj1L10=;
        b=kQAIH+D+0skyy4l0pAdRZL17lMosdM+bKTDXuSFK4Dxd4FTfTyltTSCmOqpVLnsiRv
         esPrClqiLmk9xRR+jiRTIjusFxNmjQ766Z8y9GEaqVOd7IkNZTHiQGFsTmXxSvl9rcBb
         CYEWYUVIVhYEMX8Aa1ysqZblS3Xf1+UiqplZpznE0F1/5LjDKQZP5vjEmC2d5L4jwFxi
         EpZD55hgpPDDTpUY6NUWEikbgb8hrVQfoXePUHVoJ96rgg8l9mnnk8amG92yYUnS11WE
         gylZKlAaYIm2zqNOea2AzbFbxVmi30hwMAttQqfV8oKHMvrISD7C5RDkTCU10wz/w9pV
         psBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JqZoV4Rt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a3785f9874si368934585a.88.2024.08.08.01.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 01:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JqZoV4Rt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbyow-0007CW-Pw; Thu, 08 Aug 2024 04:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sbyov-0007AA-OR
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 04:48:29 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sbyou-0007EY-5l
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 04:48:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa7bso809962a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723106906; x=1723711706; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eHQJLfzTNPDA1/pQTZpx4Byq4XPizN/2E9nRXaGdCGM=;
 b=JqZoV4Rt7/99JH4jdvjUVv4vHjXoj1nDbTW4AI9sWWYKOd/mSKQ7CQChyHorLgHUAX
 Iyc7Xc8AWMvLN9WgK577k+8GtNLhIid2UmH0MCkPA28KAX9pv/D7sC5cGkKLXHbv/FpP
 lMR2JRwSdPcArHus/aiIADFpaBWvYe10roCVt2BGSgDJOjreh7fSIbscVnVIdh+l1GPA
 ajoQd8/EiUfErwlw84HkE2eI1oIYOf2ZUjFWVx/aGaijaQymkQTZ/+fBBMwj1AIU1PJK
 vE3Q4V8quNfkD9xnICUBlC/DlCAJaG0Zg45XrqJWyDgttdkMqcJZDnQOs1D9KD0rFjrG
 QAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723106906; x=1723711706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eHQJLfzTNPDA1/pQTZpx4Byq4XPizN/2E9nRXaGdCGM=;
 b=H8vYFD94Yj0vsar9dsfL/9uZS4hQoiMxiuVDWEcm9Bvofwy63UyGI5UEQDTlvWgE5Z
 UVSPMlFQo7E77HjshtjSUb+/uyd0z1NaAzymJAa4/Li7EyZEIiNTyhH6SLH+DAugPIIC
 Kykg/mJVXImYtugAdp9RP8m1aCdgEuL03xg+sapnULBFPDMRuSBRY9Jj/r6RZnp7FvZT
 U3B1VXNKN2GchhHt04Kv+HVndYXQQ7UCfZvRKllTMYj1jaShogHB+X7OjvdRsHTM2oLS
 AfsS0BY7XxnhuOfgjdgB/SX6j0TqU0qjF/IpYHuyqUIhT5nxRVqAURzUUXmDKlempuAZ
 arJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsvOMV6g3muY6gnARaMv53rC9pRFFCxGZoenfLDHcAXJgIu0wY1Xpxs4xVjS1mhaOmuSD1WG+5cOjpdZF6pEiRbz/9
X-Gm-Message-State: AOJu0Yz+lGVTzb4it7giA0/iSqFnr//z+RAVyFx9JMxg+z3sldS5EvI5
 CxjOCNvToe/TQ4bosOr1b+QoVmCinVMotberk3FZK+Zr1r3kQA5msGVXwi6cHYdXzPGZR2ByyJO
 rQDSdlUwIDMynfCejpkbe+hN34yOTIbS65CxSVA==
X-Received: by 2002:a05:6402:234c:b0:5a1:7362:91d9 with SMTP id
 4fb4d7f45d1cf-5bbb233eefcmr1132986a12.22.1723106905820; Thu, 08 Aug 2024
 01:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-3-philmd@linaro.org>
 <87o764yce3.fsf@pond.sub.org>
 <a8eb43d8-3714-447b-ab1b-c96ff05cf14a@linaro.org>
 <87h6bwwpu4.fsf@pond.sub.org>
 <CAFEAcA_2pJA47K72qJQX9bc8sBcA+0wJGaf3KAaYJaRurjQD7w@mail.gmail.com>
 <871q2zshk6.fsf@pond.sub.org>
In-Reply-To: <871q2zshk6.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Aug 2024 09:48:14 +0100
Message-ID: <CAFEAcA_xbdrjR87bttUxw0V=J=sS_Le+X=CJhPGqio7-CkYo+Q@mail.gmail.com>
Subject: Re: [RFC PATCH-for-9.1? 2/2] hw/intc/arm_gic: Only provide
 query-gic-capabilities when GIC built-in
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: hS3gbqb2xuu+

On Thu, 8 Aug 2024 at 06:35, Markus Armbruster <armbru@redhat.com> wrote:
> Options:
>
> 1. Approximate symbols from CONFIG_DEVICES with symbols from
>    CONFIG_TARGET.  This is what we do now.
>
> 2. Use symbols from CONFIG_DEVICES.  Generated headers are no longer
>    self-contained.  Strong dislike.
>
> 3. Define device-specific stuff unconditionally.  We get to fool around
>    with stubs, binaries carry more useless code, and introspection
>    becomes less useful.  Meh.

I think that 3 is the way to go. With a single-QEMU-executable
there are going to be lots and lots of cases where a QAPI
command needs to be present in the binary but won't be
applicable for the particular machine type / target architecture
currently being emulated. So "the commands always exist but they
might give you a suitable error if they're not relevant for
the config you're currently running" is more consistent.

Regarding introspection, doing it based on "we didn't put this
in at compile time" is going to give you inaccurate results:
even if a command was compiled in doesn't mean it's going to
be relevant to what you want to run.

-- PMM
