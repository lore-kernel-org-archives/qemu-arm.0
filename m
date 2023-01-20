Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp936240ejc;
        Fri, 20 Jan 2023 01:04:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3zkduLGDIYgpvcPQ4vsdgJq2j+tgJs5qX4J9hj9eFha3xgkm23VwOyOjDfR3HUnqXOOjL
X-Received: by 2002:a05:6214:390a:b0:532:3465:cde4 with SMTP id nh10-20020a056214390a00b005323465cde4mr21426552qvb.41.1674205441585;
        Fri, 20 Jan 2023 01:04:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674205441; cv=none;
        d=google.com; s=arc-20160816;
        b=xot2U7cUugB3fz6Hz0D8NahqAtSzcLy6MEckXTj+Neh+CSwAlchbWfHa2nS4rP7L5J
         RhAKIZbzXq6AxFDAjF0hH2axME+1urMNITfiePcPOfcSk7QRWJVdbNTPL5LvY3J+94w6
         t6kVKeS4D6K/NkUmoLfpWm9B1SBdvfiQIqDEIIFCe8TXig92RvRbWiYrk6PQQFt0/uw1
         Mpm+KSSrsZLpo1lXcmcGLzD3ci5qFDocJ17/1G1Ktl396DTLFzS9s/FVa23EbIuuIejd
         f0QcM5DPzNz9KZFA5xw1X13UO5UBJAlPwQlxZU+3K8kmPNT2PJE5jKkIZACtUeNpxA3l
         E7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=M669Ra0kWWc5NR7HmCHSAjJ6OFOE8e7akObsZ2e0lPE=;
        b=s10RD3YuCTM/J4dh6TQ9AA3mLQ0I003dNRuKMY2McwM1YA4jmkzhtZtOcSo2U2UxYt
         G4+nk/RwSlfu6qv6JL3Ql8gHS4DND9cf+MGu+B9QSErjmRV1lM9wUf6blzALOcku7fXc
         RHmyxW2t7b7NyR/UKSavf8L15bm6JLRHzgrq5UDaiNZZvKXF+1dwM0C3gEpgQf4p70vs
         ucHdiU92AGPJ7rVd7o02BDyLyR+qik879pyz1jmHR/uUO2BvRf8e6pRVoudTk+PMOrm/
         /CO74qjVW8lckBelOP05nFwwTPRxIPfVJ+30yKOvXp9MsPb+/zbFlBtISHn/HhV5VGbx
         T0gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnFIy9dU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020a0562140ac800b004ad365ed00esi24869225qvi.577.2023.01.20.01.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 01:04:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnFIy9dU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pInJ2-0008Au-7g; Fri, 20 Jan 2023 04:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInIC-0007w6-Ka
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 04:02:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInIB-0004MT-9J
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 04:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674205354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M669Ra0kWWc5NR7HmCHSAjJ6OFOE8e7akObsZ2e0lPE=;
 b=GnFIy9dUaVrd2z5V6lbGsB+cyksFBJLGLZ50VzcAyj7YlH8XMGUBX/yUFkF/x2b9DkTLSL
 UaruzVcdnLmUTwpzXQSgYQS6uy8CFv46n5RGY3r+iyCIXH8AXuLIbc4yiecvMl/wmVMTvG
 eWlkVPmujWOWNxVfcjS9SCWm4ZVq6Ag=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-Kdcsay3CMy6Hig8q90_bgA-1; Fri, 20 Jan 2023 04:02:33 -0500
X-MC-Unique: Kdcsay3CMy6Hig8q90_bgA-1
Received: by mail-oo1-f70.google.com with SMTP id
 a10-20020a4a9b0a000000b004e737f7a017so1108554ook.0
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 01:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M669Ra0kWWc5NR7HmCHSAjJ6OFOE8e7akObsZ2e0lPE=;
 b=zYDadyO1MIdpVkbC8PxkNWGmsI+tpAYCiegqXhwJ7kZRVxcxMebXIlUPFOSWefYE4p
 27INYnq3xed2vzV0j96u8Iib0m+HfEwKiz4JB2n+JGxK1UGPkcWDQ7+tlM/3WmB2uzAp
 eeCs31l7hwfXatn/jtdUsRfDHierPIo4n/zYmOcNbNEDHIikSZf9mTXYa7ngXVWIVHtv
 UBAqhBVgrvzZ0V4F0ckdgu3xuEIXjgmiFaSYldPVOwLcrzSffsiSBzH0kJ0K8bM42ScO
 Mf2nJxhI+umZN3um5sEF5oMQ5GRQy67qlDmnB/IZS3qPZ/e8yJ1mvcKTxtWCM2tYtc79
 uOSQ==
X-Gm-Message-State: AFqh2krH/8ICz7qi+4O0igUlSCfzxOc2JXAPZWEEv05WO8OH3pTSHd1S
 OStOxfxsaVF5wuoOx3u24+1hVnYtbhvDCa/wsiXUmqjDdzrd9BdZSZrcf9kpvMX9Z4u2AxDHjWs
 euF8RMLes4lYq
X-Received: by 2002:a05:6870:4c83:b0:150:14a3:6556 with SMTP id
 pi3-20020a0568704c8300b0015014a36556mr7595164oab.51.1674205352682; 
 Fri, 20 Jan 2023 01:02:32 -0800 (PST)
X-Received: by 2002:a05:6870:4c83:b0:150:14a3:6556 with SMTP id
 pi3-20020a0568704c8300b0015014a36556mr7595153oab.51.1674205352489; 
 Fri, 20 Jan 2023 01:02:32 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 br31-20020a05620a461f00b00706c1fc62desm2928461qkb.112.2023.01.20.01.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 01:02:31 -0800 (PST)
Message-ID: <cd802b6b-1fe7-2640-1ae0-0227c3e8e335@redhat.com>
Date: Fri, 20 Jan 2023 10:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119145838.41835-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Ns0EK5gFj25W

On 19/01/2023 15.58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

Missing explanation in the commit description. What's the benefit of doing this?

  Thomas

