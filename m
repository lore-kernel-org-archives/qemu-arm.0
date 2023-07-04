Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2964165ejy;
        Tue, 4 Jul 2023 08:01:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFPgozEiX8UuLxPy47ALvxP1XXPZZV8yI5STqlAV4mLqTQOtzKh5CONfnJRnAWHr2SgicgJ
X-Received: by 2002:a05:6214:1d2d:b0:635:f48d:5b5a with SMTP id f13-20020a0562141d2d00b00635f48d5b5amr15693753qvd.32.1688482871575;
        Tue, 04 Jul 2023 08:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482871; cv=none;
        d=google.com; s=arc-20160816;
        b=iCNAeQNohMk5Rju3gXFRHKuKT1wo+V/+8RF3kAHzZpFbQ9okuapsbWO17pmD9Z3OAM
         t/5y8FcCUekedmWyRoZWIFNvU52zmM7y15Mmfo/ddReo101cc7t+DIX5IFRCY8iBkph8
         xdi1aOvYFrMpzpK8xXgtNGoGU+bjnmXzTCVfkhlSQ6Ys3h00b9qP2gluf+DTl1x2UTRs
         UakZwqYnDtPmPVuyKQvnS92scXOYKc25/uBsBG4xN2mKk5eRin0L3noGBsmiAchvguSV
         XJb0bIjfb3/NWALfFdXvuGXt6YFnnqescc5Fvwm5YToudhFfBCjnjXx614eBBEHSSiFT
         /wYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vsfhz2XcvAmjqaIo2HEYGsXHrqzNSeMe0aXhOL6xXRs=;
        fh=5F2PQs0aPgdaNvvTsxMsE1P/StwUxwlJfGJYEKIjhp8=;
        b=XMHqSg3tP656RjTFrYV83hJ0LhO6gx5l5kplf4CBzd7BBrZA1REhQeBVpnV/2hfEZr
         TzNYngA2qEvaQ1RGStOlCKpXifszNxp9RFvY+Dob0ayKxlub/bUYbqW0MrwweY01/Inm
         0TBnBk/bp2svIuFTP/uKM/q3MaY5hEQcjxTYYNjxNupVWhZ1oeNKJ1sRLQlEwM+tELRU
         zPsKG4xZVKE/0OXk96E6Q2nY90242tmYKl4L/ckMHXNOwB+nMSu8mnTyM+KRvo88R4tY
         7kxRLnuujR1RhBccyYtL8g2TMQDYwdXfgxVLvxAkHuMsVXc7ihAUIbhCCSNYlDuiEtfN
         3ONQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbXTmaEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020ad45aa2000000b0062de0aeba43si12458697qvg.147.2023.07.04.08.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 08:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbXTmaEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhVr-0004ds-DB; Tue, 04 Jul 2023 11:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qGhVn-0004bN-PA
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 11:00:15 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qGhVl-0005ER-FZ
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 11:00:15 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so8906477e87.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482811; x=1691074811;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vsfhz2XcvAmjqaIo2HEYGsXHrqzNSeMe0aXhOL6xXRs=;
 b=GbXTmaEQFm+hg4TvdYDET8kCJ9vrrxVuArwwTAiyX+bpDxqrqzEnyoxhj56O9SssAV
 KPm1JwAoMMkIEweR0wsxg5pOatawiqmMmUDi3D4j15sj8rTLjgs22Jnu2ZPM4JcdUAOV
 LaNAL0An0RLpVcX7FTja0nWZaByETrHcg/vVeDvprPWc3yPaXHTmjlIBoDqXvvvMq4Fk
 dngmOZqY5aknNqvRQZMagd5k83DrSZn2zpG1W5verRRP9UIkkzbERAPBZjExH0UTElbd
 yd+gCIcNtMEQl/gVjnylWqmoUTJ3Cpvs2MU2Lk06SsREDVV0HgpT61L9lCdWXVPtIWvA
 XxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482811; x=1691074811;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vsfhz2XcvAmjqaIo2HEYGsXHrqzNSeMe0aXhOL6xXRs=;
 b=ZWa5OrCG0QLgphe5Xd6hgiUu1U11XmT+0ED17q0dVpbBlPMPZGtDrvLrJhuCHK0pAL
 vW7wx/BEAnHJTvGAwBAefUA80ygPEHYokEtQFYt2Llbv7QbdeF6m1UbqgjtGwe+iPrXy
 2E9QbOkBRyvOk1vEzMZl9UgmVaFlX/CtxSztFwbSB56n+EoNq98iqSwCx0QeXyHBbixm
 CBJIfnk23QmpdvOyKHsA4jO5vpspnCaVjkwx40KazJ0vqpZsKNWgT65wkI6XjeLhOCpE
 C+4t03ljujy18p/3UrfLly2EEGniyEuxIEQ/Jb7Jx+hnzTZWfaw99iFXxJA6oRe5gEZT
 N1Rg==
X-Gm-Message-State: ABy/qLbjKT1G6VTIPnGOrBOWzCR5f7xb/CHw9lC2pyRzwne0AjfmiBZS
 ftRtJ8W14+Jrz+OgqhfvshBDhg==
X-Received: by 2002:a05:6512:10c9:b0:4fb:89cd:9616 with SMTP id
 k9-20020a05651210c900b004fb89cd9616mr10288436lfg.0.1688482810812; 
 Tue, 04 Jul 2023 08:00:10 -0700 (PDT)
Received: from [192.168.200.206] (83.21.151.197.ipv4.supernova.orange.pl.
 [83.21.151.197]) by smtp.gmail.com with ESMTPSA id
 d26-20020ac2545a000000b004efe73ee01fsm5119878lfn.306.2023.07.04.08.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 08:00:10 -0700 (PDT)
Message-ID: <2182ab07-ca32-22ae-8c5a-5d23bfcec5cb@linaro.org>
Date: Tue, 4 Jul 2023 17:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] target/arm: Implement Cortex Neoverse-V1
Content-Language: pl-PL, en-GB, en-HK
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230704130647.2842917-1-peter.maydell@linaro.org>
 <81e6bf97-b6c6-e09d-51b5-445bdc3a47bb@linaro.org>
 <488ca2a9-8e1a-3a62-8487-fefaed69ca8b@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <488ca2a9-8e1a-3a62-8487-fefaed69ca8b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ioH4V6fqRVjT

W dniu 4.07.2023 o 16:54, Philippe Mathieu-Daudé pisze:
> On 4/7/23 15:35, Marcin Juszkiewicz wrote:
>> W dniu 4.07.2023 o 15:06, Peter Maydell pisze:
>>
>>> This patchset implements the Cortex Neoverse-V1 CPU type, as a
>>> representative Armv8.3 (+ some extras from 8.4) CPU matching real
>>> hardware.  The main thing we were waiting for to be able to define
>>> this was FEAT_LSE2, and that is now supported.
>>
>> Now I can add "reach SBSA level 4" to todo list as it requires v8.3 
>> cpu (I do not count 'max' cpu type).
> 
> Do we need to introduce machine variants, such sbsa-lvl3-ref and
> sbsa-lvl4-ref? Or simply sbsa-level3/sbsa-level4?

No such combinations. The plan for sbsa-ref is to have only one platform.

Version of platform is exported in DeviceTree already. TF-A reads it and 
exports via SMC call to EDK2. What changes between versions is present 
in documentation.


