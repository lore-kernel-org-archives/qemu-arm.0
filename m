Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A074CAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 07:19:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v22eL-0004F1-2d; Fri, 26 Sep 2025 03:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v22e4-0003X9-CD
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 03:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v22dt-0007QY-Bd
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 03:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758870790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/yX+KmMRxbPatjplaD00Um/Vz/TRqwgjub2EflmjWDY=;
 b=VzAgG16eBjqg68m1hsuVgYHcf2dtUX3eOvgADFB9nvEgEKT96forsYYS0SByEhDQy4a226
 IWyHXjrG+fKNGLg0B1T7Z+puc2C4hpoMd6tTGrroM8eA0GjI9cZfPckAP96iqT7t5a9ZG4
 ze5P4GtCcusFEfm3vcH65iibiYpL8RM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-5MAYB3QVMOeBb67oppfkLw-1; Fri, 26 Sep 2025 03:13:08 -0400
X-MC-Unique: 5MAYB3QVMOeBb67oppfkLw-1
X-Mimecast-MFC-AGG-ID: 5MAYB3QVMOeBb67oppfkLw_1758870787
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3f384f10762so968775f8f.3
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 00:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758870787; x=1759475587;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/yX+KmMRxbPatjplaD00Um/Vz/TRqwgjub2EflmjWDY=;
 b=ZM/69dvXgQ35iDXVotwRUYZqwymD2m/cgBqmuqHwvkKNBD2CGc/vmat0IyS6Kp8BWe
 uzOV7Ifv8um4zUezfEUNS+vnYOigyjeJNgk050mHsYGhAsVpavo8s83lJNLLIOLsOKkn
 lvvI1PYTIUwhU4B58c/X4tcokS3fdBb8Z04CaeJHOSOHbHJ1Nf7QcrTtbOb+CyfdQeCL
 tc3aszlLSPAfHLApxiZVBmPFsF2hD22fC043F4t6qEc0toKY1zbmMXryG9eA7M4uNqU5
 f3ncC4C82M656Vfer3FDk3oGMH8Iw7AXOgyen0JXVMYPKKk0AR5cP+5ZVD/0LXf9qRNJ
 NA1A==
X-Gm-Message-State: AOJu0Yy9F/Q7zOK/th+hl/pQrhMs1BTPpIfMUOnfjp/5PhPxEesHDkBp
 rPlYzZg+lNMugkzrPyfb1BNnY5AT+OrlJYIJJ0DhwGdm0i75d9XVFXDQuPfrOJ0LFCU3f4vByra
 dgaVin5KIXEo8H87k6RnNTjXQQdqlC/mjA7iWqG86vy3xkJjYc7blzA==
X-Gm-Gg: ASbGncuTtXQ5tR0XxKRq6QP+MmfN1qg9oTTBelUxKNM+6QqYgGFKpSoqbNNEyPwNb85
 pRA/FrUAhn1oBpmEwK1ETzzRuJOG5Q8AHleOkPCpF2Mv1U+xbc+k6+1SS7RfNLQvQC7+veOK00k
 e/RirCffpoKQO0qpC8wFP8/aj42gSViogtztdemfRrmWDDLXWWYeB+Sc3G4IjMZ4MjdqdVzWTPk
 Ei5IovBQWi1t0K1UYIxkff6dHTVjvvCUDzH5m61CMrYPbsUFdTYH+CD83o4KIHadnglMeOMPZlx
 H6J63Mi+JbUAFLq1V9g4AjuzixcJw/0234G3QNsnfbmxancH/H2gazNYrxSCSTjci+nqS1+0rcE
 B7bVjFQ==
X-Received: by 2002:a05:6000:2601:b0:400:1bbb:d279 with SMTP id
 ffacd0b85a97d-40e4adc1653mr5841698f8f.39.1758870786617; 
 Fri, 26 Sep 2025 00:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTjLgISIJHPFyyMUco+pZMscoC8TPVZ8hmaQgiQxj38p4gmvoj1f4a+oSJ6YnxzdhTTxfgUQ==
X-Received: by 2002:a05:6000:2601:b0:400:1bbb:d279 with SMTP id
 ffacd0b85a97d-40e4adc1653mr5841672f8f.39.1758870786194; 
 Fri, 26 Sep 2025 00:13:06 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-212.pools.arcor-ip.net.
 [47.64.114.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc9248f56sm6026653f8f.61.2025.09.26.00.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 00:13:05 -0700 (PDT)
Message-ID: <dd5e9a1a-a6a3-4cb0-bee4-49e7170ec760@redhat.com>
Date: Fri, 26 Sep 2025 09:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] tests/functional: drop datadrainer class in
 reverse debugging
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <20250926051542.104432-7-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250926051542.104432-7-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _GFvwZu9ntMfqhRd2VDIAjZI9V5BTqtpGA722rTwWoc_1758870787
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/09/2025 07.15, Gustavo Romero wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The reverse debugging test uses the avocado datadrainer class to
> create a background thread that reads from the console socket and
> dumps it via python logger.
> 
> Most tests log console output as a side effect of doing calls
> to match strings, but this test never tries to match anything.
> 
> This isn't critical, so just drop the functionality.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>


