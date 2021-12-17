Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp998094lfc;
        Fri, 17 Dec 2021 14:26:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuNIyk+eXIRp8NQJJXdr3sbf6Wy1frWpnRzFFSoLpNV7ZLkockAeWe+5jDvKjKojcvPXi5
X-Received: by 2002:a25:ec07:: with SMTP id j7mr7088719ybh.313.1639779965251;
        Fri, 17 Dec 2021 14:26:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639779965; cv=none;
        d=google.com; s=arc-20160816;
        b=W5VQkVuQVhR2q13/Kg21cyHZwGzICqgvDDS2mXi0W9XClvy8dU4EmSoU9JzHc3JfRg
         4b3jZxtDDSc9TDWH8bTiCy11yNToFVfEa9rUQODlLT6e85AYVKpjy7uNbazCLp4uJAsQ
         iKLADMc9YVvVJe6jVGUJPA9KKY3RsvzeI+eKNo/t0DBcaQtUFdqDRNs4ca+PJexIfA7S
         Uw11ZCRppd/968U7ouRPCK7JuI2+ufc32c0SgvHF/FejCPPQ1rAV2TYKjBG7frod4t6N
         ggl2fMXaokUqyeo2LZFP282AXyyhZbfgPZsSgW70yNPOHNiLzi7J8beMVTp7KmE2i6tM
         vCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=a9s7CCIp60N2a7s3249PWEz3dwO2KJkRkk1WeBQzWQ8=;
        b=jTVliG5o2T2vuw5seAXnLND0ajSt/HAe9gMC8ctU33lbYo4h8YqjhyLcnr60VU4dSq
         Ob0NyHJBUx29MADlVQzAzEerEqHdSEb2npu9DKo/6Zg72lcq4f9WG2tcCia0Um/iiff5
         qpRuqwkSFaPlJ+zpdMrodHHpnhlqGwj11D1lE1z7YGCL6q2BvkBYnkqzU1RqLpfgemIV
         gfY9mADqRpNAIHJweE9n7HT5Ba3E7DYTNcNVJ4o3LkgaCt8tGC+A4gEr3JoDw1jsauTL
         vfVVUu6ywhtwdnG5xhSshOqzNBKbX/ysyiA1ouJvEX6/fFWLDYjSYcagbLI6mad8X0XZ
         oqkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahAg94li;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si9828670ybc.505.2021.12.17.14.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 14:26:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahAg94li;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myLft-0001XR-6C
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 17:26:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLfj-0001XB-01
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 17:25:51 -0500
Received: from [2607:f8b0:4864:20::1031] (port=40952
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLfh-0006RI-EZ
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 17:25:50 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 c22-20020a17090a109600b001b101f02dd1so6936558pja.5
 for <qemu-arm@nongnu.org>; Fri, 17 Dec 2021 14:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a9s7CCIp60N2a7s3249PWEz3dwO2KJkRkk1WeBQzWQ8=;
 b=ahAg94liaOafVdDZT4eMer5922IfYdGODiSBB0aVUq3BnmRRwwb6L8v1Iq1gzhkMBc
 SnVJn3VmpkEgMYUzWS9BE+3/P7fSsFUvJj54PVrMSA958clorZd3eBY8e/0QADUqqZhS
 76j4cAQl7yPZt/2VQ4309Yhi536dKNjgY0H1QX8RrObYLw41YITSjYCEexLRx57ozzt+
 LGEYobxVqpQetY9ybkZi9X8kS4Fz9xXYZ/8GAms65wCPi8ueIvzsdjQlp6dj+Wz/Rc+M
 bXROUtcRQ68w5BRMUFdq/2n0wVDD4vwdMDvXWODT5yZqZBpX2NLwJKUm6PaJLeSTxd8/
 pZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a9s7CCIp60N2a7s3249PWEz3dwO2KJkRkk1WeBQzWQ8=;
 b=z4c0fOza5FTOE+gE8VZrDlNFKnGYaTRUhj+eh2FdxW+fkkas1hqWd96+wWswO1VaqC
 lkz1ClQESs0IsXLOqirEFyGvUrIBBBRdk04/NArk7iigz5e1WjDi653rtRk1wNTQM7ye
 OZuAUwZ2i8Pr6IyMnXx8SMFlVqfemxUE/lVLyMHNQ1T8O0jkeUGwMOGY/Kbu17upw5bh
 vuQ9R4we9t4mU6BDbEBNaEIiq2Z/5w1CxTLsbMt+m38mqlqWllsq9a91Kf1urLc1J/o9
 EY00mmuVTmPi+3gCZM6OYA9zvsoKGSW4Jy55YeBt12uyre6mE+RgB3PRTx31s1mUM4w1
 ZUWQ==
X-Gm-Message-State: AOAM5320GiQhg35/FVp1mL2JUk23RoequVjh0MPOoa/KyNnKiUkd69kD
 GW4b5jQqC4kvkLhvsaBmu67g0g==
X-Received: by 2002:a17:902:ab1a:b0:148:b34f:5bee with SMTP id
 ik26-20020a170902ab1a00b00148b34f5beemr5256630plb.157.1639779948100; 
 Fri, 17 Dec 2021 14:25:48 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g66sm3750265pfb.64.2021.12.17.14.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 14:25:47 -0800 (PST)
Subject: Re: [PATCH v2 2/2] hw/net: Move MV88W8618 network device out of
 hw/arm/ directory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211216125647.805544-1-f4bug@amsat.org>
 <20211216125647.805544-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac288aa7-b78a-d564-329a-07267f2d4cc3@linaro.org>
Date: Fri, 17 Dec 2021 14:25:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216125647.805544-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /OZTFFPF1Wmt

On 12/16/21 4:56 AM, Philippe Mathieu-Daudé wrote:
> +softmmu_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('mv88w8618_eth.c'))

So... there's currently a MARVELL_88W8618 define for the audio component of the same chip. 
  Should we re-use that here?

Otherwise,
Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
