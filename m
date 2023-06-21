Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp684752ejt;
        Wed, 21 Jun 2023 00:12:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6reOMh01HhmNfERSCa4ddu8vCrYvOsrGa+ZmaNUmjpvsyRf99lvni2bhz40wG8/bp2YKnT
X-Received: by 2002:a05:6214:2249:b0:626:3a5a:f8e9 with SMTP id c9-20020a056214224900b006263a5af8e9mr20956483qvc.54.1687331526040;
        Wed, 21 Jun 2023 00:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687331526; cv=none;
        d=google.com; s=arc-20160816;
        b=EZw+tqGpn9KTx4Ay0WIrxcSWkbWf9339kzPHMeBvoQ9CiFPtmx6swhj+SAKbYUAmcJ
         IFRoYKcEcJJidKhxmK4QZPTAbyCI/CXuPyOaFrLOZdAvQGIthgXCczscpzfEmuSVFUyV
         UN4bzkP5KllFGI2Gvfnr/18BvpiKfRcYbZSvFvF7ZpWelPJvllbPdXqA9+0I0a8yWTn/
         L55OKDAaMtzRJ0hAPbWM1mm1CsE7a3E4F0lrE1Nk0sU6Am93KfReRK9b3DSL+xPYbWhP
         +3AVBcS2B4k0wx9x5PPY/KhbGQZfslitCtW0GKupYE2nc3sMWSlFSZXeW+eXJMXpibMj
         NMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=J66YUyuz5YVnIrEEDl63DOF5S4RDKmE4Em6U8xJEI60=;
        b=kMMFP1A9pXj/nhL3Ok9FaMwveSuKQYHk7bd7yMSx9zuQ+ebtCUvDSKoAIIoLIzUmp5
         CnPjNhwx3kASSWyzh6jYLIux1F74FuTU38sjZ3letYIyXBK31I+U+7OcSVlE1KUh04F5
         KJOeHPdJg+iVz4RpPbucZ64vB/OxdTlKrYpr4/OPkkKrl/iFqkpkt1b9/rBEexYvY4w8
         1TvRIRIHu3S0aoWrGfEWbHIjPLt1y80u0MSmWb85qic0WFHequCJg3QZPzIj3jxYU+Nu
         BUCeO3ZRcsQqFytYbri541ww3YU9yQJkA2m+hv1ZM2WcCiawWDjlHJJ22aoC6eMd3yPk
         eUrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BfRSqrzt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020ad45aaf000000b0062b29929d48si1304486qvg.385.2023.06.21.00.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 00:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BfRSqrzt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBs0V-00039m-Rr; Wed, 21 Jun 2023 03:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qBs0M-000396-FH
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 03:11:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qBs0J-0008PE-KK
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 03:11:49 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3113306a595so4417618f8f.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jun 2023 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687331505; x=1689923505;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=J66YUyuz5YVnIrEEDl63DOF5S4RDKmE4Em6U8xJEI60=;
 b=BfRSqrztGxyQmBMQccRcZSwgqDIxDX9Y/M7X8N7kIjEV81XO0wBSLEtUq0kdCum8vw
 H2SuFiPRjOdG22CLInFTqYQA5becmyNfy4sC5x9w0XNrnxV2wmTqzaaJMAlu+CTYWidZ
 M9ZyM60NPaYXCq8qayyw3yNotNDUjf7zl0eRW/kGX+4XULnUM2Z3SXccVoPJ9g0m7QB2
 DJQi12gY6rf2gOU6g7ByhctDpGJDCaaPyNeZqHh/s7T2/I35mrkFulpvgN3899DoqUbK
 AwuHz/0YhNDjQFSe1UxfGj0uesKwu1ADws/FZnA7fdsN0fTZ9d3rPxWnCrsPcvGnCeMn
 U0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687331505; x=1689923505;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J66YUyuz5YVnIrEEDl63DOF5S4RDKmE4Em6U8xJEI60=;
 b=WGcQm4b+yvYzhiNbvttmlgz0R3NHKylpEuEqMyi1RDJWFPkAXnlY7pxyGGUjPUfL4r
 cgV0wF02myYxT0PNcu1OC4UVTAa/IRyUgAnmxDEUf223tgeSgGeqqu89sb/OnY4rGVIX
 AssCc3oQjE6iYruL8KZLcZsMkBSUuhhwrVZXHfWaESfTL6DV/crZj4gaHAMXalOAlR0T
 dbJ1UHm0Dnlx0KBH0WD5WHsGxy/1CdNEuBtW1BcU33Gf1w/oCnt1UIv+cOfTHVaBQ4ho
 pEZIoKPqRGvM8tNeezH8tCyDgm/cRBRW+OTXStAYhCPll1Z5ZIe0Heu6datnnI7w5iPC
 epLg==
X-Gm-Message-State: AC+VfDxo+yCELDQ+Kimhj5Mlo2LzpyjnWRxrEbiLz3nZxjOVdZSW+RRH
 wEaSRiXGjUnxRMWjNBHX+gKDUQ==
X-Received: by 2002:a5d:6810:0:b0:30f:d1e3:22b7 with SMTP id
 w16-20020a5d6810000000b0030fd1e322b7mr14493459wru.6.1687331505461; 
 Wed, 21 Jun 2023 00:11:45 -0700 (PDT)
Received: from [192.168.200.206] (83.21.150.32.ipv4.supernova.orange.pl.
 [83.21.150.32]) by smtp.gmail.com with ESMTPSA id
 o10-20020a5d58ca000000b003111fd2e33dsm3653113wrf.30.2023.06.21.00.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 00:11:45 -0700 (PDT)
Message-ID: <9c29ce0f-1799-7ad5-18ca-457824e9178f@linaro.org>
Date: Wed, 21 Jun 2023 09:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 quic_llindhol <quic_llindhol@quicinc.com>,
 "peter.maydell" <peter.maydell@linaro.org>
Cc: rad <rad@semihalf.com>, pbonzini <pbonzini@redhat.com>,
 chenbaozi <chenbaozi@phytium.com.cn>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
 <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
 <CAFEAcA-B6Pbc2KyTVP9hheGfEecfTbwu-zi7_9EmjJH5opbiYg@mail.gmail.com>
 <f1e8edcc-14ed-0e97-0172-292032e61f1d@quicinc.com>
 <2023062111461132026159@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <2023062111461132026159@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: 5rYtLRHL2FjS

W dniu 21.06.2023 o 05:46, Yuquan Wang pisze:
> On 2023-06-21 01:24, Leif wrote:

> > > Leif, do you think we should bump the minor version here?
> > I think that makes sense, yes.

> There is a new confusion: Which minor version should I bump to (2 or 3) ?
> As I found that Marcin’s latest patch (add ITS support in SBSA GIC
> <https://lists.nongnu.org/archive/html/qemu-arm/2023-06/msg00709.html> )
> increased the minor version to 2.

Please bump platform version to 0.3 one. ITS being 0.2 is already in our 
plans. Not that numbers matter for those components which are provided 
via DeviceTree.

