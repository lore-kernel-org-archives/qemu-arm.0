Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp4139701lfb;
        Tue, 19 May 2020 08:28:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBg4UJnqmBg10fij1hgIYyUtgQYJLwQqzV2AzMI0/vj5gKYNsStwGA30bCE02ejXUDbN3B
X-Received: by 2002:ae9:ed8e:: with SMTP id c136mr19897152qkg.180.1589902112879;
        Tue, 19 May 2020 08:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589902112; cv=none;
        d=google.com; s=arc-20160816;
        b=tHWFZwmv/dgk/lDpljG0RR//ogmeAAQUArdCd01Yp886b8NKQuug4Vss1CzS4/e8je
         Dda/xu9ZDlWkuD3oVv3AaBZRXuFxEoS+UZGaMGDLx8PufwcDapOqiJiNUu4Za3XjfgmU
         lw9S44M2AFKt8jSkFgNTpAYWPJJUu21EIu4q4v3ftGCOVxXcb69P2l7hM2WdPF9dDwZB
         pFmbrCtHdkft1bKB+xFwnsnPye20JR3UATEBlwmJwmwlcCm4XzNdrNuv438Gcc3zSL7C
         hJilXhVA5VXDPL/vxGLnly9sd/Gqfc3TnZncJei9LxCj/9ebE6DS6aOV7srnAae2Kewj
         wkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ekV9LOn45uEl+E8BDFIUMuZv1J5gOmEIjpzRNluTkUM=;
        b=wD+tEbRH3PF+nRC3TutMAPYHg5c7uy9iiPC+MR3XP5rlpO4zcoWfvrB7cJ2Zg5lEBG
         5pV3IglyJ78iLpptSub9HdQE/myRRh4tml/Fb36E/2JG284iz6OZW4xjPZyHymFd7Y8f
         5kXpROxL/WK8MBhz2+wYN5c2w99l3XXfJB/dnrYLgBuJSlk0v+LKoL+BLJwd1hx+7VAW
         fjtPeOhCzm3iHm8ZFPixcUthHIJFGBCB3lvZ7lpqLpST8fvzf7zDcOn3igxvNxLa4KLH
         NGB06mHgOiYbiDvGRLG0lhrW+bMcmpQ91eUZIAb2K7Vh57eBOJp9yFMccO7E85QTOcg9
         CQxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mM0V5zU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si65610qks.262.2020.05.19.08.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 08:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mM0V5zU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jb4AS-00071u-AI
	for alex.bennee@linaro.org; Tue, 19 May 2020 11:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb43W-0005WZ-Si
 for qemu-arm@nongnu.org; Tue, 19 May 2020 11:21:22 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb43V-0001Hs-Pb
 for qemu-arm@nongnu.org; Tue, 19 May 2020 11:21:22 -0400
Received: by mail-pl1-x643.google.com with SMTP id w19so3973716ply.11
 for <qemu-arm@nongnu.org>; Tue, 19 May 2020 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ekV9LOn45uEl+E8BDFIUMuZv1J5gOmEIjpzRNluTkUM=;
 b=mM0V5zU36vLlfLmcpkZSffXhm86r6jXSSlN2a8wXn1wqbvHrs/+k6f3iCvZkOqCUPh
 Ianv1NwcmIc+3m8aIwzzpqxorJcBEr3F+Ntyatkp4/z+3mSfH1psaJ9wem65ITxyIvDU
 gVaUNzbl+KYoqQENLv5Cj9jKX7WsdjvAl+bTChSykecpkekKHJUCV+ZCgghZ7GkF5+V0
 iRhVi6TzKAZyz9cWuCsHEFANYUzzj195PgRe4ts6QqerzIL/pTAZVmB8aGAPCIWzAY80
 ptudNhEsZjvcFlBDr0WQTpJdnRuj4On74Bnd/ErP8qM1VMwab1hWwMvzK60857APxc3h
 BZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ekV9LOn45uEl+E8BDFIUMuZv1J5gOmEIjpzRNluTkUM=;
 b=FcsXqwAVhCXN5BaL1V5DtEv250RXoKib79YPGGc6myUqt8uAY/ABn2VpnaZj1ZyZbu
 81L8fmHLFcruVbgeZZMgAKFBOT+LbRrv5NM8Pfojs/PGgElN6fKwcmn2uOGrla4Yikh5
 sp+lFVEtg9Wk7/WZsyzJJVl0dEGF+TfP8q27gFn/LVD44GfaQQNSqUO14pMdMsp3SGR5
 dB/Cas+Jpy2AuvGvfifqfhZiZyv9RJbNxi5jN2nWvU13r31TvlJaA6kcVOR82xvDxGmY
 b1uS4CljtnB/yCrxHyMuZvk+4uIIRpV1ETeMHETsNhfRU5NnPWK74F5ez62765cuCqyg
 SaSA==
X-Gm-Message-State: AOAM533DKW66UREl2lRWgs9LOFF8HkEbq7g2OYy4XrxrhgPcvXd9d7wg
 pC58UAxLfl603jr/0lWcIrfpCQ==
X-Received: by 2002:a17:90a:4497:: with SMTP id t23mr97534pjg.88.1589901679045; 
 Tue, 19 May 2020 08:21:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i2sm10352158pgb.14.2020.05.19.08.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 08:21:18 -0700 (PDT)
Subject: Re: [PATCH RISU] arm.risu, thumb.risu: Add v8.2 DP and FHM insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200518154719.18562-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d939086-a431-0922-4623-88cb517993f1@linaro.org>
Date: Tue, 19 May 2020 08:21:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518154719.18562-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: VbHo1gg+C6OA

On 5/18/20 8:47 AM, Peter Maydell wrote:
> Add coverage for the v8.2 DP and v8.2 FHM insns in the Neon extension
> space.  (We already had the v8.1 VQRDMLAH/VQRDLSH and the v8.3
> VCADD/VCMLA, so this brings the risu coverage into line with what
> QEMU has implemented so far.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I added these patterns as part of testing for the first part
> of the Neon decodetree conversion and forgot I'd never sent out the
> risu patch for review.
> 
>  arm.risu   | 18 ++++++++++++++++++
>  thumb.risu | 18 ++++++++++++++++++
>  2 files changed, 36 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Sorry I didn't submit these myself February last year.  I still have them
sitting in a separate .risu file that I used for testing originally.


t~
