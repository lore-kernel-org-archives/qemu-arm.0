Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1628972njb;
        Thu, 6 Feb 2025 07:52:39 -0800 (PST)
X-Received: by 2002:a05:6902:2484:b0:e5a:c8d0:7b9a with SMTP id 3f1490d57ef6-e5b25c02bf5mr6363772276.43.1738857159632;
        Thu, 06 Feb 2025 07:52:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738857159; cv=none;
        d=google.com; s=arc-20240605;
        b=DUuhieWNW/d7U9j94WLeu9Smw4+HCDJCCocOl0dV5V3TJwttK89U4RIlJBBpjmv2AJ
         fgwbugZ3ePhdUp6pOTQ5jVYor5YrZHB7kLPiSGQn5nWy+UDezbR946Q11JfXnD5yI4hR
         WdFnzW5Cgy/ULe7OrfvCQrOWmfMx4l0BC87CKWULkDVC13JZ8WimO+Hybfu8K8zBIij4
         Hbjd3ZTZDSEpIOW/OuctzaYz6o7aeb8oJnvXU2ZKeN8CiTtzVM8dlFHofrsLMpsAVjxz
         kkfDwim9HVpdbYhp5PmWi4TNIB1+hqofoX4xM8fklTkjfwQx3EMx5j+LyF32JIcLj8SZ
         Wn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qK0YsYi5T0TrmWuzPT6kLfisgyFRI4UVYy2zpuffB5k=;
        fh=gQjtQK4ozk7tGo9GYeAaWXMEcKCusqNMITJ/TgWJ9sI=;
        b=PewqYMKlxml4U+ULq5gOMcjePJ/gl63OMmYXGD11Aqq0/jh/tgbUtC8wWAipJdglRU
         zeUXx8K19j2IghyNFJr3aPKbYuFoqzUdfFbGV+5Z4ZDSSUs5Y2nr4POjw3YJvpzSpmms
         Fe308pNZcis9iw21G5o+a9p0Mr5gGPKhefLoJosWwpBQg69dsAuPY0QeHCbUxiY4h6BU
         2njgU5Qv4Jmwk+/ObAi9q+dClqpMzKKz6nB9NfUe/CEGCD6dXydL48Rs1Y9DCeLMDNIf
         a1s+ME4JwELgedw9HgQq/jLK2oT1J8v+CW8jUhk4KMWzjiteUKGfF9JpZFxNbOl2S+TU
         CvCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciBIZJp+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5b3a4a641asor725080276.16.2025.02.06.07.52.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 07:52:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciBIZJp+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738857159; x=1739461959; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK0YsYi5T0TrmWuzPT6kLfisgyFRI4UVYy2zpuffB5k=;
        b=ciBIZJp+iG3Zem30rtt05Y9rBuXSEsEy2GWX88+AWLVV6sytOZR5XQ0lEK8G+w9Rje
         MPRGmfqN+orjN7xMLn37u9K7SiVQCU3arjevrcAcqgKCQANZ2vtrm/TnGF4N+cHmmsPu
         zNPN0BWrkKrnCLXIjvvT44eHyXF8GNEQHXawCFLNZgoXHOO/U7i0JRa4bEeTKm5j2fvB
         JsuNpvClY80k6chBgko/MjgK5xopXNSESZoIDoY4EdMk8e2B15foG3PY0lNnrnAHgmzp
         A+SD+qNtmPat+uxjMTcRXOfQZwz4B/2OOKybsHWXNPqCXMlj+oABXmTiAFG+E1XXcQlI
         QoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857159; x=1739461959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qK0YsYi5T0TrmWuzPT6kLfisgyFRI4UVYy2zpuffB5k=;
        b=G1A1ChzFrP2eEz9nFyO0ccJP50SBF1j+5NVMfWSayl9NW0Ki08rF+KcUZNR/Rcm3be
         F2h/BO1kgpH5TyJOAjZaUD+w6Wba1U1v1RgcGXs9xPz4vDcVkHIlavXo71gv4PDYJcII
         cre1JdR0iDmVncOKIceHU5lHn9spfjD6diwhrfKIZXOybKC0CvsLja2SdEeS0DLy7XbD
         jTxubPQV3w0RoaUM6fsq2PgNHBT3QhRwglr1S1f/ZOC1HToa/Rg9GQzoiuOfytlo1emU
         PA36BPSzT9lBGhMY31OPye+P2I9qp0nKoxiYq/oDf7RH0kT/DNxPeR8Plotd3YgHZi4H
         Yihw==
X-Gm-Message-State: AOJu0Yy5zHajCNOGpB9LANewab/MbTcQQEIRbvMVmd74r9F46pQwJOzv
	3jxb+HYeep8XW6i95WLpXMkDiSHODjMISfV0Zv2z+0NZlfzv9cYRsi799n24UjFFhJJmdMQKElf
	98qLpsD2iLPeCWa7xKM6/dpnMn2zGrHO/zuGVApJb14JHY1CAFUc=
X-Gm-Gg: ASbGncs4XmdxyxtBU1wQeWWOYY0Dr7N3hYBCprbULG11tPL2pZbVjwITZ613+IhDrc2
	JFm9Ke1ksPwj8XoNd8FzcogpLLmhPdMfco9DL+cT7kHiR0w5JtAehtSBNtpz/+1TWJhaUM001Yw
	==
X-Google-Smtp-Source: AGHT+IGINeWTSKbjmfoPs4JgPVdgMOggbKB4BYTLBGiV0ephLv9sPQFpHMENgqCDe7gKGTrcm7ROiGqMd8iBtYFmdt4=
X-Received: by 2002:a05:6902:1087:b0:e54:ab05:4505 with SMTP id
 3f1490d57ef6-e5b25c0957bmr6324767276.44.1738857159185; Thu, 06 Feb 2025
 07:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org> <20250203144048.2131117-7-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-7-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:52:27 +0000
X-Gm-Features: AWEUYZnAPSByxpRAMEhM1UO803j7aoDYdB1KX7S44_DfsCu2bJkbx0AXWGbu_is
Message-ID: <CAFEAcA8ZcYtD44h1VupTR+Ka30D+HY6H+n-DnTW9muhy7_u6NQ@mail.gmail.com>
Subject: Re: [PATCH 06/18] tests/qtest: tighten up the checks on clock_step
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>, 
	Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, Bin Meng <bmeng.cn@gmail.com>, 
	qemu-rust@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
	qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, Tyrone Ting <kfting@nuvoton.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IyRyuNu+QR7H

On Mon, 3 Feb 2025 at 14:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> It is invalid to call clock_step with an implied time to step forward
> as if no timers are running we won't be able to advance.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
