Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2379729ejc;
        Mon, 9 Jan 2023 08:07:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtCNhJjtyBNfRoyuwPMksUoNzadJWUS6D+iwQ7xq0EMTRsBRK3OCqBdbguZNJe33uPlAypR
X-Received: by 2002:a05:6214:b10:b0:532:2a45:46fb with SMTP id u16-20020a0562140b1000b005322a4546fbmr9603080qvj.52.1673280472857;
        Mon, 09 Jan 2023 08:07:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673280472; cv=none;
        d=google.com; s=arc-20160816;
        b=aiEOsZLQle8U4cLspcpuWTEQcu89RyDP5B6sf5/r3h4Z0iweYDRATVAMtBnDELMCIu
         4GGDyr/dZ4RgLbKBuBC8e+/eog5RfcJB1fBcq31zhM6fl4Y+ghXkvcS0ps+6iVvELB8j
         qsiMXS3Hxbi8GMvFRmUUjU+GYVbwazIsjZ1MH1rEOJ6zo6v5aEqb9kMStJs0n7itAPqb
         dw+FPoOudjoB1T1EohY+8c5SNWKdejOzQmsVrZZkusVbTPW/LGsRkxZoJkFVNd58M2lM
         CkdK2vUuoxPzVKpMWCn+PwbTFb/eCsKXVPxNSo5xKZppDpZW929pLi2DWdFtAOnASLNQ
         Z8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EuagkxqdICRbC/KkI17Zz5DvIDXxkxYxKfwjKj7pM4s=;
        b=YGf30NPgeWAv0UBUwHsXR8m4odmtmumb/0FGvs00OX75Hm+hnQSgHHNwlh6OXduKEF
         jZ/pXE9ibRr3QeA0qkpkgWI5U3pJjuQd2JXx+M3mfBpowPm3z538uyv4HuWXVNBEnEAH
         AIXXFqEG+apsfaqXMn6Csw4YR5bz1UZ/lRCcR0abYaVLn1hFSBrkDtcd/3YFX2XsakQR
         gIqQk61k3D7L2sAz2vJdIyyC6kt9rTVdF1/EVQBvS5jLBU/wcpTQcxIXFl5O+afjelzj
         kUOJzOGDe5gm6Bv5EwNHVcf8bOzMJuT19uFTCZU8OAVEG2hRvSGce71y1gvpj3LN4Y3f
         TKmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpYZBQjD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a0562140c6900b004bb6c7521f0si4691091qvj.521.2023.01.09.08.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 08:07:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpYZBQjD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEugT-0001fo-1S; Mon, 09 Jan 2023 11:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEugQ-0001ev-QC
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:07:34 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEugP-0008Qw-9z
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:07:34 -0500
Received: by mail-pf1-x434.google.com with SMTP id s3so3959766pfd.12
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EuagkxqdICRbC/KkI17Zz5DvIDXxkxYxKfwjKj7pM4s=;
 b=zpYZBQjD7P4yAEX9d6ZyBAuIE1/BsFCp4p5+9nzRRaZBaX6NMaLQWNy/1DErf2Lyb7
 zOmTz+BszAjnICQ5pL/xz6lTd6xI414TkYrbtffTs1dc2npZBuu0mYb1bkQ2vM44cWOI
 HFwhNCJgnZnD428Zqj2pO5OgMUFOA4XSbjZ2X2KU6NunJltYLcbhgbrAJ0WdubEBF3++
 tnsBLU1YizgafCGVvPGr55ViZmiHhs4K6l2MP8lusB+VWgBolOlMt7iQ6A0KUqwi4TlY
 RAOer8CBxB3dJ3K7hG+XN1UncJdyVHICiIVK7w51vgFSQFMFVRtLGWvF5LTaVLZp01Wl
 acFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EuagkxqdICRbC/KkI17Zz5DvIDXxkxYxKfwjKj7pM4s=;
 b=cLS+LGPCbd7GfRSBwJiVpzDsQZ3Z/9GowAs6T2QAlxSBZly8Zb1ozgqK/1GBPby3GB
 DPRLGjlD/m0jTiL9/PJd/7Z8RLmKh8HjNTng9CcNSlSIerrmnBrv36SVHdLgQI6XzX7v
 YUWNfzPszBgSmTY6FxKgcwYhQfU6yCgn05QQ84N5Vt4g50HVoO4Qt4kgRwjQz8vpZT9Z
 dikP0oghwhTmFxW5aoBTnqyILQX/RqrnPXKju12D/Kx7Jrbz7WVI3SOLohH97JbhGONo
 PPJYCaLpPM5SH23rrm4bqGP8EUC4ObWUehorWGqa6IePVLOHMktIMkl7To2Tf7OFTdP2
 rb+g==
X-Gm-Message-State: AFqh2kp/1EgJTszkMxXAPlo8QEU0u230c8xLGm7kLNBTkfZ383RUGwQT
 BmDOYdNtaqrw0iPvVsfy76p9sg==
X-Received: by 2002:aa7:9436:0:b0:589:78:80cd with SMTP id
 y22-20020aa79436000000b00589007880cdmr3081575pfo.8.1673280451819; 
 Mon, 09 Jan 2023 08:07:31 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 u197-20020a6279ce000000b005855d204fd8sm5891291pfc.93.2023.01.09.08.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:07:31 -0800 (PST)
Message-ID: <55413dee-6141-2f36-ed8f-964df43aa578@linaro.org>
Date: Mon, 9 Jan 2023 08:07:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/5] hw/i2c/bitbang_i2c: Trace state changes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GGbHfx4XPepA

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> +    NAME(WAITING_FOR_ACK),
> +    [RECEIVING_BIT7] = "RECEIVING_BIT7 (ACK)",
> +    NAME(RECEIVING_BIT7),

You've overwritten your special case.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
