Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2921864ejm;
        Mon, 24 Apr 2023 09:15:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350a4KByfPr2A6uN/R9ixRnF/kCobYmeokCV5a1qxek4ZEF+w+Ru7J8k+4E8YrxIZAf08tlXz
X-Received: by 2002:a05:622a:109:b0:3e4:e2bb:3297 with SMTP id u9-20020a05622a010900b003e4e2bb3297mr25059068qtw.31.1682352916464;
        Mon, 24 Apr 2023 09:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682352916; cv=none;
        d=google.com; s=arc-20160816;
        b=eNslWZ0GzXlzFxwI65rceoSDoY2TxhohTCXi7KygOfDDuPMrNX4ULze/pvgbR3Miej
         FwQVYF6RsyKLEQFIT6ovnno+j5rEKQW6bvqfkoa59ivJqZwmhr4q5U1UsDlJ3BTBIL28
         UJjrvBNE6eNanQ8S7OYO7lzPbpyPyQQan6WvFrv1zaB1jGVTssHLaTIyD8QsEYYWThWX
         Lkk4vgB4ZNgQtg4uAC7fHNmHn68RvfKCT8NPix/CxdpUT1OPRS17OEzqNQWeieCBnL6t
         BhKQ870cI9spr15j7iuk+jgYmZ7Ru9y3DkfYFbSuc32gcP1+yQEUtnb8iyOlcM9sx2hr
         QrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=reaqqT8z7MI6TcEHMMfL7/rFaQh20A/rUSyHXS9L7fg=;
        b=PlHtFKuACV23wI25Ra+ZGGuK1Se/l3SfgszXEkijS81eVM7KNGseFlpWRYYkaWxhcM
         3xjL8nfn6q6KzG4HE9Z+E1FO9KxbK0VMkRs5Z2V+0hhp12esw8mdAnGtcmj7QFXY5Eta
         qzj6D8q6hyJoY0lyhoAzQXVkut13nYSajrAhTgeiYGHC5Y9qKj16qAv/UKr0+ubCNV5l
         YmSoj61rgqz436ftUF9xqaX5aD+gIFJAECJwej1LwO5a5PI5Gzp1kKv66PBa0bdleB/+
         GWgXT1R+YSYqqDvNom3/Skg/0l7lmqU47fMyyBX4HoRrzrO0hbMcEuQinFNwk04GvwiG
         CFXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dlH+JHHW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020ac85787000000b003e4df9434ebsi7422232qta.604.2023.04.24.09.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 09:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dlH+JHHW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqypt-00083J-SE; Mon, 24 Apr 2023 12:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyps-00081x-0J
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:14:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqypq-0002L9-Gy
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:14:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so2821660f8f.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682352877; x=1684944877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=reaqqT8z7MI6TcEHMMfL7/rFaQh20A/rUSyHXS9L7fg=;
 b=dlH+JHHWDo0Mw9n3oAGHvZKhJ94IFqO7ZdRNI4Ai6brQSuqbpj1itTkFUqnmh+6ZmK
 Am1p1zvkY0BB3TqyocL2nKR+jOqoZ1ypbabbjxGIhf7POGmdbQHiQUhRSn2Gj6WBpu5K
 rQBNRGzJfSi+xotPJHchhkYu0VgxM1l1xwrJkESY8IKa0h+XUqPpLhavHAZW8Ma4i83p
 fIO1GCQdr4Wzs56vJmrFuCp5DiBhBNemTNh25NGwCIgPh22hsX7AeSIvVGUcdq04GJIx
 SqaMyE57Yfs38SlWZ+oXZuIZEM/Ok10KxRaqVvWkWyEeZKSvM152ke2bMWCUDNLPCdDn
 ZXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682352877; x=1684944877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=reaqqT8z7MI6TcEHMMfL7/rFaQh20A/rUSyHXS9L7fg=;
 b=WDQmjgGp9bznVYHL84N+WUQhvhzIrnwZLkRFTYKodREEaR8mjIwzcXbu7WBcbZPQsE
 macHUyuSdlt1Y9hwiIjPTv5RLO3qrjP+6Su42CZRLSsgr7dcJVKEwzB300aT2vDOvq2N
 t/u1iz0bi3b5tPNLMgnESBMbSpGwPvBCpomdPV+HJXVjAelSkbCPw0Yo4KvhAsBmN20W
 RpjTmvzs9A0g2QVIQKIORdZE4kn14OQmTcIYILuft6i+NXb4xcJAnleDJL3uLCJonDl+
 Wjw+h/gPi9xHXe7n1HimHCEcb+JCVxVHkJm/bC2WgrRsFBGBFOJONFPAUp0RsgQ7Qxdz
 tb2g==
X-Gm-Message-State: AAQBX9cOyzqeROBb/sfp2Fl2DzeOfM+Ha6ohglrAfCR9TlA08pQ/NJdv
 5wiydjHsVkLP/mdUmrtcDrEslg==
X-Received: by 2002:adf:e843:0:b0:2fe:cafc:8b2c with SMTP id
 d3-20020adfe843000000b002fecafc8b2cmr10594267wrn.62.1682352876891; 
 Mon, 24 Apr 2023 09:14:36 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm12456406wmk.20.2023.04.24.09.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:14:36 -0700 (PDT)
Message-ID: <16a8678a-d2f5-7d2c-03e6-5a9744636c80@linaro.org>
Date: Mon, 24 Apr 2023 17:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] target/arm: Define and use new load_cpu_field_low32()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230424153909.1419369-1-peter.maydell@linaro.org>
 <20230424153909.1419369-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230424153909.1419369-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6v0RnJ58g5FE

On 4/24/23 16:39, Peter Maydell wrote:
> +        QEMU_BUILD_BUG_ON(sizeof(typeof_field(CPUARMState, name)) != 8); \

Surely just sizeof_field().

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
