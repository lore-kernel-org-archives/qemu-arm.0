Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2242778ejc;
        Tue, 17 Jan 2023 02:29:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt/NMdlqZs/K5CrNqiEhJmorPkShaznMy4XEUGOSiHLy1jP+uGLcIMMiej2Lhfi8ZYTqzO7
X-Received: by 2002:ac8:5545:0:b0:3b6:2f0d:1925 with SMTP id o5-20020ac85545000000b003b62f0d1925mr2941600qtr.64.1673951351104;
        Tue, 17 Jan 2023 02:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673951351; cv=none;
        d=google.com; s=arc-20160816;
        b=Djz825XCGk696gMtWhlZfhVVidrTFlhd8OV1TfXfEDVLy6Gsyr+//RJevWJgF/tWqY
         +gntmY6KzS39RFqKXc80WiABP3zYODMiM8DZyrdjTCNFHem61rkgipzkgXwl/wrRN/oq
         f3p2PljZXRMMBC+SjUrfXmFKaEpyLBDOn6TORYkmqjoqjCCZ7t90YFNdqCDNgGCdGixr
         dE/19rdvr6uV0FMNByqRXq2p0W35NPxDJFUSwBVvnJqQxa18JuMzKaFPCbNAEnEJ7ALo
         elVYCt49o1JpZxZYzHPICl/HbwXlRkKjCG7oAxde+1oeY3B4fdHKdRxKAP9YBy8U7Iii
         ruMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=j0sjaXYymy/iFSyarSlSMqgcs4oRuwRD/LeY/JNZ8IY=;
        b=HtC6kn8yIBnaBtTtGedWTPz8GjyCi8vm+lwq3mhwMTwB/aWCfs7nYZxWXYRle3v/po
         oRh0Y0rf0b/Hz9YKbmCQG0l43YPAD87vFAk5/znqYmH6EDmjJCyJgK8030Ko+QugGNqr
         BBt6YXjf/kA05VyAVqImAdv9fhnu+xUlfZa1zwzI5BW/ruMDQvqn7PwVFYElH3UXGKY/
         2pV0asvgKBF3cmPmll8HCSy9aC6JoH2vnYl917oK5062gyYg/hk+QA6c+yPAaTyBSdGA
         LuBYqTACMy+TXCKgkQDLyuo3DGzl1+0EF8U/3XcpzYR7rBggpmAeOCWTSLFwzFsKCFw8
         Vj5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UgyA/Tyy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fd3-20020a05622a4d0300b003b63c005edcsi1134555qtb.490.2023.01.17.02.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 02:29:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UgyA/Tyy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHjDB-0005Pz-M5; Tue, 17 Jan 2023 05:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHjDA-0005Pi-AQ
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 05:29:00 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHjD7-0007By-U8
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 05:28:59 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso33699698pjf.1
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 02:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j0sjaXYymy/iFSyarSlSMqgcs4oRuwRD/LeY/JNZ8IY=;
 b=UgyA/TyyscZm3DN0vstVKIBOZlhjFiskGRxbNvwI3Z7KX+djIj+sPqcEehF2eU2TxA
 eE3TSbNZqT5K/Azzk+kMqgFuRC9ELvzN+LwtXaWLknpi6QU2cAXshPT+cyVz+s9B+K4P
 zlVm4VKIZxxnBDoxsACIWiRcwipcXpnkONeVdSYzbEiGH+PE8WCLi5fJL6btl6+hXUWl
 UsxO//CihgnKSUr0AepPXmf0HyedlG8tizdYp4rovAOgMJTdSLcRvyft4B7uRNGS91Oh
 gzN+EyCDHOGuS+IvIiyu09lZvVeBr8NjaPxsi44nW9To012Jrha7DrF7PH1vn7eXrFWH
 wFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j0sjaXYymy/iFSyarSlSMqgcs4oRuwRD/LeY/JNZ8IY=;
 b=PU08rwqH+6U//DrQlARx40wMuzBsRwFyCo2WZ27//Vkb5Wk/mAqUcAjeALLrwDPfIz
 LE+5oNixmE/J1Cl07vcC+vTwcdyGEp414Qlu/ZaOcrKmzWfn73isMZi80oL67NfpaGyq
 +SBwaFBvA3j3w5ycwYyEa0ycbOJDExwjcFJYdrxIRjreKeTz29jPYIiMWWqQaUQ84d8y
 EaUQJbZcT1yfycmeCz0yPGUD8P6S7bSmcYDmRA8z6HdlHz38PTSzduQgKGhIMOtZtqwn
 5Iy7sig2EM44NbTRVzgUmxsZQhwuwugAhX144Ru09ItBk7dGFPwTBNOf4MR/q0bv+94t
 X47g==
X-Gm-Message-State: AFqh2kqgXrHC2Olgiqidxr43hS64YjXDSBCI2IgBX5lIbhiOSoqK+8MS
 ei/ASU7m381EDfg7GLrG7qzOPBYKkSL+VzoYTHl87Q==
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr225365pjz.221.1673951336291; Tue, 17
 Jan 2023 02:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <4db4ccba-1985-f1b2-6c5a-615b865ba749@linaro.org>
In-Reply-To: <4db4ccba-1985-f1b2-6c5a-615b865ba749@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 10:28:45 +0000
Message-ID: <CAFEAcA-4dUF8MySqFxFdrHFF+Jjw+wZo9mp6uNuHqumssKX_Aw@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bP93JRqfP/hv

On Mon, 16 Jan 2023 at 20:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Ping.

What did you think of my suggestion in the other thread of hashing
the info we need to determine the cpreg set (ID regs, feature flags,
etc) and using that to look up whether we've already created a
cpreg hashtable for this config? If we did that, we could refcount
the cpreg hashtable and only free it when all CPUs are done with
it, which would mean we don't need this indirection.

thanks
-- PMM
