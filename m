Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4372722ejd;
        Mon, 22 Apr 2024 08:57:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYIxRQ1JjYGfHLtDY9PisjZPEDj2OoXsa765nF41pB6fXNLDq+mgZNSyrSahBNF4+l6J/MSQnGc0gL5QbdISOO7HWUHjwU
X-Google-Smtp-Source: AGHT+IEQ0hXFwn9hoWM2ov68rX8du5F5/mtWsxx6IC6bd6UtWGAFIhaYJ2MjLP539Fn+zOolHOrJ
X-Received: by 2002:ad4:52e4:0:b0:6a0:6d48:e008 with SMTP id p4-20020ad452e4000000b006a06d48e008mr114189qvu.14.1713801451562;
        Mon, 22 Apr 2024 08:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713801451; cv=none;
        d=google.com; s=arc-20160816;
        b=lL+SrM8lXwKeLhNA37/5WcfOfUSNQ4et5hESIIoUh+UqXhaphqx1jDYlk9IeKVskmO
         bHASxp2N6v9NlapGcjNUxpZeRPykeMbo5eQpQNUFZF1K5NGGNUE4+CVv2g+QREgRWKXT
         SbNS9kRnybAwpLurFbuocsjXWiaQEzFVz8uiv4/oYLIgyOZVvA+/0Do0hKSYkm38Uj74
         zipUxnDM5Rz2RjEmU6wGVduiTVF/6IlHXVIzWBG0DG3KVvkF/+1WH3ZegzjUDdo1y8Nq
         6x3ZHFPJ26dgj6wdf7CtlFuSK5PdcoAArOZla1o4x34Py/WMM4KOSqTWqTEZQHEL19VP
         YCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tBApjg9WR3qEgc5zMdctfxmtQQQ61WDmYwyqiPU9VyM=;
        fh=WPJkwkHM1zDMH3gSeqxlA8K+LyaaAYqQfYjW1QfAEaI=;
        b=rw51iiCnmpi3+zrCd5HJDM0qne0Gnuh8RnEAZ00wvLJMlycnuVtSgGHW7hi1p2GqoI
         FzeMW8L1FkVOvl/gmm1EDOB34n8ovOqcd3SYytmhiLZ+m4lfIjZnXidjxLnsLcekBlb3
         8AGOvBzM30RYAMKaTXvn0LfaW5mo+uraAN5xd9/3VY4f2xH/IkzJlzTkXLUXfdt+pa6I
         2cMS53dFNdPIuv0nOmVZGX9hUgT2J8qbc/H2Blqk5ugTH2rAKqBG1EQIP+fnPHYQn6g/
         Ej1zpwYYE5RXULs0YF8DMCyhVNA1R3ENG/BX2cI1ojAnCoqXB/ofFCJuQHnuJh8Ffjfr
         MI/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EP0b1zLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a056214194600b0069b296fcc63si10663622qvk.235.2024.04.22.08.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 08:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EP0b1zLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryw2p-00042x-TO; Mon, 22 Apr 2024 11:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ryw2o-00042b-Bd
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 11:57:26 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ryw2m-0000MJ-8x
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 11:57:26 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso6989831a12.1
 for <qemu-arm@nongnu.org>; Mon, 22 Apr 2024 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713801442; x=1714406242; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tBApjg9WR3qEgc5zMdctfxmtQQQ61WDmYwyqiPU9VyM=;
 b=EP0b1zLJ5Aakp4n03zwg+f64kmd8KrAIWGTYxy2gIhUHMDHh51whdjRKW1NIGUazw6
 /Lx7/pOIAMISv8jop6mmWb28DfeR18aj4OM7cOTI1xRpu/H1grTgshabhCGgIZrrwCqf
 5yFkruvH5zEf1buJBG0dfCFVIJBT7vTC5isrxH2YAqhlQHo/GAjlk5wv9qhMcHFkACT5
 VbQeGiCQt6dNbYpT2KoV+t7CyMDjgIEORP+1KHTbcX00pSFYKhysDMpctHvb8LTvN+L6
 8Fvj0I0SGmF3cPycSbRDXi7GsDz3ZWqDVvL6UU4DHhONohaK6cuckWe65MgPRjHeldyb
 eiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713801442; x=1714406242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBApjg9WR3qEgc5zMdctfxmtQQQ61WDmYwyqiPU9VyM=;
 b=nyh/APn8D+vkh+esAfnLqM070xffcygLBz2q9L8zg+VoRtz5SEyPH4/U9qcPzqPzhX
 isylBYGbUTAF6PKLI3BuCziTOVtTp+g6X+uK6+dIJbBW6yygtFvE4Z5Z26edQi2Y5xAz
 o2wqfX9bx4iKfs+MzslmvvbomE7HD2kVuQHRtietS1kBDx6c634+ec4I0+0bf3qdRBNO
 baLqd6TTMQfEothQOmW8MMpZ9CBHfznFPP+Er/BZ/oOOflsi9M8jFQq9+aE7ns93SA6b
 ayszBmu1uRx+89eqSjIN6WLNuJR0jvDLY2QvzibpAHbIKRlML3rmDA5PinJF6o+NnU4a
 xsQA==
X-Gm-Message-State: AOJu0YzO0LmhFWZw5C22knKaUfAQkY0VQiJG/76r+UbbDGySsDSUEte8
 tBQ7+QL1x/P4i85NKN9Ixf/m3nLKyo6Zm1rLEFRs7pF6xmHpC/gr1jeyqNuU7Vrcl9xKgQxpr7j
 UXhKlGwttCOEhn61t8lJ9nYBjKZhGU59U1AIDVQ==
X-Received: by 2002:a50:9b51:0:b0:56d:f54a:8765 with SMTP id
 a17-20020a509b51000000b0056df54a8765mr8320828edj.23.1713801441641; Mon, 22
 Apr 2024 08:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
 <CAFEAcA91ZULEjEgTotevp-epgH_azcwrSi9PVnnOSk8gq5j22g@mail.gmail.com>
 <c84bfac7-5fb5-4fca-90a3-93adb40bcf3c@linaro.org>
 <CAFEAcA_PWyu=ca-S=qwePDdGqjX95k3oQ+BJUZc541YEyV7i2w@mail.gmail.com>
In-Reply-To: <CAFEAcA_PWyu=ca-S=qwePDdGqjX95k3oQ+BJUZc541YEyV7i2w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Apr 2024 16:57:10 +0100
Message-ID: <CAFEAcA_-97Qi2yk6yx9KLB=pDV15KaF57gfvNJWq2EDzwFLx4A@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Make the counter frequency default 1GHz
 for new CPUs, machines
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: yJwGkSR0Umi5

On Mon, 22 Apr 2024 at 15:18, Peter Maydell <peter.maydell@linaro.org> wrote:
> I imagine that value gets written into CNTFRQ by TF-A somewhere
> along the line (and then read by EDK2 later), though I haven't
> quite found where. Plus I notice that the TF-A sbsa-watchdog-timer
> assumes that the generic-timer frequency and the watchdog
> timer frequency are the same, which is a bit dubious IMHO.

Checking the BSA spec, this is actually correct -- the system
watchdog is supposed to run at the generic counter frequency,
which will be the same as the one the CPU generic timers use.
So we need on the QEMU side to make the sbsa-watchdog device
be runtime configurable for frequency and arrange for it to
be set the same as the CPU.

(We could also arrange this by modelling the memory mapped
system counter properly; I have some slightly half-baked
patches to do that floating around somewhere. But I'm still
not quite sure it's worth the effort needed to try to get
them into a fully baked state :-))

thanks
-- PMM
