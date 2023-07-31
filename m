Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp1991201ejb;
        Mon, 31 Jul 2023 00:15:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEZhhP4B6aq3nVR18r8WXb97oxz5aKZDLAkPZc+6oJ3e3f1r1HfzfV1sGdjBGALT1aQuqTp
X-Received: by 2002:ac8:5c4f:0:b0:403:b8b6:4f50 with SMTP id j15-20020ac85c4f000000b00403b8b64f50mr12722251qtj.37.1690787742870;
        Mon, 31 Jul 2023 00:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690787742; cv=none;
        d=google.com; s=arc-20160816;
        b=dDjlGg6nSRrdGZ51eYUcFGKLDQmbCoAN+I4s7ytSFvbnRoNtJ/meKVJj0XyCnD/6kO
         RwcuH0PAA3wE0ttQhjlD73oPS+o7+gDf09YA9Bt/BRUCGOqGloLtjcQbQILtKGkaKT8i
         lTMqSy3eA0B3wuqLHQb+R28cC7zNNFG+BreFZjohNZHBKXeRzcZlbyhbGXOkQ5nimYHH
         7FiPrt0IiHfWL9MkNdBEtGPiGm/VgQmKE0DyxyPzQhHdTR4X3QNlQiKRCwPh1pN26lrK
         YUgYnsU9j8XLnAxE5oKA9SnD+xylq2mDz87DvLThb+rh8HU33CneHfITKu1+FjHcoRD1
         eTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uBfpOagrTrr5J584ZsKzPTICJSqpSEt1rQjOESpOFDg=;
        fh=bhKRZPTQegM9ngYzHPCNUPwAe0pzdMQzbQuG7bFjfgA=;
        b=quKh9gAKdHsoK8CTWT9bT9H4JH4PLRfCIqNo2wlSzRAn3juPGRJvrStGtXhGeFbaeb
         EkXQ4sv9XPFFchFjMnMnldazIvQvXjuY6uVGlyfT7kVtbM+/7pgxvNy5F/ns9D6wllNO
         lFjQDdU9H93Hqu4XvlS3B8a5Q5UImsiYfThcfeeiOJ4/N3BpWQjaxpaobe0HvYs5fgIF
         56QwzGYJVAeYmekzNaG3LF3qRy50+GqSf6Vr4/wyn6YtLDLQ6WQ+mf7iWR9ZPg4ZB66N
         Z/7EIj+2XMhY95X+KFrbKDxmDlJZoAz1XUS6p/6woLIKLy3Uw2uC1BJZrdH/5opOb4f3
         lnBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VW576xy4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020ac85ad0000000b003f38d565188si5325613qtd.654.2023.07.31.00.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 00:15:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VW576xy4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQN7w-0004HY-Um; Mon, 31 Jul 2023 03:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQN7v-0004Gw-S6
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQN7u-0005dm-He
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690787732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBfpOagrTrr5J584ZsKzPTICJSqpSEt1rQjOESpOFDg=;
 b=VW576xy4OGzLeD9o4/jCVlsNUoHYclVlYUHd5HmwJb/KF3e2JXTCYb+SlEYYGHbnRKoLNJ
 O+NR8LC58pmJqV1RPU+4BGDrO0iuTzqJ7CLyYxsDEYmkz622SCHcK578d2Pfwb9Ts3tDOw
 ufLFm8CGMNFV5hUzdFRwvKshCYOv8uY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-7Ezl-tPVOn-CroMChYPh5w-1; Mon, 31 Jul 2023 03:15:30 -0400
X-MC-Unique: 7Ezl-tPVOn-CroMChYPh5w-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2684179bdddso2583080a91.0
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 00:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690787730; x=1691392530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBfpOagrTrr5J584ZsKzPTICJSqpSEt1rQjOESpOFDg=;
 b=BJJePhcBj4NKsdsC1oTCG2/+YZAzT5oPU9BGY42Lr5Rf7a/eiq5jzpBxv3g2gmPqQn
 Y41M7bue95T2Hq2ymVSX85qreIdz/x0LR3hAYcDdYZtaQ8AdfoGs3FY2nsi6KnEQcJQu
 T1ro+820w8aaepvnClTYUXz7WBgm2rbfTZUULa8ahl+YLgWQye4Q+OgeSRZcfS/Ixb75
 iO6RxGkXRjWWuxwaVJic7bADxkBv5+3hyefNBHvZ0KWy5RoHzUgct3CC2pYDDMZpBjKH
 QJbubLncwxYS1h9wYPNM3qcZWEdIl+rfb+drVLY8V/avgziyfeiJAfIZAKs7WI4c7nAE
 QgVQ==
X-Gm-Message-State: ABy/qLY5yDqzPTMLbB1MpeuT+FJwSSzVK5RiSFk0vARKFkPlxu/1eNim
 fb91kpuMn8eMMC1O/P2pz+sm45ZrUd0XPgV6ZRB/ieewmWl/EtbdOfmnOnhF+f+stkRSXOHXjkf
 BcqF6I/A5on2H
X-Received: by 2002:a17:90a:fd0d:b0:267:f9c4:c0a8 with SMTP id
 cv13-20020a17090afd0d00b00267f9c4c0a8mr7567838pjb.4.1690787729929; 
 Mon, 31 Jul 2023 00:15:29 -0700 (PDT)
X-Received: by 2002:a17:90a:fd0d:b0:267:f9c4:c0a8 with SMTP id
 cv13-20020a17090afd0d00b00267f9c4c0a8mr7567830pjb.4.1690787729639; 
 Mon, 31 Jul 2023 00:15:29 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 29-20020a17090a005d00b002612150d958sm7895363pjb.16.2023.07.31.00.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 00:15:29 -0700 (PDT)
Message-ID: <0b23a5f5-0539-47f5-2cd9-e79c120e1bb8@redhat.com>
Date: Mon, 31 Jul 2023 17:15:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH for-8.2 2/2] arm/kvm: convert to kvm_get_one_reg
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20230718111404.23479-1-cohuck@redhat.com>
 <20230718111404.23479-3-cohuck@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230718111404.23479-3-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: S2i8OmjIqLFp


On 7/18/23 21:14, Cornelia Huck wrote:
> We can neaten the code by switching the callers that work on a
> CPUstate to the kvm_get_one_reg function.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/kvm.c   | 15 +++---------
>   target/arm/kvm64.c | 57 ++++++++++++----------------------------------
>   2 files changed, 18 insertions(+), 54 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin

