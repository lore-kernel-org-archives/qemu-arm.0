Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp119015lfc;
        Tue, 25 Aug 2020 12:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3IhNBfqzDhlKH/v+Xxlvoxb57T9PeRFCAszrxSc68Oi/3bT9cB3NtQRGpB4BQvDTLd0G4
X-Received: by 2002:a25:25cc:: with SMTP id l195mr16671307ybl.383.1598383285964;
        Tue, 25 Aug 2020 12:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598383285; cv=none;
        d=google.com; s=arc-20160816;
        b=iGFTSNAN9xpM/B8GfAb14NTjPAWn7DPK1v1gXaAmQqE8xmYid6urDvfR6TVq3Klzye
         UGr1tjSJUpEBdeTRE+q/MdqPT3JMMSsAQi39XIb/UYDBMD/YTidd4sENsPKOapijbOJw
         4HDG7cj/3UywHfXWbvcybdyhCNVejgyPcoSBYFVuagnZyvId1xuixZBke3ZQSzWQaKEJ
         d7yhPZvWxwWCCoMFDmDQmehd1qeNXF+LI65aeuRgbDdYCNfFB5P5S7bPffFTDXcDLPqI
         pAqknK6+IsjSBtmrzl2qP/13XJotp94zkb3DDq9WNN3hqpmAgLjBlyoHzokjgaPgizk3
         JWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZcOtDISNju5VANZIDXq3Afvny9xaiP4LvHS7gNWmCK8=;
        b=piCb8aFjqKIwUQ+u7TDFVodN5EKRlH+UHlBSYN3O3wPTKazydaWtfiJWLp1oQKV2gS
         i7+4k6WMOgLAyqDocYL1IiDR6mgVN6WEkJTHQfOo0JAuud5KRdVRHw3lrJW/bryMu4+f
         lUDh3rfhXrQ4GXAS1XSVMtM0ztoSX/fzBxe+YcdXiMrJXTGYOZ28vkvVcT/kgnizinie
         x9jhhE/4RpsZeh9CLZWselTJNlM02XGOz8FhZUMPRbFKIQFJP3xGZ8ZermvzqPqKA6AS
         l609aMSNWt+xfvwJPQxRyB+9strAPGvWyEOZt0CKqzBqktuFz9C0UINaj7mCJIJIKPQw
         ExJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jrOlbpJB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si15487659yba.196.2020.08.25.12.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 12:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jrOlbpJB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAeVZ-00061L-BU
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 15:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAeVN-0005yT-9N
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:21:13 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAeVL-000608-Ll
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:21:13 -0400
Received: by mail-pg1-x541.google.com with SMTP id o5so7511972pgb.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZcOtDISNju5VANZIDXq3Afvny9xaiP4LvHS7gNWmCK8=;
 b=jrOlbpJBoH84haagiXAR1X5LpDriUG9l2ako7Ga3gL8K+GcaHmbGipee2mwdxTIEkP
 yzSEN6OJj/CjkSOZxC5OM9PsQZgU+k41L5K/DvokO70UAm+AsxYVYv4cb+AX1V5sRbti
 +F202gC0kGM6/cWYe/8KmKOM/hIeKiPaF0UDnmGvF3GCpmyrqRu0vXY2FI17d/ioGl55
 FLasSXprJ5IEtXDkTV9oRfaF39+ZLo0/61IsmeonTzfeldafTduDgbqN07FnwEjgIRdu
 oubm8td3hFyeOkrzMaHAmx4nTk/g1mSbys7Vk9S4cRYEpVrc9iOcY6ryjGF/TPrgKuSF
 Gc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZcOtDISNju5VANZIDXq3Afvny9xaiP4LvHS7gNWmCK8=;
 b=KBUZKqc2CmXM9B9BD1tEZr0a9BiyMJViKuKyeD3+jh6NBqUVEu3XcDK0sm6R+T75Ga
 usM8jNAODJ9tHPQt4wxTZiTlZvJSQqIS8Um62sYZyjGv+flktJBRqL79bDpJJu+lTZXA
 yOe36ECW725TMFYnT9pZc/Ltm5JG/UxzDx5XFsJMH1gR0KT2y+59vpK1WhbudsIn7aBq
 2dAPasl0ZIBLffAuQge/AmNTtAJV2qkV/SP+a8oH4KwBNKGuLRIW/Jbzo1PN0veF82sc
 EaXu76xsH45P2M/9vvalMMZud1C7tyn2QP4TZ9gciLqXsH5w186sBhbrJwlYaomyx9WS
 xxVw==
X-Gm-Message-State: AOAM532qK0QYCPDlFeVZ6IbwGg7CEYopp/3kJSQp4dF7q162YZpnQ4kK
 7PYU7UxzdNGImzWf6rl6sxbq2g==
X-Received: by 2002:a17:902:121:: with SMTP id
 30mr9062086plb.205.1598383270104; 
 Tue, 25 Aug 2020 12:21:10 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id r28sm15303418pfg.158.2020.08.25.12.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 12:21:09 -0700 (PDT)
Subject: Re: [PATCH 18/22] target/arm: Implement VFP fp16 VRINT*
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b909d0b5-003f-dc41-9c15-3fead63b684f@linaro.org>
Date: Tue, 25 Aug 2020 12:21:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2RCBgZYtcxEd

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement the fp16 version of the VFP VRINT* insns.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h            |  2 +
>  target/arm/vfp-uncond.decode   |  6 ++-
>  target/arm/vfp.decode          |  3 ++
>  target/arm/vfp_helper.c        | 21 ++++++++
>  target/arm/translate-vfp.c.inc | 98 +++++++++++++++++++++++++++++++---
>  5 files changed, 122 insertions(+), 8 deletions(-)

Same comments re the helper types.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
