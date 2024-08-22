Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp661437njb;
        Thu, 22 Aug 2024 07:38:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwX3xj3A1fCfp5HoIAOImtH/tjtyhmOY2ZGoE47vEexEur/3QKCmJe2nxWEZ2jrS0frIVKDzqTpDYjpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF9NTYsO1eIhGLEp9rfwYriseZhEPLo62wCLtw8Vb+8DIU46h+6guUeP7l20qFIawyic6Zi
X-Received: by 2002:a05:622a:5a18:b0:453:74a6:75af with SMTP id d75a77b69052e-454ff39560amr33550651cf.0.1724337491858;
        Thu, 22 Aug 2024 07:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724337491; cv=none;
        d=google.com; s=arc-20160816;
        b=IIicFNFN9JYm9IKwpBTRkiHPQ0dTKk18rJ8rDxycUqkFwi0y0BGBDPx9lwJo7lafTx
         gfg12zTVXnnKTp4AGdwmGmlCAh+JUrHgFItbacfsPBvv17/yv1dsVn3HZKVdmdj8gXxs
         nvexfmciVatGUu+ExMhV8jEuq25MiMiTwtY71YxXjoFeuW9LfGP6PshW3Y1k9o99miX1
         dIBqicEtPXGQo7sDqIvP/b3nORsfJQPk59yhZUphlGi4MugTUA+Hpowxk6IrhmxQLJJi
         gJz69ZO31yzLkqjICpQ6AaxpilSqKATwes3mboN9iqdkrxS+/4eLTotdDcW7d5db+DgE
         R6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=XSlDeM3wdWRm0OvxdNj17wAdLmgqgdsYUPIG7/Ic1BE=;
        fh=1GVOt5T0tntrRJC8v30t/pSsvSccutc2Lkq8x8sq28g=;
        b=PmReAAK1JE0rLIxJw246rdpekJBDXzzXX07eYQBhkWRqg7fmKmGtlrBGTAa4TRUREJ
         1kZA0POTXC62r+nPmlA1uPNNp7Fsbo/aXPfJxuQjunm801vSB+idXHWS3KFDOFlT25We
         SpkAKugTlYT4FyZkhLA6wjaJzVrbY1EVX+LIMOWBv+/hIeKywMW8g51JyaOQnoqKsy8k
         f8+CBVFMBr7BJOHftxUebF3S3VQLw28zeCdLUdrQhiRY/NkMWm94lLpoP3vWF5MCkH65
         cFnZ09W0K0f54hsstOw6RL4yOePRxSzIabLhvp923w8qYVhIiV1zjzLk9gVE6iLNgvO9
         bmIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f5JALrbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe0d2ce1si17910441cf.98.2024.08.22.07.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 07:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f5JALrbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sh8x0-00070J-4l; Thu, 22 Aug 2024 10:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sh8wy-0006sm-BZ
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 10:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sh8ww-0000SS-Ta
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 10:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724337486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XSlDeM3wdWRm0OvxdNj17wAdLmgqgdsYUPIG7/Ic1BE=;
 b=f5JALrbP0InMRqF82Jrs//YIu3LniALEN0gVK40Hu+1GhmRt5yVDnCR61ZAwmPT+p4u0+T
 3ltOik+i6EygFvIjbPEWYjG5dS04X4un3deMF/3qOSvU8vjG5d17iKD2/dbYoEa3FIm5JM
 7iXeaEaS0N2HYSFwWQ/pabvIWhRrUxo=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-7EJqi-NjMBqrBYMt_BSUqQ-1; Thu, 22 Aug 2024 10:38:02 -0400
X-MC-Unique: 7EJqi-NjMBqrBYMt_BSUqQ-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-2700946649eso1114198fac.0
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 07:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724337481; x=1724942281;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSlDeM3wdWRm0OvxdNj17wAdLmgqgdsYUPIG7/Ic1BE=;
 b=wP3m5O/j52KqmtCYpRRAhpqlROqrQ20RkHPbD5BMbvfZXSbxtju508wAb4UML6gK5T
 KyZD1zdXMUTqfaiWFF3ylxWQ8V+yqzD8KosR9eiQyIa2V6Hhg9BiSv5sowa/erhhEnXg
 HtkNLJQCLroMH/UUsKepu27ShNeS8b3x7B+VkrJmADFLzMg9+jrs512uhnMCsj7XQ12f
 oBL3DevWsu2QmvyN9YaLZNS1waWyQt1x6JgErlZJcNYrb6NgzA9wIxQDO0DmqGAwACHr
 0jWYWq1YDivu9cvwAmmpZsmOpM4Dlg13oUuIEwQGJDTsoEfZBk8z1DCj1F/+aaPyLxhl
 FXVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZRy+0Lu/FDz0SC4imyu8Jlv4wXLxuAVeoSFTT38GM9Bx4g7LTmjeAS88OHExTtM/xDznffg+r9g==@nongnu.org
X-Gm-Message-State: AOJu0YzdsyUhFLM9LkXKr7Va/0F2p3dsD2xACM7C8+b7vJCLb8uOmHB4
 OQZSawVeOnAxPOEwvbNAnEETlRXtQoaNV0THwdzzBs+zSnKu4KwRMEPq0BKQc6UbS7j7RqiDyRh
 saWZNs7u0tfrjF5+0GRH4uOIpcnr/alwcXt1v5TqS4m5C0yp5vQ==
X-Received: by 2002:a05:6871:51c3:b0:261:446:c405 with SMTP id
 586e51a60fabf-273cfbcba05mr2243291fac.4.1724337481531; 
 Thu, 22 Aug 2024 07:38:01 -0700 (PDT)
X-Received: by 2002:a05:6871:51c3:b0:261:446:c405 with SMTP id
 586e51a60fabf-273cfbcba05mr2243262fac.4.1724337481189; 
 Thu, 22 Aug 2024 07:38:01 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-177-41.web.vodafone.de.
 [109.43.177.41]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f3bb38csm74770785a.76.2024.08.22.07.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 07:38:00 -0700 (PDT)
Message-ID: <33638ae6-9e3e-4ad4-85ff-abf448d50d22@redhat.com>
Date: Thu, 22 Aug 2024 16:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional: Convert Aarch64 SBSA-Ref avocado
 tests
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240822114146.86838-1-philmd@linaro.org>
 <d8c744cf-0da1-42fc-92cc-f8bec8ca00e1@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <d8c744cf-0da1-42fc-92cc-f8bec8ca00e1@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: SpngWuUOhqrA

On 22/08/2024 16.06, Marcin Juszkiewicz wrote:
> On 22.08.2024 13:41, Philippe Mathieu-Daudé wrote:
>>   # Timeouts for individual tests that can be slow e.g. with debugging 
>> enabled
>>   test_timeouts = {
>> +  'aarch64_sbsaref' : 180,
> 
> What kind of machine is able to run those tests in 180s? I bumped them to 
> 2400s and got timeout (Macbook with M1 Pro).
> 
> "make check-avocado" (with some AVOCADO_* vars to limit list of tests) shown 
> me which test is run and pass/fail for each.
> 
> "make check-functional-aarch64 V=1" shows me "1/4 
> qemu:func-thorough+func-aarch64-thorough+thorough / 
> func-aarch64-aarch64_sbsaref" and timeouts without information which tests 
> pass, which fail.

Try running "make check-functional V=1" ... it should show you the 
individual subtests, so you hopefully can conclude from the tests that 
succeeded to the one that was hanging.

  Thomas

