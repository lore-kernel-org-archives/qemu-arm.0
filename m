Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3367824ejb;
        Tue, 6 Jun 2023 02:48:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6uPjURiyKiuzb/E0p2NXdf/fI54WcdJmxpacCO9/MphJgveugbNrzheV8pFsMem6TPkzhU
X-Received: by 2002:a05:620a:22b8:b0:75e:d11d:5198 with SMTP id p24-20020a05620a22b800b0075ed11d5198mr479644qkh.36.1686044904114;
        Tue, 06 Jun 2023 02:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686044904; cv=none;
        d=google.com; s=arc-20160816;
        b=VpLqKwx3oGqdtbHLlCrwtRtlmej8PKtqUDWYlSe4JeU8eXSdjDw4mmR9onMtrlIEbk
         Sp7ZGHJOswd6g649OlEor6DlEY08fIYd43h2P8zeKS88gMI+MBhT45a62O2elaFlzugN
         NDELjf6X65C74vRqZ21UFd5ylRTJnn8hphsHHTT8g5BKnZ0n/4E1ztao1Gi7OAUgjcQs
         VJjgwQRKKoZBTignesVTHFPbOozFbOBvyFz17sKkvRZP56OgMBKCLTNhtkgKKM/TRPwn
         Usi0DNmK9EAiPuKemf5x4p5jFakObUVxxH52vxl7vMiyHFuxcjqEEnLKK0ay+NKwljkf
         czAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=BK85sWq1xBOn+HFp35f6XF2KYdwVycQ6chTZ8IOqpIM=;
        b=i/kCLdyM828D73u5TjsX6ZVlViRFEs8QyMtjHy+N78Qq2pjWkW+H4emSoX65xyaUor
         ziy/bVfROGzf+muFcrDJ5AjurbsLczDvrk5ZV3dx0A/8q8r2RTjLeaSW39Sp7gtouAWH
         5z/IxXAIbuJ2jat1H9cdCg2gtDklwiBuoa/L0SJkDUA73Z4dPMoiXC9fbXX5trscGaOo
         VKnC0d0VHK7I/eSy1yzmd/HXgWnx1Dhd699CKuElcGAHWyhIj7pZvKzY/d1oZmMclIB+
         bskcyl6k7TEd8T4lF6OnWlGWejSbIbWKwEPvpz9h14N291TgoVFhDOgO38pdURTdq8hA
         9ysA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AOKBt6kE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020a05620a13ad00b0075da00ef104si2793635qki.22.2023.06.06.02.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 02:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AOKBt6kE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6TI6-0007VH-02; Tue, 06 Jun 2023 05:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6TI4-0007Ux-VI
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 05:47:48 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6TI3-0004Va-Ga
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 05:47:48 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-977cf86aae5so380645866b.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 02:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686044866; x=1688636866;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BK85sWq1xBOn+HFp35f6XF2KYdwVycQ6chTZ8IOqpIM=;
 b=AOKBt6kE7TjF1otGSICtLsnVAplYHkZJdAwZ51w3hGoSFgqjPEofcR0NI6DVx5UYOq
 av9GCkjzB9WrQk9Z1O3HVtyLfu+VTky7iSpbvypJM+jmLCXC5CfqcQecDqOECZYI7t7v
 hpTvqCi5vyoXlHIi/wjiUvdPO06DBiZlPARyiv5K4MhEw20Q8QCKnU1KE8Ja7K6mP7rW
 iER5xJRcDyx4NEH43QFsijQI5NlOOJhAPnxUYRqBwPM4KG5S+rfdAlAUbocWRKWJM4Jb
 elOs3neoIhBwzCPc+E4sicz7ornS/NgKXVfYPnV/cOqJUah1S5OBJj5m3zM+2GOqgypt
 taKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686044866; x=1688636866;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BK85sWq1xBOn+HFp35f6XF2KYdwVycQ6chTZ8IOqpIM=;
 b=b88/iWGdp6rwm1v9bbp1dpI2MSDJEVvSX3jgKaCLSb+xPWDQUTwiundjk70eKiTso1
 Xdx2q6EsGW41vmTOgyboebLut+s9bF77DhQgkmnynKjbD2W7tVxPBH/ZBw3hDS9RYJZ6
 hwu9coB1OtgJ3MAAxxP+MPNeBSzgs4+dJMNUOU6qNHGK37d9zti/FON9e4greT4zsZ5v
 wXCgoZ6E/74TUW52RpfYkL94sOjtmgxbQGQiaGx9Slwtp0vm6CAYW6Gyb2iy9o9AZ8kF
 mMuLjyV0/EaUe58M0fOtGHLet9Z8RRf7f43qZzlxk35XORsPPYZuraL0TwMHbNakKu5L
 P0zg==
X-Gm-Message-State: AC+VfDyWeYPj3KeF97pnYgB2NEI7F275GNexxnoA99yaYqOFcubI2mf1
 75o80zm6EAo48co4ZchSuU8HjpJC1fc5iKLmFx55dBbN
X-Received: by 2002:a17:906:58cd:b0:977:cbc4:f7e4 with SMTP id
 e13-20020a17090658cd00b00977cbc4f7e4mr2027440ejs.29.1686044865828; 
 Tue, 06 Jun 2023 02:47:45 -0700 (PDT)
Received: from [192.168.200.206] (83.21.93.182.ipv4.supernova.orange.pl.
 [83.21.93.182]) by smtp.gmail.com with ESMTPSA id
 y26-20020a17090668da00b00947ed087a2csm5313674ejr.154.2023.06.06.02.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 02:47:45 -0700 (PDT)
Message-ID: <1fc502fa-8363-5a5b-0697-f3001c7ab773@linaro.org>
Date: Tue, 6 Jun 2023 11:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
References: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
 <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: EEwjQAxQucS1

W dniu 5.06.2023 o 11:55, Yuquan Wang pisze:
> The current sbsa-ref cannot use EHCI controller which is only
> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> Hence, this uses XHCI to provide a usb controller with 64-bit
> DMA capablity instead of EHCI.
> 
> Signed-off-by: Yuquan Wang<wangyuquan1236@phytium.com.cn>

Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Without EDK2 changes Linux behaves same way (no USB found), with EDK2 
changes (EHCI->XHCI) Linux gets USB devices.
