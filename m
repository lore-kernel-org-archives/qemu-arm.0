Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4173531ejc;
        Wed, 30 Aug 2023 00:06:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBvHFYrSBLIaJ9zPd2Ig6VH/bReYqaFaS87HfJ517oD5W1yHrcSvgW9Dh0/TPDiIrR2Kdj
X-Received: by 2002:a05:620a:d87:b0:76e:4df3:1dcd with SMTP id q7-20020a05620a0d8700b0076e4df31dcdmr1715090qkl.11.1693379185385;
        Wed, 30 Aug 2023 00:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693379185; cv=none;
        d=google.com; s=arc-20160816;
        b=MY3EfIy4akIpMGqx9AS/zItgZox2BTRFzG7Evqu/elCtTDj60PwUhPzEkUXoZQbWN8
         vqg4cxhczEeEAD7abp9baLT6wTfYmrbASQ2Wh0ebgC7ymPTSC14ALkByM6WEAprcPOBW
         /zgbeiIytgM5xT78XHwDUpwhSuPO+YyQbQD9ZgbqzuUWEAepXMPw/I0fFJ0dtPEq3Z+X
         faohrXMC/nFj7WY+EQl1Qvij4OIk/iymsVaDoBZXJZHGXpHCbkxkkbg88Xq59AyjKWON
         1vDbVkQrjS5uHVaQpjSGmZdhQ/wDCwlcv8yedDGiX9yLgHUAcWDdlmLunD+Xn265VtJQ
         3bdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7SQCfDxJvzhIEERVnIQQoRPg9KzwyryGlasM0mGfWMg=;
        fh=1opim4qnXd3deOKNV23k9vPdq8vvnpjhy2kadx1x/6c=;
        b=slv6xRPAnHrDuYJsniUzMh94Ga2/VzHrwMJtELuNJDkcLtnTOAeT0sAGzn/Dwn8rrm
         4QloX9o9VXv+w0NcNHaC1SxOpue8mYn9r5QOZBXVDR1wQGPDqpbvv+nNdTgPqjnHvrH6
         yiyhlVSu6clFWM+8vtvZERHkWpxPhwxSTOSghrCJE5uL3YY09IMA+r9u5BvJr/yuk/oU
         F8qWFgX01npJXJfQx2BOETEYDhbnkNraWId+gmHwS17NrOE+zxfKlmXLjC8vtHrnnc+p
         /97uixNbBaZVXlhuQ1tD1QE93wqByd1ljKHla0rcTjjQNBmfBfAH4PB4WMuPBlImy56o
         bSLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dKP4nAjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020a05620a40d100b0076d512665d7si5010582qko.627.2023.08.30.00.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Aug 2023 00:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dKP4nAjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbFHB-0000C4-3p; Wed, 30 Aug 2023 03:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qbFH7-0000Bn-EN
 for qemu-arm@nongnu.org; Wed, 30 Aug 2023 03:06:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qbFH5-0004AG-DG
 for qemu-arm@nongnu.org; Wed, 30 Aug 2023 03:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693379157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SQCfDxJvzhIEERVnIQQoRPg9KzwyryGlasM0mGfWMg=;
 b=dKP4nAjByjblptLk0hT453VnPjUgRIfpyvE817SXPsfXV7NfFUX8XbiZAaIl6444VbZ73L
 uvwdFSbZebwG2jxMk7RSuNcxvzgjWtkODEMlhkV6BG50/cTvLn8a3i39pJbvRgtIEM83QM
 Kb5IgCZusUuns3n+bi53ftlZYdO6z/g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-5sHCmxfdO0-JvKMTi40JZg-1; Wed, 30 Aug 2023 03:05:54 -0400
X-MC-Unique: 5sHCmxfdO0-JvKMTi40JZg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31c5adb698aso3320118f8f.2
 for <qemu-arm@nongnu.org>; Wed, 30 Aug 2023 00:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693379153; x=1693983953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7SQCfDxJvzhIEERVnIQQoRPg9KzwyryGlasM0mGfWMg=;
 b=ZPssa00c882ObaT2RNuz87AR6udKhfBuIdz9DZbZxFZUdcNmmUOeYL0lWPJ5cM1Nbh
 19fKJHGtGJfJj6Neupr7SLfTqwkqEAgeFAab2QkMXc5PXW+jITzOHhHnJuL3jzLreCc9
 fp9ptmFOL0+c/QZpsUSIH7N4hkuymsYBaju8jQoryzX2ZlfVq8+vbf9m+6AztsNxmtyB
 5rQLwYJeJCy6689uyKkGwx07Ok1SVhdxj6zFVPlefqGXrxHvFSqEuehqJBolHmaKCbRU
 7siUhX1fo4Wna2+X4Mcn8VRFXkQJ5w6Ls9C2H6EPZD1XQnnP9HL06PFftXC16lxrx8wh
 jfQw==
X-Gm-Message-State: AOJu0YzUDb6fbBom75kWjjm6gxdvBejnFQHrnX49JU7GCB3gFKHWQa/8
 aMktaUZnYQakHoS0SVZMLn5JfAm1X44xBgAeBo0Fs2L4CHDcvEOh7SNCxp5I9PFLBEnjnTlIpie
 rF67BW0I5HDBb
X-Received: by 2002:adf:f1c8:0:b0:319:6997:942e with SMTP id
 z8-20020adff1c8000000b003196997942emr954123wro.8.1693379153070; 
 Wed, 30 Aug 2023 00:05:53 -0700 (PDT)
X-Received: by 2002:adf:f1c8:0:b0:319:6997:942e with SMTP id
 z8-20020adff1c8000000b003196997942emr954097wro.8.1693379152729; 
 Wed, 30 Aug 2023 00:05:52 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-145.web.vodafone.de.
 [109.43.179.145]) by smtp.gmail.com with ESMTPSA id
 j2-20020adfb302000000b0031ddf6cc89csm610480wrd.98.2023.08.30.00.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 00:05:52 -0700 (PDT)
Message-ID: <0cdc9d0c-b146-e55f-cd2d-81e6827e64e4@redhat.com>
Date: Wed, 30 Aug 2023 09:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 8/8] hw/fsi: Documentation and testing
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20230830022638.4183766-1-ninad@linux.ibm.com>
 <20230830022638.4183766-9-ninad@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230830022638.4183766-9-ninad@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.242, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: SYEwI9zjyzKy

On 30/08/2023 04.26, Ninad Palsule wrote:
> Added FSI document
> Added basic qtests for FSI model.
> Added MAINITAINER for FSI
> Replaced some qemu logs to traces.

Sorry, that's not how we rework patch series in the QEMU development 
process. Please squash the log traces changes into the patches that 
introduced the original code, and please put the MAINTAINERS update, 
documentation and qtests into separate patches.

  Thanks,
   Thomas


