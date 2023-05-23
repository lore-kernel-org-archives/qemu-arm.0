Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2070972ejb;
        Tue, 23 May 2023 11:29:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FX2YmdA2YZlg38IMnqFDoMXyTgwQE5KAuGAAy7k1oD3FAEftLLL28Y12azjZsnoknN00w
X-Received: by 2002:ac8:5b8e:0:b0:3f6:aa29:b617 with SMTP id a14-20020ac85b8e000000b003f6aa29b617mr13586036qta.15.1684866543555;
        Tue, 23 May 2023 11:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684866543; cv=none;
        d=google.com; s=arc-20160816;
        b=BTzpctmicCAe9Qc6kxkDJEER8IKxSM6pInMC8dcnnf0WqybyJ7MGR6eJ2ONExEedsE
         Wz7AnxbsLgZjxxtrBKZm96IyTOq7rUoBZqEmImniAPDDLFmJ96NlzkXSgTz0dSFQVZkL
         ghqxdAVx4TZrrXApBinEi2MKUE5MgcDViXqaYSebYEX89so7eORGVSZ1FNEUlmNQ0+ZF
         TwI4JitvQS6oY+H+WshqPxAr/6iTxtwJLeI5xnNB/LOOoXElfmhFCCu72drVksr44gm0
         KtSMtthcbQOl8rCSUKj9IxBHJhaJ4ok52DXPbjfOfCrEvdjRDVMQ1FUJWfSmfmMcrA1w
         gRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cH+ADVJ0HXS1iofeNk+DmtBk2pqSDzBL0jxbhBzwjVU=;
        b=ZkTtLKAvsdt8U13dZroPUGizqXFWUs7S4wokRgXebJf7Ubf2Nj4KIg4ilErfPWMTIu
         ZDL92W4qgg36OILHszoznUCGWsNgli1aRfypSgTVcRNuTPkNpf5IfpeVVsKqZbi7Tj4S
         LGjvbDLKj6Z26k6pZj30JeCPRiqxt1+3MijURsX6BjlGHKsn3ZA+mpYtWtjsheCX5E5a
         htRxklmtBBrtZb/B+ooL53pjHCc3U0ihPBil6mrp53p0Py87OzDkEffSjfCWg2ymPovV
         tNnaco3KzCB+2FFYcLMgVijvfmxcIEPkd7vlBJfJUGM7Ef7uoshWR9uKnLiqAWn7iV7y
         gfMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aMpShUNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020ac87f91000000b003f5ea6474f1si5703514qtj.436.2023.05.23.11.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aMpShUNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1WkY-0008Ru-Lo; Tue, 23 May 2023 14:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1WkX-0008RO-K5
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1WkV-0004Nv-Fj
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684866522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cH+ADVJ0HXS1iofeNk+DmtBk2pqSDzBL0jxbhBzwjVU=;
 b=aMpShUNOBlJ0y+Ks2Sd58KoF66iCqwsUDLzY1zhlK4IxqkELv662cjZ9ueKhtlK5tvzYTv
 Z9FgwNPOYgBTajoPFfqp/aA9sUwSZzHS/CdQY8yaCTKPi0T4IhhE1GbPH8CCF787YF7bd6
 3eZqRokxj+HIrWXKydvzSIvUQs65HJ0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-k9bhToGcPo6m8KZWNIWDBw-1; Tue, 23 May 2023 14:28:41 -0400
X-MC-Unique: k9bhToGcPo6m8KZWNIWDBw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30a88ed463eso1270026f8f.0
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 11:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684866520; x=1687458520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cH+ADVJ0HXS1iofeNk+DmtBk2pqSDzBL0jxbhBzwjVU=;
 b=ahoZ5sHyJAFQYV5/lWy/OgfMObvOcym5QCB3dxd4cqoT8nPQsth2RT0PIQ616gHikH
 DAVN6mBxRRCTwSr/nvJgXRTs0rGhO33+Ziey0Y3c4X4oFs4L/uaedMMZpvD9nuXnJeO7
 XsO92jIEKBBiCdQd5L3FNVMNMLuJ2A6KCH/eOU4BJjLsAn6q+pEY59sgougW6EI25Y1S
 8yQYp6oYe7QSQKO4CXm/S4tcMm4+nGrIJJ2NB1KD3VBjsAT7VVknWd4Zv/ZgnayvQ3Sf
 g/v1BTEEKLb6H7aMZGsPjfUtCgXojSOvzxvAz/2R7hf1BsKbUov7rCthV2pFePZN/8Pt
 6ZLg==
X-Gm-Message-State: AC+VfDz0MoxJaIiVhWkva61ntvGW/E/lnGNa7EWQOreNXO2w6BLwshCK
 9bl3MRMZvyTU0ZNwdDHRxn9AgOAycF+vEsYyYqR2t4xnM74K/qsb190oLbB+e+YIB76QyKxwrih
 xQe6PedQ0ioou
X-Received: by 2002:a5d:6144:0:b0:307:9d2a:fd35 with SMTP id
 y4-20020a5d6144000000b003079d2afd35mr11464761wrt.53.1684866520289; 
 Tue, 23 May 2023 11:28:40 -0700 (PDT)
X-Received: by 2002:a5d:6144:0:b0:307:9d2a:fd35 with SMTP id
 y4-20020a5d6144000000b003079d2afd35mr11464752wrt.53.1684866519970; 
 Tue, 23 May 2023 11:28:39 -0700 (PDT)
Received: from [192.168.8.105] (tmo-117-143.customers.d1-online.com.
 [80.187.117.143]) by smtp.gmail.com with ESMTPSA id
 c5-20020adfe705000000b002c71b4d476asm12009036wrm.106.2023.05.23.11.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 11:28:39 -0700 (PDT)
Message-ID: <30ec2bec-a7f1-f9a6-bb17-661de19b2aaf@redhat.com>
Date: Tue, 23 May 2023 20:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] arm/Kconfig: Make TCG dependence explicit
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230523180525.29994-1-farosas@suse.de>
 <20230523180525.29994-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230523180525.29994-4-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: Ul8YaRjbVlQS

On 23/05/2023 20.05, Fabiano Rosas wrote:
> Replace the 'default y if TCG' pattern with 'default y; depends on
> TCG'.
> 
> That makes explict that there is a dependence on TCG and enabling
> these CONFIGs via .mak files without TCG present will fail earlier.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/arm/Kconfig | 123 ++++++++++++++++++++++++++++++++-----------------
>   1 file changed, 82 insertions(+), 41 deletions(-)


Reviewed-by: Thomas Huth <thuth@redhat.com>

