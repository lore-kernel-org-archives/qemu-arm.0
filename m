Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp9437qvs;
        Tue, 29 Jun 2021 09:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/5ZJ6DznfZfKv0rIPrArtqusGoW8e2cdJW6DMVPfYiBE8R1TvWUN8SuNBmfx0VCcK/IGI
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr39451018ybp.279.1624983251681;
        Tue, 29 Jun 2021 09:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624983251; cv=none;
        d=google.com; s=arc-20160816;
        b=PcjrRvdpU+iO6YhVB5b8/dvlgQ9jN/g/qFJ/dopuGlpuFtq0go/sO9dUvNoN1cPZ0x
         9Xxg1pAVoV0Ng62m/M93exfSU+7K/JCOz+fBvBV79CCnbpaEqJhW1W9yWm7RO5uRk92m
         mlQYhAEhkN4Ut1SYYaYU62PMGCzegfMnxV/OEv53P2fZFE/1JuSXbz6lIF1nTxSFQK+i
         2YsQ8Bs+DR8geoVtcdKCLcnEq4ykS/efxbGNOUcxqv/Lg6IT/v+wMNoCRQMNaO/5SefJ
         93p4s459uh3PGkUD3uoIlK+wJPJK5loGZBPoxdKuxjLRchd7HOBqmqQXCmGttmwE437J
         1upA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XPDvw+z29ztEXmZfUWOYQYPgFCQlGvxV53orMN1ZdYU=;
        b=k7eE998A1tA90hyEsGdJfUM2qljQodlu4RKrttbt0DSMDpzrB9My5xQPRQWdo0eoGy
         SMolH44m/jnxpW9OBrf8lwlXIro8WPLgzplNV4k3nZQ5PcmK/e9a1IqJFsInv9Jmopy7
         +Kn7NQWW4fvnnf5ZylNp9vOrfnSsmXR6VCp6sLcqQuPBCircGAsJj2cR9nr4OsW+bYgi
         0RgAaC8ztvj1hxGLSbIL1SoKhuVcSHGMNwFmGtsvRrYDkaVgN/KijVWFRoGCxJ2Itrdi
         BBXRUQqgY0OL2rZ7KsBxsnNAfouW2epSQbrjRDF9ulJ0ql/mnUsOqnA/VZqZU46o5vJO
         RE2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CR5klW0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si5923649ybl.428.2021.06.29.09.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 09:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CR5klW0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyGNH-0006Nr-6d
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 12:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyGN4-0006Kq-In
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 12:13:58 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyGN0-000271-A1
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 12:13:57 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e20so18986625pgg.0
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XPDvw+z29ztEXmZfUWOYQYPgFCQlGvxV53orMN1ZdYU=;
 b=CR5klW0ty1xUubx5jPfmMI/iJTbn0i3hY1TmCOy4KYlomSxKi0ddgqAfQuR5t+Xjku
 jEIAUW2UdLWMMw1fCQpCIN2Vx8+bVp13c58pRE/cqc2VCRNpWhk/LCW/5jZbQ9a1KflC
 U24ijw2gU2XCq6qb3ezo979dbT+Rvi4exv4V6Z/4nsLNB3MnSxZ17IwaVGothIKMAi5C
 XKEaCfM96TAOLli+COVH2hQZMU/MT1qRRg0GSArQJcFPtEhYGF11Cvah95/WSNyQ6XBL
 t56F3tzGalDpmKabj6hrwEObVGJ6gzQ8FcPz8eSoWr/jxV6yppfQ83odWWqZxnUFVmRk
 qk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPDvw+z29ztEXmZfUWOYQYPgFCQlGvxV53orMN1ZdYU=;
 b=uVtMI6Zzb+6925lRvQXowogXPqdbJl79S3NbScms0wlS9ERmZhvsz2iquj/bG4dP9I
 pjhOAoF9LBY1Q487Q1YtamtZKe0F3lq3Vjh6MhqpRiruAbEL8NMPnLAAxstS4XZbmpdv
 BuVcTAYf93xLDYhlTOY2Lb5w1aRdaSJL82dvVmdVOG9fgUuMkPCplAeux2yzbuIPJs/O
 FZod0SkkuUbBtC3j3cPM1Q3AH53AZBKQ//PX6P4J2p3dNQ7XkI6i5M2/nAzDSPJcC0e5
 6jKGWYOFIhIPBB3vlYniJtVftLKYNfC68dlOt/vfDGu5VVWU4pw9JUYy7vaMinj9FRhd
 ePDA==
X-Gm-Message-State: AOAM532jUlQrjqdJx95BR8TTQOKW0vuHtOMbcWhkPkSna72yEZ90lluH
 ZfgZHwXTPtZVCnSEge9ZCFvTGQ==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id
 z65-20020a6233440000b029024c735c4546mr31550556pfz.1.1624983232424; 
 Tue, 29 Jun 2021 09:13:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 27sm14915047pgr.31.2021.06.29.09.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 09:13:52 -0700 (PDT)
Subject: Re: [PATCH 15/18] target/arm: Implement MVE long shifts by immediate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-16-peter.maydell@linaro.org>
 <b12b3fb9-8919-8e87-1aa9-e54807bf82af@linaro.org>
 <42d6f71c-6d91-1ae2-bc13-39cb5a70b1cc@linaro.org>
 <CAFEAcA_9Ss6LffwquHbssZ=XUSWAsL6KkKCPs1N3q44aG5m3Hw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67309c83-0118-fc7e-e06a-da95194bd5ff@linaro.org>
Date: Tue, 29 Jun 2021 09:13:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9Ss6LffwquHbssZ=XUSWAsL6KkKCPs1N3q44aG5m3Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: Jcicirfar+3r

On 6/29/21 8:56 AM, Peter Maydell wrote:
> I added the groupings, and the final result is:
> 
> {
>    # The v8.1M MVE shift insns overlap in encoding with MOVS/ORRS
>    # and are distinguished by having Rm==13 or 15. Those are UNPREDICTABLE
>    # cases for MOVS/ORRS. We decode the MVE cases first, ensuring that
>    # they explicitly call unallocated_encoding() for cases that must UNDEF
>    # (eg "using a new shift insn on a v8.1M CPU without MVE"), and letting
>    # the rest fall through (where ORR_rrri and MOV_rxri will end up
>    # handling them as r13 and r15 accesses with the same semantics as A32).
>    [
>      {
>        UQSHL_ri   1110101 0010 1 ....  0 ...  1111 .. 00 1111  @mve_sh_ri
>        LSLL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
>        UQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
>      }
> 
>      {
>        URSHR_ri   1110101 0010 1 ....  0 ...  1111 .. 01 1111  @mve_sh_ri
>        LSRL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
>        URSHRL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
>      }
> 
>      {
>        SRSHR_ri   1110101 0010 1 ....  0 ...  1111 .. 10 1111  @mve_sh_ri
>        ASRL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
>        SRSHRL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
>      }
> 
>      {
>        SQSHL_ri   1110101 0010 1 ....  0 ...  1111 .. 11 1111  @mve_sh_ri
>        SQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
>      }
> 
>      {
>        UQRSHL_rr    1110101 0010 1 ....  ....  1111 0000 1101  @mve_sh_rr
>        LSLL_rr      1110101 0010 1 ... 0 .... ... 1 0000 1101  @mve_shl_rr
>        UQRSHLL64_rr 1110101 0010 1 ... 1 .... ... 1 0000 1101  @mve_shl_rr
>      }
> 
>      {
>        SQRSHR_rr    1110101 0010 1 ....  ....  1111 0010 1101  @mve_sh_rr
>        ASRL_rr      1110101 0010 1 ... 0 .... ... 1 0010 1101  @mve_shl_rr
>        SQRSHRL64_rr 1110101 0010 1 ... 1 .... ... 1 0010 1101  @mve_shl_rr
>      }
> 
>      UQRSHLL48_rr 1110101 0010 1 ... 1 ....  ... 1  1000 1101  @mve_shl_rr
>      SQRSHRL48_rr 1110101 0010 1 ... 1 ....  ... 1  1010 1101  @mve_shl_rr
>    ]
> 
>    MOV_rxri       1110101 0010 . 1111 0 ... .... .... ....     @s_rxr_shi
>    ORR_rrri       1110101 0010 . .... 0 ... .... .... ....     @s_rrr_shi
> 
>    # v8.1M CSEL and friends
>    CSEL           1110101 0010 1 rn:4 10 op:2 rd:4 fcond:4 rm:4
> }
> 
> 
> Unless you would prefer otherwise, I plan to put the adjusted patches
> into a pullreq later this week, without resending a v2.

This looks pretty clean, thanks.


r~
