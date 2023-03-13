Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp125ejb;
        Mon, 13 Mar 2023 00:40:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set/HWW/ZbJ8yn1TQTAQqoOGLUS/vjYgeu+N05qd6hMzIzFGOYNQ+6Zo6N1ntVCWqn0ZwD3IM
X-Received: by 2002:a05:622a:58d:b0:3b8:118d:83d9 with SMTP id c13-20020a05622a058d00b003b8118d83d9mr54103938qtb.4.1678693205811;
        Mon, 13 Mar 2023 00:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678693205; cv=none;
        d=google.com; s=arc-20160816;
        b=PK4SSz9B8K4+4aoILtHoBSntT2wTzPJ5y5c9a6sfvYzPF7c2zmXG+6zwKnvxWblwm/
         PD6uHA+FW5rO8EOlTuPljHgrZAt3pTMY4KHSwVEtYq3E4jLJ6PBSSB0+D+kvBHdQ+JEd
         n9CE39/lBfOO/n0w58pFJepFdCXZINn29BbR65DR0NULQcX7fA6NdJTfOu8u7Dw9jEgV
         3XBni7NZculg/SzfjMjRjIK5/OSaVyvpKKm36S08XWQPAC3y6DRii1RdDuRypeygjeQK
         Vwt1UOk5dQPP9QUCAwjyJ5F3RpepxwiiOOPZS/Td9PrRFtG6+bdQw+1Zsotq5mTRTfBb
         /rKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KfJQT6wt9BLV5t3CsqEhoeQoCIZ6o4H8JXLrnrIg4s0=;
        b=Az0VaeJq9pbLFn+LEwmkbEJDV5H+kZ/jzsmaRSxdylM0WQrHoRZRPihnwVv7hkriuR
         i5HLOv/wAOTVy66xAAZOd7x8XBKN/Ji2Brtq+jLFRZYFKNON+PFd2s109SOP1Rvth0Gh
         5jwx05KlwJqavHUdp8QrZf4zIQ7wVF+ge6VAlHjeZGUJ+45YJvYQ5ojINIzOCOR6QJT2
         RV2QZbtIobPlskcR6yFqKw6Ass/Rc5Nh9FLNHCLwCcGs+m9ocEszcx8f+JJy1O/AXON+
         M5dWoSZlsHkytMijZHITZeLH36/zL9dy4b+8AeyRHt1OQg4IOQzehNC2ob2oavVllFk3
         /ubA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=evAPk5AD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2-20020a05622a188200b003b869eef347si4808368qtc.91.2023.03.13.00.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Mar 2023 00:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=evAPk5AD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pbcmI-0001yR-OD; Mon, 13 Mar 2023 03:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbcmE-0001xy-BH
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 03:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbcmC-0000YE-Mf
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 03:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678693163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfJQT6wt9BLV5t3CsqEhoeQoCIZ6o4H8JXLrnrIg4s0=;
 b=evAPk5ADDuQQpY8JmWh16zKovnvYaNsbpOsJob3SylOH1n+sc1Hk/ZPqBG2CkqdVqfTc3w
 uQOIyV7ZHyX6XEUETSsVQhWFR8FPeZs2aCcGu4moOfPrxJBO+nY3mFuaZ6gb1UN65I6NqL
 wVUgI+YVojBP/mdVde+fxvytFO2Bi2w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-95R3R4MCM3Gg2C0P2AcP8w-1; Mon, 13 Mar 2023 03:39:22 -0400
X-MC-Unique: 95R3R4MCM3Gg2C0P2AcP8w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n38-20020a05600c3ba600b003ed29a0b729so112372wms.9
 for <qemu-arm@nongnu.org>; Mon, 13 Mar 2023 00:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678693161;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KfJQT6wt9BLV5t3CsqEhoeQoCIZ6o4H8JXLrnrIg4s0=;
 b=LrMevLInfDEvYXpjgye2jwhcM+FyrMlXPIHCaKy6M3UYzm9ZsxJJJk8SH6nYABeLaQ
 Vc6QHIPD8d46qW5NytyorgPXcWMJka8rsLoVa8zvY7pUtoGbMyhfcjZRWAwlS+pDv386
 7pAstPz3q/MOSvTYgMhk66+D2UKy8sV73J+R6OwOWs9l/kMn5Rll+gtziLPbbmA1Z1Ft
 fC6PQGiSKlef0fE/YMkUNSgGyb1TcbX0QVBSlDdOS3GNlGRUrrGZv/wSa2Pro3xLEWxq
 ahUa1PwpvlTezVDn2pRuPO3IBWNuVD7y5GFg4NR3cgHTDV7FKIiVBozGNeUVSVE2Q5n1
 /Q1g==
X-Gm-Message-State: AO0yUKVtNu5V9v4lcqSUog+6DGVbBEWBpvdPVRXIz2ayEjp06MvLioim
 hWU6R8csWahnXesGFHPj6CpvX2YZLRt+sXcirZ6KR66EDaRta34gcgz+8maMVrlgAS0BTKWIUML
 N/MAL9PSCwwMq
X-Received: by 2002:a05:600c:4f02:b0:3eb:39c3:8844 with SMTP id
 l2-20020a05600c4f0200b003eb39c38844mr10324492wmq.12.1678693161060; 
 Mon, 13 Mar 2023 00:39:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4f02:b0:3eb:39c3:8844 with SMTP id
 l2-20020a05600c4f0200b003eb39c38844mr10324468wmq.12.1678693160775; 
 Mon, 13 Mar 2023 00:39:20 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c2cce00b003df7b40f99fsm8832349wmc.11.2023.03.13.00.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 00:39:20 -0700 (PDT)
Message-ID: <66323001-8ed0-2e55-50cd-dc090bdf85d4@redhat.com>
Date: Mon, 13 Mar 2023 08:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] cpu, qapi, target/arm, i386, s390x: Refactor
 query-cpu-model-expansion
To: Dinah Baum <dinahbaum123@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230312210624.2326264-1-dinahbaum123@gmail.com>
 <20230312210624.2326264-2-dinahbaum123@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230312210624.2326264-2-dinahbaum123@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 9hY8a+6zU4x9

On 12/03/2023 22.06, Dinah Baum wrote:
> This patch enables 'query-cpu-model-expansion' on all
> architectures. Only architectures that implement
> the command will return results, others will return an
> error message as before.
> 
> This patch lays the groundwork for parsing a
> -cpu cpu,help option as specified in
> https://gitlab.com/qemu-project/qemu/-/issues/1480
> 
> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
> ---
>   MAINTAINERS                      |   1 +
>   cpu.c                            |  20 +++++
>   include/exec/cpu-common.h        |   8 ++
>   qapi/machine-target-common.json  | 129 +++++++++++++++++++++++++++++++
>   qapi/machine-target.json         | 129 +------------------------------

Could you please elaborate in the patch description, why you apparently had 
to move lots of code from one file to another? Why is that necessary?

  Thomas

