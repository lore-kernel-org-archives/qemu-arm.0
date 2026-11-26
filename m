Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8C2606A323
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qMwDXGOs
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWXsa-0003o5-1w; Thu, 26 Nov 2026 06:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWXsY-0003nk-OF
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 06:43:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWXsW-0008DT-Tm
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 06:43:06 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4bb6057b333so32934165e9.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 03:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795693382; x=1796298182; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1YZyuCp9CDq/4HayMk8Ztf6mWj6fbrjRO3QD8T7MezQ=;
 b=qMwDXGOsrCJ8WTTcPW7PJNQPMm9bpO+WAWe8naMw6wX0Hsw+HL90un7pGpyxS1blsf
 BDl7Vt3wuif5sOP6p6UYY+rLVFpZ59CM+HIvB8y4WC4XoVxLbe4ZvGgpBgfZaJJdc7NQ
 EChTz7N7woLsSKPdKOExVKTaeeqUrZ4x2IEgswWuUNTRaNf7n1ky6BCWckl0mRjOPgR+
 jK0ge5gdKtO9Y2rwZT16xdKshODXPPKtsbP7VvROfbCsmYljGaN47U3MVJ39Iha+znz2
 94Cn/fyLRqjUCuZNQFgJeTnQjfcRKGeVMAcx2S5QkKd482+6vp4qTTr1Qh+Gm/Yy1J0M
 85Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795693382; x=1796298182;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1YZyuCp9CDq/4HayMk8Ztf6mWj6fbrjRO3QD8T7MezQ=;
 b=hrn+FmJfs/EVABRP5ecElW1bkDzT5MgpLAvfXH9JO7UNE6XIR4Gzb4znl6Nuk39nv/
 tqRnjhEU8IoRkY3/+xefTv+r17rUfTWOjm0vKfNxiuQpVGjepqbqLmb7jozlp+XVP92c
 SJLV88+1gWe7MhEj5o+gzcqqTbJyHuZ1u1JgNd+BIvGvfMyDfEmUeCi036ISjYg8Yg0l
 fOFBV1ZkxAllA0S147LcEmuHvh4Ym0a9FauK04KRSewFde4EUZwLM0J5mfn5BfYU96UQ
 9Y+5yOSY5sAMEqP4ign+vNcc9VX8gIkAlg5AN9ajtheRmFwEoVRseMb/BNV41y2qWZMI
 u/gg==
X-Forwarded-Encrypted: i=1;
 AL+hErE1mEWQoJhOKQKuaw+UAtA2/JxQ++4W3Q5g3OYN+F4XrlvNaK6gzBVdBkTVXBnmk+BTZbJtpKLFBg==@nongnu.org
X-Gm-Message-State: APuU4Z8mhV/qSYYaMGql/8tAbekrAkEcXFcW76hkXUbu4r1/bVSTZPkB
 +oPW6Ek88ZAdktj2lyGtTMCxu+dCLrCz0E2wMcvlc3w4tRgqIhjydV6RiJb5hR3Jr8I=
X-Gm-Gg: AZFdTZclvuhktv07QQyAVUMp1c71BPmPkwLPDGubnDWTopGXRj8raBSIsRfjcyKnzZ+
 NpeQ/RVzQlRCg+9CfpKAo19embBA+7M87I6Em2jhmKN68mmKGuwgDAAh4Pgsi+zn5geB7Jhd4xU
 sgU2pYFrLSxRRa2qIWW6NbOx8SWmnOAqAqAzEVIHF2PHPgh+0v0qDJDHYf9CqSXnqj0dofrd/SA
 vp+OwVXRNXMXibby9BVjz6qBMFGIyfcFZPg9+Ly3a00GAP17Svg1WMT3dQjtMkfEGOYFM0KDZV1
 wBI9JmtogEueI1YS7OcdLEONgMVDG9XJGpezB+5O4Pbszb1hGYjILrhLol6cz7+MeEO/AgiuEoN
 5EvptUswNc/TUQfNCGEzePEAgNuSDzQSkJKLbJuWYstqi5Wp3EXLiLBtxWyVCA8mZcA6keUdfvf
 N0vLjmtauv6uqeKKjk1lCrm/tPWisbur7C0PWvn+NXF44azneIDkU5CcIi66e+88ELJviLtoi+k
 OzNkvmDeJkTbpLscKbFncS3DW1ouo2PG4tNunZr3Zx7WiZQcOk/20zGSY2u3U4LzDNJzZyljzqE
 dF+MD8Z7gVgaYdHMF8QbLSXIHX5HP/DLnbQS325pMH6iL0/s+A==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id
 5b1f17b1804b1-4bb88807909mr460084825e9.5.1795693382018; 
 Thu, 26 Nov 2026 03:43:02 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm488159345e9.0.2026.11.26.03.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 03:43:01 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 093E95F874;
 Thu, 26 Nov 2026 11:43:00 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Frank Mehnert <frank.mehnert@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  peter.maydell@linaro.org,
 Frank Mehnert <frank.mehnert@kernkonzept.com>
Subject: Re: [PATCH for-11.2] target/arm: set the event register on a failed
 store-exclusive
In-Reply-To: <20261125082126.49911-1-frank.mehnert@kernkonzept.com> (Frank
 Mehnert's message of "Wed, 25 Nov 2026 09:21:26 +0100")
References: <20261125082126.49911-1-frank.mehnert@kernkonzept.com>
User-Agent: mu4e 1.14.5-pre2; emacs 30.1
Date: Thu, 26 Nov 2026 11:42:59 +0000
Message-ID: <87wlpzu8cc.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Frank Mehnert <frank.mehnert@gmail.com> writes:

> Since WFE may sleep on A-profile, a WFE executed outside an exclusive
> region halts the vCPU until an event arrives. Lock code commonly
> branches back to WFE after a failed store-exclusive, for example:
>
>   1: wfe
>      ldaxr  w1, [x0]
>      cbnz   w1, 1b
>      stxr   w2, w3, [x0]
>      cbnz   w2, 1b
>
> The store-exclusive clears exclusive_addr, so the following WFE sleeps.
> On hardware, the store by another PE that made the store-exclusive fail
> cleared the global monitor of this PE, and clearing the global monitor
> sets the Event Register (Arm ARM D1.6.1, R_XRZRK). The WFE then
> completes immediately. QEMU does not model this, so with interrupts
> masked and no event stream the vCPU sleeps until another PE executes
> SEV, which such lock code never does.
>
> Set the Event Register when a store-exclusive fails, in both the
> AArch64 and the AArch32 translator. A failure for another reason causes
> a spurious wakeup, which the architecture permits.
>
> Fixes: 01b223f895a7 ("target/arm: enable WFE sleeping for A-profile")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4938
> Signed-off-by: Frank Mehnert <frank.mehnert@kernkonzept.com>

Looks good to me - is it possible to extend the wxft test case with a
test case to exercise this common lock pattern?

For the fix though:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  target/arm/tcg/translate-a64.c | 7 ++++++-
>  target/arm/tcg/translate.c     | 7 ++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a6=
4.c
> index 49472f7d97..45f3b3df03 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -3531,10 +3531,15 @@ static void gen_store_exclusive(DisasContext *s, =
int rd, int rt, int rt2,
>          tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
>      }
>      tcg_gen_mov_i64(cpu_reg(s, rd), tmp);
> -    tcg_gen_br(done_label);
> +    tcg_gen_brcondi_i64(TCG_COND_EQ, tmp, 0, done_label);
>=20=20
>      gen_set_label(fail_label);
>      tcg_gen_movi_i64(cpu_reg(s, rd), 1);
> +    /*
> +     * A failing store-exclusive means the global monitor was cleared, w=
hich
> +     * generates a WFE wakeup event.
> +     */
> +    gen_event_reg();
>      gen_set_label(done_label);
>      tcg_gen_movi_i64(cpu_exclusive_addr, -1);
>  }
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 442c34ce84..2eef2ceef2 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -2137,10 +2137,15 @@ static void gen_store_exclusive(DisasContext *s, =
int rd, int rt, int rt2,
>          tcg_gen_setcond_i32(TCG_COND_NE, t0, t0, t2);
>      }
>      tcg_gen_mov_i32(cpu_R[rd], t0);
> -    tcg_gen_br(done_label);
> +    tcg_gen_brcondi_i32(TCG_COND_EQ, t0, 0, done_label);
>=20=20
>      gen_set_label(fail_label);
>      tcg_gen_movi_i32(cpu_R[rd], 1);
> +    /*
> +     * A failing store-exclusive means the global monitor was cleared, w=
hich
> +     * generates a WFE wakeup event.
> +     */
> +    gen_event_reg();
>      gen_set_label(done_label);
>      tcg_gen_movi_i64(cpu_exclusive_addr, -1);
>  }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

