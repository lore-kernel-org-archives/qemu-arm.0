Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B99EB4901
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 11:00:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqUQV-0002dO-Aw; Thu, 12 Feb 2026 06:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vqUQP-0002bf-8s
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 05:59:58 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vqUQN-0004CD-Pp
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 05:59:57 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-79088484065so30297017b3.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 02:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770893995; cv=none;
 d=google.com; s=arc-20240605;
 b=eMKJHVGmKUi5trA4c4KFvhc9FKfwlARqd3u1V3A5MsmN5xvwiwOeqmK0Sm+ke1/o4+
 4PxyyC+ikd3oGIMIkeUIZcfnYZwGnzPsbbYZ3BYD+deNX7yJUdGzKINXH12gsWYe3Q8W
 Kzs9f1sFxQUpNV6UP5sptzWq4gWhjK91ng+a9/yNom7wfQuMlAeDnjfPEph3RzkS3EzC
 7RPwsN6Bp/vxp1IVwrTr/sudkA2eVt2+tFDnMRAcYekvpFkjcRiQ3JKD0tWHmFbiz670
 S9rgb3yaNsJGM7kHFuleBZB/WaJszLytMrMvdyfS8eR0uIcdVbQHKOCCXC9Q5o8EE5Vh
 Lsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZVrbCSZbccxq6FEVA4SqZs6DjR06QQJ13wdUUSd0D90=;
 fh=2nCEqBCmP3uu08ZZg9WUN76z9gojaddEf2X7BkARxok=;
 b=OHSa0ERhOz6x/xixiUum4/01+3JnaYBtn/NFeTchKKmv/h2ZEhLgavf7mU8S8jgNhm
 1TzrVyJyjpNfM3h9WncFV7aFTqtnxLw7L0dvzPJHjEccI0vnF2ZH+NhzBPuXsRDfI4QO
 0x+pCeDgcZ7+mi1dGa9uXGbKYNbPzsZFQjl15f+Ae49k61zUxmbaR4pUQhDEBLFHp/c8
 Lxt678E4XqYTzgI01O4/6gOGGUqRsnCDSKDc7COL7j7iHmXP7nc+kSXnfuDvx7YSsIri
 bFjrQjTYBaIJgSWohnhR5w3Tp8H6cXic5ucoH5w8pNRZmJaOrjWj5gi19nY/OzdpZzZU
 9bjg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770893995; x=1771498795; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVrbCSZbccxq6FEVA4SqZs6DjR06QQJ13wdUUSd0D90=;
 b=zwea3NKArrdjLHc1opMKEzmnhn09i3p1DS3+xHTlTZfkYaksM7ArSQXODlCQGrPcZa
 QHZbH0Rlhvz7EyRsFZ+PXUDLfEwG1IBodw1BLuEsbK0A662vSK5anNkaERBE3eCCPRwL
 tZHpyUHIiTrF1a3oD6REsqHgJJqz2rtxU8OF511v42KZ4Vc8HJfVPygxmgIx6C1BLgt9
 6QAKriiH8FajT9MBINlUQqc9ban4Y2VQYzZrZtw8R1B+SoSw6IjQZdjnw6gBybkhEcjb
 i+VCzdm4ajMmtOKM5g91hJebizrR2zlnDaL9C6zlbe02O707s4VwfPQl/WCthhSsQMO2
 0rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770893995; x=1771498795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZVrbCSZbccxq6FEVA4SqZs6DjR06QQJ13wdUUSd0D90=;
 b=C2gIpe6C0fU4NLx1vl+mVdzXZzoKDrI/ERIYCOb1jyZi6OLefaflLt1z+i0SRhieME
 HgjxSuMn3gp1jp+CPbeo18qhlC3zqomQWF9M9E7sQAPRAh8H/5TlQvibnfPA3rY0OXer
 LZ4NnFvOwD8ROovBXeQOrtO0JTBgBH3caHfpplC/8gzMNzPbKpxAa+Xh0IEful1YUtwk
 9EseX+70nVaTLDJbS/3kJ6k+9PUksPx4sgZtDjutnV+eO8bqX5584PZw9/2PUKnh96nu
 COLKqiNNsx6QVzcAl8ElgHF4I/nK7Ehu+Qv4KwiHMwAvPtae1NN8bNbgS1mG/WmM/Td6
 lyKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2WPxTzYboFL3cOiECqwAlbM2S25CqMBXcck0FSI0+2uaEhTCTqszpKFFDERRpkdOG1MturVpmuQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyqog7LEuikiEP4p+od+/H1cqRPf08vR7g3F94UdkgFrmvl+823
 M7YKrNqdiGMZz5p6giEiIrvMLCSVMrejPCcKXSrweTI4/hvMfS6rjUvYyJ17VwvW03h9ygh2MRR
 asTLyj8N1eC3pqq20nkdQwUwICMv6NM6+Y/r4Kg+DIQ==
X-Gm-Gg: AZuq6aJujDml7RICg25yW27kUwm2U0qvjl+lcSUDyQAMolxA56CHenNMtg2Cba2eWXN
 wFvs5WMaTYpdYbmVzSdHvpD+B/ihhS6WV0/p+spoDKKVXpO3Z8TQaEQ6RJ5sk3gXIaRL3nyE5iH
 Zg2059S0+k/XqdomL1ZTbEdRPQ2sDCOcrA7Rse6JGQcDh3lUVHj6LBBabMVbXgj6zWeCzFR1/w6
 or6TTchAKVKKaGE0rnROTpCfv2QC/Npxs4IaUvLRJTXXG21gKuiSiXPG+YMjYHQ5yqZzLCFb7vE
 ENr1azANM+I2Ektny4MLTSZ5aNsAOC/NyByPq36oG95KNJzNMQmYxgCxptYxBW3VV70=
X-Received: by 2002:a05:690c:4882:b0:795:1e5b:f72 with SMTP id
 00721157ae682-797931fa40fmr27576287b3.63.1770893989787; Thu, 12 Feb 2026
 02:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
 <93f8f250-7899-4528-b277-1ddd469c192c@linaro.org>
In-Reply-To: <93f8f250-7899-4528-b277-1ddd469c192c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Feb 2026 10:59:38 +0000
X-Gm-Features: AZwV_QhUuW1l9Jivyr7kErjs0tzcoD9IRR_bK5Rkbo6Gtl-aCqdZBlAQHB1UJww
Message-ID: <CAFEAcA9YUOxko51ziY3yAOaDfTCEAwqmXnifF=q_mkyotFHTcg@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] target/arm: single-binary
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, anjo@rev.ng, 
 Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 10 Feb 2026 at 20:19, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 2/10/26 12:15 PM, Pierrick Bouvier wrote:
> > This series continues cleaning target/arm, especially tcg folder.
> >
> > For now, it contains some cleanups in headers, and it splits helpers per
> > category, thus removing several usage of TARGET_AARCH64.
> > First version was simply splitting 32 vs 64-bit helpers, and Richard asked
> > to split per sub category.
> >
> > v3
> > --
> >
> > - translate.h: missing vaddr replacement
> > - move tcg_use_softmmu to tcg/tcg-internal.h to avoid duplicating compilation
> >    units between system and user builds.
> > - eradicate TARGET_INSN_START_EXTRA_WORDS by calling tcg_gen_insn_start with
> >    additional 0 parameters if needed.
> >
> > v2
> > --
> >
> > - add missing kvm_enabled() in arm-qmp-cmds.c
> > - didn't extract arm_wfi for tcg/psci.c. If that's a hard requirement, I can do
> >    it in next version.
> > - restricted scope of series to helper headers, so we can validate things one
> >    step at a time. Series will keep on growing once all patches are reviewed.
> > - translate.h: use vaddr where appropriate, as asked by Richard.

> Patches 1-11 are reviewed and ready to be pulled.

Looks like patch 12 has also now been reviewed, so I've applied
the whole series to target-arm.next.

thanks
-- PMM

