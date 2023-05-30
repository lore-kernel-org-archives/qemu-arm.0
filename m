Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2132108ejb;
        Tue, 30 May 2023 05:19:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XVI6nmmQ3UB6I/yjG+Qe+cOAuEWHsfXlGQjrxqlAISQr6annVdUuQqzYT9BNKlNRWuCCU
X-Received: by 2002:a05:620a:24ca:b0:75b:23a1:40a with SMTP id m10-20020a05620a24ca00b0075b23a1040amr2173991qkn.32.1685449195891;
        Tue, 30 May 2023 05:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449195; cv=none;
        d=google.com; s=arc-20160816;
        b=M0x5Lrrv7bQugopVc6goQxVM1NcKSmx3iAM/FGU4lq4ON31XoemTJmK26ZAAvIm5yi
         pBY6A41nU3SCT+9bWPcbfokYnyLxXHe5cU8KALYZ3XDSmBva1P02wJ1UzIWzGe0egTpC
         iJuYBPCTtDf3HHIByxGcvAqDDBBQSPG6jz84O3AD7vaiiejmuUkPxC9WBHNjzF3/x8Ay
         xAxx7q7p1jTTqN8XOQlIp2j8a6kDHtOpb/u9Dw6IpfILxqbIdgJG9vmUMK1DoqEwRuk3
         H7clyXxzrKusUff40Qc/xREjhrtcpSSpKMQTWyHUCDYBjFCY3MpqaTkHjLl6wyBaz6TC
         ffaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Hte6Z3s2OOCCifRBIc/cUlFXu9Wprm67pz6esrvZtPE=;
        b=OqFRSRnq3dzZA0H2ApW0S4oG6wGX44I7/ynULbeizb3Z5UgLnvFDthpUVtjZNKweEd
         asMsWpZ7I9Du93gaWuqXS5UAND2ImBByhkRgsJgU0GdZhVOctU3+65WTcJgenFNLVet4
         9eSAFLKgcGVDxjdAng1PRJkycWT2AiIxWummsmi//q88qSkbiBJSFJLd5HNlJmoRlGgK
         rWFW8sfRpcThPF7Wo5kOrAN4F6pwQyehx9CWUST+BzwvC1iOF/VP4Q06HjvMWcmAIdqV
         bmSjHx29wo9UiZqEKj6WglrPMaMOUuCaCGjlg1phCxQnWXtOSbpdGNPxTAuwKWuxM0qR
         xbkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfLENSrN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj4-20020a05620a1d8400b0075930f3984dsi6073983qkn.309.2023.05.30.05.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfLENSrN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yKN-00082Z-Oa; Tue, 30 May 2023 08:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yKH-0007lQ-Rt
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:19:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yKF-00073Y-5u
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:19:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f6042d610fso45172255e9.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449181; x=1688041181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hte6Z3s2OOCCifRBIc/cUlFXu9Wprm67pz6esrvZtPE=;
 b=zfLENSrNDBO7gQ6aw8ulZ+e5n9df47DD9XJlv97vSVgt/QI3jkk0QspZ2pZm3vZC1e
 T2zVrBIYz5uLJ+4NFR0HsPTmsJoFxN+cwMUey40VqcTATySTvEbV1X8edg2aCxZ+hjnw
 QNmHZO+CIGUKnjadwTkCaU6WlAfdAslC3hM+GTZAlB7trEYQ2aTr1foO1NXZNqfqNb+Y
 gFOW8ol9w19zA+WM6zg6dYlWtosh1mo2klrgfshA/tCjhEiuePVqWf2zVA1iKRIcZ/QD
 1UfT5vv7c9VBumXP/ilhP4q0cTBZpt7hFqQhNwav2cSPK8iS6+mO/Vx8di2f3F1yvbyH
 8Vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449181; x=1688041181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hte6Z3s2OOCCifRBIc/cUlFXu9Wprm67pz6esrvZtPE=;
 b=SG4FI1DF0vJO6TSLS6GlQ3TcexcdEIsHAs9FMjWmkpGp/anOC2yVVt7440ZnkiX+z2
 WWw4cmY2vmmyrcLy3VB+JczdjQU6uRq+VhRW9kCjV/4fHCIPCgnWEzc2AfkwFgbV0gyo
 pe+fMMowG9v4Z3DjzxxP/Unu98C77XLftZXZMQKtMeIjR1w9/YvONdxH8XjxwTMStv0c
 jcqxVUxsA2kqzvzW90L4/e+CxFZshrA7//GzdDA8epwBmZE7qbTVYNCDCLZIkYx8yoXp
 r7Abw89Z4RdeyVuSSjnO8kJfeIR9vnfbEVoXowvLsBIAeDlbHhJ/63m12zPXiDo8EHd3
 TUaA==
X-Gm-Message-State: AC+VfDyQw4a0hk7MdgtwbC/iixHpqhqSdO+Ts9LrzFAjMJaeQWRMTPJq
 UP9yIAut70rdOEqNa2hWxfwkgg==
X-Received: by 2002:adf:fe0f:0:b0:30a:eda0:71c5 with SMTP id
 n15-20020adffe0f000000b0030aeda071c5mr1425974wrr.16.1685449181788; 
 Tue, 30 May 2023 05:19:41 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a5d5344000000b00307acec258esm3180259wrv.3.2023.05.30.05.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:19:41 -0700 (PDT)
Message-ID: <f8b1a6b2-6b54-85d6-98ed-2015c6e4aaf2@linaro.org>
Date: Tue, 30 May 2023 14:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 03/10] hw/arm/virt: Use memory_devices_init()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-4-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530113838.257755-4-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: /1LLQTFrjxnF

On 30/5/23 13:38, David Hildenbrand wrote:
> Let's use our new helper. We'll add the subregion to system RAM now
> earlier. That shouldn't matter, because the system RAM memory region should
> already be alive at that point.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/arm/virt.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

