Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp77844ejb;
        Wed, 31 May 2023 09:24:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56L9PBHKnfZnJvr/msWmkNg4gVnMVyVkEA6U1FZ6vb6K5Un3UzLMlYMEvMMRtimhyU//t6
X-Received: by 2002:a05:620a:3e87:b0:75b:23a1:3619 with SMTP id tv7-20020a05620a3e8700b0075b23a13619mr5519912qkn.42.1685550260958;
        Wed, 31 May 2023 09:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685550260; cv=none;
        d=google.com; s=arc-20160816;
        b=GZemmHIv2z+fR8EONgV7fSrpjX83NRVC27TKNYJzazasn6Kgr/NX9akxF6vVXPAYhM
         W1VBU+6eVTWzTb3QeiQC4KCiInPnzDupwz/JT0/WMHj5oZpU89wsPta8Rt+P2EEsXEE+
         LntDrb1AhoGW+NVHq2M9abQ68UWuCvlkbBrOBwoqRqd4WCRqm2e5M7LF78xdVXRpNy+P
         pEh5I0bhxHO08WhSQAt7uFz/Oo/CizvomNFrkfdU655Hz+42jmLpnueS+1Gm134xhkUF
         1Zbpxt43TOOfsHUcdDf/44OBgmTPOM6Fs7MUVciyV+z+u/WOXT2dbzGqYt21KEfDKI22
         CNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=vF7sPOsntDWs5/vTre97Ae3Il0a62eehpy54WdpXTFU=;
        b=UbivgTiL08UCPDQlq7o2Tj3nl/Arp9Hem/TResTERHZcVi21sQrXjntn4fple9ksY9
         avs2SikkSxkfRFRAxcX6MeheOLZ/6gCQEh8eNU+8/Vk0wGlFVQNpWAryQv0qLMeNmgny
         bXo2r7Z7LDw9ymZdoj8xsJqLD9JBdbzTCq5aq6D/6clLxbo+b2YUlqa3vJA3eOqZscUp
         JhQ7fuKss/GVa1wm72aW+QVDktOKYim9acA9w+Vy8stlKEqoVLwVhB8HNlxbDrhQDPtz
         Lsj+N8UVKpS9y+FAByryxb4w1pcE/o1ygKbNAEa+93rQW27GkxF98fTc3UEUtdC4omVt
         N+Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gpuz1bDb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020ae9c20b000000b0074e61bdef01si7541367qkg.783.2023.05.31.09.24.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 09:24:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gpuz1bDb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4OcE-0002Ea-4b; Wed, 31 May 2023 12:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q4OcC-0002EE-Mp
 for qemu-arm@nongnu.org; Wed, 31 May 2023 12:24:00 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q4OcA-0005FA-CZ
 for qemu-arm@nongnu.org; Wed, 31 May 2023 12:24:00 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5149b63151aso6516231a12.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685550236; x=1688142236;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vF7sPOsntDWs5/vTre97Ae3Il0a62eehpy54WdpXTFU=;
 b=gpuz1bDbl2NUCvKs8A7Wyk1a09wkWaEXT6Px7SCzm0jKVVjjzZU26yIZ8ApwhDMuJK
 nPQmtbxmTUQTrB2/c7xqQmjr1oScJF5BwcHMz1eK4v5eTDNopz1qLXH/wrpoaGeK+Qgs
 r4pb5FQ1c8Rnn0lOVT2b4RPGJMbdXssV8x0ll7JFtVAatoa+bjP7L6wvxe38nUi6AAHi
 8L6+Ta/ngDw3yarRUomIBTiCEK/6H6MRlEiozwqS/BA3LLlMv4ShXd4IdCQr8lEhM1on
 9+FlHzLgNXa/lq3s9QaSTRYdb8zZeyBCPgdEvU7If4mxftZe4OSqz9wJBzLTlsLlLBOt
 2GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685550236; x=1688142236;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vF7sPOsntDWs5/vTre97Ae3Il0a62eehpy54WdpXTFU=;
 b=B0YvXM0el9mBGh4XvaTTjWFV1Lm1fAfUEBRF3QvMGUAT75RSEBXnJA7BDrrX3zPDsY
 /7Zm9jnX6G4hu93iDtR4KQblB+BSfonoP+ND43ViFqwoNiK5fgwKOy10QxjtHybRyLB6
 gwhLDKk94bGuG3h4fAiANkm1SNSp6Q6F41jyky+tSnZNumPjHHIvSjY6UewpXhO1tagL
 rQiU4rDBMaCo4xyWcOVkfws0y5ipszn+v7JMsqbpR64YZWIcV3aaoc0CG74npVTDE9uB
 ZKsGphcPBdJN8y4fACtLP77vIovDLb4fKsSSZMe3P0VS6TkWd/vOb2pFRqHZHj/0PD6E
 Qr7g==
X-Gm-Message-State: AC+VfDwScWRdvG/Zw2d76Wky6nkSNu5Ut5T3Fvd4dh136CrsWlULMGs/
 K/nI9rGH08/pPpy6v35WV2yxaQ==
X-Received: by 2002:a17:907:3e8b:b0:971:5a46:8ab4 with SMTP id
 hs11-20020a1709073e8b00b009715a468ab4mr6501133ejc.66.1685550236401; 
 Wed, 31 May 2023 09:23:56 -0700 (PDT)
Received: from [192.168.200.206] (83.21.93.182.ipv4.supernova.orange.pl.
 [83.21.93.182]) by smtp.gmail.com with ESMTPSA id
 f16-20020a17090624d000b0096b20c968afsm9075964ejb.124.2023.05.31.09.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 09:23:55 -0700 (PDT)
Message-ID: <22b7f290-6372-4525-926e-463ab9337f29@linaro.org>
Date: Wed, 31 May 2023 18:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>,
 Graeme Gregory <graeme@xora.org.uk>
Cc: wangyuquan1236@phytium.com.cn, quic_llindhol@quicinc.com,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
 <20230531070229.334124-2-wangyuquan1236@phytium.com.cn>
 <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
 <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: 2op5GzXzYbp7

W dniu 31.05.2023 o 17:27, Peter Maydell pisze:
> On Wed, 31 May 2023 at 15:58, Graeme Gregory <graeme@xora.org.uk> wrote:
>> On Wed, May 31, 2023 at 03:02:29PM +0800, wangyuquan1236@phytium.com.cn wrote:
>>> From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
>>>
>>> The current sbsa-ref cannot use EHCI controller which is only
>>> able to do 32-bit DMA, since sbsa-ref doesn't have RAM above 4GB.
>>> Hence, this uses XHCI to provide a usb controller with 64-bit
>>> DMA capablity instead of EHCI.

>> Should this be below 4G?

> It would be pretty disruptive to try to rearrange the memory
> map to put RAM below 4GB at this point, though in theory it's
> possible I guess. (I have a vague recollection that there was
> some reason the RAM was all put above 4GB, but can't find
> anything about that in my email archives. Perhaps Leif remembers?)

I thought that memory starts at 40bit was to not use Cortex-A53 cpu with 
sbsa-ref. Nowadays it also removed Cortex-A76.

> Looking back at the archives, it seems we discussed XHCI vs
> EHCI when the sbsa-ref board went in, and the conclusion was
> that XHCI would be better. But there wasn't a sysbus XHCI device
> at that point, so we ended up committing the sbsa-ref board
> with EHCI and a plan to switch to XHCI when the sysbus-xhci
> device was done, which we then forgot about:
> https://mail.gnu.org/archive/html/qemu-arm/2018-11/msg00638.html

Moving from EHCI to XHCI on sysbus requires also firmware changes.

Or we can just add "qemu-xhci" pcie card and have USB running.

