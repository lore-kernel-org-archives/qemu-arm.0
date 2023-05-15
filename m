Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6581586ejq;
        Mon, 15 May 2023 08:12:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PXHUFeFWM3nnilDoEcR9haC613eSDS5S0ztqqyc5jLUC2giRInlXa3TYEWLqyucRUAjvH
X-Received: by 2002:a5d:444e:0:b0:306:2c59:3838 with SMTP id x14-20020a5d444e000000b003062c593838mr26110042wrr.44.1684163537858;
        Mon, 15 May 2023 08:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163537; cv=none;
        d=google.com; s=arc-20160816;
        b=xSl6jyFTSHWRIReEt7YlrG92zyhvzBRl/TCg4KBK/MaDY5DiLXkY8AV+29WYcn4Ydo
         ggX8VwBP+1hnECYze45wIXIC5whYEpJvVImFpNNGnfFGAynB9cMCuFr9k1SKCX0bi4/G
         a75LS+eXs3OlIt8XEu5Lx0xIkD8tIGMvYBhfthvYVA1oDckNDptPPbKyVbdMO0WVJWOJ
         0q6r2+CzkuE9w31vlw6a5uOhD3o5EL2QYWQImFyHuAgpA+3NhTobFQS31h1Vgot+hxFl
         R1Cm8R6St2jRY4loobgSElA1rZVstAUzA1SE2em4olYrUNMJbwNnllWli3YV2hzRe+GB
         g4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wldi7SZBf0ZVtxp2Y7J/5g3LhFRoQE7xPIC3ZwsnZBA=;
        b=Mu3C1EqcK8fjtGzGIiuxMOcmqxX89D4kBuGTD9xkc/6CTi6OZcyFUmVaAxvJwEtBCt
         xSKOi1xlfjU2VxhtfOYvfXr2wSaxulY5JwE5UXOfUBb+/iQpwBu0BpTXgD74eYhpkoVJ
         yAM/6jm7o80kwBQZiKAAj8ITO67aaJg/qRzfXEEbRqayOZIKE+ycNNSd+oPrgMTdptvx
         UnbhM6VW1gCJ1DU1gcwOiEIbU5EqCBacikka+Bbfnm0aMVcJFS0oz0coPDQR9N/Q1IuN
         WZy4BEr+UGfmJMNq/8pAfKrpN7erw4Mz2ysYMSj4NS0YaOrCX6lm++x/Iht9aAlAiDnY
         vObA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QL/EzOwn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020adfe850000000b003063119e24asi10922wrn.829.2023.05.15.08.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QL/EzOwn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZre-0002io-Dl; Mon, 15 May 2023 11:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pyZrc-0002iT-QU
 for qemu-devel@nongnu.org; Mon, 15 May 2023 11:11:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pyZra-0006li-Qh
 for qemu-devel@nongnu.org; Mon, 15 May 2023 11:11:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so8423361f8f.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684163509; x=1686755509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wldi7SZBf0ZVtxp2Y7J/5g3LhFRoQE7xPIC3ZwsnZBA=;
 b=QL/EzOwngUQ3w3/kY0LPuuHUxVm04b04IA3Vqsgi1Fl6MHyFscBasKVDCiZEPxw99e
 sXTo4tearh0hxCDo3jpbPt01EI8O8uFoNT4fJbXHsBQf+iWAGQT5KYvJ143+RoPs7YdI
 MaK0IvFRGztEGBgL84rdca3Rt70Pn1gtnbmdmm5IkJ2LWW8lFZZqoB4YEeiR+EcSBALg
 JddIaAGaZT0HVH6YgvkNsfL3g9D7pUNxYaaVBx+u7qpPQ/RAEV3QO/yh+U6SaTIorCJG
 SugpXAxpehx6THQ/aLhh8sgirMtKXRl69ocj3FjwcMdsjqYVfCAedIqcsVsy4UxcNCam
 XiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684163509; x=1686755509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wldi7SZBf0ZVtxp2Y7J/5g3LhFRoQE7xPIC3ZwsnZBA=;
 b=aLjRCYDCYs2nw/aWjud4haB9WmQf+fEDSJVCiYJ3HC6x0D2WvVKgvz3k6+ls3GrJkM
 4IhdfWNfDUYEcZusLFoM0v9Jz4P+x000+THc8K4ePgPDelbquhpsrZT2jHfyU+eDo954
 T8StI474jHVASGE1XazunQNKldeQymhkUT5VInE6gqsxf7qXnZiQohssjT0PLoe7XMCf
 X3Np6d2gNnNCEJYrGOUYIL/50cff3uFOl8l0rOcWHrCa+31+TigxeQ2pnrBGIuVH58lU
 h14ZqPEb4wvfZ4xXn/jcsTlxXCkfGO6UrpmXTG36BBbDTImfJrs/N+AnF3neeGM3QagX
 y1UQ==
X-Gm-Message-State: AC+VfDzkN7fJdbhINmnLoTFRFf3xn0hoUeB+BAfKUy52mMcQOLlnDTok
 d7M3a+ktVMEIsFpPJJDjGq/HCg==
X-Received: by 2002:adf:ea85:0:b0:307:834f:7159 with SMTP id
 s5-20020adfea85000000b00307834f7159mr25273036wrm.4.1684163509207; 
 Mon, 15 May 2023 08:11:49 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h4-20020adff4c4000000b003078bb639bdsm34225wrp.68.2023.05.15.08.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 08:11:48 -0700 (PDT)
Message-ID: <38957cc8-4f57-167b-2ad3-35a7dc0af0f0@linaro.org>
Date: Mon, 15 May 2023 17:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] Maintainers: add myself as reviewer for sbsa-ref
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230515143753.365591-1-marcin.juszkiewicz@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230515143753.365591-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
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
X-TUID: cRZoKNrMaAil

On 15/5/23 16:37, Marcin Juszkiewicz wrote:
> At Linaro I work on sbsa-ref, know direction it goes.
> 
> May not get code details each time.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


