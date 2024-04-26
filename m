Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp395478ejb;
        Fri, 26 Apr 2024 06:39:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3xtQx6yaug4EVp/H4Ji8YAS3rGkOHg1V7Qu+yXN9IKFA6R6JzSudXdTVhEmHTIJDBjq2p1VpJZHRqExiCgI+Z8xAPFDt4
X-Google-Smtp-Source: AGHT+IG9RF/kFnYYj4OTG3lp528Xl895SPf/vRIiiYdJApbcrB4AZ8d2dKXA/+Ai+DUbcHG+Q3By
X-Received: by 2002:a05:622a:4b0d:b0:43a:8cc4:d8e with SMTP id et13-20020a05622a4b0d00b0043a8cc40d8emr986187qtb.21.1714138760784;
        Fri, 26 Apr 2024 06:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714138760; cv=none;
        d=google.com; s=arc-20160816;
        b=jDUzmUaKYl3YYT14ZnJ/SYCZ+/iN57oj3e3DZZIRYzVr9bF7PTTp2rgudxJh/Fp++b
         sM4INF8cQtpk/ZMzMszCMC5LtXUap/oZvqvhZzyXQo+hn7a65ylBCyE47s/luY3nKfjk
         9rWTtzndkzse1spHUrwj81JnUgyjOef3SkOSVdAr3aF6e6ctcRMirpfCuIJDEvmqznqb
         uDG/HqtCZSqONdT2auSKnXoi/24nvB6fYICht/0JqBV51+3jT7jkdE2LpR1nwGNzX5Ol
         S9LCRwkGi+l0xca8yN2G14eQvVWcQnkI5fFnwE0P0pk2PfF/TY2K1N33RR6QWJqFBlx2
         qp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KtqpQh7Tri6+vPBLqrWX47scPgjtZh6qIkOl5hEiGKA=;
        fh=J/tjQU94na5L2mjIcTjmwQXHy83+yyStTT4yZkHw0CA=;
        b=fRq1odHUrH9fPDmmUirQ9E2rnMlBNL0E7tXkEENeZlvfZ6UiVoTO7vLEMP6cGQ76DV
         Ln//t6rAmvPSK8ESwbU5wqUraswlYLF4ng92ZfI5t76H5bJv4nbHqkWXHZLwJsbwQjAO
         HpMIwviEkGiJx+BMacUnL7m56sp19Z3PvEyC+pxIvqx3/YlnHGbHaIBwyQFfi5JM/U33
         SXeR8swFgNQXKj7k+EMBQiT+1Uluffl/CC0TQC7CthLN4neJqnu2BA3m68Xinz2Cu7IU
         Y5BAiWAmrqDgZgah2k0W1i+YT1MWaivlgAVr0vHtpFHnAUWthzcmD6PmoaSlfk9Q2rcp
         Q7/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHcpCPv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a05622a038900b0043183cf56b4si20518779qtx.490.2024.04.26.06.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 06:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHcpCPv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0Lme-00063H-2s; Fri, 26 Apr 2024 09:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0Lmb-00062T-5n
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 09:38:33 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0LmZ-0007lQ-GJ
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 09:38:32 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso242719966b.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714138710; x=1714743510; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KtqpQh7Tri6+vPBLqrWX47scPgjtZh6qIkOl5hEiGKA=;
 b=cHcpCPv5D5x6w9z004xexWPDL6dpL+FXGrZlVmSRcxd4xAzLuGkehLeFTwQFQu76tN
 Ne9R/RChrLXg/dxwNa7G/F+KI3Z6wB+iPsWdcRionqre7RHp2F+iTvRjzGP6U/aka94/
 NYm8ucLBgVzltlV0aZnCDG/iuwjb4maZVl+DghCbaY7jfK/oKbV8+CJww/s3qj6QiMEU
 75zaIebevmQqw+fuxammj2xPTyeDJbtvDefNIHq6BV4v+IrmPXm2UAM09CgOQOS2zyPp
 uSzSQpuFDP716757iPYgzRNM2vBX/X0RibMpyaWL76akuPAgN1yj0lL/SCIykBm8zITP
 38eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714138710; x=1714743510;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KtqpQh7Tri6+vPBLqrWX47scPgjtZh6qIkOl5hEiGKA=;
 b=kwpPWTHcUdhgOZ2mxK2MfrDo7N6QtqKETDD7GIEsu0dba/V6vv51CZFlQiiSKbkZNW
 cjwuOl0lawuPzncPd5o/ZVCb9D7BMiXnRmq7OiLYopKiwCreC/tDh3nNoFvFbKPs+Myj
 AkXTuNBWOnCUj3qtP0jegCsKTd9yTx9g0Q3pc2iHDOEW1lTwUYVcYRwfteziFLlPtEDw
 whGSk23lpfj0P2qJh1ZuLr/JBIGLYRtp4Wx/5tRX8m+8SMVLbrvv53x/LoLL35HC9EU5
 UCMNjhCcbrEx4gAkpD5vLGyEi077hPdpqJlu36R8RwwxsZBR6jLNt0kb1xU7JLSUaLc6
 tYsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmCD/6KrnZoHrpV3t0VgPSI9ZBVo1V1zUnjHmiAo6hIAFmFuEnnXoaKd8ORFTVei50HKuZheQjeSIvN0/7jxmbu4qt
X-Gm-Message-State: AOJu0YwzbKMbhUCsDEBs/gCKqv2Y9bPL1l948VHlGkhcH0DMSRDPHVpN
 96ALTMkahoVDO6v/PIhiMYPEmeJKnR8r3+6XxBteeVnKw3KJ1ixRzCfSzeZtEcY=
X-Received: by 2002:a17:906:244d:b0:a58:8827:6765 with SMTP id
 a13-20020a170906244d00b00a5888276765mr2221480ejb.67.1714138709613; 
 Fri, 26 Apr 2024 06:38:29 -0700 (PDT)
Received: from [192.168.69.100] (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 u14-20020a170906b10e00b00a5534758ef7sm10761888ejy.148.2024.04.26.06.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 06:38:29 -0700 (PDT)
Message-ID: <e2fb1d51-b5a6-4c25-a9af-af1e1ed42475@linaro.org>
Date: Fri, 26 Apr 2024 15:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to qemu_new_nic()
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Thomas Huth
 <th.huth@posteo.de>, Prasad Pandit <pj.pandit@yahoo.in>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
 <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
 <1497808863.2030924.1713955286878@mail.yahoo.com>
 <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
 <81397221-8144-47cd-bce9-b3ab7d94c626@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <81397221-8144-47cd-bce9-b3ab7d94c626@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TB9MCaN7J0CV

On 26/4/24 14:37, Akihiko Odaki wrote:
> On 2024/04/24 21:32, Thomas Huth wrote:
>> On 24/04/2024 12.41, Prasad Pandit wrote:
>>> On Wednesday, 24 April, 2024 at 03:36:01 pm IST, Philippe 
>>> Mathieu-Daudé wrote:
>>>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>>>> Recently MemReentrancyGuard was added to DeviceState to record that 
>>>>> the
>>>>> device is engaging in I/O. The network device backend needs to 
>>>>> update it
>>>>> when delivering a packet to a device.
>>>>> In preparation for such a change, add MemReentrancyGuard * as a
>>>>> parameter of qemu_new_nic().
>>>>
>>>> An user on IRC asked if this patch is related/fixing CVE-2021-20255,
>>>> any clue?
>>>
>>> * CVE-2021-20255 bug: infinite recursion is pointing at a different 
>>> fix patch.
>>>    -> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2021-20255
>>>
>>> * And the this patch below has different issue tagged
>>> -> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg08312.html
>>>    Fixes: CVE-2023-3019
>>>
>>>
>>> * They look different, former is an infinite recursion issue and the 
>>> latter is a use-after-free one.
>>
>> I assume the eepro reentrancy issue has been fixed with:
>>
>>   https://gitlab.com/qemu-project/qemu/-/issues/556
>>   i.e.:
>>   https://gitlab.com/qemu-project/qemu/-/commit/c40ca2301c7603524eaddb5308a3
> 
> I agree. Commit c40ca2301c7603524eaddb5308a3 should be what fixed 
> CVE-2021-20255, not this patch.

Thank you all for clarifying!

