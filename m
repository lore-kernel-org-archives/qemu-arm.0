Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1309505wrg;
        Sat, 8 Jun 2019 07:05:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGAw/CRFL4YiNOzFrw+GsFDXl3897iKrHvEKeGTM6vf2Hy/4V4uzj3cTOCsdOsx4+MXnoT
X-Received: by 2002:a0c:e6a2:: with SMTP id j2mr36660790qvn.190.1560002705600;
        Sat, 08 Jun 2019 07:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560002705; cv=none;
        d=google.com; s=arc-20160816;
        b=jQqxTKDsOb63Mu57z0KUfSZZTXQqFWBm/Zt+9gDH3KVq1n251mtONwE+dJJQveT0HN
         fmlXYAJus2QQi7jFdltBfXvjJ5UJlJjwof/zycRC1crOomt7YrD6FhPWsN78KbS/R1Uf
         WPveOqX3BlGuOhqSeMZiOKzxVSf369nOIEU6rDx3XnXZmOGMX13TbQ94CfaulFCwMKrm
         6gINQZbziCBfPlk439QA5S/nxPQ1z4r63RetsKGTbxBIPTzEYq/5HOvlAd7LBsL/rp5K
         rft4ttEdnml+pECashCUluXi+P0+KvVDmkZ77dy6aYyzniJi1sIRisnRPXHUlVwrbu5u
         zS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=jvhJ4tk5f4ohh/VfmbKP87KpI47MJN8SdJaeIi966Hc=;
        b=XVlvN2Lucd0ZUckeuueQQBsBfxcsuXIJi5E+Rqmxunt+AOjDcTFrHTqujCUoBpbEmm
         gyHvVY84m1TDVv+FxSDBOivFMWIPTGKAA74PEBE8iK7SVDZBwfelDo2fpFTCfOjArsi2
         f9ka/TnRXrCzR8t8Tb5rzM9AF10gdEN82ocura/DvZaMGCDX/pxcwW+UOLXgxFHala9o
         mDFVNwMNtJ8HRZfP1zS49D9b8aiFc4JhRL5LVKrQugHL6ki+16vxfOimUi410pnM8T3q
         a3T2z+5UOspiEdd/CnwiGjso2xLOBMWoNqRdyDtGk9o1uUi+tdl3ak+pEDVJVB1RuYJF
         oIGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hG1RAwnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si3354241qkf.16.2019.06.08.07.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 07:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hG1RAwnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZbxx-0002Ye-6M
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 10:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbxM-0002Vs-7g
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbxL-0001W1-7q
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:04:28 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZbxJ-0001RE-4d
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 10:04:27 -0400
Received: by mail-oi1-x243.google.com with SMTP id w7so3391529oic.3
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jvhJ4tk5f4ohh/VfmbKP87KpI47MJN8SdJaeIi966Hc=;
 b=hG1RAwntqQmAmFHt5qhrho6H9CWK0CTmaKy75S3V4KNXwHX02RVSgK5+Up6KBkcZLO
 +/CRQXazr1bpVK+AY0q90WG+kHADqlvYIVV4G2yeQbKfenuNtbQGXGJ+gzl8cSe9Q07n
 xwrO88ac+HDgFqb8iN/KazKLzuzoRhiR0j8GIWNBhwFQBRhrFnAopMJyqUmXvqx3rk8b
 6mmucj3KaagVi+EEc1RVepuMVseUZKCzk2wZbtbLbb1NWMDzwob5ga4FN9z3CcP35YeJ
 mwot5yKKz93Kr5psEM07ovKI4o4cASkpMnXo5ICqptxBcltLq2M9ZCEG/DcCN92aJoex
 G0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jvhJ4tk5f4ohh/VfmbKP87KpI47MJN8SdJaeIi966Hc=;
 b=dP+l2PNaOnNPanc2uK9Jq0NHfRN51p/BLRESVb+O6iOtCCVOSWk2k9GGtAqwyQCG9E
 6V6HjOwId+cZ4/XDQbu/Je9UtJG89SJ367yLSKbbqDOV6G3UoHv5UIdL1xOGAFUfZVlO
 3YdvKFJYLak9EheoosQFdMhc9l2QiLVHQvNBUMRDqY4I/m4EolnrKhiaIepR3xSnUhm5
 X0VDU3dNgr8G142ekIGvPimidxwOeupYCMOlc+CphXvm2rv3Tl53/UWbp6Yg7a3lK5b9
 flr7FUUysnCGDsP4ECV11V/Pbo4jsPiaUAzxLlqoKTM7VM1ETKQY2aUoyKyK2sF0ULGg
 KOrw==
X-Gm-Message-State: APjAAAUG5mGLhvujoqn3CfN/WKOr4PnRVzSVpA7jevewfYN31Sj3kGDX
 4lnOv55hEiIRuFIyDgdHDcV1TA==
X-Received: by 2002:aca:3645:: with SMTP id d66mr6635253oia.64.1560002657470; 
 Sat, 08 Jun 2019 07:04:17 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id s1sm233288otq.28.2019.06.08.07.04.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 07:04:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <30a408b9-9419-cbee-5abd-7b0354ba53cc@linaro.org>
Date: Sat, 8 Jun 2019 09:04:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 16/42] target/arm: Convert the VFP load/store
 multiple insns to decodetree
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
X-TUID: IvQM6FOQmayM

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VFP load/store multiple insns to decodetree.
> This includes tightening up the UNDEF checking for pre-VFPv3
> CPUs which only have D0-D15 : they now UNDEF for any access
> to D16-D31, not merely when the smallest register in the
> transfer list is in D16-D31.
> 
> This conversion does not try to share code between the single
> precision and the double precision versions; this looks a bit
> duplicative of code, but it leaves the door open for a future
> refactoring which gets rid of the use of the "F0" registers
> by inlining the various functions like gen_vfp_ld() and
> gen_mov_F0_reg() which are hiding "if (dp) { ... } else { ... }"
> conditionalisation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 162 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c         |  97 +-------------------
>  target/arm/vfp.decode          |  18 ++++
>  3 files changed, 183 insertions(+), 94 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

