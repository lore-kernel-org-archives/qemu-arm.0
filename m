Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1172592ocs;
        Thu, 29 Sep 2022 10:18:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4qVa++ufLjYvzDgEKUYzM6WDmjUs4JCua7vj9Av0QvmGkCCLk1pRTo/DsYnku++oA1omO/
X-Received: by 2002:a05:6214:20e3:b0:4a7:618d:44d8 with SMTP id 3-20020a05621420e300b004a7618d44d8mr3386148qvk.47.1664471893950;
        Thu, 29 Sep 2022 10:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664471893; cv=none;
        d=google.com; s=arc-20160816;
        b=EPIxt330frntTS9ZQ5INCcYNvWtQ7hBxtg5b9tluJUyaUWxETjcEv416w6vzOrMzzh
         wv/dq0ZhhVYLzd0lWl8NPshwTOPeLEC/U8oOrUe7Y7vzqlq4braoAv+GmaUNZbInWiJI
         Ogryu97UED5L5eOInjYYm1RbQBUTVGOV3jLDLTTP1c4GmWHDXXB8RNbJUIZtDJETdgvt
         HH/ocBaEV7yNRvqf+HtWtbb1RP/RyKitr1sFej8APFK0yrA3fI/+OIjDqaThhIunQMRs
         89h7E8vu6euc6eK6ArOuGKaoxo/Hse0mDURYXR3/oxb8UYdru7CS2n8+1uqnuLRSwMi3
         yCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=edrQRuIR3FERpq08TfqZhQs2evg2oKlpLH9Q8qcrE3s=;
        b=wm6/RGBTyjEq0xMx93kd2DDBBcCUx3tMbm/0DBP+UcEomXMfMRnBB8fBwHy0xX3UXc
         yUJI2L75yPFXgzWM3B5ygznoJKGLvpsGV4N4XG9m2vNoa02e3FsPEDJ+EOSgh6Tofd0G
         cemhY49HINOp+wzcZzHbn/HF4AtCTlOm/zoUyIPzUvNbjMbmDIZREKd9B1UfI5Qc9afO
         FVtdvAYOYi/w6Mcu9ozANnADAg0QiOmHvMAsRqGub2/ZcsQ4up9EZLqm0YJJBwOcSESF
         DJKY8gnPfbD+FAuK8SiHDkqC5JZlSvo5qskIZ97v8u52U2mExyg5xMp7lM3YGK5f+brS
         Kh9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aqzGyWQU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020ac84f54000000b0035cee34fd85si1465280qtw.119.2022.09.29.10.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 10:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aqzGyWQU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odxAr-0002KN-58
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 13:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odww8-0007Ec-DB
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:03:07 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odww6-0000RW-Mu
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:03:00 -0400
Received: by mail-ej1-x636.google.com with SMTP id dv25so4057103ejb.12
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 10:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=edrQRuIR3FERpq08TfqZhQs2evg2oKlpLH9Q8qcrE3s=;
 b=aqzGyWQU2gBpfeG6pK3Z8QLAMyLRrb9IRCPsos/yCzvpo8QmS4Ek3U411qWVq1s0Dh
 1Hoe/JpK55byzKNk5TjC1SR15yAUlZvFkAsHf+jaGIIqHC6DRbXwc8tCor9r/UBew59B
 2FG4Gh6t9xQx5PMrM1E3OmoHxDiKvpovSoKwOuSOC+cYnPq/Yc9gBm0Hk59TEdlfgulT
 b5+soHa/pJ4B+u+rpvHikfv4pwZSyxCQlis7bFk19efGlysgPXgs1aK9dT20njzBnDGW
 2v+Fh6JETpDxqIvEXk4+/U8quBys2yiuzzPL3T71kLP7LLxJBFbijRS863K3yAxeX7M7
 2aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=edrQRuIR3FERpq08TfqZhQs2evg2oKlpLH9Q8qcrE3s=;
 b=a9aaEztpUrKbiRAcmrpP2svFN9kzIKv87Yrmxj1MvULs6xHfQSH5a0wG7gCdsvZAl1
 RDJfR128yjUm1Gi6lJuiv6JrWAX9EnA+EbTPI4Iijn9YKmgbTrW8uEPWXKLr7mIt/ToW
 odErGRtItR7UcnHn3RsD7kG2etCl2M26SoR0+svjBwf/0w3rlqNgL7MEqCFN+N9Sy5o/
 o4omYOhLGK9h24TOq8ho11Y5y823YvTUCYlizrh3UDpBzLSWMg+Kko1TXZrNbAGrQtiB
 qGVm6cxQ99F7TXo8VqStvNixmfCoDB5VlM6/CYKmT29U//uIn2msO9/rD1AhbtXl6hcS
 QRkQ==
X-Gm-Message-State: ACrzQf027Q73yg9TxJjWH/GDeKecRZfRK9q5ox99F70Py3K4ad8Xxzl7
 S+q5WyjE3qFFz6SJP2St0ZY6wJ0kXieZuuv7NsPcOQ==
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr3353287ejc.619.1664470977232; Thu, 29
 Sep 2022 10:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220927120058.670901-1-jerome.forissier@linaro.org>
 <e2fa6d88-2457-983d-43da-dd341eeae693@linaro.org>
In-Reply-To: <e2fa6d88-2457-983d-43da-dd341eeae693@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 18:02:46 +0100
Message-ID: <CAFEAcA-D2L1Ncrp86sgXdN4xQ9Y0CQ1y86bfL-3K_bWitjXn2w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Jerome Forissier <jerome.forissier@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: Uf8opdOXCZsh

On Wed, 28 Sept 2022 at 15:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/27/22 05:00, Jerome Forissier wrote:
> > SP_EL1 must be kept when EL3 is present but EL2 is not. Therefore mark
> > it with ARM_CP_EL3_NO_EL2_KEEP.
> >
> > Fixes: 696ba3771894 ("target/arm: Handle cpreg registration for missing EL")
> > Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> This certainly looks right, as how else would EL3 set up EL1 as desired. I suppose this
> error comes from a slight mis-read of R_RJFFP, in that SP_EL1 may be considered
> "associated" with EL1 and not EL[23].

Oops. Applied to target-arm.next, and
Cc: qemu-stable@nongnu.org
since this bug made it into 7.1 :-(

thanks
-- PMM
