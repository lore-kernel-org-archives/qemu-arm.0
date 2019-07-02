Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3682794wru;
        Tue, 2 Jul 2019 04:11:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx08sRZQUCiO3zJsnJqXm6K+9Acz8413fpT5SBIigLDx+wmKZsMX0cVEhFb4tiWuY1++Vnl
X-Received: by 2002:a50:ac24:: with SMTP id v33mr34931662edc.30.1562065898477;
        Tue, 02 Jul 2019 04:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562065898; cv=none;
        d=google.com; s=arc-20160816;
        b=bWig3y5qNjs5dH8FSeSCGP7oj2w5pp/JWCwSDoKE9eTSXp3Lh1kygyaX7AFPGpSK97
         FTuGIzPonTtRyZinqvDNq57vDq/9/UMHCi8YCuTD7BZfodiVyHiAP30tQXZQkTTR5kvD
         beFCGDm5znSVWVOD7l0AVK86Wj0H/4cEqWdqowib7R+BLVRZo31gmFYKnxGpDD5xlp1Q
         b2ymfAPrvzWWCwBohcVahvp3HButKF2MOfq+tYiefZpRQDn2ycrTbz3dsskhDWjsOSQe
         fdORpsmwpOh5/lbeYGP0ctsF5aCtynPfB8GCPjjyQ7BjotKhXR+Cw1dyZAsh70Daa9C2
         2zSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=4ksgFXLm2V4picF6y8O98mbXx4FFmwubuHlJ5yJyT6c=;
        b=o+du32lLetm9NoL+0AIUdC2S1WA+j4/KXnP7DZnxofOySXbqcdQFuCXlF0C5AKSOUC
         eP9br0T8zAypEFstJ90F6FrL/e5+WR0OOc5sFDGF5Hore++HnPguGjzJ9jveFoYGtq8a
         gP//DehUn4Us6o4Ijx2XUJMDQQYGtTGD+0QBTWBrw/ShNqYCRMLRjgzgmTtOQFM/wFBb
         N1l0bTCy4R4YrM393Sn9ioVw5ljz8JrCddEv2v8BkVWGjg8pZ5GQKFAqZGF+MG/sVW2r
         o7U6YpfrH/6dCddPpZ1vyouLPkO6Jb6TTSJnHNcBLny62fgel735ZQFs+eSGt+mAGKH1
         pLxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HTExFPMd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si9117130ejq.294.2019.07.02.04.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 04:11:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HTExFPMd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiGhF-0002dY-Ge
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 07:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52822)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hiGVO-0001iu-9h
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hiGVN-0000Y2-Ct
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:59:22 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51687)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hiGVN-0000WV-3n
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:59:21 -0400
Received: by mail-wm1-x341.google.com with SMTP id 207so415401wma.1
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4ksgFXLm2V4picF6y8O98mbXx4FFmwubuHlJ5yJyT6c=;
 b=HTExFPMdNM4Z/DwAPwFp39QoW94zlCarNlymorXpRSKYyeEQvW568YgmE6GVfYwrLx
 yEsfqHcidogPCBGPb7L2R3npnFnW4sQRvV3kUkhE7DC7Fboh2U4/Ev6oZEw0MQNA1C2N
 UgK+dW+m8+pxXupc87LK0ipvq8QCXi/Yrgra8ZwsYzfXrvvS3oX3LRMUf03B4qKgCLze
 qaLqF/PLAVSPYSoolJ19MaagePmH5WSM1O7rUu2VrCV7lwzdGCmca3U+i7Ta/vix8Bs7
 Jn/p5x33933J8nxl5EVUIrN6F25HlACwTGCkQGBN0Z2due3lZIMZjuR05BVtKPKhujuh
 ZbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ksgFXLm2V4picF6y8O98mbXx4FFmwubuHlJ5yJyT6c=;
 b=j66gPEl+gKsyf8baAC24qtytpTGshWlagaQSTcDiqNT6RZG9L7ej8h7Enib2Yji2/f
 tLkgZNn6syUwyrAExVQkybRzNE+UMfK0psmGVn39rrNUC77WR9kqixqBw+MsSLVI2I6I
 WV9z35FcyL18rRjO5Gf1riBSH5Tr7v3NxEtMWy8y6HOMdclh78WCUPHPK99Faq30gUVp
 Yb5Bga4gMkp4Q9MrKOUmvUSLvqSmKN9Yh0ZhwYYlVB7HXkM5koGagsaVM6T7omlBeOP+
 pT414M1VyAgeT/AUmJWhDeds+6nUT/lmdU07EvsY+6BaUugIPAgkFqh0f5WJ1y2ETj2E
 sxvQ==
X-Gm-Message-State: APjAAAUliYnnB8UFClKb0V9HFlwzKIQDmpZoKVpP+DqfUt+t3uqjWoQT
 I95BWzzsippof26rPDH5T0u/jUqyNUlsyg==
X-Received: by 2002:a1c:56d7:: with SMTP id k206mr3036715wmb.56.1562065159847; 
 Tue, 02 Jul 2019 03:59:19 -0700 (PDT)
Received: from [192.168.3.43] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id f7sm16505397wrv.38.2019.07.02.03.59.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 03:59:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190702105115.9465-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7896f53a-69f1-8989-f932-734323d8a9b7@linaro.org>
Date: Tue, 2 Jul 2019 12:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702105115.9465-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Correct VMOV_imm_dp
 handling of short vectors
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jyGD8NH8OLLa

On 7/2/19 12:51 PM, Peter Maydell wrote:
> Coverity points out (CID 1402195) that the loop in trans_VMOV_imm_dp()
> that iterates over the destination registers in a short-vector VMOV
> accidentally throws away the returned updated register number
> from vfp_advance_dreg(). Add the missing assignment. (We got this
> correct in trans_VMOV_imm_sp().)
> 
> Fixes: 18cf951af9a27ae573a
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
