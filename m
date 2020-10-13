Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2141220lfa;
        Tue, 13 Oct 2020 09:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxypHajRE0YrSW5XPeaofroM52U0lrIJee46is8MvAIJ1ji+07JLegPAw/1sE8JHos8VLfS
X-Received: by 2002:a25:e693:: with SMTP id d141mr1314443ybh.8.1602608325293;
        Tue, 13 Oct 2020 09:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602608325; cv=none;
        d=google.com; s=arc-20160816;
        b=eJFBQkygxmVDsYFlmM+gcL8poFKYcZQ4dm5DU4DBaJrVdaoERSDZNvD31a2U+qfpAp
         aonVjzjowUVxZAgY7FMY0SSk5b2Mx9fFvFodFu+9/iZIs+V8BEojuLdAnqWW8mPnZtmB
         94rJouufaaBjp+ZWOj/YRM47PaUDLnOnYx8GTubr3cofUGAB8TDZFj4tyuVqQKwGxlCG
         caYs4ZGsW+BWe38Q+yKUyW3+9eOPKNVL+hByKIVE2CfE369wkDumVD6UG19sEJga/Ogf
         NLMedKZzsMYnijU87gW1LUFQF4BVMf8vDh79RFRBuKM5gvQKpC0QU/ALoP+gtl2iHJwL
         vH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kjcdsLCEJCFzeMrTcX3WjkgAnDjuz9bXPb1/3p7Dwoc=;
        b=Y4gWT0Ionz3Aq/OGIZ30qZv2RbgXSTbxJbOPyxRixX+0kcSRO76Ui7tclcSACZd4kw
         RjZ1Uo/tgH1u/Ql6cjMgHYjcZwZoMdMWLnIKX/cw4yvFyCeu/lmbrAAgEFKCVK+PrOSP
         f2U1fvcqaCBVwicdFuEHMTVOF5+/IkVIdbb8syT6LtyHCqF+teTtjlOikI7XCp/rZERQ
         sEZS209RfVcdiMs1otxfFY/nw0eajwyYnggVXO2cvdv0q2IrAatf/IKyozbu7+k98Yma
         r6qC6V/sfQe7u60KlTFfe/4yJDiijRXlA+U3zDqckxt4Xal5ojm7XNGAkxK1Q4lNzL69
         4LbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rN1o9EBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si466365ybr.82.2020.10.13.09.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 09:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rN1o9EBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSNdM-0007zb-Mz
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 12:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSNdD-0007zE-Eu
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 12:58:35 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSNdB-0006fi-SM
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 12:58:35 -0400
Received: by mail-pj1-x1041.google.com with SMTP id hk7so238198pjb.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kjcdsLCEJCFzeMrTcX3WjkgAnDjuz9bXPb1/3p7Dwoc=;
 b=rN1o9EBgVAlbdP950rNMWE+oFMxSUkYsQbgTEGl2hdhRTIAzfNXnemaCqTPxoq8XUK
 ZuQx31NfM4A5U4nZIBlh0VAdUt7I676zLu3N8yqnP/P/D5HMFTRXGudKNthQ+UonPmFf
 yH5yx40lO809dOKU00kJlDE5y02kClvoERCbXfOL+Nzb8zEYT4t7KwnaK2Cq6Jr5TitI
 1fLi8RXn5kPcLDg8ysGdEEoJ7x2GYuEHCSV+70/Tv640ynoZ6xpLtudbGadNFfthXeJz
 WDD3hcK72jDX4POsA/tZ7MXjZLAWBwRmEGdlVpG8YBI+uCNMpd02ajcw1bSG2YQj/XqN
 sm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kjcdsLCEJCFzeMrTcX3WjkgAnDjuz9bXPb1/3p7Dwoc=;
 b=niZX5s7fL7U3IjtyxereRLv4vu5/doPoSwpOuU5NRZZNdb33/Vcjxoc5SZHpCwq34+
 49ToHIkMqsQMoX7BA8YfXsMaQ64BN6Tdj0tV0tOgjZ0wjS84gFGMwGFFD54rmX2t/fnF
 wuyh5LYEKMQdmgNM4rZ4fH1+zrwwO2JMJl4DpdjKsLxs+UJ5j/3zpFX3XIzYtDGjtJg9
 MeibvcuHmL7YDfaKdIyC3Nq0la7NPu8mSkEtWH+1nxBew8fjDt1pjfWYiKhFBYxSYk/k
 heJ/RoqzkiXblTAjvMRd4UcxMveJhd3AlnhRStnC0wywJOVdhe2YXXJf2adJ/C95tOOU
 7DEQ==
X-Gm-Message-State: AOAM531Hkwdc722atKDyqJwc12NqN2NTiaqZdVn8wEK6vmuSJh+6UZ5K
 nk97GRQ7RPjcDAOyoZ1LBUnZ8g==
X-Received: by 2002:a17:90a:bf05:: with SMTP id c5mr657235pjs.11.1602608312296; 
 Tue, 13 Oct 2020 09:58:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x25sm178339pfr.132.2020.10.13.09.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 09:58:31 -0700 (PDT)
Subject: Re: [PATCH 06/10] target/arm: Implement v8.1M branch-future insns (as
 NOPs)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a055900d-a7a9-e1f7-6354-fb8e518d6763@linaro.org>
Date: Tue, 13 Oct 2020 09:58:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012153746.9996-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 828jyu9IdVfU

On 10/12/20 8:37 AM, Peter Maydell wrote:
> v8.1M implements a new 'branch future' feature, which is a
> set of instructions that request the CPU to perform a branch
> "in the future", when it reaches a particular execution address.
> In hardware, the expected implementation is that the information
> about the branch location and destination is cached and then
> acted upon when execution reaches the specified address.
> However the architecture permits an implementation to discard
> this cached information at any point, and so guest code must
> always include a normal branch insn at the branch point as
> a fallback. In particular, an implementation is specifically
> permitted to treat all BF insns as NOPs (which is equivalent
> to discarding the cached information immediately).
> 
> For QEMU, implementing this caching of branch information
> would be complicated and would not improve the speed of
> execution at all, so we make the IMPDEF choice to implement
> all BF insns as NOPs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
