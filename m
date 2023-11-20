Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2254366ejb;
        Mon, 20 Nov 2023 07:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAK5btOB/cCZhjU0b1N+kKSxv6fYYwRiY+3CMVvr5sZPDOXczum7kn249yRfXVoFKcyT8p
X-Received: by 2002:a5d:588a:0:b0:32d:bf1c:ce65 with SMTP id n10-20020a5d588a000000b0032dbf1cce65mr12943068wrf.22.1700493483304;
        Mon, 20 Nov 2023 07:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700493483; cv=none;
        d=google.com; s=arc-20160816;
        b=ap9P1mqMOajKoNMlu6FCOLjvPT/xuVhQSAq3UjFAMrrSFUCdPtfsSqH5QIvdxbJWw7
         ykO73J3V2XRH15Rh16jgYWsQDTae51mgIsTglhHwLsNcmfoICc6dnxroNdBrvreqI3NH
         EtiSEnqDQwU0vStT2sffRkPQAYBs2cRcotRt9AVAKQpgooa1rAXrvwuOT5VSSM1/EjoA
         c/C3VaxCHrgz9RT0XkI9Xaky9xaOaLAZM9PFsSH/oBD5fwqWbRm0/fuYE9YtZixhQdll
         pnAkxkNL+dKTI+O6YRAdb5guXUjEtq26qdLi/DF2dhkQCSRYKzg7/OdbxeoZ2HQd1kcp
         pwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zBSgkNa5PHju+9XVtgs1B+6Ai/7/HQAfLj26pWMK7DA=;
        fh=GRGAhYIRyJLIexm/SQeD/ONQMnKo+TSDqNowgo15cfY=;
        b=tch6x6FFRipeeF7mucR084BgSyszNqCgobjpnRNecbU88PteSxUwfzOBuLvUmvc2/M
         0lTDuY/A3xNnhC+6rMdtHDaCitIaSAyteGcuMElzXlKooZK/hmD3PGpS2w+Sh5yoyDKK
         1jI5N79gKv1pi/P2E3wxiMPfltNcMBkhyaW1mvv6OiIvpgpO3goII1R7KAG4kd4i/GjM
         xBz0BDcpHjWe4UDBA7WnhDwoBP7L+Ys0oEQSn5RalvGO6N043kZ6Cjin446OCx67w8fe
         EADIc6fSE4rYMgOWi3KzZsOSEtsWww6u0RlkopdFslgBQeir5L5pMylY76l85Dli5Byx
         JiUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n+M+E/Jt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17-20020adfe451000000b0032da2efe2e0si4863947wrm.487.2023.11.20.07.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 07:18:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n+M+E/Jt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r561m-0004n7-MX; Mon, 20 Nov 2023 10:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r561i-0004mR-Nz
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 10:17:32 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r561d-0005Wk-M8
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 10:17:30 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-548c548c40aso1691358a12.0
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 07:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700493444; x=1701098244; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zBSgkNa5PHju+9XVtgs1B+6Ai/7/HQAfLj26pWMK7DA=;
 b=n+M+E/JtiruK8sizfaHESNnkYhvRcHTm7W42Zbf2QKKo24zGiThow9j2f6uimJuCJ9
 8quarzHQ3UfQBjTZL7HMR+mbQyw2wNopzjXQr7+GEUvRDlef9m5TK8F1vP8pl8YUgOlJ
 Cl03F9TBuFboeOZeRkmvG/ULjGjf/vd4V1NBfy/Qg8NMKZMihMdnSyXllVnsPGOoCfDH
 rUSRnQ/6oBiWbb8kj9bBSgt3zmIyQmhFx8sy9OnJ74wL+JheQ9q7pbooOC2ZNbCp48wl
 9FajnuLF+9/Evh7Xx5sbmxrgGOEOVymIs7LLPBbCJtwk4wpW6ek/1uzx9eJFMryH9gDV
 2tFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700493444; x=1701098244;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zBSgkNa5PHju+9XVtgs1B+6Ai/7/HQAfLj26pWMK7DA=;
 b=aohWgjvU0BrLFJJ9UF7VVMQJJKdxgHfDSbSdWPZvG4M20mwGozyAjm4BBLRB8K3cI/
 HF1MktOFVpB9w1Fo+mzX6Qpp557ahBQkVCfmEWSDkeEU8ovmRvoHJdfYyqKS+mayqfRs
 PTqA8t8dWCf3piLjOgukB+6GUup+0bsf2lzePRqmPjzXmlUcdE6xda3eImFg5ZLJ+3EK
 S92qZRbIVqNO3RbwQ/8yTnzQL4UDx2I/pbMY4mWBICR+E8S2sDnzkYtD0+tEmO4hXc9s
 znaJSgj7Z+P6KNR2aAT5EwoGtoRmBmyzSYfFc+KiOuUMBoxXKREPlm/gFN+01q/FcLHY
 nlpQ==
X-Gm-Message-State: AOJu0YyAKwB93tNwnA5AigdsTe1A5gOgjwrusYlINP9DdDBoxAoBKPqz
 80YMEPl0DALBAv/zxyZoqi8lsNIaAX+Gg7eOxXUSEg==
X-Received: by 2002:a05:6402:35ca:b0:548:ab2a:7508 with SMTP id
 z10-20020a05640235ca00b00548ab2a7508mr2607145edc.10.1700493444035; Mon, 20
 Nov 2023 07:17:24 -0800 (PST)
MIME-Version: 1.0
References: <20231117193135.1180657-1-richard.henderson@linaro.org>
In-Reply-To: <20231117193135.1180657-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 15:17:13 +0000
Message-ID: <CAFEAcA-Vqeu5DxqhLZwhCB1sHF-ED37F28V0WOcnoqoC02d7TA@mail.gmail.com>
Subject: Re: [PATCH for-8.2] target/arm: Fix SME FMOPA (16-bit), BFMOPA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 33OeYSc1Oxcv

On Fri, 17 Nov 2023 at 19:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the loop increment unconditionally, not nested
> within the predication.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 3916841ac75 ("target/arm: Implement FMOPA, FMOPS (widening)")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1985
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
