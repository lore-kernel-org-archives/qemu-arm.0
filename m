Received: by 2002:a17:906:18aa:b0:a6f:6ed6:9beb with SMTP id c10csp723077ejf;
        Sat, 15 Jun 2024 14:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXSD2SZRHrnlwpAa0YdC5Ti5vrPHMTzGIaOF/lYieRGQNSjqZ5n91URL0XHOk2XKoWZCiIB11WMtqpVThstTDqy9/+iLMq
X-Google-Smtp-Source: AGHT+IGpjlT6VZh9pU2WinyfagmtxjdRhqHN5Jb69YXd3p6pCUpy4YeTCcEMjxSfVSRoctMKosdE
X-Received: by 2002:a05:620a:24d5:b0:795:38ef:6355 with SMTP id af79cd13be357-798d26b5204mr654601685a.72.1718488633808;
        Sat, 15 Jun 2024 14:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718488633; cv=none;
        d=google.com; s=arc-20160816;
        b=P4G/dyMabtOQw1n5wCCJOVr4ejddXN8nhu9WTvb5dgRm27tRVWQrap0/vXnCsx0mlR
         NNKQVSzQi0dPRz+giW9l09kR1eAbMomDuD7eeViI5DE9PhFmilNE6nisEeP6qrBIg2x8
         UCzxBnsELvI3L+sGPUOQovOkDINbamUssdh7wJizsagEYETDP9sJi/WHZlSJ6xvmYYa2
         JHFvcFenlHBghOUnmbZtRDJy9Z7Oro4ew96JTw8dE4WydSZlcKuCf2QiHtY7fbGqUI3h
         kbppjBLnI7R6xmNSQgi8VQhBRFUvlThbuKlY+j2LVzyvWjw+n2QNAwPogsjzNB3mtHdV
         90zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=WcHHdiCOQSbFEbxWGmHVP+vhV5TFNN33TglrL5+1rf8=;
        fh=l5GEQXt/ConhNtOrYaVeK6qZWmXRWXLNClSZDQ2HNSU=;
        b=DtEbl+jqJ4ipoYhETVtAJnpG2sqQnhidKIydxKlAxu2tOEk5UrCJclH2AgZ/oOkMrw
         7epOMEos6zzknHbPqAn8y0CBOAdg1B7dppqh9QxB8asG4DD9w2JMhuVLajdf3saKZJJe
         rxkTBTBmTp9UHXIUrSVDF/dCeuMmJcv6lxNx/Gij1P7Yp4DMNPCEpDgrignf8sXBfVzE
         +herjI60ZGmO6ZN/2sUXnowwsfzT2OF8wVPo5tKwOkOw55bJCdXq+fdWLY8+6wSHATiH
         66MTH9qaGTX+NbMyQ/fBjhxOs5Frv9AWGgrxAhPdlBEWME9q+yicVM93K3vL7gY8SZqi
         1BEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MTU0kubE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ac087debsi652313585a.724.2024.06.15.14.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2024 14:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MTU0kubE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sIbOD-0001mg-Nf; Sat, 15 Jun 2024 17:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sIbOC-0001kR-FI
 for qemu-arm@nongnu.org; Sat, 15 Jun 2024 17:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sIbO9-0004oD-1w
 for qemu-arm@nongnu.org; Sat, 15 Jun 2024 17:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718488600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcHHdiCOQSbFEbxWGmHVP+vhV5TFNN33TglrL5+1rf8=;
 b=MTU0kubEBZAm817DbjFKlQmn5P0D+tLisIoPvZUK4QJdddwMqZvA/Vf5aGnhSh5qAWBYb6
 5i4kOkZgSddkhh8Fouj8Gn9i8OQxqRRhKFZaNMcdg9haYylgLnjmzJcZgRu1CBLTgZGHIu
 2+C9/ick8daTFRQEjXrK3gSPvDsrACI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-Q7Q7QyZhMCe8ESS652uBlw-1; Sat, 15 Jun 2024 17:56:38 -0400
X-MC-Unique: Q7Q7QyZhMCe8ESS652uBlw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-422322e4abaso16997435e9.1
 for <qemu-arm@nongnu.org>; Sat, 15 Jun 2024 14:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718488597; x=1719093397;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WcHHdiCOQSbFEbxWGmHVP+vhV5TFNN33TglrL5+1rf8=;
 b=BzFNDRIAiXU3Ukcx+Z89iRAFzpzzB6NZPvmS2UZOCXQTfs43exuTsFPa5kViNIwYRN
 957cCQhCuhkMkiC/gd4MoJikgfO74BS+RQK68LI6bsEl1YBuH9ogQab24O+5t7zWYjOV
 mA8OwScL9gsiy634TVhtm0s8l5VmydmQ/elZs0PlcNTiGqHZwL5W66vFvwxKbYpo65jD
 M70agPmQ9GBAMvPsZ6SsA0C65zzAO6VaFdyuz+NBzEDBFiSBC7c8TJR94giSmrtqXw14
 pqjTVgC+QN8aybyf6LcUaX6+9GkGqdO/sV4Tj7wqUdTTJd9nJjS44yE/312Tm7i/4Ani
 tlpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6PyZJnYJn9NY0VyvP5vxCWmLS1TwomJBGilaL+kKW0Je/SO8dUp07E45QH72htTrudBJPr5EHH7qY9YeNe5ZPY+ys
X-Gm-Message-State: AOJu0YzTdKChwyQUjPlejphhVVS+fIQtg7Ytw87PGsUdymUhWqqSp+jo
 jIAMgdSlnhEt7KfJZmjK3kmNucknJMQTmBKPQDNG4F6aeRzCTR0kqoTU62GxYwKH5ev6d5IB8ip
 joOZOac2idSP78/k/ucxP5r62qWTjzUjBv9kMNw2NJ8YcqOwj2w==
X-Received: by 2002:a05:600c:3512:b0:422:fdb:efb3 with SMTP id
 5b1f17b1804b1-422b6fc46e1mr79017035e9.12.1718488597484; 
 Sat, 15 Jun 2024 14:56:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3512:b0:422:fdb:efb3 with SMTP id
 5b1f17b1804b1-422b6fc46e1mr79016965e9.12.1718488597103; 
 Sat, 15 Jun 2024 14:56:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:9000:9100:a34f:49ce:8596:8d47?
 ([2a01:cb19:9000:9100:a34f:49ce:8596:8d47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320c70sm110419585e9.30.2024.06.15.14.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jun 2024 14:56:36 -0700 (PDT)
Message-ID: <ad8f7b8e-ad7a-439b-bc4e-6b226cb6af8a@redhat.com>
Date: Sat, 15 Jun 2024 23:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/19] aspeed queue
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240614072620.1262053-1-clg@redhat.com>
 <828dc03b-1e7e-40f6-80fd-0f5d56f362bd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <828dc03b-1e7e-40f6-80fd-0f5d56f362bd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: WyWZP081DSY3

On 6/15/24 6:14 PM, Richard Henderson wrote:
> On 6/14/24 00:26, Cédric Le Goater wrote:
>> The following changes since commit 046a64b9801343e2e89eef10c7a48eec8d8c0d4f:
>>
>>    Merge tag 'pull-request-2024-06-12' of https://gitlab.com/thuth/qemu into staging (2024-06-13 07:51:58 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/legoater/qemu/ tags/pull-aspeed-20240614
>>
>> for you to fetch changes up to d9f6311f5393da897e73be8a29c261125d0c1ac2:
>>
>>    MAINTAINERS: Add reviewers for ASPEED BMCs (2024-06-14 07:36:09 +0200)
>>
>> ----------------------------------------------------------------
>> aspeed queue:
>>
>> * Add AST2700 support
> 
> Fails freebsd testing:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/7106081732
> 
> I'm not sure off hand why this wouldn't also fail on Linux...

Yep. It should have :

@@ -332,6 +332,7 @@ static const TypeInfo aspeed_intc_info =
      .instance_init = aspeed_intc_instance_init,
      .instance_size = sizeof(AspeedINTCState),
      .class_init = aspeed_intc_class_init,
+    .class_size    = sizeof(AspeedINTCClass),
      .abstract = true,
  };


I will resend a v2 next week.

C.

