Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp714061ocb;
        Thu, 6 Oct 2022 12:23:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vttE3voNe3+KRX/+2fe+MWek8ljFYyoZIMVwY161QJfyYcuhysrCaKMXJP3TJMfQKYHnE
X-Received: by 2002:a05:622a:19a3:b0:35b:ad2f:6f46 with SMTP id u35-20020a05622a19a300b0035bad2f6f46mr1540069qtc.7.1665084221687;
        Thu, 06 Oct 2022 12:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665084221; cv=none;
        d=google.com; s=arc-20160816;
        b=sgE6OgD7uuFVjZYWyrrJyDHpnthvfxAAO5f9nkWvBHq6BYvOuOKXrOhyBHR1/4tdt6
         lu6hE4cNgkmQ1WtACCjYAb8kwcrqC66XAwI5pWl1+IhAQEXv9s2fjniiv4UWUJHT3MZs
         EsCQQCTl91y+vQLzwTYhsOUO177Vl49rcgClQeaFi4WiYmTfrbed5Af2TgjomkNRfTb/
         Rmk74+AOqLjsrjOjFWmfyURhbPG0SCkBsqhHKElDTOQp3rcQj1Nshw9LD5218ZM6G6uE
         df+YxHPFKwcvyKeJwi+HESZB7gctFpWjO/YfMJXy3V9+okQ5jBmWk00rPeYXH9Lajh/G
         0Kyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6rgfF62HogBrjGMyE15gh3RWrV5peLUPWhqCc+tfGvY=;
        b=aeQ96j1RBWwchisJhuMI/2Yw45o+VlshFX6QaoFdccq1lR5ZBspPdjJHOXQMOyVJ5l
         YOR2Pq82usFrCwPVsIgNwhcYRfmJc9x5RxjA70CfYJ499RitWTNWlGc/pjKhg4FXxKhz
         1Lijw/KmFv9ivAue7WM9hN1UMKKdNVsC9yMNrgavyjx/TLQiYeCiUOmgP+ZaQpX7LRmt
         GP9l0QSL0qC9j41IpIVlcPOcwqNf0s9AanDhojUVLa+pUcBeRJ+5ucAQ2aAjiC+/AdgE
         ITCMuWVauBbfO7+RJ1tsnivu4KrF311/8v4XYa8nwmm24iM4nNcg2FP34UdIwv0kaQKO
         38SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W0s8l/qc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020ad45c87000000b004970e38fa58si4735970qvh.104.2022.10.06.12.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 12:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W0s8l/qc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogWT7-0003XD-96
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 15:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogWRX-0001W4-07
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 15:22:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogWRV-0002x8-Az
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 15:22:02 -0400
Received: by mail-pg1-x532.google.com with SMTP id c7so2656929pgt.11
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6rgfF62HogBrjGMyE15gh3RWrV5peLUPWhqCc+tfGvY=;
 b=W0s8l/qcfovYnttMPJWHG7zXPTG3qbmF1PzDTaBo8EWzsT7Wu0Gj+RgJRXDJ5sDZwN
 byeAbXbvX3cOQFwYddSnqTZg/fMe5qlxzhOeWJsW3URMYhEtny1FSNAuqc6YPjA5zrhh
 GcLlUNw5kY0/qlNwrGet0mv3T3mozmlfZ/zeO4tHrp+nua6FNzpdxrcAnrpvUVF1M65P
 iOyTtmCsu9wRWlwZ7xkNyGAip5ecrD82Jlfd0G1bVIWHMOv/ErKPN7qI/gCJIVqqvtwz
 1Fvx49Wfu0F3cpWyi9WdK8IttUHftQ5XyGE1/7mMs3K12T0kO2pg4i1SMP84195qUefp
 uiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6rgfF62HogBrjGMyE15gh3RWrV5peLUPWhqCc+tfGvY=;
 b=nHOOkNS7kf/ahJMw4sc+8rSl/Zxlw8yUG0X773eSMLFG8D8Cvq+ro6t5QLWLYPJ0W6
 8HbkoR31zPlzqo466lw7yOXFoqYD3xfjLlMc1zoiUovnGDEwXnW7L8koa7NT4tcag3D5
 gbYTpyzoAH5/6wwz4FJKtL9nPVbKmNocvsma7DlXdkyp0osJ8DcykVu3oR5v7cYMYql2
 Z35DgI19WUX8tiLYTsMgWr/dKeMK73D6MZYXu8ZMzc0v+6xr9Z5nPYQ+RMrhED1oF4SR
 sW6ra4Z3/n0G9b0fPvccOVGt2nv4BMbgQ5IeAdmUqZFQddhztUP9eNhJldChMIQNFiUA
 Sn0A==
X-Gm-Message-State: ACrzQf2mIrFMtXEsh856tX8UXFpHaVwDW9N8REs6uKpOPZPY2+hkGYRR
 DG8JyN24Tsc52nIo0HOAFcDVhg==
X-Received: by 2002:a63:2ac4:0:b0:41d:95d8:45b6 with SMTP id
 q187-20020a632ac4000000b0041d95d845b6mr1223087pgq.132.1665084118715; 
 Thu, 06 Oct 2022 12:21:58 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170902ecc400b00179f370dbe7sm12743498plh.287.2022.10.06.12.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 12:21:58 -0700 (PDT)
Message-ID: <9fdf450f-ece9-31c4-415c-2cf93b9165b0@linaro.org>
Date: Thu, 6 Oct 2022 12:21:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 25/42] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-26-richard.henderson@linaro.org>
 <CAFEAcA_iLb=T3Gwy6WSRzrW-LFck7rmjv=Y2yNFOwOGjP7assg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_iLb=T3Gwy6WSRzrW-LFck7rmjv=Y2yNFOwOGjP7assg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 34owSRKa/xYJ

On 10/6/22 08:46, Peter Maydell wrote:
> Side note, looks like we didn't update vttbr_write() to know about
> the EL2&0 MMU indexes ?

EL2&0 is a single-stage regime, unaffected by VTTBR.


r~
