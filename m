Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4063183lfm;
        Tue, 30 Jun 2020 08:30:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbmJTf8/FddY7DUEMv2wBN4H1Y0LKnAgm0kyFH7s7EfOi7kJcCvUk8jAYRoiDMGukNMubV
X-Received: by 2002:a25:ef42:: with SMTP id w2mr37547945ybm.50.1593531008247;
        Tue, 30 Jun 2020 08:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593531008; cv=none;
        d=google.com; s=arc-20160816;
        b=uphUFGySLPFE9ogJLAy8eYpyEbHiciDhP7i+nDhQ8WHpWW2p6KPOaixfy8Z0480Y95
         89BEqvrEwCzUMlmy36VA4DkMEw2s/ChPw2orZq8Y9nNFe6mQqC0RPdt7Euj5NOnBRbAN
         4pX1Jt4OnAL6v3LHSFtE/ihKHDmgatiKtI84v5A2RGNmidEpL4JAZz9zk+/JVAi/HgXO
         L4lwAGFBWp/iCzDZwkESPN+AIyKiXyzMG7pIoiNCqaE2svsY7ZEmOqtlayqQI0EYVFq7
         MDzD8lBb1Ylx0CC6sIL9ww36ZdFFL1iJn+2tk0bU+r0OtOYihL73VYhv9ykxIIWGPHEX
         tC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hMvaZm4s2NiexU2VoFEbJboh7hGFUWhhQ6OdHoh4WCc=;
        b=aOrTFTu5ts6IpmV+Ss3KBlUrnSY8tAeM2pcfMQ7ndFQmYS3HeKmlA299LpBGAYWl5N
         Di2OydGt2i/s2RtSnuIFkYROLHeQUkzdEisQZI6CdIkKbMhujue1fwdoY1JZ/pDEvxrk
         w80W4MGsHPlMapzpwbK/zmL5u6Nk6TN4ZloeOci/uUR3v+glkUbrJZg37bvjxas7QhPt
         vuvr7ptIqGTy2MzUzu5p1S6EzERCokk0x+h37K4Qo4O17NrVugDduv0Tb6kscDst98KA
         Y3xr7mRjWHJrMEY5MFWWne+Hdw10iAbVCQiLcX29ByUqwe5GZNlN+K6plhAVN/FOerRj
         pZJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KMlbaMT0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71si2994149ybe.370.2020.06.30.08.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 08:30:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KMlbaMT0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqID1-00083b-Ji
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 11:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqICJ-00076h-4B
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 11:29:23 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqICG-00013c-TY
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 11:29:22 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n26so7141529ejx.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2020 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hMvaZm4s2NiexU2VoFEbJboh7hGFUWhhQ6OdHoh4WCc=;
 b=KMlbaMT0TFn1XiXni8NmmdR3ekQ1CImC3/A/ZJTh4DZbVkxKaQhgEhW9tPSpSAQsgq
 u1u9UPf72YBFt95ckDmLXCw3/VPH6EpfVF2h3HuvpK/Eefyju0shVUwghcJjyiHm90vr
 d3uPviQYMoq47w/I6EQFYB+2IRmurIKUQE3zkL26cHZk6M8crZ33OCY2PNijUE9FVygI
 FnCq0XKSh3e33fOnNz+b1d8KwURd3lEa5ViK+n7NXhuB5f2riSTwsEBtC4j7KrFqA4hY
 4wDLVmlRd/gXBwdEi8I1OFM3wxz6+fx/my550TuJN+ioDuSjYcdxGhOveL+WHJXW6GWI
 M6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMvaZm4s2NiexU2VoFEbJboh7hGFUWhhQ6OdHoh4WCc=;
 b=U4dz1CA9yWOXWzEknQaPYd58Gh1oHtgF7m47j3gVuMqto2NTazoB71JtgZQ5loYC+k
 mMkbLp7JfSb1EgwM9Oixxr9by+BA3Pba7YNg8blxZ+mVlzEzm6fKFILBYPSqmNjMsLuV
 6LF18t4c6/sMQTpbb6SHE+crNAJ8KgKxQ2yQDuVDyaUhT+b+AGUjstHmDiB1EvMkd4gb
 UTPR77T9eUnzw9skxOUII1uoqI50js89REVIP+ew42/9Xraigq/nymvwP53dBrXOnCt2
 nfBp1lvbC+Fp7tcDX7ixx6/AXoV7oS1mQ/BlziV3F3O09eJwDA0FLIeWbkPr2iGjuSyX
 HMYA==
X-Gm-Message-State: AOAM533n0rxM/YAlc/RCllaTaIzqh8NhCb3yoDCRa7RjmEzuGjiIJWZg
 059tpAsrP3fWiSixrwwUAYE=
X-Received: by 2002:a17:907:72cf:: with SMTP id
 du15mr18240223ejc.151.1593530959230; 
 Tue, 30 Jun 2020 08:29:19 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id c7sm3157587edt.35.2020.06.30.08.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 08:29:18 -0700 (PDT)
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: Erik Smit <erik.lucas.smit@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
Date: Tue, 30 Jun 2020 17:29:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: pFDwC5wCTG90

Hi Erik,

On 6/30/20 5:11 PM, Erik Smit wrote:
> Hello,
> 
> 5d971f9e memory: Revert "memory: accept mismatching sizes in
> memory_region_access_valid" breaks Supermicro AST2400 u-boot.
> Supermicro AST2500 u-boot is fine.
> 
> The u-boot tries to make a 2-byte read from address 0x84, but
> aspeed_ast2400_scu_ops has min_access = 4. When I change min_access to
> 2 or revert above commit, u-boot boots again.
> 
> Is changing min_access to 2 the right way to fix this?

If you have access to the datasheet and can verify, then yes.
Else I suppose Cédric, Andrew or Joel can check for you.

> Should I send a patch to qemu-devel for this?

Yes :)

> 
> Best regards,
> 
> Erik Smit
> 
> P.S.: I'm not subscribed to the mailing list, please Cc me on replies.
> 

