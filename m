Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp478061ejb;
        Fri, 28 Jul 2023 06:51:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE7iysjPD38rOFbTLHIZ1jPJrAoElt1zxoGw1QxweRD7fyHA4OGs4ucQnGhl9/MydZPyGLi
X-Received: by 2002:a05:620a:424b:b0:768:4326:7b4d with SMTP id w11-20020a05620a424b00b0076843267b4dmr2655758qko.65.1690552282391;
        Fri, 28 Jul 2023 06:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690552282; cv=none;
        d=google.com; s=arc-20160816;
        b=aSpdTd+3rQtbwptM6xXxNYd6WOtdeGWFdSXdJZEq/Y9yY7hYSbf1ZYzcZVAo2Sko7F
         Jl5KvY5d7hkgG8ngtswoLEdxFZDoDu4H474JAy+GaeUP03vdOlvqTZHAdwqQyGEc3HRC
         zE6WpzyzsT5JmVxQ2ZhJBjrROsZIGQeaBSyt2okO2nET2bvqDMV1sVzbiiH5fGAjVQ+C
         LkfdgZCIjRnzmRroJY8/Ui1KoNhxP2UImzKZedXxU6DywATQiVjYVpK+RxwpWqsJLtkL
         3IeyLI4i+/OmpwlkQAz+4153gIWtkoiMm8JFY6n9Gz177tc2Mwp8I54vFU+79jMwGYmf
         ZMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=N841rxA1SSSsqFF0m8qLqQUKLyc+EcDuq9oc+nuymW8=;
        fh=GhRAajmaXIVQSCYRsWh6JKKj25My/ZfgM6mKi1yjbAE=;
        b=C5qwwGp3MO1993Dq+UqYez6TcaoltDf21kFgiP1Wto6SnpcFVJcPBsZhS6b9w/yFEz
         6097Ebl3mcCF8hTmCU5ol8d57s5pxj3ytPbv+Nl/W6XZwANX+8+nNd+v7uG0wRD2Dti4
         6sVS7jtpTQlHrh303k9JToescEgchyZIlGZRWggmCIV98zR+zsL+ZrymvusbOdiW/C02
         hPVesmN5koQpU5rhaQzNHnJDm9W2WBXoZLprsj46KPi6tu3bRXclsz1PxUHv3fKtMD5U
         U00odXOREvHdNZu6469HOYIM0qOolC0Lt8rfvu6X/xWOtN8ENgIiRwQpbZNh6GvWQTuW
         uOSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpqJy0KF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05620a25cb00b007672ac139adsi2257785qko.778.2023.07.28.06.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 06:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpqJy0KF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qPNY1-0003Wm-3E; Fri, 28 Jul 2023 09:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qPNXn-0003W7-NY
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 09:30:16 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qPNXl-0000t8-M0
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 09:30:10 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b89cfb4571so16675755ad.3
 for <qemu-arm@nongnu.org>; Fri, 28 Jul 2023 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690551007; x=1691155807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N841rxA1SSSsqFF0m8qLqQUKLyc+EcDuq9oc+nuymW8=;
 b=vpqJy0KFlDrNuSJWA4VK5ncdx4qCVijZBnDU9Ueh6XPzvfETAPiAEMnXNiim8l7xCR
 1s1KaXBcP8vTXL5liP/0GNCmzT5zsUFgBXfJTcIEZrDEgblPLkTzp+D7l6s2mOoWPNL9
 3v19mg9Alsy1HWx+iSH7jBZjGPF8p+SY+Zb79zMobIQfjUfWvaMfCWYx5cB5vCCuF2x6
 o+RaHUJfn+lwO993kxSDBYEgXdDhj6pAt25tf0KqiqxGv0DH5PGEtmD1/a18lkKL7a+F
 dZh9yKhLPuLtiEZbiSDi7LuA+CFbndB/hi9R9ZZ4oFOPSP8ZlVjrv7y0aPL4JHMe0kxZ
 mhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690551007; x=1691155807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N841rxA1SSSsqFF0m8qLqQUKLyc+EcDuq9oc+nuymW8=;
 b=harGONWX9N6kk6SkeO31w5krRS2PR5BRQB9IVrjK/dE8NhMe/QWGwIrF0J7/gyNlgt
 iXoFQ/Gck3IWx2TYwW1+Jxz8yBd7a8nwvcUaThgmXaUuLcnDM5qG4CW2hbZSRpSFyf+I
 Cq9JESw10qRL+UHCsH/Or4eMhdWYmnp2kjdodOaqTwJAsd03HPW/uA4yUCS+ACc5iGl6
 Z4LtIeLseTZV7pQbub0cRxra3GflVcM4YSLoHPeBgb1mpzfCGMbfkjnpuK1lkmuIB+ls
 OhphBiDshZlLNovNevixOcq9tKF58yQ6f0BR+bfqtG7JTZXYuBQaXjg6jcWnV3E87Qdj
 eK6w==
X-Gm-Message-State: ABy/qLZtbB9bt1z4Oq9C7N5IgPj6JL60+nKnjkD8fgXe3nqd/BsCXbax
 qDrBv3fhZN6w5mGTclrm22a87w==
X-Received: by 2002:a17:902:830b:b0:1bb:90d7:5e01 with SMTP id
 bd11-20020a170902830b00b001bb90d75e01mr1457291plb.63.1690551007036; 
 Fri, 28 Jul 2023 06:30:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:c001:cfba:2f6a:7070:67a9?
 ([2602:ae:154e:c001:cfba:2f6a:7070:67a9])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902f7c700b001b8c689060dsm3591528plw.28.2023.07.28.06.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:30:06 -0700 (PDT)
Message-ID: <d608c3b6-4e32-fe5e-44da-26df41c86a78@linaro.org>
Date: Fri, 28 Jul 2023 06:30:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/arm: Do not use gen_mte_checkN in trans_STGP
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230727162621.445400-1-richard.henderson@linaro.org>
 <CAFEAcA_oycCzi9ucp6njiZMs9puO_pshY0xDgT3ed6KQZP=bKg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_oycCzi9ucp6njiZMs9puO_pshY0xDgT3ed6KQZP=bKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: mAO9Fi893eQT

On 7/28/23 06:17, Peter Maydell wrote:
> On Thu, 27 Jul 2023 at 17:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> STGP writes to tag memory, it does not check it.
>> This happened to work because we wrote tag memory first
>> so that the check always succeeded.
> 
> So this is code cleanup to be more sensible, rather
> than a guest visible bug ?

Yes.


r~

