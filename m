Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1748558ejc;
        Tue, 23 Aug 2022 14:48:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EHJ5lFdBCZtZW92FeBiUNkp7rvEB92H9caNHaYLsCVvKjmImgNDlQtzq8dR7gL/2r64GR
X-Received: by 2002:ad4:594b:0:b0:496:e376:2e78 with SMTP id eo11-20020ad4594b000000b00496e3762e78mr10358928qvb.108.1661291332747;
        Tue, 23 Aug 2022 14:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661291332; cv=none;
        d=google.com; s=arc-20160816;
        b=EDncA63+EBEWpwwtCRy+aRrhX2BKcmdNrBeSKOtVgkdOqIxPNlX3VBKeGxZblWk1Ma
         /d+G7aQ/ETd85wz5cR7Vu6z4GV19iY7ugUg8BdU5faqoDJIutYwQ9/CAb7Uz0p7hLzco
         aw8vWskKrdrck0kR+HPG0/FArDIrRQ346gcnkCeOcJtvb8ejK2KDYgaAV+OMl1dSWmWg
         743KvI/RmD5S/KrbnHJH67U3NsVGsB77AtOE8FyrBwzXM4XHoFvB1vuSKMdUXaOePVKn
         BB6Gf8DM3PqjqyWZhasa+h2evKEvpiogqE5x1rgvYZNRmh7jLx3HsEfeKbCzM4oq2y2M
         Yd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=QowsUwQ2vG7ITBKJSnwdTp6JGxr7tTOzmyihrwh3PGI=;
        b=0NeNiDR8T0n7HCf1wcJnHOGywcStWw+t+fYgDukT2e0Z7YJQkrk/hkvhbXi+uT13He
         6aVTD8z7ygzC9/mpwwrWOgYdGbnqWSpThMBvBTA0K7oXYQ1gnw0y4qzKNcs+shdgS+R7
         CixNMRHvlxXgTKz20qaLDqkCr0rW3a0FMcLqVRlG+TGV8TBwK29jx3J3k+LBeqmjPz3S
         5wrGA8uFxpeebPw4RRT5hZ+9DW7lmLfvz1ktYgjpoN5gdwIMgBc0ZU5D+f5aAAnbMuxF
         9MPKYgmBJqM7p8rs/eRl+i4qyEbWrYO6BGZCYyMTNYIxjHSMTzgRsinPqKrU8soYkyZZ
         6jdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RCOn0j7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05620a0c4a00b006bbbcd5bf05si7437763qki.693.2022.08.23.14.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 14:48:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RCOn0j7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQblU-0000X0-9n
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 17:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQblJ-0000Um-Ri
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:48:41 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQblI-0007az-44
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:48:41 -0400
Received: by mail-pl1-x633.google.com with SMTP id u22so13973572plq.12
 for <qemu-arm@nongnu.org>; Tue, 23 Aug 2022 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=QowsUwQ2vG7ITBKJSnwdTp6JGxr7tTOzmyihrwh3PGI=;
 b=RCOn0j7EdCfyn3kW4wMhp66VOF7GQrWu4rNXkrXnliguOvoxL2WKqER2Ab3llIIZxx
 dbxF2XBXans8dBAPIT2CGMau4ajdkZpbgza3WZ5N9Uks7Y+NqITCFRjgAf001ZEU7jhT
 KZbbJMJk7eVkboXkY0DbhJ/SZ5ZsT6ycvBksJEaWinfT9fchNW4hkqB7UN3nNmps8g0z
 vmeDErdg5TkCt2PqPGb3jMlYOnxRn1HqhmM6yA2abuVDWy8uXJqZrkOiaED7V7/o0OiO
 FjttkwupUKQjYGgCaLra9P4VNNBXrZYU8sHzCZb6ulA9Ivnz3MY1tfZ4nphSar2DxyPA
 v0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QowsUwQ2vG7ITBKJSnwdTp6JGxr7tTOzmyihrwh3PGI=;
 b=6axVGrEXhzuCUH+4gtGsEjnnkeSBnRDcGfP6KTYcefMTfG0/Pe6WZYDGRTi6SVVdeD
 P4D7qeQwqUPXR01TNqTczv5hXfm7WayUxW7kebed1NoVRH0vlke8tr4CfjG5RmMOnJNa
 PFvkI3VD2ofr6sMSuDElLqQDDlYzVKyyVWhS9TpI559fyY8pgg/A5XIhfVadI9+VErga
 Z81Q81dSc2ZFkmjFc/NBSVXuvILhfMTzthMCLj5m2HK3twORj01MxZFkk4q548VpgT7s
 b9d0s+WyJzmBKjNefXeejllNQ3nr87jb3p7DLwOzjmufypr8uhZrp/pOnx5lZIsSG0jw
 mYmw==
X-Gm-Message-State: ACgBeo2ZEaC5tKcZxg5Ddrcye92OftACy725euV7tj+akAG+7B+LasSD
 Lur/ECCI3NgFwmgkULnkM6GsKw==
X-Received: by 2002:a17:90b:1c04:b0:1fb:6b2c:ca8f with SMTP id
 oc4-20020a17090b1c0400b001fb6b2cca8fmr3704881pjb.88.1661291314462; 
 Tue, 23 Aug 2022 14:48:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 d62-20020a623641000000b0052d2cd99490sm11276317pfa.5.2022.08.23.14.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:48:33 -0700 (PDT)
Message-ID: <ebd1e692-7264-ca8f-3076-b945cd0c84b7@linaro.org>
Date: Tue, 23 Aug 2022 14:48:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] target/arm: Fix v8 AArch32 RAZ ID regs; implement
 FEAT_ETS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 91vnis1aNjEh

On 8/19/22 04:00, Peter Maydell wrote:
> The main aim of this patchset is to implement FEAT_ETS.
> FEAT_ETS provides tighter guarantees on some memory orderings
> involving translation table walks that permit guest code to
> skip the context-synchronization event they would otherwise
> need to do after a TLB maintenance operation. QEMU already
> provides the tighter guarantees this feature requires, so
> all we need to do is advertise it in the ID registers...
> 
> ...except that it turns out that for AArch32 this is done
> in ID_MMFR5, which is a new-in-v8.6 register that we don't
> implement yet. So we need to provide it. And while I was
> doing that I noticed that we accidentally forgot to
> implement a big chunk of the "reserved for future ID
> registers, must RAZ" cp15 space for v8 AArch32. So the
> big bit of the patchset is sorting that out :-)

Thanks, queued to target-arm.next.


r~
