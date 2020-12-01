Received: by 2002:a05:6214:1808:0:0:0:0 with SMTP id o8csp2899352qvw;
        Tue, 1 Dec 2020 08:12:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6H4rkAivwDXNmbxjn/L0XpZEPMhb9K9l5MqbDMv1c55JFXPe6CdrooDBzCLwRGi9HUW4v
X-Received: by 2002:a67:c40a:: with SMTP id c10mr3271579vsk.23.1606839155235;
        Tue, 01 Dec 2020 08:12:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606839155; cv=none;
        d=google.com; s=arc-20160816;
        b=EL/Gb4gxd4mjMKzu4KhE14vlFn0IsvYbNkuyNgKqk38ol8ymjtsL09WoenWSOZFvZw
         CyMPzo2BtnmJFrklKe9xe6IehZtf1biK9PCigOLvW6uAmZSpcy9WqiRYUNclWRObEFS6
         7RWNn/J9T9VNSotcqLvDU3unvV6C9oWost/yEZZhif8yVIRMFGZ5mG/YuM9U0kHd3Uej
         Og6Zu0PQNhtmW/lXmu6DymqCyhLhpu3x32faflvMmryy57IgvWF4EFXGzve7XM7ISqdf
         XGCUdK6ncFdSRG61XBswVe0rQKYa56J3ie/jm7hvseVP/H/bfGH/ysbD3Q2WSgJRH6Ef
         riUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dZjUR3w8Q+tZRAEMI5SpYGH5dpTGsvXBnfeVTSRR11U=;
        b=YF3JJ983n/CudrvNrp74ZhboK3Z3W1aqxeDfLlIh9Ri/QEnie3w5l7fgNv3Knid4Us
         j+A2kh8fCj/MXll4lSEq+HtWYrFoZwPS20xpLtQ947iuc1jwvGZMi76lOxDiogVSxcXX
         qwFTJmsQZrRCuOfLMUnxuM6TGG40sa45gF8JRByCs9MBjnYvzy6wR6YuJf0b2PomTwgM
         d8abKR5qn6w1sMBvZ0YDQ2+Z0wDlpBpEHKJqBtKlKhtGboZMLu/ymK7PATyYnv5SYJlG
         bjxbCLhpScIqwe2PuDgqkJg/MDBKTB4GB2wT0XzRFYuWG4yUM/pKuLCLTZREaYlvRWC2
         5G0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jbovz74b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si630816vsn.55.2020.12.01.08.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 08:12:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jbovz74b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk8GY-0008Sw-N6
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 11:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8GQ-0008SL-O2
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 11:12:26 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8GP-0005YJ-6X
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 11:12:26 -0500
Received: by mail-oi1-x243.google.com with SMTP id t143so2280189oif.10
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 08:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dZjUR3w8Q+tZRAEMI5SpYGH5dpTGsvXBnfeVTSRR11U=;
 b=Jbovz74bLRvT9QLM++GqejivgUPrZ/InnKSfBwSbSqZCHD7h9m1amhwf+sQGogJf56
 5Usys6T/VB7nfzb8th3rZK7is9WcgfxiBjcSLSUIqRfI3fqG4gHInD4Zay3xey47B5mH
 PpLnBFeGsvnJnHU1vL9AEhQmnIyUJP0i5DDS7atWZ1pi4aIm4TmvaGfy0gATXFkQ/yw4
 /DFRlDNQ7I05DQpkB1U20BXTgs7wOYBfHNpI8vez7vP9ExTBBg89yqo6N3UvzVi8SHAB
 82kx6tKhhPPZyN5nrMdYgbfDh30lBCC20vQsWneM4+Hcx/XCE6DFowYFLFB5wGxzMU5W
 ZdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dZjUR3w8Q+tZRAEMI5SpYGH5dpTGsvXBnfeVTSRR11U=;
 b=JANsUCHEnm+uiLacKo98Pzeb49NoDyCyhcIqSKzSvLeQBr7ecRjspBilBaF4eeuC/4
 0qVM7ysqVhpvNhTvvA4KFAWMLi7a76RxwfeFyvkLzE6UuoVwuaErUWG/CZma95ztj6dV
 fG4eI+a/gSTzPVjcZfkqHLm/cNTB1chVo32iINmFAc80XAMDZcgQ/mCseRrGFh1j8YOb
 yMQq1Mcu639/YJayNeoSnZ2XFcqDbDDkaKoFJ+cLNdRP78Gjja0fz2o9XHm3adLNnhRf
 B91kURii+Awsn8v5v5QWtNUHewuRyAajbRRKlH39qDnJIqK1jP8PTgGdlTfUPrpOLZ75
 E0EA==
X-Gm-Message-State: AOAM533JXLieVL6K50jFvatzZ2wel+7Py9QiDPRmeZ3rDAZT9bEkGxR8
 bR0FVngNJqGrSMW0OuFo25HhmA==
X-Received: by 2002:aca:4d51:: with SMTP id a78mr2096792oib.27.1606839143720; 
 Tue, 01 Dec 2020 08:12:23 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j8sm478176oif.55.2020.12.01.08.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 08:12:23 -0800 (PST)
Subject: Re: [PATCH v2 27/28] hw/arm/armv7m: Correct typo in QOM object name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b571f823-569d-04d0-a643-9282c5f36421@linaro.org>
Date: Tue, 1 Dec 2020 10:12:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: Kz3ttpBhzo6/

On 11/19/20 3:56 PM, Peter Maydell wrote:
> Correct a typo in the name we give the NVIC object.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armv7m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
