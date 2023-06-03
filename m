Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1998064ejb;
        Sat, 3 Jun 2023 15:45:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BTwj+cqYBqjUs2ZKerAY8sUqHBpEgrBqaiSKf0QFpFdJgG55w+n+sNz7YZTG9A2TTnvmt
X-Received: by 2002:a05:620a:3b94:b0:75d:50ce:ef09 with SMTP id tm20-20020a05620a3b9400b0075d50ceef09mr945908qkn.10.1685832307700;
        Sat, 03 Jun 2023 15:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685832307; cv=none;
        d=google.com; s=arc-20160816;
        b=Xa+WzIsF+rneJiybtvaU5s32vLZqkDbG2q9Q7UIWCRcuFUUShaB3mWSQhERSf+fsja
         xSBMkanGrJM6qh4rusV5C6CSl+oz+d5eNkun5isbAPVD7ADaJ/zdBFtqSn8zfKr6ENZi
         XlL4d2TrtI4heO4fNzA7/KTIpWCO1fVYB43W6IYGMHqyFDnQ4yTqdZemhrlHInxbRzZd
         Oc/BJnaAiW4XxiOBIMZgdc7g8fXHPdZAT/5LSsZqi2ezdSVGc7mZteImgA5d32xLy5t+
         fcp4XNg+fZ1LW2Ha0a1FX3wVw2hm4SdJ6l+onTktPFHKwqLUOH01XT35tirSGbY6k4zW
         FfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=G5spGaxIHtucAmezZziqf2v2RiSjPuUnmxs/qojTilo=;
        b=JvNMEoicLpJIa3ALsjYXs6NHr0jfTGxp8AO3HngFKyB2YRUigITdn2dCbVb/OXuwEz
         HbU60GVM3a2ypfl/r3d5hUvUDTgJZKoPieK39WF2jfMbrekNyKXc3sC/nahi80SV2EfC
         rdytaVAxscLrCychioB7I8B3j9CZoGoxfqye8uqdXlvX8CwIoUB7qrtZk8zBWxixqL2X
         5xW9Stqq+yP5Zu/JqypfXwuspsxlI78IU92+FdUBLFKYaoN53creG65NAdh+A8l5yhGP
         3IMQ1kzdYAhsV0HstEaHPRAj3H71SRi51W1GiKp3diYOPGXFxcJC9B8T7bET+/nfVfGb
         iJzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YoKi4o1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25-20020a05620a005900b00757868b6a0asi2721908qkt.214.2023.06.03.15.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 15:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YoKi4o1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5ZzZ-0003Vt-IW; Sat, 03 Jun 2023 18:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5ZzY-0003VB-Hv
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 18:45:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5ZzW-0001K2-Uz
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 18:45:00 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso3140400a12.3
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 15:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685832297; x=1688424297;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G5spGaxIHtucAmezZziqf2v2RiSjPuUnmxs/qojTilo=;
 b=YoKi4o1NzDil4x8zSF17kFR/JTKehJkdG8DV5wLLmzjmSDY0FiGdRHQcUeJ1VErYSi
 mcwr7s9gagWTBLTt/cWnoCBuVHgu7j/3ZPbKI9tSAqT8dKxyc6e7mM7XKwrygtxkeIYV
 YCwlRDgsn6tFMSH9Fud4NMUzhGwCIMlXA+tfX62Adb67GWqvkRGAGafp9N+HLCIiZu6Y
 1InPDJ1bMkfdA3mSJPUnLqDFTNZif1YJi6VbxXbFAcjBLLcuB65c8GgryawMTaahwqF8
 zuSRvyEYCleCsi+39gi/DR8YIYYqFFXsMmee2P0y9fu5kJ0xJN0Jl0PF9SU4wBoa9qGD
 OTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685832297; x=1688424297;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5spGaxIHtucAmezZziqf2v2RiSjPuUnmxs/qojTilo=;
 b=fOjFpEoOADIMsAtmfLKb5doiLQtpFyH+1YMPd7hpuZTsfcVdU6Nl9tAj0uVNTp3CSW
 cLA8wW3KoiCiOnJ31dRYg08q1ys0NbpR7tf6wKEcTBOrlT0mIp4McZK6K8Z0ZWfRMddg
 74GbGtZ0sKZlReuJS9JZfhV+/Bx1tlwoqyl+ZWPBLvbKp9Iu0T99Lt1fSPwSbjcFXB1q
 BzOA8Wpb234XsI++z4WbIsXT8wi5eOGxdobFsBCc8H5zlaLhSR2qfmiFNaf+hOdSkL0i
 7iIGNZZbVWQAdU0YZe1ocDC8IzGemVcXyMUq5Xs4aSg2tq1W3/zng423OMzzokQ51x6E
 NSng==
X-Gm-Message-State: AC+VfDypldRrJzLv+BcxXcLotCJB3bC6G7Nw27iPGXxmY3hTw+cBu6BH
 rwlD3YYUipeod79oKSJviEgssB4ZzARQNyO7zPY=
X-Received: by 2002:a05:6a21:339e:b0:10b:c341:935 with SMTP id
 yy30-20020a056a21339e00b0010bc3410935mr3340355pzb.11.1685832297035; 
 Sat, 03 Jun 2023 15:44:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 n5-20020aa78a45000000b0063b867a1959sm2833735pfa.133.2023.06.03.15.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 15:44:56 -0700 (PDT)
Message-ID: <49207150-2ecd-b2e0-222d-e40998802216@linaro.org>
Date: Sat, 3 Jun 2023 15:44:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/20] target/arm: Convert LDXP, STXP, CASP, CAS to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: wS/0LSk9Xj5M

On 6/2/23 08:52, Peter Maydell wrote:
> +# CASP, CASPA, CASPAL, CASPL
> +CASP            0 . 001000 0 a:1 1 rs:5 lasr:1 11111 rn:5 rt:5 sz=%imm1_30_p2
> +# CAS, CASA, CASAL, CASL
> +CAS             sz:2 001000 1 a:1 1 rs:5 lasr:1 11111 rn:5 rt:5

Drop decode of a + lasr?  Or rename lasr to l? Anyhow,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
