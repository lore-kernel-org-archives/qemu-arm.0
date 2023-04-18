Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2654466ejm;
        Tue, 18 Apr 2023 09:56:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350bhpbkB7qzZyJl5MJfpDhImVkEbOKdTU+P8vnpzj36YvBJN3FqJdbsxNp33vt9hBdNu2zlv
X-Received: by 2002:ac8:4e8a:0:b0:3ef:326b:2e88 with SMTP id 10-20020ac84e8a000000b003ef326b2e88mr670638qtp.43.1681836973194;
        Tue, 18 Apr 2023 09:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681836973; cv=none;
        d=google.com; s=arc-20160816;
        b=BSa0Ob9eI+WEESl3cPp7RKLrOse7N5bxrnYTPtpyjugjBK3Frps4wlPCqXDClWbF1X
         MaifxXKf5l1SqJIV6zaikFq3lRTrH/vVfO+lm4qVDsyDwFd6N27VeYbUAZo/Q3Sej2uK
         rnGpTTH/ueqmSTInyFaNKVIuqiSOLrqR4QtcanIdQJ1SfjIO7H7P7tI0XzsRqeIzbjhW
         QJVtw/f/cpXaTnhHkGhlQqmAQYyBFFtp2mDLYGUVIHdxCs77YnozYYj/KC7rB9ElJp1O
         ezscZOyFxSsd9PnDOztNdoHrqY36qtHER9BV2zba4j9BQ2YA1NZbb4V1wTiek1iudjRe
         BHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PGiicJ5YsJn5mRLF0Tdsoe/uexqkskXow86/+mkxsSg=;
        b=GvkSQxNaG9sS3aKhQOmygCCOafCzetpX/nDeEX+7grCdm3mx4P68faSb5Pfk4LPhKh
         14ijiurEYoHHzfnP5R4JqojSqjoxAK05fX+jKBzEl6yAbsMmmstb7VVdQ0KJS4a6VT46
         Q8UGn6KI6lYenBIt4zj40DprnGuiXx46/3hS53JluMjosjBKi3KRlj2fGruqyHPhXzS7
         yGtfKUOa3M1kdzN0WnJv+rtv8alRLVCQVJGqEVIjP9F2DZLVTmJz8SgGQD2P/s/iCPcn
         ReV/ON5oFn6/rSZ6BBXUdFuJm37jjJ9YUMXYPgwK/2O98mMiV8fWGcwVXF+vFT6wOG3z
         pOYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=gPtiwtOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a05620a298a00b007495615363csi8164687qkp.466.2023.04.18.09.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 09:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=gPtiwtOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1poocX-0000Z7-EK; Tue, 18 Apr 2023 12:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1poocW-0000XP-0F; Tue, 18 Apr 2023 12:55:56 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1poocU-0007lF-2Q; Tue, 18 Apr 2023 12:55:55 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63b64a32fd2so2343361b3a.2; 
 Tue, 18 Apr 2023 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681836952; x=1684428952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=PGiicJ5YsJn5mRLF0Tdsoe/uexqkskXow86/+mkxsSg=;
 b=gPtiwtOjUoGMVUgYNVNyEoPxsFgtnA8m4umCHALVFfYpMFBBgRTNiJHMnUN/89PX6Y
 quz9Q81FLMIEvn/SdSB0jhdB1q6TsiuYd/rn1vcuwmGXeSAcjhlZhqGf4LkmKzxPPdpC
 VnEoa5fMsSy2At+QnDZiVUBGclmax6XVTq3l9Jg13mxXUtqzEJTXeLXBMlOx3DbiQvfp
 qiVXUGh030frWHAH5yFznNjFcqlHx1+vPyo3klQd1EjBRTL67DaQEnevD5xMFB6sNav1
 saNowv0e1MhmgxYNNsFKlGvbc0bmGMn9kjgmjXtK07ivd5SW2h6g4fVb+C01dsc8Zbaz
 UtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681836952; x=1684428952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PGiicJ5YsJn5mRLF0Tdsoe/uexqkskXow86/+mkxsSg=;
 b=eWmIN0cQK/I5aJ2vWiFaGm90Vhuzpo0rKXxpCoOzjspVS3idxv6OwIL5boH86ni8Ug
 A9beVIatt9E9FrLK2P2wHaCL2q2pjhIn29N9HvwSLEnNX5cTKDlN3Y1E/xXTOyVGMuYj
 NhRzmfwmaYW/t1eFqV+vuo9FDs2d6o4xqUMW05BgOATiwS2+Jc55oZP+gC2QvWdjDR3l
 vBA/rUQLAKE5Y2lLbWOJBxImmf7GLebNFt/ygtvRxO2X+eolJukipoebKAe5CPR1BTnT
 ZF3zgcVyx9ZUtOc2M99C3pctcZJWfNpmoOPGFOwIhVBQm4l6z49Uya9SgwbABGUYuCYJ
 raUQ==
X-Gm-Message-State: AAQBX9dKeSop9HPr9co+OfzYYfQynd9fE+fDCuB2yVzp/PbaRrMV8isL
 HeZ9iiiTEqhgDJFflG6nFb8=
X-Received: by 2002:a05:6a00:10c7:b0:63b:854c:e0f6 with SMTP id
 d7-20020a056a0010c700b0063b854ce0f6mr433710pfu.21.1681836951978; 
 Tue, 18 Apr 2023 09:55:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a635145000000b005186e562db0sm8936883pgl.82.2023.04.18.09.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 09:55:51 -0700 (PDT)
Message-ID: <b438fd63-85ec-b765-435c-80512da49e2b@roeck-us.net>
Date: Tue, 18 Apr 2023 09:55:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
 <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
 <CAFEAcA9VQHa=Eenyon-kaiabayM5YY7FHEJsEWOzjzj3rXaSaA@mail.gmail.com>
 <79e67479-6785-c064-6aae-edd1ba2327cd@roeck-us.net>
 <CAFEAcA-tOt520nfNdHyGV+0PUvGdw2o+yfpv95cQDHPDJnq0aA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAFEAcA-tOt520nfNdHyGV+0PUvGdw2o+yfpv95cQDHPDJnq0aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.597,
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
X-TUID: PnoHt+NGRmhf

On 4/18/23 08:32, Peter Maydell wrote:
> On Tue, 18 Apr 2023 at 16:18, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 4/18/23 07:46, Peter Maydell wrote:
>>> I guess I don't understand what the topology is for these specific
>>> SoCs, then. If there's only one master that might be connected
>>> to multiple PHYs, why does one ethernet device in QEMU need to
>>> know about the other one? Are the PHYs connected to just that
>>> first ethernet device, or to both? This bit in your cover letter
>>> makes it sound like "both ethernet interfaces connect to the same
>>> MDIO bus which has both PHYs on it":
>>>
>>
>> Yes, that is exactly how it is, similar to the configuration in the picture
>> at prodigytechno.com. I don't recall what I wrote in the cover letter, but
>> "Both Ethernet PHYs connect to the same MDIO bus which is connected to one
>> of the Ethernet MACs" would be the most accurate description I can think of.
> 
>> Each MAC (Ethernet interface, instance of TYPE_IMX_FEC in qemu) has its own
>> MDIO bus. Currently QEMU assumes that each PHY is connected to the MDIO bus
>> on its associated MAC interface. That is not the case on the emulated boards,
>> where all PHYs are connected to a single MDIO bus.
> 
> So looking again at that diagram on that website, I think I understand
> now: for data transfer to/from the outside world, MAC1 talks only through
> PHY1 and MAC2 only through PHY2 (over the links marked "MII/GMII/XGMII"),
> but the "control" connection is via MDIO, and on these boards you have to
> configure PHY2 by doing the MDIO reads and writes via MAC1, even though
> MAC1 has nothing otherwise to do with PHY2 ? (And MAC2 has no devices on
> its MDIO bus at all.)
> 

Correct.

Thanks,
Guenter

