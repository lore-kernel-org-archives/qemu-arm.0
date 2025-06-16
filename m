Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2013746njc;
        Mon, 16 Jun 2025 10:30:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrRXyD8c/fEw1XpGMIqIZZQ8AodjzS+NF0ivEmCza4+cyp41gcpgP/e86rsewSJmNpOffnaPZLnH5Ylg==@linaro.org
X-Google-Smtp-Source: AGHT+IFui/PlWRAqL33zR+CjSg//sst4goJOVP8q0fMmVgP16Kq+B5zGQozRRUuqeYOSGI/8BcTE
X-Received: by 2002:ac8:7d55:0:b0:4a4:41a1:b944 with SMTP id d75a77b69052e-4a73c51f7b3mr167185421cf.1.1750095013878;
        Mon, 16 Jun 2025 10:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750095013; cv=none;
        d=google.com; s=arc-20240605;
        b=jnRCZ4pbt39ooHDFV8mnjfXD5rPFeTTP+DpNaofgsG16g/LUfuTEAL3yQ/LGiIjmPE
         olTh7u3kbiD2k3JBmLAb0Ka1rC9RO5YUFlaagIPGT/n8+0m2mvn7gdoSom3/EvHzl0LQ
         3vsnrF4cl/F3YKWkvUsVPqA9s67ycmW4FPRLkUUkv+Q+60iE9eHzmrK8xlhzWjgm33Y1
         dK3NTolGg4prIYGesAkxSgYmMOYXGq66jq+G7uTuW/OZQPBoxud66GsFaIkRPaTOYoYI
         M1Migy+lKgrM01jwkChIt4loBARs/B7sgvjgGAPolvuDYD+/4y30KdmI5E4TQc2fbm0z
         IhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ihjeWi/0gcPpegSQ04JiCzsJbM1MCOCfpX5SzthJRl4=;
        fh=3AW6bAMqMUhV8jC+xGRMRxTOEzRFuGFdXRRjoKeytY0=;
        b=O95FxU4c/uxJmmHvyFJQgV588UXmtwoEFfB2t1Ws+RaRB9NDWUj370p/LyK+Qif8Nn
         3CEkcKe1LaUbEhbALR//1JdyovaeLaQ4CzKIpwG1LtIu+MaZTRIszNwSCJ+yjdZJToOj
         Ox5KWrQy4j3c/FNqleZd/8WmwORE9DAq0RkDjGnHHDQmZNdO71pRRMTcV9MgQIqKJYXu
         in3yIoGRvHZGhXzFLNIQDXCkZ0M+gVQkwjp4w8oaJOOAyNe1rBRkQaPHI2J87cygto3b
         0A0hKiUrpz6EiweF/4kz+q0ZmqoHLlRqk7D9JxDa0uNJQaoron5mS0WOPwLknk+mKoao
         I5Yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTfqURgp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4c812esi103497981cf.357.2025.06.16.10.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 10:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTfqURgp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRDeW-0007aM-TH; Mon, 16 Jun 2025 13:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uRDeV-0007a6-Ay
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 13:29:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uRDeO-0003NH-6J
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 13:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750094973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihjeWi/0gcPpegSQ04JiCzsJbM1MCOCfpX5SzthJRl4=;
 b=PTfqURgprQ8mZMwRIOK75/fqgoOKx4RD1HmXczK7xdOoOcXTxDqZnkLo1kNP3Vv3BZRNyU
 2GeHtFQ8qulVEKXqNV3qQY6ZDbByy3HRjhdrdj28XnraVllx6/ennTZ4vKtAOJYHxj47HG
 PSmcm4wKNLX2L/sMhJF/LOvVzxz57Z8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-FSs2VEpEOSOl_stz3ZBQ_w-1; Mon, 16 Jun 2025 13:29:32 -0400
X-MC-Unique: FSs2VEpEOSOl_stz3ZBQ_w-1
X-Mimecast-MFC-AGG-ID: FSs2VEpEOSOl_stz3ZBQ_w_1750094971
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a6f64eebecso91853621cf.2
 for <qemu-arm@nongnu.org>; Mon, 16 Jun 2025 10:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750094971; x=1750699771;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ihjeWi/0gcPpegSQ04JiCzsJbM1MCOCfpX5SzthJRl4=;
 b=aJ4Gnkz92gtMB63FkwkDCxV9y9T6URyF7RhDnF3JYunJ189x25FOzecxlZsgJCuiQ4
 HZ/f3B6Rr64pjcPKc0NA4yp9t5vZujnv5z3gZcJUzr2oGmqrAvZfPQvrIyJUlAp8hOfT
 BvHcAbQER+oORPk4cApLwqRR/H9QYzH0w8jmbMTAyvI+0fqlDjc7JvuXZOKzZ4jt88y/
 tn6lnZkEdB7zpocz/jViOPaZlCEpQgMcIITmNNueWyrilq1z5/ZcENNTGI7uj6x2WW57
 KaumIXwJBkEgDQCvtKuJqKGE8g7lEzdb5+JyKQ8g2JQ86gdT6AgpbGJWYrLvVfHEJCRt
 tqRA==
X-Gm-Message-State: AOJu0YwFIooeZGitcMG/JxuOMqv92IKECXwlCAqa9ZnAQwuA7cJ4ubmc
 mMEWoQsZ33HaZzhDZLiURrXF0NzNx2mfEKaUAUNfFPeULIGZKPTaGIERs8Yjf/kyy7/IffR1j52
 6I3xVLaZBRQMbScEXjltEHNTF6sYOAl7EvofPbgVaR4ASPlOVBMFthg==
X-Gm-Gg: ASbGncs2MubwSdr+vZYVYTP7pguETENMwwlyczMjf5VzOLN8fe5a0EGJrDxlwAJ8mEY
 IpyPBPcZbOW5te765ceJAepMpKiR6AJvrhUxQl+miaveydSlQQK3B9in1SBjPvJepPm2V7ET20a
 Z8aeTF1WVLLJPFWCbhlQJDke/Eu/4JuJYHDP7/bRgec5CZTgh7Equn0WUntN6/mwUxJR+FXZAu7
 io8uRAtydfqrD9OEwXC+bBD7IMkzH4Ac8kss+pnV0agpXz0PtbA4ehhkL3gFtk13l86OjuxmYNw
 /usMwI9qf8HKpsQ8ASqZmUY=
X-Received: by 2002:ac8:5acb:0:b0:4a6:f518:6b19 with SMTP id
 d75a77b69052e-4a73c5faebemr158210171cf.28.1750094971344; 
 Mon, 16 Jun 2025 10:29:31 -0700 (PDT)
X-Received: by 2002:ac8:5acb:0:b0:4a6:f518:6b19 with SMTP id
 d75a77b69052e-4a73c5faebemr158209631cf.28.1750094970803; 
 Mon, 16 Jun 2025 10:29:30 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a72a3103a5sm51516451cf.30.2025.06.16.10.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 10:29:30 -0700 (PDT)
Message-ID: <bee0abcd-2cf5-4640-a3a5-92955bac6976@redhat.com>
Date: Mon, 16 Jun 2025 13:28:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] qemu-options.hx: Document the arm-smmuv3 device
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, linuxarm@huawei.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 berrange@redhat.com, imammedo@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, zhangfei.gao@linaro.org
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-8-shameerali.kolothum.thodi@huawei.com>
 <20250616121245.00005b4b@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250616121245.00005b4b@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: swztsmajWQZ5F8_PP57hwKTTjK_PY8i941FxilvNPt0_1750094971
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: zxzGn2j9Xhl3



On 6/16/25 7:12 AM, Jonathan Cameron wrote:
> On Fri, 13 Jun 2025 15:44:49 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> 
>> Now that arm,virt can have user-creatable smmuv3 devices, document it.
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>>   qemu-options.hx | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 7eb8e02b4b..3edbde45bb 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1226,6 +1226,12 @@ SRST
>>       ``aw-bits=val`` (val between 32 and 64, default depends on machine)
>>           This decides the address width of the IOVA address space.
>>   
>> +``-device arm-smmuv3,primary-bus=id``
>> +    This is only supported by ``-machine virt`` (ARM).
>> +
>> +    ``primary-bus=id``
>> +        The PCIe Root Complex to be associated with.
> 
> Hmm.  Root complex or host bridge?
> I think an RC is allowed to have multiple heirarchy and hence multiple
> host bridges. Figure 1.2 in the PCI spec. So my gut feeling is this
> should be host bridge.
> 
+1.
the key word-hint: 'complex' -- a RP (a Root *Port*) can only host a single PCI(e) (sub-)tree,
but a RC can have multiple PCI domains, not to mention a bunch of platform-level,
acpi-defined PCI(e) devices.


> 
>> +
>>   ERST
>>   
>>   DEF("name", HAS_ARG, QEMU_OPTION_name,
> 

