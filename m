Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1385111ejc;
        Mon, 13 Nov 2023 06:50:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhC1FEgv96opZ3uKXjkrKOUqEz18daEiS8YDjZsxqeAX2Fx9/UaaZ1ApLZdCXx/1zzeMfv
X-Received: by 2002:a0c:fde8:0:b0:66d:27ac:a595 with SMTP id m8-20020a0cfde8000000b0066d27aca595mr6562988qvu.23.1699887026564;
        Mon, 13 Nov 2023 06:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699887026; cv=none;
        d=google.com; s=arc-20160816;
        b=g5Yctcp5fztJ3R5cPnx38AMpznCXa6ZIIBwrXQGDsZJCseRaYOQOUlzLwbHBMuNbVE
         rurx2lNMoG0E9ckhbNAycwUHmzfy3+V/XYXX9w2jd7bH0N2SZkz9orWhEVjJN+h8ofXf
         QWUQraidzCggtWOmw4vlkgOpRoBrGZ9Mi0mTJQShd1bmZL5EVzO/a5aF2WzSI2nSFshR
         gyHv3ntev6RAz/XX6oZdjAXuCzE+rXMlNpu5vEMKrP6Y93+TsOA3F6KPuhbsjVUjNl1V
         ataIyuCZJkWoN1Bv/pRoaII1M8CKaYfwiSoeP4d912bIw794wW1+88pYrqZgIby2z5Kp
         WQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MIpRLQlxm/uqf99/fywpBLf4yCHs57hMrv/bnK5LrT8=;
        fh=cLMg4nLJGChWLh8D2ItzlHMuqmaDWJMK+WkghwCc0dY=;
        b=Ruxjzlh7PuOPdr6cQ+HJ1kK8lDhw0l7TG2RMKtxckcSuI2XQPwps8bk755/Oce8jJj
         fUeGtM4qR9LedGyYgOR4iIH/+EyIKixxQri6lk/OiVCg3/pIl7uPgo8rxvd2KJwyc8lX
         iEpjgEnNVhjHrFZVOhY4UZo2yNVw5ynXxQTXdCOWuDT9M6tbGIpj9NiVMWV7Fkp0ivf4
         SxRXH56a3KM1AdjAuVvdLPo7eOy2k8CkpPXgdUM49KBLkcoUmOl/AfMHhAraurmxLYke
         69q1sVKQib63qxFWuZll494PBhCnGFFN1CLi4/cIM47jTVBQV7bifM0bJcIzeC+aeh66
         JFzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fEyK8w/X";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a259600b00767f3ee54a3si4430010qko.80.2023.11.13.06.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 06:50:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fEyK8w/X";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r2YGY-0004Ws-M0; Mon, 13 Nov 2023 09:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r2YGN-0004L2-Hz
 for qemu-devel@nongnu.org; Mon, 13 Nov 2023 09:50:09 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r2YGM-0004uE-0h
 for qemu-devel@nongnu.org; Mon, 13 Nov 2023 09:50:07 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so9173394a12.1
 for <qemu-devel@nongnu.org>; Mon, 13 Nov 2023 06:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699887004; x=1700491804; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MIpRLQlxm/uqf99/fywpBLf4yCHs57hMrv/bnK5LrT8=;
 b=fEyK8w/XA5D710w6R2MiSuwxWxuwDNDyCc2OHfubLjA8oxR1H7CdfousQAocbTxkGg
 sO4Nr8O+Z2bN7zRWnFea+w/oMRiMPak/dKxx6OhCDFK/WxJUJBg/gCy1gmGMMFunTae4
 xVw/7mBbIXaAruDxkHE5sBgG4cf2u4F2h0Ta+1gBbAZhJ6U0hkwBZLTQ+xGv0kPe2xqq
 SYZ7ceN9QLS9UfOELLgWRH4EcGASuQupBktC9R4BMN8mH3PRrTAnnyXaWlaM0Y4Ai7nr
 aWbj7jVjuM9p+sMFADQDeah2cODnyJIIUx1od6qkGwCeIRLtNGUj3KHt6O/QUHZ1z1Pk
 Ow/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699887004; x=1700491804;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MIpRLQlxm/uqf99/fywpBLf4yCHs57hMrv/bnK5LrT8=;
 b=orOidwmrsMsyO8EbkCi6o/w6gz1sbYF50V4rg31RUZrhslgAgmfOIM7/nw9kVycKzJ
 QxhKs2wRoN3q/VtwUco1MUr1RgXSD7mCdeqbkXAz7uwdOAbTacT8Dnvc5D4M94J2zcfG
 IL1yXp2F/+RmfeINBO7GSasPqroyg6MSv0mEAzmZsfKDH0rAuiiqbj4H97zYkY1mIyDf
 Vsnt51Nwx81+GeSBRxwmHXfndQveX8o3yC9luU+q7OHcOPEaNruneOXiEbeC271ZRMyq
 W7Bk9J4FTBF7cHvBzhwd7S7+2cVspOx9zNnkEoDEtSPgTlE+gXXpuYVYrW/JWlcLug7j
 DwYg==
X-Gm-Message-State: AOJu0Yw4NAy867RXnMBqjHpVzWoiI3nGIeJR3eOIoY8Znd4T/W3TgyIW
 /vy4xvjuKqLc3vs3lM5wZIc6eA==
X-Received: by 2002:a05:6402:3514:b0:545:52ff:edef with SMTP id
 b20-20020a056402351400b0054552ffedefmr8609252edd.20.1699887004339; 
 Mon, 13 Nov 2023 06:50:04 -0800 (PST)
Received: from [192.168.69.100] ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 b30-20020a509f21000000b0053d9f427a6bsm3928836edf.71.2023.11.13.06.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 06:50:03 -0800 (PST)
Message-ID: <2782df43-d74d-4cf5-af70-cf05dac6e733@linaro.org>
Date: Mon, 13 Nov 2023 15:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs/system/arm: Fix for rename of type
 "xlnx.bbram-ctrl"
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, alistair@alistair23.me, edgar.iglesias@gmail.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com, qemu-arm@nongnu.org
References: <20231113134344.1195478-1-armbru@redhat.com>
 <20231113134344.1195478-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231113134344.1195478-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: t9AFYqVKxwtO

On 13/11/23 14:43, Markus Armbruster wrote:
> Fixes: b65b4b7ae3c8 (xlnx-bbram: hw/nvram: Use dot in device type name)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   docs/system/arm/xlnx-versal-virt.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


