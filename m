Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1190831ejc;
        Wed, 27 Dec 2023 14:06:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTYKMFcjoEZtjE6x/VqnXBMP1cQ3F8+1+mcx0/bMpPDALZ/pJ371REdHDyXmiNWZU70+JH
X-Received: by 2002:a05:620a:a46:b0:781:581f:b79d with SMTP id j6-20020a05620a0a4600b00781581fb79dmr3472728qka.147.1703714808003;
        Wed, 27 Dec 2023 14:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703714807; cv=none;
        d=google.com; s=arc-20160816;
        b=rObvWPFDL6YviB6ba74WmEdXv3CzOFMDhOicFO7uw7Oe+Jk9zstoL9ZhDyWPD+1Hyr
         bhNnFikPz7dLbtSKA1bszo+M40i7NkhVWkjnan2ksci1xzMNZTGvbAxyS6aLU7F710S+
         0k40ouNjVFhKrj7s7c6q+NCyYFSEhJ4L3QrpUfKJfVvoPwQ495Yab/QpFAeDC0Z0bHUk
         x+EXsNGIrYBzt1ebTpPzLEIcTxWRU/2FWObSzl6495lf2GvVhIBhUAPoKeO0RnkOBdsX
         yR7Om8cjOBauA4FDiES/8fjT2yhkeW4C6Y/MY22xMtm2Mv6KnFRGI3BtlcPGFr7RBrCO
         OTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=50QMk78dUVGW/REqyuG3vJ9DuzRgURXeSt5CRv2U6Zc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=DH1Cq2aXy0lWaPcEaG1kxJ1evEmq3sEelpA84+mfO052NVIkTZBDTlbgSQKYI41KcZ
         9q2qsFpsGij8tcEzQ8oDLDRto/3DkFpsqu3EHOMKF20Rzk3K0+yx4X2l/xzAmJWpsqOa
         ogSaBJWzIj3iDl2ijuylLCYJIWIjYqkCD1Bc1hjhB1/jXevjZkXDkRLeR/FXbkEgqEbS
         9a87H9G8YkMloN35ZQUAgQhFCDIpJm6tst0z5c56itboZNUN6aQ8gvhP7LorTIAqTUaZ
         SJyd0jOudKtDXrqvuvXjSPsMsoW2hsNDf073UI20uXVTzMYYCWtkkKqEH1PMDQh9IN6U
         DLIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQFbHkBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a05620a254f00b00781711b6379si566115qko.31.2023.12.27.14.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQFbHkBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIc2y-0004AZ-0b; Wed, 27 Dec 2023 17:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIc2t-0004AE-Pe
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:06:36 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIc2r-00034n-O3
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:06:34 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d3f8af8297so20973995ad.2
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703714792; x=1704319592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=50QMk78dUVGW/REqyuG3vJ9DuzRgURXeSt5CRv2U6Zc=;
 b=bQFbHkBmB60M0kp6Oy/MqyZXder2jYSjJwC6Qe8wzbLeNFeU/EHBPVo8CxJS2kn89N
 yr8PQVFIXoAeI3NuatCKYkV7M0o+yOuFTKbRRGrN4m+KEiAa6x2G8GOIU10RzuYUXBLT
 yijfaprLSVgckjAl7sW5Ocb8sO4wIF5MDFkynkLF5w5z1+BqpzD4lsxew+xDgwzVkjPL
 CJJBOGWVH2D+1DVzlw9E5bgIWhJ+aBMRc3i5B+PFUdIxhUZ/C8zDrSj6SuwuB83+eURI
 /ouQYvT4ttm3wMKuXrscnlaauOzAAoYyyR9yqQAV94SIYGRdsa/W2+ZNpPczdcdE3Vct
 kz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703714792; x=1704319592;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=50QMk78dUVGW/REqyuG3vJ9DuzRgURXeSt5CRv2U6Zc=;
 b=KpC+eSw62q9W7N5TFWXIdQ4MaZVnCSRYYPJtpUxb//w2l1+tZW0tDHpLdCeUNxeN2R
 0e7Zm2F3J+YctBXp56/AJ9vkGfNH4QGrR5zsazCY2AXu8vLKeSxw6UEDQee+gSkstM4L
 JSLLknlj6qYT5XAnWifj3dwn9cTbksRMdfs+idBsVOdmdyPa3trx3MyOiOeouSVJY/R1
 KeSnjTJsNFyXkJZI5Gnm3pkBDzKgyXsohEhC2xTfGByEhIGF7ihBiyky90+Z2Dk+EKX/
 BzNpNHJSj9DFOfXuoNHWzHC9pQW5vtNUpJDxESjbDiiQANiT4FaAws7CS/VwZ3nk9i8Q
 Hxgw==
X-Gm-Message-State: AOJu0YzDzKOc/bXO2++dW10T3MSRrbhjskCevvzwlQtWSvcE/O03IAYZ
 Gm3mhjHXREex/7BC11QaTcHxGGu2v3VfOw==
X-Received: by 2002:a17:902:da88:b0:1d4:39cf:c94e with SMTP id
 j8-20020a170902da8800b001d439cfc94emr2987189plx.49.1703714791960; 
 Wed, 27 Dec 2023 14:06:31 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090274c300b001cf6453b237sm12509479plt.236.2023.12.27.14.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:06:31 -0800 (PST)
Message-ID: <333ce9b4-8e00-4800-ad93-f65f1e4f10c5@linaro.org>
Date: Thu, 28 Dec 2023 09:06:26 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/35] target/arm: Enable trapping of ERET for FEAT_NV
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: Jm/Iq8wSNCWb

On 12/18/23 22:32, Peter Maydell wrote:
> When FEAT_NV is turned on via the HCR_EL2.NV bit, ERET instructions
> are trapped, with the same syndrome information as for the existing
> FEAT_FGT fine-grained trap (in the pseudocode this is handled in
> AArch64.CheckForEretTrap()).
> 
> Rename the DisasContext and tbflag bits to reflect that they are
> no longer exclusively for FGT traps, and set the tbflag bit when
> FEAT_NV is enabled as well as when the FGT is enabled.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h               |  2 +-
>   target/arm/tcg/translate.h     |  4 ++--
>   target/arm/tcg/hflags.c        | 11 ++++++++++-
>   target/arm/tcg/translate-a64.c |  6 +++---
>   4 files changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
