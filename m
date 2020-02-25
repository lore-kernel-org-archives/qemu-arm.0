Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1853786lfg;
        Tue, 25 Feb 2020 07:57:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwK5zAY4Cq+9t3ldZSGgydb3yzqZtrNQKS3qSa02cGOSYsnqSVOdjF5g5Bhsh2CZZNW2D0+
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr53678169qtj.80.1582646220146;
        Tue, 25 Feb 2020 07:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582646220; cv=none;
        d=google.com; s=arc-20160816;
        b=Yy6IOB7/w/QWNBY4T8pZ/YGiO+tTq7BxSNcDr05+kXBZlpt+lmTZFSC5Xryg7RQR6B
         pHYLjcodpd2iAV8HTN0U353lwYMzVMTOVh60ipMnD5nWw0S0lKNcqgBX+HBf/LOoj+10
         d1VFEZmXnM0EIi9g7tljoOzaA4Ygs1whDmg+fyWOXR6M6j3PjWtDtIOHl3wo6Ga6mGbR
         +Mv7BU4Sm+BXeazE2y40MGgEOvSF1IMZQQN485RkhJI14O01TZzWsik7pXB33lZIT9Ci
         ZgFBjoS/WX0B5teJ14n7nufAgm4saMOP+tJhzURYskztKBUhswfkAHcoVyjHlUmGnMZj
         wWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5T4zoGkohe+BCUHPUlsCXWuDwV2ufiEtB/JT6ZKH1O4=;
        b=TL2f1/kWojcBD0C79lWC6gLX9xUbqIFTGRo3x1qWte+hutGHPG61uTJUAxmKtFTstu
         2P4kSX4d47jJHUCqXJS7ZLG1mcIw84qBEfi8vPzElXhRFcIIkqSbnXTBYIs8hdgtROzS
         8pyVyoBAxn2WAJnO2cRc4R2wb3ZyVUBnjCx6JVeqEvMuuLReHr5ZhnI0DdvUYTMWQT0N
         Ic8VM1OMZ9AeZ7FZU7lOwb0vh1MsIVlOxSaTbQBIXBE3oZmi7MUhcq04RIco64t78Exg
         YTyy0KFKpl1dsjaicod36auoNfIL6TTXJdebbZrpsJULY8GQc4+7XtfX2Ypm8jyNR3fb
         rssg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sgynCbD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22si451036qkk.299.2020.02.25.07.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 07:57:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sgynCbD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6cZv-0008Hw-J4
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 10:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6cYn-0006Hy-TA
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 10:55:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6cYm-0007do-N5
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 10:55:49 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:50323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6cYm-0007dW-F6
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 10:55:48 -0500
Received: by mail-pj1-x1044.google.com with SMTP id r67so1432202pjb.0
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5T4zoGkohe+BCUHPUlsCXWuDwV2ufiEtB/JT6ZKH1O4=;
 b=sgynCbD6TrZO4f80YloovP9v2tHwlEzsWK1Wi/b3Up5KqhAyvM4YMVqIbl8HZ+RTo0
 QK1HSsOvcVRFt9aPh+RWg42ESnFZo3Ydq2sojYJVME9dg4RowLa4b3j8ZEvKgDZo1af1
 F7dedbOrtwOoDxyLQdMMHsRKZ59JWl1vu2SZLBpeZj1l2A0f4ZU9QeVCqpYImFoUKo9f
 FlnnYF+EtHcxSODiJXP2dwmxCuxeJ/XakInc06hhI1OwuIDtdrZ6GaQBWRxTiO/SjKrM
 72iUgkB3DiLe3Ip4J6+EuCUjTzOHB9ib+JXAx21H62YdTpOr8a0Zv/f8hpkizwpBM8Al
 D+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5T4zoGkohe+BCUHPUlsCXWuDwV2ufiEtB/JT6ZKH1O4=;
 b=s0BqAi9mI0dHQYVi7WALk48Pm6AJfNeHWSMe1zn5HlLfHUbYNsxA085ZJ2RbGf5pfh
 2a3Qct1/IRqZA43B4V0BzeKGECRm/vvIPKtgnmBl0FZdEk5Q8GKgfaJ7PUM+BRVllrd7
 yLw38qnx91oBlbhaip2XLKIO8luYB9w0Ve3dRBYsdRB1G5cwUlb2kf6WfZTV2EYa6AEC
 FfaEyNzubfFjAeUPKE+KWRL7GRuOc8u/0P+KXr1QFeu4n4uG37ofgTzrIX8PbWhsOrq+
 e0U/Z+JXpuyQF/eiw3xZq0ZZDOHg20jvY4LSTlJVbuiUJ+9ki9xdPvE4jPJg2LmsWY1K
 BGtQ==
X-Gm-Message-State: APjAAAUOu6yUz7r2P6z5tZk5vjKMSoYyqJoFq2fW7fYtzzM/1yTmwhiJ
 TgWEB83TvfFZTgSnGHBfI+vre+BemP8=
X-Received: by 2002:a17:90a:f492:: with SMTP id
 bx18mr6190570pjb.118.1582646146910; 
 Tue, 25 Feb 2020 07:55:46 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 b3sm17873768pft.73.2020.02.25.07.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 07:55:46 -0800 (PST)
Subject: Re: [PATCH v2 05/17] target/arm: Improve ID_AA64PFR0 FP/SIMD
 validation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-6-richard.henderson@linaro.org>
 <CAFEAcA9WZbZj_hPemTGr+Rkh--VmZt1eis189+ExuPVNipgo_A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49741058-7dbf-d20f-95ce-5bf9b5e5bdb2@linaro.org>
Date: Tue, 25 Feb 2020 07:55:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9WZbZj_hPemTGr+Rkh--VmZt1eis189+ExuPVNipgo_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hSuX18YW74eU

On 2/25/20 5:24 AM, Peter Maydell wrote:
> This check is supposed to be "did the user accidentally specify
> some incompatible settings on their '-cpu,+this,-that' option?".
> By making it check the actual ID register values, you're turning
> it into also a check on "does the implementation specify sane
> ID register values", which (a) is useful for TCG but ought to
> be an assert and (b) we shouldn't be checking for KVM in case
> the h/w is giving us dubious ID values.

Hmm.  Because kvm64 unconditionally set VFP and NEON, you're right.  It was
only kvm32 that was examining id registers.

The only consequence of kvm giving us dubious id values that I can see is if
ADVSIMD is on, but FP is off, we won't migrate the register set.

Do you want me to add a tcg_enabled check, or shall we just drop the patch?
The existing test is good enough for just checking the command-line.


r~
