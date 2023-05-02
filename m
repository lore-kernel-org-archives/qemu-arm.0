Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2393149ejm;
        Tue, 2 May 2023 12:20:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+Um1GgaPxqOCvKrRI/BqgAxJ+MNVgHa/7bLYREQyMBbH+vYAxT1q6Ue4LhTo6sZ7zWX15
X-Received: by 2002:ac8:7d8f:0:b0:3e6:9847:661 with SMTP id c15-20020ac87d8f000000b003e698470661mr29899311qtd.38.1683055221619;
        Tue, 02 May 2023 12:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683055221; cv=none;
        d=google.com; s=arc-20160816;
        b=fUd2cGokC9mx6xuunzKOhtyHSPP7XSb6qItsWJFSJleRlUHNXnpDzOuIaysNusNurx
         fpiNpNxQ5NEHGPa1zhzeaeO4tfHmuKyM9CRM8d+IdlvQFlv5Gwr1YzIKfHFvp4Sh726N
         kH2mqv/T0cOBEhtqj4CgzvsFiP622uuFiCdhoiN1FQ1W2WT5RFyPp04qJtaw7kmlX3oF
         lbG1XQq0dGjw6X4uBR5r0U5tyg8S0dcC7YhVWnt7aNTr1im3ZaprUN/mt/XyQWs+Gvoz
         RXY/joBy1kGEhBho/z+gYXF3YQujMCxbvP5qlwhklNtKW8C+YsZcpA2j0t712UehiJEL
         6JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7usn756S/TuIOQBrdWdBXYCsofXslEW4cXCpMHZzuEo=;
        b=BIyB/aR20CTi3+y1g6LChk13e6dWL1FFSVXzuTmcAh4vcMqznff8KJ3Xqah4+e8Wb1
         xuPQtst/F5dVDBColvKOLZfoDeqvfHjYDZs8v2fxmnesu2RCSj6R9tC13z/9aJvucAv1
         Y/te7LZ4+lZmbdKo24vUZibDpVdPg8cmYkycpxkuYmsMyjBKPGs+834m27ZHivJZBtW2
         JYcbclf0aUuPVMK6pw/EZhQ/0USZyKBwAR3nyFaFhan2W2hs9QT3qhQ4mbr1G4cC+XgZ
         +Crlmiq5w8oA3ljBQ2Vdu//DxrI/ffT7zN/tsmHo1lmbJi0At1qwTi8MnKgksNFqctEB
         wBpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tyXk5/g+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d125-20020a376883000000b0074acd08028fsi17637265qkc.292.2023.05.02.12.20.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 12:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tyXk5/g+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptvXO-0004bf-Vi; Tue, 02 May 2023 15:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptvXN-0004a8-CB
 for qemu-arm@nongnu.org; Tue, 02 May 2023 15:19:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptvXK-0005cy-E8
 for qemu-arm@nongnu.org; Tue, 02 May 2023 15:19:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so43921115e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 12:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683055180; x=1685647180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7usn756S/TuIOQBrdWdBXYCsofXslEW4cXCpMHZzuEo=;
 b=tyXk5/g+MnwQCMyQ377Dxl0aON80yhPVAb+alOCmQLcxAycEeSCSGy7tf1rEi2tMKE
 22ZjBeF+gUWnrgLSK/vcBrRaHELLDMmckthRwWEblDhHtbrkd4FQWfLUGC5URBphGctw
 OZaHqqdRX2K8DVerneaT8mNja+PV0deGmbX40nJQ0vfMwBO43A+s5FGyKun5fFG1NKn2
 IBHY9Ezq7qM7KPDkaCqWwbEZDPrTDuIkMdcZGTFbyaaybusQAsaC9zeJKhML8E4MtRVh
 Pt/FzuMO9l4dh5zX761KE4Tt6tkyN73zjccAfzS5Bq/oW7Ry39gja0vkCzOzhUbQwA3N
 EM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683055180; x=1685647180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7usn756S/TuIOQBrdWdBXYCsofXslEW4cXCpMHZzuEo=;
 b=P7aX0O0976M1CNg1Cy5NXZ7yzxFqKSwsfqfUuoSNkEIvKsnZ0r1V7DqdHmacyFCDas
 /KJtMeZpzlUZelkVU7ncEUUx/dHDDvMhp3uwkBO8kayqjYMKekGpnkfnSUzRe40y7s09
 Qxw/vOoelf3lCjwCletPwBLoG65/9UWJm7Xb+IdF0lbIfzjOl4c7FFlB5fEBl8WqoA8N
 trBK3RcpUXKsPQ8OOhPO0xXB+s4k1hgPR0utnOyqW+kzilQrTDEgNZbjz3o3PKTlJXr/
 RQOMDhLRjVKWeL2GAyBrCiUV7kJSw6ovPV4/jg41DY4Suwgqs8GeVfyP/NDVJaQIk9H9
 5hDg==
X-Gm-Message-State: AC+VfDw3SC5nyRuyhQUWJKSs2WdzWYuJj3ZCe3poksnd3YvmvY1dtl1b
 exkaRyKNtrgFvopaOV9yxAV3Ag==
X-Received: by 2002:a7b:c8cb:0:b0:3f1:6ec5:bc6e with SMTP id
 f11-20020a7bc8cb000000b003f16ec5bc6emr14407890wml.3.1683055180420; 
 Tue, 02 May 2023 12:19:40 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a1c7c18000000b003f183127434sm36428174wmc.30.2023.05.02.12.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 12:19:39 -0700 (PDT)
Message-ID: <abc64290-89f3-bde3-de68-3b620e6a3c6f@linaro.org>
Date: Tue, 2 May 2023 20:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 00/57] tcg: Improve atomicity support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, git@xen0n.name,
 jiaxun.yang@flygoat.com, philmd@linaro.org
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
 <CAFEAcA-R5uNg19c7VfvJ5bzZWLhkcUUwmucHwe8ZeJYMQ-vCeg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-R5uNg19c7VfvJ5bzZWLhkcUUwmucHwe8ZeJYMQ-vCeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9B7267ByUftz

On 5/2/23 17:11, Peter Maydell wrote:
> On Tue, 25 Apr 2023 at 20:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> v1: https://lore.kernel.org/qemu-devel/20221118094754.242910-1-richard.henderson@linaro.org/
>> v2: https://lore.kernel.org/qemu-devel/20230216025739.1211680-1-richard.henderson@linaro.org/
>>
>> Based-on: 20230424054105.1579315-1-richard.henderson@linaro.org
>> ("[PATCH v3 00/57] tcg: Simplify calls to load/store helpers")
>>
>> The main objective here is to support Arm FEAT_LSE2, which says that any
>> single memory access that does not cross a 16-byte boundary is atomic.
>> This is the MO_ATOM_WITHIN16 control.
>>
>> While I'm touching all of this, a secondary objective is to handle the
>> atomicity of the IBM machines.  Both Power and s390x treat misaligned
>> accesses as atomic on the lsb of the pointer.  For instance, an 8-byte
>> access at ptr % 8 == 4 will appear as two atomic 4-byte accesses, and
>> ptr % 4 == 2 will appear as four 3-byte accesses.
> 
> I hope you mean "four 2-byte accesses", although I'm never
> quite sure how odd s390x can get :-)

Heh.  Yes, of course.


r~

