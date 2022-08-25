Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp184961ejh;
        Thu, 25 Aug 2022 05:33:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7VzRo9BilAxqYGLJkboQb4L9I/Ovj2RA4CFa9xCIXGlvpdOYWX00I5tOZ+339wwbPOdQo6
X-Received: by 2002:a05:622a:303:b0:343:6eb2:31fe with SMTP id q3-20020a05622a030300b003436eb231femr3314734qtw.439.1661430821565;
        Thu, 25 Aug 2022 05:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661430821; cv=none;
        d=google.com; s=arc-20160816;
        b=J/g3nLLN0TcYHmIb7bAsVqR2KvKIh5e27Eg4qZROVKDVTYljC8WSj26mQ35W9hAeq9
         QoCKG0xA/VGEqArn4auyuXTCFDZUqrz0eEKmKbqtxRBqCNLKgOkXoJ9LIQu3XkGCpiTF
         iCZpmiux0tT8ATsuw4jjaG1NtPA20LHhTtcqmVleTJ1gizK0AdBBQHJUHcDdS9y+GBZ+
         CuY5vripitxL0M+sKh8EVkagvzqSkgoq8xaTLQC5r5gH2U0/2hGcLiGT+/UemxjDYx4n
         PDHwXWJNR0wa/fypv3sNgrSAnMqDSzkPnH5PfXXMLMPrBEUka7TCPtMB6T6mhSyF0aqv
         D5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8oeZDoKCwjgjhl9XzMI9S7TuPQlWS06JYNQwc+Bwjsg=;
        b=NEyog3QA6R/4NN3GD2P8oaDaBRv/547BXt7RNXP+dPePm6jDcy9at4U2spX++NYLYN
         AiVFhp1e2FmNBSPBntLYI6hkXPgUDWHL3/bj8mOYv5gXXFO747ErmjTP6386wwn5Kw7x
         xxtcYL9YbshJ+Zg+F3wlAyhTnqYgG4mndjBNQiE6ODEwgPH5LibWpXmzStGdb/xVQMFm
         cdkImw49jtCG+IZXG0CokutjT6qp9Wj0uaXblibE2YgcKUbuh96O45MVHX3MTsNHlW+c
         F3bDkRiKUB6oF8qwW7H5X7N4Wb074QDi/0uihVZjuN5ck9ryHk67/8Ae49mTEUT9RPLe
         pSwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MP5+EhgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a05620a40c900b006b9adfbdf28si7812158qko.592.2022.08.25.05.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 05:33:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MP5+EhgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oRC3J-00080f-0X
	for alex.bennee@linaro.org; Thu, 25 Aug 2022 08:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRC27-0007t3-Ly
 for qemu-arm@nongnu.org; Thu, 25 Aug 2022 08:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRC24-0006w1-VK
 for qemu-arm@nongnu.org; Thu, 25 Aug 2022 08:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661430742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oeZDoKCwjgjhl9XzMI9S7TuPQlWS06JYNQwc+Bwjsg=;
 b=MP5+EhgF05tDsfn5JIs00+BxHTgnPWCXCcyX9ZjQZJxrc8K6gezhD4VJLR2MQ49q15qv2U
 hbYEdB9jMilBuFfqTC9kUsOQo0lxwSeT8La86D/1eFe0d7yJHQvIlrSE0YuuMknjPq9H3U
 thCdbTJV3//S6VPOU/HzI0ztIfkQ9II=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-G0iV19ZGNYqeetS9ySnQ3Q-1; Thu, 25 Aug 2022 08:32:21 -0400
X-MC-Unique: G0iV19ZGNYqeetS9ySnQ3Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so2417542wma.1
 for <qemu-arm@nongnu.org>; Thu, 25 Aug 2022 05:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8oeZDoKCwjgjhl9XzMI9S7TuPQlWS06JYNQwc+Bwjsg=;
 b=JZ6NNXwFHnSdlejv+7LLv7RjBzRuGPjrrV3Dpoqztgj0XEcBvnHX4D2wR8fOVvDFSe
 jqxbfH2FNL9BbvNiASwOnZqNqKSHsNDxtLuhiLaKnQRCNl/QAAzqIMUp1oMZq0bfBMCf
 ZBewdnk44SByf8Hq34/JDpsx/boU1ZrfLpjwv6oQSIwFIewzPMmczwKIGCO+Orto3GRQ
 f0TNZ5ZANq8HJa+NkkWZfI04r6+0wX9z6OOIYWNFxxViOm7Rs627XwALM//Wk/sdC5Uz
 IXmNC5a7RvzRf18jQewZKBf4/p1J/7jLUx8Mu581lKQs1YJgWrRmFjKcP6wbcN1UB1KB
 sxFg==
X-Gm-Message-State: ACgBeo2VtTM0S2QjagIXoYRo+XAGSJM3VVd+9G0ddd9tDHI2JPANK84L
 WJV0/yu9zwoizHV7EyRByEKhB4Dzo7CaexX7HLNburzlUIOG1/fnN/nfgCG2Q9tWldxs2yQz7fn
 wGtzCn3F8bXj9
X-Received: by 2002:a5d:4571:0:b0:225:6191:779d with SMTP id
 a17-20020a5d4571000000b002256191779dmr2164281wrc.325.1661430740404; 
 Thu, 25 Aug 2022 05:32:20 -0700 (PDT)
X-Received: by 2002:a5d:4571:0:b0:225:6191:779d with SMTP id
 a17-20020a5d4571000000b002256191779dmr2164266wrc.325.1661430740194; 
 Thu, 25 Aug 2022 05:32:20 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 p18-20020adfce12000000b002253f18d87fsm16244342wrn.96.2022.08.25.05.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:32:19 -0700 (PDT)
Message-ID: <3efbdce4-fa39-43fa-8158-a0404338edd4@redhat.com>
Date: Thu, 25 Aug 2022 14:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 43/51] tests/qtest: npcm7xx_emc-test: Skip running
 test_{tx,rx} on win32
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-44-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-44-bmeng.cn@gmail.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: NaQEml9Zk6Jt

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The test cases 'test_{tx,rx}' call socketpair() which does not exist
> on win32. Exclude them.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/npcm7xx_emc-test.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>

